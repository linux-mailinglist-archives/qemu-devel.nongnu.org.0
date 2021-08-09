Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6EE3E4132
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 09:57:19 +0200 (CEST)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD09u-0001iI-6t
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 03:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mD08Q-0008Jk-1d
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:55:46 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mD08K-0005FX-HW
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:55:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3D1A9200A3;
 Mon,  9 Aug 2021 07:55:37 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 9 Aug
 2021 09:55:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059d33b5bc-2261-4e03-a1bb-b9503df44a1e,
 12D865CA04D90D97A6A977E4DA2B50F9FD60493E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
Date: Mon, 9 Aug 2021 09:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
Content-Type: multipart/mixed; boundary="------------B0B7237E455479706088BCA2"
Content-Language: en-US
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5d838d20-42f0-4147-a581-e4d17d78f05e
X-Ovh-Tracer-Id: 16102620471692004259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeigdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtihesmhdtreertdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtiefhgeeikeekieevieevueehheffuefffeekkeetgeefveegfeeuteffleehgeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------B0B7237E455479706088BCA2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello Phil,

On 8/9/21 9:06 AM, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 8/6/21 8:00 PM, Cédric Le Goater wrote:
>> It includes support for the POWER10 processor and the QEMU platform.
> 
> 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?

OK. See attachement.
>>
>> Built from submodule.
> 
> 2/ Could we have a CI job building this, during 6.2 cycle?
>    (See .gitlab-ci.d/edk2.yml and .gitlab-ci.d/opensbi.yml)

Sure. It doesn't look too complex. 

I plan to add acceptance tests for the QEMU powernv machines also 
once the OpenPOWER files (zImage.epapr and rootfs.cpio.xz) are 
published on GH.
 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
>>  roms/skiboot        |   2 +-
>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
>> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed5b1ddbed017ae8c0a9d0 100644
>> GIT binary patch
>> literal 2528128
> 
> Consider using 'git-format-patch --no-binary' and a reference
> to your repository to fetch a such big binary patch.

David would pull from my tree then ? So that's like doing a PR. 
We can do that next time I send an update if David is OK with 
that. I should send an update for v7.0 tag. 

Thanks,

C.

--------------B0B7237E455479706088BCA2
Content-Type: text/x-log; charset="UTF-8"; name="skiboot.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="skiboot.log"

Aaron Sawdey (1):
      external/mambo: support mambo COW mode for PMEM disk

Alexey Kardashevskiy (3):
      npu2: Invalidate entire TCE cache if many entries requested
      npu2: Clear fence on all bricks
      phb4: Add PHB options get/set OPAL calls

Alistair Popple (3):
      skiboot.tcl: Add chip-id to pmem device tree node
      hw/phys-map/p10: Add P10 MMIO map
      platforms: Add Rainier

Andrew Donnellan (3):
      npu2-opencapi: Fix integer promotion bug in LPC allocation
      hw/npu2-opencapi: Support multiple LPC devices
      hw/phys-map: Fix OCAPI_MEM BAR values

Andrew Geissler (1):
      Support BMC IPMI heartbeat command

Andrew Jeffery (10):
      gard: Fix data corruption when clearing single records
      blocklevel: smart_write: Terminate line for debug output in no-change case
      blocklevel: smart_write: Rename write buffer
      blocklevel: smart_write: Rename size variable for clarity
      blocklevel: smart_write: Avoid indirectly testing formal parameters
      blocklevel: smart_write: Deny writes intersecting ECC protected regions
      blocklevel: smart_write: Avoid reuse of formal parameters
      blocklevel: smart_write: Tidy local variable declarations
      blocklevel: smart_write: Fix unaligned writes to ECC partitions
      libflash: ipmi-hiomap: Document error handling strategy in write path

Anju T Sudhakar (4):
      hw/imc: Cleanup code to define scom addr for IMC at run time
      hw/imc: Use the xscom macros for IMC based on platform
      hw/imc: Do scoms on the secondary core in fused core mode for core-imc counters
      hw/imc: Power10 support

Anton Blanchard (2):
      external/mambo Update SIM_CTRL1
      Don't warn about stack size on host binaries

Artem Senichev (1):
      platforms/nicole: Fixup the system VPD EEPROM size

Balamuruhan S (2):
      occ-sensor: clean dt properties if sensor is not available
      chip: enable HOMER/OCC common area region in Qemu emulated PowerNV host

Benjamin Herrenschmidt (7):
      xive: Set the fused core mode properly
      chip: Fix pir_to_thread_id for fused cores
      cpu: Keep track of the "ec_primary" in big core more
      direct-ctl: Use the EC primary for special wakeups
      slw: Limit fused cores P9 to STOP0/1/2
      cpu: Make cpu_get_core_index() return the fused core number
      imc: Use pir_to_core_id() rather than cpu_get_core_index()

Claudio Carvalho (1):
      core/flash.c: add SECBOOT read and write support

