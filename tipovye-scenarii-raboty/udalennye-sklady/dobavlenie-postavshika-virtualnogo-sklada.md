# Добавление поставщика виртуального склада

##  Добавление поставщика виртуального склада

### Добавляем поставщика

Добавляем поставщика в основной конфигурации \(в справочник контрагентов\).

![](../../.gitbook/assets/image%20%28518%29.png)

### Настраиваем логистику по поставщику

Для минимальной работоспособности добавляем поставщика в список поставщиков \(Zeta Web - Сроки доставки - Настройка сроков доставки - закладка "Возможность доставки от поставщиков"\)

![](../../.gitbook/assets/image%20%28324%29.png)

и у поставщика устанавливаем срок доставки, если он нужен.

{% hint style="info" %}
Детально возможности подсистемы логистики и варианты настройки можно рассмотрены в разделе ["Склады и поставщики - Логистика"](../../opisanie-i-nastroika/sklady-i-postavshiki/logistika.md)
{% endhint %}

### Настраиваем загрузку в виртуальном складе

Заполняем настройку загрузки остатков по поставщику в виртуальном складе . [Подробная инструкция здесь: https://help-vs.zetasoft.ru/nastroika-prais-lista](https://help-vs.zetasoft.ru/nastroika-prais-lista).

### Получаем список виртуальных складов поставщика

Дожидаемся первой загрузки остатков. Это нужно, чтобы заполнился список складов поставщика. Если вы делали тестовую загрузку, то можно превратить ее в реальную. Найдите ее в списке загрузок, снимите с нее флажки: "Это тестовая загрузка", "Полученный файл разобран" и "Изменения остатков записаны"

![](../../.gitbook/assets/image%20%2834%29.png)

### Синхронизируем список виртуальных складов поставщика с основной конфигурацией

Обновляем склады поставщика в основной конфигурации

Для того, чтобы обновить список складов в основной конфигурации нужно чтобы основная конфигурация была подключена к виртуальному складу. Для этого в виртуальном складе должны быть опубликованы веб-сервисы \(инструкция здесь: [https://help-vs.zetasoft.ru/ustanovka/publikaciya-servisov](https://help-vs.zetasoft.ru/ustanovka/publikaciya-servisov)\)

После публикации веб-сервисов подключение к виртуальному складу настраивается в меню Zeta Web - Настройки и администрирование - Настройки интеграции с внешними системами - Настройки подключения к виртуальному складу.

![](../../.gitbook/assets/image%20%28107%29.png)

Если все успешно подключено, то обновляем склады поставщиков: меню Zeta Web - Склады \(Настройка отображения\) - Склады поставщиков.

![](../../.gitbook/assets/image%20%2824%29.png)

Кроме того, для периодического автоматического обновления складов поставщиков можно в консоли заданий настроить регламентное задание "Обновить склады поставщиков \(Zeta Web\)".

### Уточняем группы доступности складов

Если вы для разных покупателей показываете разные склады, т.е. пользуетесь группами доступности складов Zeta Web, то при необходимости добавляем поставщика или конкретные склады поставщика в соответствующую группу доступности складов: меню Zeta Web - Склады \(Настройка отображения\) - Настройка групп доступности складов

![](../../.gitbook/assets/image%20%28537%29.png)

{% hint style="info" %}
Подробно про настройки группы доступности складов можно прочитать здесь - [https://help-zetaweb.zetasoft.ru/opisanie-i-nastroika/sklady-i-postavshiki/gruppy-dostupnosti-skladov](https://help-zetaweb.zetasoft.ru/opisanie-i-nastroika/sklady-i-postavshiki/gruppy-dostupnosti-skladov)
{% endhint %}

### Настраиваем отображение склада на сайте

Для того, чтобы новый виртуальный склад красиво показывался на сайте, добавляем настройку отображения склада: меню Zeta Web - Склады \(Настройка отображения\) - Описания отображения остатков

![](../../.gitbook/assets/image%20%28444%29.png)

{% hint style="warning" %}
В случае, если для всех складов одного поставщика необходимо **одно описание**, то в **Описании складов поставщиков** достаточно указать только **Поставщика** \(без уточнения размещения\), тогда описание будет применяться ко всем складам с указанным типом от этого поставщика.
{% endhint %}

{% hint style="info" %}
_Подробно про настройку отображения складов можно почитать здесь \(раздел пока в разработке\)_
{% endhint %}

### Настраиваем ценообразование

Для того, чтобы настроить ценообразование на остатки поставщика, нужно воспользоватся механизмом ценообразования на внешние остатки: меню **Zeta Web → Ценообразование → Правила ценообразования на внешние остатки**. Для этого следует заполнить данные _**Поставщика**_ и _**Значения скидок и наценок**_ в соответствующих полях табличной части окна. 

Также настройка ценообразования возможна путем копирования настроек другого поставщика, нажатием на **«Скопировать настройки поставщика»**.

![](../../.gitbook/assets/image-15%20%281%29.png)

