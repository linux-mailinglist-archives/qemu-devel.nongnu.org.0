Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A558C4881D0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:15:55 +0100 (CET)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6518-00053Z-NP
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64e2-0008Ru-B9
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:02 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dy-0006qe-Qx
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621118; x=1673157118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPWYrXFhOagWXlaTJzxFLHx5Br092akjpCBYGxj5ZkU=;
 b=NqNjWc8EgekAREtfklMLykzYBpR/wsftIuhkKoZyNO+owEx7EzFctruX
 ljJffohobjc2eLp/J5xdJmheITWDsuDr8r5YMsNt2n8FxCfZzQxSpz0D0
 Bt7yDnfzGDB9xIPxYGvSQ7P/bPeCd1SwP9C8UWNh7tmfrRUNofYY+eKF1
 73L9K/XvG+xLqrjMrBxkAkYFxxH4z8Got7qiMlLfGb1twjnaY9HMVXxN6
 9iOaLS3eU5Ie/POaLUyNV+jNlttVienO22VoX6N0hQWTb2nuP9KZM+kpB
 9ioiqS4iswAxBWSSeTEcMW/iGNSlPYuNfdXrd6wVRtAnWAPmDa9OrbTXo Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984904"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:57 +0800
IronPort-SDR: hsW2ghojnF3/ms/4+y/v7PYb/2g1Vl2YKy4YLWtkpgeFhCf+stV30tn5Gze4l6phY5K5z6wH52
 2tlybqVRWAgABdOQi24BMm6U58NT6dK+rd3mkOEtxEG21FrN5jpvF0LXxQRhwanOEckaOrQ8Jk
 EoBxa0zI2sJezJy5gou9LU0mYzKDqJUXfpas+QG9N53/sgP7BlI6MfIgbQSw/t/Gf56FV8cxae
 mF2Sqn/f/27kGzeWq0JSdJqeBj8N5lLNbm/8aMGFgTXiuQkfSxR6vAjl06fkxoWq49aBytsF2X
 q8ShoV3OFK4YvUKPpqixu132
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:46 -0800
IronPort-SDR: 5wLne926Jy0SvNbbBEMgB4ugKoRjW8DdICx6XuUlVtAdbinQ7mJHzHNtpjsLx+DWDUnI7m3uZv
 6B6DdRVqHRnZAAVjiKra7mVyu1eG87BKLblbc8Dw4RA/0JyokyJwOqIE/XjzwXkbyRBqPA3nLO
 +ivMkQsO0dKxO1rgmoHI11DgYHnBhGtwJIt10FpkwMHZweNFAGquQXKI/bCTOi+lSGezymofcM
 PvXjZ2Jd5OUiOTHxJXij5VS92g2keM9Su8KHFTZkLMavZznGTq7DQY1iKigkt8Q62tztw72gLk
 OxI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Ns5dpbz1VSkW
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621116; x=1644213117; bh=gPWYrXFhOagWXlaTJz
 xFLHx5Br092akjpCBYGxj5ZkU=; b=ObQaZFWOh18CYX1DNebrS2RNbZcuugUPZ1
 fDSZpMf4MrqwYzwVBdD0iPfar/TTpzS52cKc2o7OFLUOo3quWiWhbSJ0MbKetSbg
 XiQYEobx09AerefiFawnuN11HNjzORw3O2C2ejF22bPtRCSGbFBXdmv8M10OjSlW
 j2ZEyDX1pTBQRadEfcyDPOpWk0+35++qUM4Hu6i2K+y0RtUiWSvMbOKy7Gbxp9A4
 rUuWavyAmHYTUFntsRzYaHY//DBxsXOQ5qX44RvzoKoLUE8kEGKoNRpAeYdbnZQ/
 wQ//5Htl07+O4HJvC8FRD6A3RVsGPJNhoNPc9XX+qVvVLKewD0jQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3dx8b6pn76sx for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:56 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Nn4s56z1VSkV;
 Fri,  7 Jan 2022 21:51:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/37] roms/opensbi: Upgrade from v0.9 to v1.0
