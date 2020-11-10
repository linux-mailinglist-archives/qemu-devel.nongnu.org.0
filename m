Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB62ADF9B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:33:05 +0100 (CET)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZO3-0007mX-Vy
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEl-0002O6-1K
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEf-0007Z4-G1
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:26 -0500
Received: by mail-wm1-x343.google.com with SMTP id d142so4321248wmd.4
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DPZPtXUvB06zElsXfuHMXGbHWSkYGyuZGmF6mMO7E8=;
 b=zAEKC5V3yTNdyoHS/6/vzFcBKZDgvgraajbwyQrCZU6BSUGaRX4+K2PqzAQBOJvDQN
 A4ANkZ+b5ABLVXU8zvjzovfHB4OVx2H545FDnqMESIE5ceN07AWOYMq9hQSCf5AQqxnO
 nQt7C2Zp8BadnPtX3Y82qmYizm664Vd8+1uUjODotzyq2/VKIYt0L6XIcYH44dUhoddI
 4nI6k5emJkZUtMOI3hmLgL7EGobE8opOsACdzAk/Nk9KC6TybIYCFRiuvj//OxWjpy04
 KGrDSuMXgkGRO120kIr2EYASkdKdJb6KAqCU6P7IuXEi8yGM3Upmk+dTGlQyVlbjoOR8
 v5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DPZPtXUvB06zElsXfuHMXGbHWSkYGyuZGmF6mMO7E8=;
 b=n9PeT4mrGry0tplePggLMyI5qDxTiyHuSUV9G80uExRmduyplSuxbiHqH7qOQChsD1
 QhfPWzRSOqOqtu3R2cae8ILMjyjf+7OOfKOaGMFL/C4uWAr4I0EULGSviBHLvi3De1cz
 iZbLIXSh1MUDmS6mID7b9+DbNWOdBX636V1Kot5K4VLo6MjNlIh2Vwh6ic8+JqadcfBm
 Tf21p5uYTcB7x1cv3mgxSAVPlIY3z4Ui7fcw9GGJQv4gdIEhk8+ZkyuSBo79yxZ9GWQ7
 aY6zKojBvWmTA9g99JDiuXcX3JlJllatCX33BouNhJc9/HgiBbyRp2V9V5vQ5/piS7il
 j3uA==
X-Gm-Message-State: AOAM532uAF4U/K5fToNwlJoH/75Bk3FbPn5AIgWc/xYjYx6NcfNujJ2u
 T87MDjcAjpMKJHNrYF12zJ7B+A==
X-Google-Smtp-Source: ABdhPJywP/GD7giOwI1frBJ2P9EiazjT8pBcGUU9SV9xDOsB2u9MpSoj9ngNFnWiBRbZbw0uGbGW3w==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr741564wmj.112.1605036199502; 
 Tue, 10 Nov 2020 11:23:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 35sm16140929wro.71.2020.11.10.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DBC11FF87;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/10] plugins: Fix resource leak in connect_socket()
Date: Tue, 10 Nov 2020 19:23:07 +0000
Message-Id: <20201110192316.26397-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alex Chen <alex.chen@huawei.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

Close the fd when the connect() fails.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-Id: <20201109082829.87496-2-alex.chen@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index a696673dff..319bd44b83 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -292,6 +292,7 @@ static bool connect_socket(const char *path)
 
     if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("failed to connect");
+        close(fd);
         return false;
     }
 
-- 
2.20.1


