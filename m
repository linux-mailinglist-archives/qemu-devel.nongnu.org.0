Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D931CB1F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:33:09 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0TU-0006UM-E9
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC0PL-0005aj-9q; Tue, 16 Feb 2021 08:28:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC0PH-00050m-F6; Tue, 16 Feb 2021 08:28:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id a16so5585352wmm.0;
 Tue, 16 Feb 2021 05:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DiErgxXIKZHj0mE/5ESu4xZEYHglSCcvkDWnGPVKAp4=;
 b=j2ogIzTy+zoe7Kwrne+jC0PQXK498FghYgOK1wtbIt/fn0mFdJBFMJaFfiZQ++nYsb
 QEAvPP8tsZHADTDjD/lw3oMvnlxsOsMY6CDbmljSjRu3WN2cg0ffZG0xRIkXQDQfGht2
 LzYubR9Rr4+8tHBx9uWhV7dmQRlza0R+66fBd+YijFU0SiXASsojPS++BpGUVZ9bnVpz
 kscBUbLQlAnsQyzsTfE25c+ymQVrnK/qPHNyDuGJHuBCmUYOubazhDmNboYerNzccBLY
 jS97vwcFAm9DzXn6Y3zpJWk+yVqsVJPMO+bhJeDtpgjrpC0B9oY7GJt9cmtbEOEvbCk1
 wCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DiErgxXIKZHj0mE/5ESu4xZEYHglSCcvkDWnGPVKAp4=;
 b=hlZJD1QKYh9lSklOhVFqI86NJeBfWJ4Kl5XzMPjDVxE8K9vxHc+0GASqHzCyPdzbiE
 C0YX/V0Zx8v2nYU3bGb7Z/0/+T1h9RCln2LxS+acLYl8ySvyYFACbQTGNc5Ege99I0Sf
 bwG27n6yHDk7Qd3AREK/gfTs6e5T94cz1G7m/T9NpGgxvv3CAC1BYTS+H3BT8RZ18jPa
 5u5O8bFhvJq8Aj88flLclTGUsdZXZL0PyeZRMn1+J6iAmaHGuK2CEGmW4PGNmFzt2CRc
 ML/4VAeimg+WobjCG1TwZKRhuKIi1a+Ur/ieszjUPss3WwOdyMojV7OA5h6tL5pUxS86
 Y9jA==
X-Gm-Message-State: AOAM530M1YpBt49f0vDEEgrJoAXA26tEmlg2SFPVVFSM0Vh5AdxSR5HM
 cM34Sx3L3IXjk9iH4G7ONmygidGyzu4=
X-Google-Smtp-Source: ABdhPJz/c9BBe2X0/d7Co5/W/FCJo6rOZb88ZGgTy1EpqhD/k6RkACeTGxvHRu4qSpN/b5Gci6qOaw==
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr3389254wme.36.1613482123761; 
 Tue, 16 Feb 2021 05:28:43 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p16sm5624090wmj.3.2021.02.16.05.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 05:28:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC cards
Date: Tue, 16 Feb 2021 14:28:41 +0100
Message-Id: <20210216132841.1121653-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is new interest in the SD/MMC device emulation, so it
would be good to have more than only one maintainer / reviewer
for it.

Bin Meng proved by his contributions a deep understanding of the
SD cards internals, so let's add him to the corresponding section
in the MAINTAINERS file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8201f12271b..88c28d2ccd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1745,6 +1745,7 @@ F: hw/ssi/xilinx_*
 
 SD (Secure Card)
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Bin Meng <bin.meng@windriver.com>
 L: qemu-block@nongnu.org
 S: Odd Fixes
 F: include/hw/sd/sd*
-- 
2.26.2


