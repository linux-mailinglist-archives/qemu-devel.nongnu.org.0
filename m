Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21920B61D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 18:45:46 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jorU1-0000gu-4Q
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 12:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorP1-0000AN-UI; Fri, 26 Jun 2020 12:40:36 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorP0-000624-HO; Fri, 26 Jun 2020 12:40:35 -0400
Received: by mail-wm1-x342.google.com with SMTP id 17so9961194wmo.1;
 Fri, 26 Jun 2020 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NATlEi/FrWfP9Y28UrUe6cx6ZnLH5i2MWU0fBA6ejkY=;
 b=lrPCUCdQZAKyBm80BbdG4hAp8m1tGZNNsDUIFMkMCHfb62uNLj1QH/xaJTtVVDoKCr
 hmObZII7yaHzPyKybahOU5vUH2DzWCYLnDu5Ns7H5MqB1p02/oYf2C4WBLCOfFIf7h3n
 sj1H6W5fmkbE8X/1Jfl8rke2uzfzn2A456VUHwYkkrEUvW6oF7E+pDYs3Ra4fum52ehM
 BcB77i9ZHgIjMdO6Uyo2Mt/+TKCI5WHtEZIFk34Eu5uW98cGF061KDin8Fr4UknkoM3v
 Pxd9gKehcMJw/NQXn+rdr2uz16dY0YrKFid/yg07c3rf0DFNUFMhtLXfOL3rsyce4paD
 nWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NATlEi/FrWfP9Y28UrUe6cx6ZnLH5i2MWU0fBA6ejkY=;
 b=gIXV3SGTWwga6hmiOuFThvDh1TD6OkIowjQXT1isza8fmEO0F7bP5VBY6cnq+1dlPy
 5PgiUkko4oeSwQ2Q9mZWfp0/+9eiqnMmGoQK17a4t7CERzSo5xHkm1pIYSLg6IA5+fwe
 NIx9gadY6OYVx5BDqXB9Ae0yVKXxv/mmxWjlgad75mnlXnkCPFAtxwRnE4RGI9SJq2FP
 7Jy4p5fl6adz+vPlj0Ebj0q5cxurqAD0+N9ITIujP3RcpWhl+JKxQPUQPRUmYFglbBKA
 TU8dhFFJDiQbgLpMRJjm+2mUNZMFB5vJVHtUg+qHNsx5hYaU4hZUB9oiqCqpo8AVMEBm
 2OHA==
X-Gm-Message-State: AOAM5334wE9pmB1KLRJEsHWhkL335tp/mKhJEelcN/vl9v6L3iciOfLy
 t9em6JGcEpOUTcd/ELAm9CnCDCur
X-Google-Smtp-Source: ABdhPJyE8/oov+Yo7hoe2tmnzQQIp04aiKT1lLxD9CPQjgXBtPOSak3fTUOWvXUJ1EIwLaUjX6312A==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr1497535wmf.125.1593189632280; 
 Fri, 26 Jun 2020 09:40:32 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f12sm24623646wrw.53.2020.06.26.09.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 09:40:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/15] hw/sd/sdcard: Move some definitions to use them
 earlier
Date: Fri, 26 Jun 2020 18:40:14 +0200
Message-Id: <20200626164026.766-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200626164026.766-1-f4bug@amsat.org>
References: <20200626164026.766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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


