Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBACD42E462
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:47:07 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9VD-0005CK-1U
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sr-0002ki-6L
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:41 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sp-0004I1-Fc
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id 133so6867519pgb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1+rY5rnwtcK6SAxE1dwNh38A5Yih7Yp0ekvqLa8uqsc=;
 b=Eym6ifqDRG6ysNnNm74/GuKrLw/9IaOYVZflJKCtoZjHnutVhaBx6k4g2BOOBQ9mth
 qXgmHdfus+OBaZ5DFCc9XszCdC0kpN+NHcSlo1S9eSuGqwLOqGkD2nC3GNdLaUnzD1fG
 +APiz4fjr8afl5jXeZCkbysISt9Sjz8mu+XjObBHCtY7mXpJJUsfh0u9RbMyTFYsKnZ6
 dfoRbytA1o8QLav9FTyZ3Rf/4loEtAd/H2bboRgfGvyt8y/oF/xkzwW/YqMXhmFqMox1
 8snXUgvmbvz//Q8vr87CXRCslxBXcuhz1pkgf72pIyq71FMt5OlJIPpkY39HdvF6feSG
 DQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1+rY5rnwtcK6SAxE1dwNh38A5Yih7Yp0ekvqLa8uqsc=;
 b=FK+835ikRdDApTCJPOdMqttBDPlOjJUK0HP+dlroXhj3d+I4avLnCXU8YjFsgV6x79
 Z2K5eDXhDvRrkIeLG20FWtmqvidUbybj4i99XbEg8uXtVJzW/qdTpvIipXEhea+evljM
 gAUb+urxCkthCSKFc5Xo6k5fiZg8CQTWvZCdvsOB+hsY1AYvPkDlS8K0naLmi07VmEnJ
 wRfVzUSUha96uFbA6zADbccxpwu7OroQfqCJi381HyLIk5t3pgcGJUPOc99R+XNKTyHx
 fw759APkMbP2TxhBYGcCy604eNkXcPwtUgOdoFzkuhZeuJN4LQ1Oo6L0fcjT6NYQYwLY
 Ap+w==
X-Gm-Message-State: AOAM533pnJC4gZQow3LQdaUzCd1Iq2fbdXC8Ic9n/5ntEThpfCe0zloa
 Ou3spquGSvAM6Q+qyG7Vwqry2BJS8x66AA==
X-Google-Smtp-Source: ABdhPJwlaRSI+rqlGzhCQDZtZr9feQhfNbzDLqV4WxiohkgtPtBIaPKLHX+6CTvxZw8o55FKbWm5OA==
X-Received: by 2002:a62:e510:0:b0:44c:e06e:80dd with SMTP id
 n16-20020a62e510000000b0044ce06e80ddmr8249258pff.48.1634251477869; 
 Thu, 14 Oct 2021 15:44:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] tests: docker images for hexagon, nios2, microblaze
Date: Thu, 14 Oct 2021 15:44:28 -0700
Message-Id: <20211014224435.2539547-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've refined Brian's outline [1] into a proper patch.
I've updated my nios2 docker toolchain build based on Alex's feedback,
then added another toolchain build for microblaze.

I'll keep the other nios2 changes in another patch set.


r~


[1] https://lore.kernel.org/qemu-devel/SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com/

Brian Cain (1):
  tests/docker: Update debian-hexagon-cross to a newer toolchain

Richard Henderson (6):
  tests/docker: Use apt build-dep in debian10
  tests/docker: Simplify debian-all-test-cross
  gitlab-ci: Remove special casing for hexagon testing
  tests/docker: Add debian-nios2-cross image
  tests/docker: Add debian-microblaze-cross image
  tests/tcg: Enable container_cross_cc for microblaze

 .gitlab-ci.d/buildtest.yml                    |   4 -
 .gitlab-ci.d/container-cross.yml              |  27 +---
 tests/docker/Makefile.include                 |  50 ++++---
 .../dockerfiles/debian-all-test-cross.docker  |   5 -
 .../dockerfiles/debian-hexagon-cross.docker   |  45 +-----
 .../build-toolchain.sh                        | 141 ------------------
 .../build-toolchain.sh                        |  88 +++++++++++
 .../debian-nios2-cross.d/build-toolchain.sh   |  87 +++++++++++
 .../dockerfiles/debian-toolchain.docker       |  36 +++++
 tests/docker/dockerfiles/debian10.docker      |   9 +-
 tests/tcg/configure.sh                        |   6 +
 11 files changed, 263 insertions(+), 235 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker

-- 
2.25.1


