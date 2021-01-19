Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA92FBEB1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:16:42 +0100 (CET)
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vYX-0001bn-Eg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vB6-00013T-A7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAy-0003ny-6r
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:28 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e15so564425wme.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/l3rZk8GOIQaj/zcskGUMbwB8AQ01WgfPICmp322OI=;
 b=GJuMrRZI3gcQ1txl13K7Xhqdl1v8ZJ+S0/05/dItlMMgZZ1P0ApACu//kIKvdrwIJ7
 S/X98i9P7XfT2OpVBkGOyq9rrIc24asmebFgTl0fEwtNmXygcZXbmCvIDNbHs6HEnhPG
 Dz3qh9Y3r1p/uCQeZpEjD5xf1Zkx9E9dr20RWRaae9utLmEGvPpA68CtMA2oHa/04W/V
 DBZSEnjDg4Z4VJQlm0NpnJHD7XsTxh7+ja9emhulIKHmf4ifJP67GJXAD3fhewmylkFE
 wVnpuPqfTCO06yf5jcD/zPIic8HvyTMz6PB2vyQBiDr7J3BKipGBWsn4hjCU+p9U2z2F
 cglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/l3rZk8GOIQaj/zcskGUMbwB8AQ01WgfPICmp322OI=;
 b=VwvIja7QwMIhyLEmguUwbsu+A5EVFgSRMb2W8I48t4I+VzZUcha7ivONnpkxGNUE0D
 Lt/6krtf4JYsl9z7x8i1ZnEVQpY7bA/UqvIjZFj3q2pNWSAxjqFTZgdHTq6n1m2R0DCx
 C2vqiYoC5lJDD1MvpXAMLP04vYiikgWlTrMuw8y4CTgP4CGj+qEJDm4zTCbrMI/CvkCJ
 wJU1FGeF/1R+FrKJyVIZyy0Wh5+LIk3u+1V8AB6F30LScpqIi1ioIl9KKBhGSSCOeduE
 8EkSThYsMRZots/ni9prBdpFtQ/CRxsvCI642k5a84GuMrEAWGUIlJik2ZVY3Eyp0+9E
 NP+g==
X-Gm-Message-State: AOAM533yqmL+c8uhJn09s7Se7ZhcY1l9kjDC4DrHI8bmqN0PLOT7MofZ
 nwcYUpCj6ymgWHV84Gru9dmUqQ==
X-Google-Smtp-Source: ABdhPJzWUZdnkY4iYkoSmMU/XSMhxlJDO3LzJTBmxyklX3h1Tc/fWJW16wEEDsujUL1Q/1ZaYsVSsg==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr705476wma.89.1611078738837; 
 Tue, 19 Jan 2021 09:52:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm37513971wrv.97.2021.01.19.09.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92A801FF92;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/6] tests/docker: add a docker-exec-copy-test
Date: Tue, 19 Jan 2021 17:52:07 +0000
Message-Id: <20210119175208.763-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119175208.763-1-alex.bennee@linaro.org>
References: <20210119175208.763-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


