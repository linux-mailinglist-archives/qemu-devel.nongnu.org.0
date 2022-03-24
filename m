Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6614E68ED
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:55:44 +0100 (CET)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXScZ-0005bq-5w
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:55:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEU-0000Kk-06
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSER-0005mr-IP
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLr6zY9XqLosGuNpmqH3mBnTHxejKtvuQqrh/NZR/dE=;
 b=Sm2LCVkOmTFmxyOOOeYp1M0N9kn0hq70ooKAKkxXRZ0NxJzDT7hZUgIYPXNr9zGz3cAFMW
 oMlY+g2FvclcpQLFrV2sfGxgGucyO2hLHkNCmzlTAhITKs0ViWb9zZ3j/7GX0YXch4aBgf
 isxO/EuFvKhMLKgDA+qLP4XIm50uYKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-_cs8VtSkOlOmDcYEc6Brew-1; Thu, 24 Mar 2022 14:30:41 -0400
X-MC-Unique: _cs8VtSkOlOmDcYEc6Brew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7822880418F;
 Thu, 24 Mar 2022 18:30:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81A92C26EA0;
 Thu, 24 Mar 2022 18:30:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/17] iotests/205: fixup
Date: Thu, 24 Mar 2022 14:30:11 -0400
Message-Id: <20220324183018.2476551-11-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

(Merge into prior patch.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/205 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index c0e107328f..15f798288a 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -85,13 +85,13 @@ class TestNbdServerRemove(iotests.QMPTestCase):
 
     def do_test_connect_after_remove(self, mode=None):
         args = ('-r', '-f', 'raw', '-c', 'read 0 512', nbd_uri)
-        self.assertReadOk(qemu_io(*args))
+        self.assertReadOk(qemu_io(*args).stdout)
 
         result = self.remove_export('exp', mode)
         self.assert_qmp(result, 'return', {})
 
         self.assertExportNotFound('exp')
-        self.assertConnectFailed(qemu_io(*args))
+        self.assertConnectFailed(qemu_io(*args, check=False).stdout)
 
     def test_connect_after_remove_default(self):
         self.do_test_connect_after_remove()
-- 
2.34.1


