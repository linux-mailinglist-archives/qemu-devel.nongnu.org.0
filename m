Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A033D626
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:51:12 +0100 (CET)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMB2N-0000zJ-4p
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1lMAyP-0005tF-Dl
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:47:05 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1lMAyK-0007Bh-LA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:47:04 -0400
Received: by mail-ej1-x633.google.com with SMTP id p7so61286663eju.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5f9u944MQbSEWJBImNdcHfjetpII+YrdudOUKPpv/Kk=;
 b=I+j700pSIZCzAv/DfklDDPuLPMz3vJyYXe4FkKO1Dty9OgD4I8sOF4xPKhEEzNuISk
 FdlKt9euyGEwohfArM/+R7QKXf0CXouZzR1BITIbDB0cdYAZ2RRs9fEgSaYr7GEv2VFT
 8HP1JylTAnJtkRKY1W0SUSYRaQ+IK9ubiVfdVbdq1rUJKYNKlMnxBNtF3ibnlILjlbtN
 cCLhDNBqfPgwhWMI0A/UzWnDipsmbXazUwWBAj3h5KG0VIZqpUM3GvrBY40vOASvOyvV
 1m5RzHZq8/RmJeklbYhiFrIGPh6QVbyaNBak0RkfjH7J9KlCetQ5WZ2YRRsVblVYLq6X
 fwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5f9u944MQbSEWJBImNdcHfjetpII+YrdudOUKPpv/Kk=;
 b=F4FKTl8drsgB4jGS3GgVb9CohzZxE+f1I5p4rSVewAYOokX/7LLmLNqUj4NKsmgqx3
 P5jNG0orMXcnNypW5b1BZEvJAagZp2pDrz83hCW1Uc7m/K2xXqffEj+iBWkUGGIg6yFB
 BGib7AEUTqax9iMLPvY3bQUIVGqdcT6bggKeSRJWlBdo2Q6WC/KB39HxDKn/YIMADLH7
 xmH0h1M560do1Jg3Zj3DLvxnVdfPeob3Hzp2ArgOCqModHKu6y7YEN1AjI/pjitvhHTJ
 ApJHyDb7xCzFHgjdjY+r2oVVSXufjJI0ltsi59BUlZA9SwRz3w4+qR62WSNgmoZ2ZX8D
 BIbQ==
X-Gm-Message-State: AOAM533Hpq2KQQLWYeoMvVKQLWbDazGaPaD01rmNRH0NaxS5LNoHCP4B
 4Xc0bwJeIceN/PcYxKRpMVBrM132zG5qliX89oGuTw==
X-Google-Smtp-Source: ABdhPJwnOwc81Bbv0X4Ca9DknOPXX250TR50tvz0RctvD61heQqV6ikBnqbVvDKRfAwlOvVHj/Z+VrNEwfwa/Uw6BvE=
X-Received: by 2002:a17:906:fcb2:: with SMTP id
 qw18mr29276942ejb.434.1615906017567; 
 Tue, 16 Mar 2021 07:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
From: Li Zhang <li.zhang@cloud.ionos.com>
Date: Tue, 16 Mar 2021 15:46:47 +0100
Message-ID: <CAEM4iGGmwDToV04dcUczAVcVHAQREc-Th6e=qDsT4kp9ozM2XQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002afb7805bda870de"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=li.zhang@cloud.ionos.com; helo=mail-ej1-x633.google.com
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

--0000000000002afb7805bda870de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

By looking into chardev and yank_register_function logic,  this old chardev
is registered according to the chardev label.
So it's been in yank_instance_list. yank instance only has a chardev label,
and the new chardev's label is the same as the old chardev.
So it doesn't need to register it again when changing the chardev backend.
Otherwise, it will report  duplicated yank instances.
I think the chardev logic has no problems. And it works with yank
functions.

Thanks
Li

On Mon, Mar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Mon, Mar 15, 2021 at 9:22 PM Li Zhang <zhlcindy@gmail.com> wrote:
>
>> From: Li Zhang <li.zhang@cloud.ionos.com>
>>
>> When executing the QMP commands "chardev-change" to change the
>> backend device to socket, it will cause a segment fault because
>> it assumes chr->label as non-NULL in function yank_register_instance.
>> The function qmp_chardev_change calls chardev_new, which label
>> is NULL when creating a new chardev. The label will be passed to
>> yank_register_instance which causes a segment fault. The callchain
>> is as the following:
>>         chardev_new ->
>>             qemu_char_open ->
>>                 cc->open ->
>>                 qmp_chardev_open_socket ->
>>                     yank_register_instance
>>
>> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>> ---
>>  chardev/char-socket.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index c8bced76b7..26d5172682 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *chr=
,
>>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>>      }
>>
>> -    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
>> errp)) {
>> -        return;
>> +    if (chr->label) {
>> +        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
>> errp)) {
>> +            return;
>> +        }
>> +        s->registered_yank =3D true;
>>      }
>> -    s->registered_yank =3D true;
>>
>>      /* be isn't opened until we get a connection */
>>      *be_opened =3D false
>>
>
> Looks wrong to me, the new chardev will get the same label, and it should
> still be possible to call the yank functions then. The registration logic
> needs to be reworked during chardev-change.
>
> --
> Marc-Andr=C3=A9 Lureau
>

--0000000000002afb7805bda870de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Marc-Andr=C3=A9,<div><br></div><div>By looking into cha=
rdev and yank_register_function logic,=C2=A0 this old chardev is registered=
=C2=A0according to the chardev label.=C2=A0</div><div>So it&#39;s been in=
=C2=A0yank_instance_list. yank instance only has a chardev label, and the n=
ew chardev&#39;s label is the same as the old chardev.</div><div>So it does=
n&#39;t need to register it again when changing the chardev backend. Otherw=
ise, it will report=C2=A0 duplicated yank instances.=C2=A0</div><div>I thin=
k the chardev logic has no problems. And it works with yank functions.=C2=
=A0</div><div><br></div><div>Thanks</div><div>Li=C2=A0=C2=A0</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, M=
ar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Mar 15, 2021 at 9:22 PM Li Zhang &lt;<a href=3D"mailto:=
zhlcindy@gmail.com" target=3D"_blank">zhlcindy@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Li Zhang &lt;=
<a href=3D"mailto:li.zhang@cloud.ionos.com" target=3D"_blank">li.zhang@clou=
d.ionos.com</a>&gt;<br>
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

--0000000000002afb7805bda870de--

