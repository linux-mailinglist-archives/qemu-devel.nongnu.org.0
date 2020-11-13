Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42DF2B222A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 18:26:35 +0100 (CET)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdcqI-00013o-Hx
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 12:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kdcpY-0000e8-Bo
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 12:25:48 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:47016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kdcpW-0006bs-IP
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 12:25:48 -0500
Received: by mail-pg1-x543.google.com with SMTP id w4so7581657pgg.13
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 09:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a6f3KnFVHJzU07QFf9C6xMZ7eHgJS71EimPDM+i6w9k=;
 b=rdmjjDzXqLf/KtylS5KnQiaX5MaJlUV4ylz6YNePIc9hawCDi7WkbRPVI/B6lo3sJS
 zyxVxSywJz9XqRqZREtS7QL2Y3TsXVXsuu8WpoWLuvL7cBN7cs/C2u7kyOa/gT7T4kGF
 /3ckMGV9Mwhp3dq956RHgn2j7JvnAxlla9d1d8aPDJ+T5Ojz0tdK51ESCUSS3U1FIAzZ
 4PzjWj/aabUW0BNqZBqZpb0eUAi7Wq8d7ChC4Y7bYod/aJhe3KM0JCA8GZe5CKK+m4hZ
 HaSIIuwjJgskXi6m+fQk7q0Phr2qufi7wL+keNYk+RJcufeonRpSdEo4FCTKwQu8W5ly
 xVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a6f3KnFVHJzU07QFf9C6xMZ7eHgJS71EimPDM+i6w9k=;
 b=FenLkcs4oHPTtV6g5Am0zXs1CqgmcEH6/2dAlbyyPvt8z83UEtaWngz5Chi64wVZYd
 Zt3h2TY0hCxMNMJ2Fg78BhcZ2uaMESmQ2+t+EpVir9DMspEQ1axR+YzFFlfkdkTCOkb7
 w2lc7FRHHa7VrBUjzy6ypywmi4ac2cjVsut4P6vViO8VsDdgXWdyjjgg1exjheZ7DvLb
 5eHXLQS8mbwEWNMDlJ3URvc+TQQbgWP3VvltqbVcEtuwCV3JCpvwEHaMdp3up4MQ7h3g
 3da7IpAuV0abJuDao9OtX3RFGfQQvTQcP1rXz1BhFGnrPDXTvROmwtMcyXBaTPsIKafb
 jMig==
X-Gm-Message-State: AOAM531VqbylTVKO7PrDU4lu8ylMpqXJ3UABvNKrE+HYvsGwTdGpEzzF
 8Xzo2RXFZ1pHHS0TTSxp59jAp9zXLl8aDiiyjlhqIadWQIGxUWFVFaBhqtRZIjYdSiJSPogigxg
 35AEpQvjgsoaTH1+J8l/5gOJD/TKurszLDjRGRtd8ksxqkhotTlaWUIKE3c986dlixhlsbqg1vA
 ==
X-Google-Smtp-Source: ABdhPJw7cVaVfy2tSdUmj57AlUXlp/Joafxfw8lJxpOt7ouM5HZMr1PnaBedfHkLGjSyZa5eX4q6mg==
X-Received: by 2002:a63:380d:: with SMTP id f13mr2887411pga.105.1605288339332; 
 Fri, 13 Nov 2020 09:25:39 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id i3sm12325308pjd.33.2020.11.13.09.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 09:25:38 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] gitlab-ci: Use $CI_REGISTRY instead of hard-coding
 registry.gitlab.com
Date: Fri, 13 Nov 2020 10:25:19 -0700
Message-Id: <20201113172519.31056-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=rebecca@nuviainc.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update containers.yml to use the $CI_REGISTRY variable as other files
such as edk2.yml do.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 .gitlab-ci.d/containers.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 11d079ea5810..892ca8d838ce 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -8,7 +8,7 @@
     - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
     - apk add python3
     - docker info
-    - docker login registry.gitlab.com -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-- 
2.26.2


