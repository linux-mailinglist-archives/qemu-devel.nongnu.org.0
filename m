Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8240FE99
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:25:46 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHcO-0006Ig-UH
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRHaP-0004g3-T9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:23:41 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRHaN-0003JY-9H
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:23:41 -0400
Received: by mail-vs1-xe31.google.com with SMTP id a25so10141260vso.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZWZtVomlJ/D1OHvcVytPSRJwHNawGbk7vuiHVvbx6Q=;
 b=gVDKONdlGyh6zpwh8acGnlHs49g81IyGRo0xMx3p9ZbWrkfH8vD3zPEloXhN4c52eI
 0D0ulo1047bnnaPPF6uMvr9BriezOaUt2Bqsl2ytYFj0XUFE46emrDryWdtgxZUnj3b6
 zyk6Yb8reW7A3GfxF8RCjrJCPBI3sq4u9AnwP0IBJONVoRBsi8geGXqncRePWBdnXjia
 TnwJC3V3ss1bFSfk+4YzxULtEob9ZKu2khpTQyiAJoARMPOWGMD6zfmutj8Qwwl9eUn/
 yKkgomxAtNmGjmAjkSOJ8UbnBxCrUn9+RiAKPHP/BIcxVVlS1YqlRhmEog1mxmqdsKzQ
 oViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZWZtVomlJ/D1OHvcVytPSRJwHNawGbk7vuiHVvbx6Q=;
 b=ZdPu0cX0iDxz4bB5qGlSm6SCDBb4UgHOEmUOg+wMIom34ImTKprKKUKIX4tGKLWuPz
 vab/n9wVasmEXQofhdC/bt3aGT0YPEA8HRYsV906RPqea2CApkMrrWQ+uUrsmzujOYCb
 v8HgoQbXVd3oxWV1z669R9znaCwAsrkQT53WH2JqjUJlMLHz0TYlLaMImC3/pHUiNnvB
 X42LToEGo55fBgaaONq17bCkQmX4Bd7rx1rlzusnQG/wwrH/4cyAjWq621ftmvfKV+Pg
 o8J2AuNpYhxaRGpyXp0ddk9dZWXF4detUboYAnTqV+urVbyHerdwQDOy+ZXUxmSwNrmH
 KtuQ==
X-Gm-Message-State: AOAM531irEmGJHenyyL+lMg9kJWKAQA5k0DLHFs96vX9JAxFNBrH0vNP
 s7gDUyyTFjcqiZyBCpUHnXgFIMDvcqd+xGzZUjWuEw==
X-Google-Smtp-Source: ABdhPJwaUHW+JDUmU69/t0nrUGYT2WmwTDCw5jB7OmgVx/+JT1ShE6zqjypAX3PEkct1rwEe3Nq1d2Upo0beFWvHU8w=
X-Received: by 2002:a05:6102:cd3:: with SMTP id
 g19mr9366510vst.12.1631899413746; 
 Fri, 17 Sep 2021 10:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-4-alex.bennee@linaro.org>
 <CANCZdfo=96hcsaRuWoH0X8LHoRioYfP3OyQjPRQzjbCfCW+7wA@mail.gmail.com>
 <8735q3tgfo.fsf@linaro.org>
 <CANCZdfoR=xBietGR-y_9VpDiinNwOz2u44HGOpOx3CHwKs5fBw@mail.gmail.com>
 <87y27vrw17.fsf@linaro.org>
In-Reply-To: <87y27vrw17.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 11:23:22 -0600
Message-ID: <CANCZdfpGuZcGhox74F7LZkjragD781XydA2caP_Puka9_+RXfg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] tests/tcg: commit Makefile atrocities in the name
 of portability
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ddc94605cc3430d9"
Received-SPF: none client-ip=2607:f8b0:4864:20::e31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe31.google.com
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

--000000000000ddc94605cc3430d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:45 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

