Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910835086CE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:19:32 +0200 (CEST)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8Mt-0002dB-JS
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nh8L6-0000TX-9Z
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nh8L4-0006Bl-7S
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650453457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WIElod5gheGrWa9eg7HJ0J1AsMWnEhrBpoW7KVTweCk=;
 b=T/rWUbN41Y7DYtAeg5VO51QYs8e/EWxjR83sJvHcqU5Sqs5rz9Y5Q+VrKkYCDPHeUE7XMH
 kRK4rBYJVJ6wp2kGJrC4JNv+oy2wakrJVmUFN/Hta1wiLz2fm4g8CbXQ6OWWfGU+uLeIPD
 Jyge01qzjgg2LKf/MMBrUYMzkD2krYQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-z5CWvKb7O_6o-kSC2uvwig-1; Wed, 20 Apr 2022 07:17:35 -0400
X-MC-Unique: z5CWvKb7O_6o-kSC2uvwig-1
Received: by mail-yb1-f200.google.com with SMTP id
 s43-20020a25aa2e000000b006453e8e5bb8so1142695ybi.14
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 04:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WIElod5gheGrWa9eg7HJ0J1AsMWnEhrBpoW7KVTweCk=;
 b=v5YWQ3xwx6jryG5jnChiJGsakScUJf0Ffjrio2dH1H616AP2jofD+7QHn7dqYmnSfd
 z54Yd1qbInB6ERBSCW5QjB3c0ifT14ZVavTdhtuZpvUCarl0doDz1BSXxqo7xF97WZZm
 Sr43OvZ7Hp9NU4nGOqhDSvmrmPn3wTWlDmr6QtrO9q74Ao7u9VJ3tSgcjpsSyCQFmNJq
 EdgHz9wvUEsT6zPVKc3P1euT47JKSXQT+942nLYpwsYlqGQtfAtXorKW/SVj7/wrGzGj
 OCQSbBFF3H4f20mw0mkCVI0QWeVwhMD1FBWJvNJQh9ymZ9dvAPjUlTaPy8wNiM04bOKC
 7PkA==
X-Gm-Message-State: AOAM5316IG4lRk3Z24t2wv3GH+XNlsHcZhSixTfntBZMAwYqN0WNCQkJ
 9PmcE4wmCYFdEKba+ese3FAkwFEEZgJ//3eqTW4rxZfLPi02KnCdE52VlqvPpVKJqSvof6hrD9S
 g1MND7v7b5jhmo6xx63Cy2o05+sBK5zg=
X-Received: by 2002:a05:6902:286:b0:63d:d035:73f4 with SMTP id
 v6-20020a056902028600b0063dd03573f4mr18609052ybh.205.1650453455272; 
 Wed, 20 Apr 2022 04:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwySvR8xf6rpZG4PYXtJ7KFs8blc7QVQTZgUzG7HEzeONHMp/z4hyOZw3nzr2hhD2Pa9wTEZFK8BWzH6Vm5rFE=
X-Received: by 2002:a05:6902:286:b0:63d:d035:73f4 with SMTP id
 v6-20020a056902028600b0063dd03573f4mr18609039ybh.205.1650453455078; Wed, 20
 Apr 2022 04:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
 <CAJ+F1CLuCGTequPCD8ZK08bu3zdo6rdN1UBNX7AXO-s16fVQog@mail.gmail.com>
In-Reply-To: <CAJ+F1CLuCGTequPCD8ZK08bu3zdo6rdN1UBNX7AXO-s16fVQog@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 20 Apr 2022 14:17:24 +0300
Message-ID: <CAPMcbCqP8zkpHX9Zg8Y4v1AdOSGb5seiuCYqt5S4HhZpe8SE8Q@mail.gmail.com>
Subject: Re: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
To: Helge Konetzka <hk@zapateado.de>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e89bed05dd1423bc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e89bed05dd1423bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge,

I checked what happened in MSYS2 and this looks like a bug in the widl tool=
.

I looked into the widl source code and think that it detects the default
include path incorrectly.

During build of widl tool the corresponding variable receive incorrect
value:
`BIN_TO_INCLUDEDIR =3D ../x86_64-w64-mingw32/include` but should be
`BIN_TO_INCLUDEDIR =3D ../include`. Looks like a package mismatch,
because the `/ming64/x86_64-w64-mingw32` directory exist
but contains only few libs and no any include files.

So I agreed with Marc-Andr=C3=A9. I think this bug should be fixed in MSYS2=
.
I think you can report this issue there
https://github.com/msys2/MINGW-packages/issues

When I checked the build using cross-compilation from Linux,
the widl tool uses proper BIN_TO_INCLUDEDIR.

We should add the rule that qga_vss depends on gen_tlb to get this error
more visible.

Marc-Andr=C3=A9, what do you think?

Best Regards,
Konstantin Kostiuk.


