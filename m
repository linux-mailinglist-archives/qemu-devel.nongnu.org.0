Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3C5F7830
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:47:26 +0200 (CEST)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmlB-0000VC-PF
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku2-0005QS-Sp
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku1-0003BO-Fi
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vw+MUy67SFA/hYZ0rxltmZQHX2FtXDcp19zIq56PZxY=;
 b=RCPFshvmGfZrBHrT64xtjcly3GE+kQhsgP4skcGKXPwCEBr1JA4RADZoz4+1PPPhUShFqC
 i2oODxxkQXISrdAVF9VmPdcZhiKt3THJ2PE1QE/iVNqT8TJQg0XYSR+VaMB4g1xAB85ae+
 KhiGEVtGE7hbq/ONCwJn2DG6H2nBKAU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-KaGKqticPRqXJ-WtG0s0LQ-1; Fri, 07 Oct 2022 06:48:21 -0400
X-MC-Unique: KaGKqticPRqXJ-WtG0s0LQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 455D93826243;
 Fri,  7 Oct 2022 10:48:21 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8361C2028DC1;
 Fri,  7 Oct 2022 10:48:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 21/50] vmdk: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:23 +0200
Message-Id: <20221007104752.141361-22-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-21-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index fe07a54866..f7d8856dfb 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1787,10 +1787,11 @@ static int coroutine_fn vmdk_co_block_status(BlockDriverState *bs,
     return ret;
 }
 
-static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
-                            int64_t offset_in_cluster, QEMUIOVector *qiov,
-                            uint64_t qiov_offset, uint64_t n_bytes,
-                            uint64_t offset)
+static int coroutine_fn
+vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
+                  int64_t offset_in_cluster, QEMUIOVector *qiov,
+                  uint64_t qiov_offset, uint64_t n_bytes,
+                  uint64_t offset)
 {
     int ret;
     VmdkGrainMarker *data = NULL;
@@ -1868,9 +1869,10 @@ static int vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
     return ret;
 }
 
-static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
-                            int64_t offset_in_cluster, QEMUIOVector *qiov,
-                            int bytes)
+static int coroutine_fn
+vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
+                 int64_t offset_in_cluster, QEMUIOVector *qiov,
+                 int bytes)
 {
     int ret;
     int cluster_bytes, buf_bytes;
@@ -2015,9 +2017,9 @@ fail:
  *
  * Returns: error code with 0 for success.
  */
-static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
-                       uint64_t bytes, QEMUIOVector *qiov,
-                       bool zeroed, bool zero_dry_run)
+static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
+                                     uint64_t bytes, QEMUIOVector *qiov,
+                                     bool zeroed, bool zero_dry_run)
 {
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *extent = NULL;
-- 
2.37.3


