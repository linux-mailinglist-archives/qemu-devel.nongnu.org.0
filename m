Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182C653EAA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:04:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8J66-00022m-PK; Thu, 22 Dec 2022 05:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8J5y-0001z9-IM
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8J5w-0006W1-Gx
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671705995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eQLfQFQMhQ5zSoxUg1UGyK8M8YAe4yXwOHmWN94or0=;
 b=V5xkHvzkXGYz2SlcoQ8Qt9ea9h2kRiXevl/bhu3DgREkBPSvCwmiT4RVG1YHQdKKhQ5LAZ
 FwtZNDEi8q8Xwxt7ngK2LcByMghK23YW4KbUr/ggfeXi+CkBIFkrigMM3sJGryqENcQ5U2
 UOkbSFzKaiNcTr1ZMD4N1fBZF3dYk7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-q1S8TswdOvuaNJe6XL9OQA-1; Thu, 22 Dec 2022 05:46:30 -0500
X-MC-Unique: q1S8TswdOvuaNJe6XL9OQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAAEC101A521;
 Thu, 22 Dec 2022 10:46:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F97C16029;
 Thu, 22 Dec 2022 10:46:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7043821E6931; Thu, 22 Dec 2022 11:46:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, qemu-ppc@nongnu.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 3/4] include/hw/ppc: Don't include hw/pci-host/pnv_phb.h
 from pnv.h
Date: Thu, 22 Dec 2022 11:46:27 +0100
Message-Id: <20221222104628.659681-4-armbru@redhat.com>
In-Reply-To: <20221222104628.659681-1-armbru@redhat.com>
References: <20221222104628.659681-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The next commit needs to include hw/ppc/pnv.h from
hw/pci-host/pnv_phb.h.  Avoid an inclusion loop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 3 ++-
 include/hw/ppc/pnv.h           | 3 ++-
 hw/ppc/pnv_psi.c               | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index d9cea3f952..b4f2b29fb5 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -10,14 +10,15 @@
 #ifndef PCI_HOST_PNV_PHB4_H
 #define PCI_HOST_PNV_PHB4_H
 
+#include "hw/pci-host/pnv_phb.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/ppc/pnv.h"
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
 typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
-typedef struct PnvPHB PnvPHB;
 typedef struct PnvChip PnvChip;
 
 /*
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index ca49e4281d..96fb850419 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -25,7 +25,6 @@
 #include "hw/sysbus.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/ppc/pnv_pnor.h"
-#include "hw/pci-host/pnv_phb.h"
 
 #define TYPE_PNV_CHIP "pnv-chip"
 
@@ -59,6 +58,8 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 
+typedef struct PnvPHB PnvPHB;
+
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
 typedef struct PnvMachineState PnvMachineState;
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 98045ed3d2..8aa09ab26b 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/address-spaces.h"
 #include "hw/irq.h"
 #include "target/ppc/cpu.h"
 #include "qemu/log.h"
-- 
2.38.1


