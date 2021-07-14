Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0733C8696
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:04:38 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gRB-0004fg-Vi
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNU-00073m-5L
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNN-0007Od-Px
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m2so3644615wrq.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZaFzUXmMyFrsEvHj9goisVPKPdSkTlsqME6vVUknvZ0=;
 b=Vmtd/FeQ5c4bKTe35tZoyipmBtwnJF0YBLlwmUZhxCaXoU15bWI56G/+e6q2ALigIT
 eaoL95hr4exVqhvmi8KiUvGgym2e69Ni8hzUXjYUm/IwUN4Vp8HNxl1F5A4cuXqykwOu
 nqmyt68w/uwH76/VJCbsEXvL8z3Rjsxdj7FRqHXuXqe6EOVWnhxhACzOAgKIdwnFOwR3
 64Ns5QKNIIVFV6+5KqFHufkzQHQQoF5KUGC3X8ojRejkk8gSHnegQ7osixKyjsgFrCpY
 e2wwUcUbsJ8QEuukU1RLaMsnCtKrhFmUIUxZm6nXjY9BW4laotBEuFIppr15kHi2ITzY
 ff8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZaFzUXmMyFrsEvHj9goisVPKPdSkTlsqME6vVUknvZ0=;
 b=FtfKv9NSSqBjVduZC+O4XJwzYCH7Ip1JfG+StVg3NiY4wnh1E3MbMG0zLnZkOnsJsG
 ZBJeRxMIVuVoynh8QnhZxdQs4kSgmE15KDEqWMFxnN1sEBCSWaPBdHpP8AcCFvnv9NPE
 GkUrLeK3p/S8rGbrqnXOIAvo3DyVMewoL2/lP6djnE98R2Nzb41JLyvehVJ7GWVTxqGc
 2SSq97HraeWWhIzZmNDTf9qKuF5TKPonskUlx5PlMtulKggd3ehJMgl4swc1DFwOk+gq
 +qzkZ9pABQEfQBc3qml9TookFZjzlN/6n2rJHJFTmxWw7Ygqx6Ln+T9oBkbnF83PkLh8
 jcZw==
X-Gm-Message-State: AOAM530AZslOxOJHdVT38gKLFBaHKk5a5AfyhttyUBp3n2xFU+YxTAAt
 IP4E9cyRA1ecCDq6Hthva2Zfcg==
X-Google-Smtp-Source: ABdhPJzwGvS5HdPYrwI6FYPlpZxOrp4anoC0KLtEQC3nT/aTjoQOAKBf/3GxzhFn1daJYfFIPMALbg==
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr13492997wrs.347.1626274839747; 
 Wed, 14 Jul 2021 08:00:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l20sm2632725wmq.3.2021.07.14.08.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C73541FF87;
 Wed, 14 Jul 2021 16:00:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 01/44] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Wed, 14 Jul 2021 15:59:53 +0100
Message-Id: <20210714150036.21060-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
index ba90badbbd..40a7e2ee6f 100644
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


