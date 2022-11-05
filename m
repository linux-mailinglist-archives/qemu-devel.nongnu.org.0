Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC761D97F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 11:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orGc8-0004UF-Ck; Sat, 05 Nov 2022 06:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGc5-0004Tb-I4; Sat, 05 Nov 2022 06:41:21 -0400
Received: from smtp.mail.uni-mannheim.de ([2001:7c0:2900:60::869b:6050])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGbq-00036i-3t; Sat, 05 Nov 2022 06:41:21 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 0711C100CFE;
 Sat,  5 Nov 2022 11:25:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
 by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id g6E-RqwaLwB3; Sat,  5 Nov 2022 11:25:19 +0100 (CET)
Received: from bss11.bib.uni-mannheim.de (unknown
 [IPv6:2001:7c0:2900:8024::869b:24a1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id DFDED100C07;
 Sat,  5 Nov 2022 11:25:19 +0100 (CET)
Received: from stweil by bss11.bib.uni-mannheim.de with local (Exim 4.94.2)
 (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGMZ-001pcB-Kh; Sat, 05 Nov 2022 11:25:19 +0100
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 4/4] libvhost-user: Add format attribute to local function
 vu_panic
Date: Sat,  5 Nov 2022 11:24:48 +0100
Message-Id: <20221105102448.436469-5-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221105102448.436469-1-sw@weilnetz.de>
References: <20221105102448.436469-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2001:7c0:2900:60::869b:6050;
 envelope-from=stweil@bss11.bib.uni-mannheim.de; helo=smtp.mail.uni-mannheim.de
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220422070144.1043697-4-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 80f9952e71..d6ee6e7d91 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -45,6 +45,17 @@
 #include "libvhost-user.h"
 
 /* usually provided by GLib */
+#if     __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
+#if !defined(__clang__) && (__GNUC__ == 4 && __GNUC_MINOR__ == 4)
+#define G_GNUC_PRINTF(format_idx, arg_idx) \
+  __attribute__((__format__(gnu_printf, format_idx, arg_idx)))
+#else
+#define G_GNUC_PRINTF(format_idx, arg_idx) \
+  __attribute__((__format__(__printf__, format_idx, arg_idx)))
+#endif
+#else   /* !__GNUC__ */
+#define G_GNUC_PRINTF(format_idx, arg_idx)
+#endif  /* !__GNUC__ */
 #ifndef MIN
 #define MIN(x, y) ({                            \
             typeof(x) _min1 = (x);              \
@@ -151,7 +162,7 @@ vu_request_to_string(unsigned int req)
     }
 }
 
-static void
+static void G_GNUC_PRINTF(2, 3)
 vu_panic(VuDev *dev, const char *msg, ...)
 {
     char *buf = NULL;
-- 
2.30.2


