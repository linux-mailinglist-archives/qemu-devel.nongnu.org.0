Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0C372871
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:07:42 +0200 (CEST)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrxt-0007Om-Cd
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsw-0002QO-TK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsv-00036K-2L
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id i128so3014490wma.5
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+W6vzYOHSyrjetzgB57V0E/SW7N0nADhYjK0hwWdl18=;
 b=rupX56Q/KY3gf4lVD3LsZ/aWo6mKUWKKoHDy/fGVL1XdYtqU5Pcw69pPuSI3lXY8Et
 6kwJgIPYLiYO40KU/w0BZWONYClixQBqmIu+81hQN0eNz8PQOLU5ia8fX5gEb7XjoxVu
 o52LaJUBj0+Xg58BaGy4Gv1pu9HioY33/bPXs/vB9Bs1iK/WkOudktlft4ymNrizCdQR
 d5WVL0IFkUngyQ30KohDOoi4WtTd39de8PvqZYgRJlCU06B9ifYsf4YsGuPIyKAb7IZM
 vE/buOoxEdsCOkJvNZL86TesTu7ON0sM2WHWqIengmI+LpMAGA3lIpIR+UWAlmcqsU+u
 hkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W6vzYOHSyrjetzgB57V0E/SW7N0nADhYjK0hwWdl18=;
 b=r/6IvhxQZYa0cXlNzLYdWptf9ymWPxfgUZ1HcG2yPXI+4eVMWkijgD+D851HIJfebU
 GvRMKn7KU23t71E3UoH3xU0fyoF0tYo9rfvik8nQxwa7yvm//1Df1fLulRryfO6j+Ite
 BGo3ODqsZTyRIcAzUUvcRC8TOMKziJLF74+pD7zYS/oBMnTwXWezKvjFDUd4okLRfAAi
 wJYvLTQsMd3SwwSPJ+SMe2XU+X5HjmWk7KlrAl/6ioGE90DiV9uNdel+UlBOYDPbnVp8
 xLNxWRREolqgJU+hw5eAyjnfQWLTDnHVRRyz2H8MfpG+IrFXJ9kDsLknT1TtmkPof1MR
 W+hw==
X-Gm-Message-State: AOAM5333yFW2e+EHYtmvwUISKojshKaPU3QSjPcFq2toJYNtrVD5F50T
 /9i4f3vgNEVMzgnINadNJEVSyA==
X-Google-Smtp-Source: ABdhPJymKz570enoxm0iGav0eUxM6Yw5Y1VmEX/meG7jtndjfurlyk0DdFqDKszVYS1g51LvZOItUw==
X-Received: by 2002:a1c:6754:: with SMTP id b81mr25813804wmc.16.1620122551716; 
 Tue, 04 May 2021 03:02:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm2011739wrr.27.2021.05.04.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6E291FF8F;
 Tue,  4 May 2021 11:02:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/30] tests/docker: make executable an optional argument
 to "update"
Date: Tue,  4 May 2021 11:01:56 +0100
Message-Id: <20210504100223.25427-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to extend the abilities of the command shortly.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fix indention issue
---
 tests/docker/Makefile.include |  2 +-
 tests/docker/docker.py        | 56 ++++++++++++++++++-----------------
 2 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9f464cb92c..820423d718 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -248,7 +248,7 @@ docker-run: docker-qemu-src
 	$(if $(EXECUTABLE),						\
 		$(call quiet-command,					\
 			$(DOCKER_SCRIPT) update 			\
-			$(IMAGE) $(EXECUTABLE),				\
+			$(IMAGE) --executable $(EXECUTABLE),		\
 			"  COPYING $(EXECUTABLE) to $(IMAGE)"))
 	$(call quiet-command,						\
 		$(DOCKER_SCRIPT) run 					\
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 0435a55d10..9b3425fec2 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -523,7 +523,7 @@ class UpdateCommand(SubCommand):
     def args(self, parser):
         parser.add_argument("tag",
                             help="Image Tag")
-        parser.add_argument("executable",
+        parser.add_argument("--executable",
                             help="Executable to copy")
 
     def run(self, args, argv):
@@ -532,35 +532,37 @@ def run(self, args, argv):
         tmp = tempfile.NamedTemporaryFile(suffix="dckr.tar.gz")
         tmp_tar = TarFile(fileobj=tmp, mode='w')
 
-        # Add the executable to the tarball, using the current
-        # configured binfmt_misc path. If we don't get a path then we
-        # only need the support libraries copied
-        ff, enabled = _check_binfmt_misc(args.executable)
-
-        if not enabled:
-            print("binfmt_misc not enabled, update disabled")
-            return 1
-
-        if ff:
-            tmp_tar.add(args.executable, arcname=ff)
-
-        # Add any associated libraries
-        libs = _get_so_libs(args.executable)
-        if libs:
-            for l in libs:
-                so_path = os.path.dirname(l)
-                name = os.path.basename(l)
-                real_l = os.path.realpath(l)
-                try:
-                    tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
-                except FileNotFoundError:
-                    print("Couldn't add %s/%s to archive" % (so_path, name))
-                    pass
-
         # Create a Docker buildfile
         df = StringIO()
         df.write(u"FROM %s\n" % args.tag)
-        df.write(u"ADD . /\n")
+
+        if args.executable:
+            # Add the executable to the tarball, using the current
+            # configured binfmt_misc path. If we don't get a path then we
+            # only need the support libraries copied
+            ff, enabled = _check_binfmt_misc(args.executable)
+
+            if not enabled:
+                print("binfmt_misc not enabled, update disabled")
+                return 1
+
+            if ff:
+                tmp_tar.add(args.executable, arcname=ff)
+
+            # Add any associated libraries
+            libs = _get_so_libs(args.executable)
+            if libs:
+                for l in libs:
+                    so_path = os.path.dirname(l)
+                    name = os.path.basename(l)
+                    real_l = os.path.realpath(l)
+                    try:
+                        tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                    except FileNotFoundError:
+                        print("Couldn't add %s/%s to archive" % (so_path, name))
+                        pass
+
+            df.write(u"ADD . /\n")
 
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
-- 
2.20.1


