Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA24B4791D6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:48:49 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGPY-0003Pt-CT
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myGNb-00029B-Kl
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:46:47 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:43129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myGNY-0007Da-MM
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:46:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C72961FD18;
 Fri, 17 Dec 2021 16:46:41 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 17:46:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062630e05f-6b2c-4c6f-a74f-287997c38866,
 277755725B32849AD4052F723BD6C67625B53A02) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <655a7bc0-2063-55ed-9b68-9704db2af3cd@kaod.org>
Date: Fri, 17 Dec 2021 17:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL v2 000/101] ppc queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211216202614.414266-1-clg@kaod.org>
 <cf2bd3a9-007a-5881-efb8-9e6195958030@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cf2bd3a9-007a-5881-efb8-9e6195958030@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 473dbf98-0560-4a4b-983a-c4b10a74f370
X-Ovh-Tracer-Id: 13758778336952093664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhffefleethefgudfhteeigefffeduudeitdfhhfevheeitedvgeejkeetuefhveenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhdprhhsthdrlhhinhhknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/17/21 17:33, Richard Henderson wrote:
> On 12/16/21 12:24 PM, Cédric Le Goater wrote:
>> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
>>
>>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-ppc-20211216
>>
>> for you to fetch changes up to 292c21ede9b6618ab0f51cbfa0efeb1464232506:
>>
>>    ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices (2021-12-16 20:11:56 +0100)
>>
>> Changes in v2:
>>
>>   - Fixed patch "docs: rSTify ppc-spapr-hcalls.txt" with a newline
>>   - dropped patch "target/ppc: do not silence SNaN in xscvspdpn" which
>>     still add some comments pending.
>>
>> ----------------------------------------------------------------
>> ppc 7.0 queue:
>>
>> * General cleanup for Mac machines (Peter)
>> * Fixes for FPU exceptions (Lucas)
>> * Support for new ISA31 instructions (Matheus)
>> * Fixes for ivshmem (Daniel)
>> * Cleanups for PowerNV PHB (Christophe and Cedric)
>> * Updates of PowerNV and pSeries documentation (Leonardo and Daniel)
>> * Fixes for PowerNV (Daniel)
>> * Large cleanup of FPU implementation (Richard)
>> * Removal of SoftTLBs support for PPC74x CPUs (Fabiano)
>> * Fixes for exception models in MPCx and 60x CPUs (Fabiano)
>> * Removal of 401/403 CPUs (Cedric)
>> * Deprecation of taihu machine (Thomas)
>> * Large rework of PPC405 machine (Cedric)
>> * Fixes for VSX instructions (Victor and Matheus)
>> * Fix for e6500 CPU (Fabiano)
>> * Initial support for PMU (Daniel)
>>
>> ----------------------------------------------------------------
>> Alexey Kardashevskiy (1):
>>        pseries: Update SLOF firmware image
>>
>> Christophe Lombard (1):
>>        pci-host: Allow extended config space access for PowerNV PHB4 model
>>
>> Cédric Le Goater (28):
>>        Merge tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-next
>>        target/ppc: remove 401/403 CPUs
>>        ppc/ppc405: Change kernel load address
>>        ppc: Add trace-events for DCR accesses
>>        ppc/ppc405: Convert printfs to trace-events
>>        ppc/ppc405: Drop flag parameter in ppc405_set_bootinfo()
>>        ppc/ppc405: Change ppc405ep_init() return value
>>        ppc/ppc405: Add some address space definitions
>>        ppc/ppc405: Remove flash support
>>        ppc/ppc405: Rework FW load
>>        ppc/ppc405: Introduce ppc405_set_default_bootinfo()
>>        ppc/ppc405: Fix boot from kernel
>>        ppc/ppc405: Change default PLL values at reset
>>        ppc/ppc405: Fix bi_pci_enetaddr2 field in U-Boot board information
>>        ppc/ppc405: Add update of bi_procfreq field
>>        ppc/pnv: Introduce a "chip" property under PHB3
>>        ppc/pnv: Use the chip class to check the index of PHB3 devices
>>        ppc/pnv: Drop the "num-phbs" property
>>        ppc/pnv: Move mapping of the PHB3 CQ regions under pnv_pbcq_realize()
>>        ppc/pnv: Use QOM hierarchy to scan PHB3 devices
>>        ppc/pnv: Introduce a num_pecs class attribute for PHB4 PEC devices
>>        ppc/pnv: Introduce version and device_id class atributes for PHB4 devices
>>        ppc/pnv: Introduce a "chip" property under the PHB4 model
>>        ppc/pnv: Introduce a num_stack class attribute
>>        ppc/pnv: Compute the PHB index from the PHB4 PEC model
>>        ppc/pnv: Remove "system-memory" property from PHB4 PEC
>>        ppc/pnv: Move realize of PEC stacks under the PEC model
>>        ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices
>>
>> Daniel Henrique Barboza (13):
>>        ivshmem.c: change endianness to LITTLE_ENDIAN
>>        ivshmem-test.c: enable test_ivshmem_server for ppc64 arch
>>        ppc/pnv.c: add a friendly warning when accel=kvm is used
>>        docs/system/ppc/powernv.rst: document KVM support status
>>        ppc/pnv.c: fix "system-id" FDT when -uuid is set
>>        target/ppc: introduce PMUEventType and PMU overflow timers
>>        target/ppc: PMU basic cycle count for pseries TCG
>>        target/ppc: PMU: update counters on PMCs r/w
>>        target/ppc: PMU: update counters on MMCR1 write
>>        target/ppc: enable PMU counter overflow with cycle events
>>        target/ppc: enable PMU instruction count
>>        target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA) event
>>        PPC64/TCG: Implement 'rfebb' instruction
>>
>> Fabiano Rosas (8):
>>        target/ppc: Disable software TLB for the 7450 family
>>        target/ppc: Disable unused facilities in the e600 CPU
>>        target/ppc: Remove the software TLB model of 7450 CPUs
>>        target/ppc: Fix MPCxxx FPU interrupt address
>>        target/ppc: Remove 603e exception model
>>        target/ppc: Set 601v exception model id
>>        target/ppc: Fix e6500 boot
>>        Revert "target/ppc: Move SPR_DSISR setting to powerpc_excp"
>>
>> Leonardo Garcia (5):
>>        docs: Minor updates on the powernv documentation.
>>        docs: Introducing pseries documentation.
>>        docs: rSTify ppc-spapr-hcalls.txt
>>        docs: Rename ppc-spapr-hcalls.txt to ppc-spapr-hcalls.rst.
>>        Link new ppc-spapr-hcalls.rst file to pseries.rst.
>>
>> Lucas Mateus Castro (alqotel) (3):
>>        target/ppc: Fixed call to deferred exception
>>        test/tcg/ppc64le: test mtfsf
>>        target/ppc: ppc_store_fpscr doesn't update bits 0 to 28 and 52
>>
>> Matheus Ferst (5):
>>        target/ppc: Implement Vector Expand Mask
>>        target/ppc: Implement Vector Extract Mask
>>        target/ppc: Implement Vector Mask Move insns
>>        target/ppc: fix xscvqpdp register access
>>        target/ppc: move xscvqpdp to decodetree
>>
>> Peter Maydell (1):
>>        hw/ppc/mac.h: Remove MAX_CPUS macro
>>
>> Richard Henderson (34):
>>        softfloat: Extend float_exception_flags to 16 bits
>>        softfloat: Add flag specific to Inf - Inf
>>        softfloat: Add flag specific to Inf * 0
>>        softfloat: Add flags specific to Inf / Inf and 0 / 0
>>        softfloat: Add flag specific to sqrt(-x)
>>        softfloat: Add flag specific to convert non-nan to int
>>        softfloat: Add flag specific to signaling nans
>>        target/ppc: Update float_invalid_op_addsub for new flags
>>        target/ppc: Update float_invalid_op_mul for new flags
>>        target/ppc: Update float_invalid_op_div for new flags
>>        target/ppc: Move float_check_status from FPU_FCTI to translate
>>        target/ppc: Update float_invalid_cvt for new flags
>>        target/ppc: Fix VXCVI return value
>>        target/ppc: Remove inline from do_fri
>>        target/ppc: Use FloatRoundMode in do_fri
>>        target/ppc: Tidy inexact handling in do_fri
>>        target/ppc: Clean up do_fri
>>        target/ppc: Update fmadd for new flags
>>        target/ppc: Split out do_fmadd
>>        target/ppc: Do not call do_float_check_status from do_fmadd
>>        target/ppc: Split out do_frsp
>>        target/ppc: Update do_frsp for new flags
>>        target/ppc: Use helper_todouble in do_frsp
>>        target/ppc: Update sqrt for new flags
>>        target/ppc: Update xsrqpi and xsrqpxp to new flags
>>        target/ppc: Update fre to new flags
>>        softfloat: Add float64r32 arithmetic routines
>>        target/ppc: Add helpers for fmadds et al
>>        target/ppc: Add helper for fsqrts
>>        target/ppc: Add helpers for fadds, fsubs, fdivs
>>        target/ppc: Add helper for fmuls
>>        target/ppc: Add helper for frsqrtes
>>        target/ppc: Update fres to new flags and float64r32
>>        target/ppc: Use helper_todouble/tosingle in helper_xststdcsp
>>
>> Thomas Huth (1):
>>        ppc: Mark the 'taihu' machine as deprecated
>>
>> Victor Colombo (2):
>>        target/ppc: Fix xs{max, min}[cj]dp to use VSX registers
>>        target/ppc: Move xs{max,min}[cj]dp to decodetree
>>
>>   docs/about/deprecated.rst              |   9 +
>>   docs/specs/ppc-spapr-hcalls.rst        | 100 +++++
>>   docs/specs/ppc-spapr-hcalls.txt        |  78 ----
>>   docs/system/ppc/powernv.rst            |  68 ++--
>>   docs/system/ppc/pseries.rst            | 226 +++++++++++
>>   hw/ppc/mac.h                           |   3 -
>>   hw/ppc/ppc405.h                        |  14 +-
>>   include/fpu/softfloat-types.h          |  23 +-
>>   include/fpu/softfloat.h                |  14 +-
>>   include/hw/pci-host/pnv_phb3.h         |   3 +
>>   include/hw/pci-host/pnv_phb4.h         |   5 +
>>   include/hw/ppc/pnv.h                   |   2 +
>>   target/ppc/cpu-models.h                |  19 -
>>   target/ppc/cpu-qom.h                   |  12 +-
>>   target/ppc/cpu.h                       |  63 +++-
>>   target/ppc/helper.h                    |  29 +-
>>   target/ppc/power8-pmu.h                |  26 ++
>>   target/ppc/spr_tcg.h                   |   5 +
>>   target/ppc/insn32.decode               |  54 ++-
>>   fpu/softfloat.c                        | 114 +++++-
>>   hw/misc/ivshmem.c                      |   2 +-
>>   hw/pci-host/pnv_phb3.c                 |   3 +-
>>   hw/pci-host/pnv_phb3_pbcq.c            |  11 +
>>   hw/pci-host/pnv_phb4.c                 |   1 +
>>   hw/pci-host/pnv_phb4_pec.c             |  75 +++-
>>   hw/ppc/mac_newworld.c                  |   3 +-
>>   hw/ppc/mac_oldworld.c                  |   3 +-
>>   hw/ppc/pnv.c                           | 177 +++++----
>>   hw/ppc/ppc.c                           |   2 +
>>   hw/ppc/ppc405_boards.c                 | 245 ++++++------
>>   hw/ppc/ppc405_uc.c                     | 225 ++++++-----
>>   hw/ppc/spapr_cpu_core.c                |   1 +
>>   target/ppc/cpu-models.c                |  34 --
>>   target/ppc/cpu.c                       |   2 +-
>>   target/ppc/cpu_init.c                  | 658 +++------------------------------
>>   target/ppc/excp_helper.c               |  95 +++--
>>   target/ppc/fpu_helper.c                | 593 +++++++++++++++--------------
>>   target/ppc/helper_regs.c               |   7 +
>>   target/ppc/mmu_common.c                |  60 +--
>>   target/ppc/mmu_helper.c                |  32 --
>>   target/ppc/power8-pmu.c                | 350 ++++++++++++++++++
>>   target/ppc/translate.c                 | 104 ++++--
>>   tests/qtest/ivshmem-test.c             |   5 +-
>>   tests/tcg/ppc64le/mtfsf.c              |  61 +++
>>   fpu/softfloat-parts.c.inc              |  57 +--
>>   fpu/softfloat-specialize.c.inc         |  12 +-
>>   target/ppc/power8-pmu-regs.c.inc       |  69 +++-
>>   target/ppc/translate/branch-impl.c.inc |  33 ++
>>   target/ppc/translate/fp-impl.c.inc     |  53 +--
>>   target/ppc/translate/vmx-impl.c.inc    | 231 ++++++++++++
>>   target/ppc/translate/vsx-impl.c.inc    |  55 ++-
>>   target/ppc/translate/vsx-ops.c.inc     |   5 -
>>   hw/ppc/trace-events                    |  23 ++
>>   pc-bios/README                         |   2 +-
>>   pc-bios/slof.bin                       | Bin 991744 -> 991920 bytes
>>   roms/SLOF                              |   2 +-
>>   target/ppc/meson.build                 |   1 +
>>   tests/tcg/ppc64/Makefile.target        |   1 +
>>   tests/tcg/ppc64le/Makefile.target      |   1 +
>>   59 files changed, 2514 insertions(+), 1647 deletions(-)
>>   create mode 100644 docs/specs/ppc-spapr-hcalls.rst
>>   delete mode 100644 docs/specs/ppc-spapr-hcalls.txt
>>   create mode 100644 target/ppc/power8-pmu.h
>>   create mode 100644 target/ppc/power8-pmu.c
>>   create mode 100644 tests/tcg/ppc64le/mtfsf.c
>>   create mode 100644 target/ppc/translate/branch-impl.c.inc
> 
> Different docs failure:
> 
> Warning, treated as error:
> /tmp/qemu-test/src/docs/system/ppc/pseries.rst:241:Unexpected indentation.
> 
> You can test this yourself with
> 
> make docker-test-build@ubuntu1804 TARGET_LIST=i386-softmmu

hmm, I will be more careful with documentation patches in the future.

How should I send a v3 without resending all patches ?

Thanks,

C.


