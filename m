Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7077F387FF0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:51:42 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4of-0002KR-Gi
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bu-00031M-9U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bi-00008M-E0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1CQjlEiyTHsQeL1tM+IFll2EqQidBT6ui0IRhG8Brg=;
 b=cOEf+9gNxaSSGmL48CkvaOZLLELZ6BDvT+5zsyV9tJ8JLqUR5mXxBoY2AcbpH+tMW5Vgg+
 2XC7+9eTTrWSr+9RplMY7wYV9JThRkRENXFlrmkArPtMV9q+rlisRFiW14xKo7Ziih2mm9
 /PhTWNjdNxgFwpOnguGwGlD9rLcSraA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-d54KOOnzMxGlEdM6_dea-Q-1; Tue, 18 May 2021 14:38:14 -0400
X-MC-Unique: d54KOOnzMxGlEdM6_dea-Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 cn20-20020a0564020cb4b029038d0b0e183fso6256465edb.22
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1CQjlEiyTHsQeL1tM+IFll2EqQidBT6ui0IRhG8Brg=;
 b=Gdhlf/q3c9YG4WYjmM9Wv5yNSYoFilCFEJ5RznRHk0fvMXlgAvNUanYCgMGn8RPl2f
 3YlG//nQlkUS6c1kOJaK5pCQ/fGz7tEkFEcUFdlRn5JhIs9g9ZcGiNsENDJn6RjKei4R
 QyDtuRpASrD3r8vo8do7HrAGu3LuMH0MlqQ/kAJ4efkP5GJk15nTzWRNa220QggnsHQr
 clydypgneM2IDJfPBXmYUugP5+xkp87lIpS49EIzzR8Lx59oQkDKtx+hRslehyMvEtcJ
 UGT4JU4wv5je4agaEeX2oplbTNjIFaUpGFKi0ZrZ9dBRxySNJvTPk8KC1/+fAeVwGeqx
 9N4Q==
X-Gm-Message-State: AOAM531OfwT46e0YOzt1kB4DDsatE8LGu8r7DZUT7JQLxW4n83QY1eEe
 8Ue/e5sSPZ3vNbKsfCz4rpv9ZzQN5frH9/vcWq6jeBoSnEajj7VDy3OqbJ4BYjU1e03r9FtaWkg
 0Qs2HR96ja6dsqas6N4Za7jzp0TThXgsZ+nBe2Dgd1VRLo+Ho1nphJ/6vABzamDbk
X-Received: by 2002:aa7:d801:: with SMTP id v1mr8717349edq.349.1621363093351; 
 Tue, 18 May 2021 11:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLqxEE8GDlS+G3Ps1Sp0VDZpTa1hPzmdUhyC910X4WOsamv7jbT6X74BtGP6XAufnVT9WRBA==
X-Received: by 2002:aa7:d801:: with SMTP id v1mr8717322edq.349.1621363093145; 
 Tue, 18 May 2021 11:38:13 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id bh3sm10736244ejb.19.2021.05.18.11.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/25] exec/memory: Add methods for aligned pointer access
 (address space)
Date: Tue, 18 May 2021 20:36:45 +0200
Message-Id: <20210518183655.1711377-16-philmd@redhat.com>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h                 | 11 +++++++++++
 include/exec/memory_ldst_cached.h.inc | 20 ++++++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 175d7151a5d..7eeabbceef3 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2315,12 +2315,23 @@ static inline void address_space_stb_cached(MemoryRegionCache *cache,
     }
 }
 
+#define address_space_ldub_cached_aligned   address_space_ldub_cached
+#define address_space_stb_cached_aligned    address_space_stb_cached
+
 #define ENDIANNESS   _le
 #include "exec/memory_ldst_cached.h.inc"
 
 #define ENDIANNESS   _be
 #include "exec/memory_ldst_cached.h.inc"
 
+#define LDST_ALIGNED
+#define ENDIANNESS   _le
+#include "exec/memory_ldst_cached.h.inc"
+
+#define LDST_ALIGNED
+#define ENDIANNESS   _be
+#include "exec/memory_ldst_cached.h.inc"
+
 #define SUFFIX       _cached
 #define ARG1         cache
 #define ARG1_DECL    MemoryRegionCache *cache
diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index d7834f852c4..db45e688c03 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -17,12 +17,21 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#ifdef LDST_ALIGNED
+#define FUNC_SUFFIX _cached_aligned
+#define LDST_SUFFIX _ap
+#undef LDST_ALIGNED
+#else
+#define FUNC_SUFFIX _cached
+#define LDST_SUFFIX _p
+#endif
+
 #define ADDRESS_SPACE_LD_CACHED(size) \
-    glue(glue(address_space_ld, size), glue(ENDIANNESS, _cached))
+    glue(glue(address_space_ld, size), glue(ENDIANNESS, FUNC_SUFFIX))
 #define ADDRESS_SPACE_LD_CACHED_SLOW(size) \
     glue(glue(address_space_ld, size), glue(ENDIANNESS, _cached_slow))
 #define LD_P(size) \
-    glue(glue(ld, size), glue(ENDIANNESS, _p))
+    glue(glue(ld, size), glue(ENDIANNESS, LDST_SUFFIX))
 
 static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
@@ -65,11 +74,11 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
 #undef LD_P
 
 #define ADDRESS_SPACE_ST_CACHED(size) \
-    glue(glue(address_space_st, size), glue(ENDIANNESS, _cached))
+    glue(glue(address_space_st, size), glue(ENDIANNESS, FUNC_SUFFIX))
 #define ADDRESS_SPACE_ST_CACHED_SLOW(size) \
     glue(glue(address_space_st, size), glue(ENDIANNESS, _cached_slow))
 #define ST_P(size) \
-    glue(glue(st, size), glue(ENDIANNESS, _p))
+    glue(glue(st, size), glue(ENDIANNESS, LDST_SUFFIX))
 
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
@@ -108,4 +117,7 @@ static inline void ADDRESS_SPACE_ST_CACHED(q)(MemoryRegionCache *cache,
 #undef ADDRESS_SPACE_ST_CACHED_SLOW
 #undef ST_P
 
+#undef FUNC_SUFFIX
+#undef LDST_SUFFIX
+
 #undef ENDIANNESS
-- 
2.26.3


