Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA74E4DDF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:12:26 +0100 (CET)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWw6S-00042k-S5
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:12:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2s-0006q4-5O; Wed, 23 Mar 2022 04:08:42 -0400
Received: from [2607:f8b0:4864:20::52c] (port=35387
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2o-0004rh-HU; Wed, 23 Mar 2022 04:08:40 -0400
Received: by mail-pg1-x52c.google.com with SMTP id z128so533347pgz.2;
 Wed, 23 Mar 2022 01:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmmAvEiRbO2+MTQMGoH0MEA58hO3Osx8lQg8/v7g3Es=;
 b=H4fVLrrqfPE1WQzFW2oeSn1VMrmYnbFnwep9OXZdWnQTusx0/GH40CG2ZPtFb4FIEn
 IoUflQVpIDIR7FRuINkS5eEUykCTJT3cl9kS2bQCnMvdoHjSj1psop40nUrcnRZYj5yk
 vD7Ps2JS0sVOUwv7C72fh+iVDhWQKLrZCO731qssMvwofZ2yNTf8AanpDpMSIsoYH6su
 PPVyYiOI913fUgNaAJumZOkUyo4sUxFv7ElHlHcYwqPqd2xc1iBjX87/rHoFYA8uHpuh
 Dg2W9R1qmmY4L1BfEXfHb4CSsCOvBdPorBRTPFJyZTx4Tlq+lipi+Z2XPpwGhQ+3BxPI
 wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmmAvEiRbO2+MTQMGoH0MEA58hO3Osx8lQg8/v7g3Es=;
 b=MvG5nY+K+IJTYRXf8QbdaMCk14pzAa0gAhLahtxsTsbXHbqbpfHylKzyPU5gyMfwzY
 1jWPNzs3R+PqD5PKB0uvYB8wDxSz0r/BqRI5AJ9zmpbAu8GUl4c57lPQdxYML7ifd8MX
 8tj8p3+ikNuLxbY4JU4xQkf4DN9BRcbr9yAY07zYYEPinheTqtK3w5pnRW/S6VLvCPkH
 e8uSl+Tfl5mdDvRSfSyxZd2fddeD9BuGvntMxHG/Mo9OH4l4uh9Jje+cczzWCPyo6pEh
 J8S7Lx7TA9JSCh4J2JCBjUGmuUMWzDOR8XWm+0NA7xS0vbvC3RcE4mRYVFw37WshHo0c
 xBGQ==
X-Gm-Message-State: AOAM530A6E+exDBp7SdaiyA87NTMpxXy7MYJdxWUR5cb916qD66NFlDj
 fqbyzINU3CYGHazG1cGtQFlESOBKmD1Tyg==
X-Google-Smtp-Source: ABdhPJyIJ90Nq0Ly6B0JMV7IerbduyOWQCIYXfPAV23kkFUh3HMaxMzRyoN8pPnidbXYHEdbjMVVoQ==
X-Received: by 2002:a63:5fc2:0:b0:383:6f01:e5ad with SMTP id
 t185-20020a635fc2000000b003836f01e5admr6081220pgb.108.1648022915800; 
 Wed, 23 Mar 2022 01:08:35 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 v13-20020a17090a088d00b001c64d30fa8bsm4002999pjc.1.2022.03.23.01.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 01:08:35 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/3] ci: Add empty github workflow for reporting historical
 cirrus result at github
Date: Wed, 23 Mar 2022 16:07:54 +0800
Message-Id: <20220323080755.156-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20220323080755.156-1-luoyonggang@gmail.com>
References: <20220323080755.156-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=D0=B8=D0=B6e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like https://github.com/lygstate/qemu/actions does

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .github/workflows/main.yml | 24 ++++++++++++++++++++++++
 MAINTAINERS                |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 .github/workflows/main.yml

diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
new file mode 100644
index 0000000000..71f5fbd556
--- /dev/null
+++ b/.github/workflows/main.yml
@@ -0,0 +1,24 @@
+# This is a basic workflow to help you get started with Actions
+
+name: CI
+
+# Controls when the action will run. Triggers the workflow on push or pull request
+# events but only for the master branch
+on:
+  push:
+    branches: [ master ]
+  pull_request:
+    branches: [ master ]
+
+# A workflow run is made up of one or more jobs that can run sequentially or in parallel
+jobs:
+  check-patch:
+    name: Check Patch
+    runs-on: ubuntu-latest
+    steps:
+      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
+      - uses: actions/checkout@v2
+        with:
+          fetch-depth: 0
+      - name: Install dependent packages
+        run: echo "Empty action"
diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..01d2ce93bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3639,6 +3639,7 @@ Windows Hosted Continuous Integration
 M: Yonggang Luo <luoyonggang@gmail.com>
 S: Maintained
 F: .cirrus.yml
+F: .github/workflows/main.yml
 W: https://cirrus-ci.com/github/qemu/qemu
 
 Guest Test Compilation Support
-- 
2.31.1.windows.1


