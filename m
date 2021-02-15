Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772931B6C0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:53:53 +0100 (CET)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaZk-0002ol-He
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPC-00005T-ET
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPA-0004OA-DK
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id t15so8018188wrx.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wi8xonZIppL51gFFDDdIXceue4eELZy4Ltb9kqiMtHE=;
 b=x6OQfAgBs9xy3sfuvMxJsEIOVgOnuzeBYXJqxi781EpbFjTrRfMwKOkgqg+CYacrHZ
 x3P2ZNP2kS7HwPw9LO351OW2rzkbdfAMdzgKQ2/4B53ZQEp2y5lercoOYkdE0nCDtTPC
 rO2kxdpibJhQXgi1Il/BMIOB79kVrGz7URQUKWJWon2x9IGLdBt42h2qj8LN7qE4x+0P
 7BVpnhDOWoqscPuTJDwaujpEimzd95aemH5BhVkJtnSC1cWYr8qNspnjO5dzv1vDLruY
 TFccUg8wDEZ0gGS7t68XyQACUOTim5hhkH1dAMvdgo9V6WYgB0JY9qUU2id+VAsRL5GS
 8nEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wi8xonZIppL51gFFDDdIXceue4eELZy4Ltb9kqiMtHE=;
 b=aKT8DiY2EHlsVhbe47ZbA4SKBcr0Mq66F6RfVaHVgWQ8rAFpf3WpeBcK4O7Hvv34HD
 jOyJZR2ovx0UFajK5hOwbcCl6iF+xhtRiVSIySLUMIwZdqwtKVROaKVlxkpcCZ1jg2lt
 2SHJXYoK51BFrKlLjbLR5ZzDSTRkYWbB+p9QglDRcvgwF6FLI8r5oCJlHNYkrHf7jQAu
 2M+SR/nrhjjsr2YCASlXZ8UVeD5QmJcOd9fhtwhH7m72RqIDKdvAn229hlfFetROX5dh
 FIjeLYNnAV/IlJYXBbl3m944pC9zV3mQ55+83k/44V2q7PaFdI1D8cHmzmixJThuHDEf
 MxlQ==
X-Gm-Message-State: AOAM530Zflue8sMdDSxCPMPubt0JWdYzL5NWQAF2UMwFMTg4FmrNequX
 LR3Z7Yn4g2La/+InxzVaouicxeI20BWZZ9wT
X-Google-Smtp-Source: ABdhPJznijbQ9c2evTOkqKNrnrKD7oasOzYfP/3iBNpX4exsW5IhsGPN2j9SqcJwdBe/0tVzVjOFRg==
X-Received: by 2002:a5d:6404:: with SMTP id z4mr17756186wru.103.1613382175064; 
 Mon, 15 Feb 2021 01:42:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m1sm14654011wmq.36.2021.02.15.01.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2F981FF96;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/15] tests/docker: remove travis container
Date: Mon, 15 Feb 2021 09:42:37 +0000
Message-Id: <20210215094244.12716-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The travis container that we have no longer matches what travis
currently uses. As all x86 jobs are being moved to GitLab CI too,
there is no compelling reason to update the travis container. It
is simpler to just remove it.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210209135011.1224992-2-berrange@redhat.com>
Message-Id: <20210211122750.22645-9-alex.bennee@linaro.org>

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 209f9d8172..00ce16de48 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -357,20 +357,6 @@ source and build it.
 
 The full list of tests is printed in the ``make docker`` help.
 
