Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2753155C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:21:37 +0100 (CET)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xdn-0004nw-V0
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9Xbq-00042X-2X
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:19:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9Xbn-0005CW-Tv
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612894771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3G4Axz5yFuyxSHgbHRTOjibFvla7uSx2qrTKnAI2PVI=;
 b=AJ0ycr/7610yHu5BgLfJooj/UCDQTgIYN4hBAS3fEjuLoJKjbiGLJb1QGalk7xXEEt3CBL
 slUU5XSNi600ITb+w1lkTE8sGdAHsu3HbYFmwfOH9lDKjyrGWu4O/Wk6NCrtEyMhjnSwnF
 gfd5y9Dfl9nRtQrgkCpKx6jACNP/xS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-CW5ikrQaPNONYoG0QA0UYg-1; Tue, 09 Feb 2021 13:19:27 -0500
X-MC-Unique: CW5ikrQaPNONYoG0QA0UYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE8AC804023;
 Tue,  9 Feb 2021 18:19:25 +0000 (UTC)
Received: from localhost (ovpn-113-208.ams2.redhat.com [10.36.113.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DAEB5D9C0;
 Tue,  9 Feb 2021 18:19:25 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/210: Fix reference output
Date: Tue,  9 Feb 2021 19:19:23 +0100
Message-Id: <20210209181923.497688-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 69b55e03f has changed an error message, adjust the reference
output to account for it.

Fixes: 69b55e03f7e65a36eb954d0b7d4698b258df2708
       ("block: refactor bdrv_check_request: add errp")
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
Fun fact: The branch name "fix-210-v1" was already taken for
8ba9c4d9b088d66aebfcb019f61ddc36fba2db88, which was only two months
ago.  Ah, well. :)
---
 tests/qemu-iotests/210.out | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
index dc1a3c9786..2e9fc596eb 100644
--- a/tests/qemu-iotests/210.out
+++ b/tests/qemu-iotests/210.out
@@ -182,7 +182,7 @@ Job failed: The requested file size is too large
 === Resize image with invalid sizes ===
 
 {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775296}}
-{"error": {"class": "GenericError", "desc": "Required too big image size, it must be not greater than 9223372035781033984"}}
+{"error": {"class": "GenericError", "desc": "offset(9223372036854775296) exceeds maximum(9223372035781033984)"}}
 {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775808}}
 {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'size', expected: integer"}}
 {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 18446744073709551104}}
-- 
2.29.2


