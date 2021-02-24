Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10744323B84
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:53:26 +0100 (CET)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsjN-0001TG-1K
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfl-00062X-MO
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfj-0002X9-R6
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c7so1593385wru.8
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVmTUTItvD8Y9XDlb1Vri2ktpu4ZNI+gRqGqx4eqPS4=;
 b=sIp/mNBpQOkMZZ8VjCOpgePMhMOP5AABOefQ688/03tj7VDawEVxMrl4eD4RkfS8FD
 9xc5A5FqAtl12qpOt8dDHw2vpbEpW7JiuJ486/JsiIuzqUMMHRi3/BU5BXda0lCcpfxN
 Gf6LHu5n1LCdG5IuV6UYGT8lkaZ2C8rf075y1hq4w4sTb91xJYXZ/DwYHcdWUVZEoBTE
 nFJdE04TVO1E/Wnc6H9gDubhzt4SyvD3DOQwhvfJ17EQqyKpSkn0q1oeZ1AMIjk1uOOn
 y8h647TjzdfRqfL5CpOuRfGaCWxTH9Xn3rc3SUjQlrD7ky+Y2J/QVK4OkLEAMbMATnJq
 v3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVmTUTItvD8Y9XDlb1Vri2ktpu4ZNI+gRqGqx4eqPS4=;
 b=KaJEImK7fLqHLRceU9X7rJsWm9C1u3ff+sPhlQUv077+6RKy8gXGJcxPyAsavpwcUj
 ZFfvgM7J9qaL8q+72pOWAvOyV69ZskQ2Eb1jmzZ2kVDbUebgWbWM/8sm//s9DWibUBIt
 Wl7lsXbNJZ/MXVqt+QpShgDU7uOCtORkgf7jCORG3qqNWuCLwnqOz9HgSc9pfhfIZ3oK
 73iISehvSZOYAIjaTMvj1qyiZayJGdTlX6CSFGfCtuStazEUIKcS+o0VGciWWWg/C6Bc
 S/hoYFfabFPnAIVfHhHwLgeM3QUFae/rAaiNyxalBUgDkikrEZZu0IwWNCg2pIo5/IuH
 jZRQ==
X-Gm-Message-State: AOAM530AODLVOjSy4rpXq0YQoS6uNKq5DjsnjIZ3NrFm8UU/TIjnQy3a
 eu4bo1xmi3MBsEjOfQ3/Dw2AhQ==
X-Google-Smtp-Source: ABdhPJzMxcsvxgIXeolPAD715xbgG/gvADAcXMVxglqpFnj725CeXB6M4z7hlR+hwSKIKCkVOlMKCg==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr31196259wrt.84.1614167378507; 
 Wed, 24 Feb 2021 03:49:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c6sm3008164wrt.26.2021.02.24.03.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4D3E1FF91;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/7] docs/devel: update the container based tests
Date: Wed, 24 Feb 2021 11:49:24 +0000
Message-Id: <20210224114926.6303-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This section has grown a little stale so clean-up the language and
examples for current usage:

  - refer to containers at the top
  - mention podman can also be used
  - add podman prerequisites section
  - move to using "docker-help" for online help
  - mention the registry and it's purpose
  - don't refer to out-of-date min-glib image

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210222101455.12640-6-alex.bennee@linaro.org>

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 488d4e3537..e57260478a 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -280,13 +280,17 @@ Container based tests
 Introduction
 ------------
 
-The Docker testing framework in QEMU utilizes public Docker images to build and
-test QEMU in predefined and widely accessible Linux environments.  This makes
-it possible to expand the test coverage across distros, toolchain flavors and
-library versions.
-
-Prerequisites
--------------
+The container testing framework in QEMU utilizes public images to
+build and test QEMU in predefined and widely accessible Linux
+environments. This makes it possible to expand the test coverage
+across distros, toolchain flavors and library versions. The support
+was originally written for Docker although we also support Podman as
+an alternative container runtime. Although the many of the target
+names and scripts are prefixed with "docker" the system will
+automatically run on whichever is configured.
+
+Docker Prerequisites
+--------------------
 
 Install "docker" with the system package manager and start the Docker service
 on your development machine, then make sure you have the privilege to run
@@ -316,26 +320,53 @@ Note that any one of above configurations makes it possible for the user to
 exploit the whole host with Docker bind mounting or other privileged
 operations.  So only do it on development machines.
 
+Podman Prerequisites
+--------------------
+
+Install "podman" with the system package manager.
+
+.. code::
+
+  $ sudo dnf install podman
+  $ podman ps
+
+The last command should print an empty table, to verify the system is ready.
+
 Quickstart
 ----------
 
-From source tree, type ``make docker`` to see the help. Testing can be started
-without configuring or building QEMU (``configure`` and ``make`` are done in
-the container, with parameters defined by the make target):
+From source tree, type ``make docker-help`` to see the help. Testing
+can be started without configuring or building QEMU (``configure`` and
+``make`` are done in the container, with parameters defined by the
+make target):
 
 .. code::
 
-  make docker-test-build@min-glib
+  make docker-test-build@centos8
 
-This will create a container instance using the ``min-glib`` image (the image
+This will create a container instance using the ``centos8`` image (the image
 is downloaded and initialized automatically), in which the ``test-build`` job
 is executed.
 
+Registry
+--------
+
+The QEMU project has a container registry hosted by GitLab at
+``registry.gitlab.com/qemu-project/qemu`` which will automatically be
+used to pull in pre-built layers. This avoids unnecessary strain on
+the distro archives created by multiple developers running the same
+container build steps over and over again. This can be overridden
+locally by using the ``NOCACHE`` build option:
+
+.. code::
+
+   make docker-image-debian10 NOCACHE=1
+
 Images
 ------
 
-Along with many other images, the ``min-glib`` image is defined in a Dockerfile
-in ``tests/docker/dockerfiles/``, called ``min-glib.docker``. ``make docker``
+Along with many other images, the ``centos8`` image is defined in a Dockerfile
+in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
 command will list all the available images.
 
 To add a new image, simply create a new ``.docker`` file under the
@@ -355,7 +386,7 @@ QEMU.  Docker tests are the executables under ``tests/docker`` named
 library, ``tests/docker/common.rc``, which provides helpers to find the QEMU
 source and build it.
 
-The full list of tests is printed in the ``make docker`` help.
+The full list of tests is printed in the ``make docker-help`` help.
 
 Debugging a Docker test failure
 -------------------------------
-- 
2.20.1


