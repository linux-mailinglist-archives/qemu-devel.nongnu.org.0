Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79719298F7B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 15:37:11 +0100 (CET)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX3cU-0001Hu-HY
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 10:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX3WC-0004AV-RT
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX3WB-0007zq-0G
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603722637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX0vJgS3VGlLfH377Qx81RfTnQlPwLnObP7fQPjkUnM=;
 b=E+VomYOjQMetX5PPSUpERWl/vPfy3/oFrJv0+CRHKBSNfKjVjT2Dmapf8CojkrkVJXS45K
 2ujQQAzWnADG3lji6inGkaBISvCVwnOhAOPMWsxuIzdm/uiqoty3ug3zDa4EVicBmwEmqd
 cM9C02Ff85EY18XP6W1UImbYtxs0rD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-vlXfVk-nOtmFX5YZEkb4wA-1; Mon, 26 Oct 2020 10:30:36 -0400
X-MC-Unique: vlXfVk-nOtmFX5YZEkb4wA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2416318C9F4C
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 14:30:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C600C5C1C5;
 Mon, 26 Oct 2020 14:30:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] s390: remove bios_name
Date: Mon, 26 Oct 2020 10:30:25 -0400
Message-Id: <20201026143028.3034018-13-pbonzini@redhat.com>
In-Reply-To: <20201026143028.3034018-1-pbonzini@redhat.com>
References: <20201026143028.3034018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Thomas Huth <thuth@redhat.com>
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
index e52182f946..a521eba673 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -258,7 +258,8 @@ static void ccw_init(MachineState *machine)
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



