Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1359340FB72
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:12:27 +0200 (CEST)
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFXM-0001cp-Tf
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRFTM-0007Rp-Nv
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:08:16 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRFTJ-0004FC-N8
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:08:16 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id f18so9735118vsp.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g5B7KewGcZgSmSE/KNxC3rRGOMneGPTrFARnKEm+jSA=;
 b=w3VvgFzChkHJrbE0vT+SS3NCsNcR0eOWnGENetqBLs8Izg+QnLmY4H5rIGO8R8FsJ9
 TGBw7ssrbRLcnJBpkZq3VssaQmPw5qvyAQq5O9rL/PzDUR0QQ5r7OKMJI0H3Ae4s40iO
 WEcgTLyR3SSrTsfDwmyrXkUM18yH6PjQoMJBjsReUlYJ5jUzqugCbnfmzpOhrHgFKutS
 vM6fIp8ThrVrFpWnVRuXC00crpZ1v0BzVTTkoHieoLvOJeFgOVJVrVEIIjx+3jU5pTfg
 vaty5qw8gVMwo0sHZuvWlPknCjIkAfmFlCnLop59qz2l8bJ/rOd2/jkL66H2FZlt3n/U
 txUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5B7KewGcZgSmSE/KNxC3rRGOMneGPTrFARnKEm+jSA=;
 b=RMGB7aPDnr3rF1aE+URo33jiIV2aud3cvJuvvibGd/pgNGp4qmVg2Q1EkmTYiYVxax
 UVHvV6AefMBAZ2tP1U5NKk8e1XKxumy6ihzcq0ek+in5iTdEmNSOiWH+mfih18I1EaBN
 GHvx3ltWIP7/bZQ+MGUCxl3dJNUWqnSv9kol3oyOS8vjtX/8ZRnc3Xhcxqrk3iaDR4vb
 /Ck07XTrV43840eGF66wFvcNIC/35GSjL5NL+XW6I5KuJQzMMweGdpNOcQvsJrQdTKdK
 COhHkoiBPnuj6lfaC/xIr7pcMtCCNc/qhS1aKnMwOL9b39nBXX8p+T/WS2oy2TGRcCNN
 NBHw==
X-Gm-Message-State: AOAM533c/9oOxnG85l9H/peVSAWbexP0ZVRH7Eet5Nzcv1lEGe793v8t
 5V6aOjXqEBHLX1Kt8Kta2nvrLr5NwSqNyE66gVu7SA==
X-Google-Smtp-Source: ABdhPJx4lrdeBXsJCojon5tZUQNXuJtBUF0BW2KSjDzPBch2TbJOaiYFLG2ZdlzhzIDwrrSDtd5Jfhu1BW56JBWAPBw=
X-Received: by 2002:a67:d589:: with SMTP id m9mr9079379vsj.30.1631891292273;
 Fri, 17 Sep 2021 08:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-4-alex.bennee@linaro.org>
 <CANCZdfo=96hcsaRuWoH0X8LHoRioYfP3OyQjPRQzjbCfCW+7wA@mail.gmail.com>
 <8735q3tgfo.fsf@linaro.org>
In-Reply-To: <8735q3tgfo.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 09:08:01 -0600
Message-ID: <CANCZdfoR=xBietGR-y_9VpDiinNwOz2u44HGOpOx3CHwKs5fBw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] tests/tcg: commit Makefile atrocities in the name
 of portability
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c9d2d005cc324c34"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2e.google.com
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

