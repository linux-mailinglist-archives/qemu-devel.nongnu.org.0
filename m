Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041E387FD4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:43:48 +0200 (CEST)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4h1-0001cT-2N
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4au-0001jQ-9j
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4as-00088V-Ke
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2KMRus6wjZmSwZp3NDF0wx5q7DfpOUE+gwTHQ1DOIM=;
 b=c3cU6VJGhkLgljKybVYTAbkFH1v0Hs/r6t9BSZSGGEWJXUkvT62TJOoOivDCSo+hDsTQp0
 8iH7ftgdadb4PQTNkiTJUMvPXrmq149prsd0/R7eim37+TAoUIDLjiAXOft4GmdFQXcvqs
 uZ7CHD4/tagEjw5a8Zyn3bmaCP5CqLc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-PezZF57iM2irKEGWRDb_rQ-1; Tue, 18 May 2021 14:37:24 -0400
X-MC-Unique: PezZF57iM2irKEGWRDb_rQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x3-20020a50ba830000b029038caed0dd2eso6275246ede.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2KMRus6wjZmSwZp3NDF0wx5q7DfpOUE+gwTHQ1DOIM=;
 b=Q5KaKTgvWfIDtqdTpHSZ4w7yIntNv3w+R0pkNfwlTZWjAXQHAVgtvoGMuPbI4WyB0F
 WQa7T2Nm/jXKEKpCRNoU4bbR1keU3j1+5myq8h5kPISHUhA8Y/W04vJ3KZwUVcqjgtGn
 olSmcT5kQ7Y0b/te1CvraOM8UasHRW7hdYN2yNtY8s7gWdpNeb2LQ5R4J8W0vhj89VeV
 aCP5Dufjlr4osurOTAVRUgFGWCKn4vQ/bh6FKaj4B+1Ku9ltXiMjg6H3c7uF3y0eymFe
 pYy8dOADGGAWJeFYVyjyhE662W681joUm2vk2gIq0JKQxrwW2I+0U8AKwgc2Lm/7ZOGj
 xWKw==
X-Gm-Message-State: AOAM532FwWyKPVE+0Y4FKICWvUfgNMfkA//DxQPNS3t4D9IQXQ31SEVG
 6SK+ZTAEkozZMCSD7tczci1plsqaI7nYctFkGbTjga130129cTEf7SghM0ZIvisJx/SEG6BnxZO
 13UzCjut/dHm4O+qFvfCJdFcLMhCbnQOnoS4Q07Sgg8HOdvYSY2awlhJvuYKBPgEh
X-Received: by 2002:a17:906:854e:: with SMTP id
 h14mr1299386ejy.455.1621363043185; 
 Tue, 18 May 2021 11:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH6E+24DKPzpwS7SLv4ZANNH8MZc0+BA9a/2u3GFBr2frPnPRyGx/yU/KhGArKcOTwJ+xhnw==
X-Received: by 2002:a17:906:854e:: with SMTP id
 h14mr1299356ejy.455.1621363042942; 
 Tue, 18 May 2021 11:37:22 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k13sm4869539ejr.1.2021.05.18.11.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/25] exec/memory_ldst_cached: Use correct type size
Date: Tue, 18 May 2021 20:36:35 +0200
Message-Id: <20210518183655.1711377-6-philmd@redhat.com>
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

Use uint16_t for (unsigned) 16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_cached.h.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index c33449d0cd5..d7834f852c4 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -24,7 +24,7 @@
 #define LD_P(size) \
     glue(glue(ld, size), glue(ENDIANNESS, _p))
 
-static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
+static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
@@ -72,7 +72,7 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     glue(glue(st, size), glue(ENDIANNESS, _p))
 
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
     if (likely(cache->ptr)) {
-- 
2.26.3


