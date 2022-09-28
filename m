Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FB5EE6CC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:46:24 +0200 (CEST)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddwm-0006kc-1O
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf6-0000im-M8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf4-0006Yc-TX
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:08 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MC2k1-1oWAUH0AKj-00CT7n; Wed, 28
 Sep 2022 22:28:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 28/37] linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
Date: Wed, 28 Sep 2022 22:27:28 +0200
Message-Id: <20220928202737.793171-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/OO4VLwqwiO6rIelA5yLyGkMsge4uIk39rEbm/fg+RnW5TJt6ZQ
 qsNEkiNarMRzQcnLdHEZ+rZeX6XBLjysSbyD1nHMPGPDD6d6KTLwvHd40bdUj+IlfG5xYdk
 oW+TlEzYkpT5GaKsf0M4g582Kh+lGEQNnVnynG/83RwJ08QiXdOAiCqhf1r5KN/ztwnGohe
 RdI6LSXHfvqKQSHG2X4wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:00sLbt8MqHA=:wNpFdlkTQkSUTZ9AbsXmiL
 bioJYG9u1B+pmICMEJEzN+IBbbMURsnS13Dvoms5QaiSm+LWEGh4aica5xUBTCH81ZaHYaKKs
 CzBWIeMv5izkPP0LYNHRi0YkNXm09ygYqCYVEwAIif9qILUbai92/yYUbEsAhFvA0Fkd1jT2P
 XSFVQ2Ikm1l1k5sBd0+AJ0oguZR+JOrmR8wHl+Z9PTo24KOpdBCVg7E4mA46eqnWm0GCDL6hX
 o9emNyqlt5QY3aX/ualS+PUovWRLzAd6NmfoAKSAq7GXUGCZReexCCQ1QUXltE3ABIremxVhL
 l9rZhV8gNAE/bjvzO8ZJGVF3zSjHZOcJ7pR2URGHrM/eP8ogigm/6EJKieD5RuZ3lriYsDCbq
 yKZ1Hz0Ixncfg+mkOqh9/LsSW7fJyeC5fC84aWhXbjsns0wyRqn2zN/T4grriuD29WHpyUB88
 TiDkJNX2BOrhIe0ggyT78ojrC2DeaJn959PDpOrPcNbUkHOlk2ooBvsSNiiWAMp4DmCgBbaJd
 RARkAyx2VKBFAmpw7V67ZOVNktmGeUjP+TaWBxzLIGqXl1PVikV4nZoUMR8AHbl3DMnIkqfcB
 itZ4BVBKT7UW6/B1dIqCO4/YpO6LTi9o6g29GW2ySMYPoiNSvF7N5AWm4QaLHnahMoBYFrfh/
 rv1hPINfLAQYZ04dnanZN9M6lBK9Cbc8zlaMNgORDI7+/3l0XU2DRGFVFqmb5kW/Douw7Jvlv
 fpOATiq0e58IQRxqDpONw1h+GbnnW9u8PEw+sUFYP5QwQ6vv2HsBdqjwG2it4wba+zUFRO1Sl
 JZA4Nqh
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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


