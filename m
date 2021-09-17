Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4A40FE62
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:09:26 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHMb-0005yp-G4
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRHJI-00049D-K5
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:06:00 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRHJF-0006GE-1y
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:06:00 -0400
Received: by mail-vs1-xe33.google.com with SMTP id o124so10073949vsc.6
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k/rMKi5R1dA3LpYwO5bcbDIM3wrIUhAu8+n259qeJSM=;
 b=drZ5Rd8z/CI+6SkqiEvq9krluBfleo1Gp/6AZ7tKd+rK258CTuo3PPnb3F//Vj1m2j
 LuJzsGsToIY4mw21CRB88RshRmVpL3M7mBPMIvRsjEL5u5I2CWokOmW9+d4fauMPMr/j
 6fDFAJFbs8MWyaHR44I9FH4sZpZfPO+s+dAVEDFHyzyBmuLaAX7RvmfZ2xXDsj1Lhc43
 oLLeardEddlVo0+X5jD7O3AVbsn3Eq6hYqyTl6dCFkU3Syd6Lsy5qXpkxU6ntRUVYtRJ
 9O0+VNIpcBmDAUmPu/41vH7pmXxSFc3+6y0BnhddZ7MwA+PoqRqXWGbuzXKhZarXSQBg
 1HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k/rMKi5R1dA3LpYwO5bcbDIM3wrIUhAu8+n259qeJSM=;
 b=BefKrGepQt20uTbjQXLSbZKZW4KokVZ0yO73UH/BVOb52sRth7XVlQp2IQ8QAe52Gb
 PgRTHlmHVyRxwvUBExiu3U7x74wMrbyRUdqoGbCja/GfgOf88xN7s9MirDpcy/wd+gAd
 in0cX4In6euEfOFcGbEFznQjvi0hGhkwiHCHAnu8Zr4BPqUe7o4mFsp0DPK47P7Q3j8S
 Rhq6ss/xcE3k15bFtBEiyfcsPSoo7Vrkt/up2w6Ee4IMnmqQoXzkFFhU0owQAWRSjpnv
 MaoKwXRDk17X9tfn8Y0+JC0ExDHkYvIUOkTDWhI3duLVjtlbgASoowTsVIvK2DuQk5vf
 ALbw==
X-Gm-Message-State: AOAM533A288D+Rm2+SPvO8IWtB1JTIZ9gThhbq39Q887BfGdEJWeNfYQ
 hYS3gH/yV5ZXepaV/ad8KJIQ7+Lro1Vn+pu0V2akgA==
X-Google-Smtp-Source: ABdhPJyNODaESQScjRlbKtZZWW68MlIrZvGl9tyddxjUlEWidh0xxZbNZBgSdOD5dh5IGajKDxNjBkJvMsWm61Dnc1w=
X-Received: by 2002:a67:1985:: with SMTP id 127mr9317532vsz.44.1631898352443; 
 Fri, 17 Sep 2021 10:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-4-alex.bennee@linaro.org>
In-Reply-To: <20210917162332.3511179-4-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 11:05:41 -0600
Message-ID: <CANCZdfphGX=D9=WucAqxfsT5bJnD9LH6aewfvu6Qosau7reqXQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] tests/tcg: move some multiarch files and make
 conditional
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009b77df05cc33f110"
Received-SPF: none client-ip=2607:f8b0:4864:20::e33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b77df05cc33f110
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:23 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

> We had some messy code to filter out stuff we can't build. Lets junk
> that and simplify the logic by pushing some stuff into subdirs. In
> particular we move:
>
>   float_helpers into libs - not a standalone test
>   linux-test into linux - so we only build on Linux hosts
>
> This allows for at least some of the tests to be nominally usable
> by *BSD user builds.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Warner Losh <imp@bsdimp.com>
> ---
>  tests/tcg/multiarch/{ =3D> libs}/float_helpers.c |  2 +-
>  tests/tcg/multiarch/{ =3D> linux}/linux-test.c   |  0
>  tests/tcg/multiarch/Makefile.target            | 15 ++++++++++-----
>  tests/tcg/x86_64/Makefile.target               |  4 ++++
>  4 files changed, 15 insertions(+), 6 deletions(-)
>  rename tests/tcg/multiarch/{ =3D> libs}/float_helpers.c (99%)
>  rename tests/tcg/multiarch/{ =3D> linux}/linux-test.c (100%)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