--000000000000c9d2d005cc324c34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 8:39 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Warner Losh <imp@bsdimp.com> writes:
>
> > On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> >
> >  Not all of the multiarch tests are pure POSIX so elide over those
> >  tests on a non-Linux system. This allows for at least some of the
> >  tests to be nominally usable by *BSD user builds.
> >
> >  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >  Cc: Warner Losh <imp@bsdimp.com>
> >  ---
> >   tests/tcg/multiarch/Makefile.target | 6 +++++-
> >   tests/tcg/x86_64/Makefile.target    | 4 ++++
> >   2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > Acked-by: Warner Losh <imp@bsdimp.com>
> >
> > To do this with gcc10, however, I had to add -Wno-error=3Doverflow
> > otherwise I got a lot of warnings about constants being truncated to
> > 0.
> >
> > It also fails the sha1 test, but when I run it by hand it works. It tur=
ns
> > out that I have a sha1 in my path, and at least in the bsd-user edition
> > of qemu-i386 tries to run that and fails.
> >
> > Also, the hello world program needed tweaking
> >
> > So with this applied and the following patch
> >
> > diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> > index 63cf1b2573..39420631a8 100644
> > --- a/tests/tcg/Makefile.target
> > +++ b/tests/tcg/Makefile.target
> > @@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)
> >
> >  ifdef CONFIG_USER_ONLY
> >  run-%: %
> > -       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on
> $(TARGET_NAME)")
> > +       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) ./$<, "$< on
> $(TARGET_NAME)")
> >
> >  run-plugin-%:
> >         $(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
> > @@ -168,7 +168,7 @@ run-%: %
> >         $(call run-test, $<, \
> >           $(QEMU) -monitor none -display none \
> >                   -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput=
 \
> > -                 $(QEMU_OPTS) $<, \
> > +                 $(QEMU_OPTS) ./$<, \
> >           "$< on $(TARGET_NAME)")
>
> That's weird. I'm not super keen to merge this because it's incomplete
> (we have a large number of manual run-FOO stanzas). AFAICT neither of
> the loaders attempt to enumerate and search path so I wonder if this is
> a function of the shell?
>

bsd-user does, in fact, search the path. It does so in loader_exec. It does
this,
I believe, to support execing native binaries, but I'll need to check on
that.

It's fine if we don't merge this just yet.

>  run-plugin-%:
> > diff --git a/tests/tcg/i386/Makefile.target
> b/tests/tcg/i386/Makefile.target
> > index a053ca3f15..ae258c47f0 100644
> > --- a/tests/tcg/i386/Makefile.target
> > +++ b/tests/tcg/i386/Makefile.target
> > @@ -21,6 +21,7 @@ run-plugin-test-i386-pcmpistri-%: QEMU_OPTS +=3D -cpu=
 max
> >  run-test-i386-bmi2: QEMU_OPTS +=3D -cpu max
> >  run-plugin-test-i386-bmi2-%: QEMU_OPTS +=3D -cpu max
> >
> > +CFLAGS +=3D  -Wno-error=3Doverflow
>
> I'd apply this direct to the test in question rather than a global change=
.
>

I think we should not apply it at all. I was so happy to get things
compiling
that I'd raced ahead of myself: when this is active, the tests fail to run.


> >  #
> >  # hello-i386 is a barebones app
> >  #
> > diff --git a/tests/tcg/i386/hello-i386.c b/tests/tcg/i386/hello-i386.c
> > index 59196dd0b7..4a5a25211c 100644
> > --- a/tests/tcg/i386/hello-i386.c
> > +++ b/tests/tcg/i386/hello-i386.c
> > @@ -1,4 +1,10 @@
> > +#ifdef __FreeBSD__
> > +#include <sys/syscall.h>
> > +#define __NR_exit SYS_exit
> > +#define __NR_write SYS_write
> > +#else
> >  #include <asm/unistd.h>
> > +#endif
> >
> >  static inline void exit(int status)
> >  {
>

I can submit this as a separate thing, but it's the only patch I'm
completely sure of.

Warner


> > I get down to a failure i the mmap test.... and that's all I have time
> to plumb the depths
> > of this morning... Investigating the mmap test failure will have to wai=
t
> for another day.
> >
> > Warner
> >
> >  diff --git a/tests/tcg/multiarch/Makefile.target
> b/tests/tcg/multiarch/Makefile.target
> >  index 85a6fb7a2e..38ee0f1dec 100644
> >  --- a/tests/tcg/multiarch/Makefile.target
> >  +++ b/tests/tcg/multiarch/Makefile.target
> >  @@ -10,7 +10,11 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch
> >   # Set search path for all sources
> >   VPATH          +=3D $(MULTIARCH_SRC)
> >   MULTIARCH_SRCS   =3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
> >  -MULTIARCH_TESTS  =3D$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=
=3D))
> >  +MULTIARCH_SKIP=3Dfloat_helpers
> >  +ifeq ($(CONFIG_LINUX),)
> >  +MULTIARCH_SKIP+=3Dlinux-test
> >  +endif
> >  +MULTIARCH_TESTS  =3D$(filter-out $(MULTIARCH_SKIP),$(MULTIARCH_SRCS:.=
c=3D))
> >
> >   #
> >   # The following are any additional rules needed to build things
> >  diff --git a/tests/tcg/x86_64/Makefile.target
> b/tests/tcg/x86_64/Makefile.target
> >  index 2151ea6302..d7a7385583 100644
> >  --- a/tests/tcg/x86_64/Makefile.target
> >  +++ b/tests/tcg/x86_64/Makefile.target
> >  @@ -8,8 +8,12 @@
> >
> >   include $(SRC_PATH)/tests/tcg/i386/Makefile.target
> >
> >  +ifneq ($(CONFIG_LINUX),)
> >   X86_64_TESTS +=3D vsyscall
> >   TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
> >  +else
> >  +TESTS=3D$(MULTIARCH_TESTS)
> >  +endif
> >   QEMU_OPTS +=3D -cpu max
> >
> >   test-x86_64: LDFLAGS+=3D-lm -lc
> >  --
> >  2.30.2
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000c9d2d005cc324c34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 8:39 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsd=
imp.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:=
alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;=C2=A0 Not all of the multiarch tests are pure POSIX so elide over thos=
e<br>
&gt;=C2=A0 tests on a non-Linux system. This allows for at least some of th=
e<br>
&gt;=C2=A0 tests to be nominally usable by *BSD user builds.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.benne=
e@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;=C2=A0 Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0tests/tcg/multiarch/Makefile.target | 6 +++++-<br>
&gt;=C2=A0 =C2=A0tests/tcg/x86_64/Makefile.target=C2=A0 =C2=A0 | 4 ++++<br>
&gt;=C2=A0 =C2=A02 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; Acked-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
&gt;<br>
&gt; To do this with gcc10, however, I had to add -Wno-error=3Doverflow<br>
&gt; otherwise I got a lot of warnings about constants being truncated to<b=
r>
&gt; 0.<br>
&gt;<br>
&gt; It also fails the sha1 test, but when I run it by hand it works. It tu=
rns<br>
&gt; out that I have a sha1 in my path, and at least in the bsd-user editio=
n<br>
&gt; of qemu-i386 tries to run that and fails.<br>
&gt;<br>
&gt; Also, the hello world program needed tweaking<br>
&gt;<br>
&gt; So with this applied and the following patch<br>
&gt;<br>
&gt; diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target<br>
&gt; index 63cf1b2573..39420631a8 100644<br>
&gt; --- a/tests/tcg/Makefile.target<br>
&gt; +++ b/tests/tcg/Makefile.target<br>
&gt; @@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)<br>
&gt;<br>
&gt;=C2=A0 ifdef CONFIG_USER_ONLY<br>
&gt;=C2=A0 run-%: %<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $&lt;, $(QEMU) $(QEMU_OPT=
S) $&lt;, &quot;$&lt; on $(TARGET_NAME)&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $&lt;, $(QEMU) $(QEMU_OPT=
S) ./$&lt;, &quot;$&lt; on $(TARGET_NAME)&quot;)<br>
&gt;<br>
&gt;=C2=A0 run-plugin-%:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $@, $(QEMU) $(QEMU_O=
PTS) \<br>
&gt; @@ -168,7 +168,7 @@ run-%: %<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $&lt;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(QEMU) -monitor none -display=
 none \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c=
