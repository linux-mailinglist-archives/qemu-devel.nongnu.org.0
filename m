Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC5674D9E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlPH-0000Bd-7l; Fri, 20 Jan 2023 02:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlP0-0008VJ-PX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOy-0005Gg-SS
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674198088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKXtZsO8lnptTaaBCHlOkSzR3qu9Uu3BLJo2fZPDBlk=;
 b=bLl8GCm6ED2zb52lxfKta47FAXt3IgLNe+khf8A0UsuQKaLUQ083yP+lf0vIkAjhSeh7DX
 8p1AV6iEO8t8My4o3DIEIbe7dOrhfGc83t8NmPYelBQoRfpGv0BCqxguzOchaN/1PAwwsH
 5kbmzKoB2FPp61DWq6DAYuskKW1etow=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-F8V4-s62Oki-vjQXyp2L_Q-1; Fri, 20 Jan 2023 02:01:25 -0500
X-MC-Unique: F8V4-s62Oki-vjQXyp2L_Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C50E1C068C7;
 Fri, 20 Jan 2023 07:01:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D31492C3E;
 Fri, 20 Jan 2023 07:01:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9EE8021E6609; Fri, 20 Jan 2023 08:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 12/12] include/hw/ppc include/hw/pci-host: Drop extra typedefs
Date: Fri, 20 Jan 2023 08:01:22 +0100
Message-Id: <20230120070122.3982588-13-armbru@redhat.com>
In-Reply-To: <20230120070122.3982588-1-armbru@redhat.com>
References: <20230120070122.3982588-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PnvChip is typedef'ed in five places, and PnvPhb4PecState in two.
Keep one, drop the others.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221222104628.659681-5-armbru@redhat.com>
---
 hw/pci-host/pnv_phb.h          | 2 +-
 include/hw/pci-host/pnv_phb3.h | 1 -
 include/hw/pci-host/pnv_phb4.h | 2 --
 include/hw/ppc/pnv_core.h      | 3 +--
 include/hw/ppc/pnv_homer.h     | 2 +-
 include/hw/ppc/pnv_lpc.h       | 8 ++------
 include/hw/ppc/pnv_xive.h      | 7 +++----
 7 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
index 58ebd6dd0f..eb429d529f 100644
--- a/hw/pci-host/pnv_phb.h
+++ b/hw/pci-host/pnv_phb.h
@@ -12,9 +12,9 @@
 
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/ppc/pnv.h"
 #include "qom/object.h"
 
-typedef struct PnvChip PnvChip;
 typedef struct PnvPhb4PecState PnvPhb4PecState;
 
 struct PnvPHB {
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index f791ebda9b..d62b3091ac 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -15,7 +15,6 @@
 #include "hw/pci-host/pnv_phb.h"
 
 typedef struct PnvPHB3 PnvPHB3;
-typedef struct PnvChip PnvChip;
 
 /*
  * PHB3 XICS Source for MSIs
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index b4f2b29fb5..1f3237c9d5 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -16,10 +16,8 @@
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
-typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
-typedef struct PnvChip PnvChip;
 
 /*
  * We have one such address space wrapper per possible device under
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index c22eab2e1f..3d75706e95 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -22,14 +22,13 @@
 
 #include "hw/cpu/core.h"
 #include "target/ppc/cpu.h"
+#include "hw/ppc/pnv.h"
 #include "qom/object.h"
 
 #define TYPE_PNV_CORE "powernv-cpu-core"
 OBJECT_DECLARE_TYPE(PnvCore, PnvCoreClass,
                     PNV_CORE)
 
-typedef struct PnvChip PnvChip;
-
 struct PnvCore {
     /*< private >*/
     CPUCore parent_obj;
diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
index 07e8b19311..b1c5d498dc 100644
--- a/include/hw/ppc/pnv_homer.h
+++ b/include/hw/ppc/pnv_homer.h
@@ -39,7 +39,7 @@ DECLARE_INSTANCE_CHECKER(PnvHomer, PNV10_HOMER,
 struct PnvHomer {
     DeviceState parent;
 
-    struct PnvChip *chip;
+    PnvChip *chip;
     MemoryRegion pba_regs;
     MemoryRegion regs;
 };
diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index 001eee27d7..5d22c45570 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -21,6 +21,7 @@
 #define PPC_PNV_LPC_H
 
 #include "exec/memory.h"
+#include "hw/ppc/pnv.h"
 #include "hw/qdev-core.h"
 
 #define TYPE_PNV_LPC "pnv-lpc"
@@ -93,13 +94,8 @@ struct PnvLpcClass {
     DeviceRealize parent_realize;
 };
 
-/*
- * Old compilers error on typdef forward declarations. Keep them happy.
- */
-struct PnvChip;
-
 ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp);
-int pnv_dt_lpc(struct PnvChip *chip, void *fdt, int root_offset,
+int pnv_dt_lpc(PnvChip *chip, void *fdt, int root_offset,
                uint64_t lpcm_addr, uint64_t lpcm_size);
 
 #endif /* PPC_PNV_LPC_H */
diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index b5d91505e5..9c48430ee4 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -10,12 +10,11 @@
 #ifndef PPC_PNV_XIVE_H
 #define PPC_PNV_XIVE_H
 
+#include "hw/ppc/pnv.h"
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 #include "hw/ppc/xive2.h"
 
-struct PnvChip;
-
 #define TYPE_PNV_XIVE "pnv-xive"
 OBJECT_DECLARE_TYPE(PnvXive, PnvXiveClass,
                     PNV_XIVE)
@@ -31,7 +30,7 @@ struct PnvXive {
     XiveRouter    parent_obj;
 
     /* Owning chip */
-    struct PnvChip *chip;
+    PnvChip *chip;
 
     /* XSCOM addresses giving access to the controller registers */
     MemoryRegion  xscom_regs;
@@ -106,7 +105,7 @@ typedef struct PnvXive2 {
     Xive2Router   parent_obj;
 
     /* Owning chip */
-    struct PnvChip *chip;
+    PnvChip *chip;
 
     /* XSCOM addresses giving access to the controller registers */
     MemoryRegion  xscom_regs;
-- 
2.39.0


