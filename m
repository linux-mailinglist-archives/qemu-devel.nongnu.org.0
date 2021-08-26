Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E083F8F71
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:04:10 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLbd-0000ox-My
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOx-0005wS-TX
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOu-0003KN-SK
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVQGD97lOuv5jkp0wr3tMIUyo/OkErXO+YtZC52NVRU=;
 b=Uy0NY50poAFow6D3HVzpTC5wIeVUYCya6e8tGKKTYaTfO8YI7Bsnj+tFhRS3ML2GfyukgA
 Y844gE000VLVz4xC9KTuXTTvaQkwTnBPfkxvKafBlbxUQ9AhnYZLf/EKJBPI2KSgFPm/lI
 nqNbUZa5KTovZEhE8YDaL6Doc3vqZA0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-fO6dYsVVPgildWldEnD3lw-1; Thu, 26 Aug 2021 15:50:57 -0400
X-MC-Unique: fO6dYsVVPgildWldEnD3lw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso1221258wro.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVQGD97lOuv5jkp0wr3tMIUyo/OkErXO+YtZC52NVRU=;
 b=A02Y44fgiCKYKPkSRj3o8wq+N++Ll/NIZmrTyK91efxUe93wq9J1iRDy+MAdF4/PAI
 /cllSSSMdzr/yy1QrRWOZZZ3sCm1erKzcTjfv3pXKEv3CT96r3R5rGGKLIVWy2T8DR+J
 F6HMauPPNid0OTcd5ykCShdU22CxseC/G0hwFtlJ7sTLIfCdczgD1xf2ec8WXb+GKk0g
 XiGW/v92e+PHrEChElCVZ45iuf/lBnlfTkVu6KUFEMuSXjZ3IuaWPtPH1yF7P9jMMm8h
 Oc9YtzIY5BpIFWRmIuL8DSQ+gIG+d9U+j4mczsPej/gFjda1RTj0uka5N0YJR+zf3uGj
 4pFw==
X-Gm-Message-State: AOAM531ezlnxAZGlxP6HZsoc8t0MOly0Oa/q4bowE9xqMEm997+NBxbw
 I+Sp44HqLWYrarcNPeUBot/XPWsjqL+rkT2RSGkB7b3BMJ6b1EjCpGD1s5aZHDHWEYcmv2swaDS
 RIBzc67b9oyXLUQgbRtVDLfHeRUOeB0JJZJ06LOiEGYT79hYdmX8r1FdO9wEFG+mo
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr5807478wrw.324.1630007455773; 
 Thu, 26 Aug 2021 12:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNNJ19Av96aSZJp6jKLp1FNdmSOMavSlUl7pm1Ya1l6fqMWpOuwriSGHgY8vutcJfFdjYZtQ==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr5807456wrw.324.1630007455608; 
 Thu, 26 Aug 2021 12:50:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b15sm4637345wru.1.2021.08.26.12.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] util/vfio-helpers: Simplify qemu_vfio_dma_map()
 returning directly
Date: Thu, 26 Aug 2021 21:50:12 +0200
Message-Id: <20210826195014.2180369-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To simplify qemu_vfio_dma_map():
- reduce 'ret' (returned value) scope by returning errno directly,
- remove the goto 'out' label.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 7de5081dbd3..48b4384e8c8 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -750,7 +750,6 @@ static bool qemu_vfio_water_mark_reached(QEMUVFIOState *s, size_t size,
 int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
                       bool temporary, uint64_t *iova, Error **errp)
 {
-    int ret = 0;
     int index;
     IOVAMapping *mapping;
     uint64_t iova0;
@@ -763,32 +762,31 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
     } else {
+        int ret;
+
         if (qemu_vfio_water_mark_reached(s, size, errp)) {
-            ret = -ENOMEM;
-            goto out;
+            return -ENOMEM;
         }
         if (!temporary) {
             if (qemu_vfio_find_fixed_iova(s, size, &iova0, errp) < 0) {
-                ret = -ENOMEM;
-                goto out;
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
             if (qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
-                ret = -ENOMEM;
-                goto out;
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
@@ -796,8 +794,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (iova) {
         *iova = iova0;
     }
-out:
-    return ret;
+    return 0;
 }
 
 /* Reset the high watermark and free all "temporary" mappings. */
-- 
2.31.1


