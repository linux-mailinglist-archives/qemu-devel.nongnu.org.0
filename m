Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58EC5EDB76
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:14:04 +0200 (CEST)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odV0u-0007i8-23
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEP-0008Fe-Fd
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:54905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008J8-Ch
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mofx1-1p27rg1xqz-00p3j1; Wed, 28
 Sep 2022 10:15:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 28/38] linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
Date: Wed, 28 Sep 2022 10:15:07 +0200
Message-Id: <20220928081517.734954-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N0S3xXSTIDeZfn9No4xWPGxR/hrYXhxMVLCj4gRZKt3SQ9FyIh5
 FhLLYp142oW+VLB9PwTgliAaFkZDIF0/BZ2wTNAiF2L5UE/MPUysW/jz0TJrudiaJPuPwtM
 7CnFhG8BUkA1n6LA7aHeDfrJWFowc8yGZdfEY5KzdOZvV3Px/AZK3PAyy9uV4oekEIWiEJZ
 XVBbaPCwyA2RHh3ES57Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3k46NX3P7OM=:2CMm0x4Aorm0x1h6AM9cQS
 lko5GLIW5LmsEdhJ2bEv6sqCXVkoeUVbFG5pUYEQ+L8ITH+hZJsjeGp5YqmwnniROGcu5Zb3F
 7S/xwOnOzcu1Jqet7ZW+Gz0YStAQwiwYwdsdvcF5910/Kom4wO/a3Mk+syDJ6EAmUsNFOIUbo
 46mFgf96FSoIcMEfV89AWKaxeunva4Yx2zOas2iZC1JvGTswPm1W5dLwB1x/saAQmkM+4Qrut
 cky94gtaEitin7g7FHxz93nWgyTYiTdIjSFwdca4rdGKRP4xfCScbaCPBM9m1TAZsZlO7VXL/
 3C2GEhJLPoFS+a+9z5PLS7hgizy0GNYhVgRiu/EgVEUaeTsnuvAjB0YnpNys2QXzNIBIrZObY
 S8yHyfsP5M/wDEjk9kNMpJjTl85enKsw6eRTMb5EdOz3JpXtxBEF8sBL5iU8M6rX07w1Xm0HL
 EXRBDsONEzy/FvNkQ8DTLAUd4SoTLuUBdpY20a1dS4r0mB9BB5joShIccV0CQO5rplTpgV62Q
 5evAj+aW5jt9Yato/3gVVK5MKtY9Qr7KBlHjUCPwpPp/VKbn7dCcHtNMyaM18YSXDKWmsex99
 f9ZNQ9ZhQDC6YmerC3IbNgQBfxj6PETp/P/jmqgjaST3LNqBozKiMyVt8flmTqqQw9q9f1oU1
 s6rDnpgjp8yYX+t8s1P2UwBBPGidX0by1FAIB27MLxrGHsOP2cHVzwxD08UM9YJ195kwDgl+M
 ROoH8aUvqHntNyUXWjM5ZHHjBvWga8qXezkOmgMQEU/nn9b5bzH6kK/U0nibnXOv9r9B3amNn
 eaD5xo8
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

AT_BASE_PLATFORM is a elf auxiliary vector pointing to a string
to pass some architecture information.
See getauxval(3) man-page.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220803103009.95972-2-jiaxun.yang@flygoat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c7e3f1d47c16..581fbc858b48 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1776,6 +1776,10 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #endif /* TARGET_HEXAGON */
 
+#ifndef ELF_BASE_PLATFORM
+#define ELF_BASE_PLATFORM (NULL)
+#endif
+
 #ifndef ELF_PLATFORM
 #define ELF_PLATFORM (NULL)
 #endif
@@ -2220,8 +2224,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     int i;
     abi_ulong u_rand_bytes;
     uint8_t k_rand_bytes[16];
-    abi_ulong u_platform;
-    const char *k_platform;
+    abi_ulong u_platform, u_base_platform;
+    const char *k_platform, *k_base_platform;
     const int n = sizeof(elf_addr_t);
 
     sp = p;
@@ -2243,6 +2247,22 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         }
     }
 
+    u_base_platform = 0;
+    k_base_platform = ELF_BASE_PLATFORM;
+    if (k_base_platform) {
+        size_t len = strlen(k_base_platform) + 1;
+        if (STACK_GROWS_DOWN) {
+            sp -= (len + n - 1) & ~(n - 1);
+            u_base_platform = sp;
+            /* FIXME - check return value of memcpy_to_target() for failure */
+            memcpy_to_target(sp, k_base_platform, len);
+        } else {
+            memcpy_to_target(sp, k_base_platform, len);
+            u_base_platform = sp;
+            sp += len + 1;
+        }
+    }
+
     u_platform = 0;
     k_platform = ELF_PLATFORM;
     if (k_platform) {
@@ -2284,6 +2304,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     }
 
     size = (DLINFO_ITEMS + 1) * 2;
+    if (k_base_platform)
+        size += 2;
     if (k_platform)
         size += 2;
 #ifdef DLINFO_ARCH_ITEMS
@@ -2361,6 +2383,9 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
 #endif
 
+    if (u_base_platform) {
+        NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
+    }
     if (u_platform) {
         NEW_AUX_ENT(AT_PLATFORM, u_platform);
     }
-- 
2.37.3


