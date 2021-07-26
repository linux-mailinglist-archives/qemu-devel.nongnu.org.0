Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A823D5C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:08:08 +0200 (CEST)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82D9-0006Xj-KT
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829x-0000lh-Iz
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829v-0003SZ-NU
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slgGxAsxuhtdVRDSkYHJEvP8LFK322faI8oQZGFBAXs=;
 b=ekKgKv8fVRHjSywcTizUHAz0imPqUNvQr7yeQ5V4FgHZYsy1SBr18ag2zx8hKrBqb+OOMA
 jBdtCN02XATQ9ZFCmurbbExbI8KELSqPqVkhlQEum9kwMUa+VMZZssNglyaTqiWvqQeVwn
 uV3XIiJ5YEaqnCY/Waq+qHvZ/+XpAMw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-UOx5nrabPam98hHLpVjXww-1; Mon, 26 Jul 2021 11:04:37 -0400
X-MC-Unique: UOx5nrabPam98hHLpVjXww-1
Received: by mail-wm1-f69.google.com with SMTP id
 o67-20020a1ca5460000b0290223be6fd23dso697056wme.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slgGxAsxuhtdVRDSkYHJEvP8LFK322faI8oQZGFBAXs=;
 b=WQXTUp40D7NI4mRXqFhoDkLCzbfSnKMfL5xJdkACoWdx7olIIYciYvHi+5l3TYprZd
 ofT54saz0yqb4N2lsI3cZyoAPw+UN5Qtzct5H5PRUVud26EWyvGT8r6k3lBDE/xyQT8w
 TxT8Wj6rQJ/tim5O/uM3w99JY/XrKErPe7AW3tUyHBcs05bmDeHpyV8XOX6eYqoeZS8S
 BOJ7uniMTQcoF0V4WrHvYON7dVutcmWzpWPPBjtrfy9ZQ/fkr/wGCGJUnjVw0WfZ2vhO
 WXcEJokTtZFkCxSCSB2vd2MGoX4jY7w0vyny+Li46qnD1JrrruWdPhvhh+M8XdmKV1ye
 I2bA==
X-Gm-Message-State: AOAM531NDzo9rUP2X/bGqffPfkhgqfTMHVYaXlMynPGqmrNrk/WiWUzn
 p95ge3MTgeKR7kCPqkoUuX5pK1GH5LL2/TLmc8hzcYNRM0vijtm3o7OKq+ccRtGG9cbpZD2pIC6
 AaiHlVtBsKSBRnkAob7LeU+W9GFgfJ7u1B6qIVscUkMDi7+g9K2L3X20qRtyM9/Fq
X-Received: by 2002:adf:f908:: with SMTP id b8mr20271741wrr.302.1627311875719; 
 Mon, 26 Jul 2021 08:04:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJZlsWpsLS1NPp5Nss4W4Vu73JatZGwGLI3ItNgVJEY0AiQV+rEdhwZbOkZioWHM+hSlFzKw==
X-Received: by 2002:adf:f908:: with SMTP id b8mr20271710wrr.302.1627311875503; 
 Mon, 26 Jul 2021 08:04:35 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 d24sm13775875wmb.42.2021.07.26.08.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:04:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v4 1/4] docs: Document GitLab custom CI/CD variables
Date: Mon, 26 Jul 2021 17:04:26 +0200
Message-Id: <20210726150429.1216251-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150429.1216251-1-philmd@redhat.com>
References: <20210726150429.1216251-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
("gitlab: Run Avocado tests manually (except mainstream CI)"), but
forgot to document it properly. Do it now.

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml    | 19 ++-----------------
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index b3bf3ef615b..53df04afb7f 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,6 +8,46 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
+Custom CI/CD variables
+======================
+
+QEMU CI pipelines can be tuned setting some CI environment variables.
+
+Set variable globally in the user's CI namespace
+------------------------------------------------
+
+Variables can be set globally in the user's CI namespace setting.
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
+
+Set variable manually when pushing a branch or tag to the user's repository
+---------------------------------------------------------------------------
+
+Variables can be set manually when pushing a branch or tag, using
+git-push command line arguments.
+
+Example setting the QEMU_CI_EXAMPLE_VAR variable:
+
+.. code::
+
+   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+
+Here is a list of the most used variables:
+
+QEMU_CI_AVOCADO_TESTING
+~~~~~~~~~~~~~~~~~~~~~~~
+By default, tests using the Avocado framework are not run automatically in
+the pipelines (because multiple artifacts have to be downloaded, and if
+these artifacts are not already cached, downloading them make the jobs
+reach the timeout limit). Set this variable to have the tests using the
+Avocado framework run automatically.
+
 Jobs on Custom Runners
 ======================
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6dc5385e697..9762dda2ee3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,24 +16,9 @@
 # QEMU CI jobs are based on templates. Some templates provide
 # user-configurable options, modifiable via configuration variables.
 #
-# These variables can be set globally in the user's CI namespace
-# setting:
-# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
-# or set manually each time a branch/tag is pushed, as a git-push
-# command line argument:
-# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+# See https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
+# for more information.
 #
-# Example setting the QEMU_CI_EXAMPLE_VAR variable:
-#
-#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
-#
-# ----------------------------------------------------------------------
-#
-# List of environment variables that can be use to modify the set
-# of jobs selected:
-#
-# - QEMU_CI_AVOCADO_TESTING
-#   If set, tests using the Avocado framework will be run
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.31.1