Cédric Le Goater (61):
      xive: fix return value of opal_xive_allocate_irq()
      xive/p9: introduce header files for the registers
      xive/p9: minor cleanup of the interface
      xive/p9: use MMIO access for VC_EQC_CONFIG
      xive/p9: remove code not using indirect mode
      xive/p9: remove code not using block group mode
      xive/p9: remove dead code
      xive/p9: obsolete OPAL_XIVE_IRQ_*_VIA_FW flags
      xive/p9: obsolete OPAL_XIVE_IRQ_SHIFT_BUG flags
      xive/p9: fix EQ bitmap assignment when allocation fails
      xive/p9: introduce definitions for priorities
      xive/p9: fix silent escalation EQ setup
      xive/p9: cleanup all EQs when a VP block is freed.
      xive/p9: remove ACK# setting in the NVT
      xive/p9: introduce NVT_SHIFT
      xive/p9: remove XIVE_INT_SAFETY_GAP
      xive/p9: use predefined bitmasks to manipulate EQ addresses
      xive/p9: introduce the ESB magic MMIO offsets
      plat/qemu: use "/qemu" device tree node to identify the QEMU platform
      plat/qemu: add a POWER10 platform
      xive/p9: Introduce XIVE_INT_ORDER
      xive/p9: Clarify the global IRQ number encoding
      xive/p9: Introduce XIVE_ESB_SHIFT
      xive/p9: Introduce XIVE_EQ_ORDER
      xive/p9: Clarify the escalation IRQ encoding
      xive/p9: Introduce XIVE_EQ_SHIFT
      xive/p9: Use sizeof() instead of hardcoded values
      xive/p9: Clarify indirect table allocation
      xive/p9: Force 64K page size on the IC and TM BARs
      xive/p9: Modify the size of the VP space
      xive/p9: Introduce definitions for VP ids of HW threads
      xive/p9: use PAGE_SIZE
      xive/p9: Introduce XIVE_ESB_SIZE
      xive/P9: Use NUM_INT_PRIORITIES in xive_reset()
      xive/p9: Enforce thread enablement before TIMA accesses
      phb4: Finish removing P9 DD1 workaround on LSIs
      xive/p9: Use local_alloc() to allocate the XIVE bitmaps
      psi/p9: mask all sources at init
      xive/p9: Introduce XIVE_ESB_PAGE_SIZE
      xive/p9: Add a retry counter when updating the cache watch
      xive/p9: Remove assert from xive_eq_for_target()
      uart: Give SIMICS some more time
      plat/qemu/p10: add a POWER10 platform
      psi/p10: Activate P10 interrupts
      xive/p10: Add a XIVE2 driver
      psi/p10: Activate 64K ESB pages
      psi/p10: Activate StoreEOI
      xive/p10: Add option flags to the XIVE exploitation mode
      hw/phb5: Add support for PQ offloading
      hw/phb5: Add support for 'Address-Based Interrupt Trigger' mode
      psi/p10: Introduce xive2_source_mask()
      psi/p10: Mask all sources at init
      xive/p10: Introduce new capability bits
      xive/p10: Configure XIVE for fused cores
      xive/p10: Add automatic Context Save and Restore support
      xive/p10: Introduce a new OPAL_XIVE_IRQ_STORE_EOI2 flag
      xive/p10: Activate split mode for PHB ESBs when PQ_disable is available
      xive/p10: Activate has_array when PQ_disable is available
      xive/p10: Tune max_entries_in_modified when split_mode is on
      xive/p10: Change alignment of the queue overflow pages
      phb5: Activate StoreEOI for LSIs

Dan Crowell (1):
      Updating shared constants for HBRT

Dan Horák (4):
      xscom-utils: refer only objects not sources for getscom
      gard: fix installation rule
      external/ffspart: define $(sbindir) for Makefile
      external: convert scripts to Python3

Daniel Axtens (12):
      secvar/backend/edk2.h: mark structs as __packed explicitly
      secvar/backend: include short-types.h in edk2.h
      secvar/backend: add EFI_CERT_RSA2048_GUID
      secvar/backend: require sha256 in our PKCS#7 messages
      secvar/backend: use endian-aware types in edk2.h
      secvar/backend: Don't overread data in auth descriptor
      secvar/backend: fix an integer underflow bug
      secvar/backend: fix a memory leak in get_pkcs7
      pkcs7: pkcs7_get_content_info_type should reset *p on error
      secvar/backend: rename verify_signature parameters
      secvar/backend: clarify variables in process_update
      secvar/backend: fix comment of get_hash_to_verify

