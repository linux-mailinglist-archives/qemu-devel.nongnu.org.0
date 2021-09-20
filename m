Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BE411572
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:24:12 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJHH-0002hC-Dq
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJDI-00083H-FC
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:20:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJDF-0002BE-My
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:20:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so29628507wrq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9yRxejweatrNxIZjk0kjobQ1xzMStatk2llZQ1FgaY=;
 b=kf36DGYQtLHjclixqctPL667t8Xkd6DV39vWUqnXF9hnuudAEqPvc9mGp8Yjzp5YI8
 Dqq47xgHvbg/h8emkQSxdC+m+TSz8n3Eqk0SIJjlow/wpwIht/4Ydo0ASxR7AgC1eXHz
 m0QLflG2FE3LUFqjwbta1jiqKSe1EA1j9Wh3TPF0GAK0THdoYCWWS2WEH9KPuBDLu4Cm
 SRd1V2hwmy/BihxbvBxlAPAxORgGvoZ4xBtO4oTTy+ccfDdBy4RUB9byligkXOJy7+DW
 qpX1/3FIAhHYFiCeFg1al/a4V+AGYqbLHccWNxrAV1MOtqfirRvAIHaAIvlResD38NG7
 6I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9yRxejweatrNxIZjk0kjobQ1xzMStatk2llZQ1FgaY=;
 b=fhmB4y9L3dlBSUSpTExc1DHhL8NLbFcNPmjEw5JLU7IlTfu7maFvBe48rb3k4Bajey
 FeyB4udv1ngH2BD1hshNAxok6b+vjFpAjFOU5ueKC2N8cKWJbwX7sNzlVfk5MLM5gIJR
 A/pXlWr16TIGzBEf60P9dS1bDm/puZslWbekK7ddYjKXPRoFnVkPs5Y+iQ4oTakk4WR0
 qWtbQzbebeZwy+oA4+3zhL20UWmwxgvuRLchYwzzeBlUZuJIFJjBrjoeoMZhacs5Ee3Q
 v0BXQFTkzQFNTDtjwBZ7MCgIE6X3I70HjmcZ6PLb1dSJuwFo/CGjIlIuBL0PzbcaG/eU
 HI1A==
X-Gm-Message-State: AOAM530iC/G9tyDm8z/qrKihXln+Le9phyNMInzHdCDaSGCW284UkZQ9
 MERGtMG1r+fb2bdC5+bSkFFw6VSlC7OwO2tgGYiUQA==
X-Google-Smtp-Source: ABdhPJyvPE367iPe/hDP0lNA2JSA1TkiEIlOwgMMP3YjttaXbUB3aPXASDpUDxJcmE6bPPOTOvK69nllRPDHPxQWYDw=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr20498549wmi.37.1632143999726; 
 Mon, 20 Sep 2021 06:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 14:19:07 +0100
Message-ID: <CAFEAcA9rO-M_CS=1BrJO+3-WOPsvcAMYMzhcyqDzOfY21sXeYg@mail.gmail.com>
Subject: Re: [PULL 00/21] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 22:49, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit d1fe59377bbbf91dfded1f08ffe3c636e9db8dc0:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.2-pull-request' into staging (2021-09-16 16:02:31 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210917
>
> for you to fetch changes up to c14620db9b66de88bb4fef1d0cfc283bb3d53f85:
>
>   hw/riscv: opentitan: Correct the USB Dev address (2021-09-17 07:43:55 +1000)
>
> ----------------------------------------------------------------
> Second RISC-V PR for QEMU 6.2
>
>  - ePMP CSR address updates
>  - Convert internal interrupts to use QEMU GPIO lines
>  - SiFive PWM support
>  - Support for RISC-V ACLINT
>  - SiFive PDMA fixes
>  - Update to u-boot instructions for sifive_u
>  - mstatus.SD bug fix for hypervisor extensions
>  - OpenTitan fix for USB dev address
>

Hi; this fails to build on clang:

../../target/riscv/cpu_helper.c:109:64: error: implicit conversion
from 'unsigned long long' to 'target_ulong' (aka 'unsigned int')
changes value from 9223372036854775808 to 0
[-Werror,-Wconstant-conversion]
    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
                 ~~                                            ^~~~~~~~~~~~
../../target/riscv/cpu_bits.h:362:29: note: expanded from macro 'MSTATUS64_SD'
#define MSTATUS64_SD        0x8000000000000000ULL
                            ^~~~~~~~~~~~~~~~~~~~~
1 error generated.


thanks
-- PMM

