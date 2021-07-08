Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E33C17E5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:14:10 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XbE-0001Gf-Vo
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1XF3-0007rK-EY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1XEw-0003CC-VN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625763064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x0cIoiaswRb89JWxnqhUDOFii8xJALGJKWZDMiziT/8=;
 b=IFHJhgMV22asriz+RiMrKYVVqxJi0O6qOkdORh2HnRKIzqH5qhnGyBfpufP3Y8n3G9YPl/
 n0zB4EXOyfCMAe63yFw2kW97tScWHzNyy+er8CJRPr1tf2Y9gkfoky/waTMMcuHEtmtxc1
 dm3aTgYy+9ndVtU3p5ZKT8RrDwC3szQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-OblyUiZfNiyNOM4nSsAX1g-1; Thu, 08 Jul 2021 12:51:02 -0400
X-MC-Unique: OblyUiZfNiyNOM4nSsAX1g-1
Received: by mail-oi1-f198.google.com with SMTP id
 22-20020aca0d160000b029023df2dc5611so4803138oin.22
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0cIoiaswRb89JWxnqhUDOFii8xJALGJKWZDMiziT/8=;
 b=q9fqsa0b+6C2Stbme3hPQbP9Wv4lZ6klnAaibfVtfmU/GMtOPyt3C2y+8ze9aE5GxO
 jeqijf5kH9EruXMe+t/f5XQoornAYSDcnBYQhu+8FhKNE8V2JLTI9BKHo0vTx8WMUzU4
 mhVUAck4bPM2JvwNmYN5zc7HSX4oRcJXVTI5rsIReZPlk7GKz4U7VyVTk7G1MV2SkTdY
 9WEdbEX4RkC+KI2KEaq7Z5pxvRxN8Qt3KN8VYeUxXqRu3Es37xZkIXICTXWpOhO3C3Gs
 0e7GTKJDyhfVUQd/rCmQ5TpzMHlP/Gt9WsqEuo/NxhntU2luMmMDE3K4+Wbz1mdaA099
 /awg==
X-Gm-Message-State: AOAM531wO5OutOSi3o7AQAl7eLbeUD4/ld1q5tCQzwNllD1ReBtTku3d
 r/KGOgHgdMeAQAL5oaKM30FnyJmkzuE+kFaZNwAOEG4wpc7iTs3O7+WARlIDzzkg+Phlcbi3Dle
 eNIf9+1LjPeFTUK59GrYdZs0LPhBNYAg=
X-Received: by 2002:a9d:344:: with SMTP id 62mr15139248otv.323.1625763061720; 
 Thu, 08 Jul 2021 09:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlezWMMHm0RWGV6rFUjklyrZN7Ky/iIwtwA6RNeMUVHNC7NN5E0U+eUwEloRPsfabBZfX65ku4oZ1tkCkL5WA=
X-Received: by 2002:a9d:344:: with SMTP id 62mr15139239otv.323.1625763061516; 
 Thu, 08 Jul 2021 09:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210701041313.1696009-1-jsnow@redhat.com>
 <20210701041313.1696009-13-jsnow@redhat.com>
 <CAN6ztm9ZTSOnx69HuhhragQjR6DeGBuERXuSsPFAqoZNxPcHuw@mail.gmail.com>
In-Reply-To: <CAN6ztm9ZTSOnx69HuhhragQjR6DeGBuERXuSsPFAqoZNxPcHuw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 8 Jul 2021 12:50:50 -0400
Message-ID: <CAFn=p-bHKtFz_dn2bX-+XoUV+ta31emfJUhVhMe01eZtyYPpfQ@mail.gmail.com>
Subject: Re: [PATCH 12/20] python/aqmp: add QMP Message format
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c55fca05c69f752d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c55fca05c69f752d
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 10:52 AM Niteesh G. S. <niteesh.gs@gmail.com> wrote:

>
>
> On Thu, Jul 1, 2021 at 9:43 AM John Snow <jsnow@redhat.com> wrote:
>
>> The Message class is here primarily to serve as a solid type to use for
>> mypy static typing for unambiguous annotation and documentation.
>>
>> We can also stuff JSON serialization and deserialization into this class
>> itself so it can be re-used even outside this infrastructure.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  python/qemu/aqmp/__init__.py |   4 +-
>>  python/qemu/aqmp/message.py  | 207 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 210 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/message.py
>>
>> diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
>> index 5c44fabeea..c1ec68a023 100644
>> --- a/python/qemu/aqmp/__init__.py
>> +++ b/python/qemu/aqmp/__init__.py
>> @@ -22,12 +22,14 @@
>>  # the COPYING file in the top-level directory.
>>
>>  from .error import AQMPError, MultiException
>> +from .message import Message
>>  from .protocol import ConnectError, Runstate
>>
>>
>>  # The order of these fields impact the Sphinx documentation order.
>>  __all__ = (
>> -    # Classes
>> +    # Classes, most to least important
>> +    'Message',
>>      'Runstate',
>>
>>      # Exceptions, most generic to most explicit
>> diff --git a/python/qemu/aqmp/message.py b/python/qemu/aqmp/message.py
>> new file mode 100644
>> index 0000000000..3a4b283032
>> --- /dev/null
>> +++ b/python/qemu/aqmp/message.py
>> @@ -0,0 +1,207 @@
>> +"""
>> +QMP Message Format
>> +
>> +This module provides the `Message` class, which represents a single QMP
>> +message sent to or from the server.
>> +"""
>> +
>> +import json
>> +from json import JSONDecodeError
>> +from typing import (
>> +    Dict,
>> +    Iterator,
>> +    Mapping,
>> +    MutableMapping,
>> +    Optional,
>> +    Union,
>> +)
>> +
>> +from .error import ProtocolError
>> +
>> +
>> +class Message(MutableMapping[str, object]):
>> +    """
>> +    Represents a single QMP protocol message.
>> +
>> +    QMP uses JSON objects as its basic communicative unit; so this
>> +    Python object is a :py:obj:`~collections.abc.MutableMapping`. It may
>> +    be instantiated from either another mapping (like a `dict`), or from
>> +    raw `bytes` that still need to be deserialized.
>> +
>> +    Once instantiated, it may be treated like any other MutableMapping::
>> +
>> +        >>> msg = Message(b'{"hello": "world"}')
>> +        >>> assert msg['hello'] == 'world'
>> +        >>> msg['id'] = 'foobar'
>> +        >>> print(msg)
>> +        {
>> +          "hello": "world",
>> +          "id": "foobar"
>> +        }
>> +
>> +    It can be converted to `bytes`::
>> +
>> +        >>> msg = Message({"hello": "world"})
>> +        >>> print(bytes(msg))
>> +        b'{"hello":"world","id":"foobar"}'
>> +
>> +    Or back into a garden-variety `dict`::
>> +
>> +       >>> dict(msg)
>> +       {'hello': 'world'}
>> +
>> +
>> +    :param value: Initial value, if any.
>> +    :param eager:
>> +        When `True`, attempt to serialize or deserialize the initial
>> value
>> +        immediately, so that conversion exceptions are raised during
>> +        the call to ``__init__()``.
>> +    """
>> +    # pylint: disable=too-many-ancestors
>> +
>> +    def __init__(self,
>> +                 value: Union[bytes, Mapping[str, object]] = b'', *,
>> +                 eager: bool = True):
>> +        self._data: Optional[bytes] = None
>> +        self._obj: Optional[Dict[str, object]] = None
>> +
>> +        if isinstance(value, bytes):
>> +            self._data = value
>> +            if eager:
>> +                self._obj = self._deserialize(self._data)
>> +        else:
>> +            self._obj = dict(value)
>> +            if eager:
>> +                self._data = self._serialize(self._obj)
>> +
>> +    # Methods necessary to implement the MutableMapping interface, see:
>> +    #
>> https://docs.python.org/3/library/collections.abc.html#collections.abc.MutableMapping
>> +
>> +    # We get pop, popitem, clear, update, setdefault, __contains__,
>> +    # keys, items, values, get, __eq__ and __ne__ for free.
>> +
>> +    def __getitem__(self, key: str) -> object:
>> +        return self._object[key]
>> +
>> +    def __setitem__(self, key: str, value: object) -> None:
>> +        self._object[key] = value
>> +        self._data = None
>> +
>> +    def __delitem__(self, key: str) -> None:
>> +        del self._object[key]
>> +        self._data = None
>> +
>> +    def __iter__(self) -> Iterator[str]:
>> +        return iter(self._object)
>> +
>> +    def __len__(self) -> int:
>> +        return len(self._object)
>> +
>> +    # Dunder methods not related to MutableMapping:
>> +
>> +    def __repr__(self) -> str:
>> +        return f"Message({self._object!r})"
>> +
>> +    def __str__(self) -> str:
>> +        """Pretty-printed representation of this QMP message."""
>> +        return json.dumps(self._object, indent=2)
>> +
>> +    def __bytes__(self) -> bytes:
>> +        """bytes representing this QMP message."""
>> +        if self._data is None:
>> +            self._data = self._serialize(self._obj or {})
>> +        return self._data
>> +
>> +    #
>>
> Is this something intentional?
>

Err, oops, kind of. I sometimes use little comment blocks to delineate
sections of methods. Above, I have a "MutableMapping" section, and then a
"Dunder method" section, and this marks the end of the dunder method
section, but I neglected to give it its own title. I suppose I could name
it "Conversion Methods" or similar.

Thanks,
--js

--000000000000c55fca05c69f752d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 10:52 AM Nitee=
sh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Jul 1, 2021 at 9:43 AM John Snow &lt;<a href=3D"mailto:jsnow@redhat.c=
om" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">The Message class is here primarily t=
o serve as a solid type to use for<br>
mypy static typing for unambiguous annotation and documentation.<br>
<br>
We can also stuff JSON serialization and deserialization into this class<br=
>
itself so it can be re-used even outside this infrastructure.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/__init__.py |=C2=A0 =C2=A04 +-<br>
=C2=A0python/qemu/aqmp/message.py=C2=A0 | 207 +++++++++++++++++++++++++++++=
++++++<br>
=C2=A02 files changed, 210 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/message.py<br>
<br>
diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py<br=
>
index 5c44fabeea..c1ec68a023 100644<br>
--- a/python/qemu/aqmp/__init__.py<br>
+++ b/python/qemu/aqmp/__init__.py<br>
@@ -22,12 +22,14 @@<br>
=C2=A0# the COPYING file in the top-level directory.<br>
<br>
=C2=A0from .error import AQMPError, MultiException<br>
+from .message import Message<br>
=C2=A0from .protocol import ConnectError, Runstate<br>
<br>
<br>
=C2=A0# The order of these fields impact the Sphinx documentation order.<br=
>
=C2=A0__all__ =3D (<br>
-=C2=A0 =C2=A0 # Classes<br>
+=C2=A0 =C2=A0 # Classes, most to least important<br>
+=C2=A0 =C2=A0 &#39;Message&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;Runstate&#39;,<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Exceptions, most generic to most explicit<br>
diff --git a/python/qemu/aqmp/message.py b/python/qemu/aqmp/message.py<br>
new file mode 100644<br>
index 0000000000..3a4b283032<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/message.py<br>
@@ -0,0 +1,207 @@<br>
+&quot;&quot;&quot;<br>
+QMP Message Format<br>
+<br>
+This module provides the `Message` class, which represents a single QMP<br=
>
+message sent to or from the server.<br>
+&quot;&quot;&quot;<br>
+<br>
+import json<br>
+from json import JSONDecodeError<br>
+from typing import (<br>
+=C2=A0 =C2=A0 Dict,<br>
+=C2=A0 =C2=A0 Iterator,<br>
+=C2=A0 =C2=A0 Mapping,<br>
+=C2=A0 =C2=A0 MutableMapping,<br>
+=C2=A0 =C2=A0 Optional,<br>
+=C2=A0 =C2=A0 Union,<br>
+)<br>
+<br>
+from .error import ProtocolError<br>
+<br>
+<br>
+class Message(MutableMapping[str, object]):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Represents a single QMP protocol message.<br>
+<br>
+=C2=A0 =C2=A0 QMP uses JSON objects as its basic communicative unit; so th=
is<br>
+=C2=A0 =C2=A0 Python object is a :py:obj:`~collections.abc.MutableMapping`=
. It may<br>
+=C2=A0 =C2=A0 be instantiated from either another mapping (like a `dict`),=
 or from<br>
+=C2=A0 =C2=A0 raw `bytes` that still need to be deserialized.<br>
+<br>
+=C2=A0 =C2=A0 Once instantiated, it may be treated like any other MutableM=
apping::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; msg =3D Message(b&#39;{&quot;hell=
o&quot;: &quot;world&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; assert msg[&#39;hello&#39;] =3D=
=3D &#39;world&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; msg[&#39;id&#39;] =3D &#39;foobar=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; print(msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hello&quot;: &quot;world&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;id&quot;: &quot;foobar&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 It can be converted to `bytes`::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; msg =3D Message({&quot;hello&quot=
;: &quot;world&quot;})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; print(bytes(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 b&#39;{&quot;hello&quot;:&quot;world&quot;,&qu=
ot;id&quot;:&quot;foobar&quot;}&#39;<br>
+<br>
+=C2=A0 =C2=A0 Or back into a garden-variety `dict`::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; dict(msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&#39;hello&#39;: &#39;world&#39;}<br>
+<br>
+<br>
+=C2=A0 =C2=A0 :param value: Initial value, if any.<br>
+=C2=A0 =C2=A0 :param eager:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 When `True`, attempt to serialize or deseriali=
ze the initial value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 immediately, so that conversion exceptions are=
 raised during<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the call to ``__init__()``.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 # pylint: disable=3Dtoo-many-ancestors<br>
+<br>
+=C2=A0 =C2=A0 def __init__(self,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value: Union=
[bytes, Mapping[str, object]] =3D b&#39;&#39;, *,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eager: bool =
=3D True):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._data: Optional[bytes] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._obj: Optional[Dict[str, object]] =3D Non=
e<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(value, bytes):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._data =3D value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if eager:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._obj =3D self=
._deserialize(self._data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._obj =3D dict(value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if eager:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._data =3D sel=
f._serialize(self._obj)<br>
+<br>
+=C2=A0 =C2=A0 # Methods necessary to implement the MutableMapping interfac=
e, see:<br>
+=C2=A0 =C2=A0 # <a href=3D"https://docs.python.org/3/library/collections.a=
bc.html#collections.abc.MutableMapping" rel=3D"noreferrer" target=3D"_blank=
">https://docs.python.org/3/library/collections.abc.html#collections.abc.Mu=
tableMapping</a><br>
+<br>
+=C2=A0 =C2=A0 # We get pop, popitem, clear, update, setdefault, __contains=
__,<br>
+=C2=A0 =C2=A0 # keys, items, values, get, __eq__ and __ne__ for free.<br>
+<br>
+=C2=A0 =C2=A0 def __getitem__(self, key: str) -&gt; object:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._object[key]<br>
+<br>
+=C2=A0 =C2=A0 def __setitem__(self, key: str, value: object) -&gt; None:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._object[key] =3D value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._data =3D None<br>
+<br>
+=C2=A0 =C2=A0 def __delitem__(self, key: str) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 del self._object[key]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._data =3D None<br>
+<br>
+=C2=A0 =C2=A0 def __iter__(self) -&gt; Iterator[str]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return iter(self._object)<br>
+<br>
+=C2=A0 =C2=A0 def __len__(self) -&gt; int:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return len(self._object)<br>
+<br>
+=C2=A0 =C2=A0 # Dunder methods not related to MutableMapping:<br>
+<br>
+=C2=A0 =C2=A0 def __repr__(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;Message({self._object!r})&quot;<=
br>
+<br>
+=C2=A0 =C2=A0 def __str__(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Pretty-printed representatio=
n of this QMP message.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return json.dumps(self._object, indent=3D2)<br=
>
+<br>
+=C2=A0 =C2=A0 def __bytes__(self) -&gt; bytes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;bytes representing this QMP =
message.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._data is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._data =3D self._serialize(s=
elf._obj or {})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._data<br>
+<br>
+=C2=A0 =C2=A0 #<br></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small">Is this something intentional?</span>=C2=A0</div></div=
></div></blockquote><div><br></div><div>Err, oops, kind of. I sometimes use=
 little comment blocks to delineate sections of methods. Above, I have a &q=
uot;MutableMapping&quot; section, and then a &quot;Dunder method&quot; sect=
ion, and this marks the end of the dunder method section, but I neglected t=
o give it its own title. I suppose I could name it &quot;Conversion Methods=
&quot; or similar.</div><div><br></div><div>Thanks,</div><div>--js</div><di=
v><br></div></div></div>

--000000000000c55fca05c69f752d--


