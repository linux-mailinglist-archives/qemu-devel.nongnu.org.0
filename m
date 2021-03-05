Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28632E77C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:57:25 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI95A-00074b-Dl
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI93u-0005n5-2j; Fri, 05 Mar 2021 06:56:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI93s-0003OY-C4; Fri, 05 Mar 2021 06:56:05 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so660559wmq.1; 
 Fri, 05 Mar 2021 03:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hA4E+OcaAmpoQKE55qObf4VEwjtSxjkZeFasEcZF7U=;
 b=O6XOAmlwHgtMYjwqV/U3jAF0gd9zmnhu92cqooicTeDqp8Yfjp6eweZdO+Kp69tjyO
 ix8yptsAMSn3JC/rduRldYHpqKUibAuKhxaT+MOZXZYmBfL0+xPbqtIvrfbN/FbzA7TB
 B2s3HvWl86AYQtSUQg8ThpIh4+Yk4q1JvY5mWN5tptZq/niKUxG6QRUnaqvnQOblTKOo
 DMP4s4n4kLBIX3ksTO1yyTCrqV5HAEERpIv9wnEf4A9u2nRfWmnjNFEnI3X4etbfImT3
 /mu1GKKyEpbeCJQ+0w/ukMn0SqZtP9t5zAflVKMjFTyZAV/+s6KH9Dnw8zv4LnakMxci
 /qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hA4E+OcaAmpoQKE55qObf4VEwjtSxjkZeFasEcZF7U=;
 b=tyTZYwurdUO5Rw+2bNGgkglTWhX0AUKWuRm+QvRAhfQ+mchzApAmOB4LSYFhSVosFB
 Ldyuunhu12O8a//dypn9xXjGWOcmz3rmB/ffdtHWUxLFPggWb+BO6G+0claHmUa40biv
 QwbIJKdaztVD5LnD3PCcW+iy/FR7HF9FE1nStZf2cy+EXqiMlc7/6P0wYhLjRkD4nZUE
 ewILMGWKLVXfv8TTLaPHLMcyNLYIk+2Q4HvLFgwhKL3QOeS42C9vtGOs8ul5JTP2yHG5
 ueVymyh23BaPgrllv+/ztdf1kcm92R440lVTQZv2Oh0a8a5+WuBzZADH1y8ojzNLC4sZ
 rvMA==
X-Gm-Message-State: AOAM532R8rpny8GVY2n4pR+bI+HPbJHxyplYLggf1+B7THGeau2ZHY+B
 movKerWdUutNncUkxpl2k2CCiTlkuxk=
X-Google-Smtp-Source: ABdhPJySWe78efU2HnKoBgssGzGk5zgY0mNuMhc9COsI4hZTlXlz+CG/URe1sdpF7kBi+9shfN3IjQ==
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr8358851wmh.11.1614945361915;
 Fri, 05 Mar 2021 03:56:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p18sm4757062wro.18.2021.03.05.03.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 03:56:01 -0800 (PST)
Subject: Re: [PATCH 00/44] hw/arm: New board model mps3-an547
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0942179e-7419-f41b-de41-a1bb2585c166@amsat.org>
Date: Fri, 5 Mar 2021 12:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/19/21 3:45 PM, Peter Maydell wrote:
> This patchseries implements a model of the AN547 FPGA image for the
> MPS3 board.  The main benefit of this new board is that it uses the
> Cortex-M55 CPU and so it allows running guests which use a v8.1M CPU.

