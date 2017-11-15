#lang web-server/insta

(struct post (title body))

(define BLOG (list (post "test_title" "test_body")
                   (post "second post" "second post body")))

(define (start request)
  (render-blog-page BLOG request))

; 我曹, 我居然看不懂什么意思! 脑子不好用了
(define (render-blog-page a-blog request)
  (response/xexpr
   `(html (head (title "My Blog"))
          (body (h1 "My Blog")
                ,(render-posts a-blog)))))

; render-post: post -> xexpr
(define (render-post a-post)
  `(div ((class "post"))
        ,(post-title a-post)
        (p ,(post-body a-post))))


; render-posts: blog-> xexpr
(define (render-posts a-blog)
  `(div ((class "posts"))
        ,@(map render-post a-blog)))
