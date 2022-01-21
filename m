Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77047496266
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:54:11 +0100 (CET)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwEs-0003vh-8i
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw3K-00022T-6p
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:42:14 -0500
Received: from [2a00:1450:4864:20::430] (port=41862
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw3I-0007wy-Co
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:42:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id v6so398213wra.8
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSvX07XSbcj+uZJduxG3G9nv8iqDtt86eLgBT/T23uA=;
 b=Q8WOhkwpW6oMWe3COIvMSUH3g2ho6zbTZEGH0sxHWgqu0aGYzweXzPU8P5zRAN37Mc
 U4Q1ZC4k9V+c8TOhzdvFutW57oj9ejzngwRQ4C5MT5a0PYqSlPbo89jfmZ7JMDUX+GB5
 7kfTMiC1l3Ht5NNLuNNILnVIZcTn1Fn31RgwkBEJZVmAYmK6tzq+FUbFy48c3Pg45Rsg
 qIf1u/+a2uWc5ZXpRytytSu76wIj8VeE8Wq4Hbe/ES9tD6z51GxUplPfXYLMb7jxJ2EZ
 fXngHBSZzfog/LHs/LETOyUgM0hrzMKAcIY4N6k/QeizLmQqcz/xBFcM7bR7csKvGpUg
 7gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BSvX07XSbcj+uZJduxG3G9nv8iqDtt86eLgBT/T23uA=;
 b=eQ9Itzw0znHOEJlarpjslswn4pGpTBxlAfJMSbl/FHl43lMYgS8FrEFvnv8aPj5rvf
 MMaHq79Ckl5sLl2BVG4hGnLKiJy35fHJlyksOQCZk10lHJhUFtUOxyui23ZSr6VjZEDn
 O48EDszmxzROe0EA4ssxHfoW65WESfceuOudL8PNKmJ+gZlB8/zH6zsrXJPBHPzJTzFX
 CqyL3z7TgRhgZQl8DbmMJaN5dKdCxr/6mekgzCmk4BEoj/E2BZCvqmEbtmvwcRAWfd88
 3LZbYu+jNxMXbYQBOR6//AE+Ep4UxoIGrujs7m0xeEYZUOueUT8ssicTMstkWg8Q5EtF
 bVtA==
X-Gm-Message-State: AOAM533fSCvwWXZF0TWEdLCE0J55i8/koRScEMm/FV9WhcTR1qHw/2B4
 zAtjXkrMHoArwFQi/4+DPrlaDRyZU/M=
X-Google-Smtp-Source: ABdhPJw5CHlSIsbi52WALW09ioFHFoXVhUCkjQb6+6gBzK+Lor/ikHwQIr6/PSpOdqaMLRBs3PPF8A==
X-Received: by 2002:a5d:5046:: with SMTP id h6mr4373661wrt.167.1642779731020; 
 Fri, 21 Jan 2022 07:42:11 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 k35sm11583440wms.23.2022.01.21.07.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:42:10 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 7/7] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Fri, 21 Jan 2022 16:41:34 +0100
Message-Id: <20220121154134.315047-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 003ee2cfedd..699f2dfc6a9 100644
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
index 8993d2d9e05..87513125b8e 100644
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
index de51a2f1dd4..958868a6ee9 100644
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
2.34.1


