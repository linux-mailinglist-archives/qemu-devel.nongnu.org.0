Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326BBCFBFD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 16:08:43 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHqAL-0005dG-IJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 10:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iHpzY-0004RR-Qa
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iHpzW-0005F0-ST
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:57:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57682)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iHpzW-0005EX-Jo
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:57:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB4A351F04;
 Tue,  8 Oct 2019 13:57:29 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17DA0600CE;
 Tue,  8 Oct 2019 13:57:21 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/12] hw/i386/pc: fix code style issues on functions that
 will be moved out
Date: Tue,  8 Oct 2019 15:55:29 +0200
Message-Id: <20191008135537.197867-4-slp@redhat.com>
In-Reply-To: <20191008135537.197867-1-slp@redhat.com>
References: <20191008135537.197867-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 08 Oct 2019 13:57:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix code style issues detected by checkpatch.pl on functions that will
be moved out to x86.c on the next patch.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 hw/i386/pc.c | 86 ++++++++++++++++++++++++++++------------------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd08c6704b..f19d4ac0bd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -68,6 +68,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "qemu/cutils.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/boards.h"
@@ -866,7 +867,8 @@ static void handle_a20_line_change(void *opaque, int =
irq, int level)
     x86_cpu_set_a20(cpu, level);
 }
=20
-/* Calculates initial APIC ID for a specific CPU index
+/*
+ * Calculates initial APIC ID for a specific CPU index
  *
  * Currently we need to be able to calculate the APIC ID from the CPU in=
dex
  * alone (without requiring a CPU object), as the QEMU<->Seabios interfa=
ces have
@@ -1039,11 +1041,18 @@ static void x86_load_linux(PCMachineState *pcms,
     const char *kernel_cmdline =3D machine->kernel_cmdline;
=20
     /* Align to 16 bytes as a paranoia measure */
-    cmdline_size =3D (strlen(kernel_cmdline)+16) & ~15;
+    cmdline_size =3D (strlen(kernel_cmdline) + 16) & ~15;
=20
     /* load the kernel header */
     f =3D fopen(kernel_filename, "rb");
-    if (!f || !(kernel_size =3D get_file_size(f)) ||
+    if (!f) {
+        fprintf(stderr, "qemu: could not open kernel file '%s': %s\n",
+                kernel_filename, strerror(errno));
+        exit(1);
+    }
+
+    kernel_size =3D get_file_size(f);
+    if (!kernel_size ||
         fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=3D
         MIN(ARRAY_SIZE(header), kernel_size)) {
         fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
@@ -1052,11 +1061,8 @@ static void x86_load_linux(PCMachineState *pcms,
     }
=20
     /* kernel protocol version */
-#if 0
-    fprintf(stderr, "header magic: %#x\n", ldl_p(header+0x202));
-#endif
-    if (ldl_p(header+0x202) =3D=3D 0x53726448) {
-        protocol =3D lduw_p(header+0x206);
+    if (ldl_p(header + 0x202) =3D=3D 0x53726448) {
+        protocol =3D lduw_p(header + 0x206);
     } else {
         /*
          * This could be a multiboot kernel. If it is, let's stop treati=
ng it
@@ -1146,19 +1152,9 @@ static void x86_load_linux(PCMachineState *pcms,
         prot_addr    =3D 0x100000;
     }
=20
-#if 0
-    fprintf(stderr,
-            "qemu: real_addr     =3D 0x" TARGET_FMT_plx "\n"
-            "qemu: cmdline_addr  =3D 0x" TARGET_FMT_plx "\n"
-            "qemu: prot_addr     =3D 0x" TARGET_FMT_plx "\n",
-            real_addr,
-            cmdline_addr,
-            prot_addr);
-#endif
-
     /* highest address for loading the initrd */
     if (protocol >=3D 0x20c &&
-        lduw_p(header+0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
+        lduw_p(header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
         /*
          * Linux has supported initrd up to 4 GB for a very long time (2=
007,
          * long before XLF_CAN_BE_LOADED_ABOVE_4G which was added in 201=
3),
@@ -1177,7 +1173,7 @@ static void x86_load_linux(PCMachineState *pcms,
          */
         initrd_max =3D UINT32_MAX;
     } else if (protocol >=3D 0x203) {
-        initrd_max =3D ldl_p(header+0x22c);
+        initrd_max =3D ldl_p(header + 0x22c);
     } else {
         initrd_max =3D 0x37ffffff;
     }
@@ -1187,20 +1183,21 @@ static void x86_load_linux(PCMachineState *pcms,
     }
=20
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline)+1=
);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) +=
 1);
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
=20
     if (protocol >=3D 0x202) {
-        stl_p(header+0x228, cmdline_addr);
+        stl_p(header + 0x228, cmdline_addr);
     } else {
-        stw_p(header+0x20, 0xA33F);
-        stw_p(header+0x22, cmdline_addr-real_addr);
+        stw_p(header + 0x20, 0xA33F);
+        stw_p(header + 0x22, cmdline_addr - real_addr);
     }
=20
     /* handle vga=3D parameter */
     vmode =3D strstr(kernel_cmdline, "vga=3D");
     if (vmode) {
-        unsigned int video_mode;
+        long video_mode;
+        int ret;
         /* skip "vga=3D" */
         vmode +=3D 4;
         if (!strncmp(vmode, "normal", 6)) {
@@ -1210,22 +1207,29 @@ static void x86_load_linux(PCMachineState *pcms,
         } else if (!strncmp(vmode, "ask", 3)) {
             video_mode =3D 0xfffd;
         } else {
-            video_mode =3D strtol(vmode, NULL, 0);
+            ret =3D qemu_strtol(vmode, NULL, 0, &video_mode);
+            if (ret !=3D 0) {
+                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\n=
",
+                        strerror(-ret));
+                exit(1);
+            }
         }
-        stw_p(header+0x1fa, video_mode);
+        stw_p(header + 0x1fa, video_mode);
     }
=20
     /* loader type */
-    /* High nybble =3D B reserved for QEMU; low nybble is revision numbe=
r.
-       If this code is substantially changed, you may want to consider
-       incrementing the revision. */
+    /*
+     * High nybble =3D B reserved for QEMU; low nybble is revision numbe=
r.
+     * If this code is substantially changed, you may want to consider
+     * incrementing the revision.
+     */
     if (protocol >=3D 0x200) {
         header[0x210] =3D 0xB0;
     }
     /* heap */
     if (protocol >=3D 0x201) {
-        header[0x211] |=3D 0x80;	/* CAN_USE_HEAP */
-        stw_p(header+0x224, cmdline_addr-real_addr-0x200);
+        header[0x211] |=3D 0x80; /* CAN_USE_HEAP */
+        stw_p(header + 0x224, cmdline_addr - real_addr - 0x200);
     }
=20
     /* load initrd */
@@ -1257,14 +1261,14 @@ static void x86_load_linux(PCMachineState *pcms,
             exit(1);
         }
=20
-        initrd_addr =3D (initrd_max-initrd_size) & ~4095;
+        initrd_addr =3D (initrd_max - initrd_size) & ~4095;
=20
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd=
_size);
=20
-        stl_p(header+0x218, initrd_addr);
-        stl_p(header+0x21c, initrd_size);
+        stl_p(header + 0x218, initrd_addr);
+        stl_p(header + 0x21c, initrd_size);
     }
