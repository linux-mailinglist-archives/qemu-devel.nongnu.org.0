Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B43C1A07
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:44:02 +0200 (CEST)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZwH-0000Bt-Dr
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWd-0002h9-0X
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWb-0007Xz-0T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g10so4791560wmh.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfoGHez+gPo5YY5+v/6dp1kX+Q31nwpzr/cnxR7G/zc=;
 b=YN4d8jthGm3QpD70BX5V/fH4BY/bZuScUVbNSol7aRXtU1aSw0esNfAtfoGj9YZqMU
 alUWPPwcmG9kRmBH15eAibuB397hbi0yRRLr3snkR8XPAv6t2vKOBQomYHq/NBUH5L93
 CcELHSmMoItlnlophiW2Bd6jYzKpoUlZXBE/wXxwJs5XpysE/Qz3o74/kmjmZBZYM1TW
 i4y0fdBgZw+TH/69Rm5oEVgTN3qBhW7AKtxuTb3Uxw/zaFqqt6h/bORgfzhOQH+xrq93
 9xve06R/uzVMnZ4PyN4omylluappG4hcFcE9h1J3XsME2x8LBGzR+Um1J4dOdO1sT23C
 YGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfoGHez+gPo5YY5+v/6dp1kX+Q31nwpzr/cnxR7G/zc=;
 b=jkQD4wd8JBih8aKFtQ1EtQCs9Nq4a9gVd+eALmRNpCeRhwFqo9tUAdiVAFueaHx9bn
 ZJwrCNntdW39CwTnn1JuFDLmn/GBYvCchuj1DbFIfhe8xgh9T1070gi/kBco7uZaCsbX
 n5U/QtbdhEY5C4vKdNcRRleEIfarhcqJiJLHTN7hGWC9nLS5XqHSzobECW+A6IjpAesA
 SZmiqk3YuF1NPa5NtMZeKAZVlPCv1Gsne4jHSoIwsfUVhYCSIp0bTCUfBpEUsSoghy8S
 jy7Zku4C6BWQJV7Z3edCPwlh5fGuAVgzJd3ZfhWo/qdTBRMHvIqOSx1QrTHCXuvNt6es
 Xg2w==
X-Gm-Message-State: AOAM533N2Ci88HBhjvStrMNzDjULsFqhFjawyudKwiBkbDuJU2ShuQW9
 moVD4trKPrb5WFsrmMrlbCXmbQ==
X-Google-Smtp-Source: ABdhPJwf3q57W/gtHWH4dv3U7YAH8sqOmFE9vi5HNYOIu2Wk2OUJyuzlzvMnFUAhHyFU6riY4i100g==
X-Received: by 2002:a05:600c:3793:: with SMTP id
 o19mr4560544wmr.31.1625771847309; 
 Thu, 08 Jul 2021 12:17:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm2131037wro.78.2021.07.08.12.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0ABD1FF9D;
 Thu,  8 Jul 2021 20:09:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 15/39] tests/docker: fix mistakes in centos package lists
Date: Thu,  8 Jul 2021 20:09:17 +0100
Message-Id: <20210708190941.16980-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.

spice-glib-devel is not use in QEMU at all, but spice-protocol is.
We also need the -devel package for spice-server, not the runtime.

There is no need to specifically refer to python36, we can just
use python3 as in other distros.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-8-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index ee52305646..5f1c57b4ad 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -21,16 +21,16 @@ ENV PACKAGES \
     libgcrypt-devel \
     lzo-devel \
     make \
-    mesa-libEGL-devel \
+    mesa-libgbm-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
-    python36 \
+    python3 \
     rdma-core-devel \
-    spice-glib-devel \
-    spice-server \
+    spice-protocol \
+    spice-server-devel \
     systemtap-sdt-devel \
     tar \
     zlib-devel
-- 
2.20.1


