Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361F51FA06
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:35:25 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0jc-0007Ay-C5
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0eu-0004FJ-RV
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0es-0002lG-DQ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/ZY2DnKQibUIJ1DhsG+2xI2KWffEJgbAJWUvZ3IJVo=;
 b=OTL56X5ypB067Ctz9DJBo9WT/5IyD2qXxcMaPENClg3g05vfhHPgHlBGoZNJo5P43mcmfe
 YE0j1ZNwq8HA6frBVs0jwfrdIMuXdC6qQGYRZj73qYJXaDk1TEx90rIqXhtznKeeGAOi9I
 Q+HLMBInRJDE4o0IhSmINs2Ct7XrubA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-bYx7Y8zsOjaIh0j7bhoRiQ-1; Mon, 09 May 2022 06:30:28 -0400
X-MC-Unique: bYx7Y8zsOjaIh0j7bhoRiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u11-20020a056000038b00b0020c9ea8b64fso4315016wrf.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/ZY2DnKQibUIJ1DhsG+2xI2KWffEJgbAJWUvZ3IJVo=;
 b=HLGSBpcgyt/VqIcYdRTjzzr34XcD+4iHNrEty8GOR63ZkR/12bJh+xz/FgkiPBIBDI
 IZlSGKFCNLql6jncIAV44ZlhyRXtKP3L22vv3Ciyv7lAi3/GCGI643wJzv68e1oToRFx
 ilSc3onIauEBru7e0pSsUb/FRilU+0bt+oCMj2K2za6qiR7/OqgbVzgD9aDLWDfS1+tH
 94sUz/ODPEIQyMBzg0tiRGdsoSpeOEbmpZKpAxmKRBogQT5IQVR3Chn2bXWETkOODeUK
 COPr80hCw9rqDlL2RCb7fibhlcOqT/PJJsg8L6qrbHN7mgeHpKHOeB8mCvNukSjs7SzD
 sy6g==
X-Gm-Message-State: AOAM533VETK/uAlLGS0QZQH9/AavfhdWW6U/9aorJCCdLALqVS5ENVhO
 fVZeAqBkw03/ysoTIxKRJu9y5V4DEKj6YTjq/2P5xxe3EEqhh/zXoM6fUE8W5G1LJjU2PIG6av8
 hXQwbMWbq0eidIUC8vEM59peQ27arRhPh8KyGGDqMxTiQZvnNQz7xEA6r1I+Cxf4zB+Q=
X-Received: by 2002:a5d:67c6:0:b0:20c:3e1c:d333 with SMTP id
 n6-20020a5d67c6000000b0020c3e1cd333mr12764393wrw.66.1652092226773; 
 Mon, 09 May 2022 03:30:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+tg22NB+OAK8iycck+SZq22Uhi68Uf1APS904T/ugMIHFe4xe/s+foVdKGMPxMDS5UpUxBg==
X-Received: by 2002:a5d:67c6:0:b0:20c:3e1c:d333 with SMTP id
 n6-20020a5d67c6000000b0020c3e1cd333mr12764359wrw.66.1652092226310; 
 Mon, 09 May 2022 03:30:26 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003942a244ee6sm11946008wmc.43.2022.05.09.03.30.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/26] qcow2: remove incorrect coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:55 +0200
Message-Id: <20220509103019.215041-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is incorrect because qcow2_mark_clean() calls qcow2_flush_caches().
qcow2_mark_clean() is called from non-coroutine context in
qcow2_inactivate() and qcow2_close().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-refcount.c | 4 ++--
 block/qcow2.h          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index ed0ecfaa89..404d56e258 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1206,7 +1206,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     }
 }
 
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
+int qcow2_write_caches(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -1226,7 +1226,7 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
     return 0;
 }
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
+int qcow2_flush_caches(BlockDriverState *bs)
 {
     int ret = qcow2_write_caches(bs);
     if (ret < 0) {
diff --git a/block/qcow2.h b/block/qcow2.h
index ba436a8d0d..c8d9e8ea79 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -874,8 +874,8 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
 int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     int64_t l1_table_offset, int l1_size, int addend);
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs);
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs);
+int qcow2_flush_caches(BlockDriverState *bs);
+int qcow2_write_caches(BlockDriverState *bs);
 int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                           BdrvCheckMode fix);
 
-- 
2.35.1


