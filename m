Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78637BA52
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:27:26 +0200 (CEST)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm5N-00038m-Hy
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzB-0003DT-6l
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz8-0003VM-77
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1111891wmy.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+W6vzYOHSyrjetzgB57V0E/SW7N0nADhYjK0hwWdl18=;
 b=aQ+5Uk+RP9Lsj/h5jiNwXSsaLhsnSJuM0jsevcqTAmRf0VC6t2O95R7pvR8fchp45P
 p9flr9ZMDgQjp4v+3w8BnJLcaUopapdPq4/gUwR44eOG7ptmPWIctinj9ntTIHTKtik1
 l0LgC2cUOraYEedxpy9bk29K4J72KleWm4RLW+fBkddJC6eyEkxAgxdxd5gRJSBzG2EK
 yLN9aPdYauPoEIfkT21aTdUJGmx0eBScNRXNcz8Ko3EtnFRX45pVOHsal4xABm5n3cx2
 UvVe4o8Wtfop6hwXc6l8YuX7d6S5At5ddiZZd2UQOFJvggZW9w+G4R8cIWiv2DHePrBD
 9tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W6vzYOHSyrjetzgB57V0E/SW7N0nADhYjK0hwWdl18=;
 b=sylhHKZ/i/qGNapf+a4henhJCudDdasuHzysV4A1rlycRqFHOOdvwbggtfYkcmC7IW
 bKAE+awNzDxm7W3YGZfEiSWR5Ljpe7OqVmy7DGKwA2I9z/6K7DqTlMdZgUFY2kYcQT39
 4qL3XFzwS4JhMnOTuDYFsA2LikWvCUq0sx/svpMzX5JWGaFeo8uGMDVEKGLMnrL0BtZX
 EtLC2+a/KmnVdjGoNCTH+I3zC7Dx45TgWNWFbONsr7O8ZBAUKC0vrh7MDnv9rCG93LI1
 capj1Zk9Z2kvnF4o1vJQbjiI1utQVmbYIdKRtjOHogsCo5Fj6M1d9lNxoz9SIFf4kcIa
 MYWg==
X-Gm-Message-State: AOAM532ECrLeaF2+2XO0bYTlA08NuvJu9aLmutUf4QwW6+QHxT+vG40X
 75IHHmJR9fRfpAAzmdQXCpfvEfRSKcHdtw==
X-Google-Smtp-Source: ABdhPJz8+ZgbFhrQ5Q3oRwkWBZc9rWVrJ0ycaCgx42PWdcZv5J5xY3KaZZhrbQ6cGvXBuJ2IxtT5GA==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr10552406wmi.26.1620814856821; 
 Wed, 12 May 2021 03:20:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm953072wrn.69.2021.05.12.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6849C1FF8F;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/31] tests/docker: make executable an optional argument
 to "update"
Date: Wed, 12 May 2021 11:20:23 +0100
Message-Id: <20210512102051.12134-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


