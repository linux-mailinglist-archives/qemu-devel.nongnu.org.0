Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1A387FD0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:42:48 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4g3-00074p-17
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4am-0001Pp-Mw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4ag-00080p-Jt
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e61v0D0ynpIm14dcmrVNYVFJK3FGIyUAzwhYR7CEaj8=;
 b=XLImIMwRxCzcgGeMtxy1P72Es1ss6xgvreuOnSFDvTjycF5+S0ijdXb6ueGP6mXOhbWKrM
 dPXmExllhV/5Qs8EwKBx4UwtFILrTZrTzOupNrElDGdm/8x2VYS3ziB2mSwqNZr9WsR9af
 raO1FP0oFvTWCXeWpjcR0W13nzvVCP4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-QC8Ph4hYOHGhujSPIUYVbA-1; Tue, 18 May 2021 14:37:09 -0400
X-MC-Unique: QC8Ph4hYOHGhujSPIUYVbA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ba15-20020a0564021acfb029038d3b33d7ffso3583187edb.23
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e61v0D0ynpIm14dcmrVNYVFJK3FGIyUAzwhYR7CEaj8=;
 b=UrcL4Uh3Y+duUr33tnd41vQ+D+VWOKTyytWBBgMmHb60llKkIViL35d+0C88CL0MiO
 Zwos1pts+QssMvGjblRnB+zOiUjFmE1sA/KkXGrDsQ16qpZdx70EOtRxEpFwclHCPm8H
 eUijERZlzSPa8yJ6Km5q4MmUp7WWYjjD2zVrQuS4E/Nm+zp7hvPltENqi/9SXYuomZ8r
 KsrAhagxzKuSM3rx+O7W1uvlhJ2WmfBElOaFQPIbSqSMw1ly8vmd5ROGq3nMbGJrIcUM
 BTl3UeezGJISWM1iKL4u6IUBvgHlwoMZqcjwsy0s12gFlBXThx/veYMctl2MwhgbFD23
 29GQ==
X-Gm-Message-State: AOAM533SIOuigVwcrK9xKWKnQ0fV3eML7pOQ+loq/6EvJn4GKZWnfsaC
 5wGnBPAvqujNlc66Rt8axizkXlDP72ai0CVHSGa5EHc/waiK3fUBxuEbru441fs88j1nMvY49wt
 kfYptcm9h+fnUlYIJpAZjOuOwA6FEChfJUqgeEty01DlX/Ekob48CcpigglLNKykj
X-Received: by 2002:a17:906:ca50:: with SMTP id
 jx16mr2140832ejb.386.1621363028234; 
 Tue, 18 May 2021 11:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSAVY4MFCxjSzDsWPBfrJLDdLlnHDDGSbr0rhYOknyIGaZYZb8fqnaPuUq7JlPgyOlup+ryA==
X-Received: by 2002:a17:906:ca50:: with SMTP id
 jx16mr2140803ejb.386.1621363028028; 
 Tue, 18 May 2021 11:37:08 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q16sm10540324ejm.12.2021.05.18.11.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/25] exec/memory_ldst_phys: Sort declarations
Date: Tue, 18 May 2021 20:36:32 +0200
Message-Id: <20210518183655.1711377-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ease the file review, sort the declarations by the size of
the access (8, 16, 32). Simple code movement, no logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_phys.h.inc | 78 ++++++++++++++---------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index b9dd53c389d..4033795add7 100644
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
2.26.3


