Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E955182F9B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 12:51:03 +0100 (CET)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCMMg-0000tL-Jf
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 07:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMGK-0003qw-V3
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMGI-00028J-3h
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:44:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCMGH-00027k-SS
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:44:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id e26so5892413wme.5
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IV7RRcpqm8EKkimDEtq5ns77M4wK9Dq7639QyMmH7eE=;
 b=ilxIsjQWjMPSxPkuV9xuFBKzmmJLJT/pG4ZzuSXmuLKkWnzx7E3AOc2U6mjZ/0tvg8
 yW0/hV4xYFp/xQsNt1jtpkm58jKc44FHnFnx0APeoG9FOP9cZs5wh1uPa1WjaQZcDXwD
 IvATGx7sPIiwvzJzy64ZGgJzCZBq8Wae2A6yMcHUqwQPInz8wuzWrp/ojwVX6Cf4dp5C
 aojLZ/G1ptzxao2mg838RezA5qu1akWkuwvgM/XEdawsxAXGQxfCC0g9LelXTs/Bb/ay
 THtJVdctbXNlFqSpC29Hf0uVhvEInw05/PK9NcC5Ks83ReXMHxzscacShn5ntWKPZJ+n
 h9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IV7RRcpqm8EKkimDEtq5ns77M4wK9Dq7639QyMmH7eE=;
 b=Hs/0haldKk21+gEmKCMiDqlq6r4SRMzZIJwhvhCLstAL26ci9dmzClZb1My4fiO7Mb
 NdXlterf3b6hcLI2+f+9zl5HN/Qqa3NYzodnQ6upVX9ncKdWdQMux6Umbw37CF6WTvGJ
 5tQiZrAlDcC/OcG1YiJd+yXBEK+gn6QOBvEdEvKaka+3GxwNLzUCMLXalseTkQzV99Oe
 d2OFTGobvj21rQhV85aRPtaLqVTia0EoZ34/oyrehfRhQ3nQrhMIuJEVWnQHexkM3iW9
 CPv4aU2BoM+yiFyBHZa9mbLzxIy03unTNnx8DENyWd8n/0L9m0i14LfVv3NL5r/S+i6d
 uIxg==
X-Gm-Message-State: ANhLgQ3dQetkke25mVV2GvGFssIBoAziHmGPtIYv8XEIcjzY2Cub0E3F
 1PJJpd3+8HcavTlWd4JN2u/B3wxGNYiKnw==
X-Google-Smtp-Source: ADFU+vvPNjnx4pAjSqtiLk+E9ImauA6BtWRs/DpPcUHGkCI7i7P49DcnZ9+QUm+tDpE5aB7IwgODUA==
X-Received: by 2002:a1c:a4c1:: with SMTP id n184mr4457554wme.27.1584013463655; 
 Thu, 12 Mar 2020 04:44:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2688564wmg.22.2020.03.12.04.44.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 04:44:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] docs: Be consistent about capitalization of 'Arm'
Date: Thu, 12 Mar 2020 11:44:08 +0000
Message-Id: <20200312114408.16891-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312114408.16891-1-peter.maydell@linaro.org>
References: <20200312114408.16891-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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

The company 'Arm' went through a rebranding some years back
involving a recapitalization from 'ARM' to 'Arm'. As a result
our documentation is a bit inconsistent between the two forms.
It's not worth trying to update everywhere in QEMU, but it's
easy enough to make docs/ consistent.

Note that "ARMv8" and similar architecture names, and
older CPU names like "ARM926" still retain all-caps.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20200309215818.2021-6-peter.maydell@linaro.org
---
 docs/can.txt                     | 2 +-
 docs/devel/atomics.txt           | 2 +-
 docs/devel/multi-thread-tcg.txt  | 8 ++++----
 docs/replay.txt                  | 2 +-
 docs/specs/fw_cfg.txt            | 2 +-
 docs/devel/kconfig.rst           | 2 +-
 docs/devel/loads-stores.rst      | 2 +-
 docs/devel/tcg.rst               | 2 +-
 docs/specs/tpm.rst               | 6 +++---
 docs/system/arm/cpu-features.rst | 4 ++--
 docs/system/arm/integratorcp.rst | 2 +-
 docs/system/arm/musicpal.rst     | 2 +-
 docs/system/arm/nseries.rst      | 2 +-
 docs/system/arm/palm.rst         | 2 +-
 docs/system/arm/realview.rst     | 4 ++--
 docs/system/arm/sx1.rst          | 2 +-
 docs/system/arm/versatile.rst    | 2 +-
 docs/system/arm/xscale.rst       | 2 +-
 docs/user/main.rst               | 8 ++++----
 19 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/docs/can.txt b/docs/can.txt
