Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B3161842C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwh-0005Hr-5l; Thu, 03 Nov 2022 12:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuT-0000p1-Jo; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuO-00085S-Rq; Thu, 03 Nov 2022 12:17:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MRCFw-1oeTpw0D4e-00N9ju; Thu, 03
 Nov 2022 17:17:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/10] libvhost-user: Add format attribute to local function
 vu_panic
Date: Thu,  3 Nov 2022 17:17:23 +0100
Message-Id: <20221103161727.4116147-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mrZi9Ar49V9DYdY7q+vZdNvimd9kXbpNmAiL1FYMaMxqK4wnDxP
 f9Pa7XcepjHX/7ImXsEV3nFqJklNQJHc9HaUC0SSNOk74DKvtfprntO7caHnHUAoTfxL+No
 icFkLS3eBqLtATAfrlXOPl6OFnuFzNhZNR3vlX4YVuTN+QcsNyag//NjA8NCxhRcNol9hXk
 RUvIOzoUf7Am8jlvXR/6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4qpTGFmweS4=:nteVoG6tyJzcpQ4k4Zz4wZ
 fBXmFs48upxQE0JTZv9k3uPYuy2frg2LPamXUtt7k/zyH8dcxJUN/FT6B2p1Zt77x7PhM0qtU
 agmdX4Fqh7bjk6fZvwOWKkLJi4oZJ3/n6Nvsn+5yi6ohZ8JAysOlVnX9Bm6H7GtdhditcoUGl
 6fn/0GLhe74J+4IlvcgWcES4wrAcoO05KK3ojsXxTbdOIHjhl4SDykvQLwGDCobIaPX0fzWgk
 pal9eBDGuf3S0eg/zVrQVdgFJVhoN+CAHExnBbMRXJ/cePROROMCMDOYZCR0Nk4LVYAVfD2Lf
 MpCUiH2TzfksxtsDspPZFFW1VOPNDizhvHfmzMbsKswG5g8JMvT6F48iZlh/E2YCWH2rRp1Ii
 zxVeJZqGFqGwnKtGV5YmbAq8LHYNcN6KyZPvGdaBGwzWNfsbMXV2LWoIX3ICRRTzUSEBEXy29
 Xgz3XSRaMFxQ7iE5P9UUrQta0CmD3/yBv/mExAxYBzO3vj9g03lg4S3ikYCi4Ug5sXqaWpcu9
 iaBpTkTQ3qDbuGduRerIm1K/ZpwLZIlSVVJu07SrP/fxCNfFK0U3Wwwmxw0kZBqKjEGXZYr/X
 GG9IbQJ8jbzxh1Zr1O4m/yDTnEU1hAfBz+lScmMUaf40SY7G8XNZM+8MkLrLhnr1bBzYqqaF7
 PyC6zkn6yE3KUdP4L8UYpUOzPLUq/FvxAo8XS2zDPWWCaNOXWcTAZfcWk1jgDvjfcTPUbB4QP
 detxOh/d+wV6fvFnrkRByuqBLYh6hcohg2dC9neb3AvXuAD2QgMIDbvsmoz9cEqIeOVMS6/T8
 ND3g2YU
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220422070144.1043697-4-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d67953a1c39c..f7b45b3066c1 100644
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
2.37.3


