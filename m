Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469512CAAB3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:25:38 +0100 (CET)
Received: from localhost ([::1]:55682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkALI-00028c-Vg
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkAJm-0001Gn-C4
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:24:02 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkAJj-0003Al-SF
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:24:02 -0500
Received: by mail-ed1-x52a.google.com with SMTP id ck29so4704961edb.8
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nDylUzpiXOUcneja2ipw/wkuQLpBRFshdUUIzVTRj2s=;
 b=zSJnA9Au2vDYLhNF+DQQxr0VzwXt0ul/1LJa2fSiwkzjeRDxPFDYV5d/OdhzYxPZPf
 jwPFpjv85HKZIgHQLtzR8NvrCWGy+jNTvRdMVmMrOeXuZe+E2ivcjzDY3Wd6aMQkDsh/
 +q2BIb9IcfypIlG0XR2a46yLHaZYrNaAPJ46umiYtvhH3UDIkzM2USBwZCFRbfefQTnW
 24++X28P211mJuWdbXKovndNRIT8KZLBOTv++PPAj3AdrnZiU6scsraK6TI3f1z1JtIh
 dST/AuCEWkjvEZR0NbJZfFJvHhOBaX3DrQmg4GpwVoG11Cr7q4YFuEzsW88aEAWBUtJi
 h+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nDylUzpiXOUcneja2ipw/wkuQLpBRFshdUUIzVTRj2s=;
 b=EI6su/M4WrhIqWwVDA97FOOf8LImRiLQHazw//bD4eIaIFG5QiMVW6mS6sTncmGSoT
 OHT6a4DxQb3QdLFZlP9E6csJXYPzUtRQo4qveHPpVtM5dcWL2SJLeNfhLNPSg5zy3yYO
 pyoPpfznrjnzxCxYf+jobE5Qfm10SZfMZI0bxdZvZlDOjG8eY444G2a1OxI8LmjbIbGQ
 McdasTa9VrXDgQT/KJ9jXiF3BcEnC4jlF3OA4+Ic/69+qAjXdmYEg7vARyK2/wajxElA
 /S8oKI8t8W7rmXtyiDd/So+/S5is6WuPPxW5Zr8Xs+ywnQIJtlgrYAHkhzSGdduncFbA
 Mupw==
X-Gm-Message-State: AOAM531b2sEKXcS/lkc3EGPMnO7iyW9RP52moVZUFtGDiu9N63vm7Zfd
 QQQtPg1qGHaIMM8CF5DPKHVIyy9DXUP4DDhErUU5qw==
X-Google-Smtp-Source: ABdhPJw06IkAzb5w1RYjisAnP8d6cgGyWIvDBre/nwYHnyfQtdyMo349cS2r5o2Q5hQK/KifWzlI2+YOoMcT5n4OZ0E=
X-Received: by 2002:a50:fe88:: with SMTP id d8mr4313199edt.36.1606847038218;
 Tue, 01 Dec 2020 10:23:58 -0800 (PST)
MIME-Version: 1.0
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <CAFEAcA9J0t1UtrNqGxst7-9kCq_+M3+xA6-h+xo3x9Z6Ccc5bw@mail.gmail.com>
 <2747838.e9J7NaK4W3@basile.remlab.net>
In-Reply-To: <2747838.e9J7NaK4W3@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 18:23:46 +0000
Message-ID: <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 17:42, R=C3=A9mi Denis-Courmont
<remi.denis.courmont@huawei.com> wrote:
>
> Le tiistaina 1. joulukuuta 2020, 18.54.36 EET Peter Maydell a =C3=A9crit =
:
> > On Mon, 23 Nov 2020 at 08:02, R=C3=A9mi Denis-Courmont
> >
> > <remi.denis.courmont@huawei.com> wrote:
> > > The following changes since commit
> 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
> > >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-2020=
1122'
> > >   into staging (2020-11-22 15:02:52 +0000)>
> > > follow.
> > >
> > > Changes since version 2:
> > > - Don't set HPFAR.NS in AT instruction in NS state.
> >
> > This series seems to break the 'make check-acceptance' tests. Specifica=
lly
> > the vexpress-a9 image fails to boot:
> >  (20/40)
> > tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexpre=
ssa9
> > : INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> > Timeout reached\nOriginal status: ERROR\n{'name':
> > '20-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ve=
xpres
> > sa9', 'logdir':
> > '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tes... (90=
.23
> > s)
>
> The base tests fail without the patchset seem to assume an US American lo=
cale,
> which is frankly infuriatingly culturally insensitive.

I run them with en_GB.UTF-8, which works fine for me, but it's a bug
in the test suite if something's locale dependent and not ensuring
it is set correctly.

> As for the acceptance tests fail equally early without the patchset with =
a
> completely helpless diagnostic about unresolved references. Wiki does not=
 help
> either.

I just run "make -C my-build-dir check-acceptance"; I don't know anything
about the internals. It would help if you quoted the error messages
you see.

FWIW, I also see a hang on a manual run of a different vexpress-a9
kernel, so the bug is not specific to the check-acceptance tests.

thanks
-- PMM

