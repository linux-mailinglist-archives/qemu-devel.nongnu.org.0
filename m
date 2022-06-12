Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC25547A79
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 16:17:30 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0OPB-0000Ix-4y
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 10:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0OO1-00083g-Vy
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 10:16:18 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:47045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0ONz-0000tq-UV
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 10:16:17 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so3613502pjg.5
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F0s1/1xNoDfMJ0eLAgwg7CA8VDBzoqs4az0lw4kSldo=;
 b=sxSkPo8CktRxY3wOEPl8vEYgStxryP18Kojp8pcQb0vpRSoN8Zy5llD/QX9mMj9Sp+
 WsqxGEbjhrOB67VTtIfrTjOYP93V99GI46rroRJ+5hXPQFOM7Tud239soxY2taksTL4v
 m2u6vICw9hD4SHATDN4hzyBZr5a2i/mTvBo22iIiOeRa0WbCOtAidlKAMmUoAq3yDcXH
 p58bctyUV+DNrwEEpx4w71FgrNHBVVm3Drbq9RTqD4nlfcpU/6aYaY0cE5B7UNWRipm1
 vuCh45KDaq6HJWa7snWJln8UYLKH98n9cPzPGAx1OqT1gcWmF5QbZCQAx2Qh7ZwTr3Ev
 JRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F0s1/1xNoDfMJ0eLAgwg7CA8VDBzoqs4az0lw4kSldo=;
 b=F+sqpdbK5tnKt+SBa6Ns9ZUBwlqDTvon92BvbtnQcKNT3OrizA9fpdvST7yvDkdBfX
 9u4e8Z8Bh2RWgZ1K6893DgfHC8t6/Yzhd5BM6Z8oaITUpdLiSoKS/OkheTRsyWhN8/y8
 fuxkN9TAovXQGMbNSFNx+ULoymoLWi0oGpIaA2kibKOFsRgg0D3VKe7c1gkuX/SNN1rB
 iySP0J/Ff/aaElyG89ttluD4IQdMqNNaeEqjd1YuZrJgSZkqTrU3dQaNrkAZAd1KJitd
 FjRrllDG9COShHqf/3/6ivsrqhjTcjtKNw67rhbzHRI1FbFjCmpAcF5Ct9nyG9IRE2DN
 2e0A==
X-Gm-Message-State: AOAM530kWAGpdPCymMDnZwYAss8yU59zglLgTRFPN7vgJrSo5XCrj+ZH
 HvsHdHuWntFNBvViKsNLaI3t7Q==
X-Google-Smtp-Source: ABdhPJwLHC30HDFRvaz6K/IOHPq5MdLG6NlGbPvdNiEGxdKXTG2GITGx4c67+0Nbt8Y0ipgbB0Dt1Q==
X-Received: by 2002:a17:90b:4b4b:b0:1e8:9e0e:c362 with SMTP id
 mi11-20020a17090b4b4b00b001e89e0ec362mr10426913pjb.187.1655043373992; 
 Sun, 12 Jun 2022 07:16:13 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 iw19-20020a170903045300b00163506d51e7sm3116233plb.125.2022.06.12.07.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jun 2022 07:16:12 -0700 (PDT)
Message-ID: <96ffff5d-c748-0d50-6a0c-75c250fb590b@linaro.org>
Date: Sun, 12 Jun 2022 07:16:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL v2 00/50] MIPS patches for 2022-06-11
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220611220053.69027-1-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220611220053.69027-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/11/22 15:00, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Hi Richard,
> 
> In case it is not too late, this v2 includes another fix from Bernhard
> which was supposed to be in v1. Otherwise it will go in the next PR.

The second PR merged well with the first, so I have applied this too.


r~

