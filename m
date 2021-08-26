Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B763F8F16
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:47:08 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLL9-0002cc-4w
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJLJU-0000uZ-MV
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:45:24 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJLJR-0007eX-Qn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:45:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id s25so6419570edw.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ka+GrntbstIO5gPkwrhtMUkpwdMP0PAqiBe3ZIaeCfo=;
 b=DXY6/QSgQ2Xoo/ON9SGR6ol04bV35S86Iv7UeEe0jsVnNUlIyOziaG3w/yzh4ycyA3
 LpLsLfqwnLifkTau8OoVI4v8lpicQ5hPcyhMEZQwiBkeuOPbcIvo46usXsBIVAn4eb8k
 RzYoQgkNbO7mYUYslLidJUnoB1rTcw9DiyLFp+zACdye5RsM/vNxzIDc04Idp0TUFtxo
 oV1AxbD6FEjI43IJzO2tmTk3BLfueVwilNNSOmmxb8KscrCi4vum0J2DijjBGxKuVERL
 9wSoRpZIM1HcYuF7LFbFI0OhxvgNgs0JvNlhdvXfTDPb9zdhxXX2346VbEssmsuUHF8R
 SsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ka+GrntbstIO5gPkwrhtMUkpwdMP0PAqiBe3ZIaeCfo=;
 b=buetu6OjpK+GuVyDoF4RsV05X2OQtti7Gk5jrnqAvqq978QUttGtnb853DYBcMpfMt
 kzEp6CbYUPZmSCm87gmuX1q8QsQohGVWYFC1rn0luVbuuxouopGXP0TsLFV1VyUzG0my
 aR3NfHrmbu47kcFdpg+cDO702+H0rwn3BZ60BxwPjBJZHiNMbJlzbEaLv/R4XDU7G8Bz
 mPTbeb0rDJrlQkpg98YGYIEfmGAcyMWSiJa2fyl30BoPuvniMxtHUNsHd1l1oObOOCPo
 vCwaE0aZ6GRC9vGyfTumeuZhphCjZSin/LlWZBFMivwIBW/AypkadchOPFI20e3M9PWE
 MfVA==
X-Gm-Message-State: AOAM53047Zkv21I4bQIF1krZZLkHlZZ6b10zwGzys9nJk0oPQhc1FuMg
 f/84Mqpv26e0SA5a3Thw77RGEzoWdRMYORz921xcMjvxN40=
X-Google-Smtp-Source: ABdhPJw2ksnkcBRmUfiTr5tkItjhDBDpOah3Gn1FSGNTdiqJoUUrFgP25GotLYckMm6+UsGEVhrZgqKS+TbkdcykL1c=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr5861854edw.44.1630007119825;
 Thu, 26 Aug 2021 12:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210826170307.27733-1-peter.maydell@linaro.org>
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 20:44:32 +0100
Message-ID: <CAFEAcA_NEf4j9WLCGP17TbKrdzQqPJXWSDYO=FkUh7U1M0pmjQ@mail.gmail.com>
Subject: Re: [PULL 00/37] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Thu, 26 Aug 2021 at 18:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> More accumulated patches from during the freeze...
>
> The following changes since commit c83fcfaf8a54d0d034bd0edf7bbb3b0d16669be9:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-08-26' into staging (2021-08-26 13:42:34 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210826
>
> for you to fetch changes up to d2e6f370138a7f32bc28b20dcd55374b7a638f39:
>
>   hw/arm/xlnx-zynqmp: Add unimplemented APU mmio (2021-08-26 17:02:01 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/dma/xlnx-zdma, xlnx_csu_dma: Require 'dma' link property to be set
>  * hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
>  * target/arm/cpu: Introduce sve_vq_supported bitmap
>  * docs/specs: Convert ACPI spec docs to rST
>  * arch_init: Clean up and refactoring
>  * hw/core/loader: In gunzip(), check index is in range before use, not after
>  * softmmu/physmem.c: Remove unneeded NULL check in qemu_ram_alloc_from_fd()
>  * softmmu/physmem.c: Check return value from realpath()
>  * Zero-initialize sockaddr_in structs
>  * raspi: Use error_fatal for SoC realize errors, not error_abort
>  * target/arm: Avoid assertion trying to use KVM and multiple ASes
>  * target/arm: Implement HSTR.TTEE
>  * target/arm: Implement HSTR.TJDBX
>  * target/arm: Do hflags rebuild in cpsr_write()
>  * hw/arm/xlnx-versal, xlnx-zynqmp: Add unimplemented APU mmio


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

