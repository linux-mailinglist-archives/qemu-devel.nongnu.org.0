Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4F383C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:42:04 +0200 (CEST)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiBn-0007Gu-9f
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlR-00060S-1B
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:59191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlD-0004OG-VL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:48 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMoKq-1m1TdF3lNE-00Ijpj; Mon, 17
 May 2021 20:14:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/59] linux-user/sparc: Merge sparc64 target_structs.h
Date: Mon, 17 May 2021 20:13:41 +0200
Message-Id: <20210517181424.8093-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:enHmvZuSmU6C3CSJYrj6fn29jI2IGRFx/PKUzekrTvKjy/gJM2J
 s94FzHpZNELNSK6pCG3gFLWEHGtpU8GJHoLMHUlnpSkjsE0Jz3UpfvbIaFL+yMqGAhSt51p
 DozUa1VIIDn07jBZfxJYa4gPbZ+EaJmL4sgFW1enl2vMnQMpbECxcaLIM2ysS9z1oiYSX9g
 0LwJjI/ZKBY8cYzCl59iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ak3lWduQk04=:KMxRgaacdF2Y9RH1h5GQTB
 EYkF0QvnHMoyw5jolcbacU+aet1pR4RW4v/7NxRJTLncFdA8Y+ZsHp4QmnjqkCTaFA3OygdeQ
 wKImvm5OP2AdLldCkVMxHUq8+IHETAS1wmCIqs4ZJh0FqlbbOy50kUC/XO3VIDi37DHnoOaxK
 7t0lUy1ODK3vQKiTsmKCyuGlUDmx0lm1Yl3OEnJiAOiUw/E3Np1MPtMhUlx81Qim8l+RWU9Ir
 Bwt4G29kt+TOsVu7CR4bmfyRorgpiSkCFFXmYP/li735lX1AAcV4nQAlzzn0D5jmGTLRLxd1z
 lPxUEPONqjUgTHc8AK6hUqhglU8Hwg5iN0z8vUvE/Y7Jjclh6w3B/mASakfuHKE6R6D23veOL
 FMgEh6EvjwsYtDVTAQYufuNJRCCwSY0BDbxmWlg4uLPRRBseoTORo0Os9cMmwxnuJVesFcF5D
 co38/hOdoFDUVZTvH3E+gAyrRcD3fDdfNCCOUleGs8SYG9A8+mSx/P7iiqXsiVT8/4+hxGAFu
 5Mtc03JBgPj1tKCWTKygyU=
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


