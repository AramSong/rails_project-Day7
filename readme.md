## Day 7

* 브라우저는 어떻게 동작하는가?

```
-브라우저의 주요 기능은 사용자가 선택한 자원을 서버에 요청하고 브라우저에 표시하는 것. 자원은 보통 HTML문서지만 다른 형태일 수 있다. 자원의 주소는 URI(Uniform Resource Identifier)에 의해 정해진다.브라우저는 HTML과 CSS명세에 따라 HTML파일을 해석해서 표시하는데 이 명세는 웹 표준화 기구인 W3C(World Wide Web Consortium)에서 정한다. 
<요소>
# UI : 주소창, 즐겨찾기버튼, 크롬익스텐션 등등 UI적 요소들
# 렌더링 엔진 : HTML과 CSS를 파싱하고 화면에 파싱된 컨텐츠를 표현해주는 역할
# 브라우저 엔진 : 렌더링엔진에 작업을 다룸.
# 네트워킹 : HTTP Request 같은 네트워크 호출을 다룹니다.
# 자바스크립트 해석기 : 자바스크립트 코드를 파싱하고 실행하는 역할
# 데이터 스토리지 : 쿠키같은 로컬영역에 데이터를 저장시킬 공간(크롬은 RDB sqlite, HTML5표준 IndexedDB를 사용)
```

- 웹엔진 : 웹서버에 저장된 HTML문서를 다운받아 윈도우 영역에 표시해주는 역할
  불러오기->파싱(DOM Tree생성)->자바스크립트 실행->레이아웃 작업->CSS 처리->페이지에 그리기.

1. 불러오기 : 로더(Loader)가 Http나 파일읽기 등으로 전달받은 리소스 스트림을 읽는 과정. 읽으면서 이미 읽은 데이터인지 파일은 다운받을지 말지를 결정.

2. 파싱 : 웹 엔진은 HTML/XML 파서를 가지고 있다. 이때 DOM Tree가 만들어진다.

3. 렌더링 트리: DOM Tree는 내용을 저장하는 트리이고 화면을 그리기위해 별도의 트리가 만들어지는데 그것이 렌더링 트리. 

   Display: None와 head title body 태그등 화면에 표시될 필요가 없는 태그들을 렌더링 트리에 추가되지 않는다.

4. CSS 결정:  CSS는 셀렉터에 따라서 적용되는 태그가 다르기때문에 모든 CSS스타일을 분석하여 태그에 스타일 규칙이 적용되는지 결정한다.

5. 레이아웃: 렌더링 트리가 생성될 때 랜더 객체는 위치나 크기를 가지고 있지 않다. 객체들에게 위치와 크기를 정해주는 과정을 레이아웃.

6. 그리기 : 렌더링 트리를 탐색하면서 특정 메모리 공간에 RGB값을 채우는 과정.

* 랜더링 엔진 : 브라우저별 렌더링 엔진의 종류가 다르다.

  * IE : Trident
  * 크롬: Webkit
  * 파이어폭스 : Gecko
  * 사파리: Webkit
  * 오페라 : Presto

  HTML문서를 파싱(DOM Tree생성)-> HTML의 스타일 정보들은 별도의 렌더트리로 구성-> 렌더트리의 레이아웃 과정 수행-> 트리를 순회하며 노드들을 화면에 표시

### method chaining

* method chaining

```ruby
ran = ( 1.. 45)

arr = ran.to_a

num = arr.sample(6)

res = num.sort
```

=>(1..45).to_a.sample(6).sort

* post = Post.new(컬럼명 : 입력할 내용, 컬럼명 : 입력할 내용 ..

```ruby
	post.title = params[:title]
    post.contents = params[:contents]
    post.user_id = current_user.id
```

=> post = Post.new(title: params[:title],contents: params[:contents],user_id: current_user.id)

* 원래있던 내용물을 바로 update시킴

```ruby
	@post.title = params[:title]
    @post.contents = params[:contents]
    @post.save
```

=>@post.update(title: params[:title],contents: params[:contents],user_id: current_user.id)

### 파라미터를 해쉬값으로

* post_params : 해쉬형태로 값을 반환한다

```ruby
 def post_params
    {title: params[:title],contents: params[:contents],user_id: current_user.id}
 end
 => @post.update(post_params)
 => post = Post.new(post_params)
```

=>ruby에서 리턴된 결과값은 마지막에 계산된 결과값이 반환된다.

### 렌더링을 이용하여 view파일을 파편화

* 레이아웃과 랜더링(Action Controller 와 Action View) => 컨트롤러에서 뷰로 결과를 넘기는 방법
  - 컨트롤러 : 요청을 다루는 프로세스 전반 처리
  - 모델 : 무거운 처리. 
  - 뷰 : 모델에서의 처리가 끝나고 , 컨트롤러가 처리결과를 뷰에게 넘긴다. 뷰는 사용자에게 결과를 표시.



 Rendered board/_ranking.html.erb (0.4ms)
  Rendered board/_article.html.erb (0.4ms)



* `user/sing_in.html.erb`

```html
<%= render '/board/ad' %>
```

=>보통 `shared`폴더에 공유되는 파일들을 저장해놓고 불러서 쓴다.

* 렌더를 사용하는 이유 : 코드반복 최소화, 유지/보수시 편리하게 파편화 

```html
<%= render '/shared/ranking', 분해된 파일에서 사용하고자 하는 변수명: 실제 변수명%>
```

* rss
* seo

### scaffold

```
rails g scaffold g scaffold theme title:string contents:text
```

### 간단과제

```
$ rails _5.0.6_ new crud_test
```

* scaffold명령어를 사용하지 않고 crud코드 완성하기

* 모델: 단수, 컨트롤러는 : 복수 . 아무거나 원하는데로. but 일치시키기

  