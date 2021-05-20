Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C57E38B569
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:45:39 +0200 (CEST)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmjp-0006mk-TT
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhU-0003FW-2I
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhR-000157-67
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id y14so16436367wrm.13
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRpwbl4DEv/eEA7OU49eaRq4xSF4MJNiaXldaMKBRug=;
 b=rKVt4BsKqB1XsDy3SD0DVeqwrhKoultdAbReL2X73FqplJg1eNNxapG6DCrLkDLSUj
 1zbo9NfKqfDzkkF4/GrAYi83tuQfQFgL3Fs+NQzDAGxRWGlvK4vq9L5DYrLp55k8JKdc
 Fe3pf31WOfiJeb4zeTnk5BStWpaMCu4Dm7+R9MKQtdDQpERwGay7Iszl9S00aOqfJ0RE
 LINAErKPoFbxcvW8I6eqwbaY7I6KX9ot04Yak78euRWEy9ZJlNNWPEfDfJNle3EwXbgl
 NuDOoDFpE7sVQQsyUFq2X8b9UDu4ZrnXLLZdAAoxn/9u4wG91h8gvEgirUm2C1dwbika
 d7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRpwbl4DEv/eEA7OU49eaRq4xSF4MJNiaXldaMKBRug=;
 b=egEZmzFIYKCCBPeAtfTSySE9JANFkV75kdqW3XyQkwwNRLHhXl/gpeYCN8TpazkV2H
 sS70gsceVYd69aHk5DzzkDcwk/zIzPrBPhPmvNdobEah0/KTQmWsASiSfgP6UPOlqvIQ
 oZMXpt+Su5Y4NAI2pIiqhW7u6j+tGTVKvZ0uqAklw+bXj/+aBx2KD63SLdhe6vdbO+5/
 c37lRga45vlHX8osI82d4y2UJ+ToUU/fpCO2nA/x8zRuYzid/QSp3dXubCPalqBNA9zJ
 +tOXcHpu+5Kl2EJSBBSZQ6cY1x4UI0hGH9lKNz5ezGGqpboSGDgAVtW57TMGRkZFiztZ
 19Eg==
X-Gm-Message-State: AOAM530fBS0ahUgQW1SF0XkLL9NNnmo5BSgq/07TG6h/BdA+ai0XzN4j
 aU955tO1Y9M4Kjt4ZkX6pm0TEQ==
X-Google-Smtp-Source: ABdhPJz1TXubRgqzISA/SN47/jD5k2w1CuKp0zujYkCjiDdRvAe1X/GuGZxCAW2UctdWN/v0c/2EQQ==
X-Received: by 2002:a05:6000:504:: with SMTP id
 a4mr5565132wrf.51.1621532587858; 
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k20sm3835964wrc.1.2021.05.20.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3E4C1FF8C;
 Thu, 20 May 2021 18:43:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/8] gitlab: explicitly reference the upstream registry
Date: Thu, 20 May 2021 18:42:57 +0100
Message-Id: <20210520174303.12310-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since c8e6793903 ("containers.yml: build with docker.py tooling") we
don't need to manually pull stuff from the upstream repository. Just
set the -r field to explicitly use that rather than the current
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/containers.yml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 765408ae27..3fb3c14f06 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -12,10 +12,9 @@
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull "$TAG" || docker pull "$COMMON_TAG" || true
     - ./tests/docker/docker.py --engine docker build
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY_IMAGE
+          -r $CI_REGISTRY/qemu-project/qemu
     - docker tag "qemu/$NAME" "$TAG"
     - docker push "$TAG"
   after_script:
-- 
2.20.1


