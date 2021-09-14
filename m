Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE57140B444
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:13:38 +0200 (CEST)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQB3x-0007zO-Eg
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQAuO-0001Ex-8a
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:03:44 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:39874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQAuG-0003jr-65
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:03:43 -0400
Received: by mail-vk1-xa30.google.com with SMTP id d7so5028319vko.6
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpDyJ2JR7I2ZaHDCaO446PqFjCJO+DEyLsM9c+C0Cfw=;
 b=HlyQ9h+8yEfSpmbi6e5VbmKDp93RGW6/ZU21MZrFXF4eWTI723QJLH8k25HS2vFrgo
 CvOdpx7be3BVSzvHMKfJyMiq3McWbqvMoLDbIr6tO1TkhsG9zHaVDqAMR723Etyvl0QQ
 YNJEj3HqY4yLY9iW6MvWCo+7zHmA+1aCMEsybFoPhxa60rSv1QyJoGCPIMQR77DVcNur
 ja5gAya+tHp5LKElfRYz/RS4m45ik2NqiPuC5v5CkCUlVVBOJy+bPXicJ6rKI64F3e92
 fdyMEOoJZhn28NtLRF8l7EPl+peTWwMbwfhdjHCjOaD9kR8ytl8uaaQ33INpdIV7dxaM
 ZrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpDyJ2JR7I2ZaHDCaO446PqFjCJO+DEyLsM9c+C0Cfw=;
 b=c9wjrEzFbGnu3RIaQl5EKVIej76fS5H8GiZCCVgUenTr1EAMvTFTHw8KgCxecaOODk
 Ie89ATmQR0zzTVVFuiRw6GR8GDmR7KJgDiTICLtGCgO5sip6lh88woBHjiUgQrcKQYXm
 pHx4LaAt7FtJGogS3FXJvy5by3XHEta9IUhYqc0q73bmwOn7UmRVglmLjjkTPxA1v69n
 E8Q941RpU7+umYK1G7xQD6SkFUWQ6V07tOQbtr/hC9YMYzN2PUr1u3xzTnqd0SbBxCE2
 nJ3ILErD04YsTEJO5HVyFeNfl+mUYIA0r3DzUl016UOuU/gfHGOEX/lb1SiJKsP0Xa/i
 WHYg==
X-Gm-Message-State: AOAM531zUmQtLLvGrleYboHHPCzhB/8UcaP7YLIgFW3JBuC7ZQc2Ri1P
 9KIM11xcds1JqzSZvYzTics2qQVJ9yg22FcCZCtisw==
X-Google-Smtp-Source: ABdhPJwFAw65jQoarvx/6iN5VUq67ZsRQOyKlizJGamSP2CBQhzpH34c8dL22T/OKEm3eN0y59UhqZRGUse8DZ/5kqc=
X-Received: by 2002:a05:6122:d95:: with SMTP id
 bc21mr570711vkb.23.1631635411456; 
 Tue, 14 Sep 2021 09:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-4-alex.bennee@linaro.org>
In-Reply-To: <20210803110237.1051032-4-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 14 Sep 2021 10:03:20 -0600
Message-ID: <CANCZdfo=96hcsaRuWoH0X8LHoRioYfP3OyQjPRQzjbCfCW+7wA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] tests/tcg: commit Makefile atrocities in the name
 of portability
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001a6b7e05cbf6b90c"
Received-SPF: none client-ip=2607:f8b0:4864:20::a30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa30.google.com
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

--0000000000001a6b7e05cbf6b90c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> Not all of the multiarch tests are pure POSIX so elide over those
> tests on a non-Linux system. This allows for at least some of the
> tests to be nominally usable by *BSD user builds.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Warner Losh <imp@bsdimp.com>
> ---
>  tests/tcg/multiarch/Makefile.target | 6 +++++-
>  tests/tcg/x86_64/Makefile.target    | 4 ++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>

Acked-by: Warner Losh <imp@bsdimp.com>

To do this with gcc10, however, I had to add -Wno-error=3Doverflow
otherwise I got a lot of warnings about constants being truncated to
0.

It also fails the sha1 test, but when I run it by hand it works. It turns
out that I have a sha1 in my path, and at least in the bsd-user edition
of qemu-i386 tries to run that and fails.

