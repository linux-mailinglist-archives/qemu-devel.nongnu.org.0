Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F820B804
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 20:19:41 +0200 (CEST)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joswu-0006Xp-Px
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 14:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1josrw-0007aW-1Q
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:14:32 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1josro-0001KV-1Y
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:14:31 -0400
Received: by mail-wr1-x443.google.com with SMTP id s10so10319519wrw.12
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WD6VNcX9MpLlUaAe843m6W+P0R0E6C+GHfBa0ZiWKL8=;
 b=sB4t23C63XFYudmFGw/QAueZ3O0JxTTy+p5jQ68zcbTOMcxUZwvODcb7zSsWSRI7wB
 gLG06zrhvS3YxOoYDK2N6IzL7zdMHPDxW6A+FLz/eTU4dDbnTtzx3zzO41tlcXVtSNi8
 GdtZ3zuFX3wMGQTpQPuzsJkSjsH5JCok71xYWtMUR7lnxGOgeHqIQKl9xIaz3cnGlWF/
 0Hquo9H3rsHZcYbZGnNHlTxeEXl6Vhjh1UaQ84xsarPdA+T4yxr2N98sHA6J6fQ92td3
 O7LMqbe83QSULUp2vkFKh2cXjW3Jlb2y/HezgwWZLBDq73+IJfvQ1rOr5FQHh9pMrZM4
 YP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WD6VNcX9MpLlUaAe843m6W+P0R0E6C+GHfBa0ZiWKL8=;
 b=jK3XtE1YODvTyYfWzr5j2VnsNJ8zG9mNO8VxOyjIIOWGGLoD1zVNiYyNODrtGn1o5Q
 kYUDHTw/tBOVcQfVAKyaQeMP5GSbxZyu+0svZfjZnb417uZKGRb+wKV1Nmw+ct1yiIQi
 7iOZK/C1oubie2TaPZuOEQuO+58J3oDj0LDJrFR7cB0eXT+6MRmxCL6Lb1h5MG71l2Db
 Jl5PcICvYSEyfIyoJ6fKlSqXRjTYJvAP6h3LkLStEDksnvj3zR2ZLe9/4oyPxhXN0wtP
 UMAi0VOmr3YoNgC2bFHZo1m2wOyncNlCEVV/FchVWOaqujsIRNfdsaX/6jkiBGCPKHRA
 LOTg==
X-Gm-Message-State: AOAM531j1b9NDuh8b7wLVagZrJPR2DEO4AEjcMQuVdImuDDdBgnE0bia
 YBRNnPmBri5uFzUOuUlrDx+lmw==
X-Google-Smtp-Source: ABdhPJztmzHduPFZwXOfBacTsjNrmux0rlLpLNcyH+vBz0Kpo/dHCUEcp7jJywS1qs1DfsRcN/fxMA==
X-Received: by 2002:adf:e850:: with SMTP id d16mr5223297wrn.426.1593195261491; 
 Fri, 26 Jun 2020 11:14:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h203sm18620032wme.37.2020.06.26.11.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 11:14:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 477A51FFA9;
 Fri, 26 Jun 2020 19:14:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/30] gitlab: build containers with buildkit and metadata
Date: Fri, 26 Jun 2020 19:13:48 +0100
Message-Id: <20200626181357.26211-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626181357.26211-1-alex.bennee@linaro.org>
References: <20200626181357.26211-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the documentation to be able to use --cache-from for
remote registries you need to enable both buildkit and inline the
metadata. We want to do this to support pulling from gitlab when users
build their local docker images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/containers.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 580439647ef..ba9c24e98f1 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -13,7 +13,9 @@
   script:
     - docker pull "$TAG" || docker pull "$COMMON_TAG" || true
     - sed -i -e "s,FROM qemu/,FROM $CI_REGISTRY_IMAGE/qemu/," tests/docker/dockerfiles/$NAME.docker
-    - docker build --cache-from "$TAG" --cache-from "$COMMON_TAG" --tag "$TAG" -f "tests/docker/dockerfiles/$NAME.docker" tests/docker/dockerfiles
+    - DOCKER_BUILDKIT=1 docker build --cache-from "$TAG" --cache-from "$COMMON_TAG" --tag "$TAG"
+                                     --build-arg BUILDKIT_INLINE_CACHE=1
+                                     -f "tests/docker/dockerfiles/$NAME.docker" tests/docker/dockerfiles
     - docker push "$TAG"
   after_script:
     - docker logout
-- 
2.20.1


