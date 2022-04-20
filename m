Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3503508832
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:32:23 +0200 (CEST)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9VO-0007kp-Jq
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nh9Qj-0005uU-9Y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:27:33 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nh9Qh-0001Eb-4y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:27:32 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id e17so1161863qvj.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZX5LjVwYCDlGy2SGO2Rsv7XhSEfyUdbHEDmDRq5eSzs=;
 b=m/QlEpcl/XKtEaEkuAFr5fMkdpvNlmKZxb9yA+2fGsE2hRebMciMixhuhiIN0Is5+Q
 npDDY5bmCIDWDXi6V23BsMtJoMjXMpS8th2NEmhueVzr7vgqylTpO3zLDrKKuUkQdvjG
 X7ADaeG1VsViU3QjiysMsBavWTyflSvs9xWTrbs6ymOB+DNhfrQ1MwDtpPMAAQqdu3IO
 dX48b1TbQOhBPr9r7z8mDtF6eEuxJbYozo3LMB0GHRdyTOwlZOmcVBaHAf2ZGPobNzeH
 f0IiCmqRDctfJelwIxVM6N5DXaMSpsuqCqZuEll49Sh0oEXB2LGLpA2K+dIE4LdfpPt3
 N/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZX5LjVwYCDlGy2SGO2Rsv7XhSEfyUdbHEDmDRq5eSzs=;
 b=VSUAAlnLdazKIToEFM7gZKqtdoZh+UudhFJv7ZrTRtx7VJzk22GrhcTbsiu/uDYrHS
 z+WwDYJWT1fHl1j8ovzgS0/XYNE5B7nWiVDoblAVPlqf9jol8djybGB3D1nNB5OWcvZp
 gkcUlf8O8XGFd6Cvy1Nu5lh1tvGsTgbFl8K1sHOe5tj6OJXShzmSR8GSXznfovHQmlFR
 fozxIa6Kyie3iNesNIKljA0Ti7Ntf9mr/0Q/1UHbxvoXC/m6SvdRP2pHHgoCo76GgTln
 v8Tr447DWLsF4TeL7IUrAYgeNS3qYG5MBzTACqjjKmBDkua70eKBPBCjBLagxGaeCCcn
 Tddw==
X-Gm-Message-State: AOAM531uhYa/7vUiiFMUTwLWGDoJZaJKvfmDi38VXP5iTyuTQnxvbVoI
 KCAf/r8sbbE4yjkgI0C/1+RWOXrngfCTZVPiqxI=
X-Google-Smtp-Source: ABdhPJx8GCeS8/CTDo2kXDlJWqRIsTyCORIJiMCGboLYm7Gl7TCWa+IDrXfCdpCLpWgRegXE2I8OOhm/6q6kKaJmO68=
X-Received: by 2002:ad4:5642:0:b0:444:47e1:b244 with SMTP id
 bl2-20020ad45642000000b0044447e1b244mr15130205qvb.4.1650457650075; Wed, 20
 Apr 2022 05:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
 <CAJ+F1CLuCGTequPCD8ZK08bu3zdo6rdN1UBNX7AXO-s16fVQog@mail.gmail.com>
 <CAPMcbCqP8zkpHX9Zg8Y4v1AdOSGb5seiuCYqt5S4HhZpe8SE8Q@mail.gmail.com>
In-Reply-To: <CAPMcbCqP8zkpHX9Zg8Y4v1AdOSGb5seiuCYqt5S4HhZpe8SE8Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 16:27:18 +0400
Message-ID: <CAJ+F1C+uQUjSvndrwNbHv354Qt4BCUB4hDZyNerNfD7pc_fdiw@mail.gmail.com>
Subject: Re: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f31d0605dd151d6a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Helge Konetzka <hk@zapateado.de>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f31d0605dd151d6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 3:17 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Hi Helge,
>
> I checked what happened in MSYS2 and this looks like a bug in the widl
> tool.
>
> I looked into the widl source code and think that it detects the default
> include path incorrectly.
>
> During build of widl tool the corresponding variable receive incorrect
> value:
> `BIN_TO_INCLUDEDIR =3D ../x86_64-w64-mingw32/include` but should be
> `BIN_TO_INCLUDEDIR =3D ../include`. Looks like a package mismatch,
> because the `/ming64/x86_64-w64-mingw32` directory exist
> but contains only few libs and no any include files.
>
> So I agreed with Marc-Andr=C3=A9. I think this bug should be fixed in MSY=
S2.
> I think you can report this issue there
> https://github.com/msys2/MINGW-packages/issues
>
>
Thanks for the investigation and your comment on the msys2 issue:
https://github.com/msys2/MINGW-packages/issues/11520

When I checked the build using cross-compilation from Linux,
> the widl tool uses proper BIN_TO_INCLUDEDIR.
>
> We should add the rule that qga_vss depends on gen_tlb to get this error
> more visible.
>
> Marc-Andr=C3=A9, what do you think?
>
>
yes, that's what I suggested earlier

