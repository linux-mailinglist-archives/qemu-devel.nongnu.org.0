Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025948FFA3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 00:23:43 +0100 (CET)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9EsA-0005qj-2Z
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 18:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9Eqv-0004dK-Gq
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:22:25 -0500
Received: from [2607:f8b0:4864:20::a2b] (port=37762
 helo=mail-vk1-xa2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9Eqt-0001yb-2c
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:22:25 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id v192so6336016vkv.4
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 15:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WTnLBAuRe5d1gEYVEZbpxu8iG3wvzlmiNcZ2ywr7XA=;
 b=mefF1aV7B6+xIJuiplRYDLGHVgzDMbWZff8Ir+Q/wk3zn/ehk1xfRNGzKVKHjJXMu6
 GLV4Z2lC8KtU4AdQCgmG75BNG1r6mzHXB6Tv68rT6X9TbLhok5hVc/qtI4vx8mkcQ45x
 U2kg/5m2yEv14lkB7q6rDGZwlpa1eijKZv2Q1p5k5rhplJDvY4yTBNYOAoz0ZMvYeAaS
 RvlLpauX1hPp0rg38XFsjZVvYE81ePd4ug63VivpXcPO16sNtRwNZQ5dljlOZcc6XNNV
 QawOYXdjZNo4sO8r8ZNkJQbxre3neP0KAlDOagJJQQqhV4aP7bgV5Hyna94PheE1nUzH
 9TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WTnLBAuRe5d1gEYVEZbpxu8iG3wvzlmiNcZ2ywr7XA=;
 b=eJqI1UXKbRXgBA97WM/iNdMcqd5TwlMZeJ5WZBWW6jE/baYCcO32duEeG2WBXeXWds
 GM+i3tGa+mIhjMWDiQzQplX0CQYBTvSOYFkAf9F7W9UYdTHtbhB4e/k9cxB3dbYHt7tY
 vWjasUsqrcU6UH8ylsDDuDk5zmp17xlhDI39oiy/5XsGGGkTdRG2eCHSo0qHXpwqVya3
 sC6N1UtEKNUmOh+vjMFoH5mI5gMYuzOHhNlzvD17rulWfcksR7tLwD57+87az5CXigmD
 1dNtCnAucs2r3Ek3Putd54kRO6UdUdqFWu7AIad92QrOtkPXJJS5vfRu33hQuVrhLrv0
 J1sA==
X-Gm-Message-State: AOAM531Njsrd8Uod+31kEai07c5JsHoK5HVZBG+C9Uo1eGfZAUhhrHG2
 R+Eb/EOTHEgjqYN65H3FMwOzcbb3VXjbGSLeXRZAFQ==
X-Google-Smtp-Source: ABdhPJxQWCMV5HXgGeSbBOo50orThx1UKnlyFiTrE1kCLgLhZHb3ACSUu2HDscnHUSK02cY8TZLh34ZVaJD798VP96I=
X-Received: by 2002:a1f:f287:: with SMTP id q129mr7454634vkh.40.1642375341602; 
 Sun, 16 Jan 2022 15:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-20-alex.bennee@linaro.org>
 <33137c92-576f-3ee1-d4b5-2673c09f4ef3@amsat.org>
In-Reply-To: <33137c92-576f-3ee1-d4b5-2673c09f4ef3@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 16 Jan 2022 16:22:10 -0700
Message-ID: <CANCZdfqzf-i05B1WTo41vW3+5PSwKeNgfYQhq05QDSfnY=wnow@mail.gmail.com>
Subject: Re: [PATCH v1 19/34] tests/tcg: use CONFIG_LINUX_USER,
 not CONFIG_LINUX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000d3102f05d5bb4e55"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d3102f05d5bb4e55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 2:58 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> +Warner
>
> On 1/5/22 14:49, Alex Benn=C3=A9e wrote:
> > From: Paolo Bonzini <pbonzini@redhat.com>
> >
> > The two more or less overlap, because CONFIG_LINUX is a requirement for
> Linux
> > user-mode emulation.  However, CONFIG_LINUX is technically a host symbo=
l
> > that applies even to system emulation.  Defining CONFIG_LINUX_USER, and
> > CONFIG_BSD_USER for eventual future use, is cleaner.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20211210084836.25202-1-pbonzini@redhat.com>
> > ---
> >  tests/tcg/configure.sh              | 8 +++++++-
> >  tests/tcg/multiarch/Makefile.target | 2 +-
> >  tests/tcg/x86_64/Makefile.target    | 2 +-
> >  3 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> > index 8eb4287c84..309335a2bd 100755
> > --- a/tests/tcg/configure.sh
> > +++ b/tests/tcg/configure.sh
> > @@ -225,8 +225,14 @@ for target in $target_list; do
> >    echo "TARGET_NAME=3D$arch" >> $config_target_mak
> >    echo "target=3D$target" >> $config_target_mak
> >    case $target in
> > -    *-linux-user | *-bsd-user)
> > +    *-linux-user)
> >        echo "CONFIG_USER_ONLY=3Dy" >> $config_target_mak
> > +      echo "CONFIG_LINUX_USER=3Dy" >> $config_target_mak
> > +      echo "QEMU=3D$PWD/qemu-$arch" >> $config_target_mak
> > +      ;;
> > +    *-bsd-user)
> > +      echo "CONFIG_USER_ONLY=3Dy" >> $config_target_mak
> > +      echo "CONFIG_BSD_USER=3Dy" >> $config_target_mak
> >        echo "QEMU=3D$PWD/qemu-$arch" >> $config_target_mak
> >        ;;
> >      *-softmmu)
> > diff --git a/tests/tcg/multiarch/Makefile.target
> b/tests/tcg/multiarch/Makefile.target
> > index a83efb4a9d..dec401e67f 100644
> > --- a/tests/tcg/multiarch/Makefile.target
> > +++ b/tests/tcg/multiarch/Makefile.target
> > @@ -10,7 +10,7 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch
> >  # Set search path for all sources
> >  VPATH               +=3D $(MULTIARCH_SRC)
> >  MULTIARCH_SRCS =3D  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
> > -ifneq ($(CONFIG_LINUX),)
> > +ifneq ($(CONFIG_LINUX_USER),)
> >  VPATH               +=3D $(MULTIARCH_SRC)/linux
> >  MULTIARCH_SRCS +=3D $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
> >  endif
> > diff --git a/tests/tcg/x86_64/Makefile.target
> b/tests/tcg/x86_64/Makefile.target
> > index d7a7385583..4a8a464c57 100644
> > --- a/tests/tcg/x86_64/Makefile.target
> > +++ b/tests/tcg/x86_64/Makefile.target
> > @@ -8,7 +8,7 @@
> >
> >  include $(SRC_PATH)/tests/tcg/i386/Makefile.target
> >
> > -ifneq ($(CONFIG_LINUX),)
> > +ifneq ($(CONFIG_LINUX_USER),)
> >  X86_64_TESTS +=3D vsyscall
> >  TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
> >  else
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000d3102f05d5bb4e55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 2:58 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">+Warner<br>
<br>
On 1/5/22 14:49, Alex Benn=C3=A9e wrote:<br>
&gt; From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The two more or less overlap, because CONFIG_LINUX is a requirement fo=
r Linux<br>
&gt; user-mode emulation.=C2=A0 However, CONFIG_LINUX is technically a host=
 symbol<br>
