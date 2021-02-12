Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C42C31A5FF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:24:48 +0100 (CET)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAezf-0004uw-3f
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerk-0004BN-KX
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerd-0003r8-CF
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+cJgGGFf8il1Kc+826gN14F0x58VbcTfDVuVp9d1jc=;
 b=GARNxPGxAaNFZjk/AuENlzGWGTSNcbQDi4MgMGH7YPaXtin4uIZA9MRqkZnacEbsqIUcbQ
 +4f6I+08yXOJqirZ1hT+icMb95umzw7g5ur50gf21/nmwNVd+sgF8JNyUfcTdpvYO/AYAe
 jqziKtU4Ki4NLEOUa+MoBjU/TwsmcG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-pIsrYeh2Nb2AHL_2p7ey2A-1; Fri, 12 Feb 2021 15:16:26 -0500
X-MC-Unique: pIsrYeh2Nb2AHL_2p7ey2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2462D1934100;
 Fri, 12 Feb 2021 20:16:24 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77BBE614EB;
 Fri, 12 Feb 2021 20:16:23 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] iotests/210: Fix reference output
Date: Fri, 12 Feb 2021 14:16:08 -0600
Message-Id: <20210212201619.1388255-4-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Commit 69b55e03f has changed an error message, adjust the reference
output to account for it.

Fixes: 69b55e03f7e65a36eb954d0b7d4698b258df2708
       ("block: refactor bdrv_check_request: add errp")
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210209181923.497688-1-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/210.out | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
index dc1a3c9786ee..2e9fc596ebdf 100644
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
2.30.1


