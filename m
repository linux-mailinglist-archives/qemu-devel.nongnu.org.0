Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2AB58A907
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:52:32 +0200 (CEST)
Received: from localhost ([::1]:52246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu0M-0005fl-Bp
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoU-0007Xr-B5; Fri, 05 Aug 2022 05:40:15 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoS-0001eQ-Ej; Fri, 05 Aug 2022 05:40:13 -0400
Received: by mail-ua1-x92d.google.com with SMTP id s18so825542uac.10;
 Fri, 05 Aug 2022 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xCNzvMXtNX/QLiNlFzE7CA2H9EDZfC8tHBQyniqpW7A=;
 b=ONyDcfn47E4XJAe+TJpkIQcdC+CX8ED3DplYNRzjeb178qGK2fL90LY3U/QYeLyqqJ
 QPe62+qHkAvo47QLx+kLWxP2YZLdPN39mUo9QGtQs6ky683UvD3PUgWX/vQFQfMgPOWM
 wvueNaoSy0RUO8kb893ClKC6hCtJQwxxJ6kntpmIalqFH149LUXidoUBPf/6J/yCzSDj
 ZGKXvYbNIYLCy+OhSGOCLYOv2vqc/ZV/t/xJgafnc81FlFY0d3g0BhphDhlQVfcbfvYC
 vzROn836lwieuTpmStG3hMMaCx7v2P4cGNCcAz4O370v2fbCagWd0NdrPNqPT7M9tn/d
 c1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xCNzvMXtNX/QLiNlFzE7CA2H9EDZfC8tHBQyniqpW7A=;
 b=JaRggg4oMitXOqWDFKL3XsWZOAlXJMnyYPA0sho6EDzlrN2Mx63AJCgnIbcaapwe34
 r+Eu2WsoeUgQpTFzporXJpWLb9aR1dKdtnUvwqG+Ji81COmldPRAMt5KM6rd/4lzNpnp
 4lPxa5OYh87/yrcM4bHN19DuUz/Nlfz0m83+jIw2LEHiTWxMYmLJJchypActY42wbqCA
 eiwF4ty1Aw9gyIrQVLbyN+CT0Ahbj9ns9bWYj8ny3A2iTe01DhV4gaYGA2fieSr+LsOp
 1G4QKZNM3oqKprAcJhq8Bc959O3ovZ4fDnipLgvYE8lou00i+7GJKOHjdIyXDANzKCTa
 99CA==
X-Gm-Message-State: ACgBeo3+7bNN0OVEuPcZG/vXt5PGpPjbuB+Kva01keykIlNa6euwk3vv
 jwkm9Jv1tnL2qrMPZL58BmGnF/L8wbc=
X-Google-Smtp-Source: AA6agR6tJRD+ixW0eoqZMKusY5K2zO2teKMgiXRItbr2ezdwLT76DlaMVUWMiZfBV+A/xjQuPIen+w==
X-Received: by 2002:ab0:69c5:0:b0:383:4295:fc9d with SMTP id
 u5-20020ab069c5000000b003834295fc9dmr2678166uaq.92.1659692410566; 
 Fri, 05 Aug 2022 02:40:10 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org
Subject: [PATCH for-7.2 v2 08/20] hw/ppc: set machine->fdt in
 pegasos2_machine_reset()
Date: Fri,  5 Aug 2022 06:39:36 -0300
Message-Id: <20220805093948.82561-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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

We'll introduce QMP/HMP commands that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..8a6c6e4b7d 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,15 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' and 'info fdt' commands. Use fdt_pack()
+     * to shrink the blob size we're going to store.
+     */
+    fdt_pack(fdt);
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.36.1


