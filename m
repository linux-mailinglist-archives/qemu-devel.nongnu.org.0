Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2CB2F1789
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:08:17 +0100 (CET)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxrk-0001WZ-He
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kyxpb-0000dz-2h
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:06:03 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kyxpY-0002Pg-Ve
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:06:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m5so16541016wrx.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2N7VJT96EzZVBfPcm7nqKEb4FbZgIQT81XTJMhZzGlY=;
 b=ZC/8zS03ugGOynQ+p+s+5r+F80+zXRHBsQWyjWc+qB4YQ/VrvCf2TqSPflnuMT0gDY
 hNsGmmu+cgSxmyNn+w49wujYUP+tFuEv5Wzr4l4a5qzQj1L8q+r/J+6IIEUlB+wY+ZcK
 5A8WTgddUEnE6BME/kpQko+hphyWv4ovyBRYWeSh1HarDoga3Y298HAxOCyRsWvewN3I
 2pKfU0pUsd/KHuiFWXImYzvMvPUdZolgLeQvWTr1cqCX6VuNqtJP7g56CcPkOFaNxuUu
 fRKsFUMk3N4Xyyjx15W52fM/lPnLWhYTGbzxEYL6G5D5KVeJWX9e8u+MXql2JqObESLH
 GDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2N7VJT96EzZVBfPcm7nqKEb4FbZgIQT81XTJMhZzGlY=;
 b=d7Tc54V5OasDUgngV/hBF6GkMsNBxm0bNoHtMYLAsSrLSaCYWFICTNS5Xu2Lno+XZi
 P8jemhVXB5vLGIfe9CjP9Pc3zMJTCsNZOmPyNt/evhsM8714j9z6BHFpV2Yj32yc6EGf
 dhK9AT1JYbWgOCy6olIg1LTMHSGA3HNG0+BhjC9N9XCHSnXSgibklc5L2Cj5eVbb/jgu
 Cz0imbHmUvkH7HujkP+5vOQdXQ9whr2kx3211sUp0vl/BRI8iA7XElXn3cR5qFLTw/Fm
 Uz2DSJKSufVckVte76nIlxLT0kpZS80PNsCCMEJFMxcbucT9dgZx5bV4MxPMdJogbGNk
 g6Aw==
X-Gm-Message-State: AOAM533ZfNr9Xg1CIEmZ9kn+Pqj1fVxxvmH4IWJxYIeYszZYUlEiXmgn
 dFscGjviUCEijuA2B/13ZI5UqEvsQKxG9g==
X-Google-Smtp-Source: ABdhPJzS6ObzLTRpuG5Hi8KjdS9pseMxXl3Qhpn3zkp/+C7RaW9PMgtKS7CLWE0aChIDGyrN5J5dog==
X-Received: by 2002:adf:8342:: with SMTP id 60mr16616454wrd.140.1610373958651; 
 Mon, 11 Jan 2021 06:05:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm21432270wml.34.2021.01.11.06.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 06:05:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4CB21FF7E;
 Mon, 11 Jan 2021 14:05:56 +0000 (GMT)
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
 <1301fc86-b356-b4a8-42c1-bf7705419a5e@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: check-tcg HOWTO?
Date: Mon, 11 Jan 2021 13:35:27 +0000
In-reply-to: <1301fc86-b356-b4a8-42c1-bf7705419a5e@suse.de>
Message-ID: <8735z7pnzv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Hi Alex,
>
> happy new year,
>
> I am trying to get check-tcg to run reliably,
> as I am doing some substantial refactoring of tcg cpu operations, so I ne=
ed to verify that TCG is fine.
>
> This is an overall getting started question, is there a how-to on how
> to use check-tcg and how to fix things when things don't go smoothly?

Not really but I could certainly add something. Generally I just run the
tests manually in gdb when I'm trying to debug stuff.

> I get different results on different machines for check-tcg, although the=
 runs are containerized,
> on one machine the tests for aarch64 tcg are SKIPPED completely (so no
> errors),

The compiles *may* be containerized - the runs are always in your host
environment. It's one of the reasons the binaries are built as static
images so you don't need to mess about with dynamic linking and
libraries.

The only reason some tests get skipped is if you have a locally
installed cross compiler which doesn't support some architecture
features (e.g. CROSS_CC_HAS_SVE).

> on the other machine I get:
>
> qemu-system-aarch64: terminating on signal 15 from pid 18583 (timeout)
> qemu-system-aarch64: terminating on signal 15 from pid 18584 (timeout)
> qemu-system-aarch64: terminating on signal 15 from pid 18585 (timeout)
> make[2]: *** [../Makefile.target:162: run-hello] Error 124
> make[2]: *** Waiting for unfinished jobs....
> make[2]: *** [../Makefile.target:162: run-pauth-3] Error 124
> make[2]: *** [../Makefile.target:162: run-memory] Error 124

Given it's timing out on hello I guess it's the shutdown deadlocking.
Running with V=3D1 will give you the command line but the semihosting
config is setup for redirect. So I usually build my own command line. e.g.:

  ./qemu-system-aarch64 -monitor none -display none \
    -chardev stdio,id=3Doutput  \
    -M virt -cpu max -display none \
    -semihosting-config enable=3Don,target=3Dnative,chardev=3Doutput \
    -kernel tests/tcg/aarch64-softmmu/hello

There is nothing particularly special apart from making sure semihosting
is wired up for the output. Apart from some special cases like
test-mmap-XXXX most tests don't take any arguments.

>
> Both are configured with=20
>
> configure --enable-tcg
>
> Anything more than V=3D1 to get more output?

The output is normally dumped in $TESTNAME.out in the appropriate
$BUILDDIR/tests/tcg/$TARGET/ directory.

> How do I debug and get logs and cores out of containers?

As I mentioned above the tests are not run in containers, just the
compiles (if local compilers are missing).

>
> in tests/tcg/ there is:
>
> a README (with no hint unfortunately) ,

Woefully out of date I'm afraid. What docs we have are in docs/devel/testin=
g.rst

> Makefile.qemu

Links into the main tests/Makefile.include - invoked for each target

> Makefile.prereqs

This ensures docker images are built (if required) for each set of tests.

> Makefile.target

This is the main (rather simple) makefile which provides the build and
run targets. You can run directly if you are in the right build dir, eg:

  13:58:10 [alex@zen:~/l/q/b/a/t/t/aarch64-softmmu] |=E2=9C=94 + pwd
  /home/alex/lsrc/qemu.git/builds/arm.all/tests/tcg/aarch64-softmmu
  13:58:57 [alex@zen:~/l/q/b/a/t/t/aarch64-softmmu] |=E2=9C=94 +
  make  -f ~/lsrc/qemu.git/tests/tcg/Makefile.target TARGET=3D"aarch64-soft=
mmu" SRC_PATH=3D"/home/alex/lsrc/qemu.git" run

But TBH this is functionally equivalent to calling:

  make run-tcg-tests-aarch64-softmmu

in your main build directory.

> There are a bunch of variables in these files, which seem to be
> possible to configure, am I expected to set some of those?

Not really. Most of the magic variables from:

  tests/tcg/config-$TARGET.mak

which is built by tests/tcg/configure.sh during the configure step.

> I think that it would be beneficial to have either more documentation
> or more immediately actionable information out of make check failures;

V=3D1 should show the command lines run and then you should be able to run
the tests directly yourself.

> Any help you could give me to make some progess?

Hope that helps.

>
> Thanks,
>
> Claudio


--=20
Alex Benn=C3=A9e

