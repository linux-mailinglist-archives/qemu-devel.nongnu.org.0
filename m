Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3061055BF06
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:20:57 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Wp-00087k-T5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F9-0002Ye-Ul
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:31 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F7-0008JM-29
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:31 -0400
Received: by mail-pl1-x636.google.com with SMTP id k14so10038759plh.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpNeXR+riLFDBFgPlcWD2eatfpq6x/LtbRlobcViT8U=;
 b=eIyynwEYf+zAYlBqq3YD3ntHYjLFB3MwZtlSnuIXz0oKUT+/Qn+27dpEoQ28yiQGc8
 FXh5a4zDXfLw/tsBeBDDfKEdU5Kmx2IRYjzQ9WuZewMB9P7OpKU4Okxkr4Xkxccq8Qy8
 +F/tiWdTee5a2bZnKIFE182nd1IRIqRKhdrfmRT3kQ/AIzsE+wbgLn1D1+dpPeSLi0pj
 K4c83hMaw2z/E7ZoD+jyyUIE1zJ1QYxUtNNFSFcxNjBgOJeUlnABgRqRh1ntagSoO/t2
 s2wE6xhBCSv/bbORUOBFfPWQoecsxPphrb/ZXfdL6njNY01nhmTtIhfiRq22F9X1MrwD
 hKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpNeXR+riLFDBFgPlcWD2eatfpq6x/LtbRlobcViT8U=;
 b=34XLkyhS78Gw/A6Sk/m4purWRBCMJQZrURKH5cHR3lbLTm7HZzSZRd42BwUQ1ZJpBL
 SkHkSqS7K75k8o90o2btCSqbSRzeuGqBY8jT53a9SPWHOhul/kYmFmxONqbdJOTija1u
 O9L9r1vjWHrGwjfvQAkyB07f4rU82UACwPttAsYdEhc9Kz0YVk1jKzhtJHJNjj4vW+pd
 wJEwbBq3/heVSNy+plcfw9oRoO934wX5Hyv5ljGenvicZXS+mjbVHop0yIWaHdttQosY
 +FDXemDCxTY9EFPxHW0o7FbD7lwgEgiIbw/a6MhB/WGMSOZrqxlc3oGvEa4o+U1VqVtx
 HdGw==
X-Gm-Message-State: AJIora8AOK8CDv1RG8OLmuJF34aGxx9h64Lz15W5pkD2pYA483VuDm+K
 9BMzt9OGAFkODk0xW4s9+czucyz5JooUUA==
X-Google-Smtp-Source: AGRyM1v1EAOZRXHjDjrBkPdFwivFl8DJs7HIR9MthNZc7GldTpc28I6nudLOus6043ad9MBcZSD36Q==
X-Received: by 2002:a17:903:249:b0:168:ecca:43e with SMTP id
 j9-20020a170903024900b00168ecca043emr1783181plh.14.1656392067554; 
 Mon, 27 Jun 2022 21:54:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/60] semihosting: Split out guestfd.c
Date: Tue, 28 Jun 2022 10:23:11 +0530
Message-Id: <20220628045403.508716-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In arm-compat-semi.c, we have more advanced treatment of
guest file descriptors than we do in other implementations.
Split out GuestFD and related functions to a new file so
that they can be shared.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/aarch64-linux-user.mak    |   1 +
 configs/targets/aarch64_be-linux-user.mak |   1 +
 configs/targets/arm-linux-user.mak        |   1 +
 configs/targets/armeb-linux-user.mak      |   1 +
 configs/targets/riscv32-linux-user.mak    |   1 +
 configs/targets/riscv64-linux-user.mak    |   1 +
 include/semihosting/guestfd.h             |  83 +++++++++++
 semihosting/arm-compat-semi.c             | 164 +++-------------------
 semihosting/guestfd.c                     | 118 ++++++++++++++++
 semihosting/meson.build                   |   4 +
 10 files changed, 233 insertions(+), 142 deletions(-)
 create mode 100644 include/semihosting/guestfd.h
 create mode 100644 semihosting/guestfd.c

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index d0c603c54e..db552f1839 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -2,4 +2,5 @@ TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index 7794424745..dc78044fb1 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -3,4 +3,5 @@ TARGET_BASE_ARCH=arm
 TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index 3e10d6b15d..7f5d65794c 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -3,4 +3,5 @@ TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