Date: Sat,  8 Jan 2022 15:50:23 +1000
Message-Id: <20220108055048.3512645-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Bin Meng <bmeng.cn@gmail.com>

Upgrade OpenSBI from v0.9 to v1.0 and the pre-built bios images.

The v1.0 release includes the following commits:

ec5274b platform: implement K210 system reset
5487cf0 include: sbi: Simplify HSM state define names
8df1f9a lib: sbi: Use SBI_HSM_STATE_xyz defines instead of SBI_STATE_xyz =
defines
7c867fd lib: sbi: Rename sbi_hsm_hart_started_mask() function
638c948 lib: sbi: Remove redundant sbi_hsm_hart_started() function
ca864a9 lib: sbi: Fix error codes returned by HSM start() and stop() func=
tions
6290a22 include: sbi: Add HSM suspend related defines
4b05df6 lib: sbi: Add sbi_hart_reinit() function
807d71c include: sbi: Add hart_suspend() platform callback
7475689 lib: sbi: Implement SBI HSM suspend function
b9cf617 include: sbi: Upgrade SBI implementation version to v0.3
50d4fde lib: Remove redundant sbi_platform_ipi_clear() calls
ff5bd94 include: sbi: SBI function IDs for RFENCE extension
22d8ee9 firmware: Use lla to access all global symbols
0f20e8a firmware: Support position independent execution
ddad02d lib: sbi: illegal CSR 0x306 access in hpm_allowed()
bfc85c7 include: headers: Replace __ASSEMBLY__ with __ASSEMBLER__
9190ad1 lib/utils: Support the official clint DT bindings
ca3f358 lib/utils: Drop the 'compat' parameter of fdt_plic_fixup()
4edc822 lib/utils: Support fixing up the official DT bindings of PLIC
4ef2f5d firware: optimize the exception exit code
3d8a952 lib: fix csr detect support
e71a7c1 firmware: Remove redundant add instruction from trap restore path
d4a94ea include: types: Add __aligned(x) to define the minimum alignement
d0e406f include: sbi: Allow direct initialization via SPIN_LOCK_INIT()
4d8e2f1 lib: sbi: Replace test-and-set locks by ticket locks
70ffc3e lib: sbi: fix atomic_add_return
27a16b1 docs: fix link to OpenPiton documentation
b1df1ac lib: sbi: Domains can be registered only before finalizing domain=
s
7495bce lib: sbi: Add sbi_domain_memregion_init() API
4dc0001 lib: sbi: Add sbi_domain_root_add_memregion() API
8b56980 lib: utils/sys: Add CLINT memregion in the root domain
fc37c97 lib: sbi: Make the root domain instance global variable
e7e4bcd lib: utils: Copy over restricted root domain memregions to FDT do=
mains
f41196a lib: sbi: Make sbi_domain_memregion_initfw() a local function
c5d0645 lib: utils: Implement "64bit-mmio" property parsing
49e422c lib: utils: reset: Add T-HEAD sample platform reset driver
0d56293 lib: sbi: Fix sbi_domain_root_add_memregion() for merging memregi=
ons
bf3ef53 firmware: Enable FW_PIC by default
1db8436 platform: Remove platform/thead
6d1642f docs: generic: Add T-HEAD C9xx series processors
a3689db lib: sbi: Remove domains_root_regions() platform callback
068ca08 lib: sbi: Simplify console platform operations
559a8f1 lib: sbi: Simplify timer platform operations
dc39c7b lib: sbi: Simplify ipi platform operations
043d088 lib: sbi: Simplify system reset platform operations
a84a1dd lib: sbi: Simplify HSM platform operations
e9a27ab lib: sbi: Show devices provided by platform in boot prints
632e27b docs/platform: sifive_fu540: Update U-Boot defconfig name
117fb6d lib: utils/serial: Add support for Gaisler APBUART
552f53f docs: platform: Sort platform names
d4177e7 docs: platform: Describe sifive_fu540 as supported generic platfo=
rm
26998f3 platform: Remove sifive/fu540 platform
f90c4c2 lib: sbi: Have spinlock checks return bool
e822b75 lib: utils/serial: Support Synopsys DesignWare APB UART
6139ab2 Makefile: unconditionally disable SSP
c9ef2bc lib: utils: Add strncpy macro to libfdt_env.h
ee7c2b2 lib: utils/fdt: Don't use sbi_string functions
fe92347 lib: utils/fdt: Replace strcmp with strncmp
b2dbbc0 lib: Check region base for merging in sbi_domain_root_add_memregi=
on()
54d7def lib: utils: Try other FDT drivers when we see SBI_ENODEV
d9ba653 docs: debugging OpenSBI
66c4fca lib: utils: consider ':' in stdout-path
f30b189 lib: sbi_scratch: remove owner from sbi_scratch_alloc_offset
a03ea2e platform: andes/ae350: Cosmetic fixes in plicsw.c
b32fac4 docs/platform: andes-ae350: Fix missing spaces
de446cc platform: andes/ae350: Drop plicsw_get_pending()
434198e platform: andes/ae350: Drop plicsw_ipi_sync()
1da3d80 lib: sbi_scratch: zero out scratch memory on all harts
360ab88 lib: utils: missing initialization in thead_reset_init
79f9b42 lib: sbi: Fix GET_F64_REG inline assembly
eb90e0a lib: utils/libfdt: Upgrade to v1.6.1 release
cdcf907 lib: sign conflict in sbi_tlb_entry_process()
9901794 lib: sign conflict in wake_coldboot_harts()
11c345f lib: simplify sbi_fifo_inplace_update()
4519e29 lib: utils/timer: Add ACLINT MTIMER library
5a049fe lib: utils/ipi: Add ACLINT MSWI library
bd5d208 lib: utils: Add FDT parsing API common for both ACLINT and CLINT
56fc5f7 lib: utils/ipi: Add FDT based ACLINT MSWI IPI driver
03d6bb5 lib: utils/timer: Add FDT based ACLINT MTIMER driver
a731c7e platform: Replace CLINT library usage with ACLINT library
b7f2cd2 lib: utils: reset: unify naming of 'sifive_test' device
197e089 docs/platform: thead-c9xx: Remove FW_PIC=3Dy
17e23b6 platform: generic: Terminate platform.name with null
3e8b31a docs: Add device tree bindings for SBI PMU extension
fde28fa lib: sbi: Detect mcountinihibit support at runtime
d3a96cc lib: sbi: Remove stray '\' character
0829f2b lib: sbi: Detect number of bits implemented in mhpmcounter
9c9b4ad lib: sbi: Disable m/scounteren & enable mcountinhibit
41ae63c include: Add a list empty check function
fd9116b lib: sbi: Remove redundant boot time print statement
49966db lib: sbi: Use csr_read/write_num to read/update PMU counters
e7cc7a3 lib: sbi: Add PMU specific platform hooks
13d40f2 lib: sbi: Add PMU support
ae72ec0 utils: fdt: Add fdt helper functions to parse PMU DT nodes
37f9b0f lib: sbi: Implement SBI PMU extension
764a17d lib: sbi: Implement firmware counters
ec1b8bb lib: sbi: Improve TLB function naming
0e12aa8 platform: generic: Add PMU support
14c7f71 firmware: Minor optimization in _scratch_init()
dafaa0f docs: Correct a typo in platform_guide.md
abfce9b docs: Make <xyz> visible in the rendered platform guide
dcb756b firmware: Remove the sanity checks in fw_save_info()
b88b366 firmware: Define a macro for version of struct fw_dynamic_info
a76ac44 lib: sbi: Fix sbi_pmu_exit() for systems not having MCOUNTINHIBIT=
 csr