Eric Richter (29):
      hw/test: include -gcov binaries in clean target
      doc: add opal secure variable documentation
      libstb/secvar: add secure variable internal abstraction
      libstb/secvar: add secvar api implementation
      secvar/test: add rudimentary secvar API unit testing
      secvar_devtree: add generic compatible, and new format device tree property
      secvar_api: check that enqueue_update writes successfully before returning success
      secvar_main: increase verbosity of the main entrypoint
      tpm_i2c_nuvoton: check TPM vendor id register during probe
      crypto/mbedtls: enable/disable unnecessary features to shrink size
      libstb: remove old mbedtls files
      libstb/secureboot: expose secureboot_enforce for later use in secvar
      include/secvar.h: add .lockdown() hook to secvar storage driver
      secvar_main: rework secvar_main error flow, make storage locking explicit
      secvar_util: add new helper functions
      secvar: overhaul secvar struct by removing static sized fields
      secvar/test: update API tests for new secvar struct
      secvar_devtree: add physical presence mode helper
      doc/secvar: add document detailing secvar driver API
      secvar/storage: add secvar storage driver for pnor-based p9
      secvar/storage/fakenv: add fake tpm operations for testing
      secvar/test: add secboot_tpm storage driver test cases
      secvar/storage: add utility tool to generate NV public name hashes
      secvar/test: add edk2-compat driver test and test data
      witherspoon: enable secvar for witherspoon platform
      tssskiboot.c: chunk reads/writes in 1024-sized buffers to support larger nv indices
      secboot_tpm.c: increase tpmnv vars index size
      secvar/test: use vendored mbedtls instead of host
      secvar/test: use mbedtls cflags when building the test binaries

Frederic Barrat (35):
      core/pci: Refactor common paths on slot hotplug
      core/pci: Add missing lock in set_power_timer
      core/pci: Use proper phandle during hotplug for PHB slots
      core/pci: Train link of PHB slots when hotplugging
      core/pci: Fix scan of devices for opencapi slots
      npu2-hw-procedures: Move some opencapi PHY settings in one-off init
      npu2-opencapi: Make sure the PCI slot has the proper ID
      npu2-hw-procedures: Fix link retraining on reset
      npu2-opencapi: Rework link training timeout
      npu2-opencapi: Tweak fundamental reset sequence
      npu2-opencapi: Simplify freset states
      npu2-opencapi: Detect PHY reset errors
      npu2-opencapi: Improve error reporting to the OS
      npu2-opencapi: Activate PCI hotplug on opencapi slot
      npu2-opencapi: Handle OPAL_UNMAP_PE operation on set_pe() callback
      npu2-opencapi: Log a warning when resetting a broken device
      platform/mihawk: Detect old system compatible string
      npu2: Rework phb-index assignments for virtual PHBs
      npu3: Don't use the device tree to assign the phb-index of the PHB
      npu2, npu3: Remove ibm, phb-index property from the NPU dt node
      npu3: Register virtual PHBs with static IDs
      npu2-opencapi: don't fence on masked XSL errors
      npu2-opencapi: Don't drive reset signal permanently
      npu2-opencapi: Allow platforms to identify physical slots
      capp: Add lid definition for P9 DD2.3
      hw/phb4: Tune GPU direct performance on witherspoon in PCI mode
      platform/mihawk: Tune equalization settings for opencapi
      phb4: Disable TCE cache line buffer
      hdata/iohub: Read PCI Gen5 equalization settings for P10
      hw/phb5: Update PHB numbering to allow for virtual PHBs
      phb5: Add register inits specific to Gen5
      phb5: Workaround for PCI bug HW551382
      phb4: Cleanup PEC config discovery in CAPI mode
      phb4/5: Fix PHB link width detection to avoid useless retrainings
      phb5: Fix PHB max link speed definition on P10

Frédéric Bonnard (1):
      external/common: Use file operation used on x86 for ARCH_UNKNOWN

Gautham R. Shenoy (4):
      sensors: occ: Fix the GPU detection code
      sensors: occ: Fix a bug when sensor values are zero
      occ: Fix false negatives in wait_for_all_occ_init()
      xscom: Fix xscom error logging caused due to xscom OPAL call

Gavin Shan (2):
      core/pci: Use cached VDID when populating device node
      core/pci: Check PCIe cap version in pci_disable_completion_timeout()

Georgy Yakovlev (1):
      opal-prd: handle devtmpfs mounted with noexec

Gustavo Romero (5):
      xive: Fix typo and spelling in a comment
      xive: Fix two typos in comments
      xive: Fix typos in comments
      Update comments for bit manipulation macros
      Fix typos in comment

Hanno Böck (1):
      stb/print-container: Properly check mmap error code

Haren Myneni (7):
      VAS: Alloc IRQ and port address for each VAS instance
      VAS: Define p9_get_rma_bar()
      hdat/spira: Define ibm, primary-topology-index property per chip
      hdat/spira: Add ibm, power10-vas-x string to VAS compatible property
      VAS: Define Remote Memory Access paste address on P10
      VAS: Enable VAS on P10
      NX: Set VAS RMA write BAR register on P10

