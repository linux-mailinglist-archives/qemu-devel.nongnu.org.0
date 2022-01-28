Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5B4A027A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:02:42 +0100 (CET)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYOH-0005cg-5p
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY17-0004hk-Kn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:47 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY13-0002iD-KD
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:43 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK47eW025846; 
 Fri, 28 Jan 2022 20:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=1qVIWv5Uwgmf76qjPFH0I0RP3qblL9KyZuBCVOj2mfg=;
 b=FFlBkkAAqouWHh2AGIrjN1n3sea5U2aSR/27IMRfcUbwT3fZMv7O3nFQaMjrVGk7wJDe
 4nd2f/dRxIb7kXCNO8lFnhsC6sKIMtH45LwoRVqNyKyuRoP79ASc4BeB5aBeNlHyRQSE
 Gw8hSMHvaDyYzuDqjSzENmYDMIEK8U7lS7gpfgpXTSk5VvRlcnmF0y0j0s2wwjD1zy5Y
 pX8ZUQIoRw4/dIUHnHUlUANXbxAIqrLHBqm2qRLWI5ywUEmpEKLuFPBji2YKMf156TUN
 f+PSifJa4jPTjvsIp63khPSAztk0IiSIevaAdygF0tQZUodpvImK4tHfPl8ECoTvGZ4t 3w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duxnp3xu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKP93A185712;
 Fri, 28 Jan 2022 20:38:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 3dr726jfqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9/dhg8n9Wra4njfmAaUoP8U72DHMDlqwKM6N6A/VaOsMNM5OJx4IlrPh1xnSulkxXuYHRhbXvAkckQ4ylbaAmAVUYhl4UpM3MEAgrGXOGrPG29HMygJvFiSDN3svgUhXoYWslfd1Vue4iLYmn+/N/eW9PtEWdQ3mdG8BnpmCPmraaHn30PvYsPlsTPZcoRqdO1MV+K2sN8wajGJAPgMugqEFW117NwqhaUXBY93Tf4OJU8HlFR+4Nk/wnK9Yx04O9+5u0AsxXZN8tiqiTU1c5oJOwGlSBSNLFj/Ves1px6x7rqO9n6lBoQ+PZvcGC2WH+aPn9P3UOCvrpqF6M85Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qVIWv5Uwgmf76qjPFH0I0RP3qblL9KyZuBCVOj2mfg=;
 b=fIZOf3beUjJ3q5/Cbr9sjB6hegTKwiCPSX/0WQboXBbOgSMlDALfCmpTU+VWbvWMp0naJxkUWrxApbU8UuFJRWJPhLW4aekfEdl6sqeibzA7AmUQxcWZBij2ROjKahP5KcGCmuwM82Ey4Qpy6Dy+zl3rIwDvXjc/TEkupVhFlZWPxbTjqUjTCWHNAnSwhOJ9rn/QtnHAVV9CFf7V2hcFwYge8gurfB0UKl0p65gmttMyZeDGs1mEuIG9E10JCy493QCDvcLhXJHUcmcMCeS+PKwDh5IuQxl6VmsZ95qc+vMyS1haifs94+ygc1nDaCcXc+qa2YDdhJlXrzgfRIkQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qVIWv5Uwgmf76qjPFH0I0RP3qblL9KyZuBCVOj2mfg=;
 b=DatS0xMyU/f82vcxXL8JphYleKaotRHDXy4yV9TrCpOIH5h69QfdItKAj/vZRdp8+OnjuOHtPhQUXwpAmdn6p/X6JlKDVrFwDNmFAX9hnrFoScMwBZNhe/znewv6N9+/0y+BJm8gQK34IBWtfk4Vc+H02YZUGMxhr9HeAXW3qFU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB5552.namprd10.prod.outlook.com (2603:10b6:a03:3d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 20:38:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:32 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 08/10] ACPI ERST: qtest for ERST
