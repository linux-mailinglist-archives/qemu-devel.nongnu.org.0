Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885231F6F00
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:49:58 +0200 (CEST)
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjU97-0004hF-M6
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAj-0002Jq-PJ
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25685
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAh-0001Tq-M6
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yY9bcvZJxaSJ41nPuQZaf5TvXFjXYQELBp993v3BvbI=;
 b=F4xSkRqgegR9YAoqLU8HKjinG7zP8LG8lDStSYBtcP4v0fHJ/XL/Rsjw5p/aNyXuiiUNo4
 3ZQQzQ7GMn6yRNvS9d1M4+IZg95tQKQ3i1ysML+biJx03UvyO4s9xAmXrznMQsp/wReaoa
 63GOfEJyXuirG82YPjVzdzVpYBlR7Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-EQSOtJP2NYKS-ygPgW6rHw-1; Thu, 11 Jun 2020 15:47:29 -0400
X-MC-Unique: EQSOtJP2NYKS-ygPgW6rHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62AE5107ACF2
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 19:47:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F439707C6
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 19:47:28 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 114/115] stubs: move Xen stubs to accel/
Date: Thu, 11 Jun 2020 15:44:48 -0400
Message-Id: <20200611194449.31468-115-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Keep them close to the other accelerator-dependent stubs, so as to remove
stubs that are not needed by tools.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/stubs/Makefile.objs                 |  1 +
 stubs/xen-hvm.c => accel/stubs/xen-stub.c | 14 +++++++-------
 stubs/Makefile.objs                       |  2 --
 stubs/xen-common.c                        | 13 -------------
 4 files changed, 8 insertions(+), 22 deletions(-)
 rename stubs/xen-hvm.c => accel/stubs/xen-stub.c (74%)
 delete mode 100644 stubs/xen-common.c

diff --git a/accel/stubs/Makefile.objs b/accel/stubs/Makefile.objs
index 3894caf95d..bbd14e71fb 100644
--- a/accel/stubs/Makefile.objs
+++ b/accel/stubs/Makefile.objs
@@ -3,3 +3,4 @@ obj-$(call lnot,$(CONFIG_HVF))  += hvf-stub.o
 obj-$(call lnot,$(CONFIG_WHPX)) += whpx-stub.o
 obj-$(call lnot,$(CONFIG_KVM))  += kvm-stub.o
 obj-$(call lnot,$(CONFIG_TCG))  += tcg-stub.o
+obj-$(call lnot,$(CONFIG_XEN))  += xen-stub.o
diff --git a/stubs/xen-hvm.c b/accel/stubs/xen-stub.c
similarity index 74%
rename from stubs/xen-hvm.c
rename to accel/stubs/xen-stub.c
index 6954a5b696..dcca4e678a 100644
--- a/stubs/xen-hvm.c
+++ b/accel/stubs/xen-stub.c
@@ -1,18 +1,18 @@
 /*
- * Copyright (C) 2010       Citrix Ltd.
+ * Copyright (C) 2014       Citrix Systems UK Ltd.
  *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- *
- * Contributions after 2012-01-13 are licensed under the terms of the
- * GNU GPL, version 2 or (at your option) any later version.
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
  */
 
 #include "qemu/osdep.h"
 #include "hw/xen/xen.h"
-#include "exec/memory.h"
 #include "qapi/qapi-commands-misc.h"
 
+void xenstore_store_pv_console_info(int i, Chardev *chr)
+{
+}
+
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index c1e43ac68f..28e48171d1 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -49,7 +49,5 @@ stub-obj-y += target-get-monitor-def.o
 stub-obj-y += target-monitor-defs.o
 stub-obj-y += uuid.o
 stub-obj-y += vm-stop.o
-stub-obj-y += xen-common.o
-stub-obj-y += xen-hvm.o
 
 endif # CONFIG_SOFTMMU || CONFIG_TOOLS
diff --git a/stubs/xen-common.c b/stubs/xen-common.c
deleted file mode 100644
index f5efcae362..0000000000
--- a/stubs/xen-common.c
+++ /dev/null
@@ -1,13 +0,0 @@
-/*
- * Copyright (C) 2014       Citrix Systems UK Ltd.
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "hw/xen/xen.h"
-
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-}
-- 
2.26.2



