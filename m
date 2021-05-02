Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC7371017
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:24:20 +0200 (CEST)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMNn-0006ya-81
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyC-0007nj-7q
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyA-0000iX-Dp
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:51 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b27so2967355pfp.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1dXJxoWD9fgfTfEfcLIxSrOASSLvYXRM4KT38hcQ+aU=;
 b=JfCyYeUhF1kLruF4L6L4FyK0R7DIITUbLJulRzQichseYteJKYtcdXDKpsC2f4WJ4L
 g4hwsA4wgcu2idy6ZgOjv8Un8xfZQ+VDKCNPh7EM128Ks2XJ3JeOiZxwTp4ZntpRrAX8
 TDY5quB+WlYNAlqmekw2GcQxFYmuN4/8q8uq4Pu35n/7mwEMpNE/py96/hYFTI0NeENB
 LzSlwgvC0PL+ASniTpz3r6Pf01vnV4phbxy574usi5bFhleo4xJiSAIB64Xh1DmHBKNw
 +3VHte1n//5HKHeaS/4tKvi57+RbENsREVbYpV6yvTLbwS6qLKia+8juli2GQRK+l88A
 3A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1dXJxoWD9fgfTfEfcLIxSrOASSLvYXRM4KT38hcQ+aU=;
 b=hBqQO1pA5axDMyDyFoyG7LbT8yovGXkLR5zYp8X82wIQR7NInO3xeyqTUet/pVayBd
 wYbMzGLmWpt3fbZB077nDQGnounyFju6GUCWwAd+8hp0KoyoJ8P6HFsv4dV86C+R3iBr
 tMOvFPTJRSXFNUeBNrTMPIr5Mkvs5GauLiAroSHegwjIrVQxmI9PzZky3093/kw/FdBE
 eF2/udFvvrnb9ym+zfyhzdTmL9hVF79V7vH9SLkrJ/szjUFgggZVqQRmqDTtQcbL1dgm
 tJnJyBVgUmcEb20BfW2Cwx2xmLiMeANhx/lzFOC8p7Ja1chgSj8xnyK2+L3/t/OZpKw1
 LZEw==
X-Gm-Message-State: AOAM531TvKdiVGTyjkTd0FNx3JbpabpoY25BMU0z0zSnRNVD7s9FT92N
 Ar4FeI0fWcAmN/qhJt6c/Vd79K3xJvNERw==
X-Google-Smtp-Source: ABdhPJzPimdeeTKQbiptVQdVhobfdo2p+bOCKhWfTdaCnS4w4cF7fsKRkdmFXN2Sp/f6WgPDdI6MoA==
X-Received: by 2002:a63:6f8e:: with SMTP id
 k136mr16207763pgc.326.1619999869271; 
 Sun, 02 May 2021 16:57:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 25/26] gitlab: Rename ACCEL_CONFIGURE_OPTS to
 EXTRA_CONFIGURE_OPTS
Date: Sun,  2 May 2021 16:57:26 -0700
Message-Id: <20210502235727.1979457-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2d95784ed5..fbf7b7a881 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -16,7 +16,7 @@
 #
 # Set the $ACCEL variable to select the specific accelerator (default to
 # KVM), and set extra options (such disabling other accelerators) via the
-# $ACCEL_CONFIGURE_OPTS variable.
+# $EXTRA_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -26,7 +26,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
@@ -174,7 +174,7 @@ cross-s390x-kvm-only:
     job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
-    ACCEL_CONFIGURE_OPTS: --disable-tcg
+    EXTRA_CONFIGURE_OPTS: --disable-tcg
 
 cross-win32-system:
   extends: .cross_system_build_job
@@ -197,7 +197,7 @@ cross-amd64-xen-only:
   variables:
     IMAGE: debian-amd64-cross
     ACCEL: xen
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
 
 cross-arm64-xen-only:
   extends: .cross_accel_build_job
@@ -206,4 +206,4 @@ cross-arm64-xen-only:
   variables:
     IMAGE: debian-arm64-cross
     ACCEL: xen
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
-- 
2.25.1


