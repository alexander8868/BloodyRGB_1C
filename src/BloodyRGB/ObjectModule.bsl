﻿Перем тзОбщееОписаниеТипов экспорт;


&НаКлиенте
Процедура Прочитать(Команда)
	

		ЧтениеXML = Новый ЧтениеXML;     
		ЧтениеXML.ОткрытьФайл("C:\Program Files (x86)\Bloody7\Bloody7\Data\Mouse\English\SLED\Standard8\Wave.ckAnimation");
		ОбъектXDTO = ФабрикаXDTO.ПрочитатьXML(ЧтениеXML);
Структура = ОбъектXDTOВСтруктуру(ОбъектXDTO);

//Для ч = 1 По Число(Структура.FrameCount) Цикл
//	
//    Позиция = Найти(Структура["Frame" + ч].ColorPicture, ",");
//    Пока Позиция > 0 Цикл
//        Подстрока = Лев(Строка, Позиция - 1);
//        Если Не ПустаяСтрока(Подстрока) Тогда
//            Результат.Добавить(Подстрока);
//        КонецЕсли;
//        Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
//        Позиция = Найти(Строка, Разделитель);
//    КонецЦикла;
////Сообщить();	
//КонецЦикла;
КонецПроцедуры


Функция ОбъектXDTOВСтруктуру(ОбъектXDTO, ПараметрыПреобразования = Неопределено) Экспорт

Структура = Новый Структура;
ТипОбъектаXDTO = ОбъектXDTO.Тип();

Для Каждого Свойство Из ОбъектXDTO.Свойства() Цикл

ИмяСвойства = Свойство.Имя;
ЗначениеСвойства = ОбъектXDTO[ИмяСвойства];

Если ТипЗнч(ЗначениеСвойства) = Тип("ОбъектXDTO") Тогда

Структура.Вставить(ИмяСвойства, ОбъектXDTOВСтруктуру(ЗначениеСвойства, ПараметрыПреобразования));

ИначеЕсли ТипЗнч(ЗначениеСвойства) = Тип("СписокXDTO") Тогда

Структура.Вставить(ИмяСвойства, Новый Массив);
Для Индекс = 0 По ЗначениеСвойства.Количество() - 1 Цикл

//ЭлементСписка = ЗначениеСвойства.Получить(Индекс);
//Если ТипЗнч(ЭлементСписка) = Тип("ОбъектXDTO") Тогда
//Структура[ИмяСвойства].Добавить(ОбъектXDTOВСтруктуру(ЭлементСписка, ПараметрыПреобразования));
//Иначе
//Структура[ИмяСвойства].Добавить(ЭлементСписка);
//КонецЕсли;

КонецЦикла;

Иначе

Структура.Вставить(ИмяСвойства, ЗначениеСвойства);

Если ПараметрыПреобразования <> Неопределено
И ПараметрыПреобразования.НайтиИдентификаторы
И Свойство.Тип = ПараметрыПреобразования.ТипUUID Тогда

РезультатПоиска = ПараметрыПреобразования.ТипыИдентификаторов[ТипОбъектаXDTO];
Если РезультатПоиска <> Неопределено
И РезультатПоиска.ИмяПоля = ИмяСвойства Тогда
ПараметрыПреобразования.Идентификаторы[РезультатПоиска.ИмяТаблицы].Вставить(ЗначениеСвойства, РезультатПоиска.ПустоеЗначение);
КонецЕсли;

КонецЕсли;

КонецЕсли;

КонецЦикла;

Возврат Структура;

КонецФункции


//222

