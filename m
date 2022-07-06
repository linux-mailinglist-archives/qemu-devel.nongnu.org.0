Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BE56938D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:48:07 +0200 (CEST)
Received: from localhost ([::1]:55284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BwL-0007FC-QG
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLf-0000P1-HW; Wed, 06 Jul 2022 16:10:12 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLc-0003TO-FP; Wed, 06 Jul 2022 16:10:10 -0400
Received: by mail-vs1-xe32.google.com with SMTP id f68so1379641vsc.11;
 Wed, 06 Jul 2022 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2acgNGda3fkPEVBXtc7fjEnsoNYIvirM0G4HvLGRSA=;
 b=TzaFPJXwCOF4122hjfg0JScv1aAcKgWTUg+5rU8S+3suF+MIriNncJ0Iekexs5Q8/U
 Ev0V3gpcKRx1c2xwkescNP2KskpBD1tQCoY+Qlu4jPe1yC3SaN8rFoEu2dq6Pomh39dK
 mW+CuSyAHrj/nrcqNLLHF1j33LKPJebt9KC/ilsIPeVKfOjDIVFNqQjJ7NjIWuLJtc19
 hTsgCVOOD3daQqZBcBZkw4/km4yjkkhF/WMh6ETkUUGLXRVmIpLw+5Cbkiu+ne1W0Jlx
 WSq16lFqBtkupIJrV04OfbAmQsr1suLE0j6nz4IFcjSzsWz3aN6Tw3wy0bEZqyUkj5Vr
 Mt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2acgNGda3fkPEVBXtc7fjEnsoNYIvirM0G4HvLGRSA=;
 b=LZ0bHGZVUEpVqtqnd9blcHgDdee0KscoWXd9k0d+19ecT24bm9ja0RAEwr2e70URFh
 nqhRiiIrL0UC/BGlM0LwONC3jFd0p6PLEO7PPECrFls62ylKv6u3TwvY4lf3bScuyuQf
 yw+0CcxuzuivnQ46z/UAoQvChQ4eKSTd3qp4mBDYjTvR9fqL3NTpep9NuwEG+zjhma06
 BOIt1S4zIYWzMD9epzGd7K5DHvgg/YYTdlzfcqOiTEiorIPrj3mKa7XKud2sqZ0OXULR
 o77zF+XOb3N10h4eJxdtfDIvzjgrj5fH+8vwcbadAccaEwFGPf0zGXTPvUi2Lz+qWdCp
 6Kjw==
X-Gm-Message-State: AJIora9vvrazIQHKEKCTiuecm5icxM0aZ4yEvoHE8BJOOK9Kt7Gpk20g
 oy2GA3xr43wGHkKeSOBi9lSWO0xZtPs=
X-Google-Smtp-Source: AGRyM1uMoUniBiefU8jc8K6WFCbX6O+aaB0B91S0cBUICO2oV/lJ9tLXb9LdVhLfe8GJOKP+n1rH6w==
X-Received: by 2002:a67:d311:0:b0:354:5e86:53f9 with SMTP id
 a17-20020a67d311000000b003545e8653f9mr23923606vsj.27.1657138206479; 
 Wed, 06 Jul 2022 13:10:06 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 08/34] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root
 bus
Date: Wed,  6 Jul 2022 17:09:20 -0300
Message-Id: <20220706200946.471114-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe32.google.com
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

It's unneeded. No other PCIE_BUS implements this interface.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220621173436.165912-9-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 725b3d740b..d225ab5b0f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1752,10 +1752,6 @@ static const TypeInfo pnv_phb4_root_bus_info = {
     .name = TYPE_PNV_PHB4_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
     .class_init = pnv_phb4_root_bus_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
-    },
 };
 
 static void pnv_phb4_root_port_reset(DeviceState *dev)
-- 
2.36.1


