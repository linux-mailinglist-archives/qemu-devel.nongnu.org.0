Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAF3D01F5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:53:08 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5urb-00033K-K4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m5uql-0002Ni-KO
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:52:15 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m5uqj-0007vw-KY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:52:15 -0400
Received: by mail-il1-x130.google.com with SMTP id a11so220707ilf.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G64mD1hTkwkfg3P2sXBkh48hbmRzangR5KtlP4SQcQg=;
 b=W7+WAu8OXQVKUFU2gmQaReUCTfdyfk8NOoB25HH+WCwyg5qnonNTf+53JII0oOxq3/
 xq8i3ro8DnJCzC9B1p8wK3UOIV6Php7FJwHqH1UpR6VxScabeI8B7OfLKq4m7oB2/lgE
 kYlOPAITAMwLSe+Iu6f6lltQaaBkfiSxna1UkqdbPEcCEnBx5qJy8eZYoajkYMqHwsqK
 NgR7zmpIPOHX1JcUVHXb+WsAhU6J3remybMWC1LDikmoB1O6W91Ew/ZMdDHr8sy2Kjdf
 vrVnekrj7+mlX3ZqYVjSB8xJxbRC3FAJ6uSDXgpeE1Qjw7x90Ex5OJ2PDMtD2+NlMoJK
 ZaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G64mD1hTkwkfg3P2sXBkh48hbmRzangR5KtlP4SQcQg=;
 b=d55TLPgCkIcaqFmFfCwFt6gBuokEUDn+3AaUm8UsvuuUIVEz3fWe/XJeSCkouqcRnM
 +Ea8PGdXLmkwXhDXTPLE9fAiVxTswSVZdp1Ibig0nKBuupiEJ7BvdT7+gkS2vyKU/CXh
 RdIdOksnTNwp658g5w8d12LoWGNAZjvp6BSG5Cg4kR/i5PI0M3tye+plWNozAeV7SVBy
 TYbuM021a+G/3BVKeUYWckUAJkt7j+znzlS/CCjkx/wGXF7DGBhKgdGyzAZCS3GE5HnP
 85i4QHnKpivdTpjVvCy9R3jVlGo9C1NNBRXCc0jQBx8hVQgpMgVH9kTcuvqUtNzeLrlA
 aO0g==
X-Gm-Message-State: AOAM532ruCqKTYMpjGNNSy+g7RVIrxjjoeBqdEvWgOccywO/fFIPS2NF
 Yb7pelluiBE9VrXiaYyakiYHB6Eobe+UaWPYnzk=
X-Google-Smtp-Source: ABdhPJxL6PbGZWDc28i0VaaVwZpwK252mmjUrPL1fLjfm8sOb7u6zjoDBZNwMC0/nPiRzkhnKA8bBjTK7vk8VHMKFXQ=
X-Received: by 2002:a92:ac0b:: with SMTP id r11mr21173206ilh.44.1626807132386; 
 Tue, 20 Jul 2021 11:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-12-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-12-jsnow@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 21 Jul 2021 00:21:46 +0530
Message-ID: <CAN6ztm_mVwuTsF1-7=UrFJWXOKBzcAFBnpumN0Yj90geUByUDw@mail.gmail.com>
Subject: Re: [PATCH v2 11/24] python/aqmp: add _cb_inbound and _cb_inbound
 logging hooks
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003e880605c7928d1d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x130.google.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003e880605c7928d1d
Content-Type: text/plain; charset="UTF-8"

I think there's a typo in your commit message subject.

Thanks,
Niteesh.

On Sat, Jul 17, 2021 at 6:03 AM John Snow <jsnow@redhat.com> wrote:

