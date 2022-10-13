Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349A5FD9B5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:58:43 +0200 (CEST)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixnO-0005mD-Fd
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTK-0001f5-6f
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTI-00049n-JV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6p9wW5S3qope20ARiwwB1/wCgZkeo4khoHnfaJkJFMM=;
 b=B65xuQJGXGsGgIi4CdZAAiec2LuhLRnVgn23QgzRyQPineO+2oUJnQkd3HjZKM8NANoytC
 Z4v7pPH0urLREBSMIkPvaDfQ8brpWL1mN4W87DzPuBD71olIntm/yJW1hUHRE+e2HOdFWM
 chwoo8RRFexxTYILP3jv/bliauskrss=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-rK8htMnXOrSy_ofwZZzIxQ-1; Thu, 13 Oct 2022 08:37:54 -0400
X-MC-Unique: rK8htMnXOrSy_ofwZZzIxQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f16-20020a0564021e9000b0045beb029117so1407513edf.12
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6p9wW5S3qope20ARiwwB1/wCgZkeo4khoHnfaJkJFMM=;
 b=FEj97Mn432fv+O77pLm/kxTkUvMFU+T8CPUZYE4h+KxKDHRhm41RJDgQUN6eUYCyLR
 EmCV4SDVmeTWiVlwqb4XUgCgE5/icm8O2nMkKPVkEgIqOVteMk7X2udzX5TQ0KgeOuRL
 dDocTpYt30yc7ISHgoj53x8W3c3NTvjjZBo9gzOFEtVNNGVHbmpVe+ZP26X8biINt2AL
 /n3684oktmXqOZDGZWHZSUTS4zMuZ76c+EyDZAvLB272czSdPrO/Nctelxka+3IFOwry
 cSsHqw1bVL1uBy0kqpYpPjw62tgqp3VkOhkccox1ZKyCjwij7s1YQHvuX8hyxovE2F+u
 v1Cg==
X-Gm-Message-State: ACrzQf3F1u0uo2NrlbIaZCLF7BJdn3c7bKcD2xk7SUbmY8EQLKTdndZa
 LD6xXCRsC7DNEBreNbKf/87D8wv6p+LNDi0S+TDdeRp14ISrebJE86G6F9F4MAkhAeeQX5dp+X2
 iH6ScJPhXU8G1XwF8jv5yhlUycFZJyoXCKYXcK2BzR//L2sgw9hPXz0wdyuQZ14Ldc30=
X-Received: by 2002:a17:906:5a48:b0:78e:18a1:32ba with SMTP id
 my8-20020a1709065a4800b0078e18a132bamr1221829ejc.346.1665664672462; 
 Thu, 13 Oct 2022 05:37:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AJiqbazgWSeNk/AiJIZKt0/kB06xsA39nfJmM+K6NhW3c9SRCuJEXKLY07hGomz7/5Yt7RQ==
X-Received: by 2002:a17:906:5a48:b0:78e:18a1:32ba with SMTP id
 my8-20020a1709065a4800b0078e18a132bamr1221808ejc.346.1665664672121; 
 Thu, 13 Oct 2022 05:37:52 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b007803083a36asm1087196ejg.115.2022.10.13.05.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 13/24] vmdk: manually add more coroutine_fn annotations
Date: Thu, 13 Oct 2022 14:37:00 +0200
Message-Id: <20221013123711.620631-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The validity of these was double-checked with Alberto Faria's static analyzer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vmdk.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index f7d8856dfb..c720376aa5 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1404,13 +1404,13 @@ static void vmdk_refresh_limits(BlockDriverState *bs, Error **errp)
  * [@skip_start_sector, @skip_end_sector) is not copied or written, and leave
  * it for call to write user data in the request.
  */
-static int get_whole_cluster(BlockDriverState *bs,
-                             VmdkExtent *extent,
-                             uint64_t cluster_offset,
-                             uint64_t offset,
-                             uint64_t skip_start_bytes,
-                             uint64_t skip_end_bytes,
-                             bool zeroed)
+static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
+                                          VmdkExtent *extent,
+                                          uint64_t cluster_offset,
+                                          uint64_t offset,
+                                          uint64_t skip_start_bytes,
+                                          uint64_t skip_end_bytes,
+                                          bool zeroed)
 {
     int ret = VMDK_OK;
     int64_t cluster_bytes;
@@ -1485,8 +1485,8 @@ exit:
     return ret;
 }
 
-static int vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
-                         uint32_t offset)
+static int coroutine_fn vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
+                                      uint32_t offset)
 {
     offset = cpu_to_le32(offset);
     /* update L2 table */
@@ -1537,14 +1537,14 @@ static int vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
  *          VMDK_UNALLOC if cluster is not mapped and @allocate is false.
  *          VMDK_ERROR if failed.
  */
-static int get_cluster_offset(BlockDriverState *bs,
-                              VmdkExtent *extent,
-                              VmdkMetaData *m_data,
-                              uint64_t offset,
-                              bool allocate,
-                              uint64_t *cluster_offset,
-                              uint64_t skip_start_bytes,
-                              uint64_t skip_end_bytes)
+static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
+                                           VmdkExtent *extent,
+                                           VmdkMetaData *m_data,
+                                           uint64_t offset,
+                                           bool allocate,
+                                           uint64_t *cluster_offset,
+                                           uint64_t skip_start_bytes,
+                                           uint64_t skip_end_bytes)
 {
     unsigned int l1_index, l2_offset, l2_index;
     int min_index, i, j;
-- 
2.37.3


