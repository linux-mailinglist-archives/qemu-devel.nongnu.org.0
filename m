Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A20611B89
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 22:27:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVvS-0000pg-OH; Fri, 28 Oct 2022 16:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooVvL-0000nZ-Ha; Fri, 28 Oct 2022 16:25:55 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooVvJ-0005cB-Cl; Fri, 28 Oct 2022 16:25:51 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 r15-20020a4abf0f000000b004761c7e6be1so919104oop.9; 
 Fri, 28 Oct 2022 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unYp+qKfhOyqy/g7pb5iaAS3D8usk97q4Y7pPeg+meY=;
 b=YtySHcXwFw8NB5D45z9dKLaOCc3vxgSAy46RhIGbIRjoeBL1+eIcDZbGUAU5ZPkxmm
 C5lvHCJ0hOtuQtYmCY0B1nlKhtjhGmpHNAaiNwusWinapeVmdE/kISe1yf8Pqa5tFtn5
 idBvFcxXUigRm/Nv16mu9kHoLHGlYHB0+XWDQV69SpZCnmaJBaEcnBErPOJjWiT/nSkD
 FERLkdF/5wCikdcVpKBOxkkYEaS/udxxKSGqlTYF22Ghv+g/bWLW0xHBJ9OvDzJQefhf
 mzBGvjMwzVY5gv6klQfgy6RxLRE69XAqiBBMcoCys7VzaxA0OPTUnNX43rTmHNzuuvvl
 k2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=unYp+qKfhOyqy/g7pb5iaAS3D8usk97q4Y7pPeg+meY=;
 b=TO+PgGAseg8HMEikiALnnj/bxd5rcXy4gaTElWsfiHlg3tud+HQO/dfrEv5Zg23r6I
 KSztxb6lej/6sEK/+dGz3XFSyS27RxwuPqmcZsxO1L5df7JG3ZO1o25aBR6mIlnPcKmx
 p1P761Sq3qN2RJBUGqgTrAcEfJeufUiG4IvBDfX4vIPZnm4RdzIuG0KNW2TZYeQGr0zb
 fuhgpusr7cxB3ThN67v9JfK06dHpjpsmX/8m7WaPlcQ4DSv8CXBFWQPELLDs6wLB170O
 WjnNmjyqWTjZmahq+djFa95MAKfrjHwvJZWAFH/UE5/Rs6BxozIW7LqloIyYSV30MAjb
 uAKQ==
X-Gm-Message-State: ACrzQf0Rn6qwUXzQSm8tDTS/AGX3A2SuZPW4cKQNF74yXXZSjlN7VYSi
 /35iLMuto9D+a3ss7WLXviEV347jypxQlA==
X-Google-Smtp-Source: AMsMyM584KqXipFiTEQ0Njl+rpW4EC2mUC2ytSfQaRrZIYLvA+9qFFlN3RJAYm5N/DzFGLyr5eiRsw==
X-Received: by 2002:a4a:9506:0:b0:476:4812:3edf with SMTP id
 m6-20020a4a9506000000b0047648123edfmr563921ooi.62.1666988747333; 
 Fri, 28 Oct 2022 13:25:47 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a544617000000b00350a8b0637asm1852092oip.47.2022.10.28.13.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 13:25:46 -0700 (PDT)
Message-ID: <755f3a30-c29e-4f02-813e-a2e14e854694@gmail.com>
Date: Fri, 28 Oct 2022 17:25:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PULL 00/62] ppc queue
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com
References: <20221028163951.810456-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan,

I'll re-send this pull request due to a last minute regression that was
fixed a couple hours ago.


Thanks,


Daniel

