Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E7210D20
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:07:50 +0200 (CEST)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdOv-00038g-VR
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdEf-0002Wu-RR
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 09:57:15 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdEb-0005sN-VL
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 09:57:13 -0400
Received: by mail-wr1-x443.google.com with SMTP id o11so23963673wrv.9
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQXPMBJFSRwRAMpnVcrqX7aTAD1ChFBfvwEUcI3QHF8=;
 b=QV9lfwcPg8Ttws8CsGNaD1CPyYpwfk+XUjlDyReZPoF9eZo0F4/F/8DvpURdMKCLci
 1rDiqEbCpKFgMKAjfmPCCw/r5SHqeiGbFYWBI03AA3zI4qup9+aabS6qoovj0UChcP0U
 HCOuWUErC8QxVOWUYXbSXDVKAK1MKg0rQ5SiQ11FB42E3lBfHPP5qJsJwL33K434TFc4
 u6ZB6K3WeTmDK+98niCm3P1Usd4Xr6czgUgW5NHrGBs3OPWRXTNQaKcnW44h4J9bMsI6
 Lsdbu4+D/qq+jCPGE4PmdCBP35r0oNjHrn69XjLG/BYYyBwQScl8c+rxrbOIIj0AucOk
 BolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQXPMBJFSRwRAMpnVcrqX7aTAD1ChFBfvwEUcI3QHF8=;
 b=exK2T2MdWS6aFBy21shNs5k4lOpcVBAsMoKKdhNxF9a3cj3/5f7B9aOzanPwG/HtWs
 QIZ92bNIJ3HVyohVrHSbQRWbPiasTJwgV9S4+5l3MmjFlhESWOygmGR42QSdU8k7mOkr
 aHQFFkfpivQaV7tfQQrcm8UV5pitoRSFTZxGD+53bgjnk+gy+bUkvd9DmzRnVg48oa7M
 iee8oELghmd4lHgpdnFfoU5roRd5847v5DmorVg8l5K7Jz8lC8umT059ifXVHSxPmkir
 IhhUdSVV45M2Rpnvt8SyHE4TBN02kMPSpBfP8uMdI5IAqjeFMLJZccGdm/z0OFD37XYP
 WuIg==
X-Gm-Message-State: AOAM530Au7MmRUBIxpcYWsaACh9HeORlW74xHo7+0uGrBvVDacqoUYkS
 jFGyrIkGEI/e5IvX5LVwUB9Gvw==
X-Google-Smtp-Source: ABdhPJyg0RYEDdR5r1t7uGXKZgPWS8Fj8q6k8tIl0NVFnN2qNCeDD+ZlE0LvWpsSeH95TNMX0mLrkQ==
X-Received: by 2002:adf:f311:: with SMTP id i17mr28013335wro.237.1593611828585; 
 Wed, 01 Jul 2020 06:57:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm7285076wmi.34.2020.07.01.06.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:57:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CFEB1FFAE;
 Wed,  1 Jul 2020 14:56:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 24/40] tests/docker: add --registry support to tooling
Date: Wed,  1 Jul 2020 14:56:36 +0100
Message-Id: <20200701135652.1366-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701135652.1366-1-alex.bennee@linaro.org>
References: <20200701135652.1366-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to point the tools towards a registry from which they
can grab pre-built layers instead of doing everything from scratch
each time. To enable this we need to be using the DOCKER_BUILDKIT
engine.

[AJB: note registry.gitlab.com/stsquad/qemu is for my testing, the
final version will see DOCKER_REGISTRY default to registry.gitlab.com/qemu-project/qemu]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - add a pull stage to pull images from the registry
  - enable BUILDKIT and BUILDKIT_INLINE_CACHE
  - don't invoke BUILDKIT on Travis
v4
  - Don't pass --registry in the NOCACHE case
  - precalc checksum before doing any replace steps
---
 tests/docker/Makefile.include |  6 ++++-
 tests/docker/docker.py        | 44 ++++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e23b4af20ea..977d8ff6e40 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -13,6 +13,7 @@ DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.doc
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
 DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
+DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/stsquad/qemu)
 
 DOCKER_TESTS := $(notdir $(shell \
 	find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
@@ -56,7 +57,9 @@ else
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	$(call quiet-command,\
 		$(DOCKER_SCRIPT) build -t qemu/$* -f $< \
-		$(if $V,,--quiet) $(if $(NOCACHE),--no-cache) \
+		$(if $V,,--quiet) \
+		$(if $(NOCACHE),--no-cache, \
+			$(if $(DOCKER_REGISTRY),--registry $(DOCKER_REGISTRY))) \
 		$(if $(NOUSER),,--add-current-user) \
 		$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))\
 		$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)),\
@@ -213,6 +216,7 @@ endif
 	@echo '                         Include extra files in image.'
 	@echo '    ENGINE=auto/docker/podman'
 	@echo '                         Specify which container engine to run.'
+	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
 
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index cc6f76caa60..9684f07bdeb 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -221,6 +221,13 @@ class Docker(object):
     """ Running Docker commands """
     def __init__(self):
         self._command = _guess_engine_command()
+
+        if "docker" in self._command and "TRAVIS" not in os.environ:
+            os.environ["DOCKER_BUILDKIT"] = "1"
+            self._buildkit = True
+        else:
+            self._buildkit = False
+
         self._instance = None
         atexit.register(self._kill_instances)
         signal.signal(signal.SIGTERM, self._kill_instances)
@@ -289,10 +296,24 @@ class Docker(object):
         return labels.get("com.qemu.dockerfile-checksum", "")
 
     def build_image(self, tag, docker_dir, dockerfile,
-                    quiet=True, user=False, argv=None, extra_files_cksum=[]):
+                    quiet=True, user=False, argv=None, registry=None,
+                    extra_files_cksum=[]):
         if argv is None:
             argv = []
 
+        # pre-calculate the docker checksum before any
+        # substitutions we make for caching
+        checksum = _text_checksum(_dockerfile_preprocess(dockerfile))
+
+        if registry is not None:
+            dockerfile = dockerfile.replace("FROM qemu/",
+                                            "FROM %s/qemu/" %
+                                            (registry))
+            # see if we can fetch a cache copy, may fail...
+            pull_args = ["pull", "%s/%s" % (registry, tag)]
+            self._do(pull_args, quiet=quiet)
+
+
         tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
                                              encoding='utf-8',
                                              dir=docker_dir, suffix=".docker")
@@ -306,15 +327,23 @@ class Docker(object):
                          (uname, uid, uname))
 
         tmp_df.write("\n")
-        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s" %
-                     _text_checksum(_dockerfile_preprocess(dockerfile)))
+        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s" % (checksum))
         for f, c in extra_files_cksum:
             tmp_df.write("LABEL com.qemu.%s-checksum=%s" % (f, c))
 
         tmp_df.flush()
 
-        self._do_check(["build", "-t", tag, "-f", tmp_df.name] + argv +
-                       [docker_dir],
+        build_args = ["build", "-t", tag, "-f", tmp_df.name]
+        if self._buildkit:
+            build_args += ["--build-arg", "BUILDKIT_INLINE_CACHE=1"]
+
+        if registry is not None:
+            cache = "%s/%s" % (registry, tag)
+            build_args += ["--cache-from", cache]
+        build_args += argv
+        build_args += [docker_dir]
+
+        self._do_check(build_args,
                        quiet=quiet)
 
     def update_image(self, tag, tarball, quiet=True):
@@ -403,6 +432,8 @@ class BuildCommand(SubCommand):
         parser.add_argument("--add-current-user", "-u", dest="user",
                             action="store_true",
                             help="Add the current user to image's passwd")
+        parser.add_argument("--registry", "-r",
+                            help="cache from docker registry")
         parser.add_argument("-t", dest="tag",
                             help="Image Tag")
         parser.add_argument("-f", dest="dockerfile",
@@ -458,7 +489,8 @@ class BuildCommand(SubCommand):
                      for k, v in os.environ.items()
                      if k.lower() in FILTERED_ENV_NAMES]
             dkr.build_image(tag, docker_dir, dockerfile,
-                            quiet=args.quiet, user=args.user, argv=argv,
+                            quiet=args.quiet, user=args.user,
+                            argv=argv, registry=args.registry,
                             extra_files_cksum=cksum)
 
             rmtree(docker_dir)
-- 
2.20.1


