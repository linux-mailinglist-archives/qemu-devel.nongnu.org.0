Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D0653E7E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:47:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8J6V-00022n-Cs; Thu, 22 Dec 2022 05:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8J5y-0001yQ-0U
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8J5w-0006Vv-8i
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671705995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Adl+F+A0qAaR4bIeOcgKgoRxmae14L3+AEKQpbTF9eo=;
 b=QfvrNSOB1IZ4fXkTZmYKsD6aLDZcgM5SXJwLsdiIfbLWDpOwHS4qf8shPwHMMiENYrxVa/
 9Z74suqUvlu9Eu+DPSPRN9KKrjIT/dFQF/3ip862nJj/s2KVD7L8VqtBRs221eRjIzK8hz
 qNGIzQ3cUGEjwYq7d4MygBNTDAHzsoE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-b4LsI81XO6-4AojzEcJChQ-1; Thu, 22 Dec 2022 05:46:30 -0500
X-MC-Unique: b4LsI81XO6-4AojzEcJChQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA1BF381796D;
 Thu, 22 Dec 2022 10:46:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94BE8C16028;
 Thu, 22 Dec 2022 10:46:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DA9E21E6928; Thu, 22 Dec 2022 11:46:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, qemu-ppc@nongnu.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 2/4] include/hw/ppc: Supply a few missing includes
Date: Thu, 22 Dec 2022 11:46:26 +0100
Message-Id: <20221222104628.659681-3-armbru@redhat.com>
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

A few headers neglect to include headers they need.  They compile only
if something else includes the required header(s) first.  Fix that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
2.38.1


