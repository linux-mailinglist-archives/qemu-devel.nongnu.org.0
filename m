Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD440CADF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:42:50 +0200 (CEST)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXzl-0007o8-Mj
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpK-0005WX-Hy
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpF-0005YO-5l
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQKFe1TBi2xJLQ2rhsWupZ++mkrbEtyBWa24fd1BFbc=;
 b=jNgKbc4T1tGygpZOpAxWp3UQ/hYhBeLi18GnOOFiquvpq7b16NbvNTvLavW1IX6ns7bncP
 vPaPWFEHIAiY5OM9WvtJ/h2k1DoVBGFK3ab+32qTNRKS1veRZJgRgwpDqlUPH5YlIKT98j
 3Yu2oWGTWwuqjhER9+PfL++0nTVq1sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-qC4HEk9dPPehfPGD5NkTNg-1; Wed, 15 Sep 2021 12:31:53 -0400
X-MC-Unique: qC4HEk9dPPehfPGD5NkTNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76261100CCC0;
 Wed, 15 Sep 2021 16:31:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51E077771A;
 Wed, 15 Sep 2021 16:31:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/27] python: bump avocado to v90.0
Date: Wed, 15 Sep 2021 12:29:52 -0400
Message-Id: <20210915162955.333025-25-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado v90 includes improved support for running async unit tests. The
workaround that existed prior to v90 causes the unit tests to fail
afterwards, however, so upgrade our minimum version pin to the very
latest and greatest.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 8 ++++----
 python/setup.cfg    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 8ab41a3f60..457f5c3fe8 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "eff562a688ebc6f3ffe67494dbb804b883e2159ad81c4d55d96da9f7aec13e91"
+            "sha256": "784b327272db32403d5a488507853b5afba850ba26a5948e5b6a90c1baef2d9c"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -39,11 +39,11 @@
         },
         "avocado-framework": {
             "hashes": [
-                "sha256:3fca7226d7d164f124af8a741e7fa658ff4345a0738ddc32907631fd688b38ed",
-                "sha256:48ac254c0ae2ef0c0ceeb38e3d3df0388718eda8f48b3ab55b30b252839f42b1"
+                "sha256:244cb569f8eb4e50a22ac82e1a2b2bba2458999f4281efbe2651bd415d59c65b",
+                "sha256:6f15998b67ecd0e7dde790c4de4dd249d6df52dfe6d5cc4e2dd6596df51c3583"
             ],
             "index": "pypi",
-            "version": "==87.0"
+            "version": "==90.0"
         },
         "distlib": {
             "hashes": [
diff --git a/python/setup.cfg b/python/setup.cfg
index 9d35024e48..c22d9961df 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -37,7 +37,7 @@ packages =
 # version, use e.g. "pipenv install --dev pylint==3.0.0".
 # Subsequently, edit 'Pipfile' to remove e.g. 'pylint = "==3.0.0'.
 devel =
-    avocado-framework >= 87.0
+    avocado-framework >= 90.0
     flake8 >= 3.6.0
     fusepy >= 2.0.4
     isort >= 5.1.2
-- 
2.31.1


