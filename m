Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A0A253511
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 18:39:51 +0200 (CEST)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAySk-0004a9-Fv
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 12:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kAyRg-00047f-Ma
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 12:38:44 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kAyRe-0000q8-LR
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 12:38:44 -0400
Received: by mail-ej1-x641.google.com with SMTP id d11so3703924ejt.13
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FIqljMOKZKFI9EP0j9P51Wc4RiazV6rlPwYeJKlg5U=;
 b=uPbqrV/V2CNRI70AF2ENAjj7stEcJksex1O7ktP1f6WvTdC32HQyZIeYweKgdlHfJK
 SYOtBmr/TSNdljW2U1ORZlEIXs7Uf7k7mi6cp3mnM1mXmcpcS8/SEG8XykDX4//g0EG3
 jEKOFIDIojSltWd8ere+ZuJhdQS7y1gFMFuonNFfc94iFSCmMJpBhbRiQYwUD+Kb3cAQ
 Tl53lcEYQcViJX9K88eZphUSKOqMZgWeifSfbJC2u/XTHsq3QrJS3HEQB9ZSudD/SHZa
 L9/bZ8lYmInYA87CTu+IjCJQj9hsWPxy50GY1zmSjQn0g58lFviBOvfkxKtV8qjfO99i
 W7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FIqljMOKZKFI9EP0j9P51Wc4RiazV6rlPwYeJKlg5U=;
 b=mBO1RlN66ACFjltGf8kD0XARSJsWVfCokTw4HW6S7pji6Mbz1UYeL9qu/7GNIlCCrE
 ikPZTjJXrPLbZrUVNBYTEycgFLQWKpZMkB3tfCEfygrIcDd8IfB6tFCGy6DVzuxM2VAu
 lhTdUiOH+bZyPPq4mmfhZvimXmoAhYjny6lU7x3gHhLTk1PBCgNPH4zmbadpl234e9tV
 IX+7UkARhxemdvUn4n2Apxbn6rjtuGcOXBCcIwMtYW8cRBde49QM8FUGRKEEenUotm7c
 6l/3OLUA5vwDuhfNw05ar7RoR3BQ2Kj+A3KJ1ADCJFYARFXFdYpMBQYD4rj3WWRKk674
 UNtQ==
X-Gm-Message-State: AOAM5315qzlLc5vmOIsQqq5g7y8c/KwyrFpiLxP3lxs2cGVXvXxGXTFO
 9Ws8OFsaJRtLBXoCOGc7zEU2wkVbCD0R2mOUanY=
X-Google-Smtp-Source: ABdhPJxvFmESC8409DDJpN9hKBYUPLaM6xeW+C7k7tUeNn3YcCgNGbwwtbCmPMLWzyNWNC1lZKSGuBq46hHm0rBc5RY=
X-Received: by 2002:a17:906:f150:: with SMTP id
 gw16mr8425597ejb.532.1598459918119; 
 Wed, 26 Aug 2020 09:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200826110419.528931-1-marcandre.lureau@redhat.com>
 <CABgObfa1Xa_2EBNHo9=XOYEWFUBqUhKmu6kDfsiE1+hMTwdDvA@mail.gmail.com>
 <CAJ+F1CLqew5KdKGN1zjoBUEtm9q79dWw-9QmhyBu1mYD0qeMWA@mail.gmail.com>
 <CABgObfZZPixkG55c-eUUEzVKczK+nzxGOyO7HPLnXSRwggekBg@mail.gmail.com>
In-Reply-To: <CABgObfZZPixkG55c-eUUEzVKczK+nzxGOyO7HPLnXSRwggekBg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 26 Aug 2020 20:38:24 +0400
Message-ID: <CAJ+F1C+AGbFD888ydast+t0KRXBu+RxuuOyDwGJ2s=EODrVNCw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] meson: mingw installation fixes & nsis conversion
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b770305adca7332"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: sw <sw@weilnetz.de>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b770305adca7332
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 26, 2020 at 5:47 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> We should document the difference in the 5.2 changelog then (it's okay to
> introduce it since the configure option is named differently).
>
>
Not directly related, but I can't help thinking that we would be better off
maintaining the changelog in git too, with sphinx yada yada..

