Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498FE2CB751
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:36:47 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNd0-0000pS-Al
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCI-0002pu-VH
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCB-0003eQ-Mm
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJLCl0xz0GsndYswkP7ps4+iWH/R5HlUojS29AhufSQ=;
 b=KVtGzJM8Ea1VoTsPBGihhMXjh3h8Q0o2hUdFAd6M2lxCWdiAK7/WxL72oUucBJ9fFDovNh
 4yVN2FURPI4tEZ9MaiuQozDqOrqDFtQkmzOhF6QqPnwZ8UzgEJNoMYi0QuRihI35T1cfmU
 snsbmYhRjRR2OeBMAdtZeUQ0CYi0V5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-37r4pgE3PzWw33yvEieJMQ-1; Wed, 02 Dec 2020 03:09:01 -0500
X-MC-Unique: 37r4pgE3PzWw33yvEieJMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FE94185E489
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7B35C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 027/113] mips: remove bios_name
Date: Wed,  2 Dec 2020 03:07:23 -0500
Message-Id: <20201202080849.4125477-28-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-9-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mips/fuloong2e.c | 6 +++---
 hw/mips/jazz.c      | 6 +++---
 hw/mips/malta.c     | 6 +++---
 hw/mips/mipssim.c   | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index a9e0c2f8d3..25b679011f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -338,7 +338,7 @@ static void mips_fuloong2e_init(MachineState *machine)
         write_bootloader(env, memory_region_get_ram_ptr(bios), kernel_entry);
     } else {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-                                  bios_name ?: FULOONG_BIOSNAME);
+                                  machine->firmware ?: FULOONG_BIOSNAME);
         if (filename) {
             bios_size = load_image_targphys(filename, 0x1fc00000LL,
                                             BIOS_SIZE);
@@ -348,8 +348,8 @@ static void mips_fuloong2e_init(MachineState *machine)
         }
 
         if ((bios_size < 0 || bios_size > BIOS_SIZE) &&
-            bios_name && !qtest_enabled()) {
-            error_report("Could not load MIPS bios '%s'", bios_name);
+            machine->firmware && !qtest_enabled()) {
+            error_report("Could not load MIPS bios '%s'", machine->firmware);
             exit(1);
         }
     }
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 71448f72ac..aa95c6a3d3 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -218,7 +218,7 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0xfff00000LL, bios2);
 
     /* load the BIOS image. */
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name ?: BIOS_FILENAME);
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware ?: BIOS_FILENAME);
     if (filename) {
         bios_size = load_image_targphys(filename, 0xfff00000LL,
                                         MAGNUM_BIOS_SIZE);
@@ -227,8 +227,8 @@ static void mips_jazz_init(MachineState *machine,
         bios_size = -1;
     }
     if ((bios_size < 0 || bios_size > MAGNUM_BIOS_SIZE)
-        && bios_name && !qtest_enabled()) {
-        error_report("Could not load MIPS bios '%s'", bios_name);
+        && machine->firmware && !qtest_enabled()) {
+        error_report("Could not load MIPS bios '%s'", machine->firmware);
         exit(1);
     }
 
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9d1a3b50b7..ef369945d1 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1333,7 +1333,7 @@ void mips_malta_init(MachineState *machine)
         if (!dinfo) {
             /* Load a BIOS image. */
             filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-                                      bios_name ?: BIOS_FILENAME);
+                                      machine->firmware ?: BIOS_FILENAME);
             if (filename) {
                 bios_size = load_image_targphys(filename, FLASH_ADDRESS,
                                                 BIOS_SIZE);
@@ -1342,8 +1342,8 @@ void mips_malta_init(MachineState *machine)
                 bios_size = -1;
             }
             if ((bios_size < 0 || bios_size > BIOS_SIZE) &&
-                bios_name && !qtest_enabled()) {
-                error_report("Could not load MIPS bios '%s'", bios_name);
+                machine->firmware && !qtest_enabled()) {
+                error_report("Could not load MIPS bios '%s'", machine->firmware);
                 exit(1);
             }
         }
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index aaa62a0f4b..cc9b0934b3 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -177,7 +177,7 @@ mips_mipssim_init(MachineState *machine)
     /* Map the BIOS / boot exception handler. */
     memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
     /* Load a BIOS / boot exception handler image. */
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name ?: BIOS_FILENAME);
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware ?: BIOS_FILENAME);
     if (filename) {
         bios_size = load_image_targphys(filename, 0x1fc00000LL, BIOS_SIZE);
         g_free(filename);
@@ -185,9 +185,9 @@ mips_mipssim_init(MachineState *machine)
         bios_size = -1;
     }
     if ((bios_size < 0 || bios_size > BIOS_SIZE) &&
-        bios_name && !qtest_enabled()) {
+        machine->firmware && !qtest_enabled()) {
         /* Bail out if we have neither a kernel image nor boot vector code. */
-        error_report("Could not load MIPS bios '%s'", bios_name);
+        error_report("Could not load MIPS bios '%s'", machine->firmware);
         exit(1);
     } else {
         /* We have a boot vector start address. */
-- 
2.26.2



