Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2A2CB783
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:45:58 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNlt-0005HU-Jn
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCV-00030X-76
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCE-0003gH-PP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FDaGRo3dgsTxEgc/QbfWVuq4n0xSl83P7F90Kuojeyo=;
 b=J7EzbjloGmQ4LA7Fm8X1HLZZ31DzrFxoNphg8weFNj6Da/Q2xSvUbhdu1spJuuXNwbwOgR
 A/A6xW9K152AVnmMkb2VVAww2tp1u7yZ+E/Dqqg5CM9/5JoBUl51h7FhyPPyhY65bL7gyM
 PuW4ilC8b4ZU+65lTu7sFpACIkZDnZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-lhbhHEvvNWCJBDgeNZHSmw-1; Wed, 02 Dec 2020 03:09:04 -0500
X-MC-Unique: lhbhHEvvNWCJBDgeNZHSmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8012C1006C83
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C05660855
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 033/113] sparc: remove bios_name
Date: Wed,  2 Dec 2020 03:07:29 -0500
Message-Id: <20201202080849.4125477-34-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201026143028.3034018-15-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/sparc/leon3.c   | 4 +---
 hw/sparc/sun4m.c   | 2 +-
 hw/sparc64/sun4u.c | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index d40b7891f6..1c50b02f81 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -185,6 +185,7 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
 static void leon3_generic_hw_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
+    const char *bios_name = machine->firmware ?: LEON3_PROM_FILENAME;
     const char *kernel_filename = machine->kernel_filename;
     SPARCCPU *cpu;
     CPUSPARCState   *env;
@@ -259,9 +260,6 @@ static void leon3_generic_hw_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, LEON3_PROM_OFFSET, prom);
 
     /* Load boot prom */
-    if (bios_name == NULL) {
-        bios_name = LEON3_PROM_FILENAME;
-    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
 
     if (filename) {
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 66fecb152a..0f9cd2bf52 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -882,7 +882,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
                         hwdef->max_mem - machine->ram_size);
     }
 
-    prom_init(hwdef->slavio_base, bios_name);
+    prom_init(hwdef->slavio_base, machine->firmware);
 
     slavio_intctl = slavio_intctl_init(hwdef->intctl_base,
                                        hwdef->intctl_base + 0x10000ULL,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 2f8fc670cf..22896b4c62 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -578,7 +578,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     /* set up devices */
     ram_init(0, machine->ram_size);
 
-    prom_init(hwdef->prom_addr, bios_name);
+    prom_init(hwdef->prom_addr, machine->firmware);
 
     /* Init sabre (PCI host bridge) */
     sabre = SABRE(qdev_new(TYPE_SABRE));
-- 
2.26.2



