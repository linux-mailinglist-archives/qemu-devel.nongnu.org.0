Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D8F4762FC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:17:32 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaiR-00084s-If
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxadO-0002tp-Rj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:12:18 -0500
Received: from [2607:f8b0:4864:20::102d] (port=54176
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxadM-0000dM-PT
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:12:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id mj19so3531289pjb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+KaVrdqnVbmmJ/K45/h0w/9lGkfNI7T1bIPgXE8XNx8=;
 b=CYDZnfX0VeUt6x4dShxGNEXHUL/DHY5QGWZGFWGDGI8L7sqx+MAU5zlOH30RbrEq/+
 gH31Zm5cpAUeZm09Mi4cSu/NKr0I8qv/B+b8DtmW/KGNRs5EB9iwpgdE06Ym02Jr0ycu
 6txbjQ6bOpHOALqce3sr03hT1rrdAULg5Z7qLCsm6IZwoX9DmPJGHEzqYiKnW+C0mZH9
 HEDEzjnXrmaKv6KxRljGYphmSN/S1ionh3V2WWUjGr9QufihfZrH7/gJ416S7B4K8bNm
 4mRzUKEDsKZXAgy87+eSeKtYAVBNNWVdqFeDPAbcFaxC3Z4bxFYWpbXCciRp+GJ94fpL
 DcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+KaVrdqnVbmmJ/K45/h0w/9lGkfNI7T1bIPgXE8XNx8=;
 b=dfVew20Koa2nU668+5Hm1aSr5g1oDgamVLqPB8Lsqv/3exByFVh84MYJKDkS987M7e
 6s9AY79hgF011XrG1olHIIP7N+K4W/yJygrvTIJHm72jrQ2HiyiCmbpo4Up4OlWOg5/v
 HmfX1EVG7OfpjfL+WaNSmgDIeDZ9p0TXBrZ+BdKBaDA5+lGWxCp3X7e2To4WawkrimCD
 8bk2dBeteZyq+YAoRNDQxsyJxGjRtuh+rYhYzACiMFqCJrILquZIiOoS/TmcBlwvq5S9
 Ely3Zc0rm//LJaPwsG67yD2BB94bEBlXwnJd8BxcyfAZUsvUjcaFojm9E9gC2ABfOO/3
 1MDQ==
X-Gm-Message-State: AOAM532kLr5+TSRx4epy/IAKi9LkZq+Ad7tgytG0vamlUOWlH+RkoIA7
 0CCVGOQZfaO5epEhLdcLJE3VLs/fwkXSDA==
X-Google-Smtp-Source: ABdhPJwvg/2aZ0mLpMDMF75jxXq6iF9D3iGmXbyWWIAZ3fCBqy1zBkfo7q33e3orJFU5nvUU1Mhnvg==
X-Received: by 2002:a17:902:714f:b0:142:892d:a46 with SMTP id
 u15-20020a170902714f00b00142892d0a46mr12900674plm.39.1639599135248; 
 Wed, 15 Dec 2021 12:12:15 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p2sm2871046pja.55.2021.12.15.12.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:12:14 -0800 (PST)
Subject: Re: [PULL 00/33] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03c9a697-f2d5-1aa4-033a-6fb298c1f4bf@linaro.org>
Date: Wed, 15 Dec 2021 12:12:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/15/21 2:40 AM, Peter Maydell wrote:
> Hi; here's the first target-arm pullreq for the 7.0 cycle.
> 
> thanks
> -- PMM
> 
> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211215
> 
> for you to fetch changes up to aed176558806674d030a8305d989d4e6a5073359:
> 
>    tests/acpi: add expected blob for VIOT test on virt machine (2021-12-15 10:35:26 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * ITS: error reporting cleanup
>   * aspeed: improve documentation
>   * Fix STM32F2XX USART data register readout
>   * allow emulated GICv3 to be disabled in non-TCG builds
>   * fix exception priority for singlestep, misaligned PC, bp, etc
>   * Correct calculation of tlb range invalidate length
>   * npcm7xx_emc: fix missing queue_flush
>   * virt: Add VIOT ACPI table for virtio-iommu
>   * target/i386: Use assert() to sanity-check b1 in SSE decode
>   * Don't include qemu-common unnecessarily
> 
> ----------------------------------------------------------------
> Alex Bennée (1):
>        hw/intc: clean-up error reporting for failed ITS cmd
> 
> Jean-Philippe Brucker (8):
>        hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
>        hw/arm/virt: Remove device tree restriction for virtio-iommu
>        hw/arm/virt: Reject instantiation of multiple IOMMUs
>        hw/arm/virt: Use object_property_set instead of qdev_prop_set
>        tests/acpi: allow updates of VIOT expected data files
>        tests/acpi: add test case for VIOT
>        tests/acpi: add expected blobs for VIOT test on q35 machine
>        tests/acpi: add expected blob for VIOT test on virt machine
> 
> Joel Stanley (4):
>        docs: aspeed: Add new boards
>        docs: aspeed: Update OpenBMC image URL
>        docs: aspeed: Give an example of booting a kernel
>        docs: aspeed: ADC is now modelled
> 
> Olivier Hériveaux (1):
>        Fix STM32F2XX USART data register readout
> 
> Patrick Venture (1):
>        hw/net: npcm7xx_emc fix missing queue_flush
> 
> Peter Maydell (6):
>        target/i386: Use assert() to sanity-check b1 in SSE decode
>        include/hw/i386: Don't include qemu-common.h in .h files
>        target/hexagon/cpu.h: don't include qemu-common.h
>        target/rx/cpu.h: Don't include qemu-common.h
>        hw/arm: Don't include qemu-common.h unnecessarily
>        target/arm: Correct calculation of tlb range invalidate length
> 
> Philippe Mathieu-Daudé (2):
>        hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c
>        hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector
> 
> Richard Henderson (10):
>        target/arm: Hoist pc_next to a local variable in aarch64_tr_translate_insn
>        target/arm: Hoist pc_next to a local variable in arm_tr_translate_insn
>        target/arm: Hoist pc_next to a local variable in thumb_tr_translate_insn
>        target/arm: Split arm_pre_translate_insn
>        target/arm: Advance pc for arch single-step exception
>        target/arm: Split compute_fsr_fsc out of arm_deliver_fault
>        target/arm: Take an exception if PC is misaligned
>        target/arm: Assert thumb pc is aligned
>        target/arm: Suppress bp for exceptions with more priority
>        tests/tcg: Add arm and aarch64 pc alignment tests
> 
>   docs/system/arm/aspeed.rst        |  26 ++++++++++++----
>   include/hw/i386/microvm.h         |   1 -
>   include/hw/i386/x86.h             |   1 -
>   target/arm/helper.h               |   1 +
>   target/arm/syndrome.h             |   5 +++
>   target/hexagon/cpu.h              |   1 -
>   target/rx/cpu.h                   |   1 -
>   hw/arm/boot.c                     |   1 -
>   hw/arm/digic_boards.c             |   1 -
>   hw/arm/highbank.c                 |   1 -
>   hw/arm/npcm7xx_boards.c           |   1 -
>   hw/arm/sbsa-ref.c                 |   1 -
>   hw/arm/stm32f405_soc.c            |   1 -
>   hw/arm/vexpress.c                 |   1 -
>   hw/arm/virt-acpi-build.c          |   7 +++++
>   hw/arm/virt.c                     |  21 ++++++-------
>   hw/char/stm32f2xx_usart.c         |   3 +-
>   hw/intc/arm_gicv3.c               |   2 +-
>   hw/intc/arm_gicv3_cpuif.c         |  10 +-----
>   hw/intc/arm_gicv3_cpuif_common.c  |  22 +++++++++++++
>   hw/intc/arm_gicv3_its.c           |  39 +++++++++++++++--------
>   hw/net/npcm7xx_emc.c              |  18 +++++------
>   hw/virtio/virtio-iommu-pci.c      |  12 ++------
>   linux-user/aarch64/cpu_loop.c     |  46 ++++++++++++++++------------
>   linux-user/hexagon/cpu_loop.c     |   1 +
>   target/arm/debug_helper.c         |  23 ++++++++++++++
>   target/arm/gdbstub.c              |   9 ++++--
>   target/arm/helper.c               |   6 ++--
>   target/arm/machine.c              |  10 ++++++
>   target/arm/tlb_helper.c           |  63 ++++++++++++++++++++++++++++----------
>   target/arm/translate-a64.c        |  23 ++++++++++++--
>   target/arm/translate.c            |  58 ++++++++++++++++++++++++++---------
>   target/i386/tcg/translate.c       |  12 ++------
>   tests/qtest/bios-tables-test.c    |  38 +++++++++++++++++++++++
>   tests/tcg/aarch64/pcalign-a64.c   |  37 ++++++++++++++++++++++
>   tests/tcg/arm/pcalign-a32.c       |  46 ++++++++++++++++++++++++++++
>   hw/arm/Kconfig                    |   1 +
>   hw/intc/Kconfig                   |   5 +++
>   hw/intc/meson.build               |  11 ++++---
>   tests/data/acpi/q35/DSDT.viot     | Bin 0 -> 9398 bytes
>   tests/data/acpi/q35/VIOT.viot     | Bin 0 -> 112 bytes
>   tests/data/acpi/virt/VIOT         | Bin 0 -> 88 bytes
>   tests/tcg/aarch64/Makefile.target |   4 +--
>   tests/tcg/arm/Makefile.target     |   4 +++
>   44 files changed, 429 insertions(+), 145 deletions(-)
>   create mode 100644 hw/intc/arm_gicv3_cpuif_common.c
>   create mode 100644 tests/tcg/aarch64/pcalign-a64.c
>   create mode 100644 tests/tcg/arm/pcalign-a32.c
>   create mode 100644 tests/data/acpi/q35/DSDT.viot
>   create mode 100644 tests/data/acpi/q35/VIOT.viot
>   create mode 100644 tests/data/acpi/virt/VIOT

Applied, thanks.

r~