7f1be8a fw_base: Don't mark fw_platform_init as both global and weak
397afe5 fw_base: Put data in .data rather than .text
a3d328a firmware: Explicitly pass -pie to the linker, not just the driver
09ad811 firmware: Only default FW_PIC to y if supported
2942777 Makefile: Support building with Clang and LLVM binutils
17729d4 lib: utils: Drop dependency on libgcc by importing part of FreeBS=
D's libquad
e931f38 lib: utils/fdt: Add fdt_parse_phandle_with_args() API
36b8eff lib: utils/gpio: Add generic GPIO configuration library
c14f1fe lib: utils/gpio: Add simple FDT based GPIO framework
4c3df2a lib: utils/gpio: Add minimal SiFive GPIO driver
e3d6919 lib: utils/reset: Add generic GPIO reset driver
7210e90 firmware: use __SIZEOF_LONG__ for field offsets in fw_dynamic.h
f3a8f60 include: types: Use __builtin_offsetof when supported
8a1475b firmware: Remove the unhelpful alignment codes before fdt relocat=
ion
a4555e5 docs: Document parameters passed to firmware and alignment requir=
ement
2c74dc3 docs: Document FW_PIC compile time option
81eb708 README: Update toolchain information
9890391 Makefile: Manually forward RELAX_FLAG to the assembler when linki=
ng with LLD
74db0ac firmware: use _fw_start for load address
217d5e4 generic: fu740: add workaround for CIP-1200 errata
ce03c88 lib: utils: remove unused variable in fdt_reset_init
e928472 lib: utils: support both of gpio-poweroff, gpio-reset
d244f3d lib: sbi: Fix bug in strncmp function when count is 0
47a4765 lib: utils/fdt: Change addr and size to uint64_t
e0d1b9d lib: utils/timer: Allow separate base addresses for MTIME and MTI=
MECMP
7a3a0cc lib: utils: Extend fdt_get_node_addr_size() for multiple register=
 sets
