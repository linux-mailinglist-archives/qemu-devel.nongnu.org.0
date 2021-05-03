Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8E4371E8A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:26:54 +0200 (CEST)
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcLO-0008C8-2E
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8Y-0002CP-AY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:38 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8V-00043r-Qs
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso453980wmh.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FPJ9Qnru6OpVjKtqox8lDIug1vZ9yjVHlNfUoQamQA=;
 b=LAFzYhwC+5t7tkrPfD9N4Xo0hWJxacNEKZAKdMdXq2Hznqz2fRHuWVkyddNlgWyz3I
 UsFVLTYoBH2YVyLnqHolFK/c2RS5PlWxHGEMMwb4NvzjZIHEPnh2gFJwqJzhRYjHxdeL
 Ie9QeBf/sjymb+vGag9+G9hPd/VB4UbTyK6tHerxXKPF6jVKI+6Fr3w2qFN2m8AsAHyI
 Y1b/Oh0PSWKKdx/+3+AyICI7+l4bpZlZmf/H2JQHRA0vGv45OqG6krWFrUGBfUX7d9VB
 f3kZ40ScvEjFa4Ht5k3g+D2b4AQc7U9j5GFqxsjm+pYhdT9UzEJrBZGKnFeu846mkfQR
 q11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+FPJ9Qnru6OpVjKtqox8lDIug1vZ9yjVHlNfUoQamQA=;
 b=c3v9SEsYZwwTN5X9pTT+hiNqWWkaS54KyNnfOvy/F3ASkkP7quWZhoX2DbJHHE5Zgr
 N9p5NpMPN8Dd9s5MNWRL2jbvrll5q0X/XidR2hpBhkfZ1gXPpNqspjwsCVtZvflxF7PQ
 Sndr86JYJ5ayfWnyj9aWrKv1qFDb4J8gdrJTljIfnYfoUJ/QPCfIDllrmekHOw/DgSDQ
 uqG3R3zJ/IQQ57f/DzZWoh/Ms/ztwHx9G/a4oKykguNpsQgsOge0eI4u6VMWxNH7ugXB
 4+2Jt+5qfVK7pV+gbeBvRjZkhaae61bSHTJuLP8G9jpwHJWvmV/VeCvgUlM5a0DICNnk
 JtwA==
X-Gm-Message-State: AOAM530BOh86OW3FZaz9v6l6R3a/Q282vhu5XuB+0X1dctyGP5fci7tj
 XPLO+DlW+aG6ke3iV2zlK4/XcJbHO0y4rA==
X-Google-Smtp-Source: ABdhPJwbrqzRfUzIX3wYDkD0MZ6hzdATVwinkEtzBiETnIxISM/0QmOqtcecvf56Bl+VNzikOxM2KQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr1781688wmj.63.1620062011467;
 Mon, 03 May 2021 10:13:31 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id k6sm32112wmi.42.2021.05.03.10.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] hw/sparc/sun4m: Fix code style for checkpatch.pl
Date: Mon,  3 May 2021 19:13:02 +0200
Message-Id: <20210503171303.822501-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
References: <20210503171303.822501-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a625c41cd37..956216591b0 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1181,11 +1181,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0xef0400000ULL,
         .esp_base     = 0xef0800000ULL,
         .le_base      = 0xef0c00000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
         .aux2_base    = 0xff1a01000ULL,
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x10000000, // version 0, implementation 1
+        .ecc_version  = 0x10000000, /* version 0, implementation 1 */
         .nvram_machine_id = 0x72,
         .machine_id = ss10_id,
         .iommu_version = 0x03000000,
@@ -1204,11 +1204,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0xef0081000ULL,
         .esp_base     = 0xef0080000ULL,
         .le_base      = 0xef0060000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
-        .aux2_base    = 0xff1a01000ULL, // XXX should not exist
+        .aux2_base    = 0xff1a01000ULL, /* XXX should not exist */
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x00000000, // version 0, implementation 0
+        .ecc_version  = 0x00000000, /* version 0, implementation 0 */
         .nvram_machine_id = 0x71,
         .machine_id = ss600mp_id,
         .iommu_version = 0x01000000,
@@ -1230,7 +1230,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .esp_base     = 0xef0800000ULL,
         .le_base      = 0xef0c00000ULL,
         .bpp_base     = 0xef4800000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
         .aux2_base    = 0xff1a01000ULL,
         .dbri_base    = 0xee0000000ULL,
@@ -1249,7 +1249,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
             }
         },
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x20000000, // version 0, implementation 2
+        .ecc_version  = 0x20000000, /* version 0, implementation 2 */
         .nvram_machine_id = 0x72,
         .machine_id = ss20_id,
         .iommu_version = 0x13000000,
@@ -1270,7 +1270,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0x78400000,
         .esp_base     = 0x78800000,
         .le_base      = 0x78c00000,
-        .apc_base     = 0x71300000, // pmc
+        .apc_base     = 0x71300000, /* pmc */
         .aux1_base    = 0x71900000,
         .aux2_base    = 0x71910000,
         .nvram_machine_id = 0x80,
@@ -1352,7 +1352,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
     /* SPARCbook */
     {
         .iommu_base   = 0x10000000,
-        .tcx_base     = 0x50000000, // XXX
+        .tcx_base     = 0x50000000, /* XXX */
         .slavio_base  = 0x70000000,
         .ms_kb_base   = 0x71000000,
         .serial_base  = 0x71100000,
-- 
2.26.3


