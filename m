Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54754DAE22
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:17:04 +0100 (CET)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQiF-0000c3-Qq
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:17:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMB-0001jr-I7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQM9-0007pO-Uc
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7A+Lprt0el/EVkd7gg0Y1BesqxFgYOu+Ahmki/1Z6sU=;
 b=fXrF68h3bk4qWfAaMtTiylQdVUv+KjaSJ6Wtl/EY371o7Fs0L4O4dkeB8LMJMnmN/RiQGJ
 mgDph9iwaC/lFwNS/jqghP8XbO+ss4Y/SqOeka5ndzLFMIrqj663C/cDIYIsecmhxKJeHx
 WERh7jFUO+Ge3+YAg9eeFWJmkhpk8As=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-Xfz0cSF0MuOWUb4p14SOKQ-1; Wed, 16 Mar 2022 05:54:12 -0400
X-MC-Unique: Xfz0cSF0MuOWUb4p14SOKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A2BC80418B
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:54:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0693C215688A;
 Wed, 16 Mar 2022 09:54:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 16/27] util: remove the net/net.h dependency
Date: Wed, 16 Mar 2022 13:54:04 +0400
Message-Id: <20220316095404.2613742-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move qemu_ether_ntoa() which is only needed in net/.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu-common.h |  1 -
 net/announce.c        | 13 +++++++++++++
 util/cutils.c         | 14 --------------
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index a577ca92b1f1..f9b3f85b8124 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -106,7 +106,6 @@ void qemu_hexdump(FILE *fp, const char *prefix,
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


