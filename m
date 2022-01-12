Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978148C386
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:48:42 +0100 (CET)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c7N-00057E-OL
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvR-0007Z5-NM
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:22 -0500
Received: from [2a00:1450:4864:20::536] (port=38756
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvP-0004k3-Vs
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:21 -0500
Received: by mail-ed1-x536.google.com with SMTP id u21so8726358edd.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1O2PejeTP4/HHM28pQRI78fBSJFwWtu/uO/a5y1HGs4=;
 b=bWzo84C9CIjY2c44n5FMYRAq5FtbbEHy1RAPjtQDexBtifBQqpgcNFN+RRrpiMMGEz
 y+TWjslVVqLgr6zv7r/+k3DTCpnfs27lVPA0LYkMSUdwA5EjdTf1jBSIMkQWNaj0pEKF
 DiFF4YB02AsMBTsxAGhD00sLQbMR6UNhZ7u7XRarfQRQGmS7IN7DFpMsCSq7BJW0zmBT
 gHuTfHeOqvL9nsinEV0RKzsgBmopbpFGD4Xd0SvOOu6lvM+b+sLUIrr2FOutvCPEyLln
 g4K3n2E1eZ6jb55RoeDSr35JL/b1du83EQX2aEPJwX6/iL5/Yy2R9Phi4qoe86TX2YRg
 i6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1O2PejeTP4/HHM28pQRI78fBSJFwWtu/uO/a5y1HGs4=;
 b=fGPXmK/EJ3qdrbbBxjvJivRjg5Ewa3wVWP/nEO6TFytStBfhZ6ZNlGhXC5cy1dq4bk
 iFqR9nBlsMlsbwhPQfgsTCJabI21Kpffp8IvUVZS8crEjHsbXnaFn/gSTipqHyfFqpBI
 gIOrMyDZD/nLWs8bMxjPi5qeq4FRy/pav9k2bq5DH8iGkjuhWNxJQ3APs69bne6Jzhjd
 44ywavvQwDTElYpxhzo78gyNCRX3KaMejfHJmNlO+cXKu18g6oZuCUxnOg13+nK+DKRH
 IDUwWYBBUTVSHZO+XLKE70Rh9TRynKrI9fJwVfGQosUiyW9S8ASHIlHTgYAnEYZtfV7Y
 hHQg==
X-Gm-Message-State: AOAM530y+oNtwTyiUHv4oe9HzO9eO+IwkrnPTP/qUqbQ7Na2T84v53ny
 MMQWXyiB2MR9xyArm6XPWfSSZw==
X-Google-Smtp-Source: ABdhPJxVsQy+H4kKL1AjPhrDai2YfcTMplghcjZnw+sLV7R0extFdGmj3s5pHOOWNFdvNGFOex19Mg==
X-Received: by 2002:a17:907:1b21:: with SMTP id
 mp33mr7153738ejc.580.1641987378662; 
 Wed, 12 Jan 2022 03:36:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id sc3sm4499287ejc.93.2022.01.12.03.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D19F1FFD6;
 Wed, 12 Jan 2022 11:27:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 30/31] docker: include bison in debian-tricore-cross
Date: Wed, 12 Jan 2022 11:27:21 +0000
Message-Id: <20220112112722.3641051-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Binutils sometimes fail to build if bison is not installed:

  /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arparse.c y.tab.h arparse.h y.output arparse.output --  -d
  ./ylwrap: 109: ./ylwrap: -d: not found

(the correct invocation of ylwrap would have "bison -d" after the double
dash).  Work around by installing it in the container.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/596
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221111624.352804-1-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220105135009.1584676-34-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index d8df2c6117..3f6b55562c 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,6 +16,7 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bison \
        bzip2 \
        ca-certificates \
        ccache \
-- 
2.30.2


