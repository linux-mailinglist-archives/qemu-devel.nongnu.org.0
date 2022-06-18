Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6E550429
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:10:33 +0200 (CEST)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WLY-00038X-BX
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDm-0007tO-MZ; Sat, 18 Jun 2022 07:02:32 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDk-0005gW-1U; Sat, 18 Jun 2022 07:02:29 -0400
Received: by mail-oi1-x229.google.com with SMTP id bd16so8236612oib.6;
 Sat, 18 Jun 2022 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rXwjJGXcPESLvRIXnVLod9H2G4CRNeUbQSJslaYlxL4=;
 b=glAIxkjprV3UXmAGsQSeFhxgUw0tHXewKiepAlDapyCXK2G7ikURTG4LCPVH8srCJH
 FwWfU3NmMpAZHh8VwhAwsidJwD3pO5MOnvGhf6kEwKS4N16trj191wCibjXv4tAqK1Fh
 l4Q2yxRQyivqLVuExuuDIIYN+mQTApustyaawcVcpAIMNGO9euLs2wSQJRLYQ5LZIpk3
 Hiy1cNEgmcCiVOS+FkEmS7mfDH/tDuu+iM2xZpjuAwj6ESZstjUZHlWbkPc/fDBXgaPk
 5PqTFG1kx+pulkkQhQAoNoiDBuCQAibFbWuOl63QsJMnqCw8vZs3yuJju83sVzoSUw1d
 PjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXwjJGXcPESLvRIXnVLod9H2G4CRNeUbQSJslaYlxL4=;
 b=D7Yz/IVSBK3kLLWCXq9Fbso+FYATnpiw1olQi6gc++kXukorRIXFMa1MLJqDhzRUmU
 acdp8dzriBBWCZ8TZ7kbIKRXzmfw91fvmIQ/hkyqHZbPsoxyzkfLPjofXHGfcB8glh82
 DUcPHwrv+yvym+oYwI7RykD8z0LfPZZj17vCe6w2kpwg5BwdH8mRzDeIKuLjc53/ytF3
 ZsddKrvLB25RQxj/YACcjMabUTFmLlhqpqYEs8UYyXezV1tjQcjUs48qiiP0md3dHDZm
 zSa528gKYrdFmeQm0UxjQtN2Iqjj1d8/6rVYegb0xn+yY0/OiyWKBrbkRSEVIq9bQkD/
 Qa/A==
X-Gm-Message-State: AOAM5320yH4Nuxn/9pzGCuuTDz1ogvLzsKtClJWG5MB7gDzvU6bzDF01
 uwheA/h3BPCCN5ytZ0naeS+s8f0xDvE=
X-Google-Smtp-Source: ABdhPJwgAfAWpu3psLDYywxtI9hOESIWYbdQFTrNpsqbuY049YXcByEVCBHFhoK3vL4V+MVFShF7Fg==
X-Received: by 2002:a05:6808:209e:b0:32f:32c0:7ada with SMTP id
 s30-20020a056808209e00b0032f32c07adamr12317728oiw.53.1655550146589; 
 Sat, 18 Jun 2022 04:02:26 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 8/9] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root
 bus
Date: Sat, 18 Jun 2022 08:02:01 -0300
Message-Id: <20220618110202.87735-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 8c03cc94f2..696c9bef26 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1129,10 +1129,6 @@ static const TypeInfo pnv_phb3_root_bus_info = {
     .name = TYPE_PNV_PHB3_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
     .class_init = pnv_phb3_root_bus_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
-    },
 };
 
 static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
-- 
2.36.1


