Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B06FC25C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHf-0005Hk-LF; Tue, 09 May 2023 05:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHd-0005H3-1V
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHY-0004ve-5A
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHtz1R5xTm3A3Q87YFGwhJKuGLnMN/OlP78AmUeRxv0=;
 b=QXkcfMr0G87Tm0jbfgf0MDN27ftxx9QTkTOAKHlHW4PHpD7bCmKr9ms90f4CA38ELm44dr
 pzSnRjawCN8sMGwoOQLI7wbt2NM8tXUdXuOSpk3ZvDJY6vswv4HQEoTkOuku03z3Tln+X0
 ahMSc6C5u2P5QCH5Hi6exXNc9vR+GVQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-Gs5xagaOMDCU44wHqqj75A-1; Tue, 09 May 2023 05:05:14 -0400
X-MC-Unique: Gs5xagaOMDCU44wHqqj75A-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-965c6f849b9so592806166b.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623113; x=1686215113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHtz1R5xTm3A3Q87YFGwhJKuGLnMN/OlP78AmUeRxv0=;
 b=XXCVCQU/P2YYHLBqIvY35A9Pksy/eqTgiINrk2ARUIuF8x1nfriXS5t13o37qXm6EF
 L5zk4vre8kDBz4blT4OlZ+J0+ypuLW/QYbCMyH+KqhYo0hIWfOllVxOq1ov0oidJv6vI
 xuIzXguWkH1PAawKKXk/ktjdTGN/g79xwnnGoI0A2goTIoBBYPA4KJE8W8+fgrYJCmmn
 GoY7F0nhIZMzkxmrE7YMexWRa8tOrNgIPzOSWYe/UaMMpXDrpX4PpQnDrdHBg4QbKXA2
 AnfKx5sRtxwqcab1s9yXAiR5wjuDT+fFTLycI+gg7Xpd0DbMsoODulqtaFh2c1m+0R6C
 63fA==
X-Gm-Message-State: AC+VfDzZbvoq5jZc/gw9gi6OCvlpPQKnH6e6NsqzIv0bQOrmIPqp3Vfq
 EQ0AAXvMMvKHl5XMDiLLmgV6zvm8nThfKy1miuuGJLre1pY8SqYvyvcxt8edfl3+qkg2O6Y0beN
 EE31a2Uum8JrzQc86Dw2zvoEQ17JlGz7c/h0hQAbpKrliy6dJ7HXA+wHaqIb1S2xjuBPnlq09dD
 A=
X-Received: by 2002:a17:907:eab:b0:969:813c:9868 with SMTP id
 ho43-20020a1709070eab00b00969813c9868mr3466093ejc.18.1683623113073; 
 Tue, 09 May 2023 02:05:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66UsezZVc0KL8byxJz+K+cx/tR9v3F0lnWIkragXPHbaFeBbu+9N49esvv9a450vg3CcOCDA==
X-Received: by 2002:a17:907:eab:b0:969:813c:9868 with SMTP id
 ho43-20020a1709070eab00b00969813c9868mr3466070ejc.18.1683623112770; 
 Tue, 09 May 2023 02:05:12 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ze12-20020a170906ef8c00b009659fa6eeddsm1053353ejb.196.2023.05.09.02.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Babu Moger <babu.moger@amd.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 09/16] target/i386: Add new EPYC CPU versions with updated
 cache_info
Date: Tue,  9 May 2023 11:04:46 +0200
Message-Id: <20230509090453.37884-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Roth <michael.roth@amd.com>

Introduce new EPYC cpu versions: EPYC-v4 and EPYC-Rome-v3.
The only difference vs. older models is an updated cache_info with
the 'complex_indexing' bit unset, since this bit is not currently
defined for AMD and may cause problems should it be used for
something else in the future. Setting this bit will also cause
CPUID validation failures when running SEV-SNP guests.

Signed-off-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20230504205313.225073-3-babu.moger@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 118 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 855d5abc7d17..90a650a836a0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1729,6 +1729,56 @@ static const CPUCaches epyc_cache_info = {
     },
 };
 
+static CPUCaches epyc_v4_cache_info = {
+    .l1d_cache = &(CPUCacheInfo) {
+        .type = DATA_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l1i_cache = &(CPUCacheInfo) {
+        .type = INSTRUCTION_CACHE,
+        .level = 1,
+        .size = 64 * KiB,
+        .line_size = 64,
+        .associativity = 4,
+        .partitions = 1,
+        .sets = 256,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l2_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 2,
+        .size = 512 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 1024,
+        .lines_per_tag = 1,
+    },
+    .l3_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 3,
+        .size = 8 * MiB,
+        .line_size = 64,
+        .associativity = 16,
+        .partitions = 1,
+        .sets = 8192,
+        .lines_per_tag = 1,
+        .self_init = true,
+        .inclusive = true,
+        .complex_indexing = false,
+    },
+};
+
 static const CPUCaches epyc_rome_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
@@ -1779,6 +1829,56 @@ static const CPUCaches epyc_rome_cache_info = {
     },
 };
 
+static const CPUCaches epyc_rome_v3_cache_info = {
+    .l1d_cache = &(CPUCacheInfo) {
+        .type = DATA_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l1i_cache = &(CPUCacheInfo) {
+        .type = INSTRUCTION_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l2_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 2,
+        .size = 512 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 1024,
+        .lines_per_tag = 1,
+    },
+    .l3_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 3,
+        .size = 16 * MiB,
+        .line_size = 64,
+        .associativity = 16,
+        .partitions = 1,
+        .sets = 16384,
+        .lines_per_tag = 1,
+        .self_init = true,
+        .inclusive = true,
+        .complex_indexing = false,
+    },
+};
+
 static const CPUCaches epyc_milan_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
@@ -4113,6 +4213,15 @@ static const X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+                .version = 4,
+                .props = (PropValue[]) {
+                    { "model-id",
+                      "AMD EPYC-v4 Processor" },
+                    { /* end of list */ }
+                },
+                .cache_info = &epyc_v4_cache_info
+            },
             { /* end of list */ }
         }
     },
@@ -4232,6 +4341,15 @@ static const X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+                .version = 3,
+                .props = (PropValue[]) {
+                    { "model-id",
+                      "AMD EPYC-Rome-v3 Processor" },
+                    { /* end of list */ }
+                },
+                .cache_info = &epyc_rome_v3_cache_info
+            },
             { /* end of list */ }
         }
     },
-- 
2.40.1


