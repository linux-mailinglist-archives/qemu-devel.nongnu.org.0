Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8405FD9C9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:04:11 +0200 (CEST)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixsg-0001om-9e
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTE-0001dG-Oj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTC-00048C-3O
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLXsQ/hGD407OqvW19603UTrg72JjB7KNc7R1Vr1Zdg=;
 b=XEnLkiwEXgYYg/vzS6H63A2A4qxV/tgPONQwUseRSTqx2QBz69y+Oscwd5I7UCo+cyWyS+
 sEN/JJyPP6TiwpNbZTaV1fojaU/61MdaQh91xW2epuRzZfe8LsaGRfFBsa3hb7p2ChoDEI
 Wk7WJSbQVmzIA3Ch9cii2MrUbWIZNcA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-rGchmcEjNeKxbgsHZu1Clw-1; Thu, 13 Oct 2022 08:37:48 -0400
X-MC-Unique: rGchmcEjNeKxbgsHZu1Clw-1
Received: by mail-ed1-f69.google.com with SMTP id
 f16-20020a0564021e9000b0045beb029117so1407332edf.12
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLXsQ/hGD407OqvW19603UTrg72JjB7KNc7R1Vr1Zdg=;
 b=aPVzIOr3aW/DycMX9SOW5PEK6F7zGk1uPfRn6yREPA50NA1PRBfkL8cvobbIgYaYeZ
 ZcLOsA5hbup/Z9DjcTN3axVgzbqPAonKE640f8MbkeHNGAWlwW21A58ikFM0msUGrWMn
 lHnN1JHK78GTn/6zqblFkr3vOzxBqmdCbbxvy338gxGdQxcnr3wZsCcNzpc5IVRdReY6
 /6GXr8j0xPgiA6EJFf52X1J5WxWfSsBUViq+NxBxnoRA05+QmmuQWfD8SM175pE02xyM
 /0sBrMH9Xc54cCEzXHlb8z4BCkQhMN8XpI7CcH/W6fJtIvkUlzzM3Pz53jmTeg8IP7V5
 +Z7w==
X-Gm-Message-State: ACrzQf38jnzCb5XdA6x9KmLgh7WNqfU5W16svSQNbIxB7YxZxfnbT7o9
 vGcMYXY/hgUQuW/pY086wpjEUYQzHe3+wWDXXIVZwyF4zzJQJn9Rdew7RV2NniWYEjpHnzAODTn
 /KZc1X+J7uFatVegIo4ZdmqWcFZ1sR4gu6bb+luRk1ZNKbhogZY3U5tOscja4HGyU/lc=
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id
 n10-20020a05640205ca00b0043b6e01482cmr32157144edx.189.1665664666497; 
 Thu, 13 Oct 2022 05:37:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bKoUnTx+rckbMvd9dKkRQZmMiGmWmJOYjKPEujU2LggP7vYPxkNBNsmSTUDAP2FX8jUxcvQ==
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id
 n10-20020a05640205ca00b0043b6e01482cmr32157125edx.189.1665664666239; 
 Thu, 13 Oct 2022 05:37:46 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a50fe99000000b0045c47b2a800sm6756238edt.67.2022.10.13.05.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 11/24] qcow: manually add more coroutine_fn annotations
Date: Thu, 13 Oct 2022 14:36:58 +0200
Message-Id: <20221013123711.620631-12-pbonzini@redhat.com>
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

get_cluster_offset() and decompress_cluster() are only called from
the read and write paths.

The validity of these was double-checked with Alberto Faria's static analyzer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index 311aaa8705..7f07c00c0f 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -92,7 +92,7 @@ typedef struct BDRVQcowState {
 
 static QemuOptsList qcow_create_opts;
 
-static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset);
+static int coroutine_fn decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset);
 
 static int qcow_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
@@ -351,10 +351,10 @@ static int qcow_reopen_prepare(BDRVReopenState *state,
  * return 0 if not allocated, 1 if *result is assigned, and negative
  * errno on failure.
  */
-static int get_cluster_offset(BlockDriverState *bs,
-                              uint64_t offset, int allocate,
-                              int compressed_size,
-                              int n_start, int n_end, uint64_t *result)
+static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
+                                           uint64_t offset, int allocate,
+                                           int compressed_size,
+                                           int n_start, int n_end, uint64_t *result)
 {
     BDRVQcowState *s = bs->opaque;
     int min_index, i, j, l1_index, l2_index, ret;
@@ -585,7 +585,7 @@ static int decompress_buffer(uint8_t *out_buf, int out_buf_size,
     return 0;
 }
 
-static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
+static int coroutine_fn decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
 {
     BDRVQcowState *s = bs->opaque;
     int ret, csize;
-- 
2.37.3


