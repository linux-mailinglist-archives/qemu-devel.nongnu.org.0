Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917244E68E0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:52:35 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSZV-0001Uz-D4
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:52:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSET-0000Kh-Sa
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSER-0005nA-AH
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+WsQwiCTIwmYqQFEAjnxKLzdNciLnDTtLA4mbMLW3M=;
 b=jPj1XTZHe9KmAFi0VR3el08vKUhzihZpFIV7/oMdgOi28OVQbp8OtZjsibz+jPfoVdpfkm
 kpO3vTgi4Ob1LlefsqufMY9KPSe30l67xjch0ZZQ002vwR9mL5xJifHZqtxBTpDx14fd1/
 e50risIzHEdGwbnFyPinN2RaUiex7yg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554--qnIJjI6ODCj4Ga-qUA2yw-1; Thu, 24 Mar 2022 14:30:42 -0400
X-MC-Unique: -qnIJjI6ODCj4Ga-qUA2yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83D44299E755;
 Thu, 24 Mar 2022 18:30:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACC28C26EA0;
 Thu, 24 Mar 2022 18:30:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/17] iotests/245: fixup
Date: Thu, 24 Mar 2022 14:30:12 -0400
Message-Id: <20220324183018.2476551-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Merge with prior.

This is a little more involved, now, but maybe it's a small price to pay
for the better debug information being deployed universally.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/245 | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 8cbed7821b..edaf29094b 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -20,11 +20,13 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import copy
+import json
 import os
 import re
+from subprocess import CalledProcessError
+
 import iotests
-import copy
-import json
 from iotests import qemu_img, qemu_io
 
 hd_path = [
@@ -216,11 +218,14 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
     # Reopen an image several times changing some of its options
     def test_reopen(self):
-        # Check whether the filesystem supports O_DIRECT
-        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0]):
-            supports_direct = False
-        else:
+        try:
+            qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0])
             supports_direct = True
+        except CalledProcessError as exc:
+            if 'O_DIRECT' in exc.stdout:
+                supports_direct = False
+            else:
+                raise
 
         # Open the hd1 image passing all backing options
         opts = hd_opts(1)
-- 
2.34.1


