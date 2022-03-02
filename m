Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B74CA4BF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:23:40 +0100 (CET)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO15-0001gv-Gs
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrL-0001Yb-PQ; Wed, 02 Mar 2022 06:09:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64536
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrI-0001wX-QG; Wed, 02 Mar 2022 06:09:31 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Am02U002083; 
 Wed, 2 Mar 2022 11:09:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570f87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:05 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222Anioi006188;
 Wed, 2 Mar 2022 11:09:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570f70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2b7r011446;
 Wed, 2 Mar 2022 11:09:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222Aw5ow48824700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 10:58:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC725AE05D;
 Wed,  2 Mar 2022 11:09:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AACBAE051;
 Wed,  2 Mar 2022 11:09:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:09:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C18CD220294;
 Wed,  2 Mar 2022 12:08:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 79/87] hw/ppc/spapr_drc.c: use g_auto in spapr_dt_drc()
Date: Wed,  2 Mar 2022 12:07:55 +0100
Message-Id: <20220302110803.849505-80-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P2p0zj7k4Gopv84rqXRtBK9Y24xJJFcF
X-Proofpoint-ORIG-GUID: lj332M_OTklnn18nbtv3xkByrpMRG2fn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=645 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Use g_autoptr() with GArray* and GString* pointers to avoid calling
g_free() and the need for the 'out' label.

'drc_name' can also be g_autofreed to avoid a g_free() call at the end
of the while() loop.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220228175004.8862-7-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_drc.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index f8ac0a10df18..0ba84063aa26 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -841,8 +841,14 @@ int spapr_dt_drc(void *fdt, int offset, Object *owne=
r, uint32_t drc_type_mask)
     ObjectProperty *prop;
     ObjectPropertyIterator iter;
     uint32_t drc_count =3D 0;
-    GArray *drc_indexes, *drc_power_domains;
-    GString *drc_names, *drc_types;
+    g_autoptr(GArray) drc_indexes =3D g_array_new(false, true,
+                                                sizeof(uint32_t));
+    g_autoptr(GArray) drc_power_domains =3D g_array_new(false, true,
+                                                      sizeof(uint32_t));
+    g_autoptr(GString) drc_names =3D g_string_set_size(g_string_new(NULL=
),
+                                                     sizeof(uint32_t));
+    g_autoptr(GString) drc_types =3D g_string_set_size(g_string_new(NULL=
),
+                                                     sizeof(uint32_t));
     int ret;
=20
     /*
@@ -857,12 +863,8 @@ int spapr_dt_drc(void *fdt, int offset, Object *owne=
r, uint32_t drc_type_mask)
      * reserve the space now and set the offsets accordingly so we
      * can fill them in later.
      */
-    drc_indexes =3D g_array_new(false, true, sizeof(uint32_t));
     drc_indexes =3D g_array_set_size(drc_indexes, 1);
-    drc_power_domains =3D g_array_new(false, true, sizeof(uint32_t));
     drc_power_domains =3D g_array_set_size(drc_power_domains, 1);
-    drc_names =3D g_string_set_size(g_string_new(NULL), sizeof(uint32_t)=
);
-    drc_types =3D g_string_set_size(g_string_new(NULL), sizeof(uint32_t)=
);
=20
     /* aliases for all DRConnector objects will be rooted in QOM
      * composition tree at DRC_CONTAINER_PATH
@@ -874,7 +876,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask)
         Object *obj;
         SpaprDrc *drc;
         SpaprDrcClass *drck;
-        char *drc_name =3D NULL;
+        g_autofree char *drc_name =3D NULL;
         uint32_t drc_index, drc_power_domain;
=20
         if (!strstart(prop->type, "link<", NULL)) {
@@ -908,7 +910,6 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask)
         drc_name =3D spapr_drc_name(drc);
         drc_names =3D g_string_append(drc_names, drc_name);
         drc_names =3D g_string_insert_len(drc_names, -1, "\0", 1);
-        g_free(drc_name);
=20
         /* ibm,drc-types */
         drc_types =3D g_string_append(drc_types, drck->typename);
@@ -928,7 +929,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask)
                       drc_indexes->len * sizeof(uint32_t));
     if (ret) {
         error_report("Couldn't create ibm,drc-indexes property");
-        goto out;
+        return ret;
     }
=20
     ret =3D fdt_setprop(fdt, offset, "ibm,drc-power-domains",
@@ -936,29 +937,22 @@ int spapr_dt_drc(void *fdt, int offset, Object *own=
er, uint32_t drc_type_mask)
                       drc_power_domains->len * sizeof(uint32_t));
     if (ret) {
         error_report("Couldn't finalize ibm,drc-power-domains property")=
;
-        goto out;
+        return ret;
     }
=20
     ret =3D fdt_setprop(fdt, offset, "ibm,drc-names",
                       drc_names->str, drc_names->len);
     if (ret) {
         error_report("Couldn't finalize ibm,drc-names property");
-        goto out;
+        return ret;
     }
=20
     ret =3D fdt_setprop(fdt, offset, "ibm,drc-types",
                       drc_types->str, drc_types->len);
     if (ret) {
         error_report("Couldn't finalize ibm,drc-types property");
-        goto out;
     }
=20
-out:
-    g_array_free(drc_indexes, true);
-    g_array_free(drc_power_domains, true);
-    g_string_free(drc_names, true);
-    g_string_free(drc_types, true);
-
     return ret;
 }
=20
--=20
2.34.1


