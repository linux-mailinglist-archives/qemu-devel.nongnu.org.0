Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0FB4A6638
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:41:59 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzyP-0007tj-OJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:41:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cp-6P
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::535] (port=44711
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000cx-Ab
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:37 -0500
Received: by mail-ed1-x535.google.com with SMTP id u24so35875998eds.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3pYD4JYSVXhkyNJUs20bvFwaG/zT+sknHaI6CYVatE=;
 b=kcyxh01/gslM/0brNF9g2fsP1oIF8Tq96UUdztTset+YaQluNeyfOkr/a2M5tziU8Z
 AHjEHtQPHjqMNFVvriPkpRj/5wGs/YCel/Lt08x7vGc7EBkqyGlSqe2KWrGXSQeDtkWs
 iQxO8kFFqR5GBMqw5BMXrV86UiESlmbMkKzl9ERbhhmwjoA80D3Oyo5UvEhd2IyUw42J
 xrOkISobbZrRZL93CjLKrmhm1QbuWRUITvuK25VqrLyKmPvLLaffODIWbCahSG6PKxp1
 oivsN7P6XNiVL+BgWHVQ6mqtm0fIyTOfU0Z7Iv3/Umagp8Rp4zIwKcw+39Ee8LONJsZN
 pPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3pYD4JYSVXhkyNJUs20bvFwaG/zT+sknHaI6CYVatE=;
 b=58gihMPJqa7O5++jIL0GJnX7gbxyVvYZdRWRkkMVLehRJF9yf149GW+S5myxSkBsek
 5GJVBsH3Hj9FY47pyrQdSOVGrzlt0ubbarcuwakqlSnM5+YDBbSldXhbfrZ6KdGRo3he
 000h1n/47fxc9eF4KzK85dqw9TYBPAbSmSQ0K5vtspXV7uopz0O05V6F8sYdy+qFCJSo
 zpNid12C8cF/nT5grHFeRFA6rXcfwiyKIKxTaPQjZoE3pGjFchybO0odmsHjiAv9Nbu1
 MGAD850mXQDkBPuqff0COUWQy2SLScGo3vb3N7nYCeNLdmgcUjMDQAwHRtyplrEsPF5Z
 5zqQ==
X-Gm-Message-State: AOAM533Be48aYU9l9wc5XlCG0ygvb76aBUo9Y1VhkLm8tVjRm+ar1rzO
 Trr+AoxuSZdOlNpDkVLMVHcgCg==
X-Google-Smtp-Source: ABdhPJzzSZCTtMoFAHg9wmIZx+akUTAIZhH70Rc1ucSWh9lupjxUsN4YWSTW1Z9kqnzkbFtBUqwOqQ==
X-Received: by 2002:aa7:d949:: with SMTP id l9mr27060921eds.348.1643739664153; 
 Tue, 01 Feb 2022 10:21:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lt2sm14754692ejb.50.2022.02.01.10.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7F941FFC3;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/25] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Tue,  1 Feb 2022 18:20:36 +0000
Message-Id: <20220201182050.15087-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

On Debian we also need libibumad to enable RDMA:

  $ ../configure --enable-rdma

  ERROR:  OpenFabrics librdmacm/libibverbs/libibumad not present.
          Your options:
           (1) Fast: Install infiniband packages (devel) from your distro.
           (2) Cleanest: Install libraries from www.openfabrics.org
           (3) Also: Install softiwarp if you don't have RDMA hardware

Add the dependency to lcitool's qemu.yml (where librdmacm and
libibverbs are already listed) and refresh the generated files
by running:

      $ make lcitool-refresh

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-8-f4bug@amsat.org>
Message-Id: <20220124201608.604599-12-alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 003ee2cfed..699f2dfc6a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglib2.0-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8993d2d9e0..87513125b8 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -53,6 +53,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglusterfs-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index de51a2f1dd..958868a6ee 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -43,6 +43,7 @@ packages:
  - libfdt
  - libffi
  - libgcrypt
+ - libibumad
  - libibverbs
  - libiscsi
  - libjemalloc
-- 
2.30.2


