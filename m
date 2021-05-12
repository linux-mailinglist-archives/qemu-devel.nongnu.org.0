Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607837BA14
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:10:18 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lglon-00088n-4M
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lglnq-0007Rz-NB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lglnk-0004r7-6w
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620814149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YZLfAr+YU12OhzcQUPRxWwvOyaQlIe+F0dDKlaE2x+M=;
 b=FDMGYlCB3iOTq/RbGerU3xUwKb0lgK5Ysuk4FkOBf2+WevO22XAnpyp87qhjXNHGPYi9HQ
 kpg+9O0OygmpV8H+iPxVxnp+ioqzQR7icS/QFhR69u6Sf6aGwLp8BrkDJglE8hyMXbcpGt
 56qp6zpOKAHlhbimVi9sXJZf+F14nZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-_5HFL03-PUigtMbO8vyYuA-1; Wed, 12 May 2021 06:09:07 -0400
X-MC-Unique: _5HFL03-PUigtMbO8vyYuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26A25801817
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:09:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D97F15D9D7;
 Wed, 12 May 2021 10:09:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] add Visual Studio Code configuration
Date: Wed, 12 May 2021 06:09:06 -0400
Message-Id: <20210512100906.621504-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: eesposit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configurations to build files with Visual Studio Code and
to retrieve the search path for headers from the compile_commands.json
file.

Using this configuration requires installing the Meson extension and
using a build subdirectory that matches the one configured in the
Meson extension itself.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .vscode/c_cpp_properties.json | 13 +++++++++++++
 .vscode/settings.json         | 11 +++++++++++
 .vscode/tasks.json            | 23 +++++++++++++++++++++++
 scripts/rebuild.py            | 22 ++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 .vscode/c_cpp_properties.json
 create mode 100644 .vscode/settings.json
 create mode 100644 .vscode/tasks.json
 create mode 100755 scripts/rebuild.py

diff --git a/.vscode/c_cpp_properties.json b/.vscode/c_cpp_properties.json
new file mode 100644
index 0000000000..43f5fc1b4d
--- /dev/null
+++ b/.vscode/c_cpp_properties.json
@@ -0,0 +1,13 @@
+{
+    "configurations": [
+        {
+            "name": "qemu",
+            "includePath": [ "${default}", "${workspaceFolder}/linux-headers/**", "${workspaceFolder}/include/**", "${workspaceFolder}/+build/**"],
+            "compileCommands": "${workspaceFolder}/${config:mesonbuild.buildFolder}/compile_commands.json",
+            "intelliSenseMode": "linux-gcc-x64",
+            "cStandard": "c11",
+            "cppStandard": "c++14"
+        }
+    ],
+    "version": 4
+}
diff --git a/.vscode/settings.json b/.vscode/settings.json
new file mode 100644
index 0000000000..efbbb4f88b
--- /dev/null
+++ b/.vscode/settings.json
@@ -0,0 +1,11 @@
+{
+	"files.associations": {
+		"*.mak": "makefile",
+		"*.c.inc": "c",
+		"*.h.inc": "c",
+		"*.json": "python",
+		"*.rst.inc": "restructuredtext",
+		"*.vert": "glsl",
+		"*.frag": "glsl"
+	}
+}
diff --git a/.vscode/tasks.json b/.vscode/tasks.json
new file mode 100644
index 0000000000..362821043e
--- /dev/null
+++ b/.vscode/tasks.json
@@ -0,0 +1,23 @@
+{
+	"version": "2.0.0",
+	"tasks": [
+		{
+			"type": "cppbuild",
+			"label": "C/C++: build active file with compile_commands.json",
+			"command": "python3",
+			"args": [
+				"${workspaceFolder}/scripts/rebuild.py", "${file}"
+			],
+			"options": {
+				"cwd": "${workspaceFolder}/${config:mesonbuild.buildFolder}"
+			},
+			"problemMatcher": [
+				"$gcc"
+			],
+			"group": {
+				"kind": "build",
+				"isDefault": true
+			}
+		}
+	]
+}
diff --git a/scripts/rebuild.py b/scripts/rebuild.py
new file mode 100755
index 0000000000..e35e08f42d
--- /dev/null
+++ b/scripts/rebuild.py
@@ -0,0 +1,22 @@
+#! /usr/bin/env python3
+#
+# Author: Paolo Bonzini <pbonzini@redhat.com>
+#
+# This program compiles the input files using commands from the
+# compile_commands.json file.  (Unlike Make/ninja, the _source_
+# file is passed to the program rather than the targe).  It is
+# mostly intended to be called from editors.
+
+import os
+import sys
+import json
+
+with open('compile_commands.json') as f:
+    cc_json = json.load(f)
+
+paths = set((os.path.relpath(i) for i in sys.argv[1:]))
+for i in cc_json:
+    if i['file'] in paths:
+        os.chdir(i['directory'])
+        print(i['command'])
+        os.system(i['command'])
-- 
2.26.2


