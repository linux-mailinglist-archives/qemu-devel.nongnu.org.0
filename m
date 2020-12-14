Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA82D9E3E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:54:11 +0100 (CET)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kos2z-0002BI-KS
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kos1H-0000vi-Hq
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kos11-0006Zr-4w
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607968323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nAxa2w34yh7MJJHJWo5bkbyRYw/gGFubVYbhbY9aApQ=;
 b=JE+VXQmDHcGYx8+EsQx9SvBXimWuqgP5P2CK/0hkmIjzckTUkUO46URGJWfgBjFo3xsnJZ
 dbS6JZTDO60YyvsMKyQVSQRbfq5yoQjqn1eoFXmzWPUrWBkJ+QuPqUKmmpPfIz0Ug7o+Bw
 K0/xXNSde/ORp+gDdre0czFu57MFf1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-j58FrPQVNw23VCZXHBEXuA-1; Mon, 14 Dec 2020 12:52:01 -0500
X-MC-Unique: j58FrPQVNw23VCZXHBEXuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD7D59;
 Mon, 14 Dec 2020 17:52:00 +0000 (UTC)
Received: from localhost (ovpn-113-43.ams2.redhat.com [10.36.113.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46DA11971D;
 Mon, 14 Dec 2020 17:52:00 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/210: Fix reference output
Date: Mon, 14 Dec 2020 18:51:58 +0100
Message-Id: <20201214175158.299919-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 8b1170012b1 has added a global maximum disk length for the block
layer, so the error message when creating an overly large disk has
changed.

Fixes: 8b1170012b1de6649c66ac1887f4df7e312abf3b
       ("block: introduce BDRV_MAX_LENGTH")
Signed-off-by: Max Reitz <mreitz@redhat.com>
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


