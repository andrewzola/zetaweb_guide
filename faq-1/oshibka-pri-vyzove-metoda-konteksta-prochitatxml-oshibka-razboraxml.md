---
description: 2.4.4.40
---

# Ошибка при вызове метода контекста \(ПрочитатьXML\): Ошибка разбораXML

## Ошибка при вызове метода контекста \(ПрочитатьXML\): Ошибка разбораXML

Если при обмене возникает ошибка такого вида \(чаще всего это случается со статистикой запросов по артикулам\), то нужно сделать выполнить обмен с дополнительным экранированием служебных символов XML.

Настройка доступна в справочнике "Настройки обмена" - "Служебные параметры" - "Удалять некорректные символы". Эту настройку нужно включить, если при обмене не удается прочитать файл обмена и выключить после того, как обмен пройдет без ошибок \(включенная настройка замедляет чтение файлов обмена\).

![](../.gitbook/assets/image%20%28247%29.png)

{% hint style="info" %}
Самым правильным будет остановить регламентное задание текущего обмена, включить флаг "Удалять некорректные символы" и через контекстное меню сделать полный обмен проблемной таблицей \(в 99% случаев это таблица "Статистика поиска по строке"
{% endhint %}

