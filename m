Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E892DE1EF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:26:11 +0100 (CET)
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDti-0005Uf-Ev
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kqDga-00082H-Du
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:12:36 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kqDgX-0006Hn-WF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:12:35 -0500
Received: by mail-ej1-x630.google.com with SMTP id ga15so2664150ejb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TKlVwNYn4ppL3tgSNc3EI6RujqCWFbgseByPM8GD9qU=;
 b=AHysI51kZeYrtSIlrI1Ha2XlVdNGXO9UUBj4vBBoQSzlnZ02R5DbAF8/Tcb2bRMAA7
 4SfpT/4x5cKO9r2jD2tm77bKl2YENDb2a2cBl7EwVan/4piXxejCMK0qtEljPJSvOkBG
 CHxLEckrjQREgKvtpSfq1TOnPuxVN2Rf3QM0+y8sI6rtB/DrYnxVeS2qCM/R8oh5FxQe
 eBJqYPmqBT9on/FRroDKHVwyu3fmxy9jnBfA4kdR2RtjbUO+MzsJ31NdK3+htFa4gjLR
 XNEyaAnWM698XsSUa+ggFbgN8Zs1TNF0MvA/3r4c1cCEkpBOzuei7AQ2tn8GHvx0XbMI
 2+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TKlVwNYn4ppL3tgSNc3EI6RujqCWFbgseByPM8GD9qU=;
 b=XKrelhVg/zjbeWBnnv2aqvg90ncjTStCuaaiF/3kaIWmcd6jJHnL06KBIfcbsw1WRb
 3MTW4XH0v3+GnZL0Ynoxp3itO/OOn6496sFkRO7i1q2xwH/ehd0vstEsl2I/OWXvNoMz
 9qyj2c3E5gy42fQiaqCjNfRYWNSmkSCX9IwQ3w/YypXy28Lrb+E/dScizO1XtPyp+VnI
 1xbhSx0zvrqtE24ivMihr/QR9wJKlA0cDXmJQnlFRDjvpLIM305hShodPygmyPyna8qL
 Ki1anY+1W6C1h4Au1rG2GVBd/Ol1hj2RxjLC5tfd320ocJg4AQsUpAxnt9N1dr8OyEur
 lrMg==
X-Gm-Message-State: AOAM532wHCQRyA3tiRkQ+lZZecK9WipEUAAyzUTXoJF8XaUwVEwQoEeM
 bEAC2HhfB9EqAtu6B2pI26gO1jK+2z9qZb7Zi3l0cQ==
X-Google-Smtp-Source: ABdhPJxI/LkB2HOw+fB6/hjeCUK2+NJbgdUtGzik3Q+p0jjwIpXiY9MQVxtzQlHNOeF3Hrnqt6sechFMxIjdpChiRD4=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr3487824ejc.85.1608289951941; 
 Fri, 18 Dec 2020 03:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
 <87v9d0q9rr.fsf@linaro.org>
In-Reply-To: <87v9d0q9rr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2020 11:12:20 +0000
Message-ID: <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
Subject: Re: [PULL v2 00/11] testing and configure updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 23:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 17 Dec 2020 at 09:43, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64=
a4b6f:
> >>
> >>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstre=
am' into staging (2020-12-15 21:24:31 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/stsquad/qemu.git tags/pull-testing-171220-2
> >>
> >> for you to fetch changes up to a1c04860cec798914f8cd8ef77fce195f360d36=
e:
> >>
> >>   tests: update for rename of CentOS8 PowerTools repo (2020-12-17 09:3=
8:51 +0000)
> >>
> >> ----------------------------------------------------------------
> >> Testing and configure updates:
> >>
> >>   - add moxie-softmmu to deprecated_targets_list
> >>   - improve cross-build KVM coverage
> >>   - new --without-default-features configure flag
> >>   - add __repr__ for ConsoleSocket for debugging
> >>   - build tcg tests with -Werror
> >>   - test 32 bit builds with fedora
> >>   - remove last traces of debian9
> >>   - hotfix for centos8 powertools repo
> >
> > This seems to fail for x86 builds on my local Linux system with
> > errors like this:
> > make: Entering directory '/home/petmay01/linaro/qemu-for-merges/build/a=
lldbg'
> > MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> > QTEST_QEMU_IMG=3D./qemu-img
> > G_TEST_DBUS_DAEMON=3D/home/petmay01/linaro/qemu-for-merges/tests/dbus-v=
mstate-daemon.sh
> > QTEST_QEMU_BINARY=3D./qemu-system-moxie tests/qtest/qmp-cmd-test --tap
> > -k
> > sh: 1: exec: ./qemu-system-moxie: not found
> > socket_accept failed: Resource temporarily unavailable
> > **
> > ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake=
:
> > assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> > ../../tests/qtest/libqtest.c:172: kill_qemu() tried to terminate QEMU
> > process but encountered exit status 127 (expected 0)
> > ERROR qtest-moxie/qmp-cmd-test - Bail out!
> > ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake=
:
> > assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> > Makefile.mtest:2417: recipe for target 'run-test-300' failed
> > make: *** [run-test-300] Error 1
> > make: Leaving directory '/home/petmay01/linaro/qemu-for-merges/build/al=
ldbg'
> >
> > Something in the Moxie deprecation patch not right?
> > If we didn't build the executable we shouldn't try to
> > run tests for it...
>
> We shouldn't but I can't replicate the failure here. I'm guessing it
> goes away on a "make clean"?

No, the 'alldbg' build is the one that does do a 'make clean';
the build-not-from-clean build worked (presumably because the
old executable was still left in place from the previous build).

thanks
-- PMM

