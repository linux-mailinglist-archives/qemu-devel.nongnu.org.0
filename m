Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8774CA568
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:00:01 +0100 (CET)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOaG-0003Cd-JG
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:00:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrP-0001gX-3N; Wed, 02 Mar 2022 06:09:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32392
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrM-0001y5-79; Wed, 02 Mar 2022 06:09:34 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228OiGR001608; 
 Wed, 2 Mar 2022 11:09:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb6hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:08 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2229vmqL032204;
 Wed, 2 Mar 2022 11:09:08 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb6gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:08 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2b5Q022342;
 Wed, 2 Mar 2022 11:09:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B94E545220212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:09:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1942CAE05A;
 Wed,  2 Mar 2022 11:09:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC03AAE051;
 Wed,  2 Mar 2022 11:09:03 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:09:03 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 27F972201C1;
 Wed,  2 Mar 2022 12:09:03 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 84/87] hw/ppc/spapr_numa.c: simplify
 spapr_numa_write_assoc_lookup_arrays()
Date: Wed,  2 Mar 2022 12:08:00 +0100
Message-Id: <20220302110803.849505-85-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QOgRNlpXPFTtub3AZY-S1iDExjz-uRIS
X-Proofpoint-ORIG-GUID: zzWBFKCM86MfIBjrA1wk_1StbfwWDqbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=688
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

We can get the job done in spapr_numa_write_assoc_lookup_arrays() a bit
cleaner:

- 'cur_index =3D int_buf =3D g_malloc0(..)' is doing a g_malloc0() in the
'int_buf' pointer and making 'cur_index' point to 'int_buf' all in a
single line. No problem with that, but splitting into 2 lines is clearer
to follow

- use g_autofree in 'int_buf' to avoid a g_free() call later on

- 'buf_len' is only being used to store the size of 'int_buf' malloc.
Remove the var and just use the value in g_malloc0() directly

- remove the 'ret' var and just return the result of fdt_setprop()

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220228175004.8862-12-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_numa.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index e9ef7e764696..4f93bdefec64 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -431,12 +431,14 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachi=
neState *spapr, void *fdt,
     int max_distance_ref_points =3D get_max_dist_ref_points(spapr);
     int nb_numa_nodes =3D machine->numa_state->num_nodes;
     int nr_nodes =3D nb_numa_nodes ? nb_numa_nodes : 1;
-    uint32_t *int_buf, *cur_index, buf_len;
-    int ret, i;
+    g_autofree uint32_t *int_buf =3D NULL;
+    uint32_t *cur_index;
+    int i;
=20
     /* ibm,associativity-lookup-arrays */
-    buf_len =3D (nr_nodes * max_distance_ref_points + 2) * sizeof(uint32=
_t);
-    cur_index =3D int_buf =3D g_malloc0(buf_len);
+    int_buf =3D g_malloc0((nr_nodes * max_distance_ref_points + 2) *
+                        sizeof(uint32_t));
+    cur_index =3D int_buf;
     int_buf[0] =3D cpu_to_be32(nr_nodes);
      /* Number of entries per associativity list */
     int_buf[1] =3D cpu_to_be32(max_distance_ref_points);
@@ -451,11 +453,9 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachin=
eState *spapr, void *fdt,
                sizeof(uint32_t) * max_distance_ref_points);
         cur_index +=3D max_distance_ref_points;
     }
-    ret =3D fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays", =
int_buf,
-                      (cur_index - int_buf) * sizeof(uint32_t));
-    g_free(int_buf);
=20
-    return ret;
+    return fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays",
+                       int_buf, (cur_index - int_buf) * sizeof(uint32_t)=
);
 }
=20
 static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
--=20
2.34.1


