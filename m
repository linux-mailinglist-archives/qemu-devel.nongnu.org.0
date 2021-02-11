Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158BD31930F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:26:40 +0100 (CET)
Received: from localhost ([::1]:34208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHbr-0001bi-1u
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCd-0004ba-U9
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCM-0005eu-IZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0gnJ3RvnlvUUKiN3SMU5c/gTVYJ/ZiUQ5wDYEc1kss=;
 b=W5O6q9yjep15iK/c+063HEIb6Png9U5YeIBk5l1VvrTqTZazfi/70rfO0nHmWRXTUR/rMq
 wdKiQHydZq59YWAbNBg4PILHyTlJxFihd7rpoDxJN8d1vutrSwlmvoYtDgmaKeodgs69CC
 9B+l5uGOFLBUOdzci46Tg/CUcGwwJ1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-76WdaFDHPwaaFVthFSg56g-1; Thu, 11 Feb 2021 14:00:13 -0500
X-MC-Unique: 76WdaFDHPwaaFVthFSg56g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E232D809DE4;
 Thu, 11 Feb 2021 18:59:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F7553828;
 Thu, 11 Feb 2021 18:59:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/24] python/qemu: add qemu package itself to pipenv
Date: Thu, 11 Feb 2021 13:58:50 -0500
Message-Id: <20210211185856.3975616-19-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
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


