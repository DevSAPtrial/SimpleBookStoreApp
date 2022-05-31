namespace bookshop;

using
{
    Country,
    managed
}
from '@sap/cds/common';

entity Books
{
    key ID : Integer;
    title : String(100);
    author : Association to Authors;
    stock : Integer;
}

entity Authors
{
    key ID : Integer;
    name : localized String(100);
    books : Association to many Books on books.author = $self;
    orders : Association to Orders;
}

entity Orders
{
    key ID : UUID
        @Core.Computed;
    book : String(100) not null;
    country : Country;
    amount : Integer not null;
    authors : Association to Books;
}
