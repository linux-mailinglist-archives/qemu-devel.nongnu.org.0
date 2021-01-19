Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41A2FBF13
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:34:57 +0100 (CET)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vqC-0001i1-E8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vDE-00029i-48
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:40 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:55179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vD9-00041d-Ro
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M5fdC-1l7wod1WRO-007HB2; Tue, 19 Jan 2021 18:54:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] linux-user: Remove obsolete F_SHLCK and F_EXLCK translation
Date: Tue, 19 Jan 2021 18:54:27 +0100
Message-Id: <20210119175427.2050737-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119175427.2050737-1-laurent@vivier.eu>
References: <20210119175427.2050737-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fumJ+ZWoY5AtkIg385dIrUQEzDcuIlFq9fy6UAfNCw29lpcL5O7
 p9w0lwg0EFiHa7UY0HkSfcPhnY6Q5bwB2q9MGQ26ggTTJTNyIsEs/nDQlEjxGPNkC5oo59R
 C/AMRdodhNgUy6qcu7QFjAX3Qn8TrrF6QdYVOo15yAxohY2oFI2Epi+ohm8bDXDvMwKM2RG
 koJP8X3yPMc3qeWcV/qOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xQ5K6p3YTgU=:0htVeI1VEVhgy4zgVIq/cz
 pdbLw0lc5LtwTKSE4EDgODWavvZ3e+6Uf6sZ+MhgoKRjg6+cgVnZ5qJ78etcGsxWVhuRX6lg1
 ZslQp4xzNriuiQmTbH5wTosrvpkHl+EPD5npwyGDr1ghssOjWv7c2xyCmwlnjP5LaERd1Diqq
 qVqqMV3gSTsXgT4lA8FRoUE7ccS80FpQZSlmSMqRCfxbJQyCV7ne5b9qbQ80Bk59dzydPq2mE
 O4FzAbPd+OKfQ3sfLD/n6x7geq1FR2Ypxoeguauyj3KAmHCny/JOam5RZpnC3GuGwYFZAZejb
 uZnFfKNBbXh0PymnkBJBp6nNiHPxTwafca7RMz1+mtARwQhdoAD3ROOr0i2XIudeSsVHlgVIb
 pNdhYpSgtJ956TFVGV1nO4uZMn6HT7HNrJ7JbIIsLyFsIYTripBMly1i/heShEuF4K2QlXGlc
 9soR3wc7Lg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
index 70c61d15ebf8..1f91aa0ed5e3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6678,8 +6678,6 @@ static int target_to_host_fcntl_cmd(int cmd)
     TRANSTBL_CONVERT(F_RDLCK); \
     TRANSTBL_CONVERT(F_WRLCK); \
     TRANSTBL_CONVERT(F_UNLCK); \
-    TRANSTBL_CONVERT(F_EXLCK); \
-    TRANSTBL_CONVERT(F_SHLCK); \
     }
 
 static int target_to_host_flock(int type)
-- 
2.29.2