> Add hooks designed to log/filter incoming/outgoing messages. The primary
> intent for these is to be able to support iotests which may want to log
> messages with specific filters for reproducible output.
>
> Another use is for plugging into Urwid frameworks; all messages in/out
> can be automatically added to a rendering list for the purposes of a
> qmp-shell like tool.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/protocol.py | 50 +++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 4 deletions(-)
>
> diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
> index 86002a52654..6f83d3e3922 100644
> --- a/python/qemu/aqmp/protocol.py
> +++ b/python/qemu/aqmp/protocol.py
> @@ -176,6 +176,11 @@ class AsyncProtocol(Generic[T]):
>           can be written after the super() call.
>       - `_on_message`:
>           Actions to be performed when a message is received.
> +     - `_cb_outbound`:
> +         Logging/Filtering hook for all outbound messages.
> +     - `_cb_inbound`:
> +         Logging/Filtering hook for all inbound messages.
> +         This hook runs *before* `_on_message()`.
>
>      :param name:
>          Name used for logging messages, if any. By default, messages
> @@ -732,6 +737,43 @@ async def _bh_recv_message(self) -> None:
>      # Section: Message I/O
>      # --------------------
>
> +    @upper_half
> +    @bottom_half
> +    def _cb_outbound(self, msg: T) -> T:
> +        """
> +        Callback: outbound message hook.
> +
> +        This is intended for subclasses to be able to add arbitrary
> +        hooks to filter or manipulate outgoing messages. The base
> +        implementation does nothing but log the message without any
> +        manipulation of the message.
> +
> +        :param msg: raw outbound message
> +        :return: final outbound message
> +        """
> +        self.logger.debug("--> %s", str(msg))
> +        return msg
> +
> +    @upper_half
> +    @bottom_half
> +    def _cb_inbound(self, msg: T) -> T:
> +        """
> +        Callback: inbound message hook.
> +
> +        This is intended for subclasses to be able to add arbitrary
> +        hooks to filter or manipulate incoming messages. The base
> +        implementation does nothing but log the message without any
> +        manipulation of the message.
> +
> +        This method does not "handle" incoming messages; it is a filter.
> +        The actual "endpoint" for incoming messages is `_on_message()`.
> +
> +        :param msg: raw inbound message
> +        :return: processed inbound message
> +        """
> +        self.logger.debug("<-- %s", str(msg))
> +        return msg
> +
>      @upper_half
>      @bottom_half
>      async def _do_recv(self) -> T:
> @@ -760,8 +802,8 @@ async def _recv(self) -> T:
>
>          :return: A single (filtered, processed) protocol message.
>          """
> -        # A forthcoming commit makes this method less trivial.
> -        return await self._do_recv()
> +        message = await self._do_recv()
> +        return self._cb_inbound(message)
>
>      @upper_half
>      @bottom_half
> @@ -791,7 +833,7 @@ async def _send(self, msg: T) -> None:
>
>          :raise OSError: For problems with the underlying stream.
>          """
> -        # A forthcoming commit makes this method less trivial.
> +        msg = self._cb_outbound(msg)
>          self._do_send(msg)
>
>      @bottom_half
> @@ -806,6 +848,6 @@ async def _on_message(self, msg: T) -> None:
>              directly cause the loop to halt, so logic may be best-kept
>              to a minimum if at all possible.
>
> -        :param msg: The incoming message
> +        :param msg: The incoming message, already logged/filtered.
>          """
>          # Nothing to do in the abstract case.
> --
> 2.31.1
>
>

--0000000000003e880605c7928d1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I think there&#39;s a typo in your commit message subject.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Thanks,</div><div class=3D"=
gmail_default" style=3D"font-size:small">Niteesh.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 17, 2021=
 at 6:03 AM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Add hooks designed to log/filter incoming/outgoing messages. The primary=
<br>
intent for these is to be able to support iotests which may want to log<br>
messages with specific filters for reproducible output.<br>
<br>
Another use is for plugging into Urwid frameworks; all messages in/out<br>
can be automatically added to a rendering list for the purposes of a<br>
qmp-shell like tool.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/protocol.py | 50 +++++++++++++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 46 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py<br=
>
index 86002a52654..6f83d3e3922 100644<br>
--- a/python/qemu/aqmp/protocol.py<br>
+++ b/python/qemu/aqmp/protocol.py<br>
@@ -176,6 +176,11 @@ class AsyncProtocol(Generic[T]):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 can be written after the super() call.<b=
r>
=C2=A0 =C2=A0 =C2=A0 - `_on_message`:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Actions to be performed when a message i=
s received.<br>
+=C2=A0 =C2=A0 =C2=A0- `_cb_outbound`:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Logging/Filtering hook for all outbound =
messages.<br>
+=C2=A0 =C2=A0 =C2=A0- `_cb_inbound`:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Logging/Filtering hook for all inbound m=
essages.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This hook runs *before* `_on_message()`.=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0:param name:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Name used for logging messages, if any. B=
y default, messages<br>
@@ -732,6 +737,43 @@ async def _bh_recv_message(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0# Section: Message I/O<br>
=C2=A0 =C2=A0 =C2=A0# --------------------<br>
<br>
+=C2=A0 =C2=A0 @upper_half<br>
+=C2=A0 =C2=A0 @bottom_half<br>
+=C2=A0 =C2=A0 def _cb_outbound(self, msg: T) -&gt; T:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Callback: outbound message hook.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is intended for subclasses to be able to =
add arbitrary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hooks to filter or manipulate outgoing message=
s. The base<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 implementation does nothing but log the messag=
e without any<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manipulation of the message.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg: raw outbound message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: final outbound message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.debug(&quot;--&gt; %s&quot;, str(m=
sg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 @upper_half<br>
+=C2=A0 =C2=A0 @bottom_half<br>
+=C2=A0 =C2=A0 def _cb_inbound(self, msg: T) -&gt; T:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Callback: inbound message hook.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is intended for subclasses to be able to =
add arbitrary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hooks to filter or manipulate incoming message=
s. The base<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 implementation does nothing but log the messag=
e without any<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manipulation of the message.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This method does not &quot;handle&quot; incomi=
ng messages; it is a filter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The actual &quot;endpoint&quot; for incoming m=
essages is `_on_message()`.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg: raw inbound message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: processed inbound message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.debug(&quot;&lt;-- %s&quot;, str(m=
sg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
=C2=A0 =C2=A0 =C2=A0@upper_half<br>
=C2=A0 =C2=A0 =C2=A0@bottom_half<br>
=C2=A0 =C2=A0 =C2=A0async def _do_recv(self) -&gt; T:<br>
@@ -760,8 +802,8 @@ async def _recv(self) -&gt; T:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:return: A single (filtered, processed) p=
rotocol message.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # A forthcoming commit makes this method less =
trivial.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return await self._do_recv()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 message =3D await self._do_recv()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._cb_inbound(message)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@upper_half<br>
=C2=A0 =C2=A0 =C2=A0@bottom_half<br>
@@ -791,7 +833,7 @@ async def _send(self, msg: T) -&gt; None:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:raise OSError: For problems with the und=
erlying stream.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # A forthcoming commit makes this method less =
trivial.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D self._cb_outbound(msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._do_send(msg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@bottom_half<br>
@@ -806,6 +848,6 @@ async def _on_message(self, msg: T) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0directly cause the loop to =
halt, so logic may be best-kept<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to a minimum if at all poss=
ible.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg: The incoming message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg: The incoming message, already logg=
ed/filtered.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Nothing to do in the abstract case.<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000003e880605c7928d1d--

