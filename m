Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4755FD9B6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:58:49 +0200 (CEST)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixnU-00063L-8K
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixT4-0001Zv-6p
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixT2-00047R-Sp
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPMZJNlEf3JbCTvB/GnlZ412UQC8xpJaTx7rZhN7KYw=;
 b=UJvPd+9ujbum6x8DiIzF5+SmnSas15NQckJYh9CedjWOUwtTW2mNSI0VhyNe5tliEromyw
 /Yz9i2Rg/6TGhXq1H7ap62Cso9pHnAbX2lLruVE721OILS2+rfw3gVzpJD88sEhq6jdQim
 7gKeM9zw9pwT6gNvHYWt3j0tV7WpF+w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-zKUp_-VEOjaJgZvDGftk1w-1; Thu, 13 Oct 2022 08:37:39 -0400
X-MC-Unique: zKUp_-VEOjaJgZvDGftk1w-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp41-20020a1709073e2900b0078e07dbf280so824382ejc.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPMZJNlEf3JbCTvB/GnlZ412UQC8xpJaTx7rZhN7KYw=;
 b=bAIh4ewEfKJbC/bX3ClWpW+9VJdi0f8ziG7+enggRTSLCVQTJJhqgi56bWVlhCH7E9
 uXym3gFvs9lFQUnjKwo2MrKNFvyGTHUHcUjGvyIS5KnlCSWjB+SZpxU7NuMJPQagQ/IC
 gZwHPweEVidPhKWaADE5J8BPA78PkcsIFYtlQQQMG6oNt5y1XxcK2ORbKdxB8g4/wc3s
 Xn78tU9vduoKtaMvzkHpwh54AVNlvY8DvactBfqWx8MMrXn6HNQ+UkLNanjDaj+nXgXl
 PQMMoiViAZFB6LwK7QJ1irKbFI1RHGdX1fuIlLytsXKkjzBwzeRrOdXEFY+Pf1PL1L6M
 LNcQ==
X-Gm-Message-State: ACrzQf2v967yn2XaoP1VQzb1GL8Q15TGCKTZ8YVsIrn9t2LtLLGWxrLG
 jc2rOGm8x897YJ73xLhLgFzdXK0A/B7DvL9PmwgcSUmrcNfgb9B6/XzRE8RorVaBXBgSr4eqSiw
 50dBkrUtAPt3sVBegaHapamKOIbLYBKK1Y25WdpI43k5Duh+fkP6N2Dts1OTy/8pIZfE=
X-Received: by 2002:a05:6402:496:b0:443:a5f5:d3b with SMTP id
 k22-20020a056402049600b00443a5f50d3bmr32788056edv.331.1665664657596; 
 Thu, 13 Oct 2022 05:37:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4PiIw+Li4443xUXUZjv5vbstT1IAuSydqemu/0ksaB8FPW+TJP1Qn98Z+ZPVLPbxSAPmNmHA==
X-Received: by 2002:a05:6402:496:b0:443:a5f5:d3b with SMTP id
 k22-20020a056402049600b00443a5f50d3bmr32788039edv.331.1665664657316; 
 Thu, 13 Oct 2022 05:37:37 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 lb5-20020a170907784500b0078c468bd604sm2981324ejc.57.2022.10.13.05.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 08/24] block: add missing coroutine_fn annotation to
 BlockDriverState callbacks
Date: Thu, 13 Oct 2022 14:36:55 +0200
Message-Id: <20221013123711.620631-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2.h                    | 14 +++++++-------
 include/block/block_int-common.h | 12 +++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 3e7c5e80b6..ad6e7f65bd 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -991,13 +991,13 @@ int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
 bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
-bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
-                                         const char *name,
-                                         uint32_t granularity,
-                                         Error **errp);
-int qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
-                                            const char *name,
-                                            Error **errp);
+bool coroutine_fn qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                      const char *name,
+                                                      uint32_t granularity,
+                                                      Error **errp);
+int coroutine_fn qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                                         const char *name,
+                                                         Error **errp);
 bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs);
 uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
                                                 uint32_t cluster_size);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..16c45d1262 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -731,13 +731,11 @@ struct BlockDriver {
     void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
-    bool (*bdrv_co_can_store_new_dirty_bitmap)(BlockDriverState *bs,
-                                               const char *name,
-                                               uint32_t granularity,
-                                               Error **errp);
-    int (*bdrv_co_remove_persistent_dirty_bitmap)(BlockDriverState *bs,
-                                                  const char *name,
-                                                  Error **errp);
+    bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, uint32_t granularity,
+        Error **errp);
+    int coroutine_fn (*bdrv_co_remove_persistent_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, Error **errp);
 };
 
 static inline bool block_driver_can_compress(BlockDriver *drv)
-- 
2.37.3