> Peter Maydell (44):
>   clock: Add ClockEvent parameter to callbacks
>   clock: Add ClockPreUpdate callback event type
>   clock: Add clock_ns_to_ticks() function
>   hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
>   hw/arm/armsse: Introduce SSE subsystem version property
>   hw/misc/iotkit-sysctl: Remove is_sse200 flag
>   hw/misc/iotkit-secctl.c: Implement SSE-300 PID register values
>   hw/misc/iotkit-sysinfo.c: Implement SSE-300 PID register values
>   hw/arm/armsse.c: Use correct SYS_CONFIG0 register value for SSE-300
>   hw/misc/iotkit-sysinfo.c: Implement SYS_CONFIG1 and IIDR
>   hw/timer/sse-counter: Model the SSE Subsystem System Counter
>   hw/timer/sse-timer: Model the SSE Subsystem System Timer
>   hw/misc/iotkit-sysctl: Add SSE-300 cases which match SSE-200 behaviour
>   hw/misc/iotkit-sysctl: Handle CPU_WAIT, NMI_ENABLE for SSE-300
>   hw/misc/iotkit-sysctl: Handle INITSVTOR* for SSE-300
>   hw/misc/iotkit-sysctl: Implement dummy version of SSE-300 PWRCTRL
>     register
>   hw/misc/iotkit-sysctl: Handle SSE-300 changes to PDCM_PD_*_SENSE
>     registers
>   hw/misc/iotkit-sysctl: Implement SSE-200 and SSE-300 PID register
>     values
>   hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU stanzas to hw/misc
>   hw/misc/sse-cpu-pwrctrl: Implement SSE-300 CPU<N>_PWRCTRL register
>     block
>   hw/arm/armsse: Use an array for apb_ppc fields in the state structure
>   hw/arm/armsse: Add a define for number of IRQs used by the SSE itself
>   hw/arm/armsse: Add framework for data-driven device placement
>   hw/arm/armsse: Move dual-timer device into data-driven framework
>   hw/arm/armsse: Move watchdogs into data-driven framework
>   hw/arm/armsse: Move s32ktimer into data-driven framework
>   hw/arm/armsse: Move sysinfo register block into data-driven framework
>   hw/arm/armsse: Move sysctl register block into data-driven framework
>   hw/arm/armsse: Move PPUs into data-driven framework
>   hw/arm/armsse: Add missing SSE-200 SYS_PPU
>   hw/arm/armsse: Indirect irq_is_common[] through ARMSSEInfo
>   hw/arm/armsse: Add support for SSE variants with a system counter
>   hw/arm/armsse: Add support for TYPE_SSE_TIMER in ARMSSEDeviceInfo
>   hw/arm/armsse: Support variants with ARMSSE_CPU_PWRCTRL block
>   hw/arm/armsse: Add SSE-300 support
>   hw/arm/mps2-tz: Make UART overflow IRQ board-specific
>   hw/misc/mps2-fpgaio: Fold counters subsection into main vmstate
>   hw/misc/mps2-fpgaio: Support AN547 DBGCTRL register
>   hw/misc/mps2-scc: Implement changes for AN547
>   hw/arm/mps2-tz: Support running APB peripherals on different clock
>   hw/arm/mps2-tz: Make initsvtor0 setting board-specific
>   hw/arm/mps2-tz: Add new mps3-an547 board
>   docs/system/arm/mps2.rst: Document the new mps3-an547 board
>   tests/qtest/sse-timer-test: Add simple tests of the SSE timer and
>     counter
> 
>  docs/devel/clocks.rst                |   71 +-
>  docs/system/arm/mps2.rst             |    6 +-
>  include/hw/arm/armsse-version.h      |   42 ++
>  include/hw/arm/armsse.h              |   40 +-
>  include/hw/clock.h                   |   63 +-
>  include/hw/misc/armsse-cpu-pwrctrl.h |   40 +
>  include/hw/misc/iotkit-secctl.h      |    2 +
>  include/hw/misc/iotkit-sysctl.h      |   13 +-
>  include/hw/misc/iotkit-sysinfo.h     |    2 +
>  include/hw/misc/mps2-fpgaio.h        |    2 +
>  include/hw/qdev-clock.h              |   17 +-
>  include/hw/timer/sse-counter.h       |  105 +++
>  include/hw/timer/sse-timer.h         |   53 ++
>  hw/adc/npcm7xx_adc.c                 |    2 +-
>  hw/arm/armsse.c                      | 1008 +++++++++++++++++++-------
>  hw/arm/mps2-tz.c                     |  168 ++++-
>  hw/char/cadence_uart.c               |    4 +-
>  hw/char/ibex_uart.c                  |    4 +-
>  hw/char/pl011.c                      |    5 +-
>  hw/core/clock.c                      |   24 +-
>  hw/core/qdev-clock.c                 |    8 +-
>  hw/mips/cps.c                        |    2 +-
>  hw/misc/armsse-cpu-pwrctrl.c         |  149 ++++
>  hw/misc/bcm2835_cprman.c             |   23 +-
>  hw/misc/iotkit-secctl.c              |   50 +-
>  hw/misc/iotkit-sysctl.c              |  521 ++++++++++---
>  hw/misc/iotkit-sysinfo.c             |   51 +-
>  hw/misc/mps2-fpgaio.c                |   52 +-
>  hw/misc/mps2-scc.c                   |   15 +-
>  hw/misc/npcm7xx_clk.c                |   26 +-
>  hw/misc/npcm7xx_pwm.c                |    2 +-
>  hw/misc/zynq_slcr.c                  |    5 +-
>  hw/timer/cmsdk-apb-dualtimer.c       |    5 +-
>  hw/timer/cmsdk-apb-timer.c           |    4 +-
>  hw/timer/npcm7xx_timer.c             |    6 +-
>  hw/timer/sse-counter.c               |  474 ++++++++++++
>  hw/timer/sse-timer.c                 |  470 ++++++++++++
>  hw/watchdog/cmsdk-apb-watchdog.c     |    5 +-
>  target/mips/cpu.c                    |    2 +-
>  tests/qtest/sse-timer-test.c         |  240 ++++++
>  MAINTAINERS                          |    7 +
>  hw/arm/Kconfig                       |    9 +-
>  hw/misc/Kconfig                      |    9 +
>  hw/misc/meson.build                  |    1 +
>  hw/misc/trace-events                 |    4 +
>  hw/timer/Kconfig                     |    6 +
>  hw/timer/meson.build                 |    2 +
>  hw/timer/trace-events                |   12 +
>  tests/qtest/meson.build              |    1 +
>  49 files changed, 3356 insertions(+), 476 deletions(-)
>  create mode 100644 include/hw/arm/armsse-version.h
>  create mode 100644 include/hw/misc/armsse-cpu-pwrctrl.h
>  create mode 100644 include/hw/timer/sse-counter.h
>  create mode 100644 include/hw/timer/sse-timer.h
>  create mode 100644 hw/misc/armsse-cpu-pwrctrl.c
>  create mode 100644 hw/timer/sse-counter.c
>  create mode 100644 hw/timer/sse-timer.c
>  create mode 100644 tests/qtest/sse-timer-test.c

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

