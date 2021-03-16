Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4734833D119
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:47:28 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6IR-0000P1-3X
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1lM6H2-00085e-8v
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:46:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1lM6Gz-0005G9-Mr
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:45:59 -0400
Received: by mail-ej1-x62d.google.com with SMTP id r17so70997829ejy.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gizOkCwnXiwAx0IJ8ap7dEf9M/Lsj58frrrUSSkFs+g=;
 b=YtZa++f57i0DmpngL9kIuoaJgrOZPUde92hNzNtxpXp0eenyKLq3yzByKdV8SX/9Du
 2KY1SlOMhvtD/V80JFDfjtQl9ebHX3iBrSvHHdCXNKb1/8+U7+KhiLuEcgev8knLXH0q
 qLz1n+xtjikXdu7QbEDtE29Dtti8KUo2Q8aFR4/t6SYNHGBM6ENgyhUNiVEWCLSceR5b
 MmaLJYndbxN3+aUh/ta7ejcEWKt3z9DOOaugaA/qgend7cUU2/xGurCJLJiHGjh855Xu
 5wAPRoPNCsEb7A2T9dWDKo+aaOKr6QbJwhvxmU67PiqwAIalk7c2SI3HFel4Gb3OJ40B
 N8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gizOkCwnXiwAx0IJ8ap7dEf9M/Lsj58frrrUSSkFs+g=;
 b=uI/kRwFx6XE3iQFh3BbOMhb+7LonbnWu+F02p4/nUlxs52mJ3NNjexibLN2NkbKwIw
 4sgGUHX3poYJmO8E2k08SfDKLzI9M9FQnYx24BKfRa+WgpZrPbyiQC2o9Ct7hT/dAHOr
 beD8NWaFidOtsG9Lrmyi5+hVIuKPmUIXduRmSIT9iBEF8i4C7HW8sBWZUU9aZp4BGAPY
 L4CwHn3n2UF2GxU4zU7ZwE9jwr2g6viavBfmUSfOYwy8PUcU3O2UBjmeKgJF9XWe+7XR
 DSo5AnmG8mnsYuI3W3sYz7GfD1YiLlbQTG7fxCOA0KVGXXRJlBdX2j8rREG9j4gd4SsM
 TJFg==
X-Gm-Message-State: AOAM530viwgrYb91pR7hWiRis9EW88+M70JJn2C0ARVr5zyD459CTO60
 J2CLusbDftesViTfCPvThTm/VaHauJqQ3+G9GxVghA==
X-Google-Smtp-Source: ABdhPJxcQS5x6s8d5Y/YZ4GaH4GSgX6fMJWs9gr6Wqpn5DpXxoa8fhmAws++2Isgvfp9ny31nd1AiSi6UC0nTsSM5Vg=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr28761426ejc.105.1615887955711; 
 Tue, 16 Mar 2021 02:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
From: Li Zhang <li.zhang@cloud.ionos.com>
Date: Tue, 16 Mar 2021 10:45:45 +0100
Message-ID: <CAEM4iGEEwdmqoDdxmOZMEEvM-_CNQb8YzNJ7dduSbDX7=hFUPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000098ee8f05bda43b2d"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=li.zhang@cloud.ionos.com; helo=mail-ej1-x62d.google.com
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

--00000000000098ee8f05bda43b2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

The new chardev can get the same label. It is assigned after the function

ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                  Error **errp)
{
     .....
     chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
                          backend, chr->gcontext, errp);
    if (!chr_new) {
        return NULL;
    }
    chr_new->label =3D g_strdup(id);
    if (chr->be_open && !chr_new->be_open) {
        qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
        closed_sent =3D true;
    }

    chr->be =3D NULL;
    qemu_chr_fe_init(be, chr_new, &error_abort);
       .....
}

It passes parameter NULL in chardev_new, I think it may be because the old
chardev isn't released yet.
It will cause duplicated problems. I need to consider this logic to see if
it can be changed.

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

--00000000000098ee8f05bda43b2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Marc-Andr=C3=A9,=C2=A0<div><br></div><div>The new =
chardev can get the same label. It is assigned after the function=C2=A0=C2=
=A0</div><div>=C2=A0</div><div>ChardevReturn *qmp_chardev_change(const char=
 *id, ChardevBackend *backend,</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Error **errp)<br>{<div>=C2=A0 =C2=A0 =C2=A0.....<br><div>=C2=A0 =C2=
=A0 =C2=A0chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(=
cc)),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 backend, chr-&gt;gcontext, errp);<br>=C2=A0 =C2=A0=
 if (!chr_new) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>=C2=A0 =C2=
=A0 }<br>=C2=A0 =C2=A0 chr_new-&gt;label =3D g_strdup(id);<br></div></div><=
div>=C2=A0 =C2=A0 if (chr-&gt;be_open &amp;&amp; !chr_new-&gt;be_open) {<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_event(chr, CHR_EVENT_CLOSED);<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 closed_sent =3D true;<br>=C2=A0 =C2=A0 }<br><br=
>=C2=A0 =C2=A0 chr-&gt;be =3D NULL;<br>=C2=A0 =C2=A0 qemu_chr_fe_init(be, c=
hr_new, &amp;error_abort);<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0.....</=
div><div>}</div><div><br></div><div>It passes parameter NULL in chardev_new=
, I think it may be because the old chardev isn&#39;t released yet.=C2=A0</=
div><div>It will cause duplicated problems. I need to consider this logic t=
o see if it can be changed.=C2=A0</div><div><br></div><div>Thanks</div><div=
>Li</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 7:51 PM Marc-Andr=C3=A9 Lur=
eau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 9:22 P=
M Li Zhang &lt;<a href=3D"mailto:zhlcindy@gmail.com" target=3D"_blank">zhlc=
indy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com=
" target=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
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

--00000000000098ee8f05bda43b2d--