>
> Warner Losh <imp@bsdimp.com> writes:
>
> > On Fri, Sep 17, 2021 at 8:39 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g>
> wrote:
> >
> >  Warner Losh <imp@bsdimp.com> writes:
> >
> >  > On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.=
org>
> wrote:
> >  >
> >  >  Not all of the multiarch tests are pure POSIX so elide over those
> >  >  tests on a non-Linux system. This allows for at least some of the
> >  >  tests to be nominally usable by *BSD user builds.
> >  >
> >  >  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >  >  Cc: Warner Losh <imp@bsdimp.com>
> >  >  ---
> >  >   tests/tcg/multiarch/Makefile.target | 6 +++++-
> >  >   tests/tcg/x86_64/Makefile.target    | 4 ++++
> >  >   2 files changed, 9 insertions(+), 1 deletion(-)
> >  >
> >  > Acked-by: Warner Losh <imp@bsdimp.com>
> >  >
> >  > To do this with gcc10, however, I had to add -Wno-error=3Doverflow
> >  > otherwise I got a lot of warnings about constants being truncated to
> >  > 0.
> >  >
> >  > It also fails the sha1 test, but when I run it by hand it works. It
> turns
> >  > out that I have a sha1 in my path, and at least in the bsd-user
> edition
> >  > of qemu-i386 tries to run that and fails.
> >  >
> >  > Also, the hello world program needed tweaking
> >  >
> >  > So with this applied and the following patch
> >  >
> >  > diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> >  > index 63cf1b2573..39420631a8 100644
> >  > --- a/tests/tcg/Makefile.target
> >  > +++ b/tests/tcg/Makefile.target
> >  > @@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)
> >  >
> >  >  ifdef CONFIG_USER_ONLY
> >  >  run-%: %
> >  > -       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on
> $(TARGET_NAME)")
> >  > +       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) ./$<, "$< on
> $(TARGET_NAME)")
> >  >
> >  >  run-plugin-%:
> >  >         $(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
> >  > @@ -168,7 +168,7 @@ run-%: %
> >  >         $(call run-test, $<, \
> >  >           $(QEMU) -monitor none -display none \
> >  >                   -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Dout=
put \
> >  > -                 $(QEMU_OPTS) $<, \
> >  > +                 $(QEMU_OPTS) ./$<, \
> >  >           "$< on $(TARGET_NAME)")
> >
> >  That's weird. I'm not super keen to merge this because it's incomplete
> >  (we have a large number of manual run-FOO stanzas). AFAICT neither of
> >  the loaders attempt to enumerate and search path so I wonder if this i=
s
> >  a function of the shell?
> >
> > bsd-user does, in fact, search the path. It does so in loader_exec. It
> does this,
> > I believe, to support execing native binaries, but I'll need to check
> > on that.
>
> It's certainly different from what linux-user does. The execing of
> native binaries seems a bit niche given you can always pass an explicit
> path. Maybe you could tweak loader_exec to check for the local binary
> first. It seems to skip straight to searching the path if there are no
> /'s in the filename.
>
> This is unrelated to how you handle foreign binaries on the BSDs? Is
> there an equivalent to binfmt_misc?
>

It's a difference in the presentation of args in BSD. When reviewing the
code,
Kyle Evans said:

>> IIRC imgact_binmisc will have the resolved path but preserve argv as
>> it should have been were it not emulated, so we have to re-evaluate
>> the PATH search here because we try to be faithful to the context.

At the time, I confirmed that behavior. Thinking about it, if '.' isn't in
the
path, and we can't find it, then we're not in this condition. So that means
looking for it in '.' also won't break anything and will fix this issue.
I'll
rework bsd-user's bsdload.c to improve the logic.

Warner

--000000000000ddc94605cc3430d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:45 AM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsd=
imp.com</a>&gt; writes:<br>
<br>
&gt; On Fri, Sep 17, 2021 at 8:39 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt;=C2=A0 Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk">imp@bsdimp.com</a>&gt; writes:<br>
&gt;<br>
&gt;=C2=A0 &gt; On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org=
</a>&gt; wrote:<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 Not all of the multiarch tests are pure POSIX so elid=
e over those<br>
&gt;=C2=A0 &gt;=C2=A0 tests on a non-Linux system. This allows for at least=
 some of the<br>
&gt;=C2=A0 &gt;=C2=A0 tests to be nominally usable by *BSD user builds.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<b=
r>
&gt;=C2=A0 &gt;=C2=A0 Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com"=
 target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;=C2=A0 &gt;=C2=A0 ---<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0tests/tcg/multiarch/Makefile.target | 6 +++++-<=
br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0tests/tcg/x86_64/Makefile.target=C2=A0 =C2=A0 |=
 4 ++++<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A02 files changed, 9 insertions(+), 1 deletion(-)=
<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; Acked-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com"=
 target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; To do this with gcc10, however, I had to add -Wno-error=3Do=
verflow<br>
&gt;=C2=A0 &gt; otherwise I got a lot of warnings about constants being tru=
ncated to<br>
&gt;=C2=A0 &gt; 0.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; It also fails the sha1 test, but when I run it by hand it w=
orks. It turns<br>
&gt;=C2=A0 &gt; out that I have a sha1 in my path, and at least in the bsd-=
user edition<br>
&gt;=C2=A0 &gt; of qemu-i386 tries to run that and fails.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; Also, the hello world program needed tweaking<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; So with this applied and the following patch<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile=
.target<br>
&gt;=C2=A0 &gt; index 63cf1b2573..39420631a8 100644<br>
&gt;=C2=A0 &gt; --- a/tests/tcg/Makefile.target<br>
&gt;=C2=A0 &gt; +++ b/tests/tcg/Makefile.target<br>
&gt;=C2=A0 &gt; @@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 ifdef CONFIG_USER_ONLY<br>
&gt;=C2=A0 &gt;=C2=A0 run-%: %<br>
&gt;=C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $&lt;, $(QEMU)=
 $(QEMU_OPTS) $&lt;, &quot;$&lt; on $(TARGET_NAME)&quot;)<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $&lt;, $(QEMU)=
 $(QEMU_OPTS) ./$&lt;, &quot;$&lt; on $(TARGET_NAME)&quot;)<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt;=C2=A0 run-plugin-%:<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $@, $(QEM=
U) $(QEMU_OPTS) \<br>
&gt;=C2=A0 &gt; @@ -168,7 +168,7 @@ run-%: %<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call run-test, $&lt;, \<=
br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(QEMU) -monitor no=
ne -display none \<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-chardev file$(COMMA)path=3D$&lt;.out$(COMMA)id=3Doutput \<br>
&gt;=C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(QEMU_OPTS) $&lt;, \<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(QEMU_OPTS) ./$&lt;, \<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$&lt; on $(TA=
RGET_NAME)&quot;)<br>
&gt;<br>
&gt;=C2=A0 That&#39;s weird. I&#39;m not super keen to merge this because i=
t&#39;s incomplete<br>
&gt;=C2=A0 (we have a large number of manual run-FOO stanzas). AFAICT neith=
er of<br>
&gt;=C2=A0 the loaders attempt to enumerate and search path so I wonder if =
this is<br>
&gt;=C2=A0 a function of the shell?<br>
&gt;<br>
&gt; bsd-user does, in fact, search the path. It does so in loader_exec. It=
 does this,<br>
