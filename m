Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E536153AC8E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:13:38 +0200 (CEST)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSqg-0006ur-1B
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjD-0000sr-59
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj7-0004xW-No
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h19so3311435edj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZ0spaXG+ECaVxLrM14GTRx0o1J90lFydwVZMShPTl0=;
 b=H+O8yZKm80Z4TnIklJ2QAyS4RTu/o0TZ84RTMOBMk2lV9nbTHoaBXASylFTfBg/dSs
 zqX540B1cq48kuwlOl4tYsq+W8O2EIeLl3GuAdLEMK9S5odCabPD5iiDYQEYDbJ50h9U
 f1nUUvyuWUmlVrP4mjjeup7Pl4e4VhI4jEubFNGkBN+QnTm/h03GBBgY2Eu4b7hJCLi4
 0YlYo73hycZqbVVzIqNQ1c8AOvcVR5v+OaGiq4aTU1/D5mWhcd4mrdp/QET06YPipq7+
 ew69zZAP+3O9pPTmAl3BqLvCN6iXDWbA9MbS/VGYvyeqER5Wsrm2pg53FvnSfreZWdVB
 ohqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZ0spaXG+ECaVxLrM14GTRx0o1J90lFydwVZMShPTl0=;
 b=Da+aJ/nXkadWLSirb9bnfTMu1DrFKm5k7sWH/pgVQxt4amcQOpvEy97uc9JANTWZpM
 jXnkrzYjeH4HRUoHuCy4Fr6i+tjFbwZ3LWJBNCHB750xC/UPMiL0Qd0jmP6u6/hUku6s
 6j/9L5Y/HYRs1mOKeqmnajTrDyxcgzSsRjUja1sOZfEGjrSMihc20hq7qD306K3rk83q
 lVrE2f6Cnh4dFs+LBR1edVn9Ytpv5A/u1J4KegDXmpSuEqHmsg94Z295bvVdb6/9S8gN
 ZbK3NXIk7pVr2UhdPM9sDoOanajC5wpODUoxzFsl5odbzrjvrCD7cWkjnRj8b/kj99qF
 pXaQ==
X-Gm-Message-State: AOAM533MZnQV3ktePY9DJFGo/67I+4h+IgoDf/54OOqLmGarAH32wnCw
 kX3nH+5w6LxcWQR9fC9CVsUiig==
X-Google-Smtp-Source: ABdhPJzElyY1GYMeR9etuDVZVeuOqc0W5AXGqlXgwVXvKGvRT86DYolKCrZfB5RWz+rRgg96Gcmyew==
X-Received: by 2002:a05:6402:2750:b0:42b:2616:7cdb with SMTP id
 z16-20020a056402275000b0042b26167cdbmr1067753edd.306.1654106748337; 
 Wed, 01 Jun 2022 11:05:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090629cc00b006fe0abb00f0sm920453eje.209.2022.06.01.11.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33C0F1FFBD;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/33] tests/lcitool: fix up indentation to correct style
Date: Wed,  1 Jun 2022 19:05:09 +0100
Message-Id: <20220601180537.2329566-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

3 space indentation snuck into the initial commit. Clean it up before
we let it get established. I've also:

  - removed unused os import
  - added double lines between functions
  - added some comments and grouped and sorted the generation stanzas

My lint tool is also recommending using f-strings but that requires
python 3.6.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220527153603.887929-6-alex.bennee@linaro.org>

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index fb49bbc441..dc1fc21ef9 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -13,14 +13,13 @@
 # the top-level directory.
 
 import sys
-import os
 import subprocess
 
 from pathlib import Path
 
 if len(sys.argv) != 1:
-   print("syntax: %s" % sys.argv[0], file=sys.stderr)
-   sys.exit(1)
+    print("syntax: %s" % sys.argv[0], file=sys.stderr)
+    sys.exit(1)
 
 self_dir = Path(__file__).parent
 src_dir = self_dir.parent.parent
@@ -30,76 +29,95 @@ lcitool_path = Path(self_dir, "libvirt-ci", "lcitool")
 
 lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
 
+
 def atomic_write(filename, content):
-   tmp = filename.with_suffix(filename.suffix + ".tmp")
-   try:
-      with tmp.open("w") as fp:
-         print(content, file=fp, end="")
-         tmp.rename(filename)
-   except Exception as ex:
-      tmp.unlink()
-      raise
+    tmp = filename.with_suffix(filename.suffix + ".tmp")
+    try:
+        with tmp.open("w") as fp:
+            print(content, file=fp, end="")
+            tmp.rename(filename)
+    except Exception as ex:
+        tmp.unlink()
+        raise
+
 
 def generate(filename, cmd, trailer):
