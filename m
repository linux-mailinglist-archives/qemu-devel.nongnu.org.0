Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E202628879A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 13:11:16 +0200 (CEST)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQqIt-0005Iu-Uw
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 07:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQqGE-0003Is-GJ; Fri, 09 Oct 2020 07:08:30 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQqGB-000804-Jp; Fri, 09 Oct 2020 07:08:30 -0400
Received: by mail-pl1-x630.google.com with SMTP id w21so1536441plq.3;
 Fri, 09 Oct 2020 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mg39he2ihF2KQD3pRXZcx4vq8zLMJm3/bTiO7l/IBtU=;
 b=sbscYl1NY5AN15fOCMYUWrgARkHe5gayj2EI250AU8vtLOkEdistaIoosslq/FQPho
 reDUBfTAIXNaO+3GlFnvjuNd0F42KHsiexfg/hxtlYogx7kVjD7DTaX2BYThHMwtqRC/
 F4dMCfGV48K8UnjWvG5sCqnlPOBuSOdF5DIuR+q1BW+SUEFnI+rvZG0Ls6ye6jEXvtLa
 HJFVVzhfpR5PqtalV1ZrcE4gHoLxwafqkWGl+ZuKvP/o5RLfHBCcUWoctkGs9ku9t8U5
 1TuflaRfvpzbosxrlFN7urghfHaK90G+1RnTqfFsFcMs+rMTrJSbdziOKZO6KYepRYPU
 F6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mg39he2ihF2KQD3pRXZcx4vq8zLMJm3/bTiO7l/IBtU=;
 b=hphTXTQZXLD3iURmFzDkm8PVRIOP3eZ3orZ59E/HBoyJ8kflFO7Pu6MlU7VVYufdH+
 yqUKzDomtOsHNuD43EGDPbhsctzNo7W4nKHE5vXgSHDQXzZc2FDE+C9Lf4z9G4Dru5S5
 jLCvBjhfxtgQjC/+Ou6b13BTjO8bLf251V+4v2kEHS+Y3dWhg3jsMybqkbPZ7ljBgL5z
 e3fhLTYo8HPQnhtYuCNN201yTGlGS/KTN2gFbsCNYE22ee9h7omF+hieXrU1n0g/v02D
 gS7JGBgiII2YfrOzBRi/kpi7NxKc1wWs4FWztPnRla0e7LQhQfXsyjZx4fEWSOMRxzBB
 UaOQ==
X-Gm-Message-State: AOAM533iopcaWuPN+BJdCfUpD9UAC5uIY5wxvekbYGuBncfkGasU8Ngu
 di1fuUmOjNfiSPtm0oa1tWqsjrrIkxLbmuY3
X-Google-Smtp-Source: ABdhPJxU/W5DT/QbVGrMYJYxKqoOc1nN+RzrSIXFKpRmP2imzrf6c+ENvvm6/j3fq7GrvcBBW8k2/Q==
X-Received: by 2002:a17:902:b402:b029:d3:db79:c019 with SMTP id
 x2-20020a170902b402b02900d3db79c019mr11893997plr.82.1602241705467; 
 Fri, 09 Oct 2020 04:08:25 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id v1sm2619462pjt.2.2020.10.09.04.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 04:08:24 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/4] docs: Fixes build docs on msys2/mingw
Date: Fri,  9 Oct 2020 19:07:59 +0800
Message-Id: <20201009110800.432-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201009110800.432-1-luoyonggang@gmail.com>
References: <20201009110800.432-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 docs/conf.py                  |  2 +-
 docs/sphinx/kerneldoc.py      |  2 +-
 scripts/rst-sanitize.py       | 21 +++++++++++++++++++++
 tests/qapi-schema/meson.build |  5 +++--
 4 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 scripts/rst-sanitize.py

diff --git a/docs/conf.py b/docs/conf.py
index 00e1b750e2..e584f68393 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -241,7 +241,7 @@ texinfo_documents = [
 # We use paths starting from qemu_docdir here so that you can run
 # sphinx-build from anywhere and the kerneldoc extension can still
 # find everything.
-kerneldoc_bin = os.path.join(qemu_docdir, '../scripts/kernel-doc')
+kerneldoc_bin = ['perl', os.path.join(qemu_docdir, '../scripts/kernel-doc')]
 kerneldoc_srctree = os.path.join(qemu_docdir, '..')
 hxtool_srctree = os.path.join(qemu_docdir, '..')
 qapidoc_srctree = os.path.join(qemu_docdir, '..')
diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index 3e87940206..3ac277d162 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -67,7 +67,7 @@ class KernelDocDirective(Directive):
 
     def run(self):
         env = self.state.document.settings.env
-        cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
+        cmd = env.config.kerneldoc_bin + ['-rst', '-enable-lineno']
 
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []
diff --git a/scripts/rst-sanitize.py b/scripts/rst-sanitize.py
new file mode 100644
index 0000000000..26060f1208
--- /dev/null
+++ b/scripts/rst-sanitize.py
@@ -0,0 +1,21 @@
+#!/usr/bin/env python3
+
+#
+# Script for remove cr line ending in file
+#
+# Authors:
+#  Yonggang Luo <luoyonggang@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or, at your option, any later version.  See the COPYING file in
+# the top-level directory.
+
+import sys
+
+def main(_program, file, *unused):
+    with open(file, 'rb') as content_file:
+        content = content_file.read()
+        sys.stdout.buffer.write(content.replace(b'\r', b''))
+
+if __name__ == "__main__":
+    main(*sys.argv)
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index f08c902911..a6832634b3 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -250,18 +250,19 @@ qapi_doc_out = custom_target('QAPI rST doc',
 # using an explicit '\' character in the command arguments to
 # a custom_target(), as Meson will unhelpfully replace it with a '/'
 # (https://github.com/mesonbuild/meson/issues/1564)
+rst_sanitize_cmd = [find_program('../../scripts/rst-sanitize.py'), '@INPUT@']
 qapi_doc_out_nocr = custom_target('QAPI rST doc newline-sanitized',
                                   output: ['doc-good.txt.nocr'],
                                   input: qapi_doc_out[0],
                                   build_by_default: build_docs,
-                                  command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                  command: rst_sanitize_cmd,
                                   capture: true)
 
 qapi_doc_ref_nocr = custom_target('QAPI rST doc reference newline-sanitized',
                                   output: ['doc-good.ref.nocr'],
                                   input: files('doc-good.txt'),
                                   build_by_default: build_docs,
-                                  command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                  command: rst_sanitize_cmd,
                                   capture: true)
 
 if build_docs
-- 
2.28.0.windows.1


