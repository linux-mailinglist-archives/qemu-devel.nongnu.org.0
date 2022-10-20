Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F07605C63
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:33:39 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSrq-0002cg-It
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:33:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSrO-0008Dc-Qg
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSbS-0005Sw-9D
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:16:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSbQ-00039l-KE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:16:42 -0400
Received: by mail-pg1-x529.google.com with SMTP id q1so18767088pgl.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iVH5nW8fRw+vaBlwzi9y7uPT2OYwkzy3OO415VaC8tw=;
 b=b2QVKQ5dx4Up52GIkZc+ShI+iGF95BJuIGem/+sRqXrtm/yFyvNBZ1a1manabqAgZk
 Odl0KtHR2o5Gg+uocsg5X6lmUShEnIks4ufq5HsUaKCSWRVG2unCDkWJzJpDtMsNuJxh
 vhDxkjYi6a0tta1Fuwt0h7s/iMPpKT7UQ1kDHfatMGu+wXr+vI8dw1tn5bNuf/pBziwi
 VpnslqC8jMvLXm2fAcUXDEC1K+dO45l/48G0yxoXTlFRvCFlv4heQ4bzapv7eAtGDtG6
 sTZNxFof6TuBKOI885LX3UKIrg8VL1nsZsg/exPwMa7OhjvbKao5kfSUiV1Klde/K2st
 ij3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iVH5nW8fRw+vaBlwzi9y7uPT2OYwkzy3OO415VaC8tw=;
 b=rdKtFo9Z/gtPulOmrvmHxN0MrjSrEw3J+W0rJAUvzVkp3ULpuM3cpi7XFo5F2Jy5I0
 XjIMyUA3tYU8ArTU5Gw70soX0lmQZu7CQCcqOg4UUdN3lbrQEzZOhGzC2SX54rXXdqS5
 baURHbfTco7ukny1iuICkwn6oWHm3zY5pohNqcvexElq2BmFh2b4kWWXdg7K93csbwCo
 Mh2i/XHcZHLiR1zCI0DjyJASjjOdDQ7BUG4zAE1WyVPDkgKeMTXBzhKtg3qjKObLFUa2
 /B15EyzGWgzS0KyJ2GYzbBd7aF7lGIl7dqZOEMui+v0MKGeVbZILc8Om/VaC3QTIyili
 AYIA==
X-Gm-Message-State: ACrzQf3vVFGGuzkbOrGAociwkU3fbJ91qrm6lOF10BMTgYp1HRR+CkQk
 m6ZyP/QZ9qxG7w7myawJjqQWmE2aE+PC+hS9/mcf5g==
X-Google-Smtp-Source: AMsMyM7yhQLvExIk6/huMVGDjko9Sgj1rOl1qTPvcRSOaVQHmOexMGZkUhXEgZw5k+oc9MdyvUizhtGASmSFt+o9TGk=
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr13250784pfk.51.1666260999113; Thu, 20
 Oct 2022 03:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_hi1VHNVetOKkpUXuYtJ4akdVZxwBqSXf76Zvx=YB6Xg@mail.gmail.com>
 <CAFn=p-aoe1QQMXkgdu_yKxb4jCTahsM1K-Fo+vtXOwG=8=_=Lw@mail.gmail.com>
 <12579dec-e80e-3489-79da-9bc93b68472a@redhat.com>
In-Reply-To: <12579dec-e80e-3489-79da-9bc93b68472a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 11:16:26 +0100
Message-ID: <CAFEAcA8XpoMp2mcnZe0QqE7V=YrCJE0dAZ9vXnQUtFdx0xxdLg@mail.gmail.com>
Subject: Re: has anybody looked at the long-standing intermittent raspi2
 avocado test failure?
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Oct 2022 at 08:52, Thomas Huth <thuth@redhat.com> wrote:
>
> On 19/10/2022 22.38, John Snow wrote:
> > On Tue, Oct 18, 2022 at 6:23 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> If you run this single avocado test:
> >>
> >> while ./build/x86/tests/venv/bin/avocado run
> >> build/x86/tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> >> ; do true; done
> >>
> >> then on my machine it will fail within 4 or 5 iterations. Has anybody
> >> looked into this? Looking at a log from a failed test
> >> https://people.linaro.org/~peter.maydell/raspi-avocado-fail.log
> >> what seems to happen is that the test sends the "halt" command to
> >> the guest. The DEBUG log reports a transition from RUNNING to
> >> DISCONNECTING and the QMP connection disconnects, so presumably
> >> the guest really did exit -- or is that something the test framework
> >> is doing from its end?
> [...]
> > "Thanks for the analysis, but, like, what are you going to do to fix
> > any of this?"
> >
> > Long term, an asyncio version of machine.py will help alleviate these
> > kinds of race conditions when dealing with multiple sockets from
> > Python as our testing requirements become more complex.
> >
> > Short term, I'm not sure...
>
> As a short term fix, what about simply changing the test
> like this:
>
> diff a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
>                                                   'BCM2835')
>           exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>                                                   '/soc/cprman@7e101000')
> -        exec_command(self, 'halt')
> +        exec_command_and_wait_for_pattern(self, 'halt', 'System halted')
>           # Wait for VM to shut down gracefully
>           self.vm.wait()
>
> By waiting for another console pattern that the guest sends
> out after "halt", you can make sure that the connection is
> not closed too early.

That is pretty much the patch I'm testing currently :-)

-- PMM