thanks


> Best Regards,
> Konstantin Kostiuk.
>
>
> On Mon, Apr 18, 2022 at 11:15 AM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
>
>> Hi Helge
>>
>> On Sun, Apr 17, 2022 at 6:51 PM Helge Konetzka <hk@zapateado.de> wrote:
>>
>>> Generation with widl needs to be triggered explicitly and requires
>>> library and include directories containing referenced *.idl and *.tlb
>>> as parameters.
>>>
>>
>> Ok, that's different issues, it would help to split the patch.
>>
>>
>>>
>>> Signed-off-by: Helge Konetzka <hk@zapateado.de>
>>> ---
>>>
>>> For tested Msys2 build all referenced resources reside in /<usr>/includ=
e.
>>> Msys2 provides its flavours in different /<usr> bases.
>>>
>>> This patch derives the missing include directory path from widl path.
>>> Assuming the given widl path is /<usr>/bin/widl, it determines /<usr>
>>> as base and appends /<usr>/include as include and library directories
>>> to widl command. This way the directory is correct for any Msys2
>>> flavour.
>>> It makes sure, only existing directories are appended as parameter.
>>>
>>
>> I would file a bug to msys2 instead for widl to use the default include
>> directory. Otherwise, every widl user out there needs to be adjusted.
>> (I think it would need a special --with-widl-includedir=3DDIR, given how
>> msys2 remaps directory)
>>
>>
>>> ---
>>>   qga/vss-win32/meson.build | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
>>> index 71c50d0866..51539a582c 100644
>>> --- a/qga/vss-win32/meson.build
>>> +++ b/qga/vss-win32/meson.build
>>> @@ -30,9 +30,16 @@ if midl.found()
>>>                             input: 'qga-vss.idl',
>>>                             output: 'qga-vss.tlb',
>>>                             command: [midl, '@INPUT@', '/tlb', '@OUTPUT=
@
>>> '])
>>> -else
>>> +elif widl.found()
>>> +  widl_cmd =3D [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
>>> +  usr_include =3D fs.parent(fs.parent(widl.full_path()))/'include'
>>> +  if fs.is_dir(usr_include)
>>> +    widl_cmd +=3D ['-L', usr_include]
>>> +    widl_cmd +=3D ['-I', usr_include]
>>> +  endif
>>>     gen_tlb =3D custom_target('gen-tlb',
>>>                             input: 'qga-vss.idl',
>>>                             output: 'qga-vss.tlb',
>>> -                          command: [widl, '-t', '@INPUT@', '-o',
>>> '@OUTPUT@'])
>>> +                          build_by_default: true,
>>>
>>
>> I would make qga_vss depend on gen_tlb instead (so the tlb is always
>> built with the dll)
>>
>> thanks
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f31d0605dd151d6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 3:17 PM Kon=
stantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hi Helge,</div><div><br></div><div>I checked what =
happened in MSYS2 and this looks like a bug in the widl tool.<br><br>I look=
ed into the widl source code and think that it detects the default include =
path incorrectly. <br><br>During build of widl tool the corresponding varia=
ble receive incorrect value: <br></div><div>`BIN_TO_INCLUDEDIR =3D ../x86_6=
4-w64-mingw32/include` but should be <br></div><div>`BIN_TO_INCLUDEDIR =3D =
../include`. Looks like a package mismatch, <br></div><div>because the `/mi=
ng64/x86_64-w64-mingw32` directory exist <br></div><div>but contains only f=
ew libs and no any include files.<br><br>So I agreed with Marc-Andr=C3=A9. =
I think this bug should be fixed in MSYS2.</div><div>I think you can report=
 this issue there <a href=3D"https://github.com/msys2/MINGW-packages/issues=
" target=3D"_blank">https://github.com/msys2/MINGW-packages/issues</a></div=
><div><br></div></div></blockquote><div><br></div><div>Thanks for the inves=
tigation and your comment on the msys2 issue: <a href=3D"https://github.com=
/msys2/MINGW-packages/issues/11520">https://github.com/msys2/MINGW-packages=
/issues/11520</a></div><div><br> </div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div>When I checked the build using cross-co=
mpilation from Linux, <br></div><div>the widl tool uses proper BIN_TO_INCLU=
DEDIR.<br><br>We should add the rule that qga_vss depends on gen_tlb to get=
 this error more visible.</div><div><br></div><div>Marc-Andr=C3=A9, what do=
 you think?<br></div><div><br></div></div></blockquote><div><br></div><div>=
yes, that&#39;s what I suggested earlier</div><div><br></div><div>thanks <b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div></div><div><div><div><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div></div><=
br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 18, 2022 at 11:15 AM Marc-Andr=C3=A9 Lureau &lt=
;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.=
lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Helge<br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 1=
7, 2022 at 6:51 PM Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" ta=
rget=3D"_blank">hk@zapateado.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Generation with widl needs to be triggered=
 explicitly and requires<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f31d0605dd151d6a--