Date: Fri, 28 Jan 2022 15:38:07 -0500
Message-Id: <1643402289-22216-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48597fe4-a172-4de9-d334-08d9e29e264d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5552:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB55527AE6ED9F2F00138A008D97229@SJ0PR10MB5552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDRJKqi1f+7L72QuNKcY39i+k9ehnmDHN6cWVZtqBFWSljO1P+iLkYNAH41biBU0vKocefNsmj/8BrmgiuVmlz92BX1tFSX9QROxe/7jLW87cSlvgADCDUwYLutetvReJgVZzOGvdLp2mA+o3clJdLWv3Usx2mJmb89NdKC2UwUkRkj5whC1FocfaMJ7m6DMqaJE8rWxVFE13Vd9mSoRG7gh8Qm/yfj6DJqiJ4X8qw/uoUmppBm2RGifUtwKSq5fGD4cEOpIl0gRdqtGcbsiO50nSP0t2GdDfLPjyHxj70v91e3pX2tuxxkiEKbBVOgy/4oZ0dBb82MKpDEezcDQvHBMZlahMp7w37JDw+6HkPca9YtTsyXnAZbtasPwoV1hPH5xWJv3dUbSXbu2q9bEvZQ5LQ6RZPKfdExyXDrGKH+Q0QOJty6JY2QAxDN5HAD2PE46cB+iGp4jxWCF5XC8JO3+rjQ5CM8GCclHfcnhCxOTJZRZNkP4hoR22k3W+e+5UoGNjQQjIWhe6XTAyxeJmaHP+ZkC39EEMim+u0BXzQPcQoIJwd46cZKAZogiSOPYndqUuUZAd71sGKypDNoOKpEkrmMXli1j/248PPp+x0Ew1f+T3B8yzypFIzlwG0+SpLEXcregbOljYELKEcqe7y5zvHtEQ8nVltYwEn4MwEjskeyJ3dZLi/pNca7+xTafZEvaIzhwxH62QPiuGCLjNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6916009)(316002)(66476007)(66556008)(6486002)(4326008)(38350700002)(508600001)(66946007)(38100700002)(36756003)(8936002)(8676002)(5660300002)(6506007)(2906002)(26005)(107886003)(83380400001)(6512007)(2616005)(6666004)(52116002)(186003)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TUWpooMAXOUTzOIZHI9hLXJ4z6Dzjp8mZK4bdWxFv9LsY8JLmZuwwn9ZJWvu?=
 =?us-ascii?Q?jfZbe5OoZ0NlZQEWCiQLGItXs4DNl8b8cwItFjTp3COltgt9QwAte8os2nC1?=
 =?us-ascii?Q?ppCKnpwdP78ha507SR84zdCdDg7CmlGFAJYguHuBCPG6PH/K9nD65xsyTNkA?=
 =?us-ascii?Q?gKpaEAoXlrA24U3tnCjbNqBGvFHBXpo2LEa9nZatxB0U44TVJBC008jXc0mu?=
 =?us-ascii?Q?YAVH/iJbhj39Enp3eE8aPUzZgrhwZfaK0w2/BLApLoks/NrQRnrd2TokPVBL?=
 =?us-ascii?Q?gqlj3NvaOx1strgcXa5tpdm1BZfKZ+wTbqwcrY2l9A8XNdPDMno/yFmMEbcB?=
 =?us-ascii?Q?nTyLy/8aRKgRWfE9jD8avLQfiKClH1A0ft5Tpsl/I1WVgZN88vX3G06tJBpq?=
 =?us-ascii?Q?6i8z/UdL6SHLkug3jDP1T5KF2uYDj0jDsEkT8elgG0y4KitMzYBfv9U5pAPG?=
 =?us-ascii?Q?QipEZNtVjKQjyC8+YFJij6kg11GPzVzauIG7d/b3aDPnjeLKKKuxEkQK0Kyr?=
 =?us-ascii?Q?ZLZqjvhniuMuJbaLxALXhKO6xDhLhX634VvTpVHeon3LNyOu/UrpTndkBFAo?=
 =?us-ascii?Q?NbJk+PN+GiK/Jl1q+GVyfy8akY983rFNuDRX2WqGNMxWt5R04oc+8XJoU16+?=
 =?us-ascii?Q?/TUDLF2K1c30h+wBBUGv4cu2YWYUeo5UefoBMAQh03gjdBqO22PXM1TJ5+45?=
 =?us-ascii?Q?rGAypIl0qnRbVlFj7mWzOWlRwHU6OLdCgAAQM3y4+qdvMuJcC2vMffeh8xwp?=
 =?us-ascii?Q?o3lWtRIm7dKbefIyo2enPrAavEkXA3k9ZmmCpN3FZ5d9HZRJpKTnJFEwb06E?=
 =?us-ascii?Q?x2i8cyropx7dzJ3DgzXfHRkAR7562NWvYFRlCvolp6zxptjn6Mv1saFFPW+J?=
 =?us-ascii?Q?PCQ7Wb1hpp8GQWURlrNemLHVK2Rv+P1ujXWPC761oXE6WxHRDbfIi50i1qNQ?=
 =?us-ascii?Q?brO3wFtEdEd1739Yx1EQ8PuhObJXo/oEVpJQ613fVC2USm2s9tl8HVbhyBMD?=
 =?us-ascii?Q?EgmOzYCDTIqEp2q13FO9grbhuEOpp/QwznPeiHMkedaCwAhb9GZlaPoSysJ2?=
 =?us-ascii?Q?/h9oQvAH0YP7BhYKq7r03B64RBIOVugYmU/W+lGD5m+yosHHGWkoBH/kuaWB?=
 =?us-ascii?Q?5FLQzDISSqLA/jLeKDAeJW+j+mEs7mNLacOrkKBiqMaFw68FFrTBWdSjIoE/?=
 =?us-ascii?Q?GKugIENExL5871xO0Guc/t2EUX0xZ6aLIvXnluGwKonv8ZC1hyuvB2/XZ82O?=
 =?us-ascii?Q?M0Cjchh5kyaBl6KppUozQUUBJ9/cDWS6WHUghzPwbPnE/t0sjPL0oFRzN2r5?=
 =?us-ascii?Q?uK9imE43nr3zL84IJT1ArrXjpXyz8rp9SAA8c13nuiCrShj6Qj4pEGj2ev1o?=
 =?us-ascii?Q?I8VqQ8YsINJjetIIhoR16lf01l0VWduQLACw4wuK//vUHvO5Dg9OZXEMUvMc?=
 =?us-ascii?Q?J7lm+zxELScfPUuE9nd/a96YqNxp0ng1BFzebWLgMXOw6ZnAT45RwPYPyy+b?=
 =?us-ascii?Q?JvlI/c8VruSq7IaFnLEbWAM7zsSqL4M4iy98LrzaSpn4RD4B3/4N1tXQX9fh?=
 =?us-ascii?Q?gaMRVJ4YuWGr6r7SeQFHKxMUG9zolR9WJBfVNY+Y6RfHkz0hesRiIRrRsMyL?=
 =?us-ascii?Q?ciJdvdQmf8RXb+fUHakf0S4osxW6EQZwxxv830SoM/HJdfnyJZJzVWB3CIOK?=
 =?us-ascii?Q?HRIFmw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48597fe4-a172-4de9-d334-08d9e29e264d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:32.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkaA6Ob8/GYnLS0P7T0iAhdbtjL3LsVkLQQYHJSeTzUHu0VpmBqh75TLYELaLAYSV9FG7VXhhWacll6UcU9HJCbqy/gJMp8yEju1O914fs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5552
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280118
X-Proofpoint-GUID: 3KQaYlOO5LFIMzzzaew0t-OxP5-rwO30
X-Proofpoint-ORIG-GUID: 3KQaYlOO5LFIMzzzaew0t-OxP5-rwO30
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/erst-test.c | 172 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 174 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..f9ad3c9
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,172 @@
+/*
+ * QTest testcase for acpi-erst
+ *
+ * Copyright (c) 2021 Oracle
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include "libqos/libqos-pc.h"
+#include "libqos/libqtest.h"
+#include "qemu-common.h"
+
+#include "hw/pci/pci.h"
+
+static void save_fn(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice **pdev = (QPCIDevice **) data;
+
+    *pdev = dev;
+}
+
+static QPCIDevice *get_erst_device(QPCIBus *pcibus)
+{
+    QPCIDevice *dev;
+
+    dev = NULL;
+    qpci_device_foreach(pcibus,
+        PCI_VENDOR_ID_REDHAT,
+        PCI_DEVICE_ID_REDHAT_ACPI_ERST,
+        save_fn, &dev);
+    g_assert(dev != NULL);
+
+    return dev;
+}
+
+typedef struct _ERSTState {
+    QOSState *qs;
+    QPCIBar reg_bar, mem_bar;
+    uint64_t reg_barsize, mem_barsize;
+    QPCIDevice *dev;
+} ERSTState;
+
+#define ACTION 0
+#define VALUE 8
+
+static const char *reg2str(unsigned reg)
+{
+    switch (reg) {
+    case 0:
+        return "ACTION";
+    case 8:
+        return "VALUE";
+    default:
+        return NULL;
+    }
+}
+
+static inline uint32_t in_reg32(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint32_t res;
+
+    res = qpci_io_readl(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %08x", name, res);
+
+    return res;
+}
+
+static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint64_t res;
+
+    res = qpci_io_readq(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
+
+    return res;
+}
+
+static inline void out_reg32(ERSTState *s, unsigned reg, uint32_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%08x -> *%s", v, name);
+    qpci_io_writel(s->dev, s->reg_bar, reg, v);
+}
+
+static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%016llx -> *%s", (unsigned long long)v, name);
+    qpci_io_writeq(s->dev, s->reg_bar, reg, v);
+}
+
+static void cleanup_vm(ERSTState *s)
+{
+    g_free(s->dev);
+    qtest_shutdown(s->qs);
+}
+
+static void setup_vm_cmd(ERSTState *s, const char *cmd)
+{
+    const char *arch = qtest_get_arch();
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        s->qs = qtest_pc_boot(cmd);
+    } else {
+        g_printerr("erst-test tests are only available on x86\n");
+        exit(EXIT_FAILURE);
+    }
+    s->dev = get_erst_device(s->qs->pcibus);
+
+    s->reg_bar = qpci_iomap(s->dev, 0, &s->reg_barsize);
+    g_assert_cmpuint(s->reg_barsize, ==, 16);
+
+    s->mem_bar = qpci_iomap(s->dev, 1, &s->mem_barsize);
+    g_assert_cmpuint(s->mem_barsize, ==, 0x2000);
+
+    qpci_device_enable(s->dev);
+}
+
+static void test_acpi_erst_basic(void)
+{
+    ERSTState state;
+    uint64_t log_address_range;
+    uint64_t log_address_length;
+    uint32_t log_address_attr;
+
+    setup_vm_cmd(&state,
+        "-object memory-backend-file,"
+            "mem-path=acpi-erst.XXXXXX,"
+            "size=64K,"
+            "share=on,"
+            "id=nvram "
+        "-device acpi-erst,"
+            "memdev=nvram");
+
+    out_reg32(&state, ACTION, 0xD);
+    log_address_range = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xE);
+    log_address_length = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xF);
+    log_address_attr = in_reg32(&state, VALUE);
+
+    /* Check log_address_range is not 0, ~0 or base */
+    g_assert_cmpuint(log_address_range, !=,  0ULL);
+    g_assert_cmpuint(log_address_range, !=, ~0ULL);
+    g_assert_cmpuint(log_address_range, !=, state.reg_bar.addr);
+    g_assert_cmpuint(log_address_range, ==, state.mem_bar.addr);
+
+    /* Check log_address_length is bar1_size */
+    g_assert_cmpuint(log_address_length, ==, state.mem_barsize);
+
+    /* Check log_address_attr is 0 */
+    g_assert_cmpuint(log_address_attr, ==, 0);
+
+    cleanup_vm(&state);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/acpi-erst/basic", test_acpi_erst_basic);
+    ret = g_test_run();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 842b1df..762f6ad 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
@@ -278,6 +279,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


