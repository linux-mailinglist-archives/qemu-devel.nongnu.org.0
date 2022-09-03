Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81785AC132
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:42:12 +0200 (CEST)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ1v-0001SH-Ra
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuv-000730-Uw; Sat, 03 Sep 2022 15:34:57 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:36377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYus-0005Oi-Bd; Sat, 03 Sep 2022 15:34:57 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11f11d932a8so12918847fac.3; 
 Sat, 03 Sep 2022 12:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=m2gi4dfAl1OXdDzHLeD2gtzCh2ri3JmVJxGP9lnJ7D0=;
 b=ORePCByxr4r5iLXPavR9AidoxTKT0oVAiphCjZmN/qBznJQ/RwlbXaZj9QsQZtdIrL
 WwyvWvNfACJekui+BKfBduCrF+nMhZvsldxTLJtIp43n/oiJNyqGu3o144wITrAgr5zP
 I/W7NzVMoN4LwgEGCklO+ml64d1mihCbhuNioTHm/bsLrIVTLJ7Hh46NkIH0U0KPAu1E
 xOHOATyU6mJc1mh1SfqvIpwPvQfnB9CYiXgwFcwpaybLQaiuZHFSE3CYdtp7/9nqzWjy
 /Q4o+UCBNXVRwc5o167Pe81PAcoV3f6z3A7GV2IBG4m/3HLZVXZq4v6lfcYJEM3Ajhvn
 SNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=m2gi4dfAl1OXdDzHLeD2gtzCh2ri3JmVJxGP9lnJ7D0=;
 b=NOkJkfGI5smUDyw2v6Ry+lTzBTX2zHOTM9QAFmYP9r9niZ+rYf1HXYHPyNeparLGQL
 QBkAVrGvyzVsapfyqPEDhJqk6xbpxPPBIYQQochc/SC6xaBr2sR0Mp1oLhAcXL1W98qK
 48Brfbg/7aaSTAULChGaMAGxUX62fe4rJMyjLdA4GdSwgKtO4R4ffwetW6qPPjMcGWHr
 LXyeNnTXLOe8uNTVjS1pB6Tn6paFEpkBJKqeU/gX2tsoIqt9pTzVNn3fEnjMZ5q3P5IG
 KiUpEAq9woSAk653iotAk165NsKSCqkK3cFqw5JR2Zj2A4j2l9J1GV5TJBy4t+3Y4Xnw
 lgSQ==
X-Gm-Message-State: ACgBeo1IU/fYY/3s8WlVI9o2f6q85L3I//LOWi1PvrpAQ7TNacx3G9Oe
 +ZV7TVJL//KOWNgv4cPleMRWHRV/pfELWA==
X-Google-Smtp-Source: AA6agR5tGUFqQcHzilq4WW03aZDBtZOtneTIDLZtuLH6azABM+Z5mzjrTwiY8h98mnPxJ8HrHLWdsQ==
X-Received: by 2002:a05:6808:2d7:b0:344:a080:7e8a with SMTP id
 a23-20020a05680802d700b00344a0807e8amr4351718oid.10.1662233692075; 
 Sat, 03 Sep 2022 12:34:52 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v5 09/14] hw/ppc: set machine->fdt in pnv_reset()
Date: Sat,  3 Sep 2022 16:34:15 -0300
Message-Id: <20220903193420.115986-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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

This will enable support for the 'dumpdtb' QMP/HMP command for
all powernv machines.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 354aa289d1..afd90d261b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -678,7 +678,13 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' QMP/HMP command. Free the existing machine->fdt
+     * to avoid leaking it during a reset.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.37.2


