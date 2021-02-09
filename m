Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47C3150F9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:54:54 +0100 (CET)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TTh-0005ed-TM
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9TPY-0002Mj-Fw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9TPU-000569-BB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9Ip0oCTt+uqy/UoGrf5eS2lsDbnf6UwSXOH6ImclgM=;
 b=NVCs4FOD8bqbnJ5wlaghk2jSI24GcdbkiB7wmNZ8NO6T9uYoYEvzqbDI9JPFapsC5UM2lW
 zPxqblj2+WYzupPiLd8OLBXnaBOVQaVPh6YEYD63bxckRtWNxbxKKIf83m19UFMnYrDGwO
 sHSJ17bkVMS3q3UhSPxTG0K+He/rxu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-DAMR9njhPkaaiPuD-dFAcg-1; Tue, 09 Feb 2021 08:50:21 -0500
X-MC-Unique: DAMR9njhPkaaiPuD-dFAcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BB96107ACFA;
 Tue,  9 Feb 2021 13:50:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-66.ams2.redhat.com
 [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78CE15D9D0;
 Tue,  9 Feb 2021 13:50:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/docker: remove travis container
Date: Tue,  9 Feb 2021 13:50:10 +0000
Message-Id: <20210209135011.1224992-2-berrange@redhat.com>
In-Reply-To: <20210209135011.1224992-1-berrange@redhat.com>
References: <20210209135011.1224992-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The travis container that we have no longer matches what travis
currently uses. As all x86 jobs are being moved to GitLab CI too,
there is no compelling reason to update the travis container. It
is simpler to just remove it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/testing.rst                 | 14 --------
 tests/docker/Makefile.include          | 11 ++----
 tests/docker/dockerfiles/travis.docker | 17 ----------
 tests/docker/travis                    | 22 ------------
 tests/docker/travis.py                 | 47 --------------------------
 5 files changed, 2 insertions(+), 109 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/travis.docker
 delete mode 100755 tests/docker/travis
 delete mode 100755 tests/docker/travis.py

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
2.29.2


