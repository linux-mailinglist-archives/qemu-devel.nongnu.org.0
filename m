Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAAC2DE12F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:40:23 +0100 (CET)
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDBO-0008Ai-9h
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5Z-0000ta-9u
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:21 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5V-00020Q-Jr
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:21 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-CWDrG8YIPFSicWchJJz8OQ-1; Fri, 18 Dec 2020 05:34:11 -0500
X-MC-Unique: CWDrG8YIPFSicWchJJz8OQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED1983DBC7;
 Fri, 18 Dec 2020 10:34:10 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAECB60BE5;
 Fri, 18 Dec 2020 10:34:08 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] spapr: Add drc_ prefix to the DRC realize and unrealize
 functions
Date: Fri, 18 Dec 2020 11:33:59 +0100
Message-Id: <20201218103400.689660-6-groug@kaod.org>
In-Reply-To: <20201218103400.689660-1-groug@kaod.org>
References: <20201218103400.689660-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a less generic name for an easier experience with tools such as
cscope or grep.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_drc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a4d2608017c5..8571d5bafe4e 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -503,7 +503,7 @@ static const VMStateDescription vmstate_spapr_drc =3D {
     }
 };
=20
-static void realize(DeviceState *d, Error **errp)
+static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
     Object *root_container;
@@ -530,7 +530,7 @@ static void realize(DeviceState *d, Error **errp)
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
 }
=20
-static void unrealize(DeviceState *d)
+static void drc_unrealize(DeviceState *d)
 {
     SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
     Object *root_container;
@@ -579,8 +579,8 @@ static void spapr_dr_connector_class_init(ObjectClass *=
k, void *data)
 {
     DeviceClass *dk =3D DEVICE_CLASS(k);
=20
-    dk->realize =3D realize;
-    dk->unrealize =3D unrealize;
+    dk->realize =3D drc_realize;
+    dk->unrealize =3D drc_unrealize;
     /*
      * Reason: DR connector needs to be wired to either the machine or to =
a
      * PHB in spapr_dr_connector_new().
@@ -628,7 +628,7 @@ static void realize_physical(DeviceState *d, Error **er=
rp)
     SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
     Error *local_err =3D NULL;
=20
-    realize(d, &local_err);
+    drc_realize(d, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -644,7 +644,7 @@ static void unrealize_physical(DeviceState *d)
 {
     SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
=20
-    unrealize(d);
+    drc_unrealize(d);
     vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp=
);
     qemu_unregister_reset(drc_physical_reset, drcp);
 }
--=20
2.26.2