Also, the hello world program needed tweaking

So with this applied and the following patch

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 63cf1b2573..39420631a8 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)

 ifdef CONFIG_USER_ONLY
 run-%: %
-       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on
$(TARGET_NAME)")
+       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) ./$<, "$< on
$(TARGET_NAME)")

 run-plugin-%:
        $(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
@@ -168,7 +168,7 @@ run-%: %
        $(call run-test, $<, \
          $(QEMU) -monitor none -display none \
                  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
-                 $(QEMU_OPTS) $<, \
+                 $(QEMU_OPTS) ./$<, \
          "$< on $(TARGET_NAME)")

 run-plugin-%:
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.targe=
t
index a053ca3f15..ae258c47f0 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -21,6 +21,7 @@ run-plugin-test-i386-pcmpistri-%: QEMU_OPTS +=3D -cpu max
 run-test-i386-bmi2: QEMU_OPTS +=3D -cpu max
 run-plugin-test-i386-bmi2-%: QEMU_OPTS +=3D -cpu max

+CFLAGS +=3D  -Wno-error=3Doverflow
 #
 # hello-i386 is a barebones app
 #
diff --git a/tests/tcg/i386/hello-i386.c b/tests/tcg/i386/hello-i386.c
index 59196dd0b7..4a5a25211c 100644
--- a/tests/tcg/i386/hello-i386.c
+++ b/tests/tcg/i386/hello-i386.c
@@ -1,4 +1,10 @@
+#ifdef __FreeBSD__
+#include <sys/syscall.h>
+#define __NR_exit SYS_exit
+#define __NR_write SYS_write
+#else
 #include <asm/unistd.h>
+#endif

 static inline void exit(int status)
 {

I get down to a failure i the mmap test.... and that's all I have time to
plumb the depths
of this morning... Investigating the mmap test failure will have to wait
for another day.

Warner


> diff --git a/tests/tcg/multiarch/Makefile.target
> b/tests/tcg/multiarch/Makefile.target
> index 85a6fb7a2e..38ee0f1dec 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -10,7 +10,11 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch
>  # Set search path for all sources
>  VPATH          +=3D $(MULTIARCH_SRC)
>  MULTIARCH_SRCS   =3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
> -MULTIARCH_TESTS  =3D$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=3D))
> +MULTIARCH_SKIP=3Dfloat_helpers
> +ifeq ($(CONFIG_LINUX),)
> +MULTIARCH_SKIP+=3Dlinux-test
> +endif
> +MULTIARCH_TESTS  =3D$(filter-out $(MULTIARCH_SKIP),$(MULTIARCH_SRCS:.c=
=3D))
>
>  #
>  # The following are any additional rules needed to build things
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