I've also tested it as well.


> diff --git a/tests/tcg/multiarch/float_helpers.c
> b/tests/tcg/multiarch/libs/float_helpers.c
> similarity index 99%
> rename from tests/tcg/multiarch/float_helpers.c
> rename to tests/tcg/multiarch/libs/float_helpers.c
> index bc530e5732..4e68d2b659 100644
> --- a/tests/tcg/multiarch/float_helpers.c
> +++ b/tests/tcg/multiarch/libs/float_helpers.c
> @@ -22,7 +22,7 @@
>  #include <float.h>
>  #include <fenv.h>
>
> -#include "float_helpers.h"
> +#include "../float_helpers.h"
>
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
>
> diff --git a/tests/tcg/multiarch/linux-test.c
> b/tests/tcg/multiarch/linux/linux-test.c
> similarity index 100%
> rename from tests/tcg/multiarch/linux-test.c
> rename to tests/tcg/multiarch/linux/linux-test.c
> diff --git a/tests/tcg/multiarch/Makefile.target
> b/tests/tcg/multiarch/Makefile.target
> index 85a6fb7a2e..3763df2019 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -8,18 +8,23 @@
>  MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch
>
>  # Set search path for all sources
> -VPATH          +=3D $(MULTIARCH_SRC)
> -MULTIARCH_SRCS   =3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
> -MULTIARCH_TESTS  =3D$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=3D))
> +VPATH         +=3D $(MULTIARCH_SRC)
> +MULTIARCH_SRCS =3D  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
> +ifneq ($(CONFIG_LINUX),)
> +VPATH         +=3D $(MULTIARCH_SRC)/linux
> +MULTIARCH_SRCS +=3D $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
> +endif
> +MULTIARCH_TESTS =3D $(MULTIARCH_SRCS:.c=3D)
>
> +$(info SRCS=3D${MULTIARCH_SRCS} and ${MULTIARCH_TESTS})
>  #
>  # The following are any additional rules needed to build things
>  #
>
>
>  float_%: LDFLAGS+=3D-lm
> -float_%: float_%.c float_helpers.c
> -       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $<
> $(MULTIARCH_SRC)/float_helpers.c -o $@ $(LDFLAGS)
> +float_%: float_%.c libs/float_helpers.c
> +       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $<
> $(MULTIARCH_SRC)/libs/float_helpers.c -o $@ $(LDFLAGS)
>
>  run-float_%: float_%
>         $(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<,"$< on $(TARGET_NAME)=
")
> diff --git a/tests/tcg/x86_64/Makefile.target
> b/tests/tcg/x86_64/Makefile.target
> index 2151ea6302..d7a7385583 100644
> --- a/tests/tcg/x86_64/Makefile.target
> +++ b/tests/tcg/x86_64/Makefile.target
> @@ -8,8 +8,12 @@
>
>  include $(SRC_PATH)/tests/tcg/i386/Makefile.target
>
> +ifneq ($(CONFIG_LINUX),)
>  X86_64_TESTS +=3D vsyscall
>  TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
> +else
> +TESTS=3D$(MULTIARCH_TESTS)
> +endif
>  QEMU_OPTS +=3D -cpu max
>
>  test-x86_64: LDFLAGS+=3D-lm -lc
> --
> 2.30.2
>
>

--0000000000009b77df05cc33f110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:23 AM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">We had some messy code to filter out stuff we can&#39;t build. Lets j=
unk<br>
that and simplify the logic by pushing some stuff into subdirs. In<br>
particular we move:<br>
<br>
=C2=A0 float_helpers into libs - not a standalone test<br>
=C2=A0 linux-test into linux - so we only build on Linux hosts<br>
<br>
This allows for at least some of the tests to be nominally usable<br>
by *BSD user builds.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt=
;<br>
---<br>
=C2=A0tests/tcg/multiarch/{ =3D&gt; libs}/float_helpers.c |=C2=A0 2 +-<br>
=C2=A0tests/tcg/multiarch/{ =3D&gt; linux}/linux-test.c=C2=A0 =C2=A0|=C2=A0=
 0<br>
=C2=A0tests/tcg/multiarch/Makefile.target=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 15 ++++++++++-----<br>
=C2=A0tests/tcg/x86_64/Makefile.target=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A04 files changed, 15 insertions(+), 6 deletions(-)<br>
=C2=A0rename tests/tcg/multiarch/{ =3D&gt; libs}/float_helpers.c (99%)<br>
=C2=A0rename tests/tcg/multiarch/{ =3D&gt; linux}/linux-test.c (100%)<br></=
blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mail=
to:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>I&#39;ve=
 also tested it as well.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
diff --git a/tests/tcg/multiarch/float_helpers.c b/tests/tcg/multiarch/libs=
/float_helpers.c<br>
similarity index 99%<br>
rename from tests/tcg/multiarch/float_helpers.c<br>
rename to tests/tcg/multiarch/libs/float_helpers.c<br>
index bc530e5732..4e68d2b659 100644<br>
--- a/tests/tcg/multiarch/float_helpers.c<br>
+++ b/tests/tcg/multiarch/libs/float_helpers.c<br>
@@ -22,7 +22,7 @@<br>
=C2=A0#include &lt;float.h&gt;<br>
=C2=A0#include &lt;fenv.h&gt;<br>
<br>
-#include &quot;float_helpers.h&quot;<br>
+#include &quot;../float_helpers.h&quot;<br>
<br>
=C2=A0#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))<br>
<br>
diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux/l=
inux-test.c<br>
similarity index 100%<br>
rename from tests/tcg/multiarch/linux-test.c<br>
rename to tests/tcg/multiarch/linux/linux-test.c<br>
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Make=
file.target<br>
index 85a6fb7a2e..3763df2019 100644<br>
--- a/tests/tcg/multiarch/Makefile.target<br>
+++ b/tests/tcg/multiarch/Makefile.target<br>
@@ -8,18 +8,23 @@<br>
=C2=A0MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch<br>
<br>
=C2=A0# Set search path for all sources<br>
-VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D $(MULTIARCH_SRC)<br>
-MULTIARCH_SRCS=C2=A0 =C2=A0=3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))<b=
r>
-MULTIARCH_TESTS=C2=A0 =3D$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=
=3D))<br>
+VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D $(MULTIARCH_SRC)<br>
+MULTIARCH_SRCS =3D=C2=A0 $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))<br>
+ifneq ($(CONFIG_LINUX),)<br>
+VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D $(MULTIARCH_SRC)/linux<br>
+MULTIARCH_SRCS +=3D $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))<br>
+endif<br>
+MULTIARCH_TESTS =3D $(MULTIARCH_SRCS:.c=3D)<br>
<br>
+$(info SRCS=3D${MULTIARCH_SRCS} and ${MULTIARCH_TESTS})<br>
=C2=A0#<br>
=C2=A0# The following are any additional rules needed to build things<br>
=C2=A0#<br>
<br>
<br>
=C2=A0float_%: LDFLAGS+=3D-lm<br>
-float_%: float_%.c float_helpers.c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $&lt; $(MULTIAR=
CH_SRC)/float_helpers.c -o $@ $(LDFLAGS)<br>
+float_%: float_%.c libs/float_helpers.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $&lt; $(MULTIAR=
CH_SRC)/libs/float_helpers.c -o $@ $(LDFLAGS)<br>
<br>
=C2=A0run-float_%: float_%<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call run-test,$&lt;, $(QEMU) $(QEMU_OPTS) $&l=
t;,&quot;$&lt; on $(TARGET_NAME)&quot;)<br>
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.t=
arget<br>
index 2151ea6302..d7a7385583 100644<br>
--- a/tests/tcg/x86_64/Makefile.target<br>
+++ b/tests/tcg/x86_64/Makefile.target<br>
@@ -8,8 +8,12 @@<br>
<br>
=C2=A0include $(SRC_PATH)/tests/tcg/i386/Makefile.target<br>
<br>
+ifneq ($(CONFIG_LINUX),)<br>
=C2=A0X86_64_TESTS +=3D vsyscall<br>
=C2=A0TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64<br>
+else<br>
+TESTS=3D$(MULTIARCH_TESTS)<br>
+endif<br>
=C2=A0QEMU_OPTS +=3D -cpu max<br>
<br>
=C2=A0test-x86_64: LDFLAGS+=3D-lm -lc<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--0000000000009b77df05cc33f110--

