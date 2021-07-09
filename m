Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464603C2605
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:34:30 +0200 (CEST)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1raH-0004Zf-Af
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rW8-0004bE-2W
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rW6-0005U3-8c
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k4so6122607wrc.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+Bmwitpli/El3tfQx09X6m1DsmvT8z7wFQh9OyOsVo=;
 b=kSDYhL43Ppum3i4gkMxu5Ca8JF/VERRMrnfxtgPdTlLawNadS/Zk10xKFH1RVCDHg3
 XTBGlXWDVUtcNUlITSN/GHVmZ3zj3Qr9KJOyy+pFjuGeNf93mV5Zb2xdUQ54YX3yjtrA
 Sm/FS9XBN6da/RiudZDWIlbVEcFDuCcGhkonvXZJxmh7/kHyfWW38l8E+lX6cv8BD26B
 U75vSodNX9EkwlbC+kde5A4YzvEDMpNYkIIpOCypFQLT9pJcPaep91Tt4m8E3pqOP75y
 4MxhSvhrtm/nw5wrZ9+f2EKTRbmkUeUiP3dGp1CSZROrdhlofkakQZUpAwV+hOTG4c0h
 GTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+Bmwitpli/El3tfQx09X6m1DsmvT8z7wFQh9OyOsVo=;
 b=tYwSD4pvmTXlE1IKa1bbj8MYIvTdWPWUvboajMIaZJq7o/2QoBDtAVYpbDKs2IZwjp
 d1LQg+prMg/AXKlzHFrasF8uchFmYctVO3kmW20+jo2QZq0XQ04efqLmML7rjspN15be
 e7MKM3Ae6Yo7q1f5j2WqPTwsZ1aet8c2R0F1LaTUIqPQDGsY/6S0bntI8j6fCCn2HH7N
 ZxnoNKVXurjx3k0GEbl2gdZHYXD7kiwo5+HaP9KippAsapqu8ZXDb0W0BHXrUdgRIASo
 OfxNtWx5NWhnNCwY/897q8/bP/qhs2L5R6EAPfF1+oMEejfjBBmnY3/Zerp2QN48u1ZO
 hePQ==
X-Gm-Message-State: AOAM5339FnKY5H7l+8PQGwFYPWZbsssl3A6z+D8mTiLkUuDYVzwRMCAH
 Ird+IOI8+TK84drZcJjY0OBbnA==
X-Google-Smtp-Source: ABdhPJxBvZWNHvCiGF2eRV465udNmdWbJk2JABeEmzZu7bSxvrsHXJp0rzhH89dPFSuctFbSiEsZvg==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr5099293wru.253.1625841009010; 
 Fri, 09 Jul 2021 07:30:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm5571881wre.84.2021.07.09.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 059021FF87;
 Fri,  9 Jul 2021 15:30:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/40] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Fri,  9 Jul 2021 15:29:26 +0100
Message-Id: <20210709143005.1554-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210630012619.115262-2-crosa@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci.rst               | 32 ++++++++++++++++++++++++++++++++
 docs/devel/index.rst            |  1 +
 .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
 .gitlab-ci.d/qemu-project.yml   |  1 +
 4 files changed, 48 insertions(+)
 create mode 100644 docs/devel/ci.rst
 create mode 100644 .gitlab-ci.d/custom-runners.yml

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


