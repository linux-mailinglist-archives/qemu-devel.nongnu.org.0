Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADAA301EB0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:22:05 +0100 (CET)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ltc-0004Q7-FY
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljn-0002xx-EF; Sun, 24 Jan 2021 15:11:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljl-0008Bw-Lw; Sun, 24 Jan 2021 15:11:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so10204984wre.13;
 Sun, 24 Jan 2021 12:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8jljS4EW5V2Y+XQ3p65ModjRC4/hYLCEEONBClbWgI=;
 b=aTx47kL+Av3B1DXPUzjVgXl0s8zC0ucf2mmsbIq93z02FUmeZbhP/4yIX6rQeCzii5
 eeD+jjP0gj57rmedfOkmopJM28dzVKi2TDPxddCK2YBI9EtAST88HWS1e49UeV7Q8iMR
 qfc1pLsKgItDUM8n3NvU2IJrzLm7c0711GjsqB58a9lQ6J6ocrw6AHQywo/Xy+IWwZW6
 Z4FoyWyZTvMddmVZ9Tey1CoMT5B3B3zqCrVVc6UXbQi5oE6yboxnfqvpDC9/yhMZ1F8b
 HoVzkMw746YkBXKt/qwOuUVH3+KLkp4P0FKBz/kCK98PlkShJUZ+cZugLQMBnoLHTvdR
 coYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m8jljS4EW5V2Y+XQ3p65ModjRC4/hYLCEEONBClbWgI=;
 b=NUBeTBXj1N1ArDS0Jb5pgZNMEYSTtOqxTdT/dv83iT9zkkLmRz3NjwZiy0v5MVfHyb
 8QHgZOC1CehneiVdmI4lKqtXY6h4R073apH27yjpq+fPFbrfclUUMohIWKQfeU+2yi0t
 1o+xB2Sy3eyZgnDqyxGSHksh1L52MFFj8h/4qNmJkrzZc6wdrzYwSBe3cFfx73hyWnw4
 NSzKofrNyWNsPNoGjftgl1d0BfvCmQE8ij/1RFQ6YK0pxOKInfYcB2F4rru2S4zb7eYv
 OPJsmrKxgJ+9gjCqe7pYFZ52lBKHC9MiVO5577qn4xfu6LqgdSChKL+94APreF+mlVSJ
 MBFg==
X-Gm-Message-State: AOAM533onTW1rcGzvM3odNEgFHlBrjHnEsY2hYyP+ksryeGC3pOF9uSo
 fsAGXTd61p3TbFAmSZ5L+TQN4/4CpC0=
X-Google-Smtp-Source: ABdhPJyMWCHmxT4rJUIdWKrX39+apFOc3ZLu9EvVJWJyVsoi7slA0pY18Qk3wzcNK5nt/GqNGgHlcg==
X-Received: by 2002:a5d:58dc:: with SMTP id o28mr3385160wrf.414.1611519111807; 
 Sun, 24 Jan 2021 12:11:51 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l20sm21654064wrh.82.2021.01.24.12.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] hw/sd: sd.h: Cosmetic change of using spaces
Date: Sun, 24 Jan 2021 21:11:06 +0100
Message-Id: <20210124201106.2602238-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

QEMU coding convention prefers spaces over tabs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-15-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 59d108d4535..05ef9b73e56 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -33,27 +33,27 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-#define OUT_OF_RANGE		(1 << 31)
-#define ADDRESS_ERROR		(1 << 30)
-#define BLOCK_LEN_ERROR		(1 << 29)
-#define ERASE_SEQ_ERROR		(1 << 28)
-#define ERASE_PARAM		(1 << 27)
-#define WP_VIOLATION		(1 << 26)
-#define CARD_IS_LOCKED		(1 << 25)
-#define LOCK_UNLOCK_FAILED	(1 << 24)
-#define COM_CRC_ERROR		(1 << 23)
-#define ILLEGAL_COMMAND		(1 << 22)
-#define CARD_ECC_FAILED		(1 << 21)
-#define CC_ERROR		(1 << 20)
-#define SD_ERROR		(1 << 19)
-#define CID_CSD_OVERWRITE	(1 << 16)
-#define WP_ERASE_SKIP		(1 << 15)
-#define CARD_ECC_DISABLED	(1 << 14)
-#define ERASE_RESET		(1 << 13)
-#define CURRENT_STATE		(7 << 9)
-#define READY_FOR_DATA		(1 << 8)
-#define APP_CMD			(1 << 5)
-#define AKE_SEQ_ERROR		(1 << 3)
+#define OUT_OF_RANGE            (1 << 31)
+#define ADDRESS_ERROR           (1 << 30)
+#define BLOCK_LEN_ERROR         (1 << 29)
+#define ERASE_SEQ_ERROR         (1 << 28)
+#define ERASE_PARAM             (1 << 27)
+#define WP_VIOLATION            (1 << 26)
+#define CARD_IS_LOCKED          (1 << 25)
+#define LOCK_UNLOCK_FAILED      (1 << 24)
+#define COM_CRC_ERROR           (1 << 23)
+#define ILLEGAL_COMMAND         (1 << 22)
+#define CARD_ECC_FAILED         (1 << 21)
+#define CC_ERROR                (1 << 20)
+#define SD_ERROR                (1 << 19)
+#define CID_CSD_OVERWRITE       (1 << 16)
+#define WP_ERASE_SKIP           (1 << 15)
+#define CARD_ECC_DISABLED       (1 << 14)
+#define ERASE_RESET             (1 << 13)
+#define CURRENT_STATE           (7 << 9)
+#define READY_FOR_DATA          (1 << 8)
+#define APP_CMD                 (1 << 5)
+#define AKE_SEQ_ERROR           (1 << 3)
 
 enum SDPhySpecificationVersion {
     SD_PHY_SPECv1_10_VERS     = 1,
-- 
2.26.2