--0000000000001a6b7e05cbf6b90c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 5:02 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Not all of the multiarch tests are pure POSIX so elide over those<br>
tests on a non-Linux system. This allows for at least some of the<br>
tests to be nominally usable by *BSD user builds.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt=
;<br>
---<br>
=C2=A0tests/tcg/multiarch/Makefile.target | 6 +++++-<br>
=C2=A0tests/tcg/x86_64/Makefile.target=C2=A0 =C2=A0 | 4 ++++<br>
=C2=A02 files changed, 9 insertions(+), 1 deletion(-)<br></blockquote><div>=
<br></div><div>Acked-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">=
imp@bsdimp.com</a>&gt;</div><div><br></div><div>To do this with gcc10, howe=
ver, I had to add -Wno-error=3Doverflow</div><div>otherwise I got a lot of =
warnings about constants being truncated to</div><div>0.</div><div><br></di=
v><div>It also fails the sha1 test, but when I run it by hand it works. It =
turns</div><div>out that I have a sha1 in my path, and at least in the bsd-=
user edition</div><div>of qemu-i386 tries to run that and fails.</div><div>=
<br></div><div>Also, the hello world program needed tweaking</div><div><br>=
</div><div>So with this applied and the following patch</div><div><br></div=
><div>diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target<br=
>index 63cf1b2573..39420631a8 100644<br>--- a/tests/tcg/Makefile.target<br>=
+++ b/tests/tcg/Makefile.target<br>@@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA=
_RUNS)<br><br>=C2=A0ifdef CONFIG_USER_ONLY<br>=C2=A0run-%: %<br>- =C2=A0 =
=C2=A0 =C2=A0 $(call run-test, $&lt;, $(QEMU) $(QEMU_OPTS) $&lt;, &quot;$&l=
t; on $(TARGET_NAME)&quot;)<br>+ =C2=A0 =C2=A0 =C2=A0 $(call run-test, $&lt=
;, $(QEMU) $(QEMU_OPTS) ./$&lt;, &quot;$&lt; on $(TARGET_NAME)&quot;)<br><b=
r>=C2=A0run-plugin-%:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call run-test, $@, $=
(QEMU) $(QEMU_OPTS) \<br>@@ -168,7 +168,7 @@ run-%: %<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(call run-test, $&lt;, \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
$(QEMU) -monitor none -display none \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -chardev file$(COMMA)path=3D$&lt;.out$(COMMA)i=
d=3Doutput \<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
(QEMU_OPTS) $&lt;, \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(QEMU_OPTS) ./$&lt;, \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
$&lt; on $(TARGET_NAME)&quot;)<br><br>=C2=A0run-plugin-%:<br>diff --git a/t=
ests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target<br>index a05=
3ca3f15..ae258c47f0 100644<br>--- a/tests/tcg/i386/Makefile.target<br>+++ b=
/tests/tcg/i386/Makefile.target<br>@@ -21,6 +21,7 @@ run-plugin-test-i386-p=
cmpistri-%: QEMU_OPTS +=3D -cpu max<br>=C2=A0run-test-i386-bmi2: QEMU_OPTS =
+=3D -cpu max<br>=C2=A0run-plugin-test-i386-bmi2-%: QEMU_OPTS +=3D -cpu max=
<br><br>+CFLAGS +=3D =C2=A0-Wno-error=3Doverflow<br>=C2=A0#<br>=C2=A0# hell=
o-i386 is a barebones app<br>=C2=A0#<br>diff --git a/tests/tcg/i386/hello-i=
386.c b/tests/tcg/i386/hello-i386.c<br>index 59196dd0b7..4a5a25211c 100644<=
br>--- a/tests/tcg/i386/hello-i386.c<br>+++ b/tests/tcg/i386/hello-i386.c<b=
r>@@ -1,4 +1,10 @@<br>+#ifdef __FreeBSD__<br>+#include &lt;sys/syscall.h&gt=
;<br>+#define __NR_exit SYS_exit<br>+#define __NR_write SYS_write<br>+#else=
<br>=C2=A0#include &lt;asm/unistd.h&gt;<br>+#endif<br><br>=C2=A0static inli=
ne void exit(int status)<br>=C2=A0{<br></div><div><br></div><div>I get down=
 to a failure i the mmap test.... and that&#39;s all I have time to plumb t=
he depths</div><div>of this morning... Investigating the mmap test failure =
will have to wait for another day.</div><div><br></div><div>Warner</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Make=
file.target<br>
index 85a6fb7a2e..38ee0f1dec 100644<br>
--- a/tests/tcg/multiarch/Makefile.target<br>
+++ b/tests/tcg/multiarch/Makefile.target<br>
@@ -10,7 +10,11 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch<br>
=C2=A0# Set search path for all sources<br>
=C2=A0VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D $(MULTIARCH_SRC)<br>
=C2=A0MULTIARCH_SRCS=C2=A0 =C2=A0=3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.=
c))<br>
-MULTIARCH_TESTS=C2=A0 =3D$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=
=3D))<br>
+MULTIARCH_SKIP=3Dfloat_helpers<br>
+ifeq ($(CONFIG_LINUX),)<br>
+MULTIARCH_SKIP+=3Dlinux-test<br>
+endif<br>
+MULTIARCH_TESTS=C2=A0 =3D$(filter-out $(MULTIARCH_SKIP),$(MULTIARCH_SRCS:.=
c=3D))<br>
<br>
=C2=A0#<br>
=C2=A0# The following are any additional rules needed to build things<br>
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

--0000000000001a6b7e05cbf6b90c--

