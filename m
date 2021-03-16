Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F133D755
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:27:44 +0100 (CET)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBbj-00015n-BB
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMBZG-0000It-LF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:25:10 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMBZD-0004yI-Uq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:25:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b16so9247696eds.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pzorjPCWcLubXFiOy8kMAn2giJo5L2lx5aTYtcvsXSE=;
 b=O+uF1AHenwb5YY6b57qikFX344ozm1bI1kgfilVM8wHJbkq3mtU4wJgvFrxOL+9Hfm
 AqmKxRoDljnoJXrHtrrEoI9XYxZP/Dl4uH4KP7MCvq9h2mHPqm6l9HY3krDwGDnzzJ8H
 vVNdJc87ugEeUCfJnRouPKbp4Ef+Bp36MV9u6rRNYiXEpUQozJlewLEUzcbrr/YPMYDR
 /tDLFe2cY/Awb5XSIK54moGGStgkZEF1S7TLGWKFuMBMBxewZcra4UxU5napZ3fO+frr
 IUa9bvUNeVIJR9oYfxKEA90I2DMg9nTwrzyWimBmGBbOLLXP6UNouCvun4CxEBJ9PMQR
 GEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzorjPCWcLubXFiOy8kMAn2giJo5L2lx5aTYtcvsXSE=;
 b=osevIwd6T0dldp+wG0RS8FPzj+UW/TD3/G7gMOVYrWp+5zEJo+42m2gfLXenZrA9bZ
 DPt4O76Pa4Ubax+ZgeunrgReOwOow+6xM8145ua9P5PJ7N6uTJ1V+adh+Lx9hUaRO7wa
 kYVfgGKfaZNCUBWw3VPTlw4yRSEyw36G6kukJgLd6epBzQwnGs9RZ7CN5p2Av7Z05zL7
 JuBKNpoxXRZPToXf9T8Kn2QmsX2++UUKWo7Z5HzxIK47/mLRdSbN5IbzS9L+Xq8cnIcQ
 ukZdr5ugg3qjLZU5CBKJjX7U4JVut2uYdZPKAoYlGKbunM23dxylRBXCaoZNjXDRFifc
 c64w==
X-Gm-Message-State: AOAM533QYOf9aBnwBXEyv5OJTUvtuMKk7fHVfLhBKNcAaIqOXYYDYRUr
 08Atjv+L9H9sNycB/NT/c09f9XSvNvdkCBEu9lk=
X-Google-Smtp-Source: ABdhPJxjiTrvVGyHS2haq3gz1r6U5nV2yFaVrCKYUFdpKuy40CirNQOTSDfXYfMqRIHB37XTFuREufwKXNe7sUcT+z8=
X-Received: by 2002:aa7:dbd3:: with SMTP id v19mr36346287edt.314.1615908306398; 
 Tue, 16 Mar 2021 08:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
 <CAEM4iGGmwDToV04dcUczAVcVHAQREc-Th6e=qDsT4kp9ozM2XQ@mail.gmail.com>
In-Reply-To: <CAEM4iGGmwDToV04dcUczAVcVHAQREc-Th6e=qDsT4kp9ozM2XQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Mar 2021 19:24:54 +0400
Message-ID: <CAJ+F1CJway2T9q-hHPhV1_37TLkUB=FV-5HA2+F4vm-kY=DdTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
To: Li Zhang <li.zhang@cloud.ionos.com>
Content-Type: multipart/alternative; boundary="00000000000097af9305bda8f806"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000097af9305bda8f806
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 16, 2021 at 6:46 PM Li Zhang <li.zhang@cloud.ionos.com> wrote:

> Hi Marc-Andr=C3=A9,
>
> By looking into chardev and yank_register_function logic,  this old
> chardev is registered according to the chardev label.
> So it's been in yank_instance_list. yank instance only has a chardev
> label, and the new chardev's label is the same as the old chardev.
> So it doesn't need to register it again when changing the chardev backend=
.
> Otherwise, it will report  duplicated yank instances.
> I think the chardev logic has no problems. And it works with yank
> functions.
>
>
The previous instance is being removed with yank_unregister_instance()
during object_unparent(). The new instance is not registered.

That scenario deserves tests. (it's a shame there are no tests for yank ...=
)



> Thanks
> Li
>
> On Mon, Mar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
>
>> Hi
>>
>> On Mon, Mar 15, 2021 at 9:22 PM Li Zhang <zhlcindy@gmail.com> wrote:
>>
>>> From: Li Zhang <li.zhang@cloud.ionos.com>
>>>
>>> When executing the QMP commands "chardev-change" to change the
>>> backend device to socket, it will cause a segment fault because
>>> it assumes chr->label as non-NULL in function yank_register_instance.
>>> The function qmp_chardev_change calls chardev_new, which label
>>> is NULL when creating a new chardev. The label will be passed to
>>> yank_register_instance which causes a segment fault. The callchain
>>> is as the following:
>>>         chardev_new ->
>>>             qemu_char_open ->
>>>                 cc->open ->
>>>                 qmp_chardev_open_socket ->
>>>                     yank_register_instance
>>>
>>> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>>> ---
>>>  chardev/char-socket.c | 8 +++++---
>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>>> index c8bced76b7..26d5172682 100644
>>> --- a/chardev/char-socket.c
>>> +++ b/chardev/char-socket.c
>>> @@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *ch=
r,
>>>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>>>      }
>>>
>>> -    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
>>> errp)) {
>>> -        return;
>>> +    if (chr->label) {
>>> +        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
>>> errp)) {
>>> +            return;
>>> +        }
>>> +        s->registered_yank =3D true;
>>>      }
>>> -    s->registered_yank =3D true;
>>>
>>>      /* be isn't opened until we get a connection */
>>>      *be_opened =3D false
>>>
>>
>> Looks wrong to me, the new chardev will get the same label, and it shoul=
d
>> still be possible to call the yank functions then. The registration logi=
c
>> needs to be reworked during chardev-change.
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000097af9305bda8f806
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 16, 2021 at 6:46 PM Li =
Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com">li.zhang@cloud.ionos.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hi Marc-Andr=C3=A9,<div><br></div><div>By looking into =
chardev and yank_register_function logic,=C2=A0 this old chardev is registe=
red=C2=A0according to the chardev label.=C2=A0</div><div>So it&#39;s been i=
n=C2=A0yank_instance_list. yank instance only has a chardev label, and the =
new chardev&#39;s label is the same as the old chardev.</div><div>So it doe=
sn&#39;t need to register it again when changing the chardev backend. Other=
wise, it will report=C2=A0 duplicated yank instances.=C2=A0</div><div>I thi=
nk the chardev logic has no problems. And it works with yank functions.=C2=
=A0</div><div><br></div></div></blockquote><div><br></div><div>The previous=
 instance is being removed with yank_unregister_instance() during object_un=
parent(). The new instance is not registered.</div><div><br></div><div>That=
 scenario deserves tests. (it&#39;s a shame there are no tests for yank ...=
)<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div></div><div>Thanks</div><div>Li=C2=
=A0=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lureau &lt;=
<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.l=
ureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 15, 2021=
 at 9:22 PM Li Zhang &lt;<a href=3D"mailto:zhlcindy@gmail.com" target=3D"_b=
lank">zhlcindy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud=
.ionos.com" target=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000097af9305bda8f806--

