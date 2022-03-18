Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407234DE2B3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:43:46 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJRo-00058U-Kn
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:43:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLQ-0002X0-Gh
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLL-0005Z8-1U
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLr6zY9XqLosGuNpmqH3mBnTHxejKtvuQqrh/NZR/dE=;
 b=Lbpw07jcSHHZoNHjMgLZEnIGmV9or+vIvzh/2nJtYttc9/SZ02zpT6EV3gEbtVzvy+7X+o
 c6UGO1ktiQZuGNxmZWyuKm6XQlZzGOwyk2DVBRXr4HxPK43az442n1N/CMOdrp9omd9vV1
 y01yH+wtRh5ngoApmGnEXpIVPVfCkIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-jT-_lbYKOu-QaGC3571ENA-1; Fri, 18 Mar 2022 16:36:59 -0400
X-MC-Unique: jT-_lbYKOu-QaGC3571ENA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC288002BF;
 Fri, 18 Mar 2022 20:36:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87E06403373;
 Fri, 18 Mar 2022 20:36:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] iotests/205: fixup
Date: Fri, 18 Mar 2022 16:36:49 -0400
Message-Id: <20220318203655.676907-10-jsnow@redhat.com>
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


