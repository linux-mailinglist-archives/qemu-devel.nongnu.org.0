Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD440FE24
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:48:39 +0200 (CEST)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRH2U-0007cv-J2
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGzB-0005Nx-U1
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:45:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGzA-0005YO-3v
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:45:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id q26so16166128wrc.7
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RXNRs2YChbM2q/tazkXpFs70yL3wLXFi3eLTjH8y224=;
 b=HBAYANXP/DEYVuebTczJMsUDr6nk8iK6Ryg5ly7JbgnCRpi3188EH/jXnkaalgSf5I
 JGJJAeAtTg7wiXFhrd/VpVFHEL860DL4EpvE4Y9ExkWYn2I7Kv8jvLpIhdjyBIsdVS7p
 f2TVm4dc+vNF5tqlrbCQgKS62FLE6wwFjw9XdwA7i4fm5SBjgI7Kp0MhffzRF9UNcOy+
 UQbfKnGXmOv2oFTZZTkU8RwChSnsXhjn65PGsBNGdBjuqCf2pPDap5FNK+NROJBv1H95
 OE4H63OmWk1GmKm8jVx1L/6zcaiexkU3e1RTgSTZjIpxE1b/dsfFncrwbxgzIYk7aLWF
 ZtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RXNRs2YChbM2q/tazkXpFs70yL3wLXFi3eLTjH8y224=;
 b=fdOndJ2v+aJdCWUACgD9+aM8m87RkBEIkeEZ9RwIryRpYV15vEIwx41v0RLXFpw4AL
 WxiJ8mNCaQhg1vz5v56w7JIfqOv85DPTJUvVsvlIREfW9PARk0eZeK08nsMRIHZITgQ0
 U63TCeXXaFLQgUk7SFyN0gbMDUgH9QEGiifW0uiLfV5vf1ZSUb8/hqQlP8SMum8JD16a
 HGUCLPlv49L1NUS8R2+NY9wWqvaoD1iFyDGxn54H/ya7W0G5Tkpjje6mNhSQshGjKrOU
 UpI2rJQOchD3N3TQiPh8DlnKY2AeIvIJZottdh2cO9J/vpOWuBnd+W/Og2sRqP8O9aVL
 Wjpg==
X-Gm-Message-State: AOAM531IHDCvUT07YRltynANOP+0R7Yq7kacMhjvXG9F+tbSkmldlTD4
 6tsIdR132AmFWvJNWeuZPAPkAw==
X-Google-Smtp-Source: ABdhPJwZ3Q3a9tkSGT13B8atfdVboXrNiCx8IqRkAJkinwKVENItyIEMskqgje9vcdBo1sdIOpjYNg==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr13174759wrl.335.1631897110318; 
 Fri, 17 Sep 2021 09:45:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s3sm2571425wra.72.2021.09.17.09.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:45:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A62EC1FF96;
 Fri, 17 Sep 2021 17:45:08 +0100 (BST)
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-4-alex.bennee@linaro.org>
 <CANCZdfo=96hcsaRuWoH0X8LHoRioYfP3OyQjPRQzjbCfCW+7wA@mail.gmail.com>
 <8735q3tgfo.fsf@linaro.org>
 <CANCZdfoR=xBietGR-y_9VpDiinNwOz2u44HGOpOx3CHwKs5fBw@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [RFC PATCH 3/3] tests/tcg: commit Makefile atrocities in the
 name of portability
Date: Fri, 17 Sep 2021 17:41:16 +0100
In-reply-to: <CANCZdfoR=xBietGR-y_9VpDiinNwOz2u44HGOpOx3CHwKs5fBw@mail.gmail.com>
Message-ID: <87y27vrw17.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, "Daniel P.
 Berrange" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Warner Losh <imp@bsdimp.com> writes:

> On Fri, Sep 17, 2021 at 8:39 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>  Warner Losh <imp@bsdimp.com> writes:
>
>  > On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>  >
>  >  Not all of the multiarch tests are pure POSIX so elide over those
>  >  tests on a non-Linux system. This allows for at least some of the
>  >  tests to be nominally usable by *BSD user builds.
>  >
>  >  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  >  Cc: Warner Losh <imp@bsdimp.com>
>  >  ---
>  >   tests/tcg/multiarch/Makefile.target | 6 +++++-
>  >   tests/tcg/x86_64/Makefile.target    | 4 ++++
>  >   2 files changed, 9 insertions(+), 1 deletion(-)
>  >
>  > Acked-by: Warner Losh <imp@bsdimp.com>
>  >
>  > To do this with gcc10, however, I had to add -Wno-error=3Doverflow
>  > otherwise I got a lot of warnings about constants being truncated to
>  > 0.
>  >
>  > It also fails the sha1 test, but when I run it by hand it works. It tu=
rns
>  > out that I have a sha1 in my path, and at least in the bsd-user edition
>  > of qemu-i386 tries to run that and fails.
>  >
>  > Also, the hello world program needed tweaking
>  >
>  > So with this applied and the following patch
>  >
>  > diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
>  > index 63cf1b2573..39420631a8 100644
>  > --- a/tests/tcg/Makefile.target
>  > +++ b/tests/tcg/Makefile.target
>  > @@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)
>  >
>  >  ifdef CONFIG_USER_ONLY
>  >  run-%: %
>  > -       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_=
NAME)")
>  > +       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) ./$<, "$< on $(TARGE=
T_NAME)")
>  >
>  >  run-plugin-%:
>  >         $(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
>  > @@ -168,7 +168,7 @@ run-%: %
>  >         $(call run-test, $<, \
>  >           $(QEMU) -monitor none -display none \
>  >                   -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutpu=
t \
>  > -                 $(QEMU_OPTS) $<, \
>  > +                 $(QEMU_OPTS) ./$<, \
>  >           "$< on $(TARGET_NAME)")
>
>  That's weird. I'm not super keen to merge this because it's incomplete
>  (we have a large number of manual run-FOO stanzas). AFAICT neither of
>  the loaders attempt to enumerate and search path so I wonder if this is
>  a function of the shell?
>
> bsd-user does, in fact, search the path. It does so in loader_exec. It do=
es this,
> I believe, to support execing native binaries, but I'll need to check
> on that.

It's certainly different from what linux-user does. The execing of
native binaries seems a bit niche given you can always pass an explicit
path. Maybe you could tweak loader_exec to check for the local binary
first. It seems to skip straight to searching the path if there are no
/'s in the filename.

This is unrelated to how you handle foreign binaries on the BSDs? Is
there an equivalent to binfmt_misc?

--=20
Alex Benn=C3=A9e

