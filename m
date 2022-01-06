Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D448631B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:45:31 +0100 (CET)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QGw-0004uz-P9
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:45:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDV-0007dd-Vd
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:48013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004im-QV
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mzhar-1mAJK21Hpx-00vjDn; Thu, 06
 Jan 2022 11:41:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/27] linux-user: Remove TARGET_SIGSTKSZ
Date: Thu,  6 Jan 2022 11:41:16 +0100
Message-Id: <20220106104137.732883-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sEHu2G6uqFVovwX87LA38sMZn0Pu74NIWYhjQyx/LA3t7sf3q1B
 PCqe9vvZkxEEM7yJjK10P2b0e3W+EOhIefg29lOsHEQYXAs9NyZNR6MX/MsgLsqY317LJBh
 Zy4onkgs4Vg7lZXpUC+/q5EEttitSj4zsuM5V68H0tkYxZQ557GTXfppZ92L54C7/bd1mPS
 714L6JNx6VvtR+Zwifx7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0AYBN3c9wHY=:jpEbHKkdApzSdjUoo/uQQ2
 6LjB+AhUGeKhbIUt5BQph26MBLMjlpeaHjs/ekx5roJxGGQ6jlcpBSHbxKw7LwG5z8kKf2TVZ
 G608D7O7YXsokh0MxeIMANQqlZXjCsP6Vgqdbd4Uhb25/UzYzcNWYqvgsZheic0Oc5XwChXZT
 k2jeAzjDrqfpXmHMXKvvvXSVrCNu/JJqzlWLXecb8O17IWOMZfCb4Oj8L9x+E+M5/P6a6BJLc
 XrlMratN1usHEd6DnabtlrexZqVsxVOo33YaNs7/HlaP4BfueMVJhqA8GOY8nEPPa/dqAwjw4
 ZkoaRXFnr/0BLi52OeSVME4VIaMqvHvnkA1YhUkqoCfkEhpfpSDAdND9ZVq1mMYa7u4Hro1+7
 lQbmfwCV+x5HL2aJXKJkKdrmuVQYU0o2gMuCFQXopBAvaP1A+tlOtQTDuiWJMua1kQ4WgNjdt
 k1ZY57ZFs4do1J78MvmcdOqdqC4NpBrXIzBnIrKLyOHXREja7LEfvN8FFH6H34rKdi0zu8UYB
 IgDCtvHKGxv76s8D7ZidRjNwOfNRw8FALR2vmVJU/nbdkBWOf91OJyrSDsT3iKaLRoEx8QTf9
 +reRvaytkeV5KK1ZQKH/ZNwrQrPchQJ6lu7OE3PKTLLD96yTqtu2CEabQGOAT177PrLOw2qkS
 Iotb7Uw9wqgwl490Iqr1hJn+Z8r0EFtvyXMw1HZBjh7h3TDvxvMT287G4BgFOhWcfcHU=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

TARGET_SIGSTKSZ is not used, we should remove it.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1637893388-10282-4-git-send-email-gaosong@loongson.cn>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_signal.h  | 1 -
 linux-user/generic/signal.h       | 1 -
 linux-user/hppa/target_signal.h   | 1 -
 linux-user/mips/target_signal.h   | 1 -
 linux-user/mips64/target_signal.h | 1 -
 linux-user/sparc/target_signal.h  | 1 -
 6 files changed, 6 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 0b6a39de6576..bbb06e546308 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -62,7 +62,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_SIGINFO       0x00000040
 
 #define TARGET_MINSIGSTKSZ	4096
-#define TARGET_SIGSTKSZ		16384
 
 /* From <asm/gentrap.h>.  */
 #define TARGET_GEN_INTOVF      -1      /* integer overflow */
diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
index ceaf8a876ca0..6fd05b77bb3e 100644
--- a/linux-user/generic/signal.h
+++ b/linux-user/generic/signal.h
@@ -69,7 +69,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SS_DISABLE 2
 
 #define TARGET_MINSIGSTKSZ     2048
-#define TARGET_SIGSTKSZ        8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index d558119ee7bd..af6c2fce589d 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -64,7 +64,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_NOCLDWAIT     0x00000080
 
 #define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ		8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index 780a4ddf29de..fa542c1f4e2e 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -67,7 +67,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_RESTORER      0x04000000      /* Only for O32 */
 
 #define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
 
 #if defined(TARGET_ABI_MIPSO32)
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 275e9b7f9a2a..b05098f7f64e 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_RESETHAND     0x80000000
 
 #define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index e661ddd6ab3c..87757f0c4e76 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
 #define TARGET_ARCH_HAS_KA_RESTORER 1
 
 #define TARGET_MINSIGSTKSZ	4096
-#define TARGET_SIGSTKSZ		16384
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
-- 
2.33.1