On Mon, Apr 18, 2022 at 11:15 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi Helge
>
> On Sun, Apr 17, 2022 at 6:51 PM Helge Konetzka <hk@zapateado.de> wrote:
>
>> Generation with widl needs to be triggered explicitly and requires
>> library and include directories containing referenced *.idl and *.tlb
>> as parameters.
>>
>
> Ok, that's different issues, it would help to split the patch.
>
>
>>
>> Signed-off-by: Helge Konetzka <hk@zapateado.de>
>> ---
>>
>> For tested Msys2 build all referenced resources reside in /<usr>/include=
.
>> Msys2 provides its flavours in different /<usr> bases.
>>
>> This patch derives the missing include directory path from widl path.
>> Assuming the given widl path is /<usr>/bin/widl, it determines /<usr>
>> as base and appends /<usr>/include as include and library directories
>> to widl command. This way the directory is correct for any Msys2
>> flavour.
>> It makes sure, only existing directories are appended as parameter.
>>
>
> I would file a bug to msys2 instead for widl to use the default include
> directory. Otherwise, every widl user out there needs to be adjusted.
> (I think it would need a special --with-widl-includedir=3DDIR, given how
> msys2 remaps directory)
>
>
>> ---
>>   qga/vss-win32/meson.build | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
>> index 71c50d0866..51539a582c 100644
>> --- a/qga/vss-win32/meson.build
>> +++ b/qga/vss-win32/meson.build
>> @@ -30,9 +30,16 @@ if midl.found()
>>                             input: 'qga-vss.idl',
>>                             output: 'qga-vss.tlb',
>>                             command: [midl, '@INPUT@', '/tlb', '@OUTPUT@
>> '])
>> -else
>> +elif widl.found()
>> +  widl_cmd =3D [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
>> +  usr_include =3D fs.parent(fs.parent(widl.full_path()))/'include'
>> +  if fs.is_dir(usr_include)
>> +    widl_cmd +=3D ['-L', usr_include]
>> +    widl_cmd +=3D ['-I', usr_include]
>> +  endif
>>     gen_tlb =3D custom_target('gen-tlb',
>>                             input: 'qga-vss.idl',
>>                             output: 'qga-vss.tlb',
>> -                          command: [widl, '-t', '@INPUT@', '-o',
>> '@OUTPUT@'])
>> +                          build_by_default: true,
>>
>
> I would make qga_vss depend on gen_tlb instead (so the tlb is always buil=
t
> with the dll)
>
> thanks
>
> --
> Marc-Andr=C3=A9 Lureau
>

--000000000000e89bed05dd1423bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Helge,</div><div><br></div><div>I checked what hap=
pened in MSYS2 and this looks like a bug in the widl tool.<br><br>I looked =
into the widl source code and think that it detects the default include pat=
h incorrectly. <br><br>During build of widl tool the corresponding variable=
 receive incorrect value: <br></div><div>`BIN_TO_INCLUDEDIR =3D ../x86_64-w=
64-mingw32/include` but should be <br></div><div>`BIN_TO_INCLUDEDIR =3D ../=
include`. Looks like a package mismatch, <br></div><div>because the `/ming6=
4/x86_64-w64-mingw32` directory exist <br></div><div>but contains only few =
libs and no any include files.<br><br>So I agreed with Marc-Andr=C3=A9. I t=
hink this bug should be fixed in MSYS2.</div><div>I think you can report th=
is issue there <a href=3D"https://github.com/msys2/MINGW-packages/issues">h=
ttps://github.com/msys2/MINGW-packages/issues</a></div><div><br>When I chec=
ked the build using cross-compilation from Linux, <br></div><div>the widl t=
ool uses proper BIN_TO_INCLUDEDIR.<br><br>We should add the rule that qga_v=
ss depends on gen_tlb to get this error more visible.</div><div><br></div><=
div>Marc-Andr=C3=A9, what do you think?<br></div><div><br></div><div><div><=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</d=
iv></div></div></div><br></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 18, 2022 at 11:15 AM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Helge<br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Ap=
r 17, 2022 at 6:51 PM Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de"=
 target=3D"_blank">hk@zapateado.de</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Generation with widl needs to be triggere=
d explicitly and requires<br>
library and include directories containing referenced *.idl and *.tlb<br>
as parameters.<br></blockquote><div><br></div><div>Ok, that&#39;s different=
 issues, it would help to split the patch.</div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br>
---<br>
<br>
For tested Msys2 build all referenced resources reside in /&lt;usr&gt;/incl=
ude.<br>
Msys2 provides its flavours in different /&lt;usr&gt; bases.<br>
<br>
This patch derives the missing include directory path from widl path.<br>
Assuming the given widl path is /&lt;usr&gt;/bin/widl, it determines /&lt;u=
sr&gt;<br>
as base and appends /&lt;usr&gt;/include as include and library directories=
<br>
to widl command. This way the directory is correct for any Msys2<br>
flavour.<br>
It makes sure, only existing directories are appended as parameter.<br></bl=
ockquote><div><br></div><div>I would file a bug to msys2 instead for widl t=
o use the default include directory. Otherwise, every widl user out there n=
eeds to be adjusted.<br></div><div>(I think it would need a special --with-=
widl-includedir=3DDIR, given how msys2 remaps directory)</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
---<br>
=C2=A0 qga/vss-win32/meson.build | 11 +++++++++--<br>
=C2=A0 1 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 71c50d0866..51539a582c 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -30,9 +30,16 @@ if midl.found()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 command: [midl, &#39;@INPUT@&#39;, &#39;/tlb&#39;,=
 &#39;@OUTPUT@&#39;])<br>
-else<br>
+elif widl.found()<br>
+=C2=A0 widl_cmd =3D [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, =
&#39;@OUTPUT@&#39;]<br>
+=C2=A0 usr_include =3D fs.parent(fs.parent(widl.full_path()))/&#39;include=
&#39;<br>
+=C2=A0 if fs.is_dir(usr_include)<br>
+=C2=A0 =C2=A0 widl_cmd +=3D [&#39;-L&#39;, usr_include]<br>
+=C2=A0 =C2=A0 widl_cmd +=3D [&#39;-I&#39;, usr_include]<br>
+=C2=A0 endif<br>
=C2=A0 =C2=A0 gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&=
#39;, <br>
&#39;@OUTPUT@&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 build_by_default: true,<br></blockquote><div><br></div><d=
iv>I would make qga_vss depend on gen_tlb instead (so the tlb is always bui=
lt with the dll)<br></div></div><div><br></div><div>thanks<br></div><br>-- =
<br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>
</blockquote></div>

--000000000000e89bed05dd1423bc--


