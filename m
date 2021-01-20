Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9322FDA30
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:55:57 +0100 (CET)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ja8-0003lM-IJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXq-00020p-3j
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:51615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXj-00030x-V9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:32 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1My3Mv-1lxBBS1OAR-00zWsE; Wed, 20 Jan 2021 20:53:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] linux-user: Remove obsolete F_SHLCK and F_EXLCK translation
Date: Wed, 20 Jan 2021 20:53:17 +0100
Message-Id: <20210120195317.84222-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120195317.84222-1-laurent@vivier.eu>
References: <20210120195317.84222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QAZ4FLYEoPryPKduNQNDvFYt3By7bigGK8Lr6lZcwqO/GkLCVO9
 BQ3IiwAz9PyxagtZtaSep+He93kpi8Wdwxvq0mbVUbZBHNjpyj8cCCX6gXlb+4dDjGFqs6o
 SLoPtpOPsOjr+2/VeaUUWTdjVRS25TOSlLKcUHFc4K8B2DrWYGsWq2cAT2YWqdGToqh86bm
 j/cSbY/EZDRylU7kKM7Fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z6Fxvz+78n0=:G0zg9/qmoMmss1spMS4J8D
 YFWeZ6sVzGb/IOXqdyQgIfSlq1pGBwAlW7uf/nflrJ/Rot890bw1ooD8duORb2tW/SzC1OS2B
 sA6N7KoWAjC/q8eMZ9VT10PimQqmjTalFGXBhzq1KXXK4R6arWRZHtdYf3Bb7THFHoAIHLbBK
 wiWO2exxZn+008CpbpPZgvRaCFM58hyGSIkLHRiZhn4gnizSie67J9fmhf/4cwo8mcm7LuCHe
 FM98ac00IAkPo6lXYfSv3GcBzwHVqLlHFjCYwsU9eOe7c+rDvvWsdMmTNh3N6eQLmD5CYr54O
 KoHlv1mnXxweLeMiCHh0OZ/GYnCw7bZbsvVmVrJCwfVmkPBrAI+MrEX8F58ma7Ab2adXD3hZ8
 qF1DlC4leVh9mWaCNtb4omPXWgozTL4THgL22YYorKMmF+5riW47l64aMW83O
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Forney <mforney@mforney.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Forney <mforney@mforney.org>

These lock types are unsupported by Linux since v2.2[0][1] and
always return EINVAL (except on SPARC up until v2.6, which just
warned).

musl libc does not define these constants, so just remove them from
the translation cases.

[0] https://github.com/mpe/linux-fullhistory/blob/v2.2.0/fs/locks.c#L322-L324
[1] https://github.com/mpe/linux-fullhistory/blob/v2.2.0/fs/locks.c#L429-L445

Signed-off-by: Michael Forney <mforney@mforney.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210114223602.9004-1-mforney@mforney.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_fcntl.h | 2 --
 linux-user/generic/fcntl.h      | 5 -----
 linux-user/syscall.c            | 2 --
 3 files changed, 9 deletions(-)

diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
index 2617e73472b7..e16ed1d4157f 100644
--- a/linux-user/alpha/target_fcntl.h
+++ b/linux-user/alpha/target_fcntl.h
@@ -33,8 +33,6 @@
 #define TARGET_F_RDLCK         1
 #define TARGET_F_WRLCK         2
 #define TARGET_F_UNLCK         8
-#define TARGET_F_EXLCK         16
-#define TARGET_F_SHLCK         32
 
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/generic/fcntl.h b/linux-user/generic/fcntl.h
index c85c5b9fed65..4568d1f42bdd 100644
--- a/linux-user/generic/fcntl.h
+++ b/linux-user/generic/fcntl.h
@@ -119,11 +119,6 @@ struct target_f_owner_ex {
 #define TARGET_F_UNLCK         2
 #endif
 
-#ifndef TARGET_F_EXLCK
-#define TARGET_F_EXLCK         4
-#define TARGET_F_SHLCK         8
-#endif
-
 #ifndef TARGET_HAVE_ARCH_STRUCT_FLOCK
 #ifndef TARGET_ARCH_FLOCK_PAD
 #define TARGET_ARCH_FLOCK_PAD
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5d482dcbefd6..34760779c8ec 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6679,8 +6679,6 @@ static int target_to_host_fcntl_cmd(int cmd)
     TRANSTBL_CONVERT(F_RDLCK); \
     TRANSTBL_CONVERT(F_WRLCK); \
     TRANSTBL_CONVERT(F_UNLCK); \
-    TRANSTBL_CONVERT(F_EXLCK); \
-    TRANSTBL_CONVERT(F_SHLCK); \
     }
 
 static int target_to_host_flock(int type)
-- 
2.29.2


