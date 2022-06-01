Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A361B53AC7E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:11:25 +0200 (CEST)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSoW-0000pd-PS
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj2-0000nk-2n
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:46 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj0-0004vl-G2
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b8so3246190edf.11
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRQGucPr2Skix5uZ1kMmZ2lma7cwR+iFE8QMRTICesc=;
 b=xKAfbJjlTjWyk7IldijEAXCLG/ENWhP2njT4I0i0ksaxO3qOuXUh+7IrwHyln9izrF
 ocu/Vfe88rfGycvD+0WlelDJ+g5/20eJ+QCEtVbkhzgKbgYUBohjH7eDDHr99YqAsOep
 5mLRZFBQneCHe8/eLQttwrvsXU5XGKXTi2ABeyWikkQqV3s4l7EDriQLoxVdaAgDIXdu
 4CkbHKclwfUoVPpjhNOicAhsmLtSJ++tPzF9IaVEbkzC6uubxEaUg95wjyphn6XBVRJM
 wag3vrB+0nxi9h5F72IrrdQRv/xKORT5+sZTi1aVlShKcm5WzwlJivhcrLwSR1YUJ+Kp
 112w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRQGucPr2Skix5uZ1kMmZ2lma7cwR+iFE8QMRTICesc=;
 b=1NgPUPsIempFtQMkzbKuTNVrZ6m26PugUCVyVSiwheErdF1/z5EDbTOqhVmBHKLY98
 II6CfCKVQGL/rj0JfiJJhVj3HMj0SFJn9VILv3/cfMpSyQNsTpKyfQobrQ1X+c8v+wR9
 d3oe4YbT3xTgWfKQBoevlaCdOcZPNzVsc9Yfax0dNgPXqZvZduIs07omkUDRc3jJ11Fg
 pxBt4L+GOmsebbL1CT1VDXOGNhFzckollDmFiCAWu35+DrA2PuQSbgFIq/b/HdbKsDko
 HwBvS0MpiOSOapBD9bkZQZbWvGUWpDs6HE7BMm/+5x5TlBHSJMBr7RFgNw4e/h5+gr2j
 yV2A==
X-Gm-Message-State: AOAM530WNMAzI8WKyVSjrZvc/7QO6WkXobLW/NXHvoTlnFDwX/Umy2Ng
 id74PenQ2Oyq1Yowp5ukjAt6Dw==
X-Google-Smtp-Source: ABdhPJxdXOH0ooM28TTKS9Gwq2oKOfFshDqmsf5b0FSJkGJRA6F10iwKYTF/vUPA/WzuAk/9oXvO5w==
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr1068355edb.118.1654106741176; 
 Wed, 01 Jun 2022 11:05:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 hz14-20020a1709072cee00b00708e906faecsm480563ejc.124.2022.06.01.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEF3F1FFB8;
 Wed,  1 Jun 2022 19:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/33] .gitlab-ci.d/container-cross: Fix RISC-V container
 dependencies / stages
Date: Wed,  1 Jun 2022 19:05:05 +0100
Message-Id: <20220601180537.2329566-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

The "riscv64-debian-cross-container" job does not depend on any other
container job from the first stage, so we can move it to the first
stage, too.

The "riscv64-debian-test-cross-container" job needs the debian11
container, so we should add a proper "needs:" statement here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220524093141.91012-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220527153603.887929-2-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index e622ac2d21..ac15fce9b6 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -125,7 +125,7 @@ ppc64el-debian-cross-container:
 
 riscv64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   # as we are currently based on 'sid/unstable' we may break so...
   allow_failure: true
   variables:
@@ -135,6 +135,7 @@ riscv64-debian-cross-container:
 riscv64-debian-test-cross-container:
   extends: .container_job_template
   stage: containers-layer2
+  needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
 
-- 
2.30.2


