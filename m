Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C22AE165
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 22:13:39 +0100 (CET)
Received: from localhost ([::1]:37342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaxN-0004e9-QX
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 16:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcavh-0003vm-7D
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:11:53 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcavf-0005P7-9w
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:11:52 -0500
Received: by mail-ed1-x529.google.com with SMTP id o20so14359717eds.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 13:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Bx1oFk93PjSJxg1U+YwIzQ8r27fqDAKxFhVKdf6gxjI=;
 b=Qla1ZDP7gNJHxucT56mcFH0kWhufjlFJAyK+B83gl337b3NUS96GsQZ0pk9dPmf9dl
 NgwM4miRyJWspSOhIgWYFk9ajgANg29jzVrdpxBvRHzbl075qiCcmjVg1C5U/pQNpWg0
 FVzbs14uOP8iaDcLnZehSlnz/aQuaQMtn4ThKwlFb9/zpJEyUD8EMJTY85PzPGRCWX6/
 J6nOaChKGcz/LdVyDLWy9+b3PkNL4zWLTMIAOMB9U40yQLhOg3MNNSPT/I3rcddjKbA5
 bj/k1gbzP5wLmUDhIAdgL9fj0PIx8VQcucjoSkuYm/tDtoP3iffMJED58+AKOlSuQKuX
 vGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Bx1oFk93PjSJxg1U+YwIzQ8r27fqDAKxFhVKdf6gxjI=;
 b=PFqNDqDLQSSi+g1quqleYYHnUVyVFNPJWiSNVEdDm2ZPzPCd02TxnggKCPxqQM5+fE
 TKv9uKxBZWIAOLBlyc2zYjPSxVRPicQd5frcZEPvqbudRTm0FUbpqYQ/3rY0OJ/e0tpR
 AA9J3L84uoJAK3JtsBVYdKZJ7KPEYfVqlOvTxp2+TSRERJcAy9szAli5HlLI/9lNE1gR
 d4DGDjFd5520NO5k+GOGj/p40DTinACwRSd6U/v9d+ZdQyB6S0zX3w+FacMKddSArhMS
 lC14AZToV3lPiuqoFjqgFkESQuSlHSgqCjS7GZfWE5Q2Mc9V9NXMHJaEqQNCwyr1/PC6
 Qb1Q==
X-Gm-Message-State: AOAM530vcUbQAikFRlDWAG7zJhovfOAl0pMpMAAAhkKmn8RsC8ThO1Sy
 VpoCqN9CMLBujjMCNoeJYYk1oBehn7FYasFID82kF/GgpNA=
X-Google-Smtp-Source: ABdhPJw/m7dHXIS1tEv2+ZpGRudQTQhQtOQK9bZTC//h5NZVZJJ3/17/wuwdTS+nThBjVY7rdmS6lCrqIoMuT2A7zlQ=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr1475332edb.52.1605042709276; 
 Tue, 10 Nov 2020 13:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20201110111917.29539-1-peter.maydell@linaro.org>
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 21:11:37 +0000
Message-ID: <CAFEAcA-jhneSqzS4=VfOu36Wx2f=uVwB+1rH_BL6PFzNXqLVnw@mail.gmail.com>
Subject: Re: [PULL 00/16] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 at 11:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Patches for rc1: nothing major, just some minor bugfixes and
> code cleanups.
>
> -- PMM
>
> The following changes since commit f7e1914adad8885a5d4c70239ab90d901ed97e9f:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201109' into staging (2020-11-10 09:24:56 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201110
>
> for you to fetch changes up to b6c56c8a9a4064ea783f352f43c5df6231a110fa:
>
>   target/arm/translate-neon.c: Handle VTBL UNDEF case before VFP access check (2020-11-10 11:03:48 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/Kconfig: ARM_V7M depends on PTIMER
>  * Minor coding style fixes
>  * docs: add some notes on the sbsa-ref machine
>  * hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals
>  * target/arm: Fix neon VTBL/VTBX for len > 1
>  * hw/arm/armsse: Correct expansion MPC interrupt lines
>  * hw/misc/stm32f2xx_syscfg: Remove extraneous IRQ
>  * hw/arm/nseries: Remove invalid/unnecessary n8x0_uart_setup()
>  * hw/arm/musicpal: Don't connect two qemu_irqs directly to the same input
>  * hw/arm/musicpal: Only use qdev_get_gpio_in() when necessary
>  * hw/arm/nseries: Check return value from load_image_targphys()
>  * tests/qtest/npcm7xx_rng-test: count runs properly
>  * target/arm/translate-neon.c: Handle VTBL UNDEF case before VFP access check
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

