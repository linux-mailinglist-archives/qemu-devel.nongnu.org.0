Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388DE3BDED6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:18:40 +0200 (CEST)
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0sSl-0002sa-9L
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0sRT-0001zo-BZ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:17:19 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0sRQ-0004kG-OP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:17:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id l24so478596edr.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Gf2wVP/NJzFITJYF6X9w0QkG1vGm8mFLAdhuAlaBGw=;
 b=E6XK0QtdmJBzh8m0ooFzCINe/vg8B1T6t+B3cqry29qFyFSIq4rXOCKDkVhLCKYmU1
 sj7KN+tcjGjfuJe3+umzZ3oqQgtzAJE/e4ut6U8GqDf2jX/dJXdn8EgFR5thlWof07tj
 jdt5NL0xLcrtvW9zQ/y7WfZwrR1c2fNX1GTRKDAqTdcraupThzJQ/SjEkaPUrLGRpc8u
 QcSdxjJQqHdr/CGSQ3fDwy8wt+hamvtw/0EN9aFG1phFMTgn3dJ7e7QAxke4PFh03gAi
 558CfdVRWJJyhxcMe/AzjiiCnC9qff+08jN6VdCaxYrgEX8ZkwJpC4KC9vzzJl2SHbQh
 WGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Gf2wVP/NJzFITJYF6X9w0QkG1vGm8mFLAdhuAlaBGw=;
 b=FOngQQ//RFJmx4vv6TqDnGIPrpNevCSmUYx2ui77njXmg9o9XwAlutdUEKxYw+T0RA
 1qOGw6BNbnzNB8j4dhYFg0TIkiiHVjHws+L7qTwACbEjAv/XxI5tsd/erNrqflyQIEW0
 UDjtuKEtbj6ppbhtgMM/vBVoQu6wmOyOBg3oKJMywchuACrvBFYyKZG/nJeYvtfqvme9
 gCsKirfYnvruvPLRG4gHla168C4t3m3lqFX1aPpzRjNuqYQOtY0o5+Q8weAHfYZ7Mb3u
 2AMMAWT8DrSW2V0MHPtyuzbbV3t/sL4qD0VCmaE886f5trNW7HZUl5T+FY9ao0CaGehp
 PJGQ==
X-Gm-Message-State: AOAM530hAzdMxP4lNPMR3dLj45jVAagwferuRxtaWU3V2x5QxlJ6HXZ1
 AH/QYMxhFB1MQYnuoM3LiblAbzT5S5g+aWFVfgwNDQ==
X-Google-Smtp-Source: ABdhPJzDQ4t7LXcpzfSE3d+q1qvkF/9cn+Tk56gR2DobnH+GBlNsI7eW0m0ooncw+Mfq2/gYrUZK2FYJq/Yv+p6ewJY=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr25532315edz.36.1625606234961; 
 Tue, 06 Jul 2021 14:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210706200558.GT2921206@minyard.net>
In-Reply-To: <20210706200558.GT2921206@minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 22:16:36 +0100
Message-ID: <CAFEAcA-dvSPpKoJ-+ATYcBs6UuLJY1ZKwx-9WYvPyJ+0MYU4ew@mail.gmail.com>
Subject: Re: [GIT PULL] I2C/IPMI bug fixes for QEMU 6.1
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Tue, 6 Jul 2021 at 21:06, Corey Minyard <minyard@acm.org> wrote:
>
> The following changes since commit 38848ce565849e5b867a5e08022b3c755039c11a:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210616' into staging (2021-06-16 17:02:30 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cminyard/qemu.git tags/for-qemu-6.1-1
>
> for you to fetch changes up to 7051d605e6b03259e0185dd574f760b93d15fa10:
>
>   ipmi/sim: fix watchdog_expired data type error in IPMIBmcSim struct (2021-06-25 08:54:57 -0500)
>
> ----------------------------------------------------------------
> Some qemu updates for IPMI and I2C
>
> Move some ADC file to where they belong and move some sensors to a
> sensor directory, since with new BMCs coming in lots of different
> sensors should be coming in.  Keep from cluttering things up.
>
> Add support for I2C PMBus devices.
>
> Replace the confusing and error-prone i2c_send_recv and i2c_transfer with
> specific send and receive functions.  Several errors have already been
> made with these, avoid any new errors.
>
> Fix the watchdog_expired field in the IPMI watchdog, it's not a bool,
> it's a u8.  After a vmstate transfer, the new value could be wrong.
>

Hi; this fails to compile on 32-bit hosts:

../../hw/sensor/max34451.c: In function 'max34451_init':
/home/peter.maydell/qemu/include/qemu/bitops.h:22:38: error: left
shift count >= width of type [-Werror=shift-count-overflow]
 #define BIT(nr)                 (1UL << (nr))
                                      ^
/home/peter.maydell/qemu/include/hw/i2c/pmbus_device.h:253:36: note:
in expansion of macro 'BIT'
 #define PB_HAS_TEMPERATURE         BIT(40)
                                    ^~~
../../hw/sensor/max34451.c:725:37: note: in expansion of macro
'PB_HAS_TEMPERATURE'
         pmbus_page_config(pmdev, i, PB_HAS_TEMPERATURE | PB_HAS_VOUT_MODE);
                                     ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

You probably wanted to define PB_HAS_TEMPERATURE using BIT_ULL().

Sample gitlab CI job failure with this error:
https://gitlab.com/qemu-project/qemu/-/jobs/1403927147

thanks
-- PMM