-   print("Generate %s" % filename)
-   lcitool=subprocess.run(cmd, capture_output=True)
+    print("Generate %s" % filename)
+    lcitool = subprocess.run(cmd, capture_output=True)
 
-   if lcitool.returncode != 0:
-      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+    if lcitool.returncode != 0:
+        raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+
+    content = lcitool.stdout.decode("utf8")
+    if trailer is not None:
+        content += trailer
+    atomic_write(filename, content)
 
-   content = lcitool.stdout.decode("utf8")
-   if trailer is not None:
-      content += trailer
-   atomic_write(filename, content)
 
 def generate_dockerfile(host, target, cross=None, trailer=None):
-   filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
-   cmd = lcitool_cmd + ["dockerfile"]
-   if cross is not None:
-      cmd.extend(["--cross", cross])
-   cmd.extend([target, "qemu"])
-   generate(filename, cmd, trailer)
+    filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
+    cmd = lcitool_cmd + ["dockerfile"]
+    if cross is not None:
+        cmd.extend(["--cross", cross])
+    cmd.extend([target, "qemu"])
+    generate(filename, cmd, trailer)
+
 
 def generate_cirrus(target, trailer=None):
-   filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-   cmd = lcitool_cmd + ["variables", target, "qemu"]
-   generate(filename, cmd, trailer)
+    filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
+    cmd = lcitool_cmd + ["variables", target, "qemu"]
+    generate(filename, cmd, trailer)
+
 
 ubuntu2004_tsanhack = [
-   "# Apply patch https://reviews.llvm.org/D75820\n",
-   "# This is required for TSan in clang-10 to compile with QEMU.\n",
-   "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
+    "# Apply patch https://reviews.llvm.org/D75820\n",
+    "# This is required for TSan in clang-10 to compile with QEMU.\n",
+    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
 ]
 
+
 def debian_cross_build(prefix, targets):
-   conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
-   targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
-   return "".join([conf, targets])
+    conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
+    targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
+    return "".join([conf, targets])
 
+#
+# Update all the various build configurations.
+# Please keep each group sorted alphabetically for easy reading.
+#
 
 try:
-   generate_dockerfile("centos8", "centos-stream-8")
-   generate_dockerfile("fedora", "fedora-35")
-   generate_dockerfile("ubuntu2004", "ubuntu-2004",
-                       trailer="".join(ubuntu2004_tsanhack))
-   generate_dockerfile("opensuse-leap", "opensuse-leap-152")
-   generate_dockerfile("alpine", "alpine-edge")
-
-   generate_dockerfile("debian-arm64-cross", "debian-11",
-                       cross="aarch64",
-                       trailer=debian_cross_build("aarch64-linux-gnu-",
-                                                  "aarch64-softmmu,aarch64-linux-user"))
-
-   generate_dockerfile("debian-s390x-cross", "debian-11",
-                       cross="s390x",
-                       trailer=debian_cross_build("s390x-linux-gnu-",
-                                                  "s390x-softmmu,s390x-linux-user"))
-
-   generate_cirrus("freebsd-12")
-   generate_cirrus("freebsd-13")
-   generate_cirrus("macos-11")
-
-   sys.exit(0)
+    #
+    # Standard native builds
+    #
+    generate_dockerfile("alpine", "alpine-edge")
+    generate_dockerfile("centos8", "centos-stream-8")
+    generate_dockerfile("fedora", "fedora-35")
+    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+    generate_dockerfile("ubuntu2004", "ubuntu-2004",
+                        trailer="".join(ubuntu2004_tsanhack))
+
+    #
+    # Cross compiling builds
+    #
+    generate_dockerfile("debian-arm64-cross", "debian-11",
+                        cross="aarch64",
+                        trailer=debian_cross_build("aarch64-linux-gnu-",
+                                                   "aarch64-softmmu,aarch64-linux-user"))
+
+    generate_dockerfile("debian-s390x-cross", "debian-11",
+                        cross="s390x",
+                        trailer=debian_cross_build("s390x-linux-gnu-",
+                                                   "s390x-softmmu,s390x-linux-user"))
+
+    #
+    # Cirrus packages lists for GitLab
+    #
+    generate_cirrus("freebsd-12")
+    generate_cirrus("freebsd-13")
+    generate_cirrus("macos-11")
+
+    sys.exit(0)
 except Exception as ex:
-   print(str(ex), file=sys.stderr)
-   sys.exit(1)
+    print(str(ex), file=sys.stderr)
+    sys.exit(1)
-- 
2.30.2


