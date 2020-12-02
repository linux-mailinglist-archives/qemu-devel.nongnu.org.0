Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48162CB757
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:38:18 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNeT-0003Hp-JM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCK-0002tJ-Dp
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCD-0003fc-Uv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zruKG4VNxRusKyVaFsbFm3Pteb8Orofw2VWnDQqdy1o=;
 b=i+RcXC4UckYHygqB0q+E7ZCx+7gF+HJY+ts+/ptmBtKf9+bChegoKu8xy/nTDomUSwZp79
 VZs7Yu3MJxrhzzvW76VGXx8bfd87yzoAneKRAFbIOMsgND5I4MdTG+oKPwoNFhs39owzWV
 sYaHuPPNsSaGCeG+5aHthH/yuPavGjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-oeAW8xI8NhSGUNp_N5UDTQ-1; Wed, 02 Dec 2020 03:09:02 -0500
X-MC-Unique: oeAW8xI8NhSGUNp_N5UDTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4DF85708C
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02A260855
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 031/113] s390: remove bios_name
Date: Wed,  2 Dec 2020 03:07:27 -0500
Message-Id: <20201202080849.4125477-32-pbonzini@redhat.com>
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

Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201026143028.3034018-13-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/ipl.c             | 8 ++------
 hw/s390x/s390-virtio-ccw.c | 3 ++-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 3d2652d75a..61e8c967d3 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -128,11 +128,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
     if (!ipl->kernel || ipl->enforce_bios) {
         uint64_t fwbase = (MIN(ram_size, 0x80000000U) - 0x200000) & ~0xffffUL;
 
-        if (bios_name == NULL) {
-            bios_name = ipl->firmware;
-        }
-
-        bios_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        bios_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, ipl->firmware);
         if (bios_filename == NULL) {
             error_setg(errp, "could not find stage1 bootloader");
             return;
@@ -154,7 +150,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
         g_free(bios_filename);
 
         if (bios_size == -1) {
-            error_setg(errp, "could not load bootloader '%s'", bios_name);
+            error_setg(errp, "could not load bootloader '%s'", ipl->firmware);
             return;
         }
 
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4e140bbead..538229713a 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -259,7 +259,8 @@ static void ccw_init(MachineState *machine)
     /* get a BUS */
     css_bus = virtual_css_bus_init();
     s390_init_ipl_dev(machine->kernel_filename, machine->kernel_cmdline,
-                      machine->initrd_filename, "s390-ccw.img",
+                      machine->initrd_filename,
+                      machine->firmware ?: "s390-ccw.img",
                       "s390-netboot.img", true);
 
     dev = qdev_new(TYPE_S390_PCI_HOST_BRIDGE);
-- 
2.26.2



