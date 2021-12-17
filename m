Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E021478349
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:42:35 +0100 (CET)
Received: from localhost ([::1]:41564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my3Cc-0003AG-AD
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:42:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30X-0001BH-Qz
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:30:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30U-0000c3-Gp
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0QMLr0tZir5/kTfBVTIsYp/8mjXVHYY+ncnjRYwjCY=;
 b=DAuyZ1ZQgddpLKmsHzWXdSer3jtQDVFl1ens85xmJZ56/TB6qQpexi+/D5Tr21CPo+OLM4
 kMs6bVjTJumQThtaMt52aJY3jbVSOy5ziSh56bS/uIBKkmdopF/QFIH8K5ZP/XtWeANUEO
 ZuyO4u/+4FOt/skTdgf+nc8U6SGJ3NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-vSgdp-kkPP2VM69aPICWOQ-1; Thu, 16 Dec 2021 21:29:59 -0500
X-MC-Unique: vSgdp-kkPP2VM69aPICWOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F27801B0C;
 Fri, 17 Dec 2021 02:29:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D25A322DF6;
 Fri, 17 Dec 2021 02:29:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] (WIP) Python: update Pipfile
Date: Thu, 16 Dec 2021 21:29:39 -0500
Message-Id: <20211217022939.279559-10-jsnow@redhat.com>
In-Reply-To: <20211217022939.279559-1-jsnow@redhat.com>
References: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With qemu.qmp gone, we'll need to install it to the Pipenv so that those
tests pass.

Important; if this still fails, check that you don't have any stale
files in python/qemu/qmp/ which could interfere with this process.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 2ca8a5c316..d08b5affa5 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "2c01f0652bb57febf4590e9dd1344ddc4c3d2530b5df2ef909620876cfb9ab6d"
+            "sha256": "a844774b45a632621cae9259c187ecfed7b6336638366883acd3d2f46fcc2fa2"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -19,6 +19,14 @@
         "qemu": {
             "editable": true,
             "path": "."
+        },
+        "qemu.qmp": {
+            "hashes": [
+                "sha256:6ae30a8bb9ca9687c59ed3bfec6ff12d32c7d268227e5812f7e42af625687e45",
+                "sha256:829d1b4c3c35cbc3781839338040adbd11c6be0a9d15c6a433323ebb795cfae6"
+            ],
+            "index": "pypi",
+            "version": "==0.0.0a0"
         }
     },
     "develop": {
@@ -244,6 +252,14 @@
             "editable": true,
             "path": "."
         },
+        "qemu.qmp": {
+            "hashes": [
+                "sha256:6ae30a8bb9ca9687c59ed3bfec6ff12d32c7d268227e5812f7e42af625687e45",
+                "sha256:829d1b4c3c35cbc3781839338040adbd11c6be0a9d15c6a433323ebb795cfae6"
+            ],
+            "index": "pypi",
+            "version": "==0.0.0a0"
+        },
         "setuptools": {
             "hashes": [
                 "sha256:22c7348c6d2976a52632c67f7ab0cdf40147db7789f9aed18734643fe9cf3373",
-- 
2.31.1