index a249cc2e29..943d0d87bf 100644
--- a/configs/targets/armeb-linux-user.mak
+++ b/configs/targets/armeb-linux-user.mak
@@ -4,4 +4,5 @@ TARGET_SYSTBL=syscall.tbl
 TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/riscv32-linux-user.mak b/configs/targets/riscv32-linux-user.mak
index bd2f1fd497..9761618e67 100644
--- a/configs/targets/riscv32-linux-user.mak
+++ b/configs/targets/riscv32-linux-user.mak
@@ -2,4 +2,5 @@ TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/riscv64-linux-user.mak b/configs/targets/riscv64-linux-user.mak
index 4aca7662ce..cfd1fd382f 100644
--- a/configs/targets/riscv64-linux-user.mak
+++ b/configs/targets/riscv64-linux-user.mak
@@ -2,4 +2,5 @@ TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
new file mode 100644
index 0000000000..ef268abe85
--- /dev/null
+++ b/include/semihosting/guestfd.h
@@ -0,0 +1,83 @@
+/*
+ * Hosted file support for semihosting syscalls.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019 Linaro
+ * Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef SEMIHOSTING_GUESTFD_H
+#define SEMIHOSTING_GUESTFD_H
+
+typedef enum GuestFDType {
+    GuestFDUnused = 0,
+    GuestFDHost = 1,
+    GuestFDGDB = 2,
+    GuestFDStatic = 3,
+} GuestFDType;
+
+/*
+ * Guest file descriptors are integer indexes into an array of
+ * these structures (we will dynamically resize as necessary).
+ */
+typedef struct GuestFD {
+    GuestFDType type;
+    union {
+        int hostfd;
+        struct {
+            const uint8_t *data;
+            size_t len;
+            size_t off;
+        } staticfile;
+    };
+} GuestFD;
+
+/**
+ * alloc_guestfd:
+ *
+ * Allocate an unused GuestFD index.  The associated guestfd index
+ * will still be GuestFDUnused until it is initialized.
+ */
+int alloc_guestfd(void);
+
+/**
+ * dealloc_guestfd:
+ * @guestfd: GuestFD index
+ *
+ * Deallocate a GuestFD index.  The associated GuestFD structure
+ * will be recycled for a subsequent allocation.
+ */
+void dealloc_guestfd(int guestfd);
+
+/**
+ * get_guestfd:
+ * @guestfd: GuestFD index
+ *
+ * Return the GuestFD structure associated with an initialized @guestfd,
+ * or NULL if it has not been allocated, or hasn't been initialized.
+ */
+GuestFD *get_guestfd(int guestfd);
+
+/**
+ * associate_guestfd:
+ * @guestfd: GuestFD index
+ * @hostfd: host file descriptor
+ *
+ * Initialize the GuestFD for @guestfd to GuestFDHost using @hostfd.
+ */
+void associate_guestfd(int guestfd, int hostfd);
+
+/**
+ * staticfile_guestfd:
+ * @guestfd: GuestFD index
+ * @data: data to be read
+ * @len: length of @data
+ *
+ * Initialize the GuestFD for @guestfd to GuestFDStatic.
+ * The @len bytes at @data will be returned to the guest on reads.
+ */
+void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len);
+
+#endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1033e751ef..2fa7f23d8b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -32,12 +32,13 @@
  */
 
 #include "qemu/osdep.h"
-
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
+#include "semihosting/guestfd.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
+
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -123,27 +124,6 @@ static int open_modeflags[12] = {
     O_RDWR | O_CREAT | O_APPEND | O_BINARY
 };
 