-Tools
------
-
-There are executables that are created to run in a specific Docker environment.
-This makes it easy to write scripts that have heavy or special dependencies,
-but are still very easy to use.
-
-Currently the only tool is ``travis``, which mimics the Travis-CI tests in a
-container. It runs in the ``travis`` image:
-
-.. code::
-
-  make docker-travis@travis
-
 Debugging a Docker test failure
 -------------------------------
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 93b29ad823..7cab761bf5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -21,8 +21,6 @@ DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/qemu-project
 DOCKER_TESTS := $(notdir $(shell \
 	find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
 
-DOCKER_TOOLS := travis
-
 ENGINE := auto
 
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
@@ -126,7 +124,7 @@ ifneq ($(HOST_ARCH),x86_64)
 DOCKER_PARTIAL_IMAGES += debian-mips-cross debian-mipsel-cross debian-mips64el-cross
 DOCKER_PARTIAL_IMAGES += debian-ppc64el-cross
 DOCKER_PARTIAL_IMAGES += debian-s390x-cross
-DOCKER_PARTIAL_IMAGES += fedora travis
+DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-alpha-cross: docker-image-debian10
@@ -147,8 +145,6 @@ docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
-docker-image-travis: NOUSER=1
-
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
@@ -174,7 +170,7 @@ DOCKER_PARTIAL_IMAGES += fedora-i386-cross fedora-cris-cross
 
 # Expand all the pre-requistes for each docker image and test combination
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
-	$(foreach t,$(DOCKER_TESTS) $(DOCKER_TOOLS), \
+	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
 		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
 	) \
@@ -212,9 +208,6 @@ endif
 	@echo 'Available tests:'
 	@echo '    $(DOCKER_TESTS)'
 	@echo
-	@echo 'Available tools:'
-	@echo '    $(DOCKER_TOOLS)'
-	@echo
 	@echo 'Special variables:'
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
diff --git a/tests/docker/dockerfiles/travis.docker b/tests/docker/dockerfiles/travis.docker
deleted file mode 100644
index cd1435a7e9..0000000000
--- a/tests/docker/dockerfiles/travis.docker
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Travis Image - this is broadly the same image that we run our CI
-# tests on.
-#
-FROM travisci/ci-sardonyx:packer-1552557266-f909ac5
-ENV DEBIAN_FRONTEND noninteractive
-ENV LANG en_US.UTF-8
-ENV LC_ALL en_US.UTF-8
-RUN sed -i "s/# deb-src/deb-src/" /etc/apt/sources.list
-RUN apt-get update
-RUN apt-get -y build-dep qemu
-RUN apt-get -y install device-tree-compiler python3 python3-yaml dh-autoreconf gdb strace lsof net-tools gcovr ninja-build
-# Travis tools require PhantomJS / Neo4j / Maven accessible
-# in their PATH (QEMU build won't access them).
-ENV PATH /usr/local/phantomjs/bin:/usr/local/phantomjs:/usr/local/neo4j-3.2.7/bin:/usr/local/maven-3.5.2/bin:/usr/local/cmake-3.9.2/bin:/usr/local/clang-5.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
-ENV FEATURES clang pyyaml docs
-USER travis
diff --git a/tests/docker/travis b/tests/docker/travis
deleted file mode 100755
index 47c03677d6..0000000000
--- a/tests/docker/travis
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash -e
-#
-# Mimic a travis testing matrix
-#
-# Copyright (c) 2016 Red Hat Inc.
-#
-# Authors:
-#  Fam Zheng <famz@redhat.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2
-# or (at your option) any later version. See the COPYING file in
-# the top-level directory.
-
-. common.rc
-
-requires pyyaml
-cmdfile=/tmp/travis_cmd_list.sh
-$QEMU_SRC/tests/docker/travis.py $QEMU_SRC/.travis.yml > $cmdfile
-chmod +x $cmdfile
-cd "$QEMU_SRC"
-unset BUILD_DIR SRC_DIR
-$cmdfile
diff --git a/tests/docker/travis.py b/tests/docker/travis.py
deleted file mode 100755
index 37307ac366..0000000000
--- a/tests/docker/travis.py
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/usr/bin/env python3
-#
-# Travis YAML config parser
-#
-# Copyright (c) 2016 Red Hat Inc.
-#
-# Authors:
-#  Fam Zheng <famz@redhat.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2
-# or (at your option) any later version. See the COPYING file in
-# the top-level directory.
-
-import sys
-import yaml
-import itertools
-
-def load_yaml(fname):
-    return yaml.safe_load(open(fname, "r").read())
-
-def conf_iter(conf):
-    # If "compiler" is omitted from the included env then Travis picks the
-    # first entry of the global compiler list.
-    default_compiler = conf["compiler"][0]
-    def env_to_list(env):
-        return env if isinstance(env, list) else [env]
-    for entry in conf["matrix"]["include"]:
-        yield {"env": env_to_list(entry["env"]),
-               "compiler": entry.get("compiler", default_compiler)}
-
-def main():
-    if len(sys.argv) < 2:
-        sys.stderr.write("Usage: %s <travis-file>\n" % sys.argv[0])
-        return 1
-    conf = load_yaml(sys.argv[1])
-    print("\n".join((": ${%s}" % var for var in conf["env"]["global"])))
-    for config in conf_iter(conf):
-        print("(")
-        print("\n".join(config["env"]))
-        print("alias cc=" + config["compiler"])
-        print("\n".join(conf["before_script"]))
-        print("\n".join(conf["script"]))
-        print(")")
-    return 0
-
-if __name__ == "__main__":
-    sys.exit(main())
-- 
2.20.1


