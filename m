Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7983D479565
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:23:24 +0100 (CET)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJlD-0008B4-Kt
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myJdX-00081O-AK
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:15:27 -0500
Received: from [2607:f8b0:4864:20::52c] (port=41934
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myJdU-0008DJ-HI
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:15:26 -0500
Received: by mail-pg1-x52c.google.com with SMTP id k4so3159451pgb.8
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 12:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=avhbUtmDZyeb4ZCCyi1Etg6VEqekF+9WRcIAky4Hlrc=;
 b=KXT3JrQPdvd4X0jZ78uf271gw2HiFbhZ9ANhxN3OqkZvjkjjQjMDl1WsFgXfm6GE+e
 QzXL4qS++mD9sT5LnrOd1+mRi+wIpZeHKAFTcaAbgjd5Aof5oG0f+eyL1MH0IC7j+nSA
 cmKgAbO73/sKMzUBuxbygOW38+MLg/zjLp9IRKsLZ/tCuQGRYfgISnfyRf1NH2JUHVS6
 qawKWGor7/6Y1UZPFvHopN9sTfkoQEz0oze5RWDoUoAULT9ehc1akjCAUGhAp6M9FA9g
 wlpv/Tsovd8j4yyw45EGH8cq1JyAMJhpL4esTUJ9BTXplUM+PgODY4U7qnDhlmcOlwQp
 3c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=avhbUtmDZyeb4ZCCyi1Etg6VEqekF+9WRcIAky4Hlrc=;
 b=RDJTtLIe4l6xVWc0fC5bIPA4zouZ/mQFiHlyWfBHBDVPM7luLTz5Mtn8VivK9SHFC4
 4le9epJ72T0L/Ih4HZWAAyatXyWhkcd0eDMRnO4MVNT9eOgUhd4nwWd+1czGrkCOEIz/
 zong4/iZF6DF1soxP+zdbXlXtDYDk5s/4yqCyx3ps+4iaz2O1O8gOj3Nf3mGEKzzHABi
 myQrsEA7A/r6pf4DH2DHNoY4y7vsgH4IhZ5LLmVv10zwJuwaAiLraf/akT+adbiyp+1E
 dArDyW/xEOsd5VCCEljeKieZr3+WQZtfWy5ApE+/chNd92xWjYInt0BjyjvklACFa59f
 lUfQ==
X-Gm-Message-State: AOAM533wLKSh1Z99/PjhGew4O7lhJlhm5SoZDABKlvs9RT1WpH67j2gb
 G6e16/EgCqWt59Vs/39vB0wM9A==
X-Google-Smtp-Source: ABdhPJxLI64eJMQ21zfFgMiHuMAQX8CdycTWyyrzWTKee2EUsAAhPt5A20XF/E1BTL14keFL9DDMcg==
X-Received: by 2002:a63:e34c:: with SMTP id o12mr4329653pgj.509.1639772122770; 
 Fri, 17 Dec 2021 12:15:22 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id c7sm5262028pjs.17.2021.12.17.12.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 12:15:22 -0800 (PST)
Subject: Re: [PULL v3 000/101] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211217173733.727398-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b27762d5-d396-6a8a-adae-10ca4bfcdc7f@linaro.org>
Date: Fri, 17 Dec 2021 12:15:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217173733.727398-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 9:37 AM, Cédric Le Goater wrote:
> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-ppc-20211217
> 
> for you to fetch changes up to 0e6232bc3cb96bdf6fac1b5d7659aa9887afe657:
> 
>    ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices (2021-12-17 17:57:19 +0100)
> 
> Changes in v3:
> 
>   - Fixed patch "docs: Introducing pseries documentation" with a newline
>     and checked documentation generation with :
> 
>        make docker-test-build@ubuntu1804 TARGET_LIST=i386-softmmu
> 
> Changes in v2:
> 
>   - Fixed patch "docs: rSTify ppc-spapr-hcalls.txt" with a newline
>   - dropped patch "target/ppc: do not silence SNaN in xscvspdpn" which
>     still had some comments pending.
> 
> ----------------------------------------------------------------
> ppc 7.0 queue:
> 
> * General cleanup for Mac machines (Peter)
> * Fixes for FPU exceptions (Lucas)
> * Support for new ISA31 instructions (Matheus)
> * Fixes for ivshmem (Daniel)
> * Cleanups for PowerNV PHB (Christophe and Cedric)
> * Updates of PowerNV and pSeries documentation (Leonardo and Daniel)
> * Fixes for PowerNV (Daniel)
> * Large cleanup of FPU implementation (Richard)
> * Removal of SoftTLBs support for PPC74x CPUs (Fabiano)
> * Fixes for exception models in MPCx and 60x CPUs (Fabiano)
> * Removal of 401/403 CPUs (Cedric)
> * Deprecation of taihu machine (Thomas)
> * Large rework of PPC405 machine (Cedric)
> * Fixes for VSX instructions (Victor and Matheus)
> * Fix for e6500 CPU (Fabiano)
> * Initial support for PMU (Daniel)
> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>        pseries: Update SLOF firmware image
> 
> Christophe Lombard (1):
>        pci-host: Allow extended config space access for PowerNV PHB4 model
> 
> Cédric Le Goater (28):
>        Merge tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-next
>        target/ppc: remove 401/403 CPUs
>        ppc/ppc405: Change kernel load address
>        ppc: Add trace-events for DCR accesses
>        ppc/ppc405: Convert printfs to trace-events
>        ppc/ppc405: Drop flag parameter in ppc405_set_bootinfo()
>        ppc/ppc405: Change ppc405ep_init() return value
>        ppc/ppc405: Add some address space definitions
>        ppc/ppc405: Remove flash support
>        ppc/ppc405: Rework FW load
>        ppc/ppc405: Introduce ppc405_set_default_bootinfo()
>        ppc/ppc405: Fix boot from kernel
>        ppc/ppc405: Change default PLL values at reset
>        ppc/ppc405: Fix bi_pci_enetaddr2 field in U-Boot board information
>        ppc/ppc405: Add update of bi_procfreq field
>        ppc/pnv: Introduce a "chip" property under PHB3
>        ppc/pnv: Use the chip class to check the index of PHB3 devices
>        ppc/pnv: Drop the "num-phbs" property
>        ppc/pnv: Move mapping of the PHB3 CQ regions under pnv_pbcq_realize()
>        ppc/pnv: Use QOM hierarchy to scan PHB3 devices
>        ppc/pnv: Introduce a num_pecs class attribute for PHB4 PEC devices
>        ppc/pnv: Introduce version and device_id class atributes for PHB4 devices
>        ppc/pnv: Introduce a "chip" property under the PHB4 model
>        ppc/pnv: Introduce a num_stack class attribute
>        ppc/pnv: Compute the PHB index from the PHB4 PEC model
>        ppc/pnv: Remove "system-memory" property from PHB4 PEC
>        ppc/pnv: Move realize of PEC stacks under the PEC model
>        ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices
> 
> Daniel Henrique Barboza (13):
>        ivshmem.c: change endianness to LITTLE_ENDIAN
>        ivshmem-test.c: enable test_ivshmem_server for ppc64 arch
>        ppc/pnv.c: add a friendly warning when accel=kvm is used
>        docs/system/ppc/powernv.rst: document KVM support status
>        ppc/pnv.c: fix "system-id" FDT when -uuid is set
>        target/ppc: introduce PMUEventType and PMU overflow timers
>        target/ppc: PMU basic cycle count for pseries TCG
>        target/ppc: PMU: update counters on PMCs r/w
>        target/ppc: PMU: update counters on MMCR1 write
>        target/ppc: enable PMU counter overflow with cycle events
>        target/ppc: enable PMU instruction count
>        target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA) event
>        PPC64/TCG: Implement 'rfebb' instruction
> 
> Fabiano Rosas (8):
>        target/ppc: Disable software TLB for the 7450 family
>        target/ppc: Disable unused facilities in the e600 CPU
>        target/ppc: Remove the software TLB model of 7450 CPUs
>        target/ppc: Fix MPCxxx FPU interrupt address
>        target/ppc: Remove 603e exception model
>        target/ppc: Set 601v exception model id
>        target/ppc: Fix e6500 boot
>        Revert "target/ppc: Move SPR_DSISR setting to powerpc_excp"
> 
> Leonardo Garcia (5):
>        docs: Minor updates on the powernv documentation.
>        docs: Introducing pseries documentation.
>        docs: rSTify ppc-spapr-hcalls.txt
>        docs: Rename ppc-spapr-hcalls.txt to ppc-spapr-hcalls.rst.
>        Link new ppc-spapr-hcalls.rst file to pseries.rst.
> 
> Lucas Mateus Castro (alqotel) (3):
>        target/ppc: Fixed call to deferred exception
>        test/tcg/ppc64le: test mtfsf
>        target/ppc: ppc_store_fpscr doesn't update bits 0 to 28 and 52
> 
> Matheus Ferst (5):
>        target/ppc: Implement Vector Expand Mask
>        target/ppc: Implement Vector Extract Mask
>        target/ppc: Implement Vector Mask Move insns
>        target/ppc: fix xscvqpdp register access
>        target/ppc: move xscvqpdp to decodetree
> 
> Peter Maydell (1):
>        hw/ppc/mac.h: Remove MAX_CPUS macro
> 
> Richard Henderson (34):
>        softfloat: Extend float_exception_flags to 16 bits
>        softfloat: Add flag specific to Inf - Inf
>        softfloat: Add flag specific to Inf * 0
>        softfloat: Add flags specific to Inf / Inf and 0 / 0
>        softfloat: Add flag specific to sqrt(-x)
>        softfloat: Add flag specific to convert non-nan to int
>        softfloat: Add flag specific to signaling nans
>        target/ppc: Update float_invalid_op_addsub for new flags
>        target/ppc: Update float_invalid_op_mul for new flags
>        target/ppc: Update float_invalid_op_div for new flags
>        target/ppc: Move float_check_status from FPU_FCTI to translate
>        target/ppc: Update float_invalid_cvt for new flags
>        target/ppc: Fix VXCVI return value
>        target/ppc: Remove inline from do_fri
>        target/ppc: Use FloatRoundMode in do_fri
>        target/ppc: Tidy inexact handling in do_fri
>        target/ppc: Clean up do_fri
>        target/ppc: Update fmadd for new flags
>        target/ppc: Split out do_fmadd
>        target/ppc: Do not call do_float_check_status from do_fmadd
>        target/ppc: Split out do_frsp
>        target/ppc: Update do_frsp for new flags
>        target/ppc: Use helper_todouble in do_frsp
>        target/ppc: Update sqrt for new flags
>        target/ppc: Update xsrqpi and xsrqpxp to new flags
>        target/ppc: Update fre to new flags
>        softfloat: Add float64r32 arithmetic routines
>        target/ppc: Add helpers for fmadds et al
>        target/ppc: Add helper for fsqrts
>        target/ppc: Add helpers for fadds, fsubs, fdivs
>        target/ppc: Add helper for fmuls
>        target/ppc: Add helper for frsqrtes
>        target/ppc: Update fres to new flags and float64r32
>        target/ppc: Use helper_todouble/tosingle in helper_xststdcsp
> 
> Thomas Huth (1):
>        ppc: Mark the 'taihu' machine as deprecated
> 
> Victor Colombo (2):
>        target/ppc: Fix xs{max, min}[cj]dp to use VSX registers
>        target/ppc: Move xs{max,min}[cj]dp to decodetree
> 
>   docs/about/deprecated.rst              |   9 +
>   docs/specs/ppc-spapr-hcalls.rst        | 100 +++++
>   docs/specs/ppc-spapr-hcalls.txt        |  78 ----
>   docs/system/ppc/powernv.rst            |  68 ++--
>   docs/system/ppc/pseries.rst            | 226 +++++++++++
>   hw/ppc/mac.h                           |   3 -
>   hw/ppc/ppc405.h                        |  14 +-
>   include/fpu/softfloat-types.h          |  23 +-
>   include/fpu/softfloat.h                |  14 +-
>   include/hw/pci-host/pnv_phb3.h         |   3 +
>   include/hw/pci-host/pnv_phb4.h         |   5 +
>   include/hw/ppc/pnv.h                   |   2 +
>   target/ppc/cpu-models.h                |  19 -
>   target/ppc/cpu-qom.h                   |  12 +-
>   target/ppc/cpu.h                       |  63 +++-
>   target/ppc/helper.h                    |  29 +-
>   target/ppc/power8-pmu.h                |  26 ++
>   target/ppc/spr_tcg.h                   |   5 +
>   target/ppc/insn32.decode               |  54 ++-
>   fpu/softfloat.c                        | 114 +++++-
>   hw/misc/ivshmem.c                      |   2 +-
>   hw/pci-host/pnv_phb3.c                 |   3 +-
>   hw/pci-host/pnv_phb3_pbcq.c            |  11 +
>   hw/pci-host/pnv_phb4.c                 |   1 +
>   hw/pci-host/pnv_phb4_pec.c             |  75 +++-
>   hw/ppc/mac_newworld.c                  |   3 +-
>   hw/ppc/mac_oldworld.c                  |   3 +-
>   hw/ppc/pnv.c                           | 177 +++++----
>   hw/ppc/ppc.c                           |   2 +
>   hw/ppc/ppc405_boards.c                 | 245 ++++++------
>   hw/ppc/ppc405_uc.c                     | 225 ++++++-----
>   hw/ppc/spapr_cpu_core.c                |   1 +
>   target/ppc/cpu-models.c                |  34 --
>   target/ppc/cpu.c                       |   2 +-
>   target/ppc/cpu_init.c                  | 658 +++------------------------------
>   target/ppc/excp_helper.c               |  95 +++--
>   target/ppc/fpu_helper.c                | 593 +++++++++++++++--------------
>   target/ppc/helper_regs.c               |   7 +
>   target/ppc/mmu_common.c                |  60 +--
>   target/ppc/mmu_helper.c                |  32 --
>   target/ppc/power8-pmu.c                | 350 ++++++++++++++++++
>   target/ppc/translate.c                 | 104 ++++--
>   tests/qtest/ivshmem-test.c             |   5 +-
>   tests/tcg/ppc64le/mtfsf.c              |  61 +++
>   fpu/softfloat-parts.c.inc              |  57 +--
>   fpu/softfloat-specialize.c.inc         |  12 +-
>   target/ppc/power8-pmu-regs.c.inc       |  69 +++-
>   target/ppc/translate/branch-impl.c.inc |  33 ++
>   target/ppc/translate/fp-impl.c.inc     |  53 +--
>   target/ppc/translate/vmx-impl.c.inc    | 231 ++++++++++++
>   target/ppc/translate/vsx-impl.c.inc    |  55 ++-
>   target/ppc/translate/vsx-ops.c.inc     |   5 -
>   hw/ppc/trace-events                    |  23 ++
>   pc-bios/README                         |   2 +-
>   pc-bios/slof.bin                       | Bin 991744 -> 991920 bytes
>   roms/SLOF                              |   2 +-
>   target/ppc/meson.build                 |   1 +
>   tests/tcg/ppc64/Makefile.target        |   1 +
>   tests/tcg/ppc64le/Makefile.target      |   1 +
>   59 files changed, 2514 insertions(+), 1647 deletions(-)
>   create mode 100644 docs/specs/ppc-spapr-hcalls.rst
>   delete mode 100644 docs/specs/ppc-spapr-hcalls.txt
>   create mode 100644 target/ppc/power8-pmu.h
>   create mode 100644 target/ppc/power8-pmu.c
>   create mode 100644 tests/tcg/ppc64le/mtfsf.c
>   create mode 100644 target/ppc/translate/branch-impl.c.inc

Applied, thanks.

r~


