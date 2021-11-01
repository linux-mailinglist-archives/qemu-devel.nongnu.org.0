Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAF4423F4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:27:12 +0100 (CET)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhghq-0004gl-Qk
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DXeAYQgKChACAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1mhgen-0001j3-FR
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:01 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:55857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DXeAYQgKChACAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1mhgel-0002v3-Fz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:01 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 t62-20020a625f41000000b004807e0ed462so4323630pfb.22
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
 b=cV4lkirVsBCQabmzo/ALBPhmjaSB5+HRLGedyUZrUKTHBXinsTLN4Tb+Qlmfq8z2hi
 gfbMytI81qzq8/FKkoDBuuBwjCBCYtwfj05A/7zgGlYu8UUxXQwU7swhNhm08ffK59qN
 mK13wtnomVrzApfnuPkZPKKo6Ip+aPZwUZW6YF6jMi8MMhUuuV7uh1W/CQFhgisQQc4u
 i9XoLMXK4hsbc+xV+V8RsznI5MMUhqXzz6pQ5PzlkErcoBuV2cEMsojtNDEfaFefir8M
 QAjtPqsrAVW9036CiQ7PQtWKNpZM7yDUGGSG7gfSqlmqdKgGU3tjkPam1HXWCmHNJhwD
 gWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
 b=0vOo/WPwc8awiMJryB+zmjXrPDzxIe95YhoydIdURJJ5kbKqn6KQkpn77DAVDfzaUT
 FlzBw9nlXqEWJpcxf2plGlwQe5BgOaiJeiHOPvZu+gKxNPpgDZpkpD8cbvXXgmrVSngC
 EWKyLEJ6uB+hhjN0url0brBrkxHyArXKdO1Y9dg+erm/PhPXiTE67T8lvvibaw4WR4wa
 Qei1Gwtb3IgVZ/wtfMc64t9BMpaHmyYXxwIvN44tbGmHqqPaHubrzR4jnFqreV6Y+zIu
 sXe3XxPTFlGG6M22A9mQAP0ZeBg7Ie9LdfEzjQR0y+VeM7kUFlw7MDHVCHPerXcjUKNy
 QYTA==
X-Gm-Message-State: AOAM533SlFQ21YgGjVey2Cmg7xE/I17O9DGFVRKzWlpRY2ilWc/oi8K2
 qgJRZRUawWP7dd8T8qy3EyK34Xz0SWA25Q==
X-Google-Smtp-Source: ABdhPJyKxiqT7CmiWsecyVdjPy6LmZ7+CTKio+M8PhykhDq3vUl/hpCfJZSWMZtZ6cCZx4aX20z5bZrgVXu2DQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d2cf:b0:141:b347:df9d with SMTP
 id n15-20020a170902d2cf00b00141b347df9dmr20630352plc.37.1635809037724; Mon,
 01 Nov 2021 16:23:57 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:41 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 1/6] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3DXeAYQgKChACAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.33.1.1089.g2158813163f-goog


