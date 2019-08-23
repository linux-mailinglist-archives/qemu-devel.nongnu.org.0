Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A79A713
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 07:28:34 +0200 (CEST)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i127i-00040T-UA
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 01:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rO-0004Fl-KT
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 01:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rN-0002g1-Co
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 01:11:38 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11rN-0002fK-7g; Fri, 23 Aug 2019 01:11:37 -0400
Received: by mail-pl1-x643.google.com with SMTP id m9so4865882pls.8;
 Thu, 22 Aug 2019 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=vFL9pFsIs9sJrXtRvVXkU9BHVYq9aXFolVuGiEq9k4M=;
 b=e0erAWMbHCznFH3czaDm0aAmVivyMu8XfPXOx6h78szbcXhX25qzS8wH88CuaAGjGQ
 aTDMx1nZKA571ZDWyQnOW/pxmAghpmV5qTIzwUHIBZnHFpxx2cuNrTUG3cYzbw6oczqH
 Lf1PkKm7v5JsqHGRzRtMm5GNr1KOIIuiazW2y2t6mgEUE+nNsRpGn9JKYeKhpTJTAu+H
 vRJDreUb+H80DQSchmQG89Cw7UBjtA4zjgXPOj8Ham5EYUg134jL2M+9vUUHKBQV3oBP
 Qs63HHjLYFropwHOCC+MhzpgbmF22hOg0p3Y3QzNVBPCRFnITNX4hAdtmc61hgp2IBX0
 +/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=vFL9pFsIs9sJrXtRvVXkU9BHVYq9aXFolVuGiEq9k4M=;
 b=SEgHxAfc9x5E6P//7ghZlihUdyo0jeOr8tm5q9hv5Ya8qfWKwNkO3fqm3eAYlo1d1E
 /XC5xRtMn54mEdsEsNGOPnA/SsEN6sYBR0pZFu+WDTJ4I7uCxBtUaI+LIfb28iE+fm41
 rzLsjPWlErhEDfYthmfO8o8KBTeN7YyI55Io5ESry0WsLtLeHeJwoJuSzBh421nmDDEQ
 L/FtUq3fT+4kai/PuXS3pASP6ZExHlQMotAcU8Hjn+TfyHzrR+aSNLG2Be6d+iX3IsZJ
 vHm/NIp5XKaek3kJYTqK4EkCyb9ysgV/tx3DirQB2k9GuWHhjyWGKLlkc99SE2tqfZCR
 vPoQ==
X-Gm-Message-State: APjAAAXuDgCB291viRjRX5OYBOaDmM2wOGtv8O3Wahr1qldqdpOf4o2Q
 t/J241ROhTUgfckqO8ckX0I=
X-Google-Smtp-Source: APXvYqzC3D4xt5WQnMwAOOiiKT1Qgh44vUyHv+6dphJVRJjG6AOMFNSM0fnxt0HZfOMiN1ecypAP0A==
X-Received: by 2002:a17:902:7083:: with SMTP id
 z3mr2624347plk.87.1566537096455; 
 Thu, 22 Aug 2019 22:11:36 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.35
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:10:57 -0700
Message-Id: <1566537069-22741-19-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v5 18/30] riscv: sifive_u: Update PLIC hart
 topology configuration string
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With heterogeneous harts config, the PLIC hart topology configuration
string are "M,MS,.." because of the monitor hart #0.

Suggested-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a36cd77..284f7a5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -433,10 +433,11 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     plic_hart_config = g_malloc0(plic_hart_config_len);
     for (i = 0; i < ms->smp.cpus; i++) {
         if (i != 0) {
-            strncat(plic_hart_config, ",", plic_hart_config_len);
+            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
+                    plic_hart_config_len);
+        } else {
+            strncat(plic_hart_config, "M", plic_hart_config_len);
         }
-        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
-                plic_hart_config_len);
         plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
     }
 
-- 
2.7.4


