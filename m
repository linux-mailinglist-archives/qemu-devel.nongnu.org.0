Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8351FB26
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:18:40 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1PT-0007yZ-KW
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fe-0005Ga-Uj
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fc-000328-P6
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iP0EFfAGCyX4HpBTo71VQVnCIrQ29o6nhf7Yzzn8PjY=;
 b=hdeZmI80bVPbXdfL95ZgDqQW7jwL+5sJ6cj1zM4g5h++QZuoqa8T/+pHBz7F+wwZUM39im
 9fRvGjfvBlnyrRVW2ElU4MwdStY7jkt2QmbebxY8Ew2tSYBENRNmO2uJSsH4sU0WrT9mhj
 d9yAS2irUaQ1X8qG3uvW1hcPpJcjl7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-BzY1lxnBP32-p7nSOAFJtQ-1; Mon, 09 May 2022 06:31:14 -0400
X-MC-Unique: BzY1lxnBP32-p7nSOAFJtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so4977737wmq.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iP0EFfAGCyX4HpBTo71VQVnCIrQ29o6nhf7Yzzn8PjY=;
 b=2/aZU8Me+gmoDjNbWCUxISRJkb2Hbk4F4gnA04GYZLJ4CHFejggxhU/tiGgz6P15a9
 Zy2QHe8cF/E7jaY82SjvPoL5F0rUZ2cFCvMAejsIjekS244gs0sgJqsyvI1dxbnVq3Ij
 d1zevnVMgYKnv28LEIJtkosr6W60WlWO2hNHvvHw8uuJBnj9HR87n/9nv7VD8WZM/h6i
 FiM7q4jKlIRHzLet7x+L99+60ZDAV9wlSAhoZLCCuZlVxibppLw6tdi5WU/lQ8B988Lw
 NqN4SraLvZNc55uDfi8S0Nqvo3xKW8TYQYSLffAB3BpfUxkk7MfgyIm2G1U1bMUtOZJM
 JjAQ==
X-Gm-Message-State: AOAM531+d6soNcLtVw57L+q6dD0HUs9I5vOnz1diZgRMDAnWu5FP0iQL
 ZWQoMXCDyej17ky2RP7DeRBJu6BRNhTTB9fpAwDKdgQht/0YFIt8pkAhHgMXwFx3lRFaa7L+Idi
 dOLTgd2TwXSwC1zoeRg5Ug+fZbiAfCy3/8D7VxSP9YQbL/SSQohPQlB8n3hdXFVp/yc0=
X-Received: by 2002:adf:d1cf:0:b0:20c:a6c4:98f5 with SMTP id
 b15-20020adfd1cf000000b0020ca6c498f5mr12971215wrd.501.1652092272582; 
 Mon, 09 May 2022 03:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeJeFnQ5yxjo2FgY4rBO5heYLYO3IB1AOdEKJGh0RBOWJGQ+m+4NOP6zUDNPx5ozaqpsaYAA==
X-Received: by 2002:adf:d1cf:0:b0:20c:a6c4:98f5 with SMTP id
 b15-20020adfd1cf000000b0020ca6c498f5mr12971188wrd.501.1652092272135; 
 Mon, 09 May 2022 03:31:12 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000050c00b0020c5253d900sm10610696wrf.76.2022.05.09.03.31.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/26] vmdk: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:13 +0200
Message-Id: <20220509103019.215041-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vmdk.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 38e5ab3806..2c7f1858f9 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1793,10 +1793,10 @@ static int coroutine_fn vmdk_co_block_status(BlockDriverState *bs,
     return ret;
 }
 
-static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
-                            int64_t offset_in_cluster, QEMUIOVector *qiov,
-                            uint64_t qiov_offset, uint64_t n_bytes,
-                            uint64_t offset)
+static int coroutine_fn vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
+                                         int64_t offset_in_cluster, QEMUIOVector *qiov,
+					  uint64_t qiov_offset, uint64_t n_bytes,
+					  uint64_t offset)
 {
     int ret;
     VmdkGrainMarker *data = NULL;
@@ -1874,9 +1874,9 @@ static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
     return ret;
 }
 
-static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
-                            int64_t offset_in_cluster, QEMUIOVector *qiov,
-                            int bytes)
+static int coroutine_fn vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
+                                        int64_t offset_in_cluster, QEMUIOVector *qiov,
+					 int bytes)
 {
     int ret;
     int cluster_bytes, buf_bytes;
@@ -2023,9 +2023,9 @@ fail:
  *
  * Returns: error code with 0 for success.
  */
-static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
-                       uint64_t bytes, QEMUIOVector *qiov,
-                       bool zeroed, bool zero_dry_run)
+static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
+				     uint64_t bytes, QEMUIOVector *qiov,
+				     bool zeroed, bool zero_dry_run)
 {
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *extent = NULL;
-- 
2.35.1


