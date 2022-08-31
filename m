Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F95A86C4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:31:56 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTRK-0000Kz-9x
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSog-0003X0-J9; Wed, 31 Aug 2022 14:51:58 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoe-00085P-Th; Wed, 31 Aug 2022 14:51:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11f11d932a8so17875489fac.3; 
 Wed, 31 Aug 2022 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UD+YcWwFSZAkHPxgHtReB8PM0eoipWIZiEpsG0svSi8=;
 b=BF2SODjxWIEN3ymtl/GEBfFKuu75fbQ75Cg2Kl3UZwRLP10G1E85GlDFpSyCF1G/TX
 RAJIV31ms0Q6FUlnxhvJr+z+NjXXIktmJf1EWKs5AA6mPxEre9sFgRzYG2XhwCEHe5Ry
 VzltNw5BmfNduWUv/ZPwdwuHmsZqZHnxOlBdsThhsWb4ar+dLLH9gEHpBvdlEB6Xamiy
 XZ6/0XZWs8JuMtMPELygNMy4bLkkEBvyhPNfbKnC5ydfPROBIKYiWcqaVYSxWTCBbvLt
 P/Z+mTr3AkODBSvFdGZ39IHBeNoiUu1XWFf1MIQTSjqQF6Zcms688N9JHkLKa26qhdI5
 M/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UD+YcWwFSZAkHPxgHtReB8PM0eoipWIZiEpsG0svSi8=;
 b=6e8RSC6J5qnQdGmLLqbRXQdlAYsIe8Lpf1R3CMb1nDT2dDyeploLS64f+i4q/J5yDb
 K7Ic2MqnDUFKi1r8JejaE7TIEQnxtZQ8IZxnx40tWyKrH0OCQSZJRjiKxmUv2wnp7Jb/
 0wveWgtx5tq1NeCs1oK+abwCCmYIfsYm8qyMi+R5WfLbLjROU2GCM3FgiVggZifrG0Tk
 WMKcf4FgU4GRevX+BTT6/aZRaJzkt+4BcoGCsSDgY4KjBAOppU0ihOoAtXZhuLfPL3Y1
 LCY619ciUa5dSHAUJKoHPaJixlrjCkViFsBpm0rluo9a7YMADJ9dySFXQ0RZzbKdoup1
 CIyA==
X-Gm-Message-State: ACgBeo2YgXBiRp/Yp+AmBzsrmXRAnG9i1UxvcOb+mA87vM04LdqsOU+d
 bz0v4bTnYSPd6PUbW0Bph+um4bbMpdU=
X-Google-Smtp-Source: AA6agR7RdhwEaBAR4gCwEU4kH6+DD39iz/Pwh58E5RWWohXLxYSMLb5GUAG1dusPsnSB/qJXyW2i5w==
X-Received: by 2002:a05:6808:170b:b0:333:53cf:8022 with SMTP id
 bc11-20020a056808170b00b0033353cf8022mr1914002oib.28.1661971914208; 
 Wed, 31 Aug 2022 11:51:54 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 25/60] ppc/pnv: enable user created pnv-phb for powernv9
Date: Wed, 31 Aug 2022 15:49:59 -0300
Message-Id: <20220831185034.23240-26-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
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

Enable pnv-phb user created devices for powernv9 now that we have
everything in place.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-9-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c      | 2 +-
 hw/pci-host/pnv_phb4_pec.c | 6 ++++--
 hw/ppc/pnv.c               | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 1f53ff77c5..17d9960aa1 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -167,7 +167,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    if (phb->version == 3 && !defaults_enabled()) {
+    if (!defaults_enabled()) {
         return;
     }
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8dc363d69c..9871f462cd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     pec->num_phbs = pecc->num_phbs[pec->index];
 
     /* Create PHBs if running with defaults */
-    for (i = 0; i < pec->num_phbs; i++) {
-        pnv_pec_default_phb_realize(pec, i, errp);
+    if (defaults_enabled()) {
+        for (i = 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
+        }
     }
 
     /* Initialize the XSCOM regions for the PEC registers */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c34967cac7..f45f02be4c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2213,6 +2213,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.37.2