-typedef enum GuestFDType {
-    GuestFDUnused = 0,
-    GuestFDHost = 1,
-    GuestFDGDB = 2,
-    GuestFDFeatureFile = 3,
-} GuestFDType;
-
-/*
- * Guest file descriptors are integer indexes into an array of
- * these structures (we will dynamically resize as necessary).
- */
-typedef struct GuestFD {
-    GuestFDType type;
-    union {
-        int hostfd;
-        target_ulong featurefile_offset;
-    };
-} GuestFD;
-
-static GArray *guestfd_array;
-
 #ifndef CONFIG_USER_ONLY
 
 /**
@@ -268,98 +248,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
 
 #endif
 
-/*
- * Allocate a new guest file descriptor and return it; if we
- * couldn't allocate a new fd then return -1.
- * This is a fairly simplistic implementation because we don't
- * expect that most semihosting guest programs will make very
- * heavy use of opening and closing fds.
- */
-static int alloc_guestfd(void)
-{
-    guint i;
-
-    if (!guestfd_array) {
-        /* New entries zero-initialized, i.e. type GuestFDUnused */
-        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
-    }
-
-    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
-    for (i = 1; i < guestfd_array->len; i++) {
-        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
-
-        if (gf->type == GuestFDUnused) {
-            return i;
-        }
-    }
-
-    /* All elements already in use: expand the array */
-    g_array_set_size(guestfd_array, i + 1);
-    return i;
-}
-
-/*
- * Look up the guestfd in the data structure; return NULL
- * for out of bounds, but don't check whether the slot is unused.
- * This is used internally by the other guestfd functions.
- */
-static GuestFD *do_get_guestfd(int guestfd)
-{
-    if (!guestfd_array) {
-        return NULL;
-    }
-
-    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
-        return NULL;
-    }
-
-    return &g_array_index(guestfd_array, GuestFD, guestfd);
-}
-
-/*
- * Associate the specified guest fd (which must have been
- * allocated via alloc_fd() and not previously used) with
- * the specified host/gdb fd.
- */
-static void associate_guestfd(int guestfd, int hostfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    assert(gf);
-    gf->type = use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
-    gf->hostfd = hostfd;
-}
-
-/*
- * Deallocate the specified guest file descriptor. This doesn't
- * close the host fd, it merely undoes the work of alloc_fd().
- */
-static void dealloc_guestfd(int guestfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    assert(gf);
-    gf->type = GuestFDUnused;
-}
-
-/*
- * Given a guest file descriptor, get the associated struct.
- * If the fd is not valid, return NULL. This is the function
- * used by the various semihosting calls to validate a handle
- * from the guest.
- * Note: calling alloc_guestfd() or dealloc_guestfd() will
- * invalidate any GuestFD* obtained by calling this function.
- */
-static GuestFD *get_guestfd(int guestfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    if (!gf || gf->type == GuestFDUnused) {
-        return NULL;
-    }
-    return gf;
-}
-
 /*
  * The semihosting API has no concept of its errno being thread-safe,
  * as the API design predates SMP CPUs and was intended as a simple
@@ -665,22 +553,13 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void init_featurefile_guestfd(int guestfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    assert(gf);
-    gf->type = GuestFDFeatureFile;
-    gf->featurefile_offset = 0;
-}
-
-static uint32_t featurefile_closefn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_closefn(CPUState *cs, GuestFD *gf)
 {
     /* Nothing to do */
     return 0;
 }
 
-static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_writefn(CPUState *cs, GuestFD *gf,
                                     target_ulong buf, uint32_t len)
 {
     /* This fd can never be open for writing */
@@ -689,7 +568,7 @@ static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
     return set_swi_errno(cs, -1);
 }
 
-static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_readfn(CPUState *cs, GuestFD *gf,
                                    target_ulong buf, uint32_t len)
 {
     CPUArchState *env = cs->env_ptr;
@@ -703,11 +582,11 @@ static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
     }
 
     for (i = 0; i < len; i++) {
-        if (gf->featurefile_offset >= sizeof(featurefile_data)) {
+        if (gf->staticfile.off >= gf->staticfile.len) {
             break;
         }
-        s[i] = featurefile_data[gf->featurefile_offset];
-        gf->featurefile_offset++;
+        s[i] = gf->staticfile.data[gf->staticfile.off];
+        gf->staticfile.off++;
     }
 
     unlock_user(s, buf, len);
@@ -716,21 +595,21 @@ static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
     return len - i;
 }
 
-static uint32_t featurefile_isattyfn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     return 0;
 }
 
-static uint32_t featurefile_seekfn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_seekfn(CPUState *cs, GuestFD *gf,
                                    target_ulong offset)
 {
-    gf->featurefile_offset = offset;
+    gf->staticfile.off = offset;
     return 0;
 }
 