Ilya Kuznetsov (1):
      pci-slot: Allow to create slot for downstream port of any switch

Joel Stanley (3):
      Detect fused core mode and bail out
      doc: Document more platforms
      Makefile: Avoid errors with GCC 11

Jordan Niethe (10):
      core/pci-dt-slots: Remove duplicate PCIDBG() definition
      pci: Use a macro for accessing PCI BDF Bus Number
      pci: Use a macro for accessing PCI BDF Device Number
      pci: Use a macro for accessing PCI BDF Function Number
      hw/phb4: Use standard MIN/MAX macro definitions
      ipmi: Use standard MIN() macro definition
      core/flash: Use pr_fmt macro for tagging log messages
      ccan: Add CCAN heap license
      external/mambo: Do not enable TM on P9 in ibm, pa-features
      hw/phb5: Add initial support

Joy Chu (3):
      platform/mihawk: Add system VPD EEPROM to I2C bus
      platform/mihawk: add nvme devices slot table
      platform/mihawk: support dynamic PCIe slot table

Klaus Heinrich Kiwi (7):
      ibm-fsp/lxvpd: check for upstream port on slot labeling
      PCI: create optional loc-code platform callback
      core/pci.c: cleanup pci_add_loc_code()
      hdata/memory.c: Fix "Inconsistent MSAREA" warnings
      hdata: Add new "smp-cable-connector" VPD keyword
      build: Fix linker script for builtin Kernel
      external/gard: Enable Power10

LuluTHSu (6):
      platform/mowgli: Add mowgli.c
      platform/mowgli: modify VPD to export correct data to system VPD EEPROM
      mowgli: Limit slot1 to Gen3 by default
      platform/mowgli: modify slot_name
      Revert "mowgli: Limit slot1 to Gen3 by default"
      platform/mowgli: Limit PHB0/(pec0) to gen3 speed

Madhavan Srinivasan (5):
      hdat/spira: export abc and wxyz bus speeds
      hw/imc: Add error message on failing cases for imc_init
      hw/imc: move imc_init() towards end main_cpu_entry()
      hw/imc: Disable only nest_imc devices if pause_microcode() fails
      hw/imc: Refactor trace-imc macros

Mahesh Salgaonkar (6):
      IPMI: Trigger OPAL TI in abort path.
      opal-gard: Add support for new PVR POWER9P.
      opal-gard: sync up the chip unit data list with upstream hostboot.
      phb4/5: Fix printing of device secondary status register.
      phb4: Avoid MMIO load freeze escalation on every chip
      core/cpu: Initialize all cpu thread areas to avoid invalid memory access.

Mauro S. M. Rodrigues (12):
      tpm_i2c_nuvoton: fix tpm_read_fifo overflow check
      libstb: Don't exit trustedboot services multiple times
      Honor DEAD_CODE_ELIMINATION flag
      Squashed 'libstb/crypto/mbedtls/' content from commit 7a03e1cbf5
      Squashed 'libstb/tss2/ibmtpm20tss/utils/' content from commit fae1383d3d
      crypto: add mbedtls build integration via git subtree
      libstb/tss2: Add basic Build infrastructure for tss2
      TPM/TSS: Register TPM chip for further use within TSS
      libstb/tss2: Add TSS wrapping functions
      libstb/trustedboot: Introduce new eventlog implementation
      libstb/tss2: Switch to new implementation of PCR Read/Extend and Eventlog
      libstb/tss: Remove old tss implementation

Michael Ellerman (2):
      mambo: Add more tweakable security flags
      external/mambo: Disable MEMORY_OVERFLOW

Michael Neuling (3):
      external/mambo: 4 byte align chained CPIOs
      p10: Workaround core recovery issue
      phb5: Enable Gen5

Michal Suchanek (1):
      errorlog: Prevent alignment error building with gcc9.

Nayna Jain (9):
      libstb/secureboot: OS Secure Boot is enabled only if FW secureboot is enabled
      secvar: change backend hook interface to take in bank references
      hdata/spira: add physical presence flags
      crypto: add out-of-tree mbedtls pkcs7 parser
      secvar/backend: add edk2 derived key updates processing
      secvar/backend: Bugfixes in edk2 driver
      secvar/backend: improve edk2 driver unit testcases
      mowgli: Enable secvar support for Host OS Secure Boot
      secvar: fix endian conversion

