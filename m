Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6258B3C8B0A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:36:01 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jjk-0006tD-FL
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcF-0002un-B9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcC-0006cQ-J9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id m2so4431479wrq.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8ZZwG/wV/TxbTj1ldaerTre00zdlxYLjMxiZPWGxQk=;
 b=TH60qJENMw/iepQN858cA1kf0lVo5DYIpt3I92f8Jlwse2PQtz7Y519tFYxpZRsrzl
 7W9DHRro+/ijkz1SYlj/JLn31TgCGwXKbyPPyXziRZZkriI9S6nJ2/B+g2trQD36m1zS
 Yb6KShXP5XAztdDpx1tqJR9Iy/Gd8iASNXDYuZsBZbMpgWeI3e8ixvQNGM0ueDB5alqU
 W7kq31PCDZMm8vRFi8QZrwBkXTlk76m0RCOsg76qn5tvlSRf4Gw8X89SdAgWIAx65HHN
 dqfi5RYKX8I8EVyW9yyvrxg/wh4VgNEhEDM+f6ft4lB4tLc9egvGhIKjnFJ5crDwVLwS
 Yq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8ZZwG/wV/TxbTj1ldaerTre00zdlxYLjMxiZPWGxQk=;
 b=tzh/JCBnaKXcXAONGm04gyWmBBrVT3DTrob+QfrSUxFsifdh5XFrW7gN8U9TDQFCQU
 GOpNUFvRaz+KjVO6Fm4P9FTILzJr3EAip4Zu/J07Tz1LJuBzlInAdf5ualOU/FQvqI1W
 8vlTBL3MoX6Mki6e1h5rVVpqCU4xSS6PSZrV8l+xspx7WJDxJ9LBlY2QnkRWuOYB31Cy
 jX3pF1Ho6bNPJGnt2WW8ghBE+9G7Jv8ZUouftQds6TfqZ2rWsawKrxonrNBBa+vCJOCW
 KTjW7DHFlEeT/Ft8LfVVXWyAIhK4U7xNVOQJHDWHPUaOm5Jpdq6VOsA0cpnNbAba6S3k
 38Gg==
X-Gm-Message-State: AOAM530fNZlH9bK/Cslf7PzFzG3Z2e+MESgtEY9TfW94tMx1RPRQWH2H
 Y+w7xo/Jh0rm33WPUN/XWixubQ==
X-Google-Smtp-Source: ABdhPJzD+wmBlI6Z5Hu315HPBByLMBLCH/D3NAuzXlLQa/ChXM/yik5+VtR2daISw57Y3HvaDpFVbQ==
X-Received: by 2002:adf:d235:: with SMTP id k21mr14835383wrh.222.1626287291330; 
 Wed, 14 Jul 2021 11:28:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm5655990wms.0.2021.07.14.11.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:28:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 126361FF9E;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 15/21] contrib/gitdm: add domain-map for ZTE
Date: Wed, 14 Jul 2021 19:20:50 +0100
Message-Id: <20210714182056.25888-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Yun Liu <liu.yunh@zte.com.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yi Wang <wang.yi59@zte.com.cn>
Cc: Yun Liu <liu.yunh@zte.com.cn>
Message-Id: <20210714093638.21077-16-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index e42861cd11..bada5384dd 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -40,3 +40,4 @@ windriver.com   Wind River
 xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
+zte.com.cn      ZTE
-- 
2.20.1