-static uint32_t featurefile_flenfn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
-    return sizeof(featurefile_data);
+    return gf->staticfile.len;
 }
 
 typedef struct GuestFDFunctions {
@@ -759,13 +638,13 @@ static const GuestFDFunctions guestfd_fns[] = {
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
-    [GuestFDFeatureFile] = {
-        .closefn = featurefile_closefn,
-        .writefn = featurefile_writefn,
-        .readfn = featurefile_readfn,
-        .isattyfn = featurefile_isattyfn,
-        .seekfn = featurefile_seekfn,
-        .flenfn = featurefile_flenfn,
+    [GuestFDStatic] = {
+        .closefn = staticfile_closefn,
+        .writefn = staticfile_writefn,
+        .readfn = staticfile_readfn,
+        .isattyfn = staticfile_isattyfn,
+        .seekfn = staticfile_seekfn,
+        .flenfn = staticfile_flenfn,
     },
 };
 
@@ -886,7 +765,8 @@ target_ulong do_common_semihosting(CPUState *cs)
                 errno = EACCES;
                 return set_swi_errno(cs, -1);
             }
-            init_featurefile_guestfd(guestfd);
+            staticfile_guestfd(guestfd, featurefile_data,
+                               sizeof(featurefile_data));
             return guestfd;
         }
 
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
new file mode 100644
index 0000000000..b6405f5663
--- /dev/null
+++ b/semihosting/guestfd.c
@@ -0,0 +1,118 @@
+/*
+ * Hosted file support for semihosting syscalls.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019 Linaro
+ * Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/gdbstub.h"
+#include "semihosting/guestfd.h"
+
+static GArray *guestfd_array;
+
+/*
+ * Allocate a new guest file descriptor and return it; if we
+ * couldn't allocate a new fd then return -1.
+ * This is a fairly simplistic implementation because we don't
+ * expect that most semihosting guest programs will make very
+ * heavy use of opening and closing fds.
+ */
+int alloc_guestfd(void)
+{
+    guint i;
+
+    if (!guestfd_array) {
+        /* New entries zero-initialized, i.e. type GuestFDUnused */
+        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
+    }
+
+    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
+    for (i = 1; i < guestfd_array->len; i++) {
+        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
+
+        if (gf->type == GuestFDUnused) {
+            return i;
+        }
+    }
+
+    /* All elements already in use: expand the array */
+    g_array_set_size(guestfd_array, i + 1);
+    return i;
+}
+
+/*
+ * Look up the guestfd in the data structure; return NULL
+ * for out of bounds, but don't check whether the slot is unused.
+ * This is used internally by the other guestfd functions.
+ */
+static GuestFD *do_get_guestfd(int guestfd)
+{
+    if (!guestfd_array) {
+        return NULL;
+    }
+
+    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
+        return NULL;
+    }
+
+    return &g_array_index(guestfd_array, GuestFD, guestfd);
+}
+
+/*
+ * Given a guest file descriptor, get the associated struct.
+ * If the fd is not valid, return NULL. This is the function
+ * used by the various semihosting calls to validate a handle
+ * from the guest.
+ * Note: calling alloc_guestfd() or dealloc_guestfd() will
+ * invalidate any GuestFD* obtained by calling this function.
+ */
+GuestFD *get_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    if (!gf || gf->type == GuestFDUnused) {
+        return NULL;
+    }
+    return gf;
+}
+
+/*
+ * Associate the specified guest fd (which must have been
+ * allocated via alloc_fd() and not previously used) with
+ * the specified host/gdb fd.
+ */
+void associate_guestfd(int guestfd, int hostfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
+    gf->hostfd = hostfd;
+}
+
+void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDStatic;
+    gf->staticfile.data = data;
+    gf->staticfile.len = len;
+    gf->staticfile.off = 0;
+}
+
+/*
+ * Deallocate the specified guest file descriptor. This doesn't
+ * close the host fd, it merely undoes the work of alloc_fd().
+ */
+void dealloc_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDUnused;
+}
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 10b3b99921..d2c1c37bfd 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,3 +1,7 @@
+specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+  'guestfd.c',
+))
+
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
-- 
2.34.1