Nicholas Piggin (73):
      asm/head: set skiboot TOC in interrupt handler entry
      core/cpu.c: current_radix_mode should be initialised to true
      build: use -mcpu=power8
      core/exceptions.c: rearrange code to allow more interrupt types
      core/util: trap based assertions
      core/util: branch-to-NULL assert for ELFv2 ABI
      core/exceptions.c: do not include handler code in exception backtrace
      slw: slw_reinit fix array overrun
      build: fix non-constant build asserts
      xive/p9: improve cache watch type checking
      xive/p9: use predefined bitmasks to manipulate EQ addresses
      xive/p9: sbe size debug print fix
      fsp: map trace areas on P9
      psi: update registers to reflect >= P8 PHBSCR
      hdata/test/hdata_to_dt.c: use P8E PVR when -8E is given
      Remove dead POWER7 code
      asm/cvc_entry.S: r2 save fix
      capp: fix endian conversion
      cpu: use dt accessor device tree access
      opal-api: add endian conversions to most opal calls
      opal-msg: endian fixes for opal-msg.c and opal_queue_msg callers
      elf: endian conversions
      spira: fix endian conversions in spira data structures
      hdata: endian conversions
      naca: move naca definition from asm to C
      io: endian conversions for io accessors
      hmi: endian conversions
      cvc: allow BE cvc code to be called from LE context
      xive: make endian-clean
      phb4: make endian-clean
      occ sensors: make endian-clean
      memconsole: make endian-clean
      debug descriptor: make endian-clean
      ipmi: endian conversion
      sbe-p9: endian conversion
      fsp: endian conversions
      errorlog: endian conversion
      pel: endian conversion
      libflash: ecc endian conversions
      prd: endian conversions
      opal-dump: MPIPL endan conversions
      sfc-ctrl: endian conversions
      add little endian support
      dt: assorted cleanups
      add more sparse endian annotations
      fix simple sparse warnings
      i2c: fix dereference beyond the end of buffer
      opal entry: Fix LE skiboot clobbering r10 argument
      libstb/container: Add missing includes
      asm/head.S: QUIESCE_REJECT fix
      move the __this_cpu register to r16, reserve r13-r15
      fast-reboot: add missing clear memory fallback
      fast-reboot: don't back up old vectors upon fast reboot
      fast-reboot: improve fast reboot sequence
      move opal_branch_table, opal_num_args to .rodata section
      skiboot.lds.S: remove dynsym/dynstr and plt
      skiboot.lds.S: introduce PAGE_SIZE, use it to lay out sections
      core: interrupt markers for stack traces
      core/mce: add support for decoding and handling machine checks
      build: -fverbose-asm for .s targets
      platform/blackbird: endian fix
      io: endian annotations and fix
      include/ocmb.h: Add a newline to end of file
      hdata: MS AREA endian fix
      asm/head: fix power save wakeup register corruption
      core/cpu: fix next_ungarded_primary
      mambo: add a mambo rtc_write
      core/mce: POWER9 fix machine check decoding of async errors
      asm/head.S: Fix early SPR inits for big core
      external/mambo: skiboot.tcl add POWER10 config
      Initial POWER10 enablement
      cpufeatures: Add POWER10 support
      hw/chiptod: Add POWER10 support

Nick Child (6):
      edk2-compat-process.c: Remove repetitive debug print statements
      secvar/secvar_util: Properly free memory on zalloc fail
      secvar: ensure ESL buf size is at least what ESL header expects
      secvar: Make `validate_esl_list` iterate through esl chain
      secvar: return error if validate_esl has extra data
      secvar: return error if verify_signature runs out of ESLs

