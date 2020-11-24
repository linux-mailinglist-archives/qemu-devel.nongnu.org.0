Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CA2C2218
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:52:26 +0100 (CET)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUzp-0001mH-8J
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxb-0007x9-Gt; Tue, 24 Nov 2020 04:50:07 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxZ-0006Uo-Q8; Tue, 24 Nov 2020 04:50:07 -0500
Received: by mail-wm1-x341.google.com with SMTP id x13so1636891wmj.1;
 Tue, 24 Nov 2020 01:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZTdjbmWHnGTuptVuo3d7Aeku+k4NYLvw5VlNk50nF8=;
 b=u8RQG6t7FQixuV7R41zhnmuROphjzW2Bkg0W2uHS7osEgDxmDvzMl3Tds8st9rTnbV
 pCAlhqjz/MLZsvy1klIcvuNnQq1emJRziehxlssAXDk4chOi2o1JLEN+SeBuw7rBElUh
 2FBQWDqfhir26vM2mFhCvHSFh3wLQZJaDfCFe6zZ8Etw5vUzewz4Rz/xBreqmqz4b39k
 QzFHpyog/69bOAxDUuw7yWqHOfiV2jDrDvrIGHU80sBaX37hyjAx1/6E7l2pqJaphp85
 9F9Hy+/rJFtryuGzTavN8KadVGsJkWsZO/3o9X0L+xoyoHGjfqqn999tEplJ1gI2z/P4
 XtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HZTdjbmWHnGTuptVuo3d7Aeku+k4NYLvw5VlNk50nF8=;
 b=foxSXCkdjUGCrNGn/SsV1toHQU9/QPrKvNkvHwyKqX5FKR0VLWdxYu+uSBC2J4gTXt
 pNpJyS32yYf5jiVGYfT1qJMY9CqIHvZIg1MlJfVmNoCWAdrKkh8bCCCzkfXp74FWrzpb
 YpVXymVxGYybRWUlF6SKgEFmFymI9RcEy4tO9m0TnCmIT+hjxlnQn/pF9ItRa/VB6VJZ
 B0YYZQDsJpR6ZaQnF/l4MUaYnSh2SdW44Gz4iF5k+CMzqNrMM2NnVUSEA6uNvjv0z0Xq
 ipDjw0wudT1mnyd8GAO0rdHlvvje/hklDLZyqmCohmmHkG+UoPlFwThZJaYz5r6guP6V
 4FuA==
X-Gm-Message-State: AOAM530A8K2VoV7UKanq/qU6E91TIlJWoi2Wf7kVcsPJ3ztyDJlrzgP3
 7+tkie5t/LA60fPBwKlyh+goYlU0aDo=
X-Google-Smtp-Source: ABdhPJwPqCGLXa4WZ7XiWVMejE80iZdj3K8VnrWmAbXmDsThsabxlaVkIzjNOrq9V4rkc8+jmyMiZA==
X-Received: by 2002:a1c:6184:: with SMTP id v126mr3395095wmb.64.1606211403759; 
 Tue, 24 Nov 2020 01:50:03 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k84sm4454454wmf.42.2020.11.24.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 01:50:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? 4/4] hw/arm/xilinx_zynq: Add SD bus QOM alias on the
 machine
Date: Tue, 24 Nov 2020 10:49:41 +0100
Message-Id: <20201124094941.485767-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124094941.485767-1-f4bug@amsat.org>
References: <20201124094941.485767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to select a particular SD bus from the command
line, add a QOM alias on the machine (using an unique name).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index b72772bc824..6a4a1de88cf 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -286,6 +286,7 @@ static void zynq_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
         DeviceState *carddev;
+        g_autofree char *bus_name = NULL;
 
         /* Compatible with:
          * - SD Host Controller Specification Version 2.0 Part A2
@@ -299,6 +300,11 @@ static void zynq_init(MachineState *machine)
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
 
+        /* Alias controller SD bus to the machine itself */
+        bus_name = g_strdup_printf("sd-bus%d", n);
+        object_property_add_alias(OBJECT(machine), bus_name,
+                                  OBJECT(dev), "sd-bus");
+
         di = drive_get_next(IF_SD);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         carddev = qdev_new(TYPE_SD_CARD);
-- 
2.26.2


