Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213DF5E5F78
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:10:40 +0200 (CEST)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJAE-0001bL-T5
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuD-0004X6-1W
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuA-0003Fb-FM
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wwzh3LZ3A3YlWSfvO4liFhM0kWBTm1zGZfGRa3JTzY=;
 b=Yv4nVDolCM1Wv7jbBUiquNgPq8ZISbbEsesws5R+iccGZWK1PIKuk88QroOUR83WZx8eLX
 VtTbF4l+w1esxYK1LsIWP59c22kCGXQwysehUCRewaHPhM3MB9r+khEQJMhuqws4ldp0I4
 nTx/tBhmFHAEp7fi/I/FQ+ttgbB9ANk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-mIQ4ljSCONa8hwr4c2jrug-1; Thu, 22 Sep 2022 04:49:56 -0400
X-MC-Unique: mIQ4ljSCONa8hwr4c2jrug-1
Received: by mail-ej1-f69.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so427936ejc.15
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3wwzh3LZ3A3YlWSfvO4liFhM0kWBTm1zGZfGRa3JTzY=;
 b=OayvQwAZTv1JHBRUOEzBdz4bDoTFuNWEtFzh21QhW57xxUQ2KibiV+CAhtisoq+0UM
 FAcFSXPySElAjQK0M42z4HNpC4saJZ+s6gu9Lej0Ac/rNp4NtXUjXyp1dS62KiwW0Vjz
 dM2LtlynUzDotMtDiPxs2lnZI2KzccQcuY5xvoq/gKMg3ecK/S1NNqSsH3JLcC9BoZMg
 snsp/C/V1ElW6bygilO6gxa4mgdDuly4jGBAfIWBRARakzjJGOwSubyqiRVpti27NtL7
 XMZYO3hY6sA1RF5bePzHJ6fwLC6PZSbYjHHu0M06zhgRslh0aMWbiyFyyJQsYYwP9PQB
 WGrA==
X-Gm-Message-State: ACrzQf3hRPAWeQaB+aLsvUzOleLbYoLd2so77BddPISMW5YIVpDveB+V
 vDfUOE2lRANqC5BOzjWlMtfm0MeWK9EEF6YXxr+J6s8Y9bHeyb2TCLm64OwKttjLNXIggKLLKpz
 OcLDXlMhu0wLdMwpGNrEbYgmCTcy6XpAjZjFqR2rzMOZXo9S5dRGnToTTjQ5OUCvNm+A=
X-Received: by 2002:a17:907:7621:b0:741:6656:bd14 with SMTP id
 jy1-20020a170907762100b007416656bd14mr1812920ejc.298.1663836595372; 
 Thu, 22 Sep 2022 01:49:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kS4kFvGNzTzNNX5/k2HH2ygZizwrOyxILTdQOgo05urL19ln/7rR6+U4igPkPDJXVuFg/Bw==
X-Received: by 2002:a17:907:7621:b0:741:6656:bd14 with SMTP id
 jy1-20020a170907762100b007416656bd14mr1812901ejc.298.1663836595037; 
 Thu, 22 Sep 2022 01:49:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906328b00b007389c5a45f0sm2315312ejw.148.2022.09.22.01.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 20/26] vmdk: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:18 +0200
Message-Id: <20220922084924.201610-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vmdk.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index fe07a54866..34b5e3f52e 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1787,10 +1787,10 @@ static int coroutine_fn vmdk_co_block_status(BlockDriverState *bs,
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
@@ -1868,9 +1868,9 @@ static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
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
@@ -2015,9 +2015,9 @@ fail:
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
2.37.3