=20
     /* load kernel and setup */
@@ -1272,7 +1276,7 @@ static void x86_load_linux(PCMachineState *pcms,
     if (setup_size =3D=3D 0) {
         setup_size =3D 4;
     }
-    setup_size =3D (setup_size+1)*512;
+    setup_size =3D (setup_size + 1) * 512;
     if (setup_size > kernel_size) {
         fprintf(stderr, "qemu: invalid kernel header\n");
         exit(1);
@@ -1310,7 +1314,7 @@ static void x86_load_linux(PCMachineState *pcms,
         kernel_size =3D setup_data_offset + sizeof(struct setup_data) + =
dtb_size;
         kernel =3D g_realloc(kernel, kernel_size);
=20
-        stq_p(header+0x250, prot_addr + setup_data_offset);
+        stq_p(header + 0x250, prot_addr + setup_data_offset);
=20
         setup_data =3D (struct setup_data *)(kernel + setup_data_offset)=
;
         setup_data->next =3D 0;
@@ -1507,7 +1511,8 @@ void x86_cpus_init(PCMachineState *pcms)
=20
     x86_cpu_set_default_version(pcmc->default_cpu_version);
=20
-    /* Calculates the limit to CPU APIC ID values
+    /*
+     * Calculates the limit to CPU APIC ID values
      *
      * Limit for the APIC ID value, so that all
      * CPU APIC IDs are < pcms->apic_id_limit.
@@ -2709,7 +2714,7 @@ static const CPUArchIdList *x86_possible_cpu_arch_i=
ds(MachineState *ms)
         /*
          * make sure that max_cpus hasn't changed since the first use, i=
.e.
          * -smp hasn't been parsed after it
-        */
+         */
         assert(ms->possible_cpus->len =3D=3D max_cpus);
         return ms->possible_cpus;
     }
@@ -2722,7 +2727,8 @@ static const CPUArchIdList *x86_possible_cpu_arch_i=
ds(MachineState *ms)
=20
         ms->possible_cpus->cpus[i].type =3D ms->cpu_type;
         ms->possible_cpus->cpus[i].vcpus_count =3D 1;
-        ms->possible_cpus->cpus[i].arch_id =3D x86_cpu_apic_id_from_inde=
x(pcms, i);
+        ms->possible_cpus->cpus[i].arch_id =3D
+            x86_cpu_apic_id_from_index(pcms, i);
         x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
                                  pcms->smp_dies, ms->smp.cores,
                                  ms->smp.threads, &topo);
--=20
2.21.0


