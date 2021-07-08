Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594CF3C19CE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:29:45 +0200 (CEST)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZiS-0007Ah-AR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPC-0003Iw-7h
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZP8-0004jt-Ho
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so21202970wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+Bmwitpli/El3tfQx09X6m1DsmvT8z7wFQh9OyOsVo=;
 b=C/nviRfeDcgJeeurH3kL+2ILw8h62g0beVxDdngI7VyUnANssEXKcMRBmU+jsq25hG
 Hr0hSVbV6F2EHLG/lGUCzOKkIBd3jGV2Lp0lzSAH2qO97lsDIAON863Xo1j+oj2/4NMV
 lfVeHLsINJUA7GG8W98j81J1wGmZujqeo3+vEs5QjOLSZ3tlOyE2eUoRd5Fl5xqxsemF
 HBAd+mGMJqCetmt/tneaUfQsP9eBC+VcpBPFvqG+U/Apgy/hrX9AkLEdZmzwj9lTkMD7
 LBtiX25jvjw8LDSOLPp5qaMJhtQXVAEuYslgj81Q3WjRIE8lEYna4DHSj5RBIICLYu5i
 Hmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+Bmwitpli/El3tfQx09X6m1DsmvT8z7wFQh9OyOsVo=;
 b=rW0BlP3YpGAi6Kai/RxMjJaJVvfn1rkrKD1wc57zDiQpRKAwnToc5pH/Zz1h3yOB3T
 ACq+kq3GbVL3QfQMFRhszuhVopJAgKtAelOdzzbW194Liw+XLNfwj1HMllCq+nc9giUx
 JFcVruDdp+gh0nCSDoGv2emEB9RNGrtuvnctkwr5tSeGs6ly0dqqTAJWikUrjgzD486w
 vyFb0/KB//jOvDwGPfdOEMQzcYjrH9Rpp78oYJTX9rdLWI0OJn639u6SvzXlaDTGZqq3
 0JjwWf7eaWtgaHBRXM+6T/aD4+qhK7XT0muhiKFTKFB62MB12JNQmW+LmIb6zRHQLMk0
 KF9A==
X-Gm-Message-State: AOAM533envM7oueEqHU/gHmDpIYRidDVXGBjMjJxxWNlc2qaOVTNMKUP
 1FVaGuuM7lleriWBBT1D7xgZfg==
X-Google-Smtp-Source: ABdhPJzPA6aNAuq8vJJZQ2zuNaw+fo+Six/+8janCj/2uFbKk1RyYw20FcGq7uJXYC2wmqesTel3sg==
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr34250831wmb.129.1625771383239; 
 Thu, 08 Jul 2021 12:09:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h21sm2733904wmq.38.2021.07.08.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F0F241FF87;
 Thu,  8 Jul 2021 20:09:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/39] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Thu,  8 Jul 2021 20:09:03 +0100
Message-Id: <20210708190941.16980-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


