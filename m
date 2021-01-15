Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5452F7C4F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:17:54 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OzB-00038o-F4
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqK-0006Bd-6I
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:44 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqG-0006WC-Ek
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:43 -0500
Received: by mail-wm1-x330.google.com with SMTP id i63so7305080wma.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kRNRSa2KGo6qnJuYo+2vDEJl7aJwqXpJfAVTcsTMM0=;
 b=cPZC10f0F5x0J+ZfvCY/MjTytVwFB3n0JKkAofFBZ7UT7IA/OTzm3pnJZNBmsK3GTR
 ggwTmsIkdTInltr6ERkbuyl/mcyWgIGnfd52uIaJC4JAAILbCL/WAK1o8JUBjX/I3egq
 CkUhTNPfPnr1M3vdF/rj5orE/n15WV+oobTS9a1Vfapf9B6kMlKPKItZiu0UMGvM6nHA
 neICH8qyCWQ1hUz32csSa3YgTHcuGWwF4uduZ1aUNLCBDq0IAN0Mr+5YXmRQoNoC4/uw
 RnGXNy7M+QDrJdeVTiTj9im/nbJucls/d0dCAxxCg76LoYfiSKJ2KLeseDWGnkm5fk7M
 V+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0kRNRSa2KGo6qnJuYo+2vDEJl7aJwqXpJfAVTcsTMM0=;
 b=c/PNYKmVYLnucRUZ/+OaZgrbNgDNlZKZTi8nWKOnlHwdvbC9koPOkps4RYLZJCCfgx
 IMIgLqk4PffzJ0jiy9qejFpsZP1WBD3GPftt6rTknKsHUcfE7I6703a0vJ+F1tLs9KBj
 vIhRL03N6+OgMAePjD6+H26ZFlmm/B4gmxqlEKPSwauncpbjDPNjrAMeZIibBsZ/l+lK
 1n89j8K3Rofb6+6X1FKZoPG/HO2gr0C8PGhDuuKIeYMiaUzYbMvfDFYJ5NwrzjIYKZSD
 kHyoUIiuiRseUucarNFKzCZCT5jy8+s02Ly+6p6WKvYUzuqUDgPIFkB3aTE/lxmTp8na
 G0Aw==
X-Gm-Message-State: AOAM531wCDePhFc/IhkVi8R3q++ViUK8dsBVIWg+uiQg0Fiaaef+p1IN
 VNfjjJ7vLfM326GB0AqNTXXePw==
X-Google-Smtp-Source: ABdhPJw1bJ7+/14Bv88tnkXSawYf8AaVV0zcvCa29o/VGiqYQ5Dq3n4+PV9Ejkml/etRG7ekfYhqBQ==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr8741351wma.26.1610716117901; 
 Fri, 15 Jan 2021 05:08:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm14496760wrt.25.2021.01.15.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5BB9D1FF8F;
 Fri, 15 Jan 2021 13:08:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/30] shippable.yml: Remove jobs duplicated on Gitlab-CI
Date: Fri, 15 Jan 2021 13:08:01 +0000
Message-Id: <20210115130828.23968-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following jobs are duplicated on Gitlab-CI since commit
6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):

- IMAGE=debian-armel-cross

  TARGET_LIST=arm-softmmu               -> cross-armel-system
  TARGET_LIST=arm-linux-user            -> cross-armel-user
  TARGET_LIST=armeb-linux-user          -> cross-armel-user

- IMAGE=debian-armhf-cross

  TARGET_LIST=arm-softmmu               -> cross-armhf-system
  TARGET_LIST=arm-linux-user            -> cross-armhf-user
  TARGET_LIST=armeb-linux-user          -> cross-armhf-user

- IMAGE=debian-arm64-cross

  TARGET_LIST=aarch64-softmmu           -> cross-arm64-system
  TARGET_LIST=aarch64-linux-user        -> cross-arm64-user

- IMAGE=debian-s390x-cross

  TARGET_LIST=s390x-softmmu             -> cross-s390x-system
  TARGET_LIST=s390x-linux-user          -> cross-s390x-user

- IMAGE=debian-mips-cross

  TARGET_LIST=mipsel-linux-user         -> cross-mips-user

- IMAGE=debian-mips64el-cross

  TARGET_LIST=mips64el-softmmu          -> cross-mips64el-system
  TARGET_LIST=mips64el-linux-user       -> cross-mips64el-user

- IMAGE=debian-ppc64el-cross

  TARGET_LIST=ppc64-softmmu             -> cross-ppc64el-system
  TARGET_LIST=ppc64-linux-user          -> cross-ppc64el-user
  TARGET_LIST=ppc64abi32-linux-user     -> cross-ppc64el-user

Remove them from Shippable CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210108145103.269353-1-f4bug@amsat.org>
Message-Id: <20210114165730.31607-4-alex.bennee@linaro.org>

diff --git a/.shippable.yml b/.shippable.yml
index 14350e6de8..97bfa2a0f3 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -7,20 +7,8 @@ env:
   matrix:
     - IMAGE=debian-amd64
       TARGET_LIST=x86_64-softmmu,x86_64-linux-user
-    - IMAGE=debian-armel-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
-    - IMAGE=debian-armhf-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
-    - IMAGE=debian-arm64-cross
-      TARGET_LIST=aarch64-softmmu,aarch64-linux-user
-    - IMAGE=debian-s390x-cross
-      TARGET_LIST=s390x-softmmu,s390x-linux-user
     - IMAGE=debian-mips-cross
-      TARGET_LIST=mips-softmmu,mipsel-linux-user
-    - IMAGE=debian-mips64el-cross
-      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
-    - IMAGE=debian-ppc64el-cross
-      TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
+      TARGET_LIST=mips-softmmu
 build:
   pre_ci_boot:
     image_name: registry.gitlab.com/qemu-project/qemu/qemu/${IMAGE}
-- 
2.20.1


