Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A581216733
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 09:19:49 +0200 (CEST)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshtM-0007uO-4z
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 03:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshoO-0006wh-2d
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:14:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshoM-0004sI-C2
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:14:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so43966027wrs.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 00:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0+udXPK/W1B2LpwudPO4KcKX+aKxd6kiztObpKjw3A=;
 b=TrVD5FCIn+R7KgPwC2EB7cqF+WuogHvYLcpumTT2l9ORlm+ODXMFLjP9MOaBjuNgUe
 6cnHA7Di5ONDcok3NygznaPNrqI2sqsTxSB3ycUrspykZXPHjjBdGcXSxFgGd3+vybRV
 Y+fkSW272VqUZBAdn/mwdvaZAxkEJxyujfb7Q1Hj6HbrHsGrrtEAGkJ4sQtEYjyoe/y9
 /Qf/FhHuKT4eU/LtZSRzWevAaQLd9M7DYq37N968bAMVDTGz+CegADC15XAHKFr1bS7Z
 tgUaIP0yJXBYRbwV/zUlY0+DVqlqOmTsUV20FnR16I0/pzUkCvEPvCy4ImhlCQcaUxy7
 6uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0+udXPK/W1B2LpwudPO4KcKX+aKxd6kiztObpKjw3A=;
 b=YuvauydGdQvm/jCr8ec8UgTCehCr5e8wX0vrdBR/V9xAc1+7d0W/vGhNqNjWI2Mj92
 lwpF8Axo/bt7rQxqa9KR6UqPos2VtX2qiyeRL18VvSbmR+h1OkkyKnQpCc+rQUD+ML39
 Vm32STI2sfYTa1Q3X7tb2xM2Qa1X0irKY+5CeVhYs5H6QoFJUzhnB3V89okzhSygFZxe
 RWoK5fG/NDrr0UwNXwOI1skPaJ25WXTAZ7wiCPEIeE0a21VBvrZMWUEtXS7MY5nQeO1E
 hAXVgVgow8uiktg57W2ty8lVeZcqKn7gnGpUh4ro4tgoq1t0DUBm3gBKz6yheJlJZIwU
 CZzA==
X-Gm-Message-State: AOAM532QnTAACJ8SFAZO6n7mS4dEqrGztk2iRc4XDGC2D2JoTK7bOCh4
 g/cDBt38TFo/NH6dCe7xo8/VSw==
X-Google-Smtp-Source: ABdhPJyG1AT9isgyx4ZmwGwcxAX4tIEWC5H27Tc5Vs+4VEfBBpDtorwfx1oyGuZWnWTojSSVhqyAxg==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr25600805wrw.25.1594106076960; 
 Tue, 07 Jul 2020 00:14:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm2398452wmy.0.2020.07.07.00.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:14:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0229D1FFBC;
 Tue,  7 Jul 2020 08:09:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 35/41] gitlab: limit re-builds of the containers
Date: Tue,  7 Jul 2020 08:08:52 +0100
Message-Id: <20200707070858.6622-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200707070858.6622-1-alex.bennee@linaro.org>
References: <20200707070858.6622-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the time we are just rebuilding the same things. We can skip
this although currently there is no mechanism for picking up new
distro releases.

Rather than try to be too fine grained allow any change to trigger all
the images being rebuilt.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Message-Id: <20200701135652.1366-38-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index a7621c4204c7..ea350eacff70 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -17,6 +17,12 @@
     - docker push "$TAG"
   after_script:
     - docker logout
+  rules:
+    - changes:
+      - .gitlab-ci.d/containers.yml
+      - tests/docker/*
+    - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+    - if: '$CI_COMMIT_REF_NAME == "testing/next"'
 
 amd64-centos7-container:
   <<: *container_job_definition
-- 
2.20.1