hardev file$(COMMA)path=3D$&lt;.out$(COMMA)id=3Doutput \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(QEMU_=
OPTS) $&lt;, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(QEMU_=
OPTS) ./$&lt;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$&lt; on $(TARGET_NAME)&=
quot;)<br>
<br>
That&#39;s weird. I&#39;m not super keen to merge this because it&#39;s inc=
omplete<br>
(we have a large number of manual run-FOO stanzas). AFAICT neither of<br>
the loaders attempt to enumerate and search path so I wonder if this is<br>
a function of the shell?<br></blockquote><div><br></div><div>bsd-user does,=
 in fact, search the path. It does so in loader_exec. It does this,</div><d=
iv>I believe, to support execing native binaries, but I&#39;ll need to chec=
k on that.</div><div><br></div><div>It&#39;s fine if we don&#39;t merge thi=
s just yet.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt;=C2=A0 run-plugin-%:<br>
&gt; diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.=
target<br>
&gt; index a053ca3f15..ae258c47f0 100644<br>
&gt; --- a/tests/tcg/i386/Makefile.target<br>
&gt; +++ b/tests/tcg/i386/Makefile.target<br>
&gt; @@ -21,6 +21,7 @@ run-plugin-test-i386-pcmpistri-%: QEMU_OPTS +=3D -cp=
u max<br>
&gt;=C2=A0 run-test-i386-bmi2: QEMU_OPTS +=3D -cpu max<br>
&gt;=C2=A0 run-plugin-test-i386-bmi2-%: QEMU_OPTS +=3D -cpu max<br>
&gt;<br>
&gt; +CFLAGS +=3D=C2=A0 -Wno-error=3Doverflow<br>
<br>
I&#39;d apply this direct to the test in question rather than a global chan=
ge.<br></blockquote><div><br></div><div>I think we should not apply it at a=
ll. I was so happy to get things compiling</div><div>that I&#39;d raced ahe=
ad of myself: when this is active, the tests fail to run.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 #<br>
&gt;=C2=A0 # hello-i386 is a barebones app<br>
&gt;=C2=A0 #<br>
&gt; diff --git a/tests/tcg/i386/hello-i386.c b/tests/tcg/i386/hello-i386.c=
<br>
&gt; index 59196dd0b7..4a5a25211c 100644<br>
&gt; --- a/tests/tcg/i386/hello-i386.c<br>
&gt; +++ b/tests/tcg/i386/hello-i386.c<br>
&gt; @@ -1,4 +1,10 @@<br>
&gt; +#ifdef __FreeBSD__<br>
&gt; +#include &lt;sys/syscall.h&gt;<br>
&gt; +#define __NR_exit SYS_exit<br>
&gt; +#define __NR_write SYS_write<br>
&gt; +#else<br>
&gt;=C2=A0 #include &lt;asm/unistd.h&gt;<br>
&gt; +#endif<br>
&gt;<br>
&gt;=C2=A0 static inline void exit(int status)<br>
&gt;=C2=A0 {<br></blockquote><div><br></div><div>I can submit this as a sep=
arate thing, but it&#39;s the only patch I&#39;m completely sure of.</div><=
div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; I get down to a failure i the mmap test.... and that&#39;s all I have =
time to plumb the depths<br>
&gt; of this morning... Investigating the mmap test failure will have to wa=
it for another day.<br>
&gt;<br>
&gt; Warner<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/mul=
tiarch/Makefile.target<br>
&gt;=C2=A0 index 85a6fb7a2e..38ee0f1dec 100644<br>
&gt;=C2=A0 --- a/tests/tcg/multiarch/Makefile.target<br>
&gt;=C2=A0 +++ b/tests/tcg/multiarch/Makefile.target<br>
&gt;=C2=A0 @@ -10,7 +10,11 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiar=
ch<br>
&gt;=C2=A0 =C2=A0# Set search path for all sources<br>
&gt;=C2=A0 =C2=A0VPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D $(MULTIARCH_S=
RC)<br>
&gt;=C2=A0 =C2=A0MULTIARCH_SRCS=C2=A0 =C2=A0=3D$(notdir $(wildcard $(MULTIA=
RCH_SRC)/*.c))<br>
&gt;=C2=A0 -MULTIARCH_TESTS=C2=A0 =3D$(filter-out float_helpers, $(MULTIARC=
H_SRCS:.c=3D))<br>
&gt;=C2=A0 +MULTIARCH_SKIP=3Dfloat_helpers<br>
&gt;=C2=A0 +ifeq ($(CONFIG_LINUX),)<br>
&gt;=C2=A0 +MULTIARCH_SKIP+=3Dlinux-test<br>
&gt;=C2=A0 +endif<br>
&gt;=C2=A0 +MULTIARCH_TESTS=C2=A0 =3D$(filter-out $(MULTIARCH_SKIP),$(MULTI=
ARCH_SRCS:.c=3D))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# The following are any additional rules needed to build t=
hings<br>
&gt;=C2=A0 diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64=
/Makefile.target<br>
&gt;=C2=A0 index 2151ea6302..d7a7385583 100644<br>
&gt;=C2=A0 --- a/tests/tcg/x86_64/Makefile.target<br>
&gt;=C2=A0 +++ b/tests/tcg/x86_64/Makefile.target<br>
&gt;=C2=A0 @@ -8,8 +8,12 @@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0include $(SRC_PATH)/tests/tcg/i386/Makefile.target<br>
&gt;<br>
&gt;=C2=A0 +ifneq ($(CONFIG_LINUX),)<br>
&gt;=C2=A0 =C2=A0X86_64_TESTS +=3D vsyscall<br>
&gt;=C2=A0 =C2=A0TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64<br>
&gt;=C2=A0 +else<br>
&gt;=C2=A0 +TESTS=3D$(MULTIARCH_TESTS)<br>
&gt;=C2=A0 +endif<br>
&gt;=C2=A0 =C2=A0QEMU_OPTS +=3D -cpu max<br>
&gt;<br>
&gt;=C2=A0 =C2=A0test-x86_64: LDFLAGS+=3D-lm -lc<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 2.30.2<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000c9d2d005cc324c34--

