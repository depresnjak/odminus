﻿#Использовать "model"

Процедура ПриНачалеРаботыСистемы()
	
	ИспользоватьСтатическиеФайлы();
	ИспользоватьМаршруты("ОпределениеМаршрутов");

КонецПроцедуры

Процедура ОпределениеМаршрутов(КоллекцияМаршрутов)
	КоллекцияМаршрутов.Добавить("ПоАгенту","{controller}/on-{agent}/{action=Index}/{id?}");
	КоллекцияМаршрутов.Добавить("Основной","{controller=agents}/{action=Index}/{id?}");
КонецПроцедуры