Il mer 26 ago 2020, 13:50 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.co=
m> ha
> scritto:
>
>> Hi
>>
>> On Wed, Aug 26, 2020 at 3:38 PM Paolo Bonzini <pbonzini@redhat.com>
>> wrote:
>>
>>> Since behavioral changes should be reviewed separately let's just
>>> include v2 first.
>>>
>>>
>>  I am more confident that this version doesn't introduce regressions
>> though.. The use of + qemu_confsuffix was problematic, and I noticed som=
e
>> weird behaviour that I couldn't clearly identify (when updating meson &
>> running make only - iow, fresh configure && make should be ok, but for t=
he
>> rest it's not as "clean" as this version..).
>>
>> Paolo
>>>
>>> Il mer 26 ago 2020, 13:04 <marcandre.lureau@redhat.com> ha scritto:
>>>
>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> Hi,
>>>>
>>>> The following patches fix installation path when cross-compiling Windo=
ws
>>>> version, and move the NSIS build rule to meson.
>>>>
>>>> v3:
>>>>  - change qemu suffix handling, make /-separator implicit
>>>>  - use qemu suffix to build qemu_docdir, as --help says
>>>>  - use / to construct qemu directory variables in meson
>>>>  - add a few signed-off from Daniel
>>>>
>>>> v2:
>>>>  - replaced the shell script by a python version
>>>>  - add copyright/license for the new python script
>>>>
>>>> Marc-Andr=C3=A9 Lureau (8):
>>>>   configure: rename confsuffix option
>>>>   configure: always /-seperate directory from qemu_suffix
>>>>   configure: build docdir like other suffixed directories
>>>>   meson: pass qemu_suffix option
>>>>   meson: use meson datadir instead of qemu_datadir
>>>>   meson: pass docdir option
>>>>   meson: use meson mandir instead of qemu_mandir
>>>>   meson: add NSIS building
>>>>
>>>>  Makefile                           | 56 ---------------------
>>>>  configure                          | 27 ++++++-----
>>>>  contrib/vhost-user-gpu/meson.build |  2 +-
>>>>  docs/meson.build                   |  4 +-
>>>>  meson.build                        | 34 +++++++++++--
>>>>  meson_options.txt                  |  4 ++
>>>>  pc-bios/descriptors/meson.build    |  2 +-
>>>>  pc-bios/keymaps/meson.build        |  6 +--
>>>>  pc-bios/meson.build                |  2 +-
>>>>  scripts/nsis.py                    | 78 +++++++++++++++++++++++++++++=
+
>>>>  tools/virtiofsd/meson.build        |  2 +-
>>>>  trace/meson.build                  |  2 +-
>>>>  12 files changed, 138 insertions(+), 81 deletions(-)
>>>>  create mode 100644 scripts/nsis.py
>>>>
>>>> --
>>>> 2.26.2
>>>>
>>>>
>>>>
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009b770305adca7332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2020 at 5:47 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"auto">We should document the difference in the 5.2 changelog then=
 (it&#39;s okay to introduce it since the configure option is named differe=
ntly).</div><br></blockquote><div><br></div><div>Not directly related, but =
I can&#39;t help thinking that we would be better off maintaining the chang=
elog in git too, with sphinx yada yada..</div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Il mer 26 ago 2020, 13:50 Marc-Andr=C3=A9 Lureau=
 &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcan=
dre.lureau@gmail.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2020=
 at 3:38 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=3D=
"noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Since b=
ehavioral changes should be reviewed separately let&#39;s just include v2 f=
irst.<div dir=3D"auto"><br></div></div></blockquote><div><br></div><div>=C2=
=A0I am more confident that this version doesn&#39;t introduce regressions =
though.. The use of + qemu_confsuffix was problematic, and I noticed some w=
eird behaviour that I couldn&#39;t clearly identify (when updating meson &a=
mp; running make only - iow, fresh configure &amp;&amp; make should be ok, =
but for the rest it&#39;s not as &quot;clean&quot; as this version..).<br><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto">Paolo</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 26=
 ago 2020, 13:04  &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" rel=3D=
"noreferrer" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Marc-A=
ndr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt=
;<br>
<br>
Hi,<br>
<br>
The following patches fix installation path when cross-compiling Windows<br=
>
version, and move the NSIS build rule to meson.<br>
<br>
v3:<br>
=C2=A0- change qemu suffix handling, make /-separator implicit<br>
=C2=A0- use qemu suffix to build qemu_docdir, as --help says<br>
=C2=A0- use / to construct qemu directory variables in meson<br>
=C2=A0- add a few signed-off from Daniel<br>
<br>
v2:<br>
=C2=A0- replaced the shell script by a python version<br>
=C2=A0- add copyright/license for the new python script<br>
<br>
Marc-Andr=C3=A9 Lureau (8):<br>
=C2=A0 configure: rename confsuffix option<br>
=C2=A0 configure: always /-seperate directory from qemu_suffix<br>
=C2=A0 configure: build docdir like other suffixed directories<br>
=C2=A0 meson: pass qemu_suffix option<br>
=C2=A0 meson: use meson datadir instead of qemu_datadir<br>
=C2=A0 meson: pass docdir option<br>
=C2=A0 meson: use meson mandir instead of qemu_mandir<br>
=C2=A0 meson: add NSIS building<br>
<br>
=C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 56 ---------------------<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 27 ++++++-----<br>
=C2=A0contrib/vhost-user-gpu/meson.build |=C2=A0 2 +-<br>
=C2=A0docs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 +++++++++++--<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++<br>
=C2=A0pc-bios/descriptors/meson.build=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0pc-bios/keymaps/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +--<=
br>
=C2=A0pc-bios/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0scripts/nsis.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 78 ++++++++++++++++++++++++++++++<br>
=C2=A0tools/virtiofsd/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A0trace/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A012 files changed, 138 insertions(+), 81 deletions(-)<br>
=C2=A0create mode 100644 scripts/nsis.py<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009b770305adca7332--

