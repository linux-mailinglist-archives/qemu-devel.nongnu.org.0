Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5191F7D61
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 21:10:16 +0200 (CEST)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjp4B-0004tI-R0
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 15:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjp2K-0001p8-Gp
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:08:20 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43565)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjp2I-0007ag-SU
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:08:20 -0400
Received: by mail-wr1-x442.google.com with SMTP id l10so10819202wrr.10
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4XFLJYI4xAPs7JF4qUWP5IVqk/6eCNTCwzMmtm4pqYs=;
 b=Dp3DIHB+qyea8R6laqsJbqTIvwknkgiN/Tt/9JxzM9/p73heAbkGjYV4LuBx9I8vFY
 tQF/rXFA85LU1682jUG+0tcFzBqIyJD076d95cEfOYzqjyNsUtsqEQoGkI8sRvD1Fvl8
 7dFa9fj+2oKI7B/9tSXK4QABwd0Ayln2io7jdJG0/T+v1y9G2qNJlg7sKPILV4Z2adig
 iH8nU9f5gKL8U30UGay80nWkmAegDbOeJTYarCv+NBxCkK9EmrsQGXZcMmiq+r+y6psJ
 3iEpJ0rbZ0Ry8/P3mkn+1S6MfXB/IsUoTZpr17Ztss+GiUGKMnhJuAvFR2UAObuBBFKR
 8dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XFLJYI4xAPs7JF4qUWP5IVqk/6eCNTCwzMmtm4pqYs=;
 b=VQOyg73cpJW/JSqV41oCKE7Lh9jeDrxbBOOTsnCzh54jZrkY3vheQjTjNUEpRsaVly
 F5u7PkdaqVsoriOaofXmKQyVVZ3BOhnC+yXly2P8sg/M/cWR6TSIFU6iRan0iNLzUd0a
 YV3tltYtrS8nZjIRtXiNf2vb4GzMPBWzGkCGEP26MQTXFaBj74dnFAmFMNIIDs/H3f2o
 xWrZadXvhlvVvOhPAsdvzu7airlzGF8XlV4kuKDWPTfxMQMbhiBq9DL53gbS/89AYVV3
 Ljd2SCzsynxxsC7xyxyKYtQ4Q1oD8+8Ej9z9cSp6uRulSxhpGvV/mS6vcgjKif7pWLwl
 Ul5w==
X-Gm-Message-State: AOAM533KyQaNy5dIgN3x1UMcJIz9buc5oNjBrzMxMq0AjQModZgO2G2p
 JttCX0yU9TNYZsL1A1s3aXRZUg==
X-Google-Smtp-Source: ABdhPJxB0oSIvYjGw6zeb2yiJQ5rttImeT52cEINZtFjjwf7IclrdMeVvtSM8eEhrcIfuRRKmkN3wg==
X-Received: by 2002:adf:bbc5:: with SMTP id z5mr16675085wrg.269.1591988889517; 
 Fri, 12 Jun 2020 12:08:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b81sm10672918wmc.5.2020.06.12.12.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:08:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA9D11FF9F;
 Fri, 12 Jun 2020 20:02:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 17/18] Revert ".shippable: temporaily disable some cross
 builds"
Date: Fri, 12 Jun 2020 20:02:36 +0100
Message-Id: <20200612190237.30436-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612190237.30436-1-alex.bennee@linaro.org>
References: <20200612190237.30436-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 12d43b5ae916809aad9ccf8aa2a0a06260527340.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

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