Oliver O'Halloran (131):
      Makefiles: Remove --Wno-stringop-truncation
      hw: Put SPDX on new files
      core/pci-quirk: Re-order struct members
      core/pci: Export pci_check_clear_freeze()
      core/pci-quirk: Microsemi switch UR workaround
      hw/sbe-p9: Fix multi-line log messages
      include/xscom: Remove duplicate p8 definitions
      include/xscom: Remove duplicate p9 definitions
      include/xscom: Use the name EQ rather than EP
      hw/phb4: Prevent register accesses when in reset
      skiboot 6.5 release notes
      core/flash: Validate secure boot content size
      pci: recheck pci nvram hacks on fast-reboot
      hdata: Add Axone IOHUB support
      core/pci: Only hack class code for root ports
      hw/lpc: Configure SerIRQ interrupts on P9P
      hw/psi: Add chip ID to interrupt names
      hw/psi-p9: Make interrupt name array global
      hw/psi-p9: Mask OPAL-owned LSIs without handlers
      hw/psi: Remove explicit external IRQ policy
      core/platform: Actually disable fast-reboot on P8
      core/init: Don't checksum MPIPL data areas
      core/init: Checksum romem after patching out traps
      hw/port80: Squash No SYNC error
      memory: Add NUMA associtivity information to DT
      hdata: Add a generic compatible to ibm,secureboot
      libstb/secvar: Ensure secvar_set_status() is called once
      libstb/secvar: Fix makefile
      core/trace: Move trace buffer exports to a subnode
      core/trace: Rename boot trace buffer
      core/pci: Squash warning from devices with no ecaps
      platforms/astbmc: Add more slot helper macros
      platforms/qemu: Add slot table
      platforms/qemu: Add slot table entries for a PCIe switch
      hdata/test: Remove all temp files
      test/mambo: Skip restoring the old ulimit
      hw/test: Make tests quieter
      makefiles: Make attribute suggestions non-errors
      tests: Squash __attrconst related warnings
      include/cpu: Move __nomcount attribute
      opal-ci: Remove clang builds on 18.04
      boottests: Print the simulator output if V=1 is set
      witherspoon: Squash spurious I2C errors
      hw/p8-i2c: Don't print warnings when dumping registers
      hw/p8-i2c: Clean up interrupt masking
      libstb/tpm: block access to unknown i2c devs on the tpm bus
      xscom: Don't log xscom errors caused by OPAL calls
      doc: Add skiboot-5.2.0 ref
      doc/secvar: Fix table markup
      doc/mpipl: Fix warnings
      doc/secvar: Fix indentation warnings
      doc: Fix code blocks in v6.3.3 release notes
      doc/sbe: Fix block indentation
      doc: Remove duplicate OPAL_ELOG_WRITE label
      doc: Fix block in 6.3.2 release notes
      doc/opal-api: Remove spurious indent
      doc/dt: Fix memory-heirachy block
      doc/opal-api: Remove ref to OPAL_HMI_FLAGS_TOD_TB_FAIL
      doc/device-tree: Add secvar bindings to the toctree
      doc: Add VAS stuff into the tree
      doc: Use parallel builds
      doc: Remove bonus CONTRIBUTING.md from the index
      doc: Fix some errors in platforms-and-cpus
      doc/imc: Fix sphinx warning
      README.md: Add information on docs
      core/platform: Add an explicit fast-reboot type
      core/fast-reset: Do not enable by default
      firenze-pci: Fix infinite loop in firenze_pci_add_loc_code()
      hw/fsp: Remove stray va_end() in __fsp_fillmsg()
      hw/fsp: Fix GENERIC_FAILURE mailbox status code
      Re-license contributions from Raptor Computer Systems
      Re-license contributions from Dan Horák
      Re-license contributions from Yadro
      hw/prd: Hold FSP notifications while PRD is inactive
      docs: Fix ref to skiboot-6.4 in 6.5 release notes
      hw/xscom: Add scom infrastructure
      hw/centaur: Convert to use the new scom API
      hdata/memory: Add support for memory-buffer mmio
      hw/ocmb: Add OCMB SCOM support
      skiboot v6.6 release notes
      hw/phb4: Make error interrupt handler compile
      hw/phb4: Fix interrupt names
      hw/phb4: Don't disable TXE(12) interrupt if on P9 DD2.0
      hw/phb4: Factor out interrupt setup
      hw/phb4: Enable error interrupts
      github: update pull request template
      external/ffspart: Use read() rather than mmap()
      test/qemu: Update command line arguments
      travis: Remove the unused coverity token
      travis: Update config
      ci: Drop debian strech
      ci: Fix docs build
      ci: Remove lcov workaround for Fedora
      travis: move container build into the install step
      travis: Allow ubuntu-latest to fail
      travis: Add an explicit tmpfs mount
      travis: Disable seccomp on child containers
      test: Add an external-check target
      test: Do gcov builds as a seperate pass
      Makefile: Add -Werror to try-cflag so it works on clang
      makefile: Supress Werror on clang
      travis: Add clang specific build job
      hw/xive: Use XIVE_VSD_SIZE more
      hdata: Ensure the prd-label hbrt-code-image is prefixed
      hw/psi-p9: Configure IRQ offset before XIVE notify
      hw/phb4: Actually enable error reporting
      hw/phb4: Verify AER support before initialising AER regs
      stack: only print stack usage backtraces when we hit a new watermark
      opal-prd: Have a worker process handle page offlining
      ci: Add mbedtls development files as a dependency
      skiboot.lds.S: Move BSS start up a bit to accommodate a larger .data
      secvar/test: Remove broken initalizers
      secvar: Clean up makefiles and fix out of tree builds
      test: Skip qemu tests if skiboot.lid is too large
      external/pci-scripts: Add PHB error parsing script
      skiboot v6.7 release notes
      external/trace: Fall back to read()
      external/trace: Print timestamps in prlog()'s format
      trace: Add nvram hack to use the old trace export behaviour
      i2c,trace: Add I2C operation trace events
      hw/p8-i2c: Add p8_i2c_find_bus_by_port()
      hw/p8-i2c: Print interrupt status per master
      hw/p8-i2c: Set poll interval from the current port
      hw/p8-i2c: Move port init into a separate function
      hdat/i2c: Rework i2c device creation
      hw/p8-i2c: Add buses at runtime
      hw/p8-i2c: Make OCCFLG register base address configurable at runtime
      fast-reboot: Fix the bonus cleanup_cpu_state()
      hw/p8-i2c: Add POWER10 support
      prd: Add base P10 support
      hw/psi-p10: Configure interrupt offset before notify addr

