---
description: 2.6.0.0
---

# Контрол "Корзина. Подтверждение. v2"

## Имя контрола в веб-части: zw\_CartConfirm2.ascx

Корзина. Шаг 2. Второй шаг оформления заказа пользователем - подтверждение заказа. Контрол предназначен для подтверждения заказа, вывода товаров, добавленных пользователем в корзину, итогового количества товаров и итоговой суммы, выбора способа оплаты и доставки, добавления комметария к заказу. Товары в корзине можно сгруппировать по контрагенту, договору контрагента, складу отгрузки. На этом этапе пользователь уже не может изменять количество добавленных товаров, удалять товары, изменять склад отгрузки. Для выбора настроек доставки и оплаты используется часть шаблона Подтверждение - "Выбор способа доставки и оплаты" v2. Для использования указывается шаблон контрола "Корзина. Подтверждение. Выбор способа доставки и оплаты". Части Подтверждение - "Выбор способа оплаты", Подтверждение - "Выбор типа доставки", Подтверждение - "Выбор поставщика услуг, осуществляющего доставку", Подтверждение - "Выбор адреса доставки покупателя" являются устаревшими. Если необходимо оставить комментарий к строке заказа, текст комментария вводит в поле "Комментарий к строке заказа". Если необходима проверка корректности заказа, необходимо использовать флажок "Требуется проверка корректности заказа". Если необходимо отружать заказ при полной комплектации, необходимо использовать флажок "Отгружать заказ при полной комплектации". Поле ввода "Комментарий" служит для добавления комментария к заказу в целом. Для анонимного пользователя для подтверждения заказа необходимо заполнить поля с краткой информацией о себе: имя, номер телефона, email. Оформить заказ можно с оплатой и без оплаты. Оформление заказа происходи после клика по кнопке "Оформить заказ с оплатой" или "Оформить заказ без оплаты". После нажатия кнопки происходит переход на страницу с информацией о заказе указанную в параметре контрола Страница "Результат оплаты и информация о заказе".

