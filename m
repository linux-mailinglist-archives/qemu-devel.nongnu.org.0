Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB258A905
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:49:24 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtxL-0002y8-Tx
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtob-0007Y9-Dj; Fri, 05 Aug 2022 05:40:21 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoW-0001fk-8H; Fri, 05 Aug 2022 05:40:19 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id o123so1945106vsc.3;
 Fri, 05 Aug 2022 02:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VQVatWRzJzIALnBx+eLVXqARRsrCtfKyW9iFoiU3AdU=;
 b=gHQmVyo87E/Af2yzQjqxkcrRnCCcCtwAjH/y2anm5RioR4/KtDuyN9DYyT5fzFkSKA
 LtCIg49AAAftTtsZT/vUZr1AuaiVGMIARy4JzFVbzvQ6WtRVivusm8Rwn5hAAdl+/Dvg
 8zN5KbVgbYyA7MXdJ0E7F59I5Fm0jLLQUrY5+AFCCcMilAfBSaKfLXW8tWJykcDJv6uK
 bJnvTKedtfXqrkNE5zSGhhCJjxTY/06yHTMk2x+XIbm/zCUpD70QECweUr/H9S4MfsnT
 UB04s6+ewuumQvHL8CaKYd56Vd73pJ9ryVYTw165HOZuQjpRA1UriaJLZQRAPsW0AZm7
 vz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VQVatWRzJzIALnBx+eLVXqARRsrCtfKyW9iFoiU3AdU=;
 b=jJi36r1W9auCYmlr7xCAqPGIxHUUPhN7phfi9kwaS2mmjqPzBd0PQb3qMmN4QMIDCZ
 1oUeWxafB2abqf5dDwxcZiE/7ewD/ph+ExZjSWWTq2HAYAi5Yk9bG/l599gp6E0si4T0
 xmSBfD2zBy+r2yHTcpItM97njJgyHPxUmIDyFHrx85GvCkpDhdl0cr0+ccdi3k74Khuw
 j229KkdzuI0ZAvvgMtRjzEOkYzR2Wq/gfFvNJsFbhSIS0w30EMqVeezMLH+fWh6InpBx
 SaeEkKqlR8MqQH/2eD3R7tphou+9EFoj9oq/4vdjUqa+7cF548Aul/z6ch386iN96BgZ
 iQZg==
X-Gm-Message-State: ACgBeo1md2osFw4PuVJnoI+923wDxkCjXjSIoMjZ2Ath9R8jCLq7Bqen
 y6Yj4w/rMJG8xxAVGMt9lIlfwVfHgOI=
X-Google-Smtp-Source: AA6agR7RoKUwkpiMF0/PW43x/V/TvfAiL2bI1NYM8G57h87rHkMtFkzIWDl5Cn29iwZJB2HWP8Bncg==
X-Received: by 2002:a67:b24b:0:b0:357:31a6:1767 with SMTP id
 s11-20020a67b24b000000b0035731a61767mr2497774vsh.29.1659692414943; 
 Fri, 05 Aug 2022 02:40:14 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Date: Fri,  5 Aug 2022 06:39:38 -0300
Message-Id: <20220805093948.82561-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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

We're going to introduce HMP commands to read and save the FDT, which
will rely on setting machine->fdt properly to work across all machine
archs/types.

Let's set machine->fdt in the two places where we manipulate the FDT:
spapr_machine_reset() and CAS. spapr->fdt_blob is left untouched: what
we want is a way to access the FDT from HMP, not replace
spapr->fdt_blob.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 6 ++++++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dc..94c90f0351 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' and 'info fdt' commands.
+     */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..0079bc6fdc 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the machine->fdt pointer again since we just freed
+     * it above (by freeing spapr->fdt_blob). We set this
+     * pointer to enable support for 'dumpdtb' and 'info fdt'
+     * HMP commands.
+     */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.36.1


