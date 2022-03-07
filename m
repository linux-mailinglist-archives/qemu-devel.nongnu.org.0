Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F64CFE44
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:25:16 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCQO-0001BR-1M
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:25:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <09d19d58078767f14f9a602eb939743d0a7c7a85@lizzy.crudebyte.com>)
 id 1nRCIn-0005eQ-RI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:17:25 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:60501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <09d19d58078767f14f9a602eb939743d0a7c7a85@lizzy.crudebyte.com>)
 id 1nRCIm-0008HM-FQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Dis0cFCt3Kt62wTSFGnP7lUDxDeSvq1HWoewP11CBIo=; b=dhLWx
 VRX1mdJJ996PiaaeTSDuxkdi+RTv1FkD9it+BTu0022iO6wttC6AQN3DmMZgQYLZfQf1LQp/4AGa7
 m90pT8azDu+1n2TM6g1JloshOP7ATEyKJOHLN163DKFe0co7eUhOyJJFM9HMEmpXba7zwcG9L4R6M
 iCn+4xy6gh4jpPzK/XQnwFQY249ZCZtIFSWKLoV7ljXo1UVcgmNtALtCsZ8A/5wMBuuEWimnZkmqH
 qCM/ZPKcTbZhvEOa/VeBSXWvKdWoYv6Y/vpgrSAD8u0SU3VReno5Fj2A94XLMGvExfTTJ0ShEYCXA
 nQvyYzw5peB407s8ANBJ/OSYih75A==;
Message-Id: <09d19d58078767f14f9a602eb939743d0a7c7a85.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 18/19] 9pfs/coth.h: drop Doxygen format on
 v9fs_co_run_in_worker()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=09d19d58078767f14f9a602eb939743d0a7c7a85@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

API doc comments in QEMU are supposed to be in kerneldoc format, so
drop Doxygen format used on v9fs_co_run_in_worker() macro.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <a8fdf0290d1e40a68f5577f29aeae12298b70733.1646314856.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/coth.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index f83c7dda7b..1a1edbdc2a 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -19,7 +19,7 @@
 #include "qemu/coroutine.h"
 #include "9p.h"
 
-/**
+/*
  * we want to use bottom half because we want to make sure the below
  * sequence of events.
  *
@@ -29,7 +29,7 @@
  * we cannot swap step 1 and 2, because that would imply worker thread
  * can enter coroutine while step1 is still running
  *
- * @b PERFORMANCE @b CONSIDERATIONS: As a rule of thumb, keep in mind
+ * PERFORMANCE CONSIDERATIONS: As a rule of thumb, keep in mind
  * that hopping between threads adds @b latency! So when handling a
  * 9pfs request, avoid calling v9fs_co_run_in_worker() too often, because
  * this might otherwise sum up to a significant, huge overall latency for
-- 
2.20.1


