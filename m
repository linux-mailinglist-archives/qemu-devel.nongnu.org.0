Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5133D7B9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:38:00 +0100 (CET)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBle-0006nT-W8
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1lMBk7-0005sO-RB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:36:23 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1lMBjy-0002mH-S6
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:36:22 -0400
Received: by mail-ed1-x529.google.com with SMTP id bx7so22051337edb.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioOISMyQ6GQSpzvDbb026wKVm1oLNUpNQgjF89hb4mQ=;
 b=BtrQg1fvaTwBQqsERlDAEnm9OtDkmgYwcPpXyl1UmfBt3PZE7wHRGdOdi4YIbUhxmf
 yf04vuYO0Go9oP8oy+GbhN7anG1+8pg3sKA0SWSq27w5nIbNokmDDzwFfMkF2SFtq5zC
 F6lIGzG1ET2tdRVlLTVU7MVeYJg01aGaqweEb1JJpYsj1RQgZO7fiJMHvLThVKdnydy7
 SgrOyldxUVjzsANviHrKLqYASULewHxTyg0RvCZR1GNbgwz0mdJyllkDbG3VA0pa8VVU
 qp0Z5/uPQuMncTp1Zjn1ou24GGjOGFlS/ksVc6XtUcU7F6GphWyPVMkBIS+xjIrZQK1U
 PqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioOISMyQ6GQSpzvDbb026wKVm1oLNUpNQgjF89hb4mQ=;
 b=i7zuWfLUFmJ0BZjsHCFn8IhwkE/KLdJ73tMHigCKdYODAt1Ak/EGKA3pLY1ObQU6QL
 AvAbh/Ch6Xe2/z3q+onBu1kVYE3lgmIAn4G5yJ53Gl89tT/wW5uZo+VLOdNd81SlQFol
 q52pTcRqdzOdoP2M7yK7+PXj7E0md5lDecIfKHkSmkdXZbkbBb7+pY79lmj99+Uboqy+
 mwJ+5LAB9TOn0/MAAyK1P9Z7Z6AlUiI4q6wHF6X5QGU37eZLe/2GAZc4tJ1Ft/vbBgA2
 M+XkaBTSK3cmoRyUGO36qZ4XnSK2/6i1yHJ+7KnH3aWc9ehGwhVoOHs/YYQHDelDZgmQ
 5vYw==
X-Gm-Message-State: AOAM531h7QVNY1ZoiScT6/F+tj7deY+xUQi34pb3OndD2ttImtynPGhp
 WJoPcdzDH0JNAaRiS/a0KouzrCGOSr9XYQ8BjQKEcg==
X-Google-Smtp-Source: ABdhPJy5hpVPrmriTawe18zcgGfi8eavaXIQ0nrDrbkrcweV1cgR8ON89j5JSjhHPAV/M9s2fdNFmWv608T9zK4EvUI=
X-Received: by 2002:aa7:d156:: with SMTP id r22mr37365597edo.18.1615908972724; 
 Tue, 16 Mar 2021 08:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
 <CAEM4iGGmwDToV04dcUczAVcVHAQREc-Th6e=qDsT4kp9ozM2XQ@mail.gmail.com>
 <CAJ+F1CJway2T9q-hHPhV1_37TLkUB=FV-5HA2+F4vm-kY=DdTA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJway2T9q-hHPhV1_37TLkUB=FV-5HA2+F4vm-kY=DdTA@mail.gmail.com>
From: Li Zhang <li.zhang@cloud.ionos.com>
Date: Tue, 16 Mar 2021 16:36:02 +0100
Message-ID: <CAEM4iGEyHKKpUKN1_L4h2FDE42TwtrJwK64h7y-N2ox1UB9vmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004f1b5c05bda920b8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=li.zhang@cloud.ionos.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004f1b5c05bda920b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

Hi Marc-Andr=C3=A9,

Ah, you are right.  For some scenarios, it is not registered and registered
for some scenarios.
If the previous chardev is not socket, it won't be registered either.
There are still problems.

