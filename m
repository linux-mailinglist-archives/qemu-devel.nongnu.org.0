Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC00D1FB1B5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 15:08:39 +0200 (CEST)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlBKR-0000vp-2G
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 09:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlBDf-00087N-43
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 09:01:39 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlBDY-0001bV-LH
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 09:01:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id t194so2967128wmt.4
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pebc1rvm4QpzZR21Sv9G/9W/4CetnSIYeIw8sTyXjd8=;
 b=JoztH67sruTVc+HlvaSpbiEdM3QOY1QEOIbOzLuOGoGZjtmNo3NxXsxHyfjO6gAOil
 baxzFGq1/juM7hTJdGMWS6Qi94yos46TYFZyuoIvkYu2pR0C48wrEmsdW+j69VyyZ1vv
 +33AIhV+frDAXOZHMuHUiH6x91ZUNTNj7XWF59vUEp8xJQlkL1LPgPtuHOkI1H+VptGf
 8iOIy8JWQglQ3hO0Sd0wYVmCJmLLWY8x45TvfX6aATXWmc3A1+lI9ScFwpgud84zC15c
 bdRZ/jhTEW2yVcs5o/8AIY6iKipqN2gaB20+uuYz7oJ4mtu+10jbXZJRUMbaxD5MxddT
 9liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pebc1rvm4QpzZR21Sv9G/9W/4CetnSIYeIw8sTyXjd8=;
 b=kxN779+6/j0DkWug/Aa8qgD/tLRx2J2qw35sO4iSeyKgGmmTeCchj5/eUhKnV5gLpU
 sT+/qD975bPu3onmzeZsr1jNzZI9LScZC3kyvxVNuHqmGXZ6x0hKnwUWiAtovP6eA1K5
 +uo0zI4ETInsqx74UEmQUYwmce6oC6Oe7KUUJcorVlrKheIWTlt4ZtLzOxCWss7jRc1w
 XzcSm7YZYXcRqXAzcKNjLpFQc25CXwuGy160HldoLWvdvmw0e8W3pbXJAljqm4mPwCdP
 Fkmy68VDdgJN2LRrZdEVW52vI6byvqeMqDQX5PWhT+m8FBoi4FaXGyG4wNr5aT06xEhE
 IboA==
X-Gm-Message-State: AOAM532cKaVmVfWHyb08Vw3Fniauk2TBZJ7Ar5U5I0MAJi9Crzhm0ZXp
 ZdBOq9OFzbddyDLS2ayDlBdqlA==
X-Google-Smtp-Source: ABdhPJywDbcT0ZQdvbJM0tDTPnDP8tY5Rb7d6lT1nOumi509jZx8DEhBub9O+wYHAJeijmtyDbU0hQ==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr3246107wml.77.1592312491268; 
 Tue, 16 Jun 2020 06:01:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 23sm4003300wmo.18.2020.06.16.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 06:01:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDC9F1FFA5;
 Tue, 16 Jun 2020 13:53:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/21] Revert ".shippable: temporaily disable some cross builds"
Date: Tue, 16 Jun 2020 13:53:20 +0100
Message-Id: <20200616125324.19045-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616125324.19045-1-alex.bennee@linaro.org>
References: <20200616125324.19045-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 12d43b5ae916809aad9ccf8aa2a0a06260527340.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200612190237.30436-18-alex.bennee@linaro.org>

diff --git a/.shippable.yml b/.shippable.yml
index 10cf219bff4..2cce7b56890 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -5,8 +5,8 @@ env:
   global:
     - LC_ALL=C
   matrix:
-    # - IMAGE=debian-amd64
-    #   TARGET_LIST=x86_64-softmmu,x86_64-linux-user
+    - IMAGE=debian-amd64
+      TARGET_LIST=x86_64-softmmu,x86_64-linux-user
     - IMAGE=debian-win32-cross
       TARGET_LIST=arm-softmmu,i386-softmmu,lm32-softmmu
     - IMAGE=debian-win64-cross
@@ -19,10 +19,10 @@ env:
       TARGET_LIST=aarch64-softmmu,aarch64-linux-user
     - IMAGE=debian-s390x-cross
       TARGET_LIST=s390x-softmmu,s390x-linux-user
-    # - IMAGE=debian-mips-cross
-    #   TARGET_LIST=mips-softmmu,mipsel-linux-user
-    # - IMAGE=debian-mips64el-cross
-    #   TARGET_LIST=mips64el-softmmu,mips64el-linux-user
+    - IMAGE=debian-mips-cross
+      TARGET_LIST=mips-softmmu,mipsel-linux-user
+    - IMAGE=debian-mips64el-cross
+      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
     - IMAGE=debian-ppc64el-cross
       TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
 build:
-- 
2.20.1


