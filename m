Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F253241865
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 10:43:02 +0200 (CEST)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Ps5-0005gF-6t
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 04:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k5Pr9-0004qC-1r
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 04:42:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41741
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k5Pr6-0003ZU-4i
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 04:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597135315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZQCpla5L/uY58hvT6iYIGQc0L4KfKbxXcyUBNCfzzqY=;
 b=asFlyLptbG5BakFFcKEL8sgVhq1hKVYvST4hWMQF987hZEab1iZq5vjvgx8R85NKUlbruk
 xvplv8oX+wQgBjJkaJLn+mPRu6Jdb+V6QsoANOyIIqUyrfyhM+QsyrpLWlVA3uwShUvW/b
 BBmJS3Q7rk3IR9b1OO5xPHEBQvdr4R4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-QtbzxypzMYqE5AkRsok31g-1; Tue, 11 Aug 2020 04:41:53 -0400
X-MC-Unique: QtbzxypzMYqE5AkRsok31g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1C88E918;
 Tue, 11 Aug 2020 08:41:52 +0000 (UTC)
Received: from localhost (ovpn-113-152.ams2.redhat.com [10.36.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC3E5D9DD;
 Tue, 11 Aug 2020 08:41:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/059: Fix reference output
Date: Tue, 11 Aug 2020 10:41:50 +0200
Message-Id: <20200811084150.326377-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 04:41:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of the patch to flush qemu-img's "Formatting" message before the
error message, 059 has been broken for vmdk.  Fix it.

Fixes: 4e2f4418784da09cb106264340241856cd2846df
       ("qemu-img: Flush stdout before before potential stderr messages")
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/059.out | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/059.out b/tests/qemu-iotests/059.out
index 6d127e28d8..2b83c0c8b6 100644
--- a/tests/qemu-iotests/059.out
+++ b/tests/qemu-iotests/059.out
@@ -19,8 +19,8 @@ file format: IMGFMT
 virtual size: 2 GiB (2147483648 bytes)
 
 === Testing monolithicFlat with zeroed_grain ===
-qemu-img: TEST_DIR/t.IMGFMT: Flat image can't enable zeroed grain
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=2147483648
+qemu-img: TEST_DIR/t.IMGFMT: Flat image can't enable zeroed grain
 
 === Testing big twoGbMaxExtentFlat ===
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824000
-- 
2.26.2