On Tue, Mar 16, 2021 at 4:25 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Tue, Mar 16, 2021 at 6:46 PM Li Zhang <li.zhang@cloud.ionos.com> wrote=
:
>
>> Hi Marc-Andr=C3=A9,
>>
>> By looking into chardev and yank_register_function logic,  this old
>> chardev is registered according to the chardev label.
>> So it's been in yank_instance_list. yank instance only has a chardev
>> label, and the new chardev's label is the same as the old chardev.
>> So it doesn't need to register it again when changing the chardev
>> backend. Otherwise, it will report  duplicated yank instances.
>> I think the chardev logic has no problems. And it works with yank
>> functions.
>>
>>
> The previous instance is being removed with yank_unregister_instance()
> during object_unparent(). The new instance is not registered.
>
> That scenario deserves tests. (it's a shame there are no tests for yank
> ...)
>
>
>
>> Thanks
>> Li
>>
>> On Mon, Mar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lureau <
>> marcandre.lureau@gmail.com> wrote:
>>
>>> Hi
>>>
>>> On Mon, Mar 15, 2021 at 9:22 PM Li Zhang <zhlcindy@gmail.com> wrote:
>>>
>>>> From: Li Zhang <li.zhang@cloud.ionos.com>
>>>>
>>>> When executing the QMP commands "chardev-change" to change the
>>>> backend device to socket, it will cause a segment fault because
>>>> it assumes chr->label as non-NULL in function yank_register_instance.
>>>> The function qmp_chardev_change calls chardev_new, which label
>>>> is NULL when creating a new chardev. The label will be passed to
>>>> yank_register_instance which causes a segment fault. The callchain
>>>> is as the following:
>>>>         chardev_new ->
>>>>             qemu_char_open ->
>>>>                 cc->open ->
>>>>                 qmp_chardev_open_socket ->
>>>>                     yank_register_instance
>>>>
>>>> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>>>> ---
>>>>  chardev/char-socket.c | 8 +++++---
>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>>>> index c8bced76b7..26d5172682 100644
>>>> --- a/chardev/char-socket.c
>>>> +++ b/chardev/char-socket.c
>>>> @@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev
>>>> *chr,
>>>>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>>>>      }
>>>>
>>>> -    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
>>>> errp)) {
>>>> -        return;
>>>> +    if (chr->label) {
>>>> +        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label)=
,
>>>> errp)) {
>>>> +            return;
>>>> +        }
>>>> +        s->registered_yank =3D true;
>>>>      }
>>>> -    s->registered_yank =3D true;
>>>>
>>>>      /* be isn't opened until we get a connection */
>>>>      *be_opened =3D false
>>>>
>>>
>>> Looks wrong to me, the new chardev will get the same label, and it
>>> should still be possible to call the yank functions then. The registrat=
ion
>>> logic needs to be reworked during chardev-change.
>>>
>>> --
>>> Marc-Andr=C3=A9 Lureau
>>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--0000000000004f1b5c05bda920b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Marc-Andr=C3=A9,</div><div><br></div><div>Hi =
Marc-Andr=C3=A9,</div><div><br></div><div>Ah, you are right.=C2=A0 For some=
 scenarios, it is not registered and registered for some scenarios.=C2=A0=
=C2=A0</div><div>If the previous chardev is not socket, it won&#39;t be reg=
istered either.=C2=A0</div><div>There are still problems.=C2=A0</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar =
16, 2021 at 4:25 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Mar 16, 2021 at 6:46 PM Li Zhang &lt;<a href=3D"mailto:li.=
zhang@cloud.ionos.com" target=3D"_blank">li.zhang@cloud.ionos.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Hi Marc-Andr=C3=A9,<div><br></div><div>By looking into chardev and=
 yank_register_function logic,=C2=A0 this old chardev is registered=C2=A0ac=
cording to the chardev label.=C2=A0</div><div>So it&#39;s been in=C2=A0yank=
_instance_list. yank instance only has a chardev label, and the new chardev=
&#39;s label is the same as the old chardev.</div><div>So it doesn&#39;t ne=
ed to register it again when changing the chardev backend. Otherwise, it wi=
ll report=C2=A0 duplicated yank instances.=C2=A0</div><div>I think the char=
dev logic has no problems. And it works with yank functions.=C2=A0</div><di=
v><br></div></div></blockquote><div><br></div><div>The previous instance is=
 being removed with yank_unregister_instance() during object_unparent(). Th=
e new instance is not registered.</div><div><br></div><div>That scenario de=
serves tests. (it&#39;s a shame there are no tests for yank ...)<br></div><=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div></div><div>Thanks</div><div>Li=C2=A0=C2=A0</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Mar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mail=
to:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 9:22 PM Li =
Zhang &lt;<a href=3D"mailto:zhlcindy@gmail.com" target=3D"_blank">zhlcindy@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com" t=
arget=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
<br>
When executing the QMP commands &quot;chardev-change&quot; to change the<br=
>
backend device to socket, it will cause a segment fault because<br>
it assumes chr-&gt;label as non-NULL in function yank_register_instance.<br=
>
The function qmp_chardev_change calls chardev_new, which label<br>
is NULL when creating a new chardev. The label will be passed to<br>
yank_register_instance which causes a segment fault. The callchain<br>
is as the following:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chardev_new -&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_char_open -&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;open -&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_chardev_open_so=
cket -&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_=
register_instance<br>
<br>
Signed-off-by: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com" tar=
get=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
---<br>
=C2=A0chardev/char-socket.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index c8bced76b7..26d5172682 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *chr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_set_feature(chr, QEMU_CHAR_FEATU=
RE_FD_PASS);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr-&gt;la=
bel), errp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 if (chr-&gt;label) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label), errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;registered_yank =3D true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 s-&gt;registered_yank =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* be isn&#39;t opened until we get a connection */<br>
=C2=A0 =C2=A0 =C2=A0*be_opened =3D false<br clear=3D"all"></blockquote><div=
><br></div><div>Looks wrong to me, the new chardev will get the same label,=
 and it should still be possible to call the yank functions then. The regis=
tration logic needs to be reworked during chardev-change.<br></div></div><b=
r>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div></div>

--0000000000004f1b5c05bda920b8--

