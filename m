Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788122BE3B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 08:49:12 +0200 (CEST)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyrW3-0000t7-BM
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 02:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSP-0004Fh-VS
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:26 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSN-0000L5-I2
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:25 -0400
Received: by mail-wr1-x444.google.com with SMTP id r12so7218895wrj.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 23:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HzimzYj3p+9RcjT7t+vr+X1plKLq4z2KdTC48DV27wo=;
 b=hhSHACU96t153SMNPx2yu3+mfMOCLhc9B83H5se/7ZCCmjKQ125JKpN+sooLaOmUl8
 avl1Lc7D0KxW1XyfzYOjyHwgm8Afnu/HFZpKQvupwHrybdYUfa4Cqro9M9UDtCTjpm7L
 rd3PkZapum8kpD0LSQGNuDZUO3mXYuQo19RXFbFZMyHX0/EIL1Hs6pGrGeq7s7qkbrKE
 H2Cf5t5va/ngE7Ds8tZm7wTVveenlThTeCMrAILbmZwdevBN70gx7NmbZ+GXnCxzAQTQ
 wTKV3MCR8UZ5gShczoAP5n94oeEO/a642cqjbjJCovh2J2e3LAN1YG1Q891eEH0s514b
 NSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HzimzYj3p+9RcjT7t+vr+X1plKLq4z2KdTC48DV27wo=;
 b=CB/WKdk3rNHH2PESPpjR9XKIbxS3j3scDDWB6whDfrHED6TspK11wqtGVDoucSr6OZ
 e2jPKk/oaESOLlhhBiQrJjgg07O6N8xfoSo0sFcbpoojzhC198FRBInxQjGEUqxDI8Wr
 aKERwQ8jYSByUFQq3XuowbfXqmzPwDlEej+MdMOTouQxoasZPdYGT7S/tYRnaC7lijcy
 DRVfsdGuq5xq7ZtgHaRTk9euyoyjsCg49vMghnQH/6gLJr5lcJxYYcpNZ5IQj4yKhYre
 tyWoOdauNK5lL9lN9Rqw51ipT9H2lpTzrAjltIcOIuqMKz9FsxdjrckwLp/xlrEoYNCS
 Gf5g==
X-Gm-Message-State: AOAM530CwmrgHJVDHyg3FNO4fai2AUodK60TFFZHhG31Z1KTmq0iBeCa
 Wn0T1M/Oym7bi8Y90Eo51PS02/+aF+0=
X-Google-Smtp-Source: ABdhPJzV1cpog4sX1dNIVgl/lKtMeg7g4kh+T3zIvj738tcEDyOgHssH52TJBVyAfTUJePxqiJKWRQ==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr2941372wrv.280.1595573122188; 
 Thu, 23 Jul 2020 23:45:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 88sm158744wrk.43.2020.07.23.23.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 23:45:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 218671FF99;
 Fri, 24 Jul 2020 07:45:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 10/16] tests/docker: fix binfmt_misc image building
Date: Fri, 24 Jul 2020 07:45:03 +0100
Message-Id: <20200724064509.331-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724064509.331-1-alex.bennee@linaro.org>
References: <20200724064509.331-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

When we updated the arguments for docker.py we missed a bit.

Fixes: dfae6284
Fixes: dfae628459 ("docker.py/build: support -t and -f arguments")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200722062902.24509-11-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index a104e9df281..9119dff97de 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -78,7 +78,7 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			DEB_ARCH=$(DEB_ARCH)					\
 			DEB_TYPE=$(DEB_TYPE) 					\
 			$(if $(DEB_URL),DEB_URL=$(DEB_URL),)			\
-			$(DOCKER_SCRIPT) build qemu/debian-$* $< 		\
+			$(DOCKER_SCRIPT) build -t qemu/debian-$* -f $< 		\
 			$(if $V,,--quiet) $(if $(NOCACHE),--no-cache) 		\
 			$(if $(NOUSER),,--add-current-user) 			\
 			$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))	\
-- 
2.20.1


