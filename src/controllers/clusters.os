#Использовать irac

Функция Index() Экспорт
	Идентификатор = ЗначенияМаршрута["agent"];
	Если Идентификатор = Неопределено Тогда
		Возврат Перенаправление("/agents/index");
	КонецЕсли;

	ТЗ      = ЦентральныеСерверы.ПолучитьСписок();
	Элемент = ТЗ.Найти(Идентификатор, "Идентификатор");
	Если Элемент = Неопределено Тогда
		Возврат КодСостояния(404);
	КонецЕсли;

	Попытка
		Администрирование = Новый АдминистрированиеКластера(
			Элемент.СетевоеИмя,
			Элемент.Порт,
			"8.3"
		);

		Кластеры = Администрирование.Кластеры();
		МодельПредставления = Новый Структура;
		МодельПредставления.Вставить("Агент", Элемент);
		МодельПредставления.Вставить("Кластеры", Кластеры.Список());
		Возврат Представление(МодельПредставления);
	Исключение
		Возврат Представление("rasError", ИнформацияОбОшибке().ПодробноеОписаниеОшибки());
	КонецПопытки
КонецФункции