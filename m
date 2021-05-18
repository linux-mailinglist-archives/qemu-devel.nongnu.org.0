Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66525387FCC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:42:04 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4fL-0005Zw-DG
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4al-0001Lf-0M
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4ab-0007xP-LK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KSH1YwMn8zpDyDH9Uq0LVnJ/rgrT/JgFf8hkb+U/HU=;
 b=gFpNFEIt2UlQ4k95yPFwmKNkymtjjy1ZW7FXoEemb2tZJt2E9g1vzgZt1b+Y2JqskDvVqR
 9Lnu15Ed4GE8KcXKwbKjfCygPf3OOp+qGoFOyG7zEwtqB/s4/dgbLduK1dNLHHH1vxBjGp
 Wlb61XQjOPxWJ1kuia3ZIXz1Nb/aUHs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-6v02HrMcMuCSj5__qFTIdQ-1; Tue, 18 May 2021 14:37:04 -0400
X-MC-Unique: 6v02HrMcMuCSj5__qFTIdQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sd18-20020a170906ce32b02903cedf584542so2749108ejb.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KSH1YwMn8zpDyDH9Uq0LVnJ/rgrT/JgFf8hkb+U/HU=;
 b=R+8wlKOWzpBQOaB4zIp3cjLHa5MbUD8YDI2R48DAzgjDrtEfqKNgiB84OUuT02jCMT
 Q6lxZpRHBrRPOVlUZL4XkViEwGfYN0zFaM/bBHP3zP15HmSIKYhBMsrZP750vfU+XE+z
 WAjs2okaYXIjWme8pgsxst2pYc69H0m0LxkjgRxDoBFGHLYmfXWX71ZlFSAOh/qMwWLY
 zNQvaxErQwQZpWbGDmZnlCpYgco0KnSoEytokfJGrrB8iZITYJS6U69++h28UmOVQvNL
 UrIAwA1xK/65fvF/N+XvgDe5RMrdKGZWCeR5L0iU9YSavG3VQGbT7v/eXFBuEEVwGsWQ
 A1pQ==
X-Gm-Message-State: AOAM533XQKQ7nMJSm4wkA1gptCnoDxKjkWXuGlOH1LE65gpk4+rhmhkU
 Y9LN2XvrAAGN8dM8sVoXksLmKLtFJABYlsKH/xdFB+nyAJwoytkSmIR0ciODaXqm2hajq5zhIsh
 SgC3FAzVwShD29qP7KLipRGbgfylBgOrO9E0bQp9l5fKXyuSRLi/4NTHTNAL2eIXO
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr7530826ejr.319.1621363023329; 
 Tue, 18 May 2021 11:37:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeaiQPF3WOuGpQWdo5nC++r5p8PP/2LpnCBv84WvvRoktgzHIqGPOczdkt801UNrz3CHD0LA==
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr7530793ejr.319.1621363022987; 
 Tue, 18 May 2021 11:37:02 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k13sm4869145ejr.1.2021.05.18.11.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/25] exec/memory_ldst_cached: Sort declarations
Date: Tue, 18 May 2021 20:36:31 +0200
Message-Id: <20210518183655.1711377-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 include/exec/memory_ldst_cached.h.inc | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index 7bc8790d346..c33449d0cd5 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -24,6 +24,18 @@
 #define LD_P(size) \
     glue(glue(ld, size), glue(ENDIANNESS, _p))
 
+static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+{
+    assert(addr < cache->len && 2 <= cache->len - addr);
+    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr);
+    if (likely(cache->ptr)) {
+        return LD_P(uw)(cache->ptr + addr);
+    } else {
+        return ADDRESS_SPACE_LD_CACHED_SLOW(uw)(cache, addr, attrs, result);
+    }
+}
+
 static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -48,18 +60,6 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     }
 }
 
-static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    assert(addr < cache->len && 2 <= cache->len - addr);
-    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr);
-    if (likely(cache->ptr)) {
-        return LD_P(uw)(cache->ptr + addr);
-    } else {
-        return ADDRESS_SPACE_LD_CACHED_SLOW(uw)(cache, addr, attrs, result);
-    }
-}
-
 #undef ADDRESS_SPACE_LD_CACHED
 #undef ADDRESS_SPACE_LD_CACHED_SLOW
 #undef LD_P
@@ -71,17 +71,6 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
 #define ST_P(size) \
     glue(glue(st, size), glue(ENDIANNESS, _p))
 
-static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    assert(addr < cache->len && 4 <= cache->len - addr);
-    if (likely(cache->ptr)) {
-        ST_P(l)(cache->ptr + addr, val);
-    } else {
-        ADDRESS_SPACE_ST_CACHED_SLOW(l)(cache, addr, val, attrs, result);
-    }
-}
-
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -93,6 +82,17 @@ static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     }
 }
 
+static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
+    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+{
+    assert(addr < cache->len && 4 <= cache->len - addr);
+    if (likely(cache->ptr)) {
+        ST_P(l)(cache->ptr + addr, val);
+    } else {
+        ADDRESS_SPACE_ST_CACHED_SLOW(l)(cache, addr, val, attrs, result);
+    }
+}
+
 static inline void ADDRESS_SPACE_ST_CACHED(q)(MemoryRegionCache *cache,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
 {
-- 
2.26.3


