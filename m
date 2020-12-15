Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC722DAC6B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:56:22 +0100 (CET)
Received: from localhost ([::1]:49102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8wH-0007fn-HC
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00079M-L0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8oo-00014Y-6s
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: by mail-pl1-x62b.google.com with SMTP id x18so4794630pln.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sxPU5EI8W7XsZ/VHAyzmuv8bFGXnRJUWkpy9JEyuz0=;
 b=t5sVydw7QqCe0juTzxuLAtJc5QXf4Li/SB+I3Ud4yk+7ec254le8fNLMzW+GEoNGLm
 pk1XcQpFl31+l4a2ny6PuqzLh8X6NZAIaYqEDF9jgGTDRFkQd1Lsd35Nb8/IKGcDvWdO
 YiRChku2Id2Pb7VJmRW7BYusS1FgoHp8l/g56LMwEPcG3WB8xkRBzFuN7br8UvLPHIEq
 /yiJDW3KZkwXMsKQRbh1snIpMP2DjFuwVAI79So4BiF9NZIlweSerKtSP33TloMOnfxy
 h+DfksKtsfpT7mB68PZeCwa5NRy/zNdi2pEYGQ7aib6nrUaSq9LwuXuhsJ30+rGK3Tn3
 uPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sxPU5EI8W7XsZ/VHAyzmuv8bFGXnRJUWkpy9JEyuz0=;
 b=aJ7y6AU74ASBaz0tSsbOvSUaxVeGrqekDpoVPYRiuSBopPkTfjZ0BigaX2YHpAN3BZ
 S+TppVoZO2fLykFwmaFhSKWTZ3PHd/6icUdJqgwfQgneLsy2csoOihcBz5mSJArn/NxO
 yEjQ6d7nLPoOyCeuHEOZkkG7s/zC2LrCgM6n+0sGYROXqAOMziYnVgm4TagopJIgglO2
 GsGi4bn02SoIPGt41jM+IGDYEQ2k9Ng6pXSGfngO+1+9uzWxmhoACtuuyJK7p6HjFWYZ
 Om6CffIO7dUg4c6BhgvRShquoaGfMldCHUqfUIDoxCzz7+rI/tyTPBe95vQTw96ixk3c
 pmSw==
X-Gm-Message-State: AOAM532AuVNG8FyvId27HVE2b/MdeUmkwKP01eyPhT8s43QKQ+Km/ZnM
 u7K2rGaGxWPiupwYzEgfnTujGA==
X-Google-Smtp-Source: ABdhPJypQLsA8uwJiGa6NHRLHhVoXrdT6P0aEHiqY1KzyJC+0HjvtdiG5Ezm7UcrquvwA1T9EggePg==
X-Received: by 2002:a17:90a:bf90:: with SMTP id
 d16mr29827645pjs.200.1608032916901; 
 Tue, 15 Dec 2020 03:48:36 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:36 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/5] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
Date: Tue, 15 Dec 2020 11:48:24 +0000
Message-Id: <20201215114828.18076-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=leif@nuviainc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SBSS -> SSBS

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..5e3cf77ec7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1883,7 +1883,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
-FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 
-- 
2.20.1


