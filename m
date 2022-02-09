Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20104AF4DD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:13:32 +0100 (CET)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoex-0005bJ-T7
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHntu-00008e-KE
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:54 -0500
Received: from [2a00:1450:4864:20::336] (port=39895
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnts-0001Ki-RM
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:54 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso3274667wmh.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZ790G2I3UeySFzK6yKCGZIct4D0K3V4i48HVFMMPoI=;
 b=Y2mAi9KCIaDep0o/UElhIVbUe/0bLB57BkeI1MOSgR5jE1jGAwS5dyK2LbSXTnRRGs
 1uHIdYJ0e95x+4YZ4dzi5Ankwfcl7GkEW2dv1P+lOK74NxcrDtfjEHCPcA9WcukHqs7u
 16aEC1FrJpJkcsJhV3s8vSH1WmgMe9PfwpoZJBuwDH/bQ+C4S2uAdYVN/N0yPHpUtAx8
 jsv90t9POTQVqB0wo8MDtNpaqco2QqNo1qW8n0LgC4A6YlO8XrXzf1dmMgzSgFdbk8lz
 6uwErDE3v3MwJOkChchq5F0CFB8ItKCVnR6pR9PdUqSue92WIDs4nNWywGFOlkXZFRIM
 qlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZ790G2I3UeySFzK6yKCGZIct4D0K3V4i48HVFMMPoI=;
 b=jvdCEKshYp4rgaMUp4qtCJvMDEHLNzYKeurbk2Daw9XIG7Ka1m8/4ieq9GlXCntKYA
 fhGQiHigVHTTMP/uT+hVL+upM3VRVnTLIO/GQhz2pY9dvGWucHYBA9bgThOhHs0yAggS
 2zbFBDylwqVrr/YrEvj0+g6racG+w7P+EjZWlYCZEhXZbjV0x2eMSJcLT8h7iIb6zXMT
 Pnz4fuT4/km3zLwlk2bHHlLzN0ugyg2mq284ZpS8/v/kD6+OMWVP23mcMMKxoqZwDwv0
 ZV1jqExnHmjG9TUSHOX6kmnL8cT/lPAtbjesfjk3PnKQcn+q5axPqvuVuolt7Tzr5Lu2
 QV7A==
X-Gm-Message-State: AOAM531NJy16z4FVXYO8386CTytCStsb4CnEo1ku4Pa5cq/3zC678gVq
 Af7npXWj2eMyO6UEpK4+v7ZggA==
X-Google-Smtp-Source: ABdhPJwj/oDxCRrmH7NU6Zse2Oqg72fVOwYG/vYb13kEYKcqvh9y05BOrcyLpZ3Evmk1XeMaru2HNw==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2268805wmq.53.1644416691158; 
 Wed, 09 Feb 2022 06:24:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm16466912wra.67.2022.02.09.06.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 52B761FFC3;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/28] tests/lcitool: Install libibumad to cover RDMA on Debian
 based distros
Date: Wed,  9 Feb 2022 14:15:12 +0000
Message-Id: <20220209141529.3418384-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Message-Id: <20220204204335.1689602-12-alex.bennee@linaro.org>

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


