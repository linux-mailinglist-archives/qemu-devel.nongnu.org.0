Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5436AAEA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:02:16 +0200 (CEST)
Received: from localhost ([::1]:44736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larVn-0008Jm-B8
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNg-0007wD-6B
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNY-0007Z1-C8
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:51 -0400
Received: by mail-pl1-x631.google.com with SMTP id v20so869694plo.10
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Roi+8AxKJSMluduFFvE6DucqktBjisHW/x7VH6rXtB4=;
 b=VCfdDpK/9KlNXWdA9o9z0lfb/wQaJwBImhnpobIA1f2yDDdwhBgNf32DxY06ojK8Sf
 vvep7+cbaJpimPiWFZH7Ad3LzFzAvV6mQrFNTryWOUoWXI4sLtloeEvfBKt9EmBIMeur
 S8RDGH7kch64o5PPmOeB/ugmBS06EbEe20OeFQoOFJA4lwSJvAqBfJ2boCYM/My/RhN+
 TH37wZQvgOlh8+Z5muTFvI6tjbLAryNwJOMlonp/9tpsuwMC8Y8RfevFNb1SCx2AF/9C
 NA/DED2kTukSmkPKhqzIHKzkprDIPPUoLNIGV5zhRF4VT9OqHnD4AGXJ0hL2FwrJYIha
 lPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Roi+8AxKJSMluduFFvE6DucqktBjisHW/x7VH6rXtB4=;
 b=LU1h/PX5RQoLWvWOht4w7i48sPXtzQJmuJCnwfYOqZTexq5+qHnQaV8Ga4lv+n9cg7
 XjKzQbDbpd74+57cMLPHN+J/OfVEgcK7vWZcM8q7bZFXM2BnhDKKWNHIIjTt+G1e6q0X
 AwnAiNR3/y5IQPU0sH+GWi5c4S/OSp4uLh4W/yvszDFxYvM/fP0MERSgt+qErFZM2O27
 ywehwyVyv5b4A8A0feqlwcn5Zl6YUgiVGYqS7C7GYHdkKTwDOjLPyjdk5rwudMKHcaWy
 ykGvEdSbYbn2ICF+uykI+6I+SEwvjnioWGO7uCv8ZDuj1FYXvrHvqv7tqOnNFG08cwTo
 usEw==
X-Gm-Message-State: AOAM530Af9PvEqJ1HOeiC2tLajpCX8dJvf0oLjWRiXMmkRg/lSUrsAiz
 3onJLkqSz0JosTpXfBO6H/x0FIWT4LUbJg==
X-Google-Smtp-Source: ABdhPJwY3D5GDnUHFMO/xpkzeAHovPgpblk4bEpJWA+yEkoGoUSzp4YvO6yksyEXcmIlMU7iMY2aSw==
X-Received: by 2002:a17:90a:850c:: with SMTP id
 l12mr19530577pjn.224.1619405622678; 
 Sun, 25 Apr 2021 19:53:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/25] linux-user/sparc: Merge sparc64 target_structs.h
Date: Sun, 25 Apr 2021 19:53:18 -0700
Message-Id: <20210426025334.1168495-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_structs.h   | 36 +++++++-----------
 linux-user/sparc64/target_structs.h | 59 +----------------------------
 2 files changed, 15 insertions(+), 80 deletions(-)

diff --git a/linux-user/sparc/target_structs.h b/linux-user/sparc/target_structs.h
index 9953540759..beeace8fb2 100644
--- a/linux-user/sparc/target_structs.h
+++ b/linux-user/sparc/target_structs.h
@@ -26,13 +26,10 @@ struct target_ipc_perm {
     abi_uint cuid;                      /* Creator's user ID.  */
     abi_uint cgid;                      /* Creator's group ID.  */
 #if TARGET_ABI_BITS == 32
-    abi_ushort __pad1;
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad2;
-#else
-    abi_ushort mode;
-    abi_ushort __pad1;
+    abi_ushort __pad0;
 #endif
+    abi_ushort mode;                    /* Read/write permission.  */
+    abi_ushort __pad1;
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
index 4a8ed48df7..cbcbc4602a 100644
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
2.25.1


