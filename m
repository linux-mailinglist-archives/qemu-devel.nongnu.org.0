Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491BE44203B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:44:05 +0100 (CET)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcHs-0007jP-At
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhb9N-0008VB-15
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhb9L-0001HF-5Q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635787870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/CzatqaI60Qc34fOp18eWhW5bFEc2LB3IPyDH6H9j0=;
 b=RCtZ5idXlzXMC6Yy3g/V6s+sGX4zBYw2nhtT7/ayvlxBAvvKmeiTu4O+2FThw87mOUnUtZ
 AMbnZHgC4JSu3onMg6HRTzPMZ36/95X5H2Afst2fb0aO2jULPnldXruNHpicb3pm7pqy+C
 vgPBGt0vPdJqspI0fRHrMbu78n7tbZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-wDh55ZfdNkawM3RMh9oadQ-1; Mon, 01 Nov 2021 13:31:07 -0400
X-MC-Unique: wDh55ZfdNkawM3RMh9oadQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2F58C7AC0;
 Mon,  1 Nov 2021 17:31:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B47619C79;
 Mon,  1 Nov 2021 17:30:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] iotests/297: Split mypy configuration out into mypy.ini
Date: Mon,  1 Nov 2021 13:29:46 -0400
Message-Id: <20211101173006.656673-3-jsnow@redhat.com>
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
References: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

More separation of code and configuration.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211019144918.3159078-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297      | 14 +-------------
 tests/qemu-iotests/mypy.ini | 12 ++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 tests/qemu-iotests/mypy.ini

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index bc3a0ceb2aa..b8101e6024a 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -73,19 +73,7 @@ def run_linters():
     sys.stdout.flush()
 
     env['MYPYPATH'] = env['PYTHONPATH']
-    p = subprocess.run(('mypy',
-                        '--warn-unused-configs',
-                        '--disallow-subclassing-any',
-                        '--disallow-any-generics',
-                        '--disallow-incomplete-defs',
-                        '--disallow-untyped-decorators',
-                        '--no-implicit-optional',
-                        '--warn-redundant-casts',
-                        '--warn-unused-ignores',
-                        '--no-implicit-reexport',
-                        '--namespace-packages',
-                        '--scripts-are-modules',
-                        *files),
+    p = subprocess.run(('mypy', *files),
                        env=env,
                        check=False,
                        stdout=subprocess.PIPE,
diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini
new file mode 100644
index 00000000000..4c0339f5589
--- /dev/null
+++ b/tests/qemu-iotests/mypy.ini
@@ -0,0 +1,12 @@
+[mypy]
+disallow_any_generics = True
+disallow_incomplete_defs = True
+disallow_subclassing_any = True
+disallow_untyped_decorators = True
+implicit_reexport = False
+namespace_packages = True
+no_implicit_optional = True
+scripts_are_modules = True
+warn_redundant_casts = True
+warn_unused_configs = True
+warn_unused_ignores = True
-- 
2.31.1


