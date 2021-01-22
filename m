Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F1300B08
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:23:59 +0100 (CET)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l316E-00053T-Rp
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311f-0007cd-6K
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311Z-0006tk-Nw
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:14 -0500
Received: by mail-wr1-x431.google.com with SMTP id a1so5966953wrq.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nr3F1s/uxAkZsOjDBgzUMQ0nBu9JtUUnCgKnB3ia0u0=;
 b=Dfx5VBsxycuh2BYKdT4cTeeBCWfyqBl09LqOcxSVPHEeTXFEw6PDLQRk5DYtliTuiv
 8Q5xfFIkELfcM1vtuR2fD+G10PkhISY/7EoZMGrZNRs7JGaPl0cKaCgAy93siLYVBZYa
 s6TrQr1GoIdXnVydjR/cUGQyLEIzyOnIpl6kpooxWoCP4D+5PUPvNV508u7elxIvSmKN
 co2/jXjThy6zSojo1tFZnXqrr8jhc3UR8PBROXICHC+WLKyiv3tpDwtdAfo1IauInD5F
 DMN90P7d3f3mY3kXblt4Skk5zAKnEtN5EFlZUEzL14zx18wxLjoPU3xxDgu0FBbvqqkU
 JWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nr3F1s/uxAkZsOjDBgzUMQ0nBu9JtUUnCgKnB3ia0u0=;
 b=J+KiPZKsdXfuMPTUh0jqU7aoCb31IDMZX9bPIlMw/vwCSs7c3x14ZwaEApljepr4+a
 TfpndCxPQf/hN/iFkWx8/JXc/khH/86D1og5uKtdyGpxjAYtAiwYNM7/ft8La3CgStr4
 xeknDDPVcKRfoopFxSuLYQQmxEJRhz6kIAVa3Ct4Pr3x6CSuf1J+MwalkzudEtHDQ5kd
 jEe3eLfxDEorvYjfOtxIWp3lY7lplmvWva1aIP3/KNgwyrdqJ5Rv2qe292Lgd3UgbNoV
 pxl2J9h14SfVdhqRjr5GTOC+xQOpy+Brlkvw0lQx3f+eM92AOiqzDKXeazzyR763K9FW
 57bQ==
X-Gm-Message-State: AOAM532WbqedFk56Z3R4WaCwHclzQVvfUeLJO37zNlRXQEalVbEszHnp
 zoSsjufkWODYItCUL2LoyQOqng==
X-Google-Smtp-Source: ABdhPJzgq6A6h+wYrprDY2DQvRZjC+K0monjHMszHn83VYCzklKRgybUUM2tvOhFM/eYDmyHxcS5zw==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr5662034wrj.339.1611339548305; 
 Fri, 22 Jan 2021 10:19:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d199sm12232884wmd.1.2021.01.22.10.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C9DB1FF91;
 Fri, 22 Jan 2021 18:18:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] tests/docker: alias docker-help target for consistency
Date: Fri, 22 Jan 2021 18:18:51 +0000
Message-Id: <20210122181854.23105-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a bunch of -help targets so this will save some cognitive
dissonance. Keep the original for those with muscle memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bdc53ddfcf..a5c1e4a615 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -1,6 +1,6 @@
 # Makefile for Docker tests
 
-.PHONY: docker docker-test docker-clean docker-image docker-qemu-src
+.PHONY: docker docker-help docker-test docker-clean docker-image docker-qemu-src
 
 NULL :=
 SPACE := $(NULL) #
@@ -218,6 +218,8 @@ endif
 	@echo '                         Specify which container engine to run.'
 	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
 
+docker-help: docker
+
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
 # docker-test-foo@bar) which will do additional verification.
-- 
2.20.1