> 
> The following changes since commit 30796f556790631c86c733ab06756981be0e1def:
> 
>    Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-06-10 18:15:34 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/mips-20220611
> 
> for you to fetch changes up to 6e0c18598814bffb67204a90890fb7b34cad288a:
> 
>    docs/devel: Fix link to developer mailing lists (2022-06-11 23:50:35 +0200)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> - Various TCG fixes (Marcin Nowakowski, Ni Hui, Stefan Pejic, Stefan Pejic)
> - Sysbus floppy controller fix (Peter Maydell)
> - QOM'ification of PIIX southbridge (Mark Cave-Ayland, Bernhard Beschow)
> - Various fixes on ISA devices commonly used by x86/mips machines (Bernhard)
> - Few cleanups in accel/tcg & documentation (Bernhard)
> 
> ----------------------------------------------------------------
> 
> Bernhard Beschow (24):
>    hw/southbridge/piix: Aggregate all PIIX southbridge type names
>    hw/isa/piix4: Use object_initialize_child() for embedded struct
>    hw/isa/piix4: Move pci_map_irq_fn' near pci_set_irq_fn
>    hw/isa/piix4: QOM'ify PCI device creation and wiring
>    hw/isa/piix4: Factor out ISABus retrieval from piix4_create()
>    hw/isa/piix4: QOM'ify PIIX4 PM creation
>    hw/isa/piix4: Inline and remove piix4_create()
>    hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn
>    hw/isa/piix3: QOM'ify PCI device creation and wiring
>    hw/isa/piix3: Factor out ISABus retrieval from piix3_create()
>    hw/isa/piix3: Inline and remove piix3_create()
>    hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
>      fails
>    hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
>      property
>    hw/rtc/mc146818rtc: QOM'ify io_base offset
>    hw: Reuse TYPE_I8042 define
>    hw/audio/cs4231a: Const'ify global tables
>    hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
>    hw/i386/pc: Unexport functions used only internally
>    hw/i386/pc: Remove orphan declarations
>    hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
>    hw/mips/boston: Initialize g_autofree pointers
>    accel/tcg/cpu-exec: Unexport dump_drift_info()
>    accel/tcg: Inline dump_opcount_info() and remove it
>    docs/devel: Fix link to developer mailing lists
> 
> Dragan Mladjenovic (4):
>    target/mips: Fix emulation of nanoMIPS EXTRV_S.H instruction
>    target/mips: Fix emulation of nanoMIPS BPOSGE32C instruction
>    target/mips: Fix emulation of nanoMIPS BNEC[32] instruction
>    target/mips: Fix handling of unaligned memory access for nanoMIPS ISA
> 
> Marcin Nowakowski (1):
>    target/mips: Fix WatchHi.M handling
> 
> Mark Cave-Ayland (11):
>    hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>      piix4_pm_realize()
>    hw/acpi/piix4: change smm_enabled from int to bool
>    hw/acpi/piix4: convert smm_enabled bool to qdev property
>    hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
>    hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>    hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>    hw/acpi/piix4: use qdev gpio to wire up sci_irq
>    hw/acpi/piix4: use qdev gpio to wire up smi_irq
>    hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>      piix4_pm_initfn()
>    hw/isa/piix4.c: create PIIX4_PM device directly instead of using
>      piix4_pm_initfn()
>    hw/acpi/piix4: remove unused piix4_pm_initfn() function
> 
> Ni Hui (6):
>    target/mips: Fix SAT_S trans helper
>    target/mips: Fix df_extract_val() and df_extract_df() dfe lookup
>    target/mips: Fix msa checking condition in trans_msa_elm_fn()
>    target/mips: Do not treat msa INSERT as NOP when wd is zero
>    target/mips: Fix store adress of high 64bit in helper_msa_st_b()
>    target/mips: Fix FTRUNC_S and FTRUNC_U trans helper
> 
> Peter Maydell (1):
>    hw/block/fdc-sysbus: Always mark sysbus floppy controllers as not
>      having DMA
> 
> Stefan Pejic (3):
>    target/mips: Fix emulation of nanoMIPS MTHLIP instruction
>    target/mips: Add missing default cases for some nanoMIPS pools
>    target/mips: Undeprecate nanoMIPS ISA support in QEMU
> 
>   MAINTAINERS                              |   3 +-
>   accel/tcg/cpu-exec.c                     |   4 +-
>   accel/tcg/translate-all.c                |   5 -
>   docs/about/deprecated.rst                |  30 ------
>   docs/devel/submitting-a-patch.rst        |   6 +-
>   hw/acpi/piix4.c                          |  77 +++------------
>   hw/audio/cs4231a.c                       |   8 +-
>   hw/block/fdc-sysbus.c                    |  16 +++-
>   hw/i386/acpi-build.c                     |   1 +
>   hw/i386/microvm-dt.c                     |   9 +-
>   hw/i386/pc.c                             |  17 +++-
>   hw/i386/pc_piix.c                        |  23 +++--
>   hw/isa/piix3.c                           |  98 ++++++++++---------
>   hw/isa/piix4.c                           | 116 ++++++++++++-----------
>   hw/mips/boston.c                         |   3 +-
>   hw/mips/jazz.c                           |   2 +-
>   hw/mips/malta.c                          |   9 +-
>   hw/net/fsl_etsec/etsec.c                 |  23 -----
>   hw/net/fsl_etsec/etsec.h                 |   7 --
>   hw/rtc/mc146818rtc.c                     |   9 +-
>   hw/sparc64/sun4u.c                       |   2 +-
>   include/exec/cpu-all.h                   |   3 -
>   include/hw/acpi/piix4.h                  |  75 +++++++++++++++
>   include/hw/block/fdc.h                   |   3 +-
>   include/hw/i386/pc.h                     |  14 ---
>   include/hw/isa/isa.h                     |   2 -
>   include/hw/rtc/mc146818rtc.h             |   2 +-
>   include/hw/southbridge/piix.h            |  12 +--
>   target/mips/cpu.c                        |   2 +-
>   target/mips/cpu.h                        |   3 +-
>   target/mips/tcg/msa_helper.c             |   2 +-
>   target/mips/tcg/msa_translate.c          |  29 +++---
>   target/mips/tcg/nanomips_translate.c.inc |  33 ++++++-
>   target/mips/tcg/sysemu/cp0_helper.c      |   3 +-
>   target/mips/tcg/translate.c              |   5 +-
>   35 files changed, 335 insertions(+), 321 deletions(-)
>   create mode 100644 include/hw/acpi/piix4.h
> 


