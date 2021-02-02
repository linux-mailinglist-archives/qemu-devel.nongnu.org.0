Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45630C007
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:49:02 +0100 (CET)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w3B-0003hC-3v
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuk-0003Z4-1v
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:18 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuf-0007Fo-ES
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id b3so2372072wrj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/l3rZk8GOIQaj/zcskGUMbwB8AQ01WgfPICmp322OI=;
 b=VUjtQCsj7xSH2D5ZxOypbaGX+DCqils7sf7cu2OxZjK3Cj+aEplqfGwynFU00X72RC
 IngHJHxaYBOFxb05qdv5ned4nTyYLmP5xpgKQDWtn7yHUsu1fWd8O2vfUZUGxF8HXvks
 IUinTp3aShjITyJvAr68d3/QxSiGTnG++9yya4COYthLCv99ssdh7LKxhiHqexVt5KlE
 By/BoPQaVRb3zjpHJHe3O6DgqKgheSFreREkBwxTyXDndAoYFSc8krJ6h9u8zH2h161l
 jUQSkTm+njPKSYh9L0k4d8U0jBNO0FHs1TphKgTmyBn9P2FOlOoP58UUAhSzBcY12yZ8
 FAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/l3rZk8GOIQaj/zcskGUMbwB8AQ01WgfPICmp322OI=;
 b=I7Yfq0jaaH71/ZrsPcb5o9zFLu5BsBo/h2pKhmI4Kvf8SKB80I5ypkLQBa2EJGIaNz
 IOjbeHTZ3f70l62xKrnCZJicvceGhyRcaFa547AokVCwAnpn8rOtVqH7iOG3aeB2bB4e
 0x3ruqpfjqWW0I2+CDMrGpplnI6MM/vMNdf9wgKIp0bioERBaE5Ku2c7WCBxQSdbyb2E
 4oTEwiC5QfAG0koRsIKFFgSnSeklOrTF8vMFCr73CuIZx/9f25MHdS4h4gzrLRqtON7r
 ALCF8tFYiOHRusNWXBFHboaISA9YTok+hCD/OeXkLe2HVnQ+S6FozYYoGoY0ioffYZ74
 xVyA==
X-Gm-Message-State: AOAM530xgU0GTyw8YfHA9ZOlGHO94RrvR6/iUn/iasDVQFzPZPCaUwFa
 Jsux/RtJSLVv11oie6t9zoG7DpN8IY+C3VSc
X-Google-Smtp-Source: ABdhPJzPf/uiG5f/1tS8E91IbiigY69x1GPSSHdu4A/F83RN8pmr6HGApcwWDRxmpTlUzuOyN3NO/w==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr17311031wrr.198.1612273212106; 
 Tue, 02 Feb 2021 05:40:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i18sm23889386wrn.29.2021.02.02.05.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B7F91FF92;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/15] tests/docker: add a docker-exec-copy-test
Date: Tue,  2 Feb 2021 13:39:51 +0000
Message-Id: <20210202134001.25738-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides test machinery for checking the QEMU copying logic works
properly. It takes considerably less time to run than starting a
debootstrap only for it to fail later. I considered adding a remove
command to docker.py but figured that might be gold plating given the
relative size of the containers compared to the ones with actual stuff
in them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include         | 20 +++++++++++++++++++-
 tests/docker/docker.py                |  7 ++++++-
 tests/docker/dockerfiles/empty.docker |  8 ++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 tests/docker/dockerfiles/empty.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index a5c1e4a615..93b29ad823 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -11,7 +11,7 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap
+DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap empty
 DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
@@ -92,6 +92,24 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
 			"CHECK", "debian-$* exists"))
 
+# These are test targets
+USER_TCG_TARGETS=$(patsubst %-linux-user,qemu-%,$(filter %-linux-user,$(TARGET_DIRS)))
+EXEC_COPY_TESTS=$(patsubst %,docker-exec-copy-test-%, $(USER_TCG_TARGETS))
+
+$(EXEC_COPY_TESTS): docker-exec-copy-test-%: $(DOCKER_FILES_DIR)/empty.docker
+	$(call quiet-command,							\
+		$(DOCKER_SCRIPT) build -t qemu/exec-copy-test-$* -f $< 		\
+			$(if $V,,--quiet) --no-cache 				\
+			--include-executable=$*					\
+			--skip-binfmt,						\
+			"TEST","copy $* to container")
+	$(call quiet-command,							\
+		$(DOCKER_SCRIPT) run qemu/exec-copy-test-$* 			\
+			/$* -version > tests/docker-exec-copy-test-$*.out,	\
+			"TEST","check $* works in container")
+
+docker-exec-copy-test: $(EXEC_COPY_TESTS)
+
 endif
 
 # Enforce dependencies for composite images
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 39da3fefcf..d28df4c140 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -438,6 +438,9 @@ class BuildCommand(SubCommand):
                             help="""Specify a binary that will be copied to the
                             container together with all its dependent
                             libraries""")
+        parser.add_argument("--skip-binfmt",
+                            action="store_true",
+                            help="""Skip binfmt entry check (used for testing)""")
         parser.add_argument("--extra-files", nargs='*',
                             help="""Specify files that will be copied in the
                             Docker image, fulfilling the ADD directive from the
@@ -466,7 +469,9 @@ class BuildCommand(SubCommand):
             docker_dir = tempfile.mkdtemp(prefix="docker_build")
 
             # Validate binfmt_misc will work
-            if args.include_executable:
+            if args.skip_binfmt:
+                qpath = args.include_executable
+            elif args.include_executable:
                 qpath, enabled = _check_binfmt_misc(args.include_executable)
                 if not enabled:
                     return 1
diff --git a/tests/docker/dockerfiles/empty.docker b/tests/docker/dockerfiles/empty.docker
new file mode 100644
index 0000000000..9ba980f1a8
--- /dev/null
+++ b/tests/docker/dockerfiles/empty.docker
@@ -0,0 +1,8 @@
+#
+# Empty Dockerfile
+#
+
+FROM scratch
+
+# Add everything from the context into the container
+ADD . /
-- 
2.20.1


