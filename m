Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39506392365
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:52:27 +0200 (CEST)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3K6-0003gb-7m
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0005bh-VC
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:27 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F7-0004Rt-26
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:27 -0400
Received: by mail-pg1-x536.google.com with SMTP id i5so2333356pgm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AL54ucl9rKZtOi9n7cxYrp3sXcKmYEJsp/xosYfzNek=;
 b=tsmhNVVT5upgP/qFpjXyY6gr7iumkFodLHoPiL/isYWN++DI90zo4FNYaSRe1hx7IL
 n9PnE4xKKrQ6Rw+B/YKi5f8VwCizwGf4tXeLaJ8Anz24/jkrlzwTrVSIh4/cfw3ptbAe
 sdzDOEwl5drqxjKhpcSYF58nuPgxnwe/d+k5Lg6GlQ7i9/+CAH/bQV4Q1+b31tz4K15k
 td9/GHR0wBji+/uJ8MHrRv2RXkj8evddZLgskUKfOTpoWFXQQzenDt//MGsmPOfsUaLa
 bPq3d6lMfN49/e9GueljGrcdY0NV+jqNE2V9yqXi5k4efPtA9XyEU4MG9N6FcTt/BdZN
 i6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AL54ucl9rKZtOi9n7cxYrp3sXcKmYEJsp/xosYfzNek=;
 b=kr4Cr0h5xFeGEArNvdrSkxtfv1aP6nNn/YH+hERoNXo4su0B6AfHjhaO7JftnFcNUd
 vPAfglRKD5z3GSYpfh4zKQEx07mbD58l2roD2R1/9ZNXVWcdk2YKGdl2qNHxRIXu+ZqX
 Xx+tLy3lmjIfBwaq9jDgiublcK+l0QZPb3m6RBvlMyOuRECifg15AgujhvqC8OoPjgwz
 VMcwgJ3nAE4WWSLvmKnQSrXHT0BwWcuNWjc18PeW9n0TbHUkICC3BbiitRPlSx7bQneZ
 4g+RnhAJPLxPSkPj5mVIQDekkUHgDaTKoUA7EHO7HN3kBjYp2lbE+KankG+6aHsGLwzz
 OKyQ==
X-Gm-Message-State: AOAM531l/lq73ZEch5rv0RazdauykUVMUwG91mQxILY3/HGjF+SxdpVO
 wW3t+ikW4Isgj9Q425YvP26h/Ehog5GcLw==
X-Google-Smtp-Source: ABdhPJwfWbrPm66gIA3ZoOxtnEZJ1+x+kPucyZFosVHcexu5veJnSg2H5IaiMftWQdZGsVP9vM9nmQ==
X-Received: by 2002:a63:1054:: with SMTP id 20mr1020907pgq.120.1622072835113; 
 Wed, 26 May 2021 16:47:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/31] exec/memory_ldst_phys: Sort declarations
Date: Wed, 26 May 2021 16:46:41 -0700
Message-Id: <20210526234710.125396-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To ease the file review, sort the declarations by the size of
the access (8, 16, 32). Simple code movement, no logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518183655.1711377-3-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory_ldst_phys.h.inc | 78 ++++++++++++++---------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index b9dd53c389..4033795add 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -20,6 +20,12 @@
  */
 
 #ifdef TARGET_ENDIANNESS
+static inline uint32_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+{
+    return glue(address_space_lduw, SUFFIX)(ARG1, addr,
+                                            MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 static inline uint32_t glue(ldl_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldl, SUFFIX)(ARG1, addr,
@@ -32,10 +38,10 @@ static inline uint64_t glue(ldq_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                            MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint32_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
 {
-    return glue(address_space_lduw, SUFFIX)(ARG1, addr,
-                                            MEMTXATTRS_UNSPECIFIED, NULL);
+    glue(address_space_stw, SUFFIX)(ARG1, addr, val,
+                                    MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static inline void glue(stl_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
@@ -44,18 +50,30 @@ static inline void glue(stl_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
-{
-    glue(address_space_stw, SUFFIX)(ARG1, addr, val,
-                                    MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 static inline void glue(stq_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
 {
     glue(address_space_stq, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 #else
+static inline uint32_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+{
+    return glue(address_space_ldub, SUFFIX)(ARG1, addr,
+                                            MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static inline uint32_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+{
+    return glue(address_space_lduw_le, SUFFIX)(ARG1, addr,
+                                               MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static inline uint32_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+{
+    return glue(address_space_lduw_be, SUFFIX)(ARG1, addr,
+                                               MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 static inline uint32_t glue(ldl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldl_le, SUFFIX)(ARG1, addr,
@@ -80,36 +98,6 @@ static inline uint64_t glue(ldq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                               MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint32_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
-{
-    return glue(address_space_ldub, SUFFIX)(ARG1, addr,
-                                            MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-static inline uint32_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
-{
-    return glue(address_space_lduw_le, SUFFIX)(ARG1, addr,
-                                               MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-static inline uint32_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
-{
-    return glue(address_space_lduw_be, SUFFIX)(ARG1, addr,
-                                               MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-static inline void glue(stl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
-{
-    glue(address_space_stl_le, SUFFIX)(ARG1, addr, val,
-                                       MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-static inline void glue(stl_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
-{
-    glue(address_space_stl_be, SUFFIX)(ARG1, addr, val,
-                                       MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
 {
     glue(address_space_stb, SUFFIX)(ARG1, addr, val,
@@ -128,6 +116,18 @@ static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t va
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+static inline void glue(stl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+{
+    glue(address_space_stl_le, SUFFIX)(ARG1, addr, val,
+                                       MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static inline void glue(stl_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+{
+    glue(address_space_stl_be, SUFFIX)(ARG1, addr, val,
+                                       MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 static inline void glue(stq_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
 {
     glue(address_space_stq_le, SUFFIX)(ARG1, addr, val,
-- 
2.25.1


