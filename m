Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77A2CB71F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:29:43 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNWA-0000m0-I8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCI-0002no-04
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCB-0003eW-U0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4V/NA010i6tDizCWGrFCI8ez1i6GA84peZ6hiexDRHo=;
 b=YhQf6dZUayDwMMBh0+MkVLGuuLHsbTW94pKdtfW4Hx1zInUgz76Szo5NtW2hNq7KaS6hDW
 c30UkEUAcqu0+oSLS7aXf8Cl52KBd2m7rTMI5b6T7pspTV9JaFTMRzXlP7GmkMpfZ21BlF
 LZbHv3B4xF5gEPMmD0c7b1m2c3LnWf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-T7NEhU_3O0WHim0qldIW9w-1; Wed, 02 Dec 2020 03:09:01 -0500
X-MC-Unique: T7NEhU_3O0WHim0qldIW9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CE635708A
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A3A05C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 028/113] moxie: remove bios_name
Date: Wed,  2 Dec 2020 03:07:24 -0500
Message-Id: <20201202080849.4125477-29-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-10-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/moxie/moxiesim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index a765e9f6be..d07d504c0d 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -133,9 +133,9 @@ static void moxiesim_init(MachineState *machine)
         loader_params.initrd_filename = initrd_filename;
         load_kernel(cpu, &loader_params);
     }
-    if (bios_name) {
-        if (load_image_targphys(bios_name, FIRMWARE_BASE, FIRMWARE_SIZE) < 0) {
-            error_report("Failed to load firmware '%s'", bios_name);
+    if (machine->firmware) {
+        if (load_image_targphys(machine->firmware, FIRMWARE_BASE, FIRMWARE_SIZE) < 0) {
+            error_report("Failed to load firmware '%s'", machine->firmware);
         }
     }
 
-- 
2.26.2