&gt; that applies even to system emulation.=C2=A0 Defining CONFIG_LINUX_USE=
R, and<br>
&gt; CONFIG_BSD_USER for eventual future use, is cleaner.<br>
&gt; <br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20211210084836.25202-1-pbonzini@redh=
at.com" target=3D"_blank">20211210084836.25202-1-pbonzini@redhat.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 tests/tcg/configure.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 8 +++++++-<br>
&gt;=C2=A0 tests/tcg/multiarch/Makefile.target | 2 +-<br>
&gt;=C2=A0 tests/tcg/x86_64/Makefile.target=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 3 files changed, 9 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh<br>
&gt; index 8eb4287c84..309335a2bd 100755<br>
&gt; --- a/tests/tcg/configure.sh<br>
&gt; +++ b/tests/tcg/configure.sh<br>
&gt; @@ -225,8 +225,14 @@ for target in $target_list; do<br>
&gt;=C2=A0 =C2=A0 echo &quot;TARGET_NAME=3D$arch&quot; &gt;&gt; $config_tar=
get_mak<br>
&gt;=C2=A0 =C2=A0 echo &quot;target=3D$target&quot; &gt;&gt; $config_target=
_mak<br>
&gt;=C2=A0 =C2=A0 case $target in<br>
&gt; -=C2=A0 =C2=A0 *-linux-user | *-bsd-user)<br>
&gt; +=C2=A0 =C2=A0 *-linux-user)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;CONFIG_USER_ONLY=3Dy&quot; &gt;&=
gt; $config_target_mak<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 echo &quot;CONFIG_LINUX_USER=3Dy&quot; &gt;&gt; =
$config_target_mak<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 echo &quot;QEMU=3D$PWD/qemu-$arch&quot; &gt;&gt;=
 $config_target_mak<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 *-bsd-user)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 echo &quot;CONFIG_USER_ONLY=3Dy&quot; &gt;&gt; $=
config_target_mak<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 echo &quot;CONFIG_BSD_USER=3Dy&quot; &gt;&gt; $c=
onfig_target_mak<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;QEMU=3D$PWD/qemu-$arch&quot; &gt=
;&gt; $config_target_mak<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *-softmmu)<br>
&gt; diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch=
/Makefile.target<br>
&gt; index a83efb4a9d..dec401e67f 100644<br>
&gt; --- a/tests/tcg/multiarch/Makefile.target<br>
&gt; +++ b/tests/tcg/multiarch/Makefile.target<br>
&gt; @@ -10,7 +10,7 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch<br>
&gt;=C2=A0 # Set search path for all sources<br>
&gt;=C2=A0 VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 $(MULTIARCH_SRC)<br>
&gt;=C2=A0 MULTIARCH_SRCS =3D=C2=A0 $(notdir $(wildcard $(MULTIARCH_SRC)/*.=
c))<br>
&gt; -ifneq ($(CONFIG_LINUX),)<br>
&gt; +ifneq ($(CONFIG_LINUX_USER),)<br>
&gt;=C2=A0 VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 $(MULTIARCH_SRC)/linux<br>
&gt;=C2=A0 MULTIARCH_SRCS +=3D $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*=
.c))<br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makef=
ile.target<br>
&gt; index d7a7385583..4a8a464c57 100644<br>
&gt; --- a/tests/tcg/x86_64/Makefile.target<br>
&gt; +++ b/tests/tcg/x86_64/Makefile.target<br>
&gt; @@ -8,7 +8,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 include $(SRC_PATH)/tests/tcg/i386/Makefile.target<br>
&gt;=C2=A0 <br>
&gt; -ifneq ($(CONFIG_LINUX),)<br>
&gt; +ifneq ($(CONFIG_LINUX_USER),)<br>
&gt;=C2=A0 X86_64_TESTS +=3D vsyscall<br>
&gt;=C2=A0 TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64<br>
&gt;=C2=A0 else<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@=
bsdimp.com</a>&gt;=C2=A0</div></div></div>

--000000000000d3102f05d5bb4e55--

