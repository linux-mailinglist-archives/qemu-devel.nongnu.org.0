Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35D3082E9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 02:08:22 +0100 (CET)
Received: from localhost ([::1]:56090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5IGr-0007Bx-IO
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 20:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CF8TYAgKChsNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICs-00031A-Cs
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:14 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:40245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CF8TYAgKChsNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICo-0004Uo-NW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:14 -0500
Received: by mail-pg1-x549.google.com with SMTP id w4so5136182pgc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=CcaFOYbh8D6CEG6AS96j0pzXFdNjXI4VrwnGuCmYzu90YDYxKvjs+F/eSLcv3kaGBK
 9jLViZefuaHKqrtrYsvN7hvHCSeR/F8efy2G5dWHYKcLPFvHlTevRkO3RR/R6G4F1pj2
 4ZM6GLHtnyeolUM3cOyP74SL68gPK16hc9Wt/0p7FcfeocbZzO3eqd/ETCO/fq462idI
 r29xZx2t7TBibdZFA3XeKNMIzxoDpuk6vNLdWEjm7sbOZId5W/sCGM5d75LewpaZVDBk
 e3qg5FDcalO3JrNWOnUHUfoeeRP27U8hJQT1CdbodfOLV/sLWYuhxvcVxDDKFdtuglgf
 ArFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=L/S8gEQtx6hm+EJsfMIFtt9mr/Qbh9+eccIV8mdJNA1EChYLF8K4QhOaEV72Q9eKIi
 YvsNtsodBi12AsWbJrtWZhsikXaa3GW2Bg0tNMqQh+iCURO8tRIH4hvQxB4DuBTHanM0
 VcgPBzV1JeB1h1SHREWnuUMj2rb6G1fHZe56I6vt3ixK3Sgde2y955CWGJpA+WDXdYQm
 qq+HL447F9o3GpNxvQNp2SZ+x0hmD1s3kCMqj0qgcpArBhbuEtheWob0ASBGo3Fe4PFF
 u4WMrJxCqo0zoIib+sNo7SdClHP+UuyfcZ0QQkcvD5gTRcSqznHVDYeULN4vngDTiIsw
 fIZA==
X-Gm-Message-State: AOAM531vTeE/lO6RuVTuqOHS/CrWRVK5/zIqgvN2rYi897fdjfXgRCfM
 fIOwen8QqF+Vxg5AC2WmbJVxfRC6XUF94Q==
X-Google-Smtp-Source: ABdhPJz6WuPtLKuXCJIebecu3Wp0YgBSKUro3B1QrY6RC590e/BvsiQ8KWRmr8bvk9OpNqpoWi5s/OcdfvNujg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:4088:: with SMTP id
 l8mr2019690pjg.106.1611882248047; Thu, 28 Jan 2021 17:04:08 -0800 (PST)
Date: Thu, 28 Jan 2021 16:58:40 -0800
In-Reply-To: <20210129005845.416272-1-wuhaotsh@google.com>
Message-Id: <20210129005845.416272-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 1/6] hw/arm: Remove GPIO from unimplemented NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3CF8TYAgKChsNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
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
Cc: cminyard@mvista.com, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
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


