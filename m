Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B918A1D6D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 16:42:53 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3LdT-0004xt-Mw
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 10:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i3LcF-0004Yc-3a
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 10:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i3LcD-0001QE-MJ
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 10:41:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i3LcD-0001Of-FE
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 10:41:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id y135so2235210wmc.1
 for <qemu-devel@nongnu.org>; Thu, 29 Aug 2019 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MkUUiHNi/V+ZSI721KImT4VbYLQNe8mvaERHRh/XulI=;
 b=qek6ysllYi7gIGSaUg/7OtqdYrNk9PDyTEFRS2+fL/wrJnlTDHOm0v4YQdoL72VU+n
 4H0h7oK+dKJ3pbYVAVdFNfXTZgj7z2XCQclLlD0URbarNiJ6VpEvydv4b3jMdNB2Nv6X
 Hz+5lrnNvl/4Syicqd0JaZp7Akeq4ubgwMSCfGmQenAsGdAvS5W4SMWxoKqBMhiWmIZj
 KQehqn3aTV9D3nex8A18wymg08oTMsaVNlbZNWOYitChCXE5Io0CE89z5t1W2dukt1/B
 eI8VCw/MoVh8dKJJ2BaRt4z+GLIxa1Y/7NKnBjo70dxbh++HqVLZGdjS7FWGEL82307C
 zDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MkUUiHNi/V+ZSI721KImT4VbYLQNe8mvaERHRh/XulI=;
 b=ufjDVM0GHhNCI8Ff0wCQrqtNsHFcXxHdbgcuWHF/pkOveYXyPBarHWWAWr448T548h
 ucRMoej6TDKsOXE/7lMjSkhfptkBLw28SwbcWuexeivwWXwTondamTWy3krwyhb6YYih
 /8O302Fz7ecw9q/7dH6gan4bEi6/av5Q1o+C9FsZffVzE/XyO6jSahn8gnNuU8yRX2dA
 eTBhR22ZgsOR5k39PsPj+WnWEmmrmg0nvSpPOQSzqqR9GhYVYwXPtG0YZjoWrqTVC7JS
 6w1DAdlZfk4h8HxOCAQG4cTW+Odo9Mt5gke285WmjrSdxQ0N6EfdoSKRteeqxY6CsVbt
 iv2g==
X-Gm-Message-State: APjAAAVeZXB8SsH5mTuk5aXlc8gDuljlUYwaWaG6ULZ6mzSqMfPBveRq
 VfCxjA2E6A2yuhXrUjTKTIYlAQ==
X-Google-Smtp-Source: APXvYqzje/X5GV8MtB1Vz19YZPwThycmKR6Ow1EKniOPzIa0OQDLtvRS8Q5l32zHHQzNXfkcEfy8aA==
X-Received: by 2002:a1c:be11:: with SMTP id o17mr11936645wmf.115.1567089691476; 
 Thu, 29 Aug 2019 07:41:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c201sm5779984wmd.33.2019.08.29.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:41:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38E591FF87;
 Thu, 29 Aug 2019 15:41:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 15:41:20 +0100
Message-Id: <20190829144120.12701-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
Subject: [Qemu-devel] [PATCH] tests/docker: upgrade docker.py to python3
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
Cc: Fam Zheng <fam@euphon.net>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recent podman changes (9459f754134bb) imported enum which is part
of the python3 standard library but only available as an external
library for python2. This causes problems on the fairly restricted
environment such as shippable. Lets bite the bullet and make the
script a fully python3 one. To that end:

  - drop the from __future__ import (we are there now ;-)
  - avoid the StringIO import hack
  - be consistent with the mode we read/write dockerfiles
  - s/iteritems/items/
  - ensure check_output returns strings for processing

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/docker/docker.py | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index ac5baab4cad..4bba29e104e 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2
+#!/usr/bin/env python3
 #
 # Docker controlling module
 #
@@ -11,7 +11,6 @@
 # or (at your option) any later version. See the COPYING file in
 # the top-level directory.
 
-from __future__ import print_function
 import os
 import sys
 import subprocess
@@ -25,10 +24,7 @@ import tempfile
 import re
 import signal
 from tarfile import TarFile, TarInfo
-try:
-    from StringIO import StringIO
-except ImportError:
-    from io import StringIO
+from io import StringIO
 from shutil import copy, rmtree
 from pwd import getpwuid
 from datetime import datetime, timedelta
@@ -62,11 +58,13 @@ USE_ENGINE = EngineEnum.AUTO
 
 def _text_checksum(text):
     """Calculate a digest string unique to the text content"""
-    return hashlib.sha1(text).hexdigest()
+    return hashlib.sha1(text.encode('utf-8')).hexdigest()
 
+def _read_dockerfile(path):
+    return open(path, 'rt', encoding='utf-8').read()
 
 def _file_checksum(filename):
-    return _text_checksum(open(filename, 'rb').read())
+    return _text_checksum(_read_dockerfile(filename))
 
 
 def _guess_engine_command():
@@ -192,7 +190,7 @@ def _read_qemu_dockerfile(img_name):
 
     df = os.path.join(os.path.dirname(__file__), "dockerfiles",
                       img_name + ".docker")
-    return open(df, "r").read()
+    return _read_dockerfile(df)
 
 
 def _dockerfile_preprocess(df):
@@ -262,6 +260,7 @@ class Docker(object):
     def _output(self, cmd, **kwargs):
         return subprocess.check_output(self._command + cmd,
                                        stderr=subprocess.STDOUT,
+                                       encoding='utf-8',
                                        **kwargs)
 
     def inspect_tag(self, tag):
@@ -283,7 +282,9 @@ class Docker(object):
         if argv is None:
             argv = []
 
-        tmp_df = tempfile.NamedTemporaryFile(dir=docker_dir, suffix=".docker")
+        tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
+                                             encoding='utf-8',
+                                             dir=docker_dir, suffix=".docker")
         tmp_df.write(dockerfile)
 
         if user:
@@ -396,7 +397,7 @@ class BuildCommand(SubCommand):
                             help="Dockerfile name")
 
     def run(self, args, argv):
-        dockerfile = open(args.dockerfile, "rb").read()
+        dockerfile = _read_dockerfile(args.dockerfile)
         tag = args.tag
 
         dkr = Docker()
@@ -442,7 +443,7 @@ class BuildCommand(SubCommand):
                 cksum += [(filename, _file_checksum(filename))]
 
             argv += ["--build-arg=" + k.lower() + "=" + v
-                     for k, v in os.environ.iteritems()
+                     for k, v in os.environ.items()
                      if k.lower() in FILTERED_ENV_NAMES]
             dkr.build_image(tag, docker_dir, dockerfile,
                             quiet=args.quiet, user=args.user, argv=argv,
@@ -611,7 +612,7 @@ class CheckCommand(SubCommand):
                 print("Need a dockerfile for tag:%s" % (tag))
                 return 1
 
-            dockerfile = open(args.dockerfile, "rb").read()
+            dockerfile = _read_dockerfile(args.dockerfile)
 
             if dkr.image_matches_dockerfile(tag, dockerfile):
                 if not args.quiet:
-- 
2.20.1