On 10/28/22 13:38, Daniel Henrique Barboza wrote:
> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
> 
>    Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221028
> 
> for you to fetch changes up to 1a4ef9d45dbe6be588735a989e8ed3764a2fcf49:
> 
>    hw/ppc/e500: Implement pflash handling (2022-10-28 13:26:20 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-10-28:
> 
> This queue has the second part of the ppc4xx_sdram cleanups, doorbell
> instructions for POWER8 and new pflash handling for the e500 machine.
> 
> It also has a lot of performance optimizations in the PowerPC emulation
> done by the researchers of the Eldorado institute. Between using gvec
> for VMX/VSX instructions, a full rework of the interrupt model and PMU
> optimizations, they managed to drastically speed up the emulation of
> powernv8/9/10 machines.  Here's an example with avocado tests:
> 
> - with master:
> 
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:
> PASS (38.89 s)
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:
> PASS (43.89 s)
> 
> - with this queue applied:
> 
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:
> PASS (21.23 s)
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:
> PASS (22.58 s)
> 
> Other ppc machines, like pseries, also had a noticeable performance
> boost.
> 
> ----------------------------------------------------------------
> BALATON Zoltan (8):
>        ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
>        ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
>        ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
>        ppc4xx_sdram: Use hwaddr for memory bank size
>        ppc4xx_sdram: Rename local state variable for brevity
>        ppc4xx_sdram: Generalise bank setup
>        ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>        ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
> 
> Bernhard Beschow (5):
>        docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>        hw/block/pflash_cfi0{1, 2}: Error out if device length isn't a power of two
>        hw/sd/sdhci-internal: Unexport ESDHC defines
>        hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>        hw/ppc/e500: Implement pflash handling
> 
> Leandro Lupori (2):
>        target/ppc: Add new PMC HFLAGS
>        target/ppc: Increment PMC5 with inline insns
> 
> Lucas Mateus Castro (alqotel) (12):
>        target/ppc: Moved VMLADDUHM to decodetree and use gvec
>        target/ppc: Move VMH[R]ADDSHS instruction to decodetree
>        target/ppc: Move V(ADD|SUB)CUW to decodetree and use gvec
>        target/ppc: Move VNEG[WD] to decodtree and use gvec
>        target/ppc: Move VPRTYB[WDQ] to decodetree and use gvec
>        target/ppc: Move VAVG[SU][BHW] to decodetree and use gvec
>        target/ppc: Move VABSDU[BHW] to decodetree and use gvec
>        target/ppc: Use gvec to decode XV[N]ABS[DS]P/XVNEG[DS]P
>        target/ppc: Use gvec to decode XVCPSGN[SD]P
>        target/ppc: Moved XVTSTDC[DS]P to decodetree
>        target/ppc: Moved XSTSTDC[QDS]P to decodetree
>        target/ppc: Use gvec to decode XVTSTDC[DS]P
> 
> Matheus Ferst (35):
>        target/ppc: fix msgclr/msgsnd insns flags
>        target/ppc: fix msgsync insns flags
>        target/ppc: fix REQUIRE_HV macro definition
>        target/ppc: move msgclr/msgsnd to decodetree
>        target/ppc: move msgclrp/msgsndp to decodetree
>        target/ppc: move msgsync to decodetree
>        target/ppc: define PPC_INTERRUPT_* values directly
>        target/ppc: always use ppc_set_irq to set env->pending_interrupts
>        target/ppc: split interrupt masking and delivery from ppc_hw_interrupt
>        target/ppc: prepare to split interrupt masking and delivery by excp_model
>        target/ppc: create an interrupt masking method for POWER9/POWER10
>        target/ppc: remove unused interrupts from p9_next_unmasked_interrupt
>        target/ppc: create an interrupt deliver method for POWER9/POWER10
>        target/ppc: remove unused interrupts from p9_deliver_interrupt
>        target/ppc: remove generic architecture checks from p9_deliver_interrupt
>        target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER9
>        target/ppc: add power-saving interrupt masking logic to p9_next_unmasked_interrupt
>        target/ppc: create an interrupt masking method for POWER8
>        target/ppc: remove unused interrupts from p8_next_unmasked_interrupt
>        target/ppc: create an interrupt deliver method for POWER8
>        target/ppc: remove unused interrupts from p8_deliver_interrupt
>        target/ppc: remove generic architecture checks from p8_deliver_interrupt
>        target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER8
>        target/ppc: add power-saving interrupt masking logic to p8_next_unmasked_interrupt
>        target/ppc: create an interrupt masking method for POWER7
>        target/ppc: remove unused interrupts from p7_next_unmasked_interrupt
>        target/ppc: create an interrupt deliver method for POWER7
>        target/ppc: remove unused interrupts from p7_deliver_interrupt
>        target/ppc: remove generic architecture checks from p7_deliver_interrupt
>        target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER7
>        target/ppc: add power-saving interrupt masking logic to p7_next_unmasked_interrupt
>        target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
>        target/ppc: introduce ppc_maybe_interrupt
>        target/ppc: unify cpu->has_work based on cs->interrupt_request
>        target/ppc: move the p*_interrupt_powersave methods to excp_helper.c
> 
>   docs/system/ppc/ppce500.rst                    |  25 +-
>   hw/block/pflash_cfi01.c                        |   8 +-
>   hw/block/pflash_cfi02.c                        |   5 +
>   hw/ppc/Kconfig                                 |   1 +
>   hw/ppc/e500.c                                  |  79 +++
>   hw/ppc/meson.build                             |   3 +-
>   hw/ppc/pnv_core.c                              |   1 +
>   hw/ppc/ppc.c                                   |  17 +-
>   hw/ppc/ppc440_uc.c                             | 332 ----------
>   hw/ppc/ppc4xx_devs.c                           | 414 ------------
>   hw/ppc/ppc4xx_sdram.c                          | 757 ++++++++++++++++++++++
>   hw/ppc/spapr_hcall.c                           |   6 +
>   hw/ppc/spapr_rtas.c                            |   2 +-
>   hw/ppc/trace-events                            |   3 +-
>   hw/sd/sdhci-internal.h                         |  20 -
>   hw/sd/sdhci.c                                  |  63 +-
>   include/hw/ppc/ppc4xx.h                        |  20 +-
>   target/ppc/cpu.c                               |   4 +
>   target/ppc/cpu.h                               |  47 +-
>   target/ppc/cpu_init.c                          | 212 +-----
>   target/ppc/excp_helper.c                       | 863 ++++++++++++++++++++++---
>   target/ppc/fpu_helper.c                        | 137 ++--
>   target/ppc/helper.h                            |  44 +-
>   target/ppc/helper_regs.c                       |   8 +
>   target/ppc/insn32.decode                       |  58 ++
>   target/ppc/int_helper.c                        | 107 +--
>   target/ppc/misc_helper.c                       |  11 +-
>   target/ppc/power8-pmu.c                        |  74 +--
>   target/ppc/power8-pmu.h                        |   3 +
>   target/ppc/translate.c                         | 130 ++--
>   target/ppc/translate/processor-ctrl-impl.c.inc | 105 +++
>   target/ppc/translate/vmx-impl.c.inc            | 352 ++++++++--
>   target/ppc/translate/vmx-ops.c.inc             |  15 +-
>   target/ppc/translate/vsx-impl.c.inc            | 375 +++++++++--
>   target/ppc/translate/vsx-ops.c.inc             |  21 -
>   35 files changed, 2715 insertions(+), 1607 deletions(-)
>   create mode 100644 hw/ppc/ppc4xx_sdram.c
>   create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc

