Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E172D2DEDE4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 10:08:21 +0100 (CET)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqYDr-00079K-5Q
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 04:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqYCP-0006MS-0K
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqYCM-0004DL-4A
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608368804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hg8d2PDhOVHoGWCzkruxDDDN0Z3PROZY3JZC6uFkyvQ=;
 b=G92N5vrHmPeTDv0BRGTyrLVu67urSykiPT549vR2w/NpLJ7rtaD1iOwD1QSfk4XoKKdsyD
 1ih126OFzt2Z8mt2RrfAZMPK5edPcofxgQ07ftd1gFJTfqdFi+5im1nxjgoyApr5YWkBJ/
 EODFXlOq84OZNxJuu/3tI+JCmxT1Skk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-my_gCrUCOr2LAvibHpBUFA-1; Sat, 19 Dec 2020 04:06:42 -0500
X-MC-Unique: my_gCrUCOr2LAvibHpBUFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C245801817
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 09:06:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA763380;
 Sat, 19 Dec 2020 09:06:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] whpx: move internal definitions to whpx-internal.h
Date: Sat, 19 Dec 2020 04:06:37 -0500
Message-Id: <20201219090637.1700900-3-pbonzini@redhat.com>
In-Reply-To: <20201219090637.1700900-1-pbonzini@redhat.com>
References: <20201219090637.1700900-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only leave the external interface in sysemu/whpx.h.  whpx_apic_in_platform
is moved to a .c file because it needs whpx_state.

Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/whpx.h            | 22 +---------------------
 target/i386/whpx/whpx-all.c      |  4 ++++
 target/i386/whpx/whpx-internal.h | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 9346fd92e9..8ca1c1c4ac 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,28 +15,8 @@
 
 #ifdef CONFIG_WHPX
 
-#include "whp-dispatch.h"
-
-struct whpx_state {
-    uint64_t mem_quota;
-    WHV_PARTITION_HANDLE partition;
-    bool kernel_irqchip_allowed;
-    bool kernel_irqchip_required;
-    bool apic_in_platform;
-};
-
-struct whpx_lapic_state {
-    struct {
-        uint32_t data;
-        uint32_t padding[3];
-    } fields[256];
-};
-
-extern struct whpx_state whpx_global;
 int whpx_enabled(void);
-
-void whpx_apic_get(DeviceState *s);
-#define whpx_apic_in_platform() (whpx_global.apic_in_platform)
+bool whpx_apic_in_platform(void);
 
 #else /* CONFIG_WHPX */
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 12f79e2cd6..985ceba8f8 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1866,6 +1866,10 @@ int whpx_enabled(void)
     return whpx_allowed;
 }
 
+bool whpx_apic_in_platform(void) {
+    return whpx_global.apic_in_platform;
+}
+
 static void whpx_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-internal.h
index e0a9ea1dce..8cfaaef141 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -5,6 +5,24 @@
 #include <WinHvPlatform.h>
 #include <WinHvEmulation.h>
 
+struct whpx_state {
+    uint64_t mem_quota;
+    WHV_PARTITION_HANDLE partition;
+    bool kernel_irqchip_allowed;
+    bool kernel_irqchip_required;
+    bool apic_in_platform;
+};
+
+struct whpx_lapic_state {
+    struct {
+        uint32_t data;
+        uint32_t padding[3];
+    } fields[256];
+};
+
+extern struct whpx_state whpx_global;
+void whpx_apic_get(DeviceState *s);
+
 #define WHV_E_UNKNOWN_CAPABILITY 0x80370300L
 
 #define LIST_WINHVPLATFORM_FUNCTIONS(X) \
-- 
2.26.2


