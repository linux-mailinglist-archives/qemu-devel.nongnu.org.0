Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C67173C1A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 16:47:40 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7hrY-0003DV-0J
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 10:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7hhF-0001Hb-57
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 10:37:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7hhC-000534-P5
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 10:37:01 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37893)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7hhC-00052W-GQ
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 10:36:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id n64so2334884wme.3
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vy2tBOWYvGgZJ+EoyqfTKazPEYFTguAlNL/SQIXy0Uc=;
 b=A7hu8HODzojg5LINbXct6E19CeerHxLOsQmUTMwgzkGuKM9KI9xkPBUohXlxZLcBlA
 VK0yT31ZMkt9Xp2aHTvcEsgwhwHp4IU/plKjMAnu24+g8Zmt3WlKcku1eaXgUuLOQfMw
 UQswobw14gzyY77Mt9UKSjHv4qpbRSDmh3iD/PCWW6sDg7adHlOowYzyaFFIfUrv9YKV
 i0HzPcLNuwUqkXzHqUOy4UCFhRKDVN4QzEBwCVV1dX7H2Q/546hQAnE1w6mUZX8nzNZf
 9eOtLqxrfCKTRf7WW+LOtZ9tRRLoE6Zsc4jEJD78RcDk+PZnsr5dITIWXkgS7cEs2lNk
 i2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vy2tBOWYvGgZJ+EoyqfTKazPEYFTguAlNL/SQIXy0Uc=;
 b=DwfHnvnc4pOyIV6K3lM7PSMbQknsFTs+ZM9tT9kc2eubqQS0EKs77Hte4IMTup6rfX
 pWbtE/ZgoNKoYVLSuTuTd+pZwJvYsFqSzb5knVjykZKeCD1ZX1/mza0oe/I6K4Tcn3Bj
 6pdLp1aWpchAOK+FCidS6aZYfjYQJS1sUjRamYRbann8RfY5vZkKPSXZ/jtfLyWHu0Q4
 tG0f8BZ0hUMOJlJUUauetYNJNnsgWOzUtjDgE4E7RjpqcHDHpiCb+KuvyV9Ntq4YGYtY
 0HPKSsx/7s3i4x5nvVuHE1LipK77o5puYCQ/i0WrMNIeZsuKX0z7hwpVclHFQH7+LCTg
 hapA==
X-Gm-Message-State: APjAAAWKMlrCz3knJqqyiznUoKl3LLzFY7cOHWjHfdIHovm/8/L1se3I
 BRrlp3R8Q7WTc/cju/6GbVnUjPR5trfpVg==
X-Google-Smtp-Source: APXvYqwczPLp2N2/9ROjpXV8849D2uzvoSs3fEv5P+4qlw7UkQdux+FsYUYV60MQwtcz/pexfqg9cw==
X-Received: by 2002:a1c:a405:: with SMTP id n5mr3048936wme.125.1582904216689; 
 Fri, 28 Feb 2020 07:36:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u23sm2659452wmu.14.2020.02.28.07.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:36:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/33] hmp-commands-info.hx: Add rST documentation fragments
Date: Fri, 28 Feb 2020 15:36:07 +0000
Message-Id: <20200228153619.9906-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228153619.9906-1-peter.maydell@linaro.org>
References: <20200228153619.9906-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the rST versions of the documentation fragments.  Once we've
converted fully from Texinfo to rST we can remove the ETEXI
fragments; for the moment we need both.

Note that most of the SRST fragments are 2-space indented so that the
'info foo' documentation entries appear as a sublist under the 'info'
entry in the top level list.

Again, all we need to do to put the documentation in the Sphinx manual
is a one-line hxtool-doc invocation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile                |   2 +-
 docs/system/monitor.rst |   4 +-
 hmp-commands-info.hx    | 271 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 273 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 22427376b48..98ef06ab8e8 100644
--- a/Makefile
+++ b/Makefile
@@ -1071,7 +1071,7 @@ $(MANUAL_BUILDDIR)/interop/index.html: $(call manual-deps,interop)
 $(MANUAL_BUILDDIR)/specs/index.html: $(call manual-deps,specs)
 	$(call build-manual,specs,html)
 
-$(MANUAL_BUILDDIR)/system/index.html: $(call manual-deps,system) $(SRC_PATH)/hmp-commands.hx
+$(MANUAL_BUILDDIR)/system/index.html: $(call manual-deps,system) $(SRC_PATH)/hmp-commands.hx $(SRC_PATH)/hmp-commands-info.hx
 	$(call build-manual,system,html)
 
 $(MANUAL_BUILDDIR)/tools/index.html: $(call manual-deps,tools) $(SRC_PATH)/qemu-img-cmds.hx $(SRC_PATH)/docs/qemu-option-trace.rst.inc
diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index 52b0f18cfec..0bcd5da2164 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -21,9 +21,7 @@ The following commands are available:
 
 .. hxtool-doc:: hmp-commands.hx
 
-..
-  TODO: convert and reference hmp-commands-info.hx
-
+.. hxtool-doc:: hmp-commands-info.hx
 
 Integer expressions
 ~~~~~~~~~~~~~~~~~~~
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 257ee7d7a3f..1730f866cde 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -4,6 +4,12 @@ HXCOMM discarded from C version
 HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
 HXCOMM monitor info commands
 HXCOMM HXCOMM can be used for comments, discarded from both texi and C
+HXCOMM
+HXCOMM In this file, generally SRST fragments should have two extra
+HXCOMM spaces of indent, so that the documentation list item for "info foo"
+HXCOMM appears inside the documentation list item for the top level
+HXCOMM "info" documentation entry. The exception is the first SRST
+HXCOMM fragment that defines that top level entry.
 
 STEXI
 @table @option
@@ -12,6 +18,11 @@ STEXI
 Show various information about the system state.
 @table @option
 ETEXI
+SRST
+``info`` *subcommand*
+  Show various information about the system state.
+
+ERST
 
     {
         .name       = "version",
@@ -27,6 +38,10 @@ STEXI
 @findex info version
 Show the version of QEMU.
 ETEXI
+SRST
+  ``info version``
+    Show the version of QEMU.
+ERST
 
     {
         .name       = "network",
@@ -41,6 +56,10 @@ STEXI
 @findex info network
 Show the network state.
 ETEXI
+SRST
+  ``info network``
+    Show the network state.
+ERST
 
     {
         .name       = "chardev",
@@ -56,6 +75,10 @@ STEXI
 @findex info chardev
 Show the character devices.
 ETEXI
+SRST
+  ``info chardev``
+    Show the character devices.
+ERST
 
     {
         .name       = "block",
@@ -71,6 +94,10 @@ STEXI
 @findex info block
 Show info of one block device or all block devices.
 ETEXI
+SRST
+  ``info block``
+    Show info of one block device or all block devices.
+ERST
 
     {
         .name       = "blockstats",
@@ -85,6 +112,10 @@ STEXI
 @findex info blockstats
 Show block device statistics.
 ETEXI
+SRST
+  ``info blockstats``
+    Show block device statistics.
+ERST
 
     {
         .name       = "block-jobs",
@@ -99,6 +130,10 @@ STEXI
 @findex info block-jobs
 Show progress of ongoing block device operations.
 ETEXI
+SRST
+  ``info block-jobs``
+    Show progress of ongoing block device operations.
+ERST
 
     {
         .name       = "registers",
@@ -113,6 +148,10 @@ STEXI
 @findex info registers
 Show the cpu registers.
 ETEXI
+SRST
+  ``info registers``
+    Show the cpu registers.
+ERST
 
 #if defined(TARGET_I386)
     {
@@ -130,6 +169,10 @@ STEXI
 @findex info lapic
 Show local APIC state
 ETEXI
+SRST
+  ``info lapic``
+    Show local APIC state
+ERST
 
 #if defined(TARGET_I386)
     {
@@ -146,6 +189,10 @@ STEXI
 @findex info ioapic
 Show io APIC state
 ETEXI
+SRST
+  ``info ioapic``
+    Show io APIC state
+ERST
 
     {
         .name       = "cpus",
@@ -160,6 +207,10 @@ STEXI
 @findex info cpus
 Show infos for each CPU.
 ETEXI
+SRST
+  ``info cpus``
+    Show infos for each CPU.
+ERST
 
     {
         .name       = "history",
@@ -175,6 +226,10 @@ STEXI
 @findex info history
 Show the command line history.
 ETEXI
+SRST
+  ``info history``
+    Show the command line history.
+ERST
 
     {
         .name       = "irq",
@@ -189,6 +244,10 @@ STEXI
 @findex info irq
 Show the interrupts statistics (if available).
 ETEXI
+SRST
+  ``info irq``
+    Show the interrupts statistics (if available).
+ERST
 
     {
         .name       = "pic",
@@ -203,6 +262,10 @@ STEXI
 @findex info pic
 Show PIC state.
 ETEXI
+SRST
+  ``info pic``
+    Show PIC state.
+ERST
 
     {
         .name       = "rdma",
@@ -217,6 +280,10 @@ STEXI
 @findex info rdma
 Show RDMA state.
 ETEXI
+SRST
+  ``info rdma``
+    Show RDMA state.
+ERST
 
     {
         .name       = "pci",
@@ -231,6 +298,10 @@ STEXI
 @findex info pci
 Show PCI information.
 ETEXI
+SRST
+  ``info pci``
+    Show PCI information.
+ERST
 
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
     defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
@@ -248,6 +319,10 @@ STEXI
 @findex info tlb
 Show virtual to physical memory mappings.
 ETEXI
+SRST
+  ``info tlb``
+    Show virtual to physical memory mappings.
+ERST
 
 #if defined(TARGET_I386) || defined(TARGET_RISCV)
     {
@@ -264,6 +339,10 @@ STEXI
 @findex info mem
 Show the active virtual memory mappings.
 ETEXI
+SRST
+  ``info mem``
+    Show the active virtual memory mappings.
+ERST
 
     {
         .name       = "mtree",
@@ -280,6 +359,10 @@ STEXI
 @findex info mtree
 Show memory tree.
 ETEXI
+SRST
+  ``info mtree``
+    Show memory tree.
+ERST
 
 #if defined(CONFIG_TCG)
     {
@@ -296,6 +379,10 @@ STEXI
 @findex info jit
 Show dynamic compiler info.
 ETEXI
+SRST
+  ``info jit``
+    Show dynamic compiler info.
+ERST
 
 #if defined(CONFIG_TCG)
     {
@@ -312,6 +399,10 @@ STEXI
 @findex info opcount
 Show dynamic compiler opcode counters
 ETEXI
+SRST
+  ``info opcount``
+    Show dynamic compiler opcode counters
+ERST
 
     {
         .name       = "sync-profile",
@@ -334,6 +425,20 @@ sorted by total wait time.
 When different objects that share the same call site are coalesced, the "Object"
 field shows---enclosed in brackets---the number of objects being coalesced.
 ETEXI
+SRST
+  ``info sync-profile [-m|-n]`` [*max*]
+    Show synchronization profiling info, up to *max* entries (default: 10),
+    sorted by total wait time.
+
+    ``-m``
+      sort by mean wait time
+    ``-n``
+      do not coalesce objects with the same call site
+
+    When different objects that share the same call site are coalesced,
+    the "Object" field shows---enclosed in brackets---the number of objects
+    being coalesced.
+ERST
 
     {
         .name       = "kvm",
@@ -348,6 +453,10 @@ STEXI
 @findex info kvm
 Show KVM information.
 ETEXI
+SRST
+  ``info kvm``
+    Show KVM information.
+ERST
 
     {
         .name       = "numa",
@@ -362,6 +471,10 @@ STEXI
 @findex info numa
 Show NUMA information.
 ETEXI
+SRST
+  ``info numa``
+    Show NUMA information.
+ERST
 
     {
         .name       = "usb",
@@ -376,6 +489,10 @@ STEXI
 @findex info usb
 Show guest USB devices.
 ETEXI
+SRST
+  ``info usb``
+    Show guest USB devices.
+ERST
 
     {
         .name       = "usbhost",
@@ -390,6 +507,10 @@ STEXI
 @findex info usbhost
 Show host USB devices.
 ETEXI
+SRST
+  ``info usbhost``
+    Show host USB devices.
+ERST
 
     {
         .name       = "profile",
@@ -404,6 +525,10 @@ STEXI
 @findex info profile
 Show profiling information.
 ETEXI
+SRST
+  ``info profile``
+    Show profiling information.
+ERST
 
     {
         .name       = "capture",
@@ -418,6 +543,10 @@ STEXI
 @findex info capture
 Show capture information.
 ETEXI
+SRST
+  ``info capture``
+    Show capture information.
+ERST
 
     {
         .name       = "snapshots",
@@ -432,6 +561,10 @@ STEXI
 @findex info snapshots
 Show the currently saved VM snapshots.
 ETEXI
+SRST
+  ``info snapshots``
+    Show the currently saved VM snapshots.
+ERST
 
     {
         .name       = "status",
@@ -447,6 +580,10 @@ STEXI
 @findex info status
 Show the current VM status (running|paused).
 ETEXI
+SRST
+  ``info status``
+    Show the current VM status (running|paused).
+ERST
 
     {
         .name       = "mice",
@@ -461,6 +598,10 @@ STEXI
 @findex info mice
 Show which guest mouse is receiving events.
 ETEXI
+SRST
+  ``info mice``
+    Show which guest mouse is receiving events.
+ERST
 
 #if defined(CONFIG_VNC)
     {
@@ -477,6 +618,10 @@ STEXI
 @findex info vnc
 Show the vnc server status.
 ETEXI
+SRST
+  ``info vnc``
+    Show the vnc server status.
+ERST
 
 #if defined(CONFIG_SPICE)
     {
@@ -493,6 +638,10 @@ STEXI
 @findex info spice
 Show the spice server status.
 ETEXI
+SRST
+  ``info spice``
+    Show the spice server status.
+ERST
 
     {
         .name       = "name",
@@ -508,6 +657,10 @@ STEXI
 @findex info name
 Show the current VM name.
 ETEXI
+SRST
+  ``info name``
+    Show the current VM name.
+ERST
 
     {
         .name       = "uuid",
@@ -523,6 +676,10 @@ STEXI
 @findex info uuid
 Show the current VM UUID.
 ETEXI
+SRST
+  ``info uuid``
+    Show the current VM UUID.
+ERST
 
     {
         .name       = "cpustats",
@@ -537,6 +694,10 @@ STEXI
 @findex info cpustats
 Show CPU statistics.
 ETEXI
+SRST
+  ``info cpustats``
+    Show CPU statistics.
+ERST
 
 #if defined(CONFIG_SLIRP)
     {
@@ -553,6 +714,10 @@ STEXI
 @findex info usernet
 Show user network stack connection states.
 ETEXI
+SRST
+  ``info usernet``
+    Show user network stack connection states.
+ERST
 
     {
         .name       = "migrate",
@@ -567,6 +732,10 @@ STEXI
 @findex info migrate
 Show migration status.
 ETEXI
+SRST
+  ``info migrate``
+    Show migration status.
+ERST
 
     {
         .name       = "migrate_capabilities",
@@ -581,6 +750,10 @@ STEXI
 @findex info migrate_capabilities
 Show current migration capabilities.
 ETEXI
+SRST
+  ``info migrate_capabilities``
+    Show current migration capabilities.
+ERST
 
     {
         .name       = "migrate_parameters",
@@ -595,6 +768,10 @@ STEXI
 @findex info migrate_parameters
 Show current migration parameters.
 ETEXI
+SRST
+  ``info migrate_parameters``
+    Show current migration parameters.
+ERST
 
     {
         .name       = "migrate_cache_size",
@@ -609,6 +786,10 @@ STEXI
 @findex info migrate_cache_size
 Show current migration xbzrle cache size.
 ETEXI
+SRST
+  ``info migrate_cache_size``
+    Show current migration xbzrle cache size.
+ERST
 
     {
         .name       = "balloon",
@@ -623,6 +804,10 @@ STEXI
 @findex info balloon
 Show balloon information.
 ETEXI
+SRST
+  ``info balloon``
+    Show balloon information.
+ERST
 
     {
         .name       = "qtree",
@@ -637,6 +822,10 @@ STEXI
 @findex info qtree
 Show device tree.
 ETEXI
+SRST
+  ``info qtree``
+    Show device tree.
+ERST
 
     {
         .name       = "qdm",
@@ -651,6 +840,10 @@ STEXI
 @findex info qdm
 Show qdev device model list.
 ETEXI
+SRST
+  ``info qdm``
+    Show qdev device model list.
+ERST
 
     {
         .name       = "qom-tree",
@@ -666,6 +859,10 @@ STEXI
 @findex info qom-tree
 Show QOM composition tree.
 ETEXI
+SRST
+  ``info qom-tree``
+    Show QOM composition tree.
+ERST
 
     {
         .name       = "roms",
@@ -680,6 +877,10 @@ STEXI
 @findex info roms
 Show roms.
 ETEXI
+SRST
+  ``info roms``
+    Show roms.
+ERST
 
     {
         .name       = "trace-events",
@@ -696,6 +897,10 @@ STEXI
 @findex info trace-events
 Show available trace-events & their state.
 ETEXI
+SRST
+  ``info trace-events``
+    Show available trace-events & their state.
+ERST
 
     {
         .name       = "tpm",
@@ -710,6 +915,10 @@ STEXI
 @findex info tpm
 Show the TPM device.
 ETEXI
+SRST
+  ``info tpm``
+    Show the TPM device.
+ERST
 
     {
         .name       = "memdev",
@@ -725,6 +934,10 @@ STEXI
 @findex info memdev
 Show memory backends
 ETEXI
+SRST
+  ``info memdev``
+    Show memory backends
+ERST
 
     {
         .name       = "memory-devices",
@@ -739,6 +952,10 @@ STEXI
 @findex info memory-devices
 Show memory devices.
 ETEXI
+SRST
+  ``info memory-devices``
+    Show memory devices.
+ERST
 
     {
         .name       = "iothreads",
@@ -754,6 +971,10 @@ STEXI
 @findex info iothreads
 Show iothread's identifiers.
 ETEXI
+SRST
+  ``info iothreads``
+    Show iothread's identifiers.
+ERST
 
     {
         .name       = "rocker",
@@ -768,6 +989,10 @@ STEXI
 @findex info rocker
 Show rocker switch.
 ETEXI
+SRST
+  ``info rocker`` *name*
+    Show rocker switch.
+ERST
 
     {
         .name       = "rocker-ports",
@@ -782,6 +1007,10 @@ STEXI
 @findex info rocker-ports
 Show rocker ports.
 ETEXI
+SRST
+  ``info rocker-ports`` *name*-ports
+    Show rocker ports.
+ERST
 
     {
         .name       = "rocker-of-dpa-flows",
@@ -796,6 +1025,10 @@ STEXI
 @findex info rocker-of-dpa-flows
 Show rocker OF-DPA flow tables.
 ETEXI
+SRST
+  ``info rocker-of-dpa-flows`` *name* [*tbl_id*]
+    Show rocker OF-DPA flow tables.
+ERST
 
     {
         .name       = "rocker-of-dpa-groups",
@@ -810,6 +1043,10 @@ STEXI
 @findex info rocker-of-dpa-groups
 Show rocker OF-DPA groups.
 ETEXI
+SRST
+  ``info rocker-of-dpa-groups`` *name* [*type*]
+    Show rocker OF-DPA groups.
+ERST
 
 #if defined(TARGET_S390X)
     {
@@ -826,6 +1063,10 @@ STEXI
 @findex info skeys
 Display the value of a storage key (s390 only)
 ETEXI
+SRST
+  ``info skeys`` *address*
+    Display the value of a storage key (s390 only)
+ERST
 
 #if defined(TARGET_S390X)
     {
@@ -842,6 +1083,11 @@ STEXI
 @findex info cmma
 Display the values of the CMMA storage attributes for a range of pages (s390 only)
 ETEXI
+SRST
+  ``info cmma`` *address*
+    Display the values of the CMMA storage attributes for a range of
+    pages (s390 only)
+ERST
 
     {
         .name       = "dump",
@@ -856,6 +1102,10 @@ STEXI
 @findex info dump
 Display the latest dump status.
 ETEXI
+SRST
+  ``info dump``
+    Display the latest dump status.
+ERST
 
     {
         .name       = "ramblock",
@@ -870,6 +1120,10 @@ STEXI
 @findex info ramblock
 Dump all the ramblocks of the system.
 ETEXI
+SRST
+  ``info ramblock``
+    Dump all the ramblocks of the system.
+ERST
 
     {
         .name       = "hotpluggable-cpus",
@@ -885,6 +1139,10 @@ STEXI
 @findex info hotpluggable-cpus
 Show information about hotpluggable CPUs
 ETEXI
+SRST
+  ``info hotpluggable-cpus``
+    Show information about hotpluggable CPUs
+ERST
 
     {
         .name       = "vm-generation-id",
@@ -899,6 +1157,10 @@ STEXI
 @findex info vm-generation-id
 Show Virtual Machine Generation ID
 ETEXI
+SRST
+  ``info vm-generation-id``
+    Show Virtual Machine Generation ID
+ERST
 
     {
         .name       = "memory_size_summary",
@@ -915,6 +1177,11 @@ STEXI
 Display the amount of initially allocated and present hotpluggable (if
 enabled) memory in bytes.
 ETEXI
+SRST
+  ``info memory_size_summary``
+    Display the amount of initially allocated and present hotpluggable (if
+    enabled) memory in bytes.
+ERST
 
 #if defined(TARGET_I386)
     {
@@ -931,6 +1198,10 @@ STEXI
 @findex info sev
 Show SEV information.
 ETEXI
+SRST
+  ``info sev``
+    Show SEV information.
+ERST
 
 STEXI
 @end table
-- 
2.20.1


