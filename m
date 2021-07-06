Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708A3BD9FE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:18:51 +0200 (CEST)
Received: from localhost ([::1]:51670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mqY-0002iV-Bk
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfD-0005Fm-F3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfB-00076H-65
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so5373780wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfoGHez+gPo5YY5+v/6dp1kX+Q31nwpzr/cnxR7G/zc=;
 b=vlhPRknyqzBI7ZbWNCRYZDhIHAwbm/vqLyV01gjTmZ1PprWsjv82Nh2qz3P9CpOkWH
 7pvMaCXV8WN8w56dyiEg7BGHnpHv1cv40ORElHC+mfmc+0zeXSDM/q5AtLyZ10UsP3Vv
 8SXO00A51wGnDPWZlV1SM8UzRi/vp8K/Q6Z1flBWs2SfNYZq1jLKjOAm8tI4If5L0IZ/
 QtHImcEma/J027xCcydmHKUMMK2tcnOXaNU5PcK7KApp+i376TITE1crgrPsSjoddvPI
 AGHwHNP34bwPsFLKDr5VOEkknlvqnDoktwgw4yA25hmmD6lBuJQk9aIM/CLfEHP75p2r
 yaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfoGHez+gPo5YY5+v/6dp1kX+Q31nwpzr/cnxR7G/zc=;
 b=t1QHVwwOoZh8SWCbgY185kUeD+UewqB2cZYATez098wsd57jrEv1hQzEAF45208lqE
 TKm7RZCYKY8gYsj5aHJqASxMxk/OYD5PGfzrYrwSvXDBiI46WoJdx6fac4FLHgF9Ee+Z
 zN8VAsQyvssokApSwFlMHidWFt1P0zKhvgzjIn5sGkWKRDMgowXbA2II0EVM6UtHCosx
 jY5VPHWjK79b7BsPX3QjbA9Ew3cQhRHvARL2VeDs+zbThZonBj2f5Ap/yHD/9M02JwvP
 9CMxgS5cJD7PN9PixY5t58eEpTRVENpUV3zGvsMP+1Io/0tnyfpnZJhiJLOnf6G9T9kK
 T+WQ==
X-Gm-Message-State: AOAM530hlADX/v7L9wQTqai63ezWPmrfhzbZ87Fbu0IFHh0oRhajddJ1
 7dQ/59YZfHK6s88tuHCyfO4gXg==
X-Google-Smtp-Source: ABdhPJwzxOV7DvOEnVaReG3OaGbLFMMy/GBRPjreVfbqImci/bsyyL4tLu/26MIMzraHa/nGuPiH+A==
X-Received: by 2002:a7b:c949:: with SMTP id i9mr4070373wml.168.1625584022611; 
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm14574113wrz.89.2021.07.06.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:06:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95D8C1FF9D;
 Tue,  6 Jul 2021 15:58:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/39] tests/docker: fix mistakes in centos package lists
Date: Tue,  6 Jul 2021 15:57:53 +0100
Message-Id: <20210706145817.24109-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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


