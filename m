Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532E48BBE2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:33:05 +0100 (CET)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RZY-0006Km-78
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38x_eYQYKCsAzoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1n7RYT-0005db-DE
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:31:57 -0500
Received: from [2607:f8b0:4864:20::849] (port=33679
 helo=mail-qt1-x849.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38x_eYQYKCsAzoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1n7RYR-0004yk-Uq
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:31:57 -0500
Received: by mail-qt1-x849.google.com with SMTP id
 d9-20020ac81189000000b002c668615362so912859qtj.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 16:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0ZRSoPQaiY5p4Jycz+o3xvYFFOsg7FBKad4LO9NucLo=;
 b=PjA14OwaZ10G9m/p7Nf2Iv/BPvhY4Um1TlfyFmhydbzsznjDL4kaVaV9PE8GtszMVT
 fH7xGmIAod1Xolb4Yzo+Xr8bEihf/ultZ4KJLRpo8ArFamHBy3qNht0sGnfiAECmq2DL
 FupfOfDtbWEDyqqTlACKHEaxmGDGP9G3guOlxqkTm2cojoc7FMqbRBCI/P0zQpJX/7su
 FUtyrK1dI2fBJYnpQdlB8pm9BXUcyx1egGg2jW4K//Z9aXfve1LGXRpmN570EMjhyyui
 oZ06xbmqbsxwat5/sDb2JJ2T1XQ78QOpamyQkyxM7Xo1nLIsnEteiJYUWB/HvAjlZpO1
 e17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0ZRSoPQaiY5p4Jycz+o3xvYFFOsg7FBKad4LO9NucLo=;
 b=DXgh8QIo0EMWofcgukTOp09F81HcKz6G4qfubOMfhOqQuAn/CvNhhGu5KTstAMwxOl
 mTmkI8jOMRrYT/kKRAsGPBgrwwGD1X/kRqx1gXCfvQDk/sVqkQGL84gkPUQeVk3XMiTv
 JVr9xsHe6b2g8w8F//5dffozeHOVjLr7Spvm5FN7o5r5YWC9+zFiNoSA5vb+syPH4rA8
 3TblvkJtW9PmFfbOtqDvMzHJPu25jrwKiosy0ecTmsyDpDVHeHA9TnwCLutfAuYWcsUc
 Fe075JBDPEC4VOAJFghCeYJCvEKF0EOBHMjcdNDYrZK6bkMr8YiCL8+YpaxRYBYIuot3
 UcYg==
X-Gm-Message-State: AOAM5332oAIjnjiev/i4RN1rhqEWD5mz3YagkaENlN2cM/E08dp+3a9u
 /DATvVjxmi2UT+7H1I11jCP2Ai/frMQ=
X-Google-Smtp-Source: ABdhPJxIy6W/zliRXmFqS2b6M0Dlpu7XDUtWbl594l/SRHzysmxNBtIUhNpXeRZjDVS1Zz06iH+aRHrZYXU=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6122:513:: with SMTP id
 x19mr3536346vko.40.1641947123264; Tue, 11 Jan 2022 16:25:23 -0800 (PST)
Date: Wed, 12 Jan 2022 00:25:15 +0000
In-Reply-To: <20220112002515.3991540-1-titusr@google.com>
Message-Id: <20220112002515.3991540-3-titusr@google.com>
Mime-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 3/3] hw/arm: kudo add max31790 behind bus 1 switch at 75
From: Titus Rwantare <titusr@google.com>
To: minyard@acm.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::849
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=38x_eYQYKCsAzoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/npcm7xx_boards.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 7d0f3148be..6fea2e161f 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -342,6 +342,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
 
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "max31790", 0x2c);
     /* tmp105 is compatible with the lm75 */
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp105", 0x49);
-- 
2.34.1.575.g55b058a8bb-goog


