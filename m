Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF64C3564
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:11:21 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJWK-0006Ge-F5
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ18-0001F4-BO
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ16-0003UW-PL
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chVrM/uoMm3YftdNnPXnjTWF2hktiMoGMxHY4FmM7W4=;
 b=XUMX4nJZV6FcZP/cfeExf0ii1AxPxr9M3LwNzgEFPM9lEuKQP0VEykqIL5qbLlvJkZNMkl
 gXEElzNg3t4qYwLqH+n385P8jHl3U4+NSuvd7qXjn7aJp2bReu3zSkaJbxwkJ9WmLRTmtT
 Fh388/WIrxIx8tc5m3VhwqIB0lwRkbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-XncdzWMrNgO_TQgVA3cjvQ-1; Thu, 24 Feb 2022 13:39:02 -0500
X-MC-Unique: XncdzWMrNgO_TQgVA3cjvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88609800425;
 Thu, 24 Feb 2022 18:38:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EBE1106F965;
 Thu, 24 Feb 2022 18:38:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] util: remove the net/net.h dependency
Date: Thu, 24 Feb 2022 22:37:00 +0400
Message-Id: <20220224183701.608720-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-1-marcandre.lureau@redhat.com>
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move qemu_ether_ntoa() which is only needed in net/.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h |  1 -
 net/announce.c        | 13 +++++++++++++
 util/cutils.c         | 14 --------------
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 79977cb3ec43..e702c5325674 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -108,7 +108,6 @@ void qemu_hexdump(FILE *fp, const char *prefix,
  */
 int parse_debug_env(const char *name, int max, int initial);
 
-const char *qemu_ether_ntoa(const MACAddr *mac);
 void page_size_init(void);
 
 /* returns non-zero if dump is in progress, otherwise zero is
diff --git a/net/announce.c b/net/announce.c
index 26f057f5ee47..3b9e2f1f14e8 100644
--- a/net/announce.c
+++ b/net/announce.c
@@ -120,6 +120,19 @@ static int announce_self_create(uint8_t *buf,
     return 60; /* len (FCS will be added by hardware) */
 }
 
+/*
+ * Helper to print ethernet mac address
+ */
+static const char *qemu_ether_ntoa(const MACAddr *mac)
+{
+    static char ret[18];
+
+    snprintf(ret, sizeof(ret), "%02x:%02x:%02x:%02x:%02x:%02x",
+             mac->a[0], mac->a[1], mac->a[2], mac->a[3], mac->a[4], mac->a[5]);
+
+    return ret;
+}
+
 static void qemu_announce_self_iter(NICState *nic, void *opaque)
 {
     AnnounceTimer *timer = opaque;
diff --git a/util/cutils.c b/util/cutils.c
index 53346138c970..0d475ec4cddd 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -27,7 +27,6 @@
 #include <math.h>
 
 #include "qemu-common.h"
-#include "net/net.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
@@ -936,19 +935,6 @@ int parse_debug_env(const char *name, int max, int initial)
     return debug;
 }
 
-/*
- * Helper to print ethernet mac address
- */
-const char *qemu_ether_ntoa(const MACAddr *mac)
-{
-    static char ret[18];
-
-    snprintf(ret, sizeof(ret), "%02x:%02x:%02x:%02x:%02x:%02x",
-             mac->a[0], mac->a[1], mac->a[2], mac->a[3], mac->a[4], mac->a[5]);
-
-    return ret;
-}
-
 /*
  * Return human readable string for size @val.
  * @val can be anything that uint64_t allows (no more than "16 EiB").
-- 
2.35.1.273.ge6ebfd0e8cbb


