Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE63048CF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:40:00 +0100 (CET)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4UBz-0001fY-E0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZW4QYAgKCooA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5O-0004Y5-69
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:11 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:50079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZW4QYAgKCooA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5C-00046A-CO
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:09 -0500
Received: by mail-qk1-x749.google.com with SMTP id a75so7740957qkg.16
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=uU0WUUwpdX3IZlYrrj1mvLpU5jPBGleS0tjUfD9ccfsMVIzHNWrQ4+unNqiyKMfFyf
 wmUrAaQ7tBG328TbAIVVz0lmUZTF8CEmdAPoTp11pt+eV/4LXItPTRo5b0XIVXZRrNIx
 poD9iliNfKc5VvMOtbn5lXkRkTmHJZrVvNV5XZHgb9mIEr+SF2c+r/UAKAELs1Na8Vw2
 WEiuejXlLnA4ftPZDBGvsGq7bdLxzuFI0vpdVWtM0eQCiiFGWzViErbdCVvOVnsbBYXJ
 iVOLyQgl5xshDtBEH7Oi3wg4CHf237BsLi03eUF/OL0pmQL5qDDjxMRGYPwwk3vk+u5r
 KVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=IylMwAdf71Xn+ZYvClkRPAg/uCYPHng6+tYm0CQaemQOT/tdsbsub/Vxhi8PMp1D4Y
 eXvnOOjnNSXUXv3vVodVpAGB24sT0i6ljAu4o8C6y+8V6BhMhcsxJQFxuEb45fDckdIZ
 WoKIvTWPL2e023AS7i8/i8ycqchrV4G4qMOQ1XOsu6EwKJw/vmrdYz82QRQxk85Wp/2g
 MS2UYDJZuS3xFjg6uDcs/L/zBT8zygbdyYQU/5+9frqyrbsVqsRQt6GQRMvQTyQkz/Ct
 Os930ORxTXwA4E0+tUqOVxboo0FCbWsbrtBLJ4Lc6bvNUizfcTqB9Ax73Za9RLTKbL0e
 NGKg==
X-Gm-Message-State: AOAM53299GEG3ncjoYlZmROcSPHnfMa29XuCuRBSMwNKGyzmBWqS3lYb
 vlNzyv0XGT/jcloTVBWKyUysVLqN52fN+A==
X-Google-Smtp-Source: ABdhPJyyqfMJP7CxNqTlls3KR4GAc7WWQ/JFkRdHIt9A5hHPLlBxlVA4AYQrEjaKuBzWLjUmQ5Z06I5yVvVjmg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:ab1a:: with SMTP id
 h26mr7122375qvb.26.1611689573821; Tue, 26 Jan 2021 11:32:53 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:32 -0800
In-Reply-To: <20210126193237.1534208-1-wuhaotsh@google.com>
Message-Id: <20210126193237.1534208-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 1/6] hw/arm: Remove GPIO from unimplemented NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3ZW4QYAgKCooA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

NPCM7XX GPIO devices have been implemented in hw/gpio/npcm7xx-gpio.c. So
we removed them from the unimplemented devices list.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu<wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 72040d4079..d1fe9bd1df 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -576,14 +576,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
     create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[2]",      0xf0012000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[3]",      0xf0013000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[4]",      0xf0014000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[5]",      0xf0015000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[6]",      0xf0016000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[7]",      0xf0017000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[0]",     0xf0080000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[1]",     0xf0081000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[2]",     0xf0082000,   4 * KiB);
-- 
2.30.0.365.g02bc693789-goog


