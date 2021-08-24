Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C943F6013
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:20:20 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXHn-00028W-2h
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXA8-0005Wc-Fx
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXA6-0005Vn-QP
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hf6aQWPomJbErfm8jcxJmMDuWpHIgM/AzBOqCZSkpgc=;
 b=ahH9oTLbEGVuFaC5kXwk8jU70soC0QxCbP5aFNZGqXaCFF8ie47v6D0d8qHlUKYqfgeYcy
 tk95+5YRTXoQxKbOSwAYKO3E6IlMSWpJJSFe2xVc6ieHaTAsV6SkWQVzk9wxWRRWEnOVjd
 K53OemLaRkdSz1XH8ezkbMN7noXPkJc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-K4JQXDmlOOu09EEZ-YZBqQ-1; Tue, 24 Aug 2021 10:12:21 -0400
X-MC-Unique: K4JQXDmlOOu09EEZ-YZBqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so1312320wmd.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hf6aQWPomJbErfm8jcxJmMDuWpHIgM/AzBOqCZSkpgc=;
 b=IkImtGZGCLm5KLyV8sT6lprKMZP6ssaccnJPKu9E532lkmbJbb8ZLU4gQ28W+/qh8s
 Ad96Xq6i2cPbhJ5+uO8QACoMdccsWh7bnwPqzcP5BqU/NHJ6x/hNeIaouJcyeZJfD7Pd
 b03Ac4AL6rtnvDnwTSgCUsnATLIy+6Htbo53ufu4ZBxyhl1p2Bx9E4EFyHK8RFYENli4
 pZTRU9YfzP1fGs0otqtD2ftFR53GfId1WsSM37pS+sviDNsUEQVK+/5uH/QssBsC/MTO
 Hvb3Ut6O37Sj1+c6k7KgrIfetGuFgrC6J3vK5oS3CjOq2Ir/mRtzBCQvSg17vtnuO3pc
 3b+A==
X-Gm-Message-State: AOAM531YzNyPAi0Y7EjgljdVboJLoEXzRHe+gFNgo3+/fSo/fhO6oEiK
 Gy5rB9M573jRZRxgpk4NKtP99qst78rMp77S6Vxs0n5FceCNLHJzA9iEBoezQHHsppjRCCuCgEV
 BPVz2hbgsPJF4s5HQXqlg8VQ2U3VPQ10GF+7azV+gOtbb5BFQbeL2hlhi8A+ArLoe
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr4379432wmj.10.1629814339299; 
 Tue, 24 Aug 2021 07:12:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVou/zbzkBMq6h96Epkyp0Sqdu0Oiu4DAAwdAQQ+9B2YCLX5S8NCfW4HGYW7QL/9ABYhCP6A==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr4379401wmj.10.1629814339081; 
 Tue, 24 Aug 2021 07:12:19 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g6sm2652347wmq.14.2021.08.24.07.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:12:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] util/vfio-helpers: Have qemu_vfio_dma_map() propagate
 Error
Date: Tue, 24 Aug 2021 16:11:40 +0200
Message-Id: <20210824141142.1165291-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all qemu_vfio_dma_map() callers provide an Error* argument,
fill it with relevant / more descriptive message. Reduce 'ret'
(returned value) scope by returning errno directly to simplify
(removing the goto / 'out' label).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c        |  1 +
 util/vfio-helpers.c | 31 ++++++++++++++-----------------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 663e5d918fa..80546b0babd 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -240,6 +240,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
                           false, &prp_list_iova, errp);
     if (r) {
+        error_prepend(errp, "Cannot map buffer for DMA: ");
         goto fail;
     }
     q->free_req_head = -1;
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 3e1a49bea15..f4c16e1dae5 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -729,7 +729,6 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
 int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
                       bool temporary, uint64_t *iova, Error **errp)
 {
-    int ret = 0;
     int index;
     IOVAMapping *mapping;
     uint64_t iova0;
@@ -742,32 +741,34 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
     } else {
+        int ret;
+
         if (s->high_water_mark - s->low_water_mark + 1 < size) {
-            ret = -ENOMEM;
-            goto out;
+            error_setg(errp, "iova exhausted (water mark reached)");
+            return -ENOMEM;
         }
         if (!temporary) {
-            if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
-                ret = -ENOMEM;
-                goto out;
+            if (qemu_vfio_find_fixed_iova(s, size, &iova0) < 0) {
+                error_setg(errp, "iova range not found");
+                return -ENOMEM;
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
-            if (ret) {
+            if (ret < 0) {
                 qemu_vfio_undo_mapping(s, mapping, NULL);
-                goto out;
+                return ret;
             }
             qemu_vfio_dump_mappings(s);
         } else {
             if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
-                ret = -ENOMEM;
-                goto out;
+                error_setg(errp, "iova range not found");
+                return -ENOMEM;
             }
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
-            if (ret) {
-                goto out;
+            if (ret < 0) {
+                return ret;
             }
         }
     }
@@ -775,11 +776,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (iova) {
         *iova = iova0;
     }
-out:
-    if (ret) {
-        error_setg_errno(errp, -ret, "Cannot map buffer for DMA");
-    }
-    return ret;
+    return 0;
 }
 
 /* Reset the high watermark and free all "temporary" mappings. */
-- 
2.31.1


