Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0B6504C2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:21:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p714x-0001PT-8u; Sun, 18 Dec 2022 16:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714F-000131-Qs; Sun, 18 Dec 2022 16:19:45 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714C-0001xp-Nv; Sun, 18 Dec 2022 16:19:31 -0500
Received: by mail-lj1-x234.google.com with SMTP id g14so7315269ljh.10;
 Sun, 18 Dec 2022 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNBvOLNtuNzW6P6rPNag+NZ5QBlW2U7hfyBqq0mBtpM=;
 b=eY4fzNfgP6QVix9ywq5T6WMc08Hb7EufgXpxVkd7j3TWsJAXzopeJs5GBIBffhbMUO
 BGVjDw0zDURnjLpT4gLNddSfvpvqMXuTRXkXWdqn4YFErcCumEOLrt3Um83U/Xxg/1Lr
 ysUWGyR6mZRwuQ8FDkQyVzGYpAPeQyrIvr4TQ22TXi7BVNPmQHzqEHCxBcGvEsNJXFwa
 3152Dby7fES4Pzc/veBpata3U1tY/w8LDmUVyC0uRv0qJzaYKUDdSKibVE+32K+3tNwu
 IwDcNl8wIbMdtBSVmqzaQA9l3qlDFD27UELV6Xm4edhT/8uuyzWaWXzIkAjD6gegIBdp
 5ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hNBvOLNtuNzW6P6rPNag+NZ5QBlW2U7hfyBqq0mBtpM=;
 b=7iUF3ryVSKhqsR4YdnCXKYLTu9cxRmqOVu0Y5NxBaPTfBf2oLHxFsFJ30809QD/oyR
 zJFBF6g4YSwAh3qh3v1eY3VmogcV/NqNv9KBSdFZ/L5kKIseinpxUjmRZSXc6ldXvA8E
 jPzHzVpCt2FW4ShHHwj4+pzFJspKFPXvmjUgixxwcsEAtka7RBzeNvV+514iZZ2fmovB
 bT4sFum5XCaTyTWN7c0P0MdAZH1XZYdemV0DA8M12717JTGEXpw3YtDi+KYa5Hoe/fSE
 Iis5QzveRUPWAa8DqECVCkg7cKs+vC0hCnbMgeRsdUMDkzRIwXbkvE+tmWI/6HRcSr/g
 O8Ww==
X-Gm-Message-State: ANoB5pk+qkzAGnVPwYCpbP0besG2SxvTSPd1IxmUDTDI6Z2rr0rOGeRI
 t1F5JjdbOL8j2FsAOGe7+EY=
X-Google-Smtp-Source: AA0mqf5FpPXEXHcPuC18ORXdy1QkF/Qs6qy1fqjebsnR094h3PGeGQ7Xdx2CgqovNZWQaWNYpLuIBw==
X-Received: by 2002:a05:651c:1592:b0:26f:db35:d203 with SMTP id
 h18-20020a05651c159200b0026fdb35d203mr10202779ljq.15.1671398366104; 
 Sun, 18 Dec 2022 13:19:26 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 w7-20020a05651234c700b0049464d89e40sm902620lfr.72.2022.12.18.13.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 13:19:25 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 5/7] hw/arm: Add AXP-209 to Cubieboard
Date: Sun, 18 Dec 2022 22:19:16 +0100
Message-Id: <20221218211918.3592-6-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SPL Boot for Cubieboard expects AXP-209 connected to I2C0 bus.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/arm/cubieboard.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7..afc7980414 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,6 +20,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/i2c/i2c.h"
 
 static struct arm_boot_info cubieboard_binfo = {
     .loader_start = AW_A10_SDRAM_BASE,
@@ -34,6 +35,7 @@ static void cubieboard_init(MachineState *machine)
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    I2CBus *i2c;
 
     /* BIOS is not supported by this board */
     if (machine->firmware) {
@@ -80,6 +82,10 @@ static void cubieboard_init(MachineState *machine)
         exit(1);
     }
 
+    /* Connect AXP 209 */
+    i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&a10->i2c0), "i2c");
+    i2c_slave_create_simple(i2c, "allwinner.axp209", 0x34);
+
     /* Retrieve SD bus */
     di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-- 
2.30.2


