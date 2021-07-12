Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ADF3C5C2B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:30:14 +0200 (CEST)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2v4f-0006yM-TG
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1d-00044W-4E
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1X-0007jD-Du
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r11so20093871wro.9
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmYqC7lobHkUYsln7oehaYwCSRkOBiL/sZms1OJnH7A=;
 b=kwCejYWsgOJRE1BAT7ixs9G5JqYoIlMy0GTed3qzp0HzjOHCFJoNAZfxw9v+ZynBxe
 h8Iibs2Pvu0MfDEIFyxXUH3izY0JXGKVk9YYnDhbcdmx69oL9EHhZeU/ErXy7vkjCoUr
 rw2E0ruIcpHR8cVguFM24CIDcbMEGraIR9UIhO0CpyWxKGfOft90ClAYC7J/hPwMtzZx
 lf9diD/7vkgCmt8S7TlAzFGUFrP6EDq76fO6bM5syaci0v/qUEVb/JlaQddJJ/SA5h8u
 KgrRk2/P79cgySxkneijpV0DM4qS1nexDZ0rrHrfTFK79QpPN57XdcRw5qL/Su2SIalb
 fLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmYqC7lobHkUYsln7oehaYwCSRkOBiL/sZms1OJnH7A=;
 b=FlQLwTgTmkhT4rotocehskFYNn4izFQhIG5yMa0RQ8J/FIkLZphOF7aiXDNvctG1Gx
 a7IjOp/R5RWV+AuRdhQ1jwhHy3NLEmzf/GM+7dBe945xUoC4W49AstYzLOPKdqURH+xA
 TMfd0Fbpsc5M+6iu2CoA//NV8W60pDfHYTjD94i3eifFa+yxvlHIZUabvY+Xa5fSusC9
 K36TAN+YybAv8t6D70ywKVisMf7rE6rXlUnji/bly3lpS4JnOzpXU5qJIuL3PvFEsUXJ
 vRxGVL31vecXBp5J1wjQ09Ps21c2bqzjajTKXvlZ5AQQ83XqYM5emmf1yT9DLPWPDZxL
 phoA==
X-Gm-Message-State: AOAM5323+zJvrzPQh6t37vZDPAjdYT/9P1LhV7Xx2Y25zI7v+GU/kC0b
 ACxuZDg18kwjhEeHrRXj2LBj/Q==
X-Google-Smtp-Source: ABdhPJzNQ9VMkFxYooFw2fnNK6hWy1jJZy+4UwAfLX3Ytp7CuuOnTq41AKQltKyNAypxBqErgaF+kw==
X-Received: by 2002:adf:f305:: with SMTP id i5mr10336881wro.122.1626092818097; 
 Mon, 12 Jul 2021 05:26:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s6sm4159700wrt.45.2021.07.12.05.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:26:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB2FC1FF87;
 Mon, 12 Jul 2021 13:26:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/40] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Mon, 12 Jul 2021 13:26:14 +0100
Message-Id: <20210712122653.11354-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

As described in the included documentation, the "custom runner" jobs
extend the GitLab CI jobs already in place.  One of their primary
goals of catching and preventing regressions on a wider number of host
systems than the ones provided by GitLab's shared runners.

This sets the stage in which other community members can add their own
machine configuration documentation/scripts, and accompanying job
definitions.  As a general rule, those newly added contributed jobs
should run as "non-gating", until their reliability is verified (AKA
"allow_failure: true").

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210630012619.115262-2-crosa@redhat.com>
Message-Id: <20210709143005.1554-2-alex.bennee@linaro.org>

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
new file mode 100644
index 0000000000..064ffa9988
--- /dev/null
+++ b/docs/devel/ci.rst
@@ -0,0 +1,32 @@
+==
+CI
+==
+
+QEMU has configurations enabled for a number of different CI services.
+The most up to date information about them and their status can be
+found at::
+
+   https://wiki.qemu.org/Testing/CI
+
+Jobs on Custom Runners
+======================
+
+Besides the jobs run under the various CI systems listed before, there
+are a number additional jobs that will run before an actual merge.
+These use the same GitLab CI's service/framework already used for all
+other GitLab based CI jobs, but rely on additional systems, not the
+ones provided by GitLab as "shared runners".
+
+The architecture of GitLab's CI service allows different machines to
+be set up with GitLab's "agent", called gitlab-runner, which will take
+care of running jobs created by events such as a push to a branch.
+Here, the combination of a machine, properly configured with GitLab's
+gitlab-runner, is called a "custom runner".
+
+The GitLab CI jobs definition for the custom runners are located under::
+
+  .gitlab-ci.d/custom-runners.yml
+
+Custom runners entail custom machines.  To see a list of the machines
+currently deployed in the QEMU GitLab CI and their maintainers, please
+refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 977c3893bd..da15273786 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -27,6 +27,7 @@ Contents:
    migration
    atomics
    stable-process
+   ci
    qtest
    decodetree
    secure-coding-practices
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
new file mode 100644
index 0000000000..a07b27384c
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -0,0 +1,14 @@
+# The CI jobs defined here require GitLab runners installed and
+# registered on machines that match their operating system names,
+# versions and architectures.  This is in contrast to the other CI
+# jobs that are intended to run on GitLab's "shared" runners.
+
+# Different than the default approach on "shared" runners, based on
+# containers, the custom runners have no such *requirement*, as those
+# jobs should be capable of running on operating systems with no
+# compatible container implementation, or no support from
+# gitlab-runner.  To avoid problems that gitlab-runner can cause while
+# reusing the GIT repository, let's enable the clone strategy, which
+# guarantees a fresh repository on each job run.
+variables:
+  GIT_STRATEGY: clone
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 64cb2ba1da..dde8270301 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -9,3 +9,4 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/custom-runners.yml'
-- 
2.20.1


