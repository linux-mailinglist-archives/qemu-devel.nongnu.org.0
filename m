Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE82F66E2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:11:05 +0100 (CET)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l069I-00057O-J0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wQ-0003f4-Ug
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:46 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wI-0004w5-TX
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id d13so6489425wrc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ch7GsHt+SSbtBBaYncufmTI/czGpspTP6l7HIqnR1v4=;
 b=FCPQRZWW0ehxxVzYKqRQcmNDnWUUcYDvGASlEMaaJ2uFTKAnqGzUWKbrV0yG4rqCsx
 Iv2/tm+xQcuFLBLlBxiwmZDz1x0TbZGjSssjeztNcVFRKI/F1OfCQ7Rj72mCOHmEKHSn
 H0P4bdWG+hD8Jvcz10GYlCvBKAhxS85wgJWq8QswA7Tt1v5fUQBdTa6kiZzYZqS3pG8l
 Zo8Jd8La419WtpASawHogJAEfBl4BmzW/LBrKGjEEltwTfi0bf8T6xFAH9KGvxHKPL0I
 7pK5HXwOpsmAv6VIZo2KXjd6YLyIH391hN5t8C/8pYAQzvOUQxCgYFYll1txffTNWehN
 QisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ch7GsHt+SSbtBBaYncufmTI/czGpspTP6l7HIqnR1v4=;
 b=t1Mq5E1ig9aOwbNILYbdF0/vdlRUYuNuwA0wxqEDrVi+hZxLzHVzsCkJwfFiyyZRNM
 wQ9QrJO6Wr40qrr8+7UUioee0scAfdmOxmmGSxADJT9VXnyNnz6GC9NrR2nXMrn/ToCo
 tau0dHREcqCgeou0e5C8m7qm27HJsqdJxIyVzKkwJr38GsbQoqyBL+d3dFNs8uhCx67Z
 NI19W6qUbqFZYMJowgRI2mxM8WA6kid4Fk7Frkh2mKJfMdAIv67onASqe2qbY3bLpmGX
 htBz7FCOFwH2r6zbQUN+MbgkyIMgz91WZUXyUmpdTnRJtAJNkI2i1/gI9FNHEFeze8VO
 WsZQ==
X-Gm-Message-State: AOAM532RqHXgBbnh3dj1zG/bAwBGrlUu4KfiUGPYRYmTygk5D8avmUFn
 hrnbWyLRvGaOeVyTbcwhRfm1oA==
X-Google-Smtp-Source: ABdhPJwaAwaaJaRdNKGjDvy1k+pQkCsyYvbxZ7RaV1wiYX/DnhGZDPWV+tOxxWvRESgr90kkAHTxxQ==
X-Received: by 2002:adf:8342:: with SMTP id 60mr8956437wrd.140.1610643456746; 
 Thu, 14 Jan 2021 08:57:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x66sm9352404wmg.26.2021.01.14.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DBE51FF8F;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 03/12] shippable.yml: Remove jobs duplicated on Gitlab-CI
Date: Thu, 14 Jan 2021 16:57:21 +0000
Message-Id: <20210114165730.31607-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210108145103.269353-1-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

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