Philippe Mathieu-Daudé (3):
      libstb/trustedboot: Use inclusive language, replace the word 'whitelist'
      hw/phb4: Use inclusive language, replace the word 'whitelist'
      hdata/i2c: Use inclusive language, replace the word 'whitelist'

Pratik R. Sampat (3):
      powercap: occ: Set occ_set_powercap as const attribute
      POWER9 Cleanups: de-assert SPW
      POWER9 Cleanups: Don't force clear SPW bits

Pratik Rajesh Sampat (1):
      libpore: P10 stop-api support

Reza Arbab (20):
      Dedup $(HW_OBJS)
      hw/phys-map: Add pvr argument to phys_map_init()
      hw/phys-map: Add Axone memory map
      npu2: Prepare purge_l2_l3_caches() for reuse
      npu2: Refactor NPU OPAL calls
      npu2: Add checks to npu2-only codepaths
      hw: Introduce npu3
      Add Swift platform
      npu3: Rename NPU3_SM_MISC_CFGn register macros
      npu3: Initialize NPU3_SNP_MISC_CFG0
      npu3: Expose remaining ATSD launch registers
      npu: Fix device binding error message
      npu3: Delay enablement of DL parity checking
      devicetree: Remove lpc interrupt properties
      platforms/swift: Remove spurious error message
      npu3: Add ibm, ioda2-npu3-phb to compatible property
      npu3: Improve SALT log output
      npu3: Make SALT CMD_REG writable
      npu2/hw-procedures: Remove assertion from check_credits()
      platforms/astbmc: Add ast2600

Ryan Grimm (7):
      slw: Enable stop states on P9P
      buddy: Fix warnings when undefining BUDDY_DEBUG
      Disable protected execution facility
      Add basic P9 fused core support
      libstb: Set TPM platform auth to random password
      hw/nx: Enable p10 DARN
      hw/chiptod: Retry the sync procedure on failure

Shilpasri G Bhat (1):
      occ: Add pstate corresponding to base frequency to DT

Stewart Smith (27):
      Silence sparse warning for version.c
      sparse: Silence "directive in argument list" for version string
      sparse: fix (main|secondar)_cpu_entry declaration types
      sparse: fix endian types of struct imc_chip_cb members
      sparse: various SPIRA structures, declare them.
      sparse: lpc uart interrupt pointer endianness
      sparse: hdata/fsp: u8 doesn't have endian
      sparse: hdata/iohub: correctly convert endianness
      sparse: hdata/spira sw_xstop_fir_bitpos is uint8_t, has no endian
      sparse: libstb/container: fix endian type for magic number
      gcov: Fix skiboot size to dump out from simulators
      Move ec/ code to Rhesus platform
      SPDX-ify all skiboot code
      travis: Enable fedora30 for ppc64le
      travis: remove fedora29
      travis: do gcov builds on fedora30
      doc/requirements.txt: pin docutils at 0.14
      doc/device-tree/ibm, opal/firmware/version: clarify timeline of git-id vs version
      SPDX fixups and Copyright date fixes
      libstb: export CVC/securerom code memory range
      mambo: enable use of real Container Verification Code
      Re-license IBM written files as Apache 2.0 OR GPLv2+
      platform: add Raptor Blackbird support
      core/opal.c: sparse cleanup integer as NULL
      secvar: fix Using plain integer as NULL pointer sparse warning
      witherspoon: fix using integer as NULL sparse warning
      Make .lid and .lid.xz make targets patterns

Thiago Jung Bauermann (3):
      core/init: Add ibm,processor-storage-keys property to CPU DT node
      Makefile: Search for distro-provided cross-compiler
      dt: Set new property length in dt_resize_property()

Vaidyanathan Srinivasan (7):
      Add POWER9 Cumulus processor PVR type
      Add POWER9 Fleetwood platform support
      Enable fused core mode support in OPAL
      cpu: Add retry in cpu_pm_disable to kick cpus out of idle
      Basic P10 stop state support
      occ: Add POWER10 support
      xive2: Add NCU_SPEC_BAR to stop engine for restore

