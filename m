Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB852417FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 10:09:45 +0200 (CEST)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5PLs-0003hx-3s
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 04:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k5PKq-00032N-61
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 04:08:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20085
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k5PKo-0007Tm-Ja
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 04:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597133317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aJPqGAnr8F26S+qxFoqSpEeR7ZQ3TOXbIzESwwAfeB4=;
 b=T5z5MNO4bX8GCUQsZISJcZCCdTzvoGTyeijOoNEH6XVoZYT1DN/jBslKH1Z91dR8cu/Qft
 UrC/dvq5FNFiBURmeyhkSdVYwMo+csbcXYueeBjepURZa68+fk6jgaejsZsU+5fFI2M34G
 95IcuJdut4o1oJR3BCb1K8NOTvhuJnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-fvC0Jq5fNwaGeeu2wQkL5g-1; Tue, 11 Aug 2020 04:08:33 -0400
X-MC-Unique: fvC0Jq5fNwaGeeu2wQkL5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F10DF1009600;
 Tue, 11 Aug 2020 08:08:32 +0000 (UTC)
Received: from localhost (ovpn-113-152.ams2.redhat.com [10.36.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C5705D9D7;
 Tue, 11 Aug 2020 08:08:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/259: Fix reference output
Date: Tue, 11 Aug 2020 10:08:30 +0200
Message-Id: <20200811080830.289136-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 03:08:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The error message has changed recently, breaking the test.  Fix it.

Fixes: a2b333c01880f56056d50c238834d62e32001e54
       ("block: nbd: Fix convert qcow2 compressed to nbd")
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/259.out | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/259.out b/tests/qemu-iotests/259.out
index e27b9ff38d..1aaadfda4e 100644
--- a/tests/qemu-iotests/259.out
+++ b/tests/qemu-iotests/259.out
@@ -10,5 +10,5 @@ disk size: unavailable
 
 --- Testing creation for which the node would need to grow ---
 Formatting 'TEST_DIR/t.IMGFMT', fmt=qcow2 size=67108864 preallocation=metadata
-qemu-img: TEST_DIR/t.IMGFMT: Could not resize image: Image format driver does not support resize
+qemu-img: TEST_DIR/t.IMGFMT: Could not resize image: Cannot grow NBD nodes
 *** done
-- 
2.26.2


