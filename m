Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C148B4DE2C6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:48:16 +0100 (CET)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJWB-0007Nb-Ra
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:48:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLQ-0002XC-Ju
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLL-0005ZU-Gp
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46s02IKfPzEHeky+CL14PRQ7s2txOzrx2qlksONgEv0=;
 b=F6Njlt7Xv/IdkAzUWKAQ66dTMowy+D7nFdpJ9eBYNIPWqSVO3mkUAWDIcmZz10BfRfSYDu
 bDGe1V1Dy91M6JkD1aZYzqhiYrBvDZiRiQ7BFyjWurJGRb4jn/SXWWhHfABhP17bxWu1J4
 Mf7hM3CUqgTentMOW6R2yJntuXFSTg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-1VKAQpjeMYGIJ7fmuym0hQ-1; Fri, 18 Mar 2022 16:36:59 -0400
X-MC-Unique: 1VKAQpjeMYGIJ7fmuym0hQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A3C7185A7A4;
 Fri, 18 Mar 2022 20:36:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBB054292C7;
 Fri, 18 Mar 2022 20:36:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] iotests/245: fixup
Date: Fri, 18 Mar 2022 16:36:50 -0400
Message-Id: <20220318203655.676907-11-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Merge with prior patch.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/242 | 2 +-
 tests/qemu-iotests/245 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index 4b7ec16af6..ecc851582a 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -22,7 +22,7 @@
 import iotests
 import json
 import struct
-from iotests import qemu_img_create, qemu_io, qemu_img_info, \
+from iotests import qemu_img_create, qemu_io_log, qemu_img_info, \
     file_path, img_info_log, log, filter_qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2'],
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 8cbed7821b..efdad1a0c4 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -217,7 +217,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     # Reopen an image several times changing some of its options
     def test_reopen(self):
         # Check whether the filesystem supports O_DIRECT
-        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0]):
+        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0]).stdout:
             supports_direct = False
         else:
             supports_direct = True
-- 
2.34.1


