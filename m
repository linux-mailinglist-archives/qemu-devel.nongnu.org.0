Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B159231F071
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:51:39 +0100 (CET)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpKs-0006b1-Nn
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyW-0003Ip-BC
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyO-0003gx-FY
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XlB5t9N0p1IVub0849dZGu3RGLrXirym+uVz5W47SI=;
 b=SOLvaf/kMc4YbaMEKvS+x+kEvjhclUiO4J8R2X4NMG/QUnbLy+yRPevtEEiHtXT7GYBo8B
 lZCVfCLahSGoG/GSt5xJp0OJKHnQkdwc2BWKBJ0udFpzQgX1LilL520tQqk4nJc/qaglzW
 sO7AVMY3CgqxlkdXzBqLv61/51O2COo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-qPsKvE_JPc--u4UORxQSgw-1; Thu, 18 Feb 2021 14:28:20 -0500
X-MC-Unique: qPsKvE_JPc--u4UORxQSgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80C7427CD;
 Thu, 18 Feb 2021 19:28:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61D6560BE5;
 Thu, 18 Feb 2021 19:28:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/25] python/qemu: add qemu package itself to pipenv
Date: Thu, 18 Feb 2021 14:27:27 -0500
Message-Id: <20210218192733.370968-20-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the python qemu packages themselves to the pipenv manifest.
'pipenv sync' will create a virtual environment sufficient to use the SDK.
'pipenv sync --dev' will create a virtual environment sufficient to use
and test the SDK (with pylint, mypy, isort, flake8, etc.)

The qemu packages are installed in 'editable' mode; all changes made to
the python package inside the git tree will be reflected in the
installed package without reinstallation. This includes changes made
via git pull and so on.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 python/Pipfile      | 1 +
 python/Pipfile.lock | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index 75b96f29d87..214fb175e7a 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -10,6 +10,7 @@ mypy = ">=0.770"
 pylint = ">=2.6.0"
 
 [packages]
+qemu = {editable = true,path = "."}
 
 [requires]
 python_version = "3.6"
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 201e735c27a..4b4402f49e5 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "b89c7a1b8a414f2a4cd708964123fb427d55419ee0b39e088bf2e7d4fbc11979"
+            "sha256": "e38d142c3fadc2f2ed849e86f7ebd14e25974dc12228751490aef5a9ee074f2f"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -15,7 +15,12 @@
             }
         ]
     },
-    "default": {},
+    "default": {
+        "qemu": {
+            "editable": true,
+            "path": "."
+        }
+    },
     "develop": {
         "astroid": {
             "hashes": [
-- 
2.29.2