f3a0eb8 lib: utils/fdt: Extend fdt_parse_aclint_node() function
b35f782 lib: utils/timer: Allow ACLINT MTIMER supporting only 32-bit MMIO
7aa6c9a lib: utils/timer: Simplify MTIMER synchronization
33eac76 lib: sbi: Fix bug in sbi_ecall_rfence that misses checking
ee27437 lib: sbi_trap: Restore redirect for access faults
b1d3e91 payloads/test: Add support for SBI v0.2 ecalls
bd316e2 lib: sbi: Correct typo in faults delegation CSR name
c262306 lib: sbi: protect dprintf output with spinlock
1718b16 lib: sbi: Checking fifo validness in sbi_fifo_is_empty and is_ful=
l
bd35521 lib: sbi: Refine the way to construct platform features
0274a96 lib: utils/reset: Sort fdt_reset driver list
395ff7e lib: utils/reset: Add a sunxi watchdog reset driver
3477f08 lib: sbi: fix ctz bug
12753d2 lib: sbi: add some macros to detect BUG at runtime
51113fe lib: sbi: Add BUG() macro for csr_read/write_num() and misa_strin=
g()
72154f4 lib: utils/fdt: Add fdt_parse_timebase_frequency() function
12e7af9 lib: sbi: Add timer frequency to struct sbi_timer_device
6355155 lib: sbi: Print timer frequency at boot time
9d0ab35 lib: sbi: Add generic timer delay loop function
fa59dd3 lib: utils/reset: use sbi_timer_mdelay() in gpio reset driver
754d511 lib: utils: identify supported GPIO reset methods
516161c lib: sbi: convert reset to list
9283d50 lib: sbi: add priority for reset handler
c38973e lib: sbi: Save context for all non-retentive suspend types
67cbbcb lib: sbi: system reset with invalid parameters
422eda4 Makefile: Add build time and compiler info string
78c2b19 lib: utils/irqchip: Automatically delegate T-HEAD PLIC access
309e8bd lib: utils/reset: Register separate GPIO system reset devices
723aa88 lib: sbi: Refine addr format in sbi_printf
c891acc include: sbi_utils: Introduce an helper to get fdt base address
013ba4e lib: sbi: Fix GPA passed to __sbi_hfence_gvma_xyz() functions
0979ffd lib: utils/gpio: use list for drivers
2fe2f55 lib: sbi: move sbi_boot_print_general()
57f094e platform: generic: move fdt_reset_init to final_init
be245ac lib: sbi: error handling in fdt_reset_init()
a74daf2 riscv: Add new CSRs introduced by Sscofpmf[1] extension
7084ad9 lib: sbi: Update csr_read/write_num for PMU
867c653 lib: sbi: Detect Sscofpmf extension at run time
9134c36 lib: sbi: Delegate PMU counter overflow interrupt to S mode
730f01b lib: sbi: Support sscofpmf extension in OpenSBI
2363f95 lib: sbi: Always enable access for all counters
0c304b6 lib: sbi: Allow programmable counters to monitor cycle/instret ev=
ents
1e14732 lib: sbi: Reset the mhpmevent value upon counter reset
b628cfd lib: sbi: Counter info width should be zero indexed
b28f070 lib: sbi: Enable PMU extension for platforms without mcountinhibi=
t
15906a3 lib: utils: Rename the prefix in PMU DT properties
b8845e4 lib: sbi: Fix initial value mask while updating the counters
31fe5a7 lib: sbi: Fix PMP address bits detection
94eba23 lib: utils/reset: add priority to gpio reset
1d462e0 lib: utils/reset: separate driver init func
2c964a2 lib: utils/i2c: Add generic I2C configuration library
6ca6bca lib: utils/i2c: Add simple FDT based I2C framework
13a1158 lib: utils/i2c: Add minimal SiFive I2C driver
f374496 platform: sifive_fu740: add platform reset driver
d335a17 lib: sbi: clear pmpcfg.A before setting in pmp_set()
52af6e4 lib: utils: Add LiteX UART support
22d556d lib: sbi: Fix spelling of "address" in sbi_domain.c
7a22c78 lib: sbi: Fix missing space
7e77706 lib: sbi: Resolve the uninitialized complaint in sbi_pmu
14faee6 lib: sbi: Improve fatal error handling
2428987 lib: pmu: support the event ID encoded by a bitmap.
66fbcc0 docs/platform: spike: Enhance Spike examples
460041c lib: pmu: check SSCOF before masking
69d7e53 Makefile: Fix -msave-restore compile warning with CLANG-10 (or lo=
wer)
d249d65 lib: sbi: Fix compile errors using -Os option
f270359 Makefile: Improve the method to disable -m(no-)save-restore optio=
n
2082153 lib: sbi: simplify pmp_set(), pmp_get()
d30bde3 firmware: Move memcpy/memset mapping to fw_base.S
48f91ee include: Bump-up version to 1.0

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 78680 -> 108504 byte=
s
 .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 727464 -> 838904 byt=
es
 .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 75096 -> 105296 byte=
s
 .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 781264 -> 934696 byt=
es
 roms/opensbi                                  |   2 +-
 5 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/ope=
nsbi-riscv32-generic-fw_dynamic.bin
index ae651e2993..dba8e8655f 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bi=
os/opensbi-riscv32-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf b/pc-bios/ope=
nsbi-riscv32-generic-fw_dynamic.elf
index 3250d89408..a19363e27c 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf and b/pc-bi=
os/opensbi-riscv32-generic-fw_dynamic.elf differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/ope=
nsbi-riscv64-generic-fw_dynamic.bin
index f039884483..f223e56991 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bi=
os/opensbi-riscv64-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf b/pc-bios/ope=
nsbi-riscv64-generic-fw_dynamic.elf
index ef261c98d1..c59573d026 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf and b/pc-bi=
os/opensbi-riscv64-generic-fw_dynamic.elf differ
diff --git a/roms/opensbi b/roms/opensbi
index 234ed8e427..48f91ee9c9 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
+Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
--=20
2.31.1


