Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8935F13C876
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:54:39 +0100 (CET)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irl0A-0003rJ-CI
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKi-0000NE-QS
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKh-0000Hb-BE
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:48 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30394
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKh-0000HM-84
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQwNG4v54Bru9Xv3t3mwf5v47KxV7iot1Qj5OUyn+fo=;
 b=G7LeUztbDUDpbzYp75ou4Kr+zjY2Iu/DPz4YEDmB2uiBdkCmJD7X93bm/IaAUZKx7TKQ62
 mGxkaP+3xiYxP8752gbu1EDxsJ0PxsAwID1XRol912q0tA5PrI9J9gsJ9MIeL64kppgLds
 YzN/e5O3Saa8mqP8aGAUIKY5CJeQ9IQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191--ah4mPgONmi5SKjWVt4QgQ-1; Wed, 15 Jan 2020 10:11:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5241D18B456D;
 Wed, 15 Jan 2020 15:11:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF0619757;
 Wed, 15 Jan 2020 15:11:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 53/86] mips:mips_fulong2e: drop RAM size fixup
Date: Wed, 15 Jan 2020 16:07:08 +0100
Message-Id: <1579100861-73692-54-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -ah4mPgONmi5SKjWVt4QgQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: aleksandar.rikalo@rt-rk.com, philmd@redhat.com, aurelien@aurel32.net,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
 * fix format string cousing build failure on 32-bit host
   (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

CC: philmd@redhat.com
CC: amarkovic@wavecomp.com
CC: aurelien@aurel32.net
CC: aleksandar.rikalo@rt-rk.com
---
 hw/mips/mips_fulong2e.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 9eaa6e2..7e7dcd6 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -296,7 +296,6 @@ static void mips_fulong2e_init(MachineState *machine)
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios =3D g_new(MemoryRegion, 1);
-    ram_addr_t ram_size =3D machine->ram_size;
     long bios_size;
     uint8_t *spd_data;
     Error *err =3D NULL;
@@ -315,10 +314,14 @@ static void mips_fulong2e_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, cpu);
=20
     /* TODO: support more than 256M RAM as highmem */
-    ram_size =3D 256 * MiB;
+    if (machine->ram_size !=3D 256 * MiB) {
+        error_report("Invalid RAM size, should be %" PRIu64, 256 * MiB);
+        exit(EXIT_FAILURE);
+    }
=20
     /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram", ram_si=
ze);
+    memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram",
+                                         machine->ram_size);
     memory_region_init_ram(bios, NULL, "fulong2e.bios", BIOS_SIZE,
                            &error_fatal);
     memory_region_set_readonly(bios, true);
@@ -332,7 +335,7 @@ static void mips_fulong2e_init(MachineState *machine)
      */
=20
     if (kernel_filename) {
-        loaderparams.ram_size =3D ram_size;
+        loaderparams.ram_size =3D machine->ram_size;
         loaderparams.kernel_filename =3D kernel_filename;
         loaderparams.kernel_cmdline =3D kernel_cmdline;
         loaderparams.initrd_filename =3D initrd_filename;
@@ -378,7 +381,7 @@ static void mips_fulong2e_init(MachineState *machine)
     }
=20
     /* Populate SPD eeprom data */
-    spd_data =3D spd_data_generate(DDR, ram_size, &err);
+    spd_data =3D spd_data_generate(DDR, machine->ram_size, &err);
     if (err) {
         warn_report_err(err);
     }
--=20
2.7.4


