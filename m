Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A161C5456AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:44:10 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPwn-0008EW-7N
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GmmiYggKCpEHF2v9ED219916z.x97Bz7F-yzGz689818F.9C1@flex--wuhaotsh.bounces.google.com>)
 id 1nzPua-0007KJ-7S
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:41:52 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GmmiYggKCpEHF2v9ED219916z.x97Bz7F-yzGz689818F.9C1@flex--wuhaotsh.bounces.google.com>)
 id 1nzPuX-0002y0-JN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:41:51 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 y63-20020a638a42000000b003fd47b6f280so8476123pgd.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+fhVv/HkKL9POu6/6BiCdonPJbGD2u6DpfYLTcqsi9A=;
 b=fsOH2uzRFr5AuJzWP2PvIpv1cuc1OUbQBkPPRx/G+z5BWlGtaah1birIftg7O2vBxn
 0RMUmWqmZ8RmvmPOD2a4SKTCDFxDS1h/A0+hoeHE+LrFTdFlMwTDwBKtWUGsxBOmWsQG
 Y7Csv2jJy0/46cfbLM7cHbH7dTKwi8AR+qxdHCqC3s8xibzjiA2OzOC3lZZcTB4W+LTU
 UG9PknK4X9S1Tvb+QxDiRolL2I/f23JGrczm/FM3sSFvMfyWgaYwiTFW6IaAQ7gHNhhQ
 iOv3EtkvruImxYgA28qbSkDve8pQOHoSrTraFeZg2b1dxrBqSM8VfpGf5eirG+FFt52S
 mWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+fhVv/HkKL9POu6/6BiCdonPJbGD2u6DpfYLTcqsi9A=;
 b=6nAgVmktS/iAYRYLAjAql7pRUhwPDA+eN5iVLiMXSQCPN1PptghhuPlbaTFOCT5EGb
 MBmj+ZBsmjzJkqHwYpWPIo5WJAHwsqbmbmLDWNffNIckwDBs5bxHA80Se5GHYK+NZGjJ
 8zC7woW4tm3P/kRT/ootBjaXSudmWD7byJxiz+TxsZofOVYaA+SjrL6ax3RdDKImfSpK
 2a0KjzVjZ9ksq0EjqZEPi33Pt/ZiaKAd/Sq3Iy58KwnteTo4CSqRUcMM+M4haexwmnJE
 ZbaNRP2Ref/A5zOLoNJg4lGa8jHURvEGh7YMt6lR9OVeOyxceR8tk0FnHi5xYnG+aU3E
 i1yQ==
X-Gm-Message-State: AOAM531y64+E3MEwSgRBDy4r4wcVRPyqp4c/bv/0BJFZk+05p4JRl3MY
 D5OiSgll19mBCOzLnTEI/jCQasfGGEldfg==
X-Google-Smtp-Source: ABdhPJwf26qBGg65346nIzuMefIE+mwLkDHbUnACtSGNUGtpzfFDi/nUkJAvVM5EA65e2uA10v4ISvRvnr8MnQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d4cf:b0:167:735a:e7a1 with SMTP
 id o15-20020a170902d4cf00b00167735ae7a1mr25207966plg.161.1654810906698; Thu,
 09 Jun 2022 14:41:46 -0700 (PDT)
Date: Thu,  9 Jun 2022 14:41:25 -0700
Message-Id: <20220609214125.4192212-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH] tests/qtest: Reduce npcm7xx_sdhci test image size
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, stmao@google.com, richard.henderson@linaro.org, 
 jsnow@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3GmmiYggKCpEHF2v9ED219916z.x97Bz7F-yzGz689818F.9C1@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Creating 1GB image for a simple qtest is unnecessary
and could lead to failures. We reduce the image size
to 1MB to reduce the test overhead.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/npcm7xx_sdhci-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
index aa35a77e8d..5d68540e52 100644
--- a/tests/qtest/npcm7xx_sdhci-test.c
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -24,7 +24,7 @@
 #define NPCM7XX_REG_SIZE 0x100
 #define NPCM7XX_MMC_BA 0xF0842000
 #define NPCM7XX_BLK_SIZE 512
-#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
+#define NPCM7XX_TEST_IMAGE_SIZE (1 << 20)
 
 char *sd_path;
 
-- 
2.36.1.476.g0c4daa206d-goog