Vasant Hegde (110):
      OPAL: Add OPAL boot entry address to device tree
      FSP/MDST: Rename fsp-mdst-table.c -> fsp-sysdump.c
      hdata: Split MDST 'type' field to accommodate MPIPL
      hdata: Define various DUMP related structures
      mem-map: Setup memory for MDDT table
      mem-map: Setup memory for MDRT table
      hdata: Update spirah structure
      hdata: Adjust various structure offset after relocation
      hdata: Create /ibm, opal/dump device tree node
      MPIPL: Register for OPAL dump
      MPIPL: Define OPAL metadata area
      MPIPL: Add OPAL API to register for dump region
      MPIPL: Add OPAL API to register tags
      SBE: Send OPAL relocated base address to SBE
      MPIPL: Add support to trigger MPIPL on BMC system
      MPIPL: Save crashing PIR
      HIOMAP: Reset bmc mbox in MPIPL path
      platform: Introduce new reboot type
      hdata: Add "mpipl-boot" property to "dump" node
      MPIPL: Prepare OPAL data tag
      MPIPL: Add OPAL API to query saved tags
      MPIPL: Clear tags and metadata
      MPIPL: Reserve memory to capture architected registers data
      MPIPL: Prepare architected registers data tag
      MPIPL: Add documentation
      MPIPL: struct opal_mpipl_fadump doesn't needs to be packed
      core/ipmi: Fix use-after-free
      core/ipmi: Remove redundant variable
      gard: Add support to run gard tests on FSP platform
      skiboot v6.3.4 release notes
      skiboot v6.5.1 release notes
      hostservices: Silence special wakeup assert/release logs
      hdata: Fix reserved node label search
      prd: Improve debug logs
      prd: Fix prd message queuing interface
      prd: Fix FSP - HBRT firmware_notify message
      FSP/IPMI: Handle FSP reset reload
      skiboot 5.4.11 release notes
      skiboot v6.5.2 release notes
      skiboot v6.3.3 release notes
      skiboot v6.0.21 release notes
      hdata: Update MPIPL support IPL parameter
      stable/build: Do not convert warnings to error
      hdata: Fix SP attention area address
      mpipl: Release cpu data memory in free reserved memory path
      mpipl: Disable fast-reboot during post MPIPL boot
      FSP: Remove flash hook after completing code update
      mpipl: Rework memory reservation for OPAL dump
      platform: Log error to BMC even if diag data is missing
      errorlog: Replace hardcode value with macro
      list: Add list_add_after()
      memory: Sort memory regions list
      ipmi-sel: Free ipmi_msg in error path
      esel: Fix OEM SEL generator ID
      eSEL: Make sure PANIC logs are sent to BMC before calling assert
      errorlog: Increase the severity of abnormal reboot events
      skiboot v6.5.3 release notes
      skiboot v6.5.4 release notes
      skiboot v6.0.22 release notes
      Revert "FSP: Disable PSI link whenever FSP tells OPAL about impending R/R"
      skiboot v6.0.23 release notes
      fsp: Ignore platform dump notification on P9
      MPIPL: Add support to save crash CPU details on FSP system
      ZZ: Fix System Attention Indicator location code
      PSI: Convert prerror to PR_NOTICE
      uart: Drop console write data if BMC becomes unresponsive
      skiboot v6.3.5 release notes
      skiboot v6.6.1 release notes
      opal-ci: Fix broken fedora builds
      opal-ci: Add Ubuntu20.04 support
      test: Print proper mambo command path
      uart: Actually swallow data if LPC is not working
      mpipl: Delay MPIPL registration until OPAL init is complete
      mpipl: Move opal_mpipl_save_crashing_pir() call to platform specific code
      prd: Do not assert if HBRT makes unsupported call
      fsp: Skip sysdump retrieval only in MPIPL boot
      skiboot v6.6.2 release notes
      fsp/dump: Handle non-MPIPL scenario
      skiboot v6.6.3 release notes
      FSP/NVRAM: Do not assert in vNVRAM statistics call
      skiboot 5.4.12 release notes
      skiboot v6.6.4 release notes
      core/platform: Fallback to full_reboot if fast-reboot fails
      Fix possible deadlock with DEBUG build
      hdata: Update ipmi sensors structure
      hdata: Replace hardcoded string with macro
      hdata: assert if we fail to add xscom nodes
      hw/ocmb: Clear top bit from offset before searching addr range
      hw/ocmb: Fix log message
      SBE: Check timer state before scheduling timer
      SBE: Rate limit timer requests
      SBE: Account cancelled timer request
      travis: Update email notification
      opal-ci: Replace fedora32 with fedora33
      opal-ci: Add openssl as dependency to fedora-rawhide
      hw/ipmi: Fix misleading-indentation failures
      ci: Bump qemu version
      skiboot v6.8 release notes
      hdata/vpd: Add new FRU part number keyword
      external/xscom-utils: Add P9P chip info
      skiboot v6.7.1 release notes
      skiboot v6.7.2 release notes
      fsp: Fix sparse warning
      external/xscom-utils: Add P10 chip info
      external/opal-prd: Fix occ, homer node label search
      hdata: Add POWER10 support
      hdata/P10: Fix xscom address and ibm, chip-id property
      phys/P10: Use topology index to get phys mapping
      platform: Add Denali platform support
      hw/chiptod: Abort if core frequency is not set

acsawdey (1):
      external/mambo: rename env var PMEM_MODES to PMEM_MODE

joy_chu (1):
      Add: add mihawk platform file

lixg (1):
      Fix lock error when BT IRQ preempt BT timer

nichole (1):
      platform/mihawk: Fix IPMI double-free

orbitcowboy (1):
      Properly check mmap error code


--------------B0B7237E455479706088BCA2--

