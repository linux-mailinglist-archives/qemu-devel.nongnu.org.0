Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE112DEDE5
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 10:08:27 +0100 (CET)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqYDy-0007FC-FJ
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 04:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqYCP-0006Md-Af
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqYCM-0004DJ-J3
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608368804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Bn86rgS2bnYH+W/Es2Qe8V7zT5naA/7VpIKLdZoXLI=;
 b=DxJz4c35yIBvOsDRjPmpEba4s1g5Bajd6YE+8gKJPF54cybTgwEC33OHCT98W+WiHUrPhJ
 AWfJGVvT+Sfb3fO4mt8dkEVbBCf3jsWJMaFp+Tk4VSevhhfzs0nkYWfVPC4r4I2Y+mXUn5
 th0rfzGngPISPK+fI1p20XbT+KhYQI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-zPme71pYOZu8SD9w6z_HfQ-1; Sat, 19 Dec 2020 04:06:42 -0500
X-MC-Unique: zPme71pYOZu8SD9w6z_HfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0571107ACE6
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 09:06:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 589E32BCC3;
 Sat, 19 Dec 2020 09:06:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] whpx: rename whp-dispatch to whpx-internal.h
Date: Sat, 19 Dec 2020 04:06:36 -0500
Message-Id: <20201219090637.1700900-2-pbonzini@redhat.com>
In-Reply-To: <20201219090637.1700900-1-pbonzini@redhat.com>
References: <20201219090637.1700900-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Rename the file in preparation for moving more implementation-internal
definitions to it.  The build is still broken though.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c                          | 5 +----
 target/i386/whpx/whpx-apic.c                         | 2 +-
 target/i386/whpx/whpx-cpus.c                         | 4 +---
 target/i386/whpx/{whp-dispatch.h => whpx-internal.h} | 6 +++---
 4 files changed, 6 insertions(+), 11 deletions(-)
 rename target/i386/whpx/{whp-dispatch.h => whpx-internal.h} (98%)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 3b824fc9d7..12f79e2cd6 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -26,13 +26,10 @@
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
-#include "whp-dispatch.h"
 #include <winerror.h>
 
 #include "whpx-cpus.h"
-
-#include <WinHvPlatform.h>
-#include <WinHvEmulation.h>
+#include "whpx-internal.h"
 
 #define HYPERV_APIC_BUS_FREQUENCY      (200000000ULL)
 
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index b127a3cb8a..1d330bf749 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -18,7 +18,7 @@
 #include "hw/pci/msi.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/whpx.h"
-#include "whp-dispatch.h"
+#include "whpx-internal.h"
 
 static void whpx_put_apic_state(APICCommonState *s,
                                 struct whpx_lapic_state *kapic)
diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
index d9bd5a2d36..f7e69881a3 100644
--- a/target/i386/whpx/whpx-cpus.c
+++ b/target/i386/whpx/whpx-cpus.c
@@ -15,11 +15,9 @@
 #include "qemu/guest-random.h"
 
 #include "sysemu/whpx.h"
+#include "whpx-internal.h"
 #include "whpx-cpus.h"
 
-#include <WinHvPlatform.h>
-#include <WinHvEmulation.h>
-
 static void *whpx_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
diff --git a/target/i386/whpx/whp-dispatch.h b/target/i386/whpx/whpx-internal.h
similarity index 98%
rename from target/i386/whpx/whp-dispatch.h
rename to target/i386/whpx/whpx-internal.h
index cef5d848bd..e0a9ea1dce 100644
--- a/target/i386/whpx/whp-dispatch.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -1,5 +1,5 @@
-#ifndef WHP_DISPATCH_H
-#define WHP_DISPATCH_H
+#ifndef WHP_INTERNAL_H
+#define WHP_INTERNAL_H
 
 #include <windows.h>
 #include <WinHvPlatform.h>
@@ -72,4 +72,4 @@ typedef enum WHPFunctionList {
     WINHV_PLATFORM_FNS_SUPPLEMENTAL
 } WHPFunctionList;
 
-#endif /* WHP_DISPATCH_H */
+#endif /* WHP_INTERNAL_H */
-- 
2.26.2



