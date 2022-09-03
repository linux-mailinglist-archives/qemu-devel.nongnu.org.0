Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0435AC13A
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:47:57 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ7T-0000OG-S1
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYug-0006gY-61; Sat, 03 Sep 2022 15:34:42 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYue-0005Ml-IZ; Sat, 03 Sep 2022 15:34:41 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11f34610d4aso12839578fac.9; 
 Sat, 03 Sep 2022 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mGG3U2Luf4I4urQShsm1RjBsPx5YCf60/nn93DboxwM=;
 b=G4ydH1+eRpwK7ql9aIgeXgqPjrY1ltzEZ/kiodyFFI/J6XDc+oL8E6AhcL/Vas1Xgf
 ZV2Q7JHhaBG3MxRnRDfFOpTsgJER3Zodc6CJFLy/vbbVL+UF2SGU4QHYNdJOIlL6a5Ep
 ZXaWtYUzW0uvYVEm/R1fXPLBxx7aHGxCfcOdj7ziJACAwunRm6dO60//FMPf61JIl6FP
 SuBq6rh0e4sT+ByJt4x8OB6LBRevkwNNklxEt7UtRf4sq9vqQ2NKtVFX9WlCWMD8w7Ss
 fkRNLdkQG3Yeu+gSHZ5z6MvHYnUBWLUfwDaCNRe0ceZJbTdV0G7fiiKUixcxJ7qBeThL
 m5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mGG3U2Luf4I4urQShsm1RjBsPx5YCf60/nn93DboxwM=;
 b=NxrjGRellhcM6rYzTAjvWNplvZPPzKEyuj7bmXLPWCAFtiXicz5iffC1XZRgbif8zL
 H7tLLlxqSP32fsO/VwV22xFW1aZRN0OvrUzHys1yxU6IWiR/FrJBWmntqUw+DTNJ6Dbf
 Uwltrk1LoGWhdewWkxViGJG6NcQHbVJs7ACnRFoEkEoJmLA1NWuNiEicz04D/yMYnrNR
 UeA3+a7BNs3sJJnxZt2u6gN4yyCksyJAEFguMRkXGK/waPmcYufeIOhFW+Wnja8Af6gp
 hs3Mvn/ve5xvzgbrt+rJI1COFQdmkAwcNxF86bIUdJAR1QvfS3AUVq5H8iTNBp71q5PL
 rJOg==
X-Gm-Message-State: ACgBeo38ogsTXmNExmfz+qQyjzEDEneS7ua4iy7naeTjWj+E1zmqBzMi
 wfNHlrUEbcGFZx1NYMlz1kmF2c8p8KfPKg==
X-Google-Smtp-Source: AA6agR6HOJTlRbS0q6iXIjFGmVKp4Kov43XOg5L07v1OhZdAKG+COyJPvOdkBRxaoM6/uvOvdRjqYA==
X-Received: by 2002:a05:6808:654:b0:345:c243:4a1 with SMTP id
 z20-20020a056808065400b00345c24304a1mr4417959oih.220.1662233678628; 
 Sat, 03 Sep 2022 12:34:38 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 04/14] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Sat,  3 Sep 2022 16:34:10 -0300
Message-Id: <20220903193420.115986-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' QMP/HMP command for the e500
machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..ea5f947824 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,6 +47,8 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
@@ -600,7 +602,16 @@ done:
         cpu_physical_memory_write(addr, fdt, fdt_size);
     }
     ret = fdt_size;
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for the
+     * 'dumpdtb' QMP/HMP command.
+     *
+     * The FDT is re-created during reset, so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 
 out:
     g_free(pci_map);
-- 
2.37.2