&НаКлиенте
Процедура КнопкаЗаписатьНажатие(Элемент)
	//222
	КоличествоКадров = 32;
	МассивПорядокВключенияСветодиодов = Новый Массив;
	МассивПорядокВключенияСветодиодов.Добавить(0);
	МассивПорядокВключенияСветодиодов.Добавить(2);
	МассивПорядокВключенияСветодиодов.Добавить(4);
	МассивПорядокВключенияСветодиодов.Добавить(7);
	МассивПорядокВключенияСветодиодов.Добавить(6);
	МассивПорядокВключенияСветодиодов.Добавить(5);
	МассивПорядокВключенияСветодиодов.Добавить(3);
	МассивПорядокВключенияСветодиодов.Добавить(1);
	
		Градиент = ПолучитьГрадиент(Новый Цвет(0,255,196), Новый Цвет(236,255,0), КоличествоКадров/2);

	ЗаписьXML = Новый ЗаписьXML;
	ЗаписьXML.ОткрытьФайл("C:\Program Files (x86)\Bloody7\Bloody7\Data\Mouse\English\SLED\Standard8\Wave.ckAnimation");
	ЗаписьXML.ЗаписатьОбъявлениеXML();
	ЗаписьXML.ЗаписатьНачалоЭлемента("Root");
		ЗаписьXML.ЗаписатьНачалоЭлемента("Description");
		ЗаписьXML.ЗаписатьТекст("Made by Yakushev");
		ЗаписьXML.ЗаписатьКонецЭлемента();
		ЗаписьXML.ЗаписатьНачалоЭлемента("Time");
		ЗаписьXML.ЗаписатьТекст("0");
		ЗаписьXML.ЗаписатьКонецЭлемента();
		ЗаписьXML.ЗаписатьНачалоЭлемента("FrameCount");
		ЗаписьXML.ЗаписатьТекст(Строка(Градиент.Количество()));
		ЗаписьXML.ЗаписатьКонецЭлемента();

		Для я = 0 По Градиент.Количество() - 1 цикл
			ЗаписьXML.ЗаписатьНачалоЭлемента("Frame" + (я + 1));
			ЗаписьXML.ЗаписатьНачалоЭлемента("ColorPicture" );
			ТекстСтроки = "";
			
			Для НомерСветодиода = 0 по МассивПорядокВключенияСветодиодов.ВГраница() Цикл
				
 				ТекстСтроки = ТекстСтроки + Градиент[(((Градиент.Количество() - 1) - я) + МассивПорядокВключенияСветодиодов.Найти(НомерСветодиода))%Градиент.Количество()] + ?(МассивПорядокВключенияСветодиодов.ВГраница() = НомерСветодиода,"",",");
			КонецЦикла;
			ЗаписьXML.ЗаписатьТекст(ТекстСтроки);
			ЗаписьXML.ЗаписатьКонецЭлемента();
			ЗаписьXML.ЗаписатьНачалоЭлемента("DisplayTime" );
			ЗаписьXML.ЗаписатьТекст("0.05");
			ЗаписьXML.ЗаписатьКонецЭлемента();
			ЗаписьXML.ЗаписатьКонецЭлемента();
			
		КонецЦикла; 
	ЗаписьXML.ЗаписатьКонецЭлемента();
	ЗаписьXML.Закрыть();
КонецПроцедуры

&НаКлиенте
Функция ПолучитьГрадиент(НачальныйЦвет, КонечныйЦвет, КоличествоГрадаций)
	
	МассивЦветов = Новый Массив;
	МассивЦветов.Добавить(RGB_HEX(НачальныйЦвет.Красный, НачальныйЦвет.Зеленый, НачальныйЦвет.Синий));
	
	Если КоличествоГрадаций >= 2 И НачальныйЦвет.Вид = ВидЦвета.Абсолютный И КонечныйЦвет.Вид = ВидЦвета.Абсолютный Тогда
		ШагКрасного = (КонечныйЦвет.Красный - НачальныйЦвет.Красный) / КоличествоГрадаций;
		ШагЗеленого = (КонечныйЦвет.Зеленый - НачальныйЦвет.Зеленый) / КоличествоГрадаций;
		ШагСинего = (КонечныйЦвет.Синий - НачальныйЦвет.Синий) / КоличествоГрадаций;
		
		ТекКрасный = НачальныйЦвет.Красный;
		ТекЗеленый = НачальныйЦвет.Зеленый;
		ТекСиний = НачальныйЦвет.Синий;
		
		Для Сч = 2 По КоличествоГрадаций Цикл
			ТекКрасный = ТекКрасный + ШагКрасного;
			ТекЗеленый = ТекЗеленый + ШагЗеленого;
			ТекСиний = ТекСиний + ШагСинего;
			
			МассивЦветов.Добавить(RGB_HEX(Окр(ТекКрасный,0), Окр(ТекЗеленый,0), Окр(ТекСиний,0)));
		КонецЦикла;
		
		МассивЦветов[МассивЦветов.ВГраница()] = RGB_HEX(КонечныйЦвет.Красный, КонечныйЦвет.Зеленый, КонечныйЦвет.Синий);
		
		Возврат МассивЦветов;
		
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
КонецФункции
&НаКлиенте
Функция RGB_HEX(Знач Blue, Знач Green, Знач Red)
	
	Возврат Сред(DecToAny(ПобитовоеИли(ПобитовоеИли(ПобитовоеИли(Blue, ПобитовыйСдвигВлево(Green, 8)), ПобитовыйСдвигВлево(Red, 16)), ПобитовыйСдвигВлево(1, 24)), 16), 2);
	
КонецФункции
Функция DecToAny(Знач тЗначение, тОснование)
	
	тРезультат = "";
	
	Пока тЗначение > 0 Цикл
		тРезультат = Сред("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", тЗначение%тОснование + 1, 1) + тРезультат;
		тЗначение = Цел(тЗначение/тОснование) ;
	КонецЦикла;
	
	Возврат тРезультат;
	
КонецФункции