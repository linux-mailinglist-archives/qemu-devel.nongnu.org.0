Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675812DE276
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:12:52 +0100 (CET)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEcr-0003M6-Ls
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEaz-0001Yn-9Y
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEax-0001ZU-Aw
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yw2cvNcKfmp0Ylzx3Br660U7TBEexUolRU1FHjRAq4k=;
 b=ZWXWdtzrjYLrSeoKOH/rXSWrdyCxnBRupRsqwWD1AYV3+oMnO0+jzoDvkoUiZArn/aiqCz
 4kINNgonWpTBpIge4GeFuX0Q3Ogbx82ybUr0ppCMoRxLEHhYxiT1yiUN6qrk0/P9G93z8M
 uiRgCaKU1uBLFm/pxf6/DY4xENYJDyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-bZCaSi6aNj6Mx47hlE1Lew-1; Fri, 18 Dec 2020 07:10:48 -0500
X-MC-Unique: bZCaSi6aNj6Mx47hlE1Lew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 999DF8049C5;
 Fri, 18 Dec 2020 12:10:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF8260C47;
 Fri, 18 Dec 2020 12:10:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/17] iotests/210: Fix reference output
Date: Fri, 18 Dec 2020 13:10:25 +0100
Message-Id: <20201218121041.299788-2-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Commit 8b1170012b1 has added a global maximum disk length for the block
layer, so the error message when creating an overly large disk has
changed.

Fixes: 8b1170012b1de6649c66ac1887f4df7e312abf3b
       ("block: introduce BDRV_MAX_LENGTH")
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201214175158.299919-1-mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/210.out | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
index a5e88e2a82..dc1a3c9786 100644
--- a/tests/qemu-iotests/210.out
+++ b/tests/qemu-iotests/210.out
@@ -182,7 +182,7 @@ Job failed: The requested file size is too large
 === Resize image with invalid sizes ===
 
 {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775296}}
-{"error": {"class": "GenericError", "desc": "The requested file size is too large"}}
+{"error": {"class": "GenericError", "desc": "Required too big image size, it must be not greater than 9223372035781033984"}}
 {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775808}}
 {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'size', expected: integer"}}
 {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 18446744073709551104}}
-- 
2.29.2


