Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5012478334
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:35:18 +0100 (CET)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my35Y-0000aq-W1
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30H-00013W-RT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30G-0000Ya-EH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uu8B7YgaHFVadAvGu4D3uYK62+a+ydOyNVact2iXPMM=;
 b=DC1Mu/D6tvu7qWMY8l2fEm8Utp2wvM8Fci/K7/auWLkkeEi8MxhX29j+rw9uytraC/bwtb
 VISrUxwLXhNWP16S2KT+1cyiO6GIdsDKukHtPMriBrpev8wlKnjQeK+glFY6zUXU2LvTj8
 IJgdHkzBBO2pTdbk7LNXSePH4KjFs5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-q7qWL3-ROIWf9O_z_0-uEg-1; Thu, 16 Dec 2021 21:29:44 -0500
X-MC-Unique: q7qWL3-ROIWf9O_z_0-uEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3B9A5F9C5;
 Fri, 17 Dec 2021 02:29:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DF8C22DF6;
 Fri, 17 Dec 2021 02:29:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/9] Python: update isort dependency
Date: Thu, 16 Dec 2021 21:29:32 -0500
Message-Id: <20211217022939.279559-3-jsnow@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

A forthcoming commit that deletes python/qemu/qmp and begins using the
dependency from PyPI instead changes the way older versions of isort
process import priorities. Sticking to isort versions newer than 5.6.0
keep us consistent with the bleeding edge of isort releases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 8 ++++----
 python/setup.cfg    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index b60f3fa508..2ca8a5c316 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "b6cdebf9bfa760e4f8148949936aeeeed681ca910900e89be07e13424228f9a0"
+            "sha256": "2c01f0652bb57febf4590e9dd1344ddc4c3d2530b5df2ef909620876cfb9ab6d"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -101,11 +101,11 @@
         },
         "isort": {
             "hashes": [
-                "sha256:408e4d75d84f51b64d0824894afee44469eba34a4caee621dc53799f80d71ccc",
-                "sha256:64022dea6a06badfa09b300b4dfe8ba968114a737919e8ed50aea1c288f078aa"
+                "sha256:20544581447ccb6a80940c5cace8cbc32c0f58d82d67d34a182950fe7b93321b",
+                "sha256:ef200cc0ebd896c5bb0d7da9fd390392648c56c2099c2d2ff940ac94739f62aa"
             ],
             "index": "pypi",
-            "version": "==5.1.2"
+            "version": "==5.6.0"
         },
         "lazy-object-proxy": {
             "hashes": [
diff --git a/python/setup.cfg b/python/setup.cfg
index 16f3236485..7907994c5a 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -39,7 +39,7 @@ devel =
     avocado-framework >= 90.0
     flake8 >= 3.6.0
     fusepy >= 2.0.4
-    isort >= 5.1.2
+    isort >= 5.6.0
     mypy >= 0.780
     pylint >= 2.8.0
     tox >= 3.18.0
-- 
2.31.1


