- flutter_code4func_09_bloc_pattern --> Chia nhỏ quy trình để dễ quản lý ( Ví dụ MVC, MVP, MVVM )
	+ Xử lý logic riêng
	+ Xử lý UI riêng
	+ Xử lý data riêng
	
	+ Bloc : quản lý phần State() của Widget 
	+ Bloc : dùng cơ chế Stream , khi truyền dữ liệu qua lại thì nó sẽ tự động Handle State() và render data để update UI...

	+ lib/src/blocs : chuyên xử lý logic ( ví dụ if,else...)
	+ lib/src/repository : truyền tải api
	+ lib/src/resources : nơi bỏ các UI ( Xử lý UI )
![image](https://github.com/user-attachments/assets/683ecb76-75b1-488c-90f7-ded418365367)
