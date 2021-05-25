Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A445238FFE7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:27:00 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVD9-0004v8-0p
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAt-0002B2-Gt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAo-0002rU-Sn
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id i17so31799240wrq.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsqE2FsjJYdyQ62Ky7HDOh/DIGl1NSSD56vnVxy3+Bk=;
 b=Xmk2cEf0gPdp9jDXKQUXGb9Sxam9fXxKHrHiOfCZaxAewxGtABY8pS2mee1k2HGred
 R89g3cUY1Vd8vWOu4rp3Qupes8xb+VwS3GZzHsau8kJnxFGqA4XJ+qyxjYO9T2ejddJH
 7pwUpvoZIsOn6qfUmbwfNHjupvW3lkcad4uSD0RJT7e2gN8bHUSZ9qjEo5Wnx21B0gNk
 w4BZqxSPjRkI0bO2ThGW4hrTj9fZOPIlLmHiq5eNyiK6XoxYvW7K2cX/4GOkljKZ1vdD
 HLMcHU9zyJ+oScaM0W+DunXne3cIKBEzfVqmkgDtFy/Juzr0nnbtJGFy/OVsbzKN7Omg
 oYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsqE2FsjJYdyQ62Ky7HDOh/DIGl1NSSD56vnVxy3+Bk=;
 b=Wg0cxExvtW22SqDp66XcImghId/tPq1ebtumq+acrgJOkO4EiitaTNcT+9VQUQrxGG
 oouHywPQETxYy0YDxF7SumOPQulobF+784BhF4WUA189cQmfNXQbOpaCoDuSk0/na8fu
 gdjw34qy2rxG3jGdch2vsLRckc3WJqjSUXEENofiXeKt7hBe/LqKXCag/jFCVzGyCgdA
 ZjRkh8XzAQbfsZGA8w/sAubmfNjUsZg/6PIow8JVzpJzPPN7d4RkOfzj2gQ081huMkAu
 wDkv8267Y7dRtWfYABJKYo2Au8aThqcX4dq48TdwVuvyEUHSMbrcx93qg/cyUfF7C2z1
 QYMQ==
X-Gm-Message-State: AOAM533q4BFsr7aFGgQvVUemsuUf9FGlqN6Kotx3Dt5yCbXZkLv892Hm
 JtR5KVKUxLorq3ZNeflifdYhGg==
X-Google-Smtp-Source: ABdhPJyn6eXNWJwNfj35ckHbZRaCLVmyKWnOysN7TqgYDRU4bWaCD/vU60YU7NcXwWsdgEoRHz18/A==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr26056131wrv.206.1621941873290; 
 Tue, 25 May 2021 04:24:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm15349286wrt.67.2021.05.25.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C95A91FF87;
 Tue, 25 May 2021 12:24:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/7] gitlab: explicitly reference the upstream registry
Date: Tue, 25 May 2021 12:24:25 +0100
Message-Id: <20210525112431.22005-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
References: <20210525112431.22005-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since c8e6793903 ("containers.yml: build with docker.py tooling") we
don't need to manually pull stuff from the upstream repository. Just
set the -r field to explicitly use that rather than the current
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210520174303.12310-3-alex.bennee@linaro.org>

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


