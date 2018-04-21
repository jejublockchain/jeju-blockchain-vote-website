# README

제주블록체인투표 홈페이지 프로젝트 입니다.
이 프로젝트는 아래의 기술들을 사용하고 있습니다.
* Rails 5.1.4
* MySQL
* yarn

처음 프로젝트 개발환경을 구성하기 위해서는 다음의 절차를 진행하시면 됩니다.

1. $ git clone https://github.com/beomjae/jeju-blockchain-vote-website.git
1. $ cd jeju-blockchain-vote-website
1. $ bundle install
1. install yarn
	* ubuntu
		* $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
		* $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
		* $ sudo apt-get update && sudo apt-get install yarn
1. run yarn
	* $ yarn
1. 데이터베이스 파일과 시크릿파일 생성
	*  $ cp config/database.yml.example config/database.yml
	*  $ cp config/secrets.yml.example config/secrets.yml
	*  $ cp config/application.yml.example config/application.yml
1. 데이터베이스파일(config/database.yml)을 내 개발환경에 맞게 수정한다.
1. 데이터베이스 생성 및 초기화
	* $ rails db:create
	* $ rails db:migrate
	* $ rails db:seed
1. 프로젝트 실행
	* $ rails server -b 0.0.0.0
  

