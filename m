Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A838A9412
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 22:48:04 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5cCA-0007Rx-6C
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 16:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5bvA-00088U-GW
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5bv7-0006cV-Mn
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:30:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5bv7-0006Uz-9M
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:30:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id j16so172866wrr.8
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 13:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYE0JvmioF/SVJQvbt4Vg7Xaut4G5ofPLByE28uKiMg=;
 b=Zsdavo1pSxDtO+V87pEQHBL1uCkXkXPP1Sz8C2qM6aXk7Hj7ZwdgBEjFK02nNGNmi8
 8UbYRtsCt539rtsgVBPpHpUDonpKYzOxF+BPaSn/s5ES2SUKkJU6BLstV9ERHo1drR6u
 O7KeRZyw3IlyI2UyzvK8fB+AgLX+JCjO3mL5Jj29+4s/JoHCuM5G2BsV1/743g1Q0Bsi
 qWMBdKTEhImqy4Gbiny3Z2iMYAz+bQzvObhwMaD+0GLPxcSzgrrcYBUyH4i/gwxFPMEr
 MaziW9g85Ja3WpJdXv31Fef3vYDATnfsGhslScaRaJPaV59l/3kj49fhhtmjX14vQrFw
 xyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYE0JvmioF/SVJQvbt4Vg7Xaut4G5ofPLByE28uKiMg=;
 b=PrpX3gmtayyNpznIhJuMlDXwUbpG3Ql+Wzn4ioW7l6YQ0AqfpHet2qmEsXLt8sZjGC
 zXL+VtcDx0+zlY16pnKvcf9dkAauiB2/HqkSacyXEzQoBzFMNGWPP04zlK1qTgZEGC1T
 rYR9RQkItNdLGbhEiLa+VR0AD11TzuaUWWeUnTfwjNtxgW/zLlgJcRpN/o2GYg+o6Qqz
 25pF5ocfcuMnzFf0sISeM9waTFGAEsiZq/UBx7pReDl/qiXAvp6qHdF3kBOMsIud2Iza
 KGpp/QUcErSghxEGGjzSqWWoaEsjBJV1qGkeMbosFkJVA94wB9jX2wNMP5FnlcXxwEE2
 z4vw==
X-Gm-Message-State: APjAAAXIVRrlwTKJRAWXWmhQUmxutlj62szlo4myCBxzEPZO4NvKJTAk
 ZXDOKdtQEnxr4LXAN/L6Q5MTQg==
X-Google-Smtp-Source: APXvYqxoh0Gm3KIOek5/67/QRPhF7eew9UvQFaOUr12NjwDLsF7TQO+pm/ThkFaDu4npRJexUIK8ZA==
X-Received: by 2002:a5d:6911:: with SMTP id t17mr49479318wru.255.1567629017296; 
 Wed, 04 Sep 2019 13:30:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm4891101wrg.65.2019.09.04.13.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A9C81FF90;
 Wed,  4 Sep 2019 21:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 21:29:34 +0100
Message-Id: <20190904203013.9028-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-devel] [PATCH v1 03/42] tests/docker: fix "cc" command to
 work with podman
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Podman requires a little bit of additional magic to the uid mapping
which was already done for the normal RunCommand. We simplify the
logic by pushing it directly into the Docker::run method to avoid
instantiating an extra Docker() object and ensure the CC command
always runs as the current user.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py     | 30 +++++++++++++++---------------
 tests/tcg/Makefile.include |  2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index e23209f71ee..8f391eb278b 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -318,10 +318,20 @@ class Docker(object):
             return False
         return checksum == _text_checksum(_dockerfile_preprocess(dockerfile))
 
-    def run(self, cmd, keep, quiet):
+    def run(self, cmd, keep, quiet, as_user=False):
         label = uuid.uuid1().hex
         if not keep:
             self._instances.append(label)
+
+        if as_user:
+            uid = os.getuid()
+            cmd = [ "-u", str(uid) ] + cmd
+            # podman requires a bit more fiddling
+            if self._command[0] == "podman":
+                cmd = [ "--uidmap", "%d:0:1" % uid,
+                        "--uidmap", "0:1:%d" % uid,
+                        "--uidmap", "%d:%d:64536" % (uid + 1, uid + 1)] + cmd
+
         ret = self._do_check(["run", "--label",
                              "com.qemu.instance.uuid=" + label] + cmd,
                              quiet=quiet)
@@ -364,15 +374,8 @@ class RunCommand(SubCommand):
                             help="Run container using the current user's uid")
 
     def run(self, args, argv):
-        if args.run_as_current_user:
-            uid = os.getuid()
-            argv = [ "-u", str(uid) ] + argv
-            docker = Docker()
-            if docker._command[0] == "podman":
-                argv = [ "--uidmap", "%d:0:1" % uid,
-                         "--uidmap", "0:1:%d" % uid,
-                         "--uidmap", "%d:%d:64536" % (uid + 1, uid + 1)] + argv
-        return Docker().run(argv, args.keep, quiet=args.quiet)
+        return Docker().run(argv, args.keep, quiet=args.quiet,
+                            as_user=args.run_as_current_user)
 
 
 class BuildCommand(SubCommand):
@@ -556,8 +559,6 @@ class CcCommand(SubCommand):
                             help="The docker image in which to run cc")
         parser.add_argument("--cc", default="cc",
                             help="The compiler executable to call")
-        parser.add_argument("--user",
-                            help="The user-id to run under")
         parser.add_argument("--source-path", "-s", nargs="*", dest="paths",
                             help="""Extra paths to (ro) mount into container for
                             reading sources""")
@@ -571,11 +572,10 @@ class CcCommand(SubCommand):
         if args.paths:
             for p in args.paths:
                 cmd += ["-v", "%s:%s:ro,z" % (p, p)]
-        if args.user:
-            cmd += ["-u", args.user]
         cmd += [args.image, args.cc]
         cmd += argv
-        return Docker().command("run", cmd, args.quiet)
+        return Docker().run(cmd, False, quiet=args.quiet,
+                            as_user=True)
 
 
 class CheckCommand(SubCommand):
diff --git a/tests/tcg/Makefile.include b/tests/tcg/Makefile.include
index 73b5626fc5f..210f8428237 100644
--- a/tests/tcg/Makefile.include
+++ b/tests/tcg/Makefile.include
@@ -41,7 +41,7 @@ ifneq ($(DOCKER_IMAGE),)
 # We also need the Docker make rules to depend on
 include $(SRC_PATH)/tests/docker/Makefile.include
 
-DOCKER_COMPILE_CMD="$(DOCKER_SCRIPT) cc --user $(shell id -u) \
+DOCKER_COMPILE_CMD="$(DOCKER_SCRIPT) cc \
 		--cc $(DOCKER_CROSS_COMPILER) \
 		-i qemu:$(DOCKER_IMAGE) \
 		-s $(SRC_PATH) -- "
-- 
2.20.1


