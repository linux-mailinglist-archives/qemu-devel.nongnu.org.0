Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AE38FCD3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:29:33 +0200 (CEST)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSRQ-0001qO-H1
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOQ-0004Yz-Ib
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOP-0007Op-0m
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id i17so31181990wrq.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=en2f8Kb1eqCBIkOKkRAaVLFl16HvBGjH/7Agrl93vlY=;
 b=H3cCmP6WLFXeNIp3jPJr3xrNa68zHUxQXlKpWIaDKZEkpSLP0y7g7clXrtm5hfQnr0
 i+ro82SHXPMpygLFSt1xg8gyZILRdjWGpWU5UOfJjerZMcWxsWb6V0XMI3eqnpuw47U/
 tVSkfAoQgGMIQnWwNyCkrRjq6MmqO23TKjIDW7A+xMuD7dgZ4ypY3dBBS2Z4tU/X6OFZ
 +fJpThfmPk+3lG5J/sqWlFi3nEYIrIdlf+LurYLPaFytOyKD9nBi4PrRLIXQUIaKX2mZ
 v5rv9/Ib72LJ/HSpseCKPMiQC7EYSPMU+mOYfDAajOiQls0M0FYRrBJll5eMW3DnJBdg
 Tz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=en2f8Kb1eqCBIkOKkRAaVLFl16HvBGjH/7Agrl93vlY=;
 b=XazhYMa1reBoaAWTzfBxv87bbJBWJKoW4pNbhHYquX1q58aZiqT+ybwbRE129WUlay
 7SkW4CEJsMToPJ0SZMbVJA2SXzK1YMvMnVdQi5QVl2eRp1PvVVowfO/iOxu53IcinWPF
 jikD4OQNkkUq44i8l7zWx/9jw7WhhA007pw25cgJGzDcndUPclM3aBiDKPZFNp4ZcTts
 ecVWwoCFbftp6rZKmaXJvBnAFBbuk5+ixYCwIIdnatNVJRZGZDpo1SU+7VdmCdTYnL66
 genEFuXXDBbNfPCqqTKQ0lON+9aIL/ULgKwig9+QL7g4ZSqwg1ERX89It3jFcfgmUfD9
 4+Ww==
X-Gm-Message-State: AOAM532Fd1ybV1uqo/ys5otyWLWZEnr9LY9We7o1FCE9BxE7R010kC64
 GP4wK2wdXArLl/MZLEODk7O+17nmXO4mvA==
X-Google-Smtp-Source: ABdhPJxIQKZbhl5PAHSvtUM4Mb3q1w+C8ZyZy8Bax5pADatoPxcKYQTasD+AevE6P7e5zoFrK4Ugjg==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr25711440wrx.385.1621931183514; 
 Tue, 25 May 2021 01:26:23 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u126sm2309838wmb.9.2021.05.25.01.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] gitlab-ci: explicitly reference the upstream registry
Date: Tue, 25 May 2021 10:25:52 +0200
Message-Id: <20210525082556.4011380-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Since c8e6793903 ("containers.yml: build with docker.py tooling") we
don't need to manually pull stuff from the upstream repository. Just
set the -r field to explicitly use that rather than the current
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210520174303.12310-3-alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/container-template.yml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 9e3f3ae3c26..1baecd94606 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
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
2.26.3


