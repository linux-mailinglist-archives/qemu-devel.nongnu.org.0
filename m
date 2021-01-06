Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CB2EB89C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:46:51 +0100 (CET)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzmc-0007EH-1F
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzet-0005tJ-7e; Tue, 05 Jan 2021 22:38:51 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56979 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0006MA-67; Tue, 05 Jan 2021 22:38:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpH3yyBz9sWR; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904311;
 bh=ccY8CvOgItvQ1W8BmBilO/Xmtaex2xqod37I6ii+0gs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AvNXQUS+KU9M0Y+mXPqmRTpM3UZKTmpVNIMvIlQAg6F201e3S+nx8NXEHaNCPEStl
 ajJDMKnVexYSUtHzcQ2c5/x6NCsg81QqNbYyqsJs4AJba7jnQMNaNzwLp6+MghD3aT
 IM4Xo1Kssx+RECSJryC56/OGAYmH3j6BQo5tnLOc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/22] spapr: Add drc_ prefix to the DRC realize and unrealize
 functions
Date: Wed,  6 Jan 2021 14:38:08 +1100
Message-Id: <20210106033816.232598-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Use a less generic name for an easier experience with tools such as
cscope or grep.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201218103400.689660-6-groug@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a4d2608017..8571d5bafe 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -503,7 +503,7 @@ static const VMStateDescription vmstate_spapr_drc = {
     }
 };
 
-static void realize(DeviceState *d, Error **errp)
+static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
     Object *root_container;
@@ -530,7 +530,7 @@ static void realize(DeviceState *d, Error **errp)
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
 }
 
-static void unrealize(DeviceState *d)
+static void drc_unrealize(DeviceState *d)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
     Object *root_container;
@@ -579,8 +579,8 @@ static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
 {
     DeviceClass *dk = DEVICE_CLASS(k);
 
-    dk->realize = realize;
-    dk->unrealize = unrealize;
+    dk->realize = drc_realize;
+    dk->unrealize = drc_unrealize;
     /*
      * Reason: DR connector needs to be wired to either the machine or to a
      * PHB in spapr_dr_connector_new().
@@ -628,7 +628,7 @@ static void realize_physical(DeviceState *d, Error **errp)
     SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
     Error *local_err = NULL;
 
-    realize(d, &local_err);
+    drc_realize(d, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -644,7 +644,7 @@ static void unrealize_physical(DeviceState *d)
 {
     SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
 
-    unrealize(d);
+    drc_unrealize(d);
     vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp);
     qemu_unregister_reset(drc_physical_reset, drcp);
 }
-- 
2.29.2


