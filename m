Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3052F3BEA19
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:53:34 +0200 (CEST)
Received: from localhost ([::1]:35368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18vd-0007IF-9G
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m18uq-0006d5-QE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:52:44 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m18uo-0005MR-2Z
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:52:44 -0400
Received: by mail-il1-x135.google.com with SMTP id i13so3032463ilu.4
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Em5jNvFF596T5AQWDXJkVv2+A0Fj0kSVmlM5vGe07c=;
 b=dFJH0BtowIT5o74Qn47MEXWSEKpICVC9zPPGMjek7aziZFOmZRi5hNGiMrWgyQ9uHE
 ofdn72RrmkONvFhFu6uaeqRc3P6xXMueS7y0qRTduuDZ6FT+7dSihkWljILaNRpMsTlL
 lAxDb5HH4rNeWxuT4IrUTdWXALGukrypau4O5yQJV3HWaLyURRIm9AqF+2H1vmuwpecR
 vtPa7DIJZdCLATLbbeHdAQgGdHw4TITK3ko90lyQ0XkOJPZ7vzmQtjD5UWcV+PmLdwmx
 0QLAqJc3OEDXiqfuVmRBuTFRNcn0Ozdf+MU+tueq0Fxtj3xRK4FgwUXz7yJWiazJsr5X
 MOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Em5jNvFF596T5AQWDXJkVv2+A0Fj0kSVmlM5vGe07c=;
 b=r1GY1F/uW11LLFQYlqcvG6ysUFSYty9vPRZUzm9ZrcTW+4KsLqJtHhYgpOb70dwWdh
 a/BJiKPeZ2m8FrmS2B7OnGXEkUlAFnOegNYJSmTVuwffJthtezH4xULfDI+oMmets2UT
 LgcIYrQMtK/v+g/N2rMcZlUlXlHU+YlY0W3R0Pq0Lfp0gDiMsZw/jT9suxVXm/OI+xcK
 fksxA0BThruhjh/oRn8cq3RMOGw/f8LF9CGMaDj3sd91xn4ZUS9gC5SJXQebM8RuiOYn
 VtznD/GCLviybiC70hXl/v/DQeo65lVNHIVvsGtjkewLw0GEe5e3LoyAku0ZjTvIosX8
 EgLQ==
X-Gm-Message-State: AOAM530G1WBwJorTkOzN/bjBZE5Km1u2NiokioUjTMAhlxdLifs3yw69
 plcqgA+oomVKl4ecKG82dzoKXEQsSchepSm317E=
X-Google-Smtp-Source: ABdhPJwQkFqtc+8ApBWy0/JHWR/SKGW3KgxjgC+J0K9CjhQZ3IGSlXauWUIwtH14CHZpb6x7tjSqqdTpQXtRq5bA0io=
X-Received: by 2002:a92:c651:: with SMTP id 17mr18586734ill.44.1625669560020; 
 Wed, 07 Jul 2021 07:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210701041313.1696009-1-jsnow@redhat.com>
 <20210701041313.1696009-13-jsnow@redhat.com>
In-Reply-To: <20210701041313.1696009-13-jsnow@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 7 Jul 2021 20:22:13 +0530
Message-ID: <CAN6ztm9ZTSOnx69HuhhragQjR6DeGBuERXuSsPFAqoZNxPcHuw@mail.gmail.com>
Subject: Re: [PATCH 12/20] python/aqmp: add QMP Message format
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a5b28605c689b0be"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a5b28605c689b0be
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 9:43 AM John Snow <jsnow@redhat.com> wrote:

> The Message class is here primarily to serve as a solid type to use for
> mypy static typing for unambiguous annotation and documentation.
>
> We can also stuff JSON serialization and deserialization into this class
> itself so it can be re-used even outside this infrastructure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/__init__.py |   4 +-
>  python/qemu/aqmp/message.py  | 207 +++++++++++++++++++++++++++++++++++
>  2 files changed, 210 insertions(+), 1 deletion(-)
>  create mode 100644 python/qemu/aqmp/message.py
>
> diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
> index 5c44fabeea..c1ec68a023 100644
> --- a/python/qemu/aqmp/__init__.py
> +++ b/python/qemu/aqmp/__init__.py
> @@ -22,12 +22,14 @@
>  # the COPYING file in the top-level directory.
>
>  from .error import AQMPError, MultiException
> +from .message import Message
>  from .protocol import ConnectError, Runstate
>
>
>  # The order of these fields impact the Sphinx documentation order.
>  __all__ = (
> -    # Classes
> +    # Classes, most to least important
> +    'Message',
>      'Runstate',
>
>      # Exceptions, most generic to most explicit
> diff --git a/python/qemu/aqmp/message.py b/python/qemu/aqmp/message.py
> new file mode 100644
> index 0000000000..3a4b283032
> --- /dev/null
> +++ b/python/qemu/aqmp/message.py
> @@ -0,0 +1,207 @@
> +"""
> +QMP Message Format
> +
> +This module provides the `Message` class, which represents a single QMP
> +message sent to or from the server.
> +"""
> +
> +import json
> +from json import JSONDecodeError
> +from typing import (
> +    Dict,
> +    Iterator,
> +    Mapping,
> +    MutableMapping,
> +    Optional,
> +    Union,
> +)
> +
> +from .error import ProtocolError
> +
> +
> +class Message(MutableMapping[str, object]):
> +    """
> +    Represents a single QMP protocol message.
> +
> +    QMP uses JSON objects as its basic communicative unit; so this
> +    Python object is a :py:obj:`~collections.abc.MutableMapping`. It may
> +    be instantiated from either another mapping (like a `dict`), or from
> +    raw `bytes` that still need to be deserialized.
> +
> +    Once instantiated, it may be treated like any other MutableMapping::
> +
> +        >>> msg = Message(b'{"hello": "world"}')
> +        >>> assert msg['hello'] == 'world'
> +        >>> msg['id'] = 'foobar'
> +        >>> print(msg)
> +        {
> +          "hello": "world",
> +          "id": "foobar"
> +        }
> +
> +    It can be converted to `bytes`::
> +
> +        >>> msg = Message({"hello": "world"})
> +        >>> print(bytes(msg))
> +        b'{"hello":"world","id":"foobar"}'
> +
> +    Or back into a garden-variety `dict`::
> +
> +       >>> dict(msg)
> +       {'hello': 'world'}
> +
> +
> +    :param value: Initial value, if any.
> +    :param eager:
> +        When `True`, attempt to serialize or deserialize the initial value
> +        immediately, so that conversion exceptions are raised during
> +        the call to ``__init__()``.
> +    """
> +    # pylint: disable=too-many-ancestors
> +
> +    def __init__(self,
> +                 value: Union[bytes, Mapping[str, object]] = b'', *,
> +                 eager: bool = True):
> +        self._data: Optional[bytes] = None
> +        self._obj: Optional[Dict[str, object]] = None
> +
> +        if isinstance(value, bytes):
> +            self._data = value
> +            if eager:
> +                self._obj = self._deserialize(self._data)
> +        else:
> +            self._obj = dict(value)
> +            if eager:
> +                self._data = self._serialize(self._obj)
> +
> +    # Methods necessary to implement the MutableMapping interface, see:
> +    #
> https://docs.python.org/3/library/collections.abc.html#collections.abc.MutableMapping
> +
> +    # We get pop, popitem, clear, update, setdefault, __contains__,
> +    # keys, items, values, get, __eq__ and __ne__ for free.
> +
> +    def __getitem__(self, key: str) -> object:
> +        return self._object[key]
> +
> +    def __setitem__(self, key: str, value: object) -> None:
> +        self._object[key] = value
> +        self._data = None
> +
> +    def __delitem__(self, key: str) -> None:
> +        del self._object[key]
> +        self._data = None
> +
> +    def __iter__(self) -> Iterator[str]:
> +        return iter(self._object)
> +
> +    def __len__(self) -> int:
> +        return len(self._object)
> +
> +    # Dunder methods not related to MutableMapping:
> +
> +    def __repr__(self) -> str:
> +        return f"Message({self._object!r})"
> +
> +    def __str__(self) -> str:
> +        """Pretty-printed representation of this QMP message."""
> +        return json.dumps(self._object, indent=2)
> +
> +    def __bytes__(self) -> bytes:
> +        """bytes representing this QMP message."""
> +        if self._data is None:
> +            self._data = self._serialize(self._obj or {})
> +        return self._data
> +
> +    #
>
Is this something intentional?

> +
> +    @property
> +    def _object(self) -> Dict[str, object]:
> +        """
> +        A `dict` representing this QMP message.
> +
> +        Generated on-demand, if required. This property is private
> +        because it returns an object that could be used to invalidate
> +        the internal state of the `Message` object.
> +        """
> +        if self._obj is None:
> +            self._obj = self._deserialize(self._data or b'')
> +        return self._obj
> +
> +    @classmethod
> +    def _serialize(cls, value: object) -> bytes:
> +        """
> +        Serialize a JSON object as `bytes`.
> +
> +        :raise ValueError: When the object cannot be serialized.
> +        :raise TypeError: When the object cannot be serialized.
> +
> +        :return: `bytes` ready to be sent over the wire.
> +        """
> +        return json.dumps(value, separators=(',', ':')).encode('utf-8')
> +
> +    @classmethod
> +    def _deserialize(cls, data: bytes) -> Dict[str, object]:
> +        """
> +        Deserialize JSON `bytes` into a native Python `dict`.
> +
> +        :raise DeserializationError:
> +            If JSON deserialization fails for any reason.
> +        :raise UnexpectedTypeError:
> +            If the data does not represent a JSON object.
> +
> +        :return: A `dict` representing this QMP message.
> +        """
> +        try:
> +            obj = json.loads(data)
> +        except JSONDecodeError as err:
> +            emsg = "Failed to deserialize QMP message."
> +            raise DeserializationError(emsg, data) from err
> +        if not isinstance(obj, dict):
> +            raise UnexpectedTypeError(
> +                "QMP message is not a JSON object.",
> +                obj
> +            )
> +        return obj
> +
> +
> +class DeserializationError(ProtocolError):
> +    """
> +    A QMP message was not understood as JSON.
> +
> +    When this Exception is raised, ``__cause__`` will be set to the
> +    `json.JSONDecodeError` Exception, which can be interrogated for
> +    further details.
> +
> +    :param error_message: Human-readable string describing the error.
> +    :param raw: The raw `bytes` that prompted the failure.
> +    """
> +    def __init__(self, error_message: str, raw: bytes):
> +        super().__init__(error_message)
> +        #: The raw `bytes` that were not understood as JSON.
> +        self.raw: bytes = raw
> +
> +    def __str__(self) -> str:
> +        return "\n".join([
> +            super().__str__(),
> +            f"  raw bytes were: {str(self.raw)}",
> +        ])
> +
> +
> +class UnexpectedTypeError(ProtocolError):
> +    """
> +    A QMP message was JSON, but not a JSON object.
> +
> +    :param error_message: Human-readable string describing the error.
> +    :param value: The deserialized JSON value that wasn't an object.
> +    """
> +    def __init__(self, error_message: str, value: object):
> +        super().__init__(error_message)
> +        #: The JSON value that was expected to be an object.
> +        self.value: object = value
> +
> +    def __str__(self) -> str:
> +        strval = json.dumps(self.value, indent=2)
> +        return "\n".join([
> +            super().__str__(),
> +            f"  json value was: {strval}",
> +        ])
> --
> 2.31.1
>
>

--000000000000a5b28605c689b0be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 1, 2021 at 9:43 AM John Snow &lt;<a hre=
f=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The Message=
 class is here primarily to serve as a solid type to use for<br>
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
=3D"font-size:small">Is this something intentional?</span>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 @property<br>
+=C2=A0 =C2=A0 def _object(self) -&gt; Dict[str, object]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 A `dict` representing this QMP message.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generated on-demand, if required. This propert=
y is private<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 because it returns an object that could be use=
d to invalidate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the internal state of the `Message` object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._obj is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._obj =3D self._deserialize(=
self._data or b&#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._obj<br>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def _serialize(cls, value: object) -&gt; bytes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Serialize a JSON object as `bytes`.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise ValueError: When the object cannot be s=
erialized.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise TypeError: When the object cannot be se=
rialized.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: `bytes` ready to be sent over the wir=
e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return json.dumps(value, separators=3D(&#39;,&=
#39;, &#39;:&#39;)).encode(&#39;utf-8&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def _deserialize(cls, data: bytes) -&gt; Dict[str, object]:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Deserialize JSON `bytes` into a native Python =
`dict`.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise DeserializationError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If JSON deserialization fails fo=
r any reason.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise UnexpectedTypeError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If the data does not represent a=
 JSON object.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: A `dict` representing this QMP messag=
e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj =3D json.loads(data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except JSONDecodeError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emsg =3D &quot;Failed to deseria=
lize QMP message.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DeserializationError(emsg,=
 data) from err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(obj, dict):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise UnexpectedTypeError(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;QMP message =
is not a JSON object.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return obj<br>
+<br>
+<br>
+class DeserializationError(ProtocolError):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A QMP message was not understood as JSON.<br>
+<br>
+=C2=A0 =C2=A0 When this Exception is raised, ``__cause__`` will be set to =
the<br>
+=C2=A0 =C2=A0 `json.JSONDecodeError` Exception, which can be interrogated =
for<br>
+=C2=A0 =C2=A0 further details.<br>
+<br>
+=C2=A0 =C2=A0 :param error_message: Human-readable string describing the e=
rror.<br>
+=C2=A0 =C2=A0 :param raw: The raw `bytes` that prompted the failure.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, error_message: str, raw: bytes):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(error_message)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #: The raw `bytes` that were not understood as=
 JSON.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.raw: bytes =3D raw<br>
+<br>
+=C2=A0 =C2=A0 def __str__(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;\n&quot;.join([<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__str__(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;=C2=A0 raw bytes were: {s=
tr(self.raw)}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
+<br>
+<br>
+class UnexpectedTypeError(ProtocolError):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A QMP message was JSON, but not a JSON object.<br>
+<br>
+=C2=A0 =C2=A0 :param error_message: Human-readable string describing the e=
rror.<br>
+=C2=A0 =C2=A0 :param value: The deserialized JSON value that wasn&#39;t an=
 object.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, error_message: str, value: object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(error_message)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #: The JSON value that was expected to be an o=
bject.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.value: object =3D value<br>
+<br>
+=C2=A0 =C2=A0 def __str__(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 strval =3D json.dumps(self.value, indent=3D2)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;\n&quot;.join([<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__str__(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;=C2=A0 json value was: {s=
trval}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000a5b28605c689b0be--

