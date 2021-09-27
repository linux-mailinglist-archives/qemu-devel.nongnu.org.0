Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B260B419F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:57:01 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwkG-0007pR-Km
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJW-0007Vp-7c
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJT-0000If-F1
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mlMzaJfi5MEIHOdYJ37R8z1gqYD18vgI/setqcrYoI=;
 b=goCOqK7R05mhlaaQEMCfviN1TFJBNI7glLLw6IpLl73XRykdL8avt80ewwxD7S4nMzOhCB
 pWC659F3sbTGXTSoCOwYkfkcROQDZssjXYKHTVEwWb+/+TaBSYnIKcWdX4NumOA3VmYTVI
 NFZIRHNhm6/UxowDdTXGPWLMLUVkIOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-CaqXCWyhOu-iU0AP6NDaGQ-1; Mon, 27 Sep 2021 15:29:17 -0400
X-MC-Unique: CaqXCWyhOu-iU0AP6NDaGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F3CD1084681;
 Mon, 27 Sep 2021 19:29:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B77D60871;
 Mon, 27 Sep 2021 19:29:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/32] python: Add dependencies for AQMP TUI
Date: Mon, 27 Sep 2021 15:25:09 -0400
Message-Id: <20210927192513.744199-29-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Added dependencies for the upcoming AQMP TUI under the optional
'tui' group.

The same dependencies have also been added under the devel group
since no work around has been found for optional groups to imply
other optional groups.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Message-Id: <20210823220746.28295-2-niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 12 ++++++++++++
 python/setup.cfg    |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 457f5c3fe87..da7a4ee164c 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -289,6 +289,18 @@
             "markers": "python_version < '3.8'",
             "version": "==3.10.0.0"
         },
+        "urwid": {
+            "hashes": [
+                "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae"
+            ],
+            "version": "==2.1.2"
+        },
+        "urwid-readline": {
+            "hashes": [
+                "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4"
+            ],
+            "version": "==0.13"
+        },
         "virtualenv": {
             "hashes": [
                 "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
diff --git a/python/setup.cfg b/python/setup.cfg
index 4fd0c68a5b7..efcda23c48d 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -44,11 +44,18 @@ devel =
     mypy >= 0.770
     pylint >= 2.8.0
     tox >= 3.18.0
+    urwid >= 2.1.2
+    urwid-readline >= 0.13
 
 # Provides qom-fuse functionality
 fuse =
     fusepy >= 2.0.4
 
+# AQMP TUI dependencies
+tui =
+    urwid >= 2.1.2
+    urwid-readline >= 0.13
+
 [options.entry_points]
 console_scripts =
     qom = qemu.qmp.qom:main
@@ -138,6 +145,7 @@ allowlist_externals = make
 deps =
     .[devel]
     .[fuse]  # Workaround to trigger tox venv rebuild
+    .[tui]   # Workaround to trigger tox venv rebuild
 commands =
     make check
 
-- 
2.31.1


