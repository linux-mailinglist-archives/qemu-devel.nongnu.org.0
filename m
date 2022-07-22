Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A257E7DB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:04:35 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyt0-0000YN-F0
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyow-0002sp-LS; Fri, 22 Jul 2022 16:00:22 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:45734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyov-0005Ch-1P; Fri, 22 Jul 2022 16:00:22 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 v5-20020a4aa505000000b00435b0bb4227so1019258ook.12; 
 Fri, 22 Jul 2022 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pES3OUwSggunbQU+tmgNIZG7n8J8b5Ja341if3roq2Y=;
 b=RhoQAtl8B3raRMcLKceRL8muFdTnFFb6yRxb5OdK/a56edKowub/AWYB53NHb9pnCN
 CEiGrR24BzNPDW5mKWnyW8uRb6Nay+n3aDN4yirYwQpLw9I6n2clDgX2705OeJ2R1Q0n
 dYl/I8t3VKYmkWlHfHYNWeE8dlBEF72qLhvWAUTrm2q///nV/P3bkKIuqYspyBFcDUD7
 185xRcftw3hw+oGdaVv5/HNAzPSpxLFMKrSy9j9VF7KCycor+yPtwwBK08xbe9WoVyNU
 p/jV4Agld/8WaQ44GjvVR9Ll3+oteOWluEUkyt97e+enorADQU6dlzb34hG39hGNrv8A
 dNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pES3OUwSggunbQU+tmgNIZG7n8J8b5Ja341if3roq2Y=;
 b=xQ+XsCpm47L50qT5dieTp9iMI3Vfn67Wi0jTnRuVPQRud2YpIyK8PvDEEt6r3CkxnC
 MwPFc0vltR0fY4bqnVG1R+0xCOSK7oRsgRG+39fNS01Mg0OMbDSOnkzB9PRZa9Ja7Iko
 ieJ3A88GlPTn+Nc772emY7gmvRCTPwgOV+28lejT770Fhuv4e24DTqbTCy9fUfxScIL+
 MQBvIDUUfHPYX1Zfp2gZi8cefUqHnrZfywiKYXbNYcqbXBMeflft+Hxomo5/PGhpHOjY
 ZUsNtrupdt/EfBosxDWt1UJlfG3475bwRObS1gYnBufKCMIIl5+US+XNQqhlz3Z1UFvw
 c9Fg==
X-Gm-Message-State: AJIora+rdI49l2GDUeUQuf7woqF3AVVsP7vVhgGQ/gkij/KdrYHBnO2o
 URIq2fHcN92aV/OvyP/NbZa5TkmB22I=
X-Google-Smtp-Source: AGRyM1tWdDErTuYYhL/DJl2SsBM4dPhc9i4dR5sgpOzjka3/ZBy1T+Ywyl7VHDTRS9jqqaOpxo23mg==
X-Received: by 2002:a4a:ac89:0:b0:42c:7331:a110 with SMTP id
 b9-20020a4aac89000000b0042c7331a110mr589289oon.40.1658520019018; 
 Fri, 22 Jul 2022 13:00:19 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: [PATCH for-7.2 03/10] hw/ppc: set machine->fdt in spapr machine
Date: Fri, 22 Jul 2022 17:00:00 -0300
Message-Id: <20220722200007.1602174-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
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
 hw/ppc/spapr.c       | 3 +++
 hw/ppc/spapr_hcall.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dc..7279583a4d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,9 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /* Set common MachineState->fdt */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..e6b960577d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,9 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /* Set common MachineState->fdt */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.36.1