index 9fa6ed51c82..11ed8f2d68b 100644
--- a/docs/can.txt
+++ b/docs/can.txt
@@ -13,7 +13,7 @@ controller is implemented.
 
 The PCI addon card hardware has been selected as the first CAN
 interface to implement because such device can be easily connected
-to systems with different CPU architectures (x86, PowerPC, ARM, etc.).
+to systems with different CPU architectures (x86, PowerPC, Arm, etc.).
 
 The project has been initially started in frame of RTEMS GSoC 2013
 slot by Jin Yang under our mentoring  The initial idea was to provide generic
diff --git a/docs/devel/atomics.txt b/docs/devel/atomics.txt
index a4db3a4aaad..67bdf826280 100644
--- a/docs/devel/atomics.txt
+++ b/docs/devel/atomics.txt
@@ -87,7 +87,7 @@ Sequentially consistent loads and stores can be done using:
     atomic_xchg(ptr, val) for stores
 
 However, they are quite expensive on some platforms, notably POWER and
-ARM.  Therefore, qemu/atomic.h provides two primitives with slightly
+Arm.  Therefore, qemu/atomic.h provides two primitives with slightly
 weaker constraints:
 
     typeof(*ptr) atomic_mb_read(ptr)
diff --git a/docs/devel/multi-thread-tcg.txt b/docs/devel/multi-thread-tcg.txt
index 782bebc28b4..3c85ac0eab9 100644
--- a/docs/devel/multi-thread-tcg.txt
+++ b/docs/devel/multi-thread-tcg.txt
@@ -227,7 +227,7 @@ minimise contention.
 (Current solution)
 
 MMIO access automatically serialises hardware emulation by way of the
-BQL. Currently ARM targets serialise all ARM_CP_IO register accesses
+BQL. Currently Arm targets serialise all ARM_CP_IO register accesses
 and also defer the reset/startup of vCPUs to the vCPU context by way
 of async_run_on_cpu().
 
@@ -268,7 +268,7 @@ ordered backends this could become a NOP.
 Aside from explicit standalone memory barrier instructions there are
 also implicit memory ordering semantics which comes with each guest
 memory access instruction. For example all x86 load/stores come with
-fairly strong guarantees of sequential consistency where as ARM has
+fairly strong guarantees of sequential consistency whereas Arm has
 special variants of load/store instructions that imply acquire/release
 semantics.
 
@@ -317,7 +317,7 @@ x86 cmpxchg instruction.
 
 The second type offer a pair of load/store instructions which offer a
 guarantee that a region of memory has not been touched between the
-load and store instructions. An example of this is ARM's ldrex/strex
+load and store instructions. An example of this is Arm's ldrex/strex
 pair where the strex instruction will return a flag indicating a
 successful store only if no other CPU has accessed the memory region
 since the ldrex.
@@ -339,7 +339,7 @@ CURRENT OPEN QUESTIONS:
 
 The TCG provides a number of atomic helpers (tcg_gen_atomic_*) which
 can be used directly or combined to emulate other instructions like
-ARM's ldrex/strex instructions. While they are susceptible to the ABA
+Arm's ldrex/strex instructions. While they are susceptible to the ABA
 problem so far common guests have not implemented patterns where
 this may be a problem - typically presenting a locking ABI which
 assumes cmpxchg like semantics.
diff --git a/docs/replay.txt b/docs/replay.txt
index f4619a62a3d..70c27edb362 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -19,7 +19,7 @@ Deterministic replay has the following features:
    the memory, state of the hardware devices, clocks, and screen of the VM.
  * Writes execution log into the file for later replaying for multiple times
    on different machines.
- * Supports i386, x86_64, and ARM hardware platforms.
+ * Supports i386, x86_64, and Arm hardware platforms.
  * Performs deterministic replay of all operations with keyboard and mouse
    input devices.
 
diff --git a/docs/specs/fw_cfg.txt b/docs/specs/fw_cfg.txt
index 08c00bdf44a..8f1ebc66fa4 100644
--- a/docs/specs/fw_cfg.txt
+++ b/docs/specs/fw_cfg.txt
@@ -82,7 +82,7 @@ Selector Register IOport: 0x510
 Data Register IOport:     0x511
 DMA Address IOport:       0x514
 
-=== ARM Register Locations ===
+=== Arm Register Locations ===
 
 Selector Register address: Base + 8 (2 bytes)
 Data Register address:     Base + 0 (8 bytes)
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index b7bca447046..e5df72b3422 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -8,7 +8,7 @@ time different targets can share large amounts of code.  For example,
 a POWER and an x86 board can run the same code to emulate a PCI network
 card, even though the boards use different PCI host bridges, and they
 can run the same code to emulate a SCSI disk while using different
-SCSI adapters.  ARM, s390 and x86 boards can all present a virtio-blk
+SCSI adapters.  Arm, s390 and x86 boards can all present a virtio-blk
 disk to their guests, but with three different virtio guest interfaces.
 
 Each QEMU target enables a subset of the boards, devices and buses that
diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 03aa9e7ff80..0d99eb24c1b 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -302,7 +302,7 @@ way QEMU defines the view of memory that a device or CPU has.
 or bus fabric.)
 
 Each CPU has an AddressSpace. Some kinds of CPU have more than
-one AddressSpace (for instance ARM guest CPUs have an AddressSpace
+one AddressSpace (for instance Arm guest CPUs have an AddressSpace
 for the Secure world and one for NonSecure if they implement TrustZone).
 Devices which can do DMA-type operations should generally have an
 AddressSpace. There is also a "system address space" which typically
diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index 4956a30a4e6..4ebde44b9d7 100644
--- a/docs/devel/tcg.rst
+++ b/docs/devel/tcg.rst
@@ -83,7 +83,7 @@ memory until the end of the translation block.  This is done for internal
 emulation state that is rarely accessed directly by the program and/or changes
 very often throughout the execution of a translation block---this includes
 condition codes on x86, delay slots on SPARC, conditional execution on
-ARM, and so on.  This state is stored for each target instruction, and
+Arm, and so on.  This state is stored for each target instruction, and
 looked up on exceptions.
 
 MMU emulation
diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index da9eb39ca97..5e61238bc5f 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -25,7 +25,7 @@ QEMU files related to TPM TIS interface:
 
 Both an ISA device and a sysbus device are available. The former is
 used with pc/q35 machine while the latter can be instantiated in the
-ARM virt machine.
+Arm virt machine.
 
 CRB interface
 -------------
@@ -331,7 +331,7 @@ In case a pSeries machine is emulated, use the following command line:
     -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0 \
     -drive file=test.img,format=raw,if=none,id=drive-virtio-disk0
 
-In case an ARM virt machine is emulated, use the following command line:
+In case an Arm virt machine is emulated, use the following command line:
 
 .. code-block:: console
 
@@ -346,7 +346,7 @@ In case an ARM virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly \
     -drive if=pflash,format=raw,file=flash1.img
 
-  On ARM, ACPI boot with TPM is not yet supported.
+  On Arm, ACPI boot with TPM is not yet supported.
 
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 7495b7b672b..2d5c06cd016 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -5,9 +5,9 @@ CPU features are optional features that a CPU of supporting type may
 choose to implement or not.  In QEMU, optional CPU features have
 corresponding boolean CPU proprieties that, when enabled, indicate
 that the feature is implemented, and, conversely, when disabled,
-indicate that it is not implemented. An example of an ARM CPU feature
+indicate that it is not implemented. An example of an Arm CPU feature
 is the Performance Monitoring Unit (PMU).  CPU types such as the
-Cortex-A15 and the Cortex-A57, which respectively implement ARM
+Cortex-A15 and the Cortex-A57, which respectively implement Arm
 architecture reference manuals ARMv7-A and ARMv8-A, may both optionally
 implement PMUs.  For example, if a user wants to use a Cortex-A15 without
 a PMU, then the `-cpu` parameter should contain `pmu=off` on the QEMU
diff --git a/docs/system/arm/integratorcp.rst b/docs/system/arm/integratorcp.rst
index 3232b43a08b..e6f050f602b 100644
--- a/docs/system/arm/integratorcp.rst
+++ b/docs/system/arm/integratorcp.rst
@@ -1,7 +1,7 @@
 Integrator/CP (``integratorcp``)
 ================================
 
-The ARM Integrator/CP board is emulated with the following devices:
+The Arm Integrator/CP board is emulated with the following devices:
 
 -  ARM926E, ARM1026E, ARM946E, ARM1136 or Cortex-A8 CPU
 
diff --git a/docs/system/arm/musicpal.rst b/docs/system/arm/musicpal.rst
index 35c22212486..9de380edf81 100644
--- a/docs/system/arm/musicpal.rst
+++ b/docs/system/arm/musicpal.rst
@@ -4,7 +4,7 @@ Freecom MusicPal (``musicpal``)
 The Freecom MusicPal internet radio emulation includes the following
 elements:
 
--  Marvell MV88W8618 ARM core.
+-  Marvell MV88W8618 Arm core.
 
 -  32 MB RAM, 256 KB SRAM, 8 MB flash.
 
diff --git a/docs/system/arm/nseries.rst b/docs/system/arm/nseries.rst
index b000b6d13bb..cd9edf5d88b 100644
--- a/docs/system/arm/nseries.rst
+++ b/docs/system/arm/nseries.rst
@@ -4,7 +4,7 @@ Nokia N800 and N810 tablets (``n800``, ``n810``)
 Nokia N800 and N810 internet tablets (known also as RX-34 and RX-44 /
 48) emulation supports the following elements:
 
--  Texas Instruments OMAP2420 System-on-chip (ARM 1136 core)
+-  Texas Instruments OMAP2420 System-on-chip (ARM1136 core)
 
 -  RAM and non-volatile OneNAND Flash memories
 
diff --git a/docs/system/arm/palm.rst b/docs/system/arm/palm.rst
index 0eabf63e0e7..47ff9b36d46 100644
--- a/docs/system/arm/palm.rst
+++ b/docs/system/arm/palm.rst
@@ -4,7 +4,7 @@ Palm Tungsten|E PDA (``cheetah``)
 The Palm Tungsten|E PDA (codename \"Cheetah\") emulation includes the
 following elements:
 
--  Texas Instruments OMAP310 System-on-chip (ARM 925T core)
+-  Texas Instruments OMAP310 System-on-chip (ARM925T core)
 
 -  ROM and RAM memories (ROM firmware image can be loaded with
    -option-rom)
diff --git a/docs/system/arm/realview.rst b/docs/system/arm/realview.rst
index 8e08eb5da16..65f5be346b1 100644
--- a/docs/system/arm/realview.rst
+++ b/docs/system/arm/realview.rst
@@ -1,7 +1,7 @@
 Arm Realview boards (``realview-eb``, ``realview-eb-mpcore``, ``realview-pb-a8``, ``realview-pbx-a9``)
 ======================================================================================================
 
-Several variants of the ARM RealView baseboard are emulated, including
+Several variants of the Arm RealView baseboard are emulated, including
 the EB, PB-A8 and PBX-A9. Due to interactions with the bootloader, only
 certain Linux kernel configurations work out of the box on these boards.
 
@@ -14,7 +14,7 @@ The following devices are emulated:
 
 -  ARM926E, ARM1136, ARM11MPCore, Cortex-A8 or Cortex-A9 MPCore CPU
 
--  ARM AMBA Generic/Distributed Interrupt Controller
+-  Arm AMBA Generic/Distributed Interrupt Controller
 
 -  Four PL011 UARTs
 
diff --git a/docs/system/arm/sx1.rst b/docs/system/arm/sx1.rst
index 321993bc098..8bce30d4b25 100644
--- a/docs/system/arm/sx1.rst
+++ b/docs/system/arm/sx1.rst
@@ -4,7 +4,7 @@ Siemens SX1 (``sx1``, ``sx1-v1``)
 The Siemens SX1 models v1 and v2 (default) basic emulation. The
 emulation includes the following elements:
 
--  Texas Instruments OMAP310 System-on-chip (ARM 925T core)
+-  Texas Instruments OMAP310 System-on-chip (ARM925T core)
 
 -  ROM and RAM memories (ROM firmware image can be loaded with
    -pflash) V1 1 Flash of 16MB and 1 Flash of 8MB V2 1 Flash of 32MB
diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rst
index 48b6ca0a020..51221c30a48 100644
--- a/docs/system/arm/versatile.rst
+++ b/docs/system/arm/versatile.rst
@@ -1,7 +1,7 @@
 Arm Versatile boards (``versatileab``, ``versatilepb``)
 =======================================================
 
-The ARM Versatile baseboard is emulated with the following devices:
+The Arm Versatile baseboard is emulated with the following devices:
 
 -  ARM926E, ARM1136 or Cortex-A8 CPU
 
diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
index 19da2eff352..89ec93e904e 100644
--- a/docs/system/arm/xscale.rst
+++ b/docs/system/arm/xscale.rst
@@ -4,7 +4,7 @@ Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``)
 The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
 and \"Terrier\") emulation includes the following peripherals:
 
--  Intel PXA270 System-on-chip (ARM V5TE core)
+-  Intel PXA270 System-on-chip (ARMv5TE core)
 
 -  NAND Flash memory
 
diff --git a/docs/user/main.rst b/docs/user/main.rst
index ca69f7727d5..bd99b0fdbe9 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -35,7 +35,7 @@ QEMU user space emulation has the following notable features:
    On Linux, QEMU can emulate the ``clone`` syscall and create a real
    host thread (with a separate virtual CPU) for each emulated thread.
    Note that not all targets currently emulate atomic operations
-   correctly. x86 and ARM use a global lock in order to preserve their
+   correctly. x86 and Arm use a global lock in order to preserve their
    semantics.
 
 QEMU was conceived so that ultimately it can emulate itself. Although it
@@ -173,11 +173,11 @@ Other binaries
 user mode (Alpha)
 ``qemu-alpha`` TODO.
 
-user mode (ARM)
+user mode (Arm)
 ``qemu-armeb`` TODO.
 
-user mode (ARM)
-``qemu-arm`` is also capable of running ARM \"Angel\" semihosted ELF
+user mode (Arm)
+``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
 binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
 configurations), and arm-uclinux bFLT format binaries.
 
-- 
2.20.1


