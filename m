Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0FF36387F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:18:19 +0200 (CEST)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGgE-0005hR-5M
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGI6-0005UT-CH
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:53:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGI4-0001GV-Ua
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:53:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id s7so31943216wru.6
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evwnaA8cIdCjxIuHS6DqhR3yWKvMOcmCdSzq2jJjUOM=;
 b=sNFJmPvZMVxZbRCedtM0rQLK9kJK5303YCzhVLKK9Hy4RLRkXEUFYNu+Z11S03FEa3
 vye5q9n3LMX5eRHbzJjKTMN9ApiIayg7Yu4KOTrfrClA508IMnhvkOU1zpmX+Wmj6hTF
 zk/z3TlanL4Fxek6aIk+vQP6ZEczfGVrd0psxbu8D99rAsRRVCOOzm3UHQM/xARwSN46
 BKoXh1Gh8w1mDmFerHoivd+ZzWt+mK4w1TuF/cwooT7i2wNh58JzUIiPicHpvrasijnu
 9BRifIrFdPo64heb/K2/TBP9pr2TP+buSQtaE4K5SG9pTNsJ/1XBBwIfD0+DRetxFvxb
 xmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=evwnaA8cIdCjxIuHS6DqhR3yWKvMOcmCdSzq2jJjUOM=;
 b=KgVXxwrF/42XwVHDm1FGhJX8J7q/EjRT4Tpl48xZ5+v2A+vClNoflhJMd1gEnWUu/T
 3vvW6CDxmZUC+Up7Lr3lGKGghAQVmSsGhc/GG43NZvxEF/cBIk/YcOTHE3D5/xddZebJ
 f8Am0lPr4eF0+9qwHvBQxNOl/Wu4C1gVlTIbZ3vq2wnBx+fSQKvCdfVqI2cjqvGSCxk8
 yMLXM2hpUiProDm3noYaKthemL6W3ey21OKco3mNzITueSZ3NIOBPEg7mWpxND7qeTo5
 SsulqOPFMbooZd4sQ1VzHeQajEh4q5WkcB4Qp7Cnn6YSCDEZP71WxlasCJ882m1bBike
 J5Bw==
X-Gm-Message-State: AOAM5300h8oa4l8u9sP7hGsBRmcEFmYHq7EYMDklN+Xl4hzgO2WrRuJW
 8hOEKXWBrTJkFhMk1VEuxyK/aUFUfnPJMA==
X-Google-Smtp-Source: ABdhPJzQZO3IkyXBFCVqdWhAK9OTFGIkwN7lUpb02ZKoOR6iHNAApW7EXsh1Betl2wU+eE0eE22IMw==
X-Received: by 2002:adf:e790:: with SMTP id n16mr10721262wrm.278.1618786399178; 
 Sun, 18 Apr 2021 15:53:19 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q17sm20376364wro.33.2021.04.18.15.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:53:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/29] gitlab-ci: Add KVM mips64el cross-build jobs
Date: Mon, 19 Apr 2021 00:50:58 +0200
Message-Id: <20210418225058.1257014-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new job to cross-build the mips64el target without
the TCG accelerator (IOW: only KVM accelerator enabled).

Only build the mips64el target which is known to work
and has users.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2d95784ed51..e44e4b49a25 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -176,6 +176,14 @@ cross-s390x-kvm-only:
     IMAGE: debian-s390x-cross
     ACCEL_CONFIGURE_OPTS: --disable-tcg
 
+cross-mips64el-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: mips64el-debian-cross-container
+  variables:
+    IMAGE: debian-mips64el-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --target-list=mips64el-softmmu
+
 cross-win32-system:
   extends: .cross_system_build_job
   needs:
-- 
2.26.3


