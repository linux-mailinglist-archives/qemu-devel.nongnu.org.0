Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E574C134D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 13:55:41 +0100 (CET)
Received: from localhost ([::1]:56842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrBE-0001GQ-GI
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 07:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMr02-00048m-RF
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMr00-0007vq-6T
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645620242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1Rn8pemsu8oxsGd/g929fo0uAdgycVdoIKjGQCY4dA8=;
 b=K5YJGHc/8vRTErqKwrWkoBKcmMlLO0WbnlAE9kIFl1Ct9WfN/BjabjizblPvFPBLx6nrbK
 ed+8moFcxN8gNtWgOrnTQCdeedCOsTUllYpXQHAUnu0ODL2pSqDpGh3xYEcLgzzQ2de4kB
 t8rRxmTCKanRO0iU0hZhF6Zg06coVro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-JHPMmFqbOA-28oGYmNUj1Q-1; Wed, 23 Feb 2022 07:43:58 -0500
X-MC-Unique: JHPMmFqbOA-28oGYmNUj1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D163C1006AAB;
 Wed, 23 Feb 2022 12:43:57 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C575181F6C;
 Wed, 23 Feb 2022 12:43:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] tests/qemu-iotests/testrunner: Quote "case not run" lines in
 TAP mode
Date: Wed, 23 Feb 2022 13:43:53 +0100
Message-Id: <20220223124353.3273898-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In TAP mode, the stdout is reserved for the TAP protocol, so we
have to make sure to mark other lines with a comment '#' character
at the beginning to avoid that the TAP parser at the other end
gets confused.

To test this condition, run "configure" for example with:

 --block-drv-rw-whitelist=copy-before-write,qcow2,raw,file,host_device,blkdebug,null-co,copy-on-read

so that iotest 041 will report that some tests are not run due to
the missing "quorum" driver. Without this change, "make check-block"
fails since the meson tap parser gets confused by these messages.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 9a94273975..0c7dc34a9e 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -365,7 +365,10 @@ def run_test(self, test: str,
                                  description=res.description)
 
         if res.casenotrun:
-            print(res.casenotrun)
+            if self.tap:
+                print('#' + res.casenotrun.replace('\n', '\n#'))
+            else:
+                print(res.casenotrun)
 
         return res
 
-- 
2.27.0


