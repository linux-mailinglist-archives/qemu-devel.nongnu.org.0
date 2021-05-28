Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE6393BC2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:58:24 +0200 (CEST)
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmShb-0006bB-UZ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLN-0006nA-Vb
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLM-0001Ab-8j
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxY6owVQBzmpZ46LfiPK3rOj0YPUGcNCfOfZ2S9164Y=;
 b=PqzRvohjPb1CjD3PvKE4WblYBWFejcQ6f54mA20SJ/z4kxlxwnVd/YDIyo0UI6o2ivRwJz
 PZ4sDykReR87StwUAWqIogeZyMR57/t+IrLiQ05fzr6Pwv8hCnQx6YJ19OUeCWAP+jenJ6
 F0I79pjP09HGkVFGj/V+d47JyNFZwkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-IGymxklFNde-14pSs3rUkQ-1; Thu, 27 May 2021 22:35:18 -0400
X-MC-Unique: IGymxklFNde-14pSs3rUkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7753C501E3;
 Fri, 28 May 2021 02:35:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C4F1F0C0;
 Fri, 28 May 2021 02:35:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/44] python/qemu: add qemu package itself to pipenv
Date: Thu, 27 May 2021 22:32:14 -0400
Message-Id: <20210528023220.417057-39-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Message-id: 20210527211715.394144-26-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      | 1 +
 python/Pipfile.lock | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index 79c74dd8db4..dbe96f71c48 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -10,6 +10,7 @@ mypy = ">=0.770"
 pylint = ">=2.8.0"
 
 [packages]
+qemu = {editable = true,path = "."}
 
 [requires]
 python_version = "3.6"
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 57a5befb104..f0bf576c31e 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "8173290ad57aab0b722c9b4f109519de4e0dd7cd1bad1e16806b78bb169bce08"
+            "sha256": "7c74cc4c2db3a75c954a6686411cda6fd60e464620bb6d5f1ed9a54be61db4cc"
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
2.31.1


