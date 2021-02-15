Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2E31B9DD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:56:51 +0100 (CET)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdQo-0007W0-TA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFu-00046m-Oj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:35 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFs-0000h7-9V
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:34 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M7JrG-1lEw712H7s-007ilw; Mon, 15 Feb 2021 13:45:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] linux-user: add TARGET_SO_{DOMAIN,PROTOCOL}
Date: Mon, 15 Feb 2021 13:45:16 +0100
Message-Id: <20210215124519.720265-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GwU5AIfnjXwqiQnRUu01L9zbf2sUn+yNm7ljvRd5+3JegSBRu1q
 kZ9fP5PTTi0LaCnGuPdqlMVxjacTTvW3+HxKhaRomC4Cn/7h/kETQhDDBjZP7x2hfomLzZQ
 7ztt6slPiAZaNx6pPfIi4G98utRGSk1vLgWHOp5Okz7jNd5hB4OICiU7PYYAeM1cfqcqw1v
 lANe+k8MqaSwqaiQ098Vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LgA0ZQtHN1M=:66bebjpOYbFqkW3svWk1tw
 Q4NFRcy0T8OHt3z2kINiWER1R/Y9ui8IOAPCm946eWhb0+XvAlDNSl2bG58E4oOVZHGHUgff3
 y0cXcyn+NZakUv+KkA8dJg7przAkhbwOywiFxCCvQI2miuC8525BvvygM9vMIn7RCOxF06on4
 w9J9H/NSm49Qru2EPg3lvDQrwg1h+mu2w8l9XzzyNw3Eicrp4eE/WtGQObKWuX35xCWbj3ZBn
 kAEXS18s3RwRkEF6Q26welt3KF3b9mmtV0LZhWsFaRSErCZlw3v3lLaj9Bu+89nfxGlX3s8Is
 P2HWsiPuEOFVf6/f7kp3SR1MWqqSmF7DM/uV/ux3Shq3YN/B42PNApNwBwJXpDd0zQ9myPEV8
 Ma8whs8jIWBGW5bniOZ8F7cW32XjyZJdH+AxNwSOjOLZjwBOIzxNnS30vJXQOkrz+Ir12fEoZ
 XE5KZclU6w==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

These were defined for other platforms but mistakenly left out of mips
and generic, so this commit adds them to the places missing. Then it
makes them be translated in getsockopt.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210204153925.2030606-1-Jason@zx2c4.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/generic/sockbits.h | 3 +++
 linux-user/mips/sockbits.h    | 2 ++
 linux-user/syscall.c          | 6 ++++++
 3 files changed, 11 insertions(+)

diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
index e44733c601a4..b3b4a8e44c6d 100644
--- a/linux-user/generic/sockbits.h
+++ b/linux-user/generic/sockbits.h
@@ -55,4 +55,7 @@
 #define TARGET_SO_ACCEPTCONN           30
 
 #define TARGET_SO_PEERSEC              31
+
+#define TARGET_SO_PROTOCOL             38
+#define TARGET_SO_DOMAIN               39
 #endif
diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
index 0f022cd598a9..562cad88e2f8 100644
--- a/linux-user/mips/sockbits.h
+++ b/linux-user/mips/sockbits.h
@@ -40,6 +40,8 @@
 #define TARGET_SO_SNDTIMEO     0x1005  /* send timeout */
 #define TARGET_SO_RCVTIMEO     0x1006  /* receive timeout */
 #define TARGET_SO_ACCEPTCONN   0x1009
+#define TARGET_SO_PROTOCOL     0x1028  /* protocol type */
+#define TARGET_SO_DOMAIN       0x1029  /* domain/socket family */
 
 /* linux-specific, might as well be the same as on i386 */
 #define TARGET_SO_NO_CHECK     11
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6fea00869e6b..36b090105522 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2837,6 +2837,12 @@ get_timeout:
         case TARGET_SO_ACCEPTCONN:
             optname = SO_ACCEPTCONN;
             goto int_case;
+        case TARGET_SO_PROTOCOL:
+            optname = SO_PROTOCOL;
+            goto int_case;
+        case TARGET_SO_DOMAIN:
+            optname = SO_DOMAIN;
+            goto int_case;
         default:
             goto int_case;
         }
-- 
2.29.2