&gt; I believe, to support execing native binaries, but I&#39;ll need to ch=
eck<br>
&gt; on that.<br>
<br>
It&#39;s certainly different from what linux-user does. The execing of<br>
native binaries seems a bit niche given you can always pass an explicit<br>
path. Maybe you could tweak loader_exec to check for the local binary<br>
first. It seems to skip straight to searching the path if there are no<br>
/&#39;s in the filename.<br>
<br>
This is unrelated to how you handle foreign binaries on the BSDs? Is<br>
there an equivalent to binfmt_misc?<br></blockquote><div><br></div><div>It&=
#39;s a difference in the presentation of args in BSD. When reviewing the c=
ode,</div><div>Kyle Evans said:</div><div><br></div>&gt;&gt; IIRC imgact_bi=
nmisc will have the resolved path but preserve argv as<br>&gt;&gt; it shoul=
d have been were it not emulated, so we have to re-evaluate<br><div>&gt;&gt=
; the PATH search here because we try to be faithful to the context.</div><=
div><br></div><div>At the time, I confirmed that behavior. Thinking about i=
t, if &#39;.&#39; isn&#39;t in the</div><div>path, and we can&#39;t find it=
, then we&#39;re not in this condition. So that means</div><div>looking for=
 it in &#39;.&#39; also won&#39;t break anything and will fix this issue. I=
&#39;ll</div><div>rework bsd-user&#39;s bsdload.c to improve the logic.</di=
v><div><br></div><div>Warner</div></div></div>

--000000000000ddc94605cc3430d9--

