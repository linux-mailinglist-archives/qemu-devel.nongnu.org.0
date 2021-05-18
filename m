Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3568387150
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:35:15 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisNu-0006lJ-Sk
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKX-0006z1-3i
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKU-0006xr-9O
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:44 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MbBQU-1lC1Y40VGi-00bZLN; Tue, 18
 May 2021 07:31:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/59] linux-user/sparc: Merge sparc64 target_structs.h
Date: Tue, 18 May 2021 07:30:48 +0200
Message-Id: <20210518053131.87212-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1/5e4r+zAZ+ZyPgD8jXSNjawGo4MFUClDNKmTbWeJtWfxREdX5J
 FwvI5FfodzP3FeRcOyBx1VGwbj1PD16t3hCEkt4t38OGZjZs75bO7/psqNo/yUzaie7D0dR
 KBi4n+IHjFBKBeFG51PSfwK1bVscj/JlGejX25GYRxU12GiSE2/BDNiBGH0+UFfos8OOycv
 1g218OuBorcXsWUfRA3JA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kIuN/lYzzcA=:jolnatv8X+N+Hek47Q/tuA
 bftBktlR13BMT3LrQqY0Mb8A2D+SbRlnpnP9pl62hB/ec65tsuuJTGHCmclxjE8CXNVIZMWxy
 lOEGgS+bTkHhDEh9QXq4dmQiOAuAHf8Y5fmARlRkUcvCCswHhvP38ponUTJBxuCqEmHjHjiQI
 wGHDYlFN24ONP2ZlcqgDf7xvuLuJD7wwMx0iCaf4n/UjGVxVVHOodz3zUumAWPPUPuDNy0B/i
 IY85ElRkJ4ZReBWMgKkU9loN8l85X7ZtuhPFLdff5B0rCU8LoXO+oFYlgmxHyYYU8pnnC3M54
 N771VGM19H4kwCRIEIF00zv9yGxRHZQg7tcEdeobIIqBxrmHEjuIf3CNZymM2SRUXN42WoeZB
 59oIu/pvKZlMpsQ5zonLtMfgLO8FkAQmDYKE1S4ScjuC6jPq3oHTlMycgAuTsGzWT8GHAQJEh
 NdE9uxPtZkvA3UqCF1nYUfUOuXhFh+rdUmjpMNEh9SDpE8hAChBenjbcehl3l14fRZ3GZ4rqZ
 lZzpwbQBKP3sY5finH2phA=
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-10-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/target_structs.h   | 34 +++++++----------
 linux-user/sparc64/target_structs.h | 59 +----------------------------
 2 files changed, 14 insertions(+), 79 deletions(-)

diff --git a/linux-user/sparc/target_structs.h b/linux-user/sparc/target_structs.h
index 995354075950..beeace8fb237 100644
--- a/linux-user/sparc/target_structs.h
+++ b/linux-user/sparc/target_structs.h
@@ -26,13 +26,10 @@ struct target_ipc_perm {
     abi_uint cuid;                      /* Creator's user ID.  */
     abi_uint cgid;                      /* Creator's group ID.  */
 #if TARGET_ABI_BITS == 32
-    abi_ushort __pad1;
+    abi_ushort __pad0;
+#endif
     abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad2;
-#else
-    abi_ushort mode;
     abi_ushort __pad1;
-#endif
     abi_ushort __seq;                   /* Sequence number.  */
     uint64_t __unused1;
     uint64_t __unused2;
@@ -40,22 +37,17 @@ struct target_ipc_perm {
 
 struct target_shmid_ds {
     struct target_ipc_perm shm_perm;    /* operation permission struct */
-#if TARGET_ABI_BITS == 32
-    abi_uint __pad1;
-#endif
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_uint __pad2;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_uint __pad3;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_cpid;                 /* pid of creator */
-    abi_ulong shm_lpid;                 /* pid of last shmop */
-    abi_long shm_nattch;                /* number of current attaches */
+    /*
+     * Note that sparc32 splits these into hi/lo parts.
+     * For simplicity in qemu, always use a 64-bit type.
+     */
+    int64_t  shm_atime;                 /* last attach time */
+    int64_t  shm_dtime;                 /* last detach time */
+    int64_t  shm_ctime;                 /* last change time */
+    abi_ulong shm_segsz;                /* size of segment in bytes */
+    abi_int shm_cpid;                   /* pid of creator */
+    abi_int shm_lpid;                   /* pid of last shmop */
+    abi_ulong shm_nattch;               /* number of current attaches */
     abi_ulong __unused1;
     abi_ulong __unused2;
 };
diff --git a/linux-user/sparc64/target_structs.h b/linux-user/sparc64/target_structs.h
index 4a8ed48df742..cbcbc4602a69 100644
--- a/linux-user/sparc64/target_structs.h
+++ b/linux-user/sparc64/target_structs.h
@@ -1,58 +1 @@
-/*
- * SPARC64 specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef SPARC64_TARGET_STRUCTS_H
-#define SPARC64_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../sparc/target_structs.h"
-- 
2.31.1


