Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A240720B5ED
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 18:32:41 +0200 (CEST)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jorHM-0002JM-9x
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 12:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorDH-0005HM-3O; Fri, 26 Jun 2020 12:28:27 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorDF-0003K3-HK; Fri, 26 Jun 2020 12:28:26 -0400
Received: by mail-wm1-x344.google.com with SMTP id 22so9385449wmg.1;
 Fri, 26 Jun 2020 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NATlEi/FrWfP9Y28UrUe6cx6ZnLH5i2MWU0fBA6ejkY=;
 b=me1/iF1aFo1fTxDERquHZZNX7zuzCNPRbCgkK7mbuGDpLPmFSPRgOLe/V+sC6EA2wT
 EcLQfZ2BgiPLa6SEaY+RZyPqrohkPUuLRsdrkayMhQt822f1yRK0mV3yGFZY0gwKrYAd
 umAmHPbdnOMbijTgvWPwCMOzQSDsOpjfoYLepNaAsGMf+uJolUsOVlAnCCr+mFa/vuKU
 Q90G/tjjNjeMgru29NeIT84jYnsfSkzJo39gdobE05XFPBhrdiaFIYZUGNrv6KhFawFY
 eIa4I87js81E0nPYBE02n/3k6iT1nME1vTeSND8Sh4HQ2XRKJ4LStqBNu+9pPv3siZyB
 aVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NATlEi/FrWfP9Y28UrUe6cx6ZnLH5i2MWU0fBA6ejkY=;
 b=Z4gmsBC0ChiY40xK4Ts9fDolWLBLW3cXVIBFuoWbair2KKbrI0gg0tO4kCUmUZo1f3
 ViFVP43Hzj0wI33HSr0duYqiM5xjhlf4hXUupNwwTuqQW10GnTfp5rrUgCw0n63aj8EZ
 4sMz1NhJKS8FUxiInVF0ghZjKD6OsohDkUp+FRtZVBsyqN/eAzFGXZKQwwIRLxFVyrj9
 F5cAldObEvTX9fbchKDxCZp9rhpM4uQm1ST2zlU6/UtroDaxEqer240swnfdCh2y//9r
 A1I+G1LMnp9eU88KKdVQ5JjA4GvWLrvx68Wa9q5PWcYacvBPP54RnbEXR6hf62QK+pP2
 rLDQ==
X-Gm-Message-State: AOAM5317otVN0MFYZrLUTwRPKU3Wqkxz0Y9sjGwkbbFRkAnU25LuJskZ
 26qiCFKOK6XK0/U2Bg47RS7kUNm4
X-Google-Smtp-Source: ABdhPJzj8YR/NMdyAkkcYLLw/zYIhrQBao0in30cw8Xty/GsQI2g4+fayEO0/s1CdCYPVsyEATksyA==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr4148991wmh.71.1593188903732;
 Fri, 26 Jun 2020 09:28:23 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 12sm4867255wmg.6.2020.06.26.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 09:28:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/14] hw/sd/sdcard: Move some definitions to use them
 earlier
Date: Fri, 26 Jun 2020 18:28:07 +0200
Message-Id: <20200626162818.25840-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200626162818.25840-1-f4bug@amsat.org>
References: <20200626162818.25840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move some definitions to use them earlier.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index cac8d7d828..4816b4a462 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -80,6 +80,12 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+#define HWBLOCK_SHIFT   9                       /* 512 bytes */
+#define SECTOR_SHIFT    5                       /* 16 kilobytes */
+#define WPGROUP_SHIFT   7                       /* 2 megs */
+#define CMULT_SHIFT     9                       /* 512 times HWBLOCK_SIZE */
+#define WPGROUP_SIZE    (1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
+
 struct SDState {
     DeviceState parent_obj;
 
@@ -367,12 +373,6 @@ static void sd_set_cid(SDState *sd)
     sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
-#define HWBLOCK_SHIFT	9			/* 512 bytes */
-#define SECTOR_SHIFT	5			/* 16 kilobytes */
-#define WPGROUP_SHIFT	7			/* 2 megs */
-#define CMULT_SHIFT	9			/* 512 times HWBLOCK_SIZE */
-#define WPGROUP_SIZE	(1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
-
 static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
-- 
2.21.3


