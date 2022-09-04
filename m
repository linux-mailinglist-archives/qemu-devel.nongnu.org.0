Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBD5AC82A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:45:00 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzIR-0003iB-PK
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9G-0006xD-Dn; Sun, 04 Sep 2022 19:35:30 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9D-0004wz-CX; Sun, 04 Sep 2022 19:35:29 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so5187554otq.11; 
 Sun, 04 Sep 2022 16:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IYuBpuhPoSwO0ADjmCL0+2qArTL7nXF9G6v9/opgL0c=;
 b=TFNnyilwKHl8whE5el2ZHAK1Fs6b1AF4zqBRfhHPe7IaQvoLlpfoOOybNC6pL6OPYJ
 wlitcMkNcpC0dA4V1jTiBBKoXG1Sroq7m/R+RlPHcTSAP+Cm/tqkK70Fle2qOMohXy+R
 0z3H3LwCyDd2ekQjKaGPvDVY8gtsGLnl9gewGQu70kQHI+wKRHmNCxPuWOJDvt7jG3an
 5PVyuUCIJuYoRL4sdxjTHMoK3fvyOZ12C5ZSXX8WFU71PXvbZHvb1oB0h+qGdfZ5YGzz
 a5S+btAVAfKRnz5C+iO6oD5XPYyZM9OUp0lcNR867zWnHLZMK6f/PdQPTmWJ1odtT0qw
 lZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IYuBpuhPoSwO0ADjmCL0+2qArTL7nXF9G6v9/opgL0c=;
 b=7G5+ClYAJJ0LI1mesItKLgfVRGhSRKks8ozkfSDT1tS7h5Xyn4scr3DEw22ceU8wax
 JlyEc5GNWEoSmlYBlWT7Wg25oUOz0xUZuru6aAqp0NKDVIkp2jNm0CYrX8QpwJGargRP
 JS9KIvvlfsaLEdTaykUKrmsrZ/UMksX0U39rhL4xadO/fIC3cx+JiT35fwtdbonvaG73
 Hl3gHsWsZ7RHcvZtt1GYOkUbDu+mCVe6sFzq+bMnLIitwzYGMW7Mi24AYqsJ3D85w0Eu
 HXWNgDNjMeNgdT0LbHijf7xGxcNBmcj5C0DpEx+pwnglOsxuFFWrnm7pwthuWe2O0BqS
 IZ7w==
X-Gm-Message-State: ACgBeo2DeZUaIS/+KhRyGpEYafMGSJJHlQv3U4GGGxYbV6vtiYIZkNte
 g+D2TKNb/FXy+HdUzHSwCxERDvpnGrTQOA==
X-Google-Smtp-Source: AA6agR5HS/Ze0l3RBplZc77918XTpBcwRLwE77lM11ZXaRqY+dcIcwTjyAuS1NuLQ2ey7JpFW7bRLw==
X-Received: by 2002:a9d:740a:0:b0:63b:25dd:ed01 with SMTP id
 n10-20020a9d740a000000b0063b25dded01mr15481834otk.14.1662334525539; 
 Sun, 04 Sep 2022 16:35:25 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v6 10/14] hw/ppc: set machine->fdt in spapr machine
Date: Sun,  4 Sep 2022 20:34:52 -0300
Message-Id: <20220904233456.209027-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

The pSeries machine never bothered with the common machine->fdt
attribute. We do all the FDT related work using spapr->fdt_blob.

We're going to introduce a QMP/HMP command to dump the FDT, which will
rely on setting machine->fdt properly to work across all machine
archs/types.

Let's set machine->fdt in two places where we manipulate the FDT:
spapr_machine_reset() and CAS. There are other places where the FDT is
manipulated in the pSeries machines, most notably the hotplug/unplug
path. For now we'll acknowledge that we won't have the most accurate
representation of the FDT, depending on the current machine state, when
using this QMP/HMP fdt command. Making the internal FDT representation
always match the actual FDT representation that the guest is using is a
problem for another day.

spapr->fdt_blob is left untouched for now. To replace it with
machine->fdt, since we're migrating spapr->fdt_blob, we would need to
migrate machine->fdt as well. This is something that we would like to to
do keep our code simpler but it's also a work we'll leave for later.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: qemu-ppc@nongnu.org
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 3 +++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fb790b61e4..170bbfd199 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,9 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..891206e893 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the machine->fdt pointer again since we just freed
+     * it above (by freeing spapr->fdt_blob). We set this
+     * pointer to enable support for the 'dumpdtb' QMP/HMP
+     * command.
+     */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.37.2


