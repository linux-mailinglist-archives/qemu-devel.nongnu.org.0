Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08B48B896
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:22:25 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Nev-000393-3D
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCd-00086U-Im
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:07 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCb-0008I0-6o
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:07 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MAwPf-1nDfng1Nmr-00BH9T; Tue, 11
 Jan 2022 20:53:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] linux-user/arm: Move target_oabi_flock64 out of
 target_structs.h
Date: Tue, 11 Jan 2022 20:52:42 +0100
Message-Id: <20220111195247.1737641-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8ADUk6klj619kaP88H9mi5v3mUrFA5nPGnOoX+DGoCqHBWYln9G
 hOwMCzjWZAyTteX0ysiY/djJCCOOXTpukwbQpjUHCzRBGZjqM9pjCT+H5hjmjlVk1jPZh46
 vkUQTNz9Y+tAvHVOPG/pSIInnhT7jb8N0UuoeHR0TmUSUlscCkInDp40uU/cJaILCqEtHkO
 vjOTYqp8hRLORioD+xcCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LFJMGnzhBMY=:qtJ7ZcqTEYFtkOVuU/O3Mz
 OmhrQDEDsUwwuiiR/FcCP8L4daCE0r5QwYYmEE003TMoWfnkkq4ttJbHEHHkEWTifNLQ48crx
 qyH8KuFabN36NVjwn0SRo2jfiVci2hkcfKRHoDdFQD6sUs5MutdIeEcX911bNMHGAUhZ6FHRd
 vJJ0QOIhox+8ZqJeIiZd51GgHu/VvTyB2XonrvaY3s2oTDL2RvwzLBOEmapw+15JeE2rIO5+a
 zghkCxUB0wLh0TcU+FJw4ZqUxg5ybehMxhZmbS7Fq3BFyA7uDhvujEmLyvaVRI9jMqXDV4alb
 RCtrDcMdQabG7cLR01cmtVQcUWIEf+bLxcyEXu+n5P9XdgWp5GAa9Jaib3Bo574YAQk24rEYb
 6E77579DHWPbZw5sxWVg3gaatXVng324uIkBHPUeQ2oNzJAdPRqwhMqjPtEGmNoJAGSXTIrRl
 TaI73VZdqed+wFZt67+ism7QOlFCjoiY4VrLbQzQAC82d+aerGtdBLJSinIi7c8hMOXtMy++a
 Fg8fLYdPBGMnzhqCzkOFvXxh/86qkLe7E96SzVjhZzALXvMDesxlHlnpxmg9w8Xe5l/XKtHoi
 EQ3Sg47Iyyp62MCb/LIRZEM4C3Czk69St0K5eAQRQqro9g3UmCmz5gseQVJiBVEKHcL2VMA9+
 Q/GsqwVi2GwUaAAtlJVVTA3p02QjOSrbvLDiUmHQYbu1/SkpDwBc7OhAIF1ZpRKAIhOM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Place it next to copy_from/to_user_oabi_flock64, the only users,
inside the existing target-specific ifdef.  This leaves only
generic ipc structs in target_structs.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220107042600.149852-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/target_structs.h | 8 --------
 linux-user/syscall.c            | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux-user/arm/target_structs.h b/linux-user/arm/target_structs.h
index 339b070bf1a5..25bf8dd3a5c9 100644
--- a/linux-user/arm/target_structs.h
+++ b/linux-user/arm/target_structs.h
@@ -48,12 +48,4 @@ struct target_shmid_ds {
     abi_ulong __unused4;
     abi_ulong __unused5;
 };
-
-struct target_oabi_flock64 {
-    abi_short l_type;
-    abi_short l_whence;
-    abi_llong l_start;
-    abi_llong l_len;
-    abi_int   l_pid;
-} QEMU_PACKED;
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ce9d64896cb8..ca6e0b8fb0a1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6927,6 +6927,14 @@ typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
 typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
 
 #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
+struct target_oabi_flock64 {
+    abi_short l_type;
+    abi_short l_whence;
+    abi_llong l_start;
+    abi_llong l_len;
+    abi_int   l_pid;
+} QEMU_PACKED;
+
 static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
                                                    abi_ulong target_flock_addr)
 {
-- 
2.33.1


