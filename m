Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4F674D94
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlPF-00009X-IQ; Fri, 20 Jan 2023 02:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlP3-00005W-1x
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlP0-0005HU-MI
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674198090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raDGazesJJrxICRdUMjyxwbjzL/EAnZZKbjCdkAAc1Q=;
 b=HhvUfJO3AjSzc00zFd3WBs1jwESTW5HUKp2X8rtY9WCZ0iL6vaYZragZtVw5Nzfj8pz0/5
 hNWzutL6IT9l0Teh6Ow+Hlq5elKvrv3bPRW53LDhpOI6fboAYGdy7538jtox83TBIM4HD0
 Go0hySvf/T3bD3S002iiqxLj4hrwGVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-fD7JdoAHMjSe14jlohs46A-1; Fri, 20 Jan 2023 02:01:25 -0500
X-MC-Unique: fD7JdoAHMjSe14jlohs46A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E302100F904;
 Fri, 20 Jan 2023 07:01:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6DCA53AA;
 Fri, 20 Jan 2023 07:01:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9A77A21E6606; Fri, 20 Jan 2023 08:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 10/12] include/hw/ppc: Supply a few missing includes
Date: Fri, 20 Jan 2023 08:01:20 +0100
Message-Id: <20230120070122.3982588-11-armbru@redhat.com>
In-Reply-To: <20230120070122.3982588-1-armbru@redhat.com>
References: <20230120070122.3982588-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

A few headers neglect to include headers they need.  They compile only
if something else includes the required header(s) first.  Fix that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221222104628.659681-3-armbru@redhat.com>
---
 include/hw/ppc/pnv_lpc.h    | 3 ++-
 include/hw/ppc/pnv_occ.h    | 3 ++-
 include/hw/ppc/pnv_pnor.h   | 2 +-
 include/hw/ppc/pnv_sbe.h    | 3 ++-
 include/hw/ppc/pnv_xscom.h  | 3 ++-
 include/hw/ppc/xive2.h      | 2 ++
 include/hw/ppc/xive2_regs.h | 2 ++
 7 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index 8a8d1a3d42..001eee27d7 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -20,7 +20,8 @@
 #ifndef PPC_PNV_LPC_H
 #define PPC_PNV_LPC_H
 
-#include "qom/object.h"
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_PNV_LPC "pnv-lpc"
 typedef struct PnvLpcClass PnvLpcClass;
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index 90a81dae2b..df321244e3 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -20,7 +20,8 @@
 #ifndef PPC_PNV_OCC_H
 #define PPC_PNV_OCC_H
 
-#include "qom/object.h"
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_PNV_OCC "pnv-occ"
 OBJECT_DECLARE_TYPE(PnvOCC, PnvOCCClass,
diff --git a/include/hw/ppc/pnv_pnor.h b/include/hw/ppc/pnv_pnor.h
index bab2f79844..2e37ac88bf 100644
--- a/include/hw/ppc/pnv_pnor.h
+++ b/include/hw/ppc/pnv_pnor.h
@@ -10,7 +10,7 @@
 #ifndef PPC_PNV_PNOR_H
 #define PPC_PNV_PNOR_H
 
-#include "qom/object.h"
+#include "hw/sysbus.h"
 
 /*
  * PNOR offset on the LPC FW address space
diff --git a/include/hw/ppc/pnv_sbe.h b/include/hw/ppc/pnv_sbe.h
index f54a3ae9ba..b6b378ad14 100644
--- a/include/hw/ppc/pnv_sbe.h
+++ b/include/hw/ppc/pnv_sbe.h
@@ -20,7 +20,8 @@
 #ifndef PPC_PNV_SBE_H
 #define PPC_PNV_SBE_H
 
-#include "qom/object.h"
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_PNV_SBE "pnv-sbe"
 OBJECT_DECLARE_TYPE(PnvSBE, PnvSBEClass, PNV_SBE)
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index c6e9ef8dd2..cbe848d27b 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -20,7 +20,8 @@
 #ifndef PPC_PNV_XSCOM_H
 #define PPC_PNV_XSCOM_H
 
-#include "qom/object.h"
+#include "exec/memory.h"
+#include "hw/ppc/pnv.h"
 
 typedef struct PnvXScomInterface PnvXScomInterface;
 
diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index e9e3ea135e..ab68f8d157 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -11,7 +11,9 @@
 #ifndef PPC_XIVE2_H
 #define PPC_XIVE2_H
 
+#include "hw/ppc/xive.h"
 #include "hw/ppc/xive2_regs.h"
+#include "hw/sysbus.h"
 
 /*
  * XIVE2 Router (POWER10)
diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
index 14605bd458..b7adbdb7b9 100644
--- a/include/hw/ppc/xive2_regs.h
+++ b/include/hw/ppc/xive2_regs.h
@@ -10,6 +10,8 @@
 #ifndef PPC_XIVE2_REGS_H
 #define PPC_XIVE2_REGS_H
 
+#include "cpu.h"
+
 /*
  * Thread Interrupt Management Area (TIMA)
  *
-- 
2.39.0


