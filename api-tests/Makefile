signup_data =	\
	first=utsav \
	last=chatterjee \
	email=utsgod@gmail.com \
	phone=8978675645 \
	dob=1978-12-22	\
	password=abc


login_data =	\
	email=utsgod@gmail.com	\
	password=abc

signup_test :
	http -v POST http://localhost:3000/signup $(signup_data)

login_test :
	http -v POST http://localhost:3000/login $(login_data)
