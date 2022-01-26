Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D0D49CFEC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:44:06 +0100 (CET)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClOv-0004Ed-H1
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:44:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAR-0006DT-Gk
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAK-00034D-Em
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:07 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFosYe022414; 
 Wed, 26 Jan 2022 16:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DbhDh30IU41p2n7bIkZvgUFqsHSQ2A16PpZjNaFWGLg=;
 b=ptfJj5MDd0UIOm/l1yfcbgxrtCfzdY5BEnfZXBRpVDnkCKu6FbNVunTDglQcq4+PLMDm
 9DwKMTJr/3GGn+NaxX/GEIyalGgnDstCxYyxNkl+PxsWh4tbceVQ0/M1hP7GuTpLdW69
 AQHpL+3CcLFRahSMUI6ZRCiIZ4+HpvIcZefaO4P4aLzwq786r64tZx1lZhyoMUiDVNKB
 5k34cZOdEe4hnoCpOyLrgK0ioe2sg9NSejyIyHw4u5Au5xsJzx04BBhlYDZEJii+Mzkq
 MZhNxcOX424VjYGL9LqfhjLMzmma5NLnGo+LGv3JD+Haj1kXENFWhfgL/5TOVu1VRiqc rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjf3r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAnAt183810;
 Wed, 26 Jan 2022 16:28:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 3dtax8qprr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfCAchx3yorehplIKtq7RwjiKTCjBPDDb3faWYk+/2tKetC7FauoGQ/UY6jNB0u8+vLKeugsNwNSY1fPYpoXJMRr9W8YneyAJTBgqk/CyYyqaUDVkAWE4XrGQD9w8sG2w4d/R2coHf+hFExeIkxHaa4dvA19WYrMPEgq6a1+uuyIFT5ssrfFWbzT5fd33STY+wGdypXH8/zMPgOJ32yJIC3T/xSEqCtuXfOLYOJaChMdW9vjSWKmeeZYJq3LYgbPb1SN04lAVNMOLLs3KzNs0/4rOjpWGUWTKFJVUBodqOF17UGR5Hb/MVIHKsHfdi64zOiFkyTCDJbqm1ytMiAfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbhDh30IU41p2n7bIkZvgUFqsHSQ2A16PpZjNaFWGLg=;
 b=ZKyqdFX2687FGpul1n4P5Nn9iiIvBqkJsjRXYZFfNRrdUb103EjBOeuHLe1duBosq2vSGH3MxD1HNPidOv7iVnEfR1zn618k5ugxrdSZcvWNhEZvfjmTW7mu0ja3sbnbAHzMkysXvXMOZ83zV1hl8hGk5pJ+Bu7gEVha+NwMz4XMaG/k1RjZP2dK1JwbHazvPh+kT1aDZTZk4AlXoh8ZLmmNLYPNHeIX5Pjgx4EGEM0fC6jar6o4wOCUU9ZgmsM7q6hrTlt4x5u1tMoxrvDv3ECQtFrwp0HoDMxwEtemlS+vR2EdXB8crb4eNKCZqIeOvnTigMuCDj/6XjXsqyhYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbhDh30IU41p2n7bIkZvgUFqsHSQ2A16PpZjNaFWGLg=;
 b=nBzckJTvJTSY9sPbgsjUk1zEAt1ZVVd/BtURraIu2FNKidD/K8M8f+2ce2xMq+uwE4r2tAvLY+ANYcNh2wVvkEuk49EBk6UH0FxAo0rIk+EznoUq897oc1p+Me2c8e03QQDmNUYa5alWnaBjMwVo+MexdRtiaDg0iHBQggiPA3s=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:54 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:54 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 05/10] ACPI ERST: support for ACPI ERST feature
Date: Wed, 26 Jan 2022 11:28:29 -0500
Message-Id: <1643214514-2839-6-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d3e201c-5398-4d32-5ae5-08d9e0e8f197
X-MS-TrafficTypeDiagnostic: CO1PR10MB4450:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4450AF20D07D449B7CB061D497209@CO1PR10MB4450.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAZOPNc24za5Y+4l+ZkNA3rj+4Fw1yOhc57KkS1/Fmv0rppM1+4Dek/5/Rm8w5aE23DRcKcUd3ZINo51uxs1TLWd9CgrvIxbRnD0MZHpsCphPlqoZshhtda5UKosFe6hlTvZwhoTx+u5EKUpndYTu5bsUH1117h60bCpkzzMtqELbzCn7EE1WqyBKE1S51c/smXJshmUqdX+s1dG9lzBcoB4iH4MUJVjvgux0qI5QsjQUeJ0W7BK6xF8kCLUIL8VvmezyHYJXA2DtNc5J+C83Lg6A9dhzOMAsdVqwK5HcS/dz6GjoM9+q4tEF+oUOXA00e7lXLwgKUtnkNsfSxECOFjTYp/UyRXigLPLp0db4bJwoLgvXZoWP/5li7IUmVSQZsqXZztgDB8DtG32VpvGP88byFTYJ9ckgaXoqaDZ+pMPLVfjr833krQF8Y9CqdWOWR1aQ7QHGdd5DukNDdXR7QKGavueg1IGZu6RNK2eiUyK27BP5kLfRwx6mu00Q3ONEV0v1ZEePAzN5mSxjHcbzRciKTRQR3085MU2IGYdXhwgjDhxMLlnrOJ4YVkeRjfcp4XnRYZIdUHEylGXRCSd2dsQ290VOs9PlPD0r3yzaWqa6c93onc7s3NFWDVSBmlOVMEbiof2DcW9gzNwzTb/HvP0G0mGoksumf6T3WZdpGNRGXfP7CyyGp0d67Q59P+K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(30864003)(6486002)(83380400001)(6916009)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(508600001)(86362001)(316002)(5660300002)(6512007)(107886003)(36756003)(38350700002)(38100700002)(186003)(26005)(2616005)(2906002)(6666004)(52116002)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1qPWW4+681mEA5a76EKHpVQOr5YE0VyRDW2pXtkCHKMNdGyYwHITdFrPAp2?=
 =?us-ascii?Q?O52xhwNi5VL4XY8IBl4ylqu1xO8Y1yDw053m+bxThmidFbu3kJpYdUjIPpHS?=
 =?us-ascii?Q?0To4j80/XaYC4WhYBsMQpZN/yHAUZKl77o9PVlfqLiW6uvrAzYeAQNgWTPXS?=
 =?us-ascii?Q?nmxKbqCakvVaKXMbL/kqrKy/q+aepLQLNA+Cb+2UB8jLuQFVnra9bb+bksYV?=
 =?us-ascii?Q?3/p1vk0wQysZaUfT5hyC3VKOuxoPTVTTtWRsi0O7Znr0DB/x/sxrseCUC8ee?=
 =?us-ascii?Q?QPXs4picOK0G9Mx15yysVTYI2xkG7MeZ6lKzOa7OkI+JUUueNvfODUSM5u0n?=
 =?us-ascii?Q?7cgjDS879qILAErJcHBNp0pz+PUns+T/GV4DOmHLHcFkKOKWYh4ZQF+w0Onz?=
 =?us-ascii?Q?BZYcMJ8BDxgeIA2GQxyqHneQYds8SJqldoW3E5dAmAqAEAd/RcSpKwm69R5v?=
 =?us-ascii?Q?hKlLAxspzpd4X04tk16uN/ANB/PMqpmFLhTGZO9gldBO+pfKgxX5CShMjevN?=
 =?us-ascii?Q?FmGfmphqske62Zk3YusMWsT03eI7fr32x4+CO4OwQee7rE1AlW7S2QCPk7UG?=
 =?us-ascii?Q?jad124lrqkBWnzfv642CllJo6/LGbMu2DrUDFoQZBZo4ryhOp46bFWnJwry+?=
 =?us-ascii?Q?ynK7NtjAEv4wQ7QEBldfUO7OfiSan/HzSwzBwPOPB/IqzQ511PSWnSCrpZnT?=
 =?us-ascii?Q?XmypDnEtUoGcwuXP04ZJE4tG9LrHVHIlBQS0LHSQy0r+9s3RcutPOidCLxDN?=
 =?us-ascii?Q?I1jSnanPiRLDo+Xi1orHVKOF0I2M783Xen1Y4uDvYVzW4ltR/jUKdLGPQYgj?=
 =?us-ascii?Q?a0kbZ9jNpTgaygJg2UhFUjQr0NMFFyhYIgUPbkNt555NwbvpDrzDD1Ee+PCi?=
 =?us-ascii?Q?fOhP9fTEzsKbGS9a6rZocf5S1YhX9owMTXJwNapzxHmh5GEmNBu8QT3yK2x0?=
 =?us-ascii?Q?UaoSU4H0snA+8YXXAJboelx9l7olqxmCkLoGYeVgcQyUfddlOeY1HGExKxBA?=
 =?us-ascii?Q?wQL6uTJ6tJpt8/L2YWmKFcEM0wi8Q6q1Dj8ZAXkVWwVP1Tmc+XLZwqRICn84?=
 =?us-ascii?Q?CtXM0LCqdQ2rWJkng39M5pACAKVdruA34w+rLy2CgG64voLoq6D3COAv1Z/+?=
 =?us-ascii?Q?h6ppOkF94KuH+M8g+JjfkC005znTakhEbNtQ6W8GEVYOzwV+zzqX/tuXNnAn?=
 =?us-ascii?Q?Ij0yrYAPHRTEeA9vUnsX7sAJ1IY129BHy++l+rK/rH5R4GdI0kffVBwHxjPg?=
 =?us-ascii?Q?RGjGl/hJvAB3/36ERRbSBHy34wDLb4sBe6/yE0nT2uuNnCQlHfYsvxeNdByk?=
 =?us-ascii?Q?Vic4GC336MQyBso6GRxjgRve/7ZdvGbChjexpvgCnmEB+SD8MJIZrPZeewoa?=
 =?us-ascii?Q?CbsLfJZSx8alrM07Gq+n/Hjcx2eYVT29+G1eK3Qach39j8pNIBGcpiatfnGz?=
 =?us-ascii?Q?9LVbqfYBfrU72SAnn4pnfE+kadblIqz7q+363sBj8nAGpvCI5h+HU56weB/w?=
 =?us-ascii?Q?p8PXAVwAAyl+nlI9SyMiSaTowhDI8F8HPf+AwoRxAddlZPV0V3oBo/ud1B6L?=
 =?us-ascii?Q?Ahdf+Z0v3XZeaWAYf1Ng1SPNdHGrA8RlHJwxQze9l882lrcpaoknp24UcgH9?=
 =?us-ascii?Q?LVyj8gMO88mTk26ELZr6lCAzo5n558xm6izWuSZishO8e0DbgVv4NUT5VhQc?=
 =?us-ascii?Q?Zo06+Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3e201c-5398-4d32-5ae5-08d9e0e8f197
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:54.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhopqX1RH/a6M2xhfN5G0HnwiYJDb9FKXSWSHlmA9GWQE2vZl7VpX56qiluH0f+PpM3KAMwIh+Li8tun/UyhaOw07BQJEWJ2wr1EAOhThHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: L1WEbIuH2cNPnajFHuGDeYMgpeRxA82v
X-Proofpoint-ORIG-GUID: L1WEbIuH2cNPnajFHuGDeYMgpeRxA82v
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements a PCI device for ACPI ERST. This implements the
non-NVRAM "mode" of operation for ERST as it is supported by
Linux and Windows.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/Kconfig      |   6 +
 hw/acpi/erst.c       | 844 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build  |   1 +
 hw/acpi/trace-events |  15 +
 4 files changed, 866 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 622b0b5..19caebd 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -10,6 +10,7 @@ config ACPI_X86
     select ACPI_HMAT
     select ACPI_PIIX4
     select ACPI_PCIHP
+    select ACPI_ERST
 
 config ACPI_X86_ICH
     bool
@@ -60,3 +61,8 @@ config ACPI_HW_REDUCED
     select ACPI
     select ACPI_MEMORY_HOTPLUG
     select ACPI_NVDIMM
+
+config ACPI_ERST
+    bool
+    default y
+    depends on ACPI && PCI
diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000..fe9ba51
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,844 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-core.h"
+#include "exec/memory.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "exec/address-spaces.h"
+#include "sysemu/hostmem.h"
+#include "hw/acpi/erst.h"
+#include "trace.h"
+
+/* ACPI 4.0: Table 17-16 Serialization Actions */
+#define ACTION_BEGIN_WRITE_OPERATION         0x0
+#define ACTION_BEGIN_READ_OPERATION          0x1
+#define ACTION_BEGIN_CLEAR_OPERATION         0x2
+#define ACTION_END_OPERATION                 0x3
+#define ACTION_SET_RECORD_OFFSET             0x4
+#define ACTION_EXECUTE_OPERATION             0x5
+#define ACTION_CHECK_BUSY_STATUS             0x6
+#define ACTION_GET_COMMAND_STATUS            0x7
+#define ACTION_GET_RECORD_IDENTIFIER         0x8
+#define ACTION_SET_RECORD_IDENTIFIER         0x9
+#define ACTION_GET_RECORD_COUNT              0xA
+#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
+#define ACTION_RESERVED                      0xC
+#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
+#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
+#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
+#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10 /* ACPI 6.3 */
+
+/* ACPI 4.0: Table 17-17 Command Status Definitions */
+#define STATUS_SUCCESS                0x00
+#define STATUS_NOT_ENOUGH_SPACE       0x01
+#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
+#define STATUS_FAILED                 0x03
+#define STATUS_RECORD_STORE_EMPTY     0x04
+#define STATUS_RECORD_NOT_FOUND       0x05
+
+/* UEFI 2.1: Appendix N Common Platform Error Record */
+#define UEFI_CPER_RECORD_MIN_SIZE 128U
+#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
+#define UEFI_CPER_RECORD_ID_OFFSET 96U
+#define IS_UEFI_CPER_RECORD(ptr) \
+    (((ptr)[0] == 'C') && \
+     ((ptr)[1] == 'P') && \
+     ((ptr)[2] == 'E') && \
+     ((ptr)[3] == 'R'))
+
+/*
+ * NOTE that when accessing CPER fields within a record, memcpy()
+ * is utilized to avoid a possible misaligned access on the host.
+ */
+
+/*
+ * This implementation is an ACTION (cmd) and VALUE (data)
+ * interface consisting of just two 64-bit registers.
+ */
+#define ERST_REG_SIZE (16UL)
+#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
+#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
+
+/*
+ * ERST_RECORD_SIZE is the buffer size for exchanging ERST
+ * record contents. Thus, it defines the maximum record size.
+ * As this is mapped through a PCI BAR, it must be a power of
+ * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
+ * The backing storage is divided into fixed size "slots",
+ * each ERST_RECORD_SIZE in length, and each "slot"
+ * storing a single record. No attempt at optimizing storage
+ * through compression, compaction, etc is attempted.
+ * NOTE that slot 0 is reserved for the backing storage header.
+ * Depending upon the size of the backing storage, additional
+ * slots will be part of the slot 0 header in order to account
+ * for a record_id for each available remaining slot.
+ */
+/* 8KiB records, not too small, not too big */
+#define ERST_RECORD_SIZE (8192UL)
+
+#define ACPI_ERST_MEMDEV_PROP "memdev"
+#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
+
+/*
+ * From the ACPI ERST spec sections:
+ * A record id of all 0s is used to indicate 'unspecified' record id.
+ * A record id of all 1s is used to indicate empty or end.
+ */
+#define ERST_UNSPECIFIED_RECORD_ID (0UL)
+#define ERST_EMPTY_END_RECORD_ID (~0UL)
+
+#define ERST_IS_VALID_RECORD_ID(rid) \
+    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
+     (rid != ERST_EMPTY_END_RECORD_ID))
+
+/*
+ * Implementation-specific definitions and types.
+ * Values are arbitrary and chosen for this implementation.
+ * See erst.rst documentation for details.
+ */
+#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
+#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
+typedef struct {
+    uint64_t magic;
+    uint32_t record_size;
+    uint32_t storage_offset; /* offset to record storage beyond header */
+    uint16_t version;
+    uint16_t reserved;
+    uint32_t record_count;
+    uint64_t map[]; /* contains record_ids, and position indicates index */
+} __attribute__((packed)) ERSTStorageHeader;
+
+/*
+ * Object cast macro
+ */
+#define ACPIERST(obj) \
+    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
+
+/*
+ * Main ERST device state structure
+ */
+typedef struct {
+    PCIDevice parent_obj;
+
+    /* Backend storage */
+    HostMemoryBackend *hostmem;
+    MemoryRegion *hostmem_mr;
+    uint32_t storage_size;
+    uint32_t default_record_size;
+
+    /* Programming registers */
+    MemoryRegion iomem_mr;
+
+    /* Exchange buffer */
+    MemoryRegion exchange_mr;
+
+    /* Interface state */
+    uint8_t operation;
+    uint8_t busy_status;
+    uint8_t command_status;
+    uint32_t record_offset;
+    uint64_t reg_action;
+    uint64_t reg_value;
+    uint64_t record_identifier;
+    ERSTStorageHeader *header;
+    unsigned first_record_index;
+    unsigned last_record_index;
+    unsigned next_record_index;
+
+} ERSTDeviceState;
+
+/*******************************************************************/
+/*******************************************************************/
+static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
+{
+    uint8_t *rc = NULL;
+    off_t offset = (index * le32_to_cpu(s->header->record_size));
+
+    g_assert(offset < s->storage_size);
+
+    rc = memory_region_get_ram_ptr(s->hostmem_mr);
+    rc += offset;
+
+    return rc;
+}
+
+static void make_erst_storage_header(ERSTDeviceState *s)
+{
+    ERSTStorageHeader *header = s->header;
+    unsigned mapsz, headersz;
+
+    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
+    header->record_size = cpu_to_le32(s->default_record_size);
+    header->version = cpu_to_le16(0x0100);
+    header->reserved = cpu_to_le16(0x0000);
+
+    /* Compute mapsize */
+    mapsz = s->storage_size / s->default_record_size;
+    mapsz *= sizeof(uint64_t);
+    /* Compute header+map size */
+    headersz = sizeof(ERSTStorageHeader) + mapsz;
+    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
+    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
+    header->storage_offset = cpu_to_le32(headersz);
+
+    /*
+     * The HostMemoryBackend initializes contents to zero,
+     * so all record_ids stashed in the map are zero'd.
+     * As well the record_count is zero. Properly initialized.
+     */
+}
+
+static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
+{
+    ERSTStorageHeader *header;
+    uint32_t record_size;
+
+    header = memory_region_get_ram_ptr(s->hostmem_mr);
+    s->header = header;
+
+    /* Ensure pointer to header is 64-bit aligned */
+    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
+
+    /*
+     * Check if header is uninitialized; HostMemoryBackend inits to 0
+     */
+    if (le64_to_cpu(header->magic) == 0UL) {
+        make_erst_storage_header(s);
+    }
+
+    /* Validity check record_size */
+    record_size = le32_to_cpu(header->record_size);
+    if (!(
+        (record_size) && /* non zero */
+        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
+        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
+        (record_size >= 4096) /* PAGE_SIZE */
+        )) {
+        error_setg(errp, "ERST record_size %u is invalid", record_size);
+    }
+
+    /* Validity check header */
+    if (!(
+        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
+        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
+        (le16_to_cpu(header->version) == 0x0100) &&
+        (le16_to_cpu(header->reserved) == 0)
+        )) {
+        error_setg(errp, "ERST backend storage header is invalid");
+    }
+
+    /* Check storage_size against record_size */
+    if (((s->storage_size % record_size) != 0) ||
+         (record_size > s->storage_size)) {
+        error_setg(errp, "ACPI ERST requires storage size be multiple of "
+            "record size (%uKiB)", record_size);
+    }
+
+    /* Compute offset of first and last record storage slot */
+    s->first_record_index = le32_to_cpu(header->storage_offset)
+        / record_size;
+    s->last_record_index = (s->storage_size / record_size);
+}
+
+static void update_map_entry(ERSTDeviceState *s, unsigned index,
+    uint64_t record_id)
+{
+    if (index < s->last_record_index) {
+        s->header->map[index] = cpu_to_le64(record_id);
+    }
+}
+
+static unsigned find_next_empty_record_index(ERSTDeviceState *s)
+{
+    unsigned rc = 0; /* 0 not a valid index */
+    unsigned index = s->first_record_index;
+
+    for (; index < s->last_record_index; ++index) {
+        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
+            rc = index;
+            break;
+        }
+    }
+
+    return rc;
+}
+
+static unsigned lookup_erst_record(ERSTDeviceState *s,
+    uint64_t record_identifier)
+{
+    unsigned rc = 0; /* 0 not a valid index */
+
+    /* Find the record_identifier in the map */
+    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
+        /*
+         * Count number of valid records encountered, and
+         * short-circuit the loop if identifier not found
+         */
+        uint32_t record_count = le32_to_cpu(s->header->record_count);
+        unsigned count = 0;
+        unsigned index;
+        for (index = s->first_record_index; index < s->last_record_index &&
+                count < record_count; ++index) {
+            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
+                rc = index;
+                break;
+            }
+            if (le64_to_cpu(s->header->map[index]) !=
+                ERST_UNSPECIFIED_RECORD_ID) {
+                ++count;
+            }
+        }
+    }
+
+    return rc;
+}
+
+/*
+ * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
+ * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
+ */
+static unsigned get_next_record_identifier(ERSTDeviceState *s,
+    uint64_t *record_identifier, bool first)
+{
+    unsigned found = 0;
+    unsigned index;
+
+    /* For operations needing to return 'first' record identifier */
+    if (first) {
+        /* Reset initial index to beginning */
+        s->next_record_index = s->first_record_index;
+    }
+    index = s->next_record_index;
+
+    *record_identifier = ERST_EMPTY_END_RECORD_ID;
+
+    if (le32_to_cpu(s->header->record_count)) {
+        for (; index < s->last_record_index; ++index) {
+            if (le64_to_cpu(s->header->map[index]) !=
+                    ERST_UNSPECIFIED_RECORD_ID) {
+                    /* where to start next time */
+                    s->next_record_index = index + 1;
+                    *record_identifier = le64_to_cpu(s->header->map[index]);
+                    found = 1;
+                    break;
+            }
+        }
+    }
+    if (!found) {
+        /* at end (ie scan complete), reset */
+        s->next_record_index = s->first_record_index;
+    }
+
+    return STATUS_SUCCESS;
+}
+
+/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
+static unsigned clear_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, s->record_identifier);
+    if (index) {
+        /* No need to wipe record, just invalidate its map entry */
+        uint32_t record_count;
+        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
+        record_count = le32_to_cpu(s->header->record_count);
+        record_count -= 1;
+        s->header->record_count = cpu_to_le32(record_count);
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.2 Operations - Reading */
+static unsigned read_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned exchange_length;
+    unsigned index;
+
+    /* Check if backend storage is empty */
+    if (le32_to_cpu(s->header->record_count) == 0) {
+        return STATUS_RECORD_STORE_EMPTY;
+    }
+
+    exchange_length = memory_region_size(&s->exchange_mr);
+
+    /* Check for record identifier of all 0s */
+    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
+        /* Set to 'first' record in storage */
+        get_next_record_identifier(s, &s->record_identifier, true);
+        /* record_identifier is now a valid id, or all 1s */
+    }
+
+    /* Check for record identifier of all 1s */
+    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
+        return STATUS_FAILED;
+    }
+
+    /* Validate record_offset */
+    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, s->record_identifier);
+    if (index) {
+        uint8_t *nvram;
+        uint8_t *exchange;
+        uint32_t record_length;
+
+        /* Obtain pointer to the exchange buffer */
+        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
+        exchange += s->record_offset;
+        /* Obtain pointer to slot in storage */
+        nvram = get_nvram_ptr_by_index(s, index);
+        /* Validate CPER record_length */
+        memcpy((uint8_t *)&record_length,
+            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
+            sizeof(uint32_t));
+        record_length = le32_to_cpu(record_length);
+        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
+            rc = STATUS_FAILED;
+        }
+        if ((s->record_offset + record_length) > exchange_length) {
+            rc = STATUS_FAILED;
+        }
+        /* If all is ok, copy the record to the exchange buffer */
+        if (rc != STATUS_FAILED) {
+            memcpy(exchange, nvram, record_length);
+            rc = STATUS_SUCCESS;
+        }
+    } else {
+        /*
+         * See "Reading : 'The steps performed by the platform ...' 2.c"
+         * Set to 'first' record in storage
+         */
+        get_next_record_identifier(s, &s->record_identifier, true);
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.1 Operations - Writing */
+static unsigned write_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_FAILED;
+    unsigned exchange_length;
+    unsigned index;
+    uint64_t record_identifier;
+    uint32_t record_length;
+    uint8_t *exchange;
+    uint8_t *nvram = NULL;
+    bool record_found = false;
+
+    exchange_length = memory_region_size(&s->exchange_mr);
+
+    /* Validate record_offset */
+    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
+        return STATUS_FAILED;
+    }
+
+    /* Obtain pointer to record in the exchange buffer */
+    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
+    exchange += s->record_offset;
+
+    /* Validate CPER record_length */
+    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
+        sizeof(uint32_t));
+    record_length = le32_to_cpu(record_length);
+    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
+        return STATUS_FAILED;
+    }
+    if ((s->record_offset + record_length) > exchange_length) {
+        return STATUS_FAILED;
+    }
+
+    /* Extract record identifier */
+    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
+        sizeof(uint64_t));
+    record_identifier = le64_to_cpu(record_identifier);
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, record_identifier);
+    if (index) {
+        /* Record found, overwrite existing record */
+        nvram = get_nvram_ptr_by_index(s, index);
+        record_found = true;
+    } else {
+        /* Record not found, not an overwrite, allocate for write */
+        index = find_next_empty_record_index(s);
+        if (index) {
+            nvram = get_nvram_ptr_by_index(s, index);
+        } else {
+            /* All slots are occupied */
+            rc = STATUS_NOT_ENOUGH_SPACE;
+        }
+    }
+    if (nvram) {
+        /* Write the record into the slot */
+        memcpy(nvram, exchange, record_length);
+        memset(nvram + record_length, exchange_length - record_length, 0xFF);
+        /* If a new record, increment the record_count */
+        if (!record_found) {
+            uint32_t record_count;
+            record_count = le32_to_cpu(s->header->record_count);
+            record_count += 1; /* writing new record */
+            s->header->record_count = cpu_to_le32(record_count);
+        }
+        update_map_entry(s, index, record_identifier);
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/*******************************************************************/
+
+static uint64_t erst_rd_reg64(hwaddr addr,
+    uint64_t reg, unsigned size)
+{
+    uint64_t rdval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    rdval = reg;
+    rdval >>= shift;
+    rdval &= mask;
+
+    return rdval;
+}
+
+static uint64_t erst_wr_reg64(hwaddr addr,
+    uint64_t reg, uint64_t val, unsigned size)
+{
+    uint64_t wrval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    val &= mask;
+    val <<= shift;
+    mask <<= shift;
+    wrval = reg;
+    wrval &= ~mask;
+    wrval |= val;
+
+    return wrval;
+}
+
+static void erst_reg_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+
+    /*
+     * NOTE: All actions/operations/side effects happen on the WRITE,
+     * by this implementation's design. The READs simply return the
+     * reg_value contents.
+     */
+    trace_acpi_erst_reg_write(addr, val, size);
+
+    switch (addr) {
+    case ERST_VALUE_OFFSET + 0:
+    case ERST_VALUE_OFFSET + 4:
+        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
+        break;
+    case ERST_ACTION_OFFSET + 0:
+        /*
+         * NOTE: all valid values written to this register are of the
+         * ACTION_* variety. Thus there is no need to make this a 64-bit
+         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
+         * is not needed.
+         */
+        switch (val) {
+        case ACTION_BEGIN_WRITE_OPERATION:
+        case ACTION_BEGIN_READ_OPERATION:
+        case ACTION_BEGIN_CLEAR_OPERATION:
+        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+        case ACTION_END_OPERATION:
+            s->operation = val;
+            break;
+        case ACTION_SET_RECORD_OFFSET:
+            s->record_offset = s->reg_value;
+            break;
+        case ACTION_EXECUTE_OPERATION:
+            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
+                s->busy_status = 1;
+                switch (s->operation) {
+                case ACTION_BEGIN_WRITE_OPERATION:
+                    s->command_status = write_erst_record(s);
+                    break;
+                case ACTION_BEGIN_READ_OPERATION:
+                    s->command_status = read_erst_record(s);
+                    break;
+                case ACTION_BEGIN_CLEAR_OPERATION:
+                    s->command_status = clear_erst_record(s);
+                    break;
+                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+                    s->command_status = STATUS_SUCCESS;
+                    break;
+                case ACTION_END_OPERATION:
+                    s->command_status = STATUS_SUCCESS;
+                    break;
+                default:
+                    s->command_status = STATUS_FAILED;
+                    break;
+                }
+                s->busy_status = 0;
+            }
+            break;
+        case ACTION_CHECK_BUSY_STATUS:
+            s->reg_value = s->busy_status;
+            break;
+        case ACTION_GET_COMMAND_STATUS:
+            s->reg_value = s->command_status;
+            break;
+        case ACTION_GET_RECORD_IDENTIFIER:
+            s->command_status = get_next_record_identifier(s,
+                                    &s->reg_value, false);
+            break;
+        case ACTION_SET_RECORD_IDENTIFIER:
+            s->record_identifier = s->reg_value;
+            break;
+        case ACTION_GET_RECORD_COUNT:
+            s->reg_value = le32_to_cpu(s->header->record_count);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            s->reg_value = le32_to_cpu(s->header->record_size);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            s->reg_value = 0x0; /* intentional, not NVRAM mode */
+            break;
+        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            s->reg_value =
+                (100ULL << 32) | /* 100us max time */
+                (10ULL  <<  0) ; /*  10us min time */
+            break;
+        default:
+            /* Unknown action/command, NOP */
+            break;
+        }
+        break;
+    default:
+        /* This should not happen, but if it does, NOP */
+        break;
+    }
+}
+
+static uint64_t erst_reg_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case ERST_ACTION_OFFSET + 0:
+    case ERST_ACTION_OFFSET + 4:
+        val = erst_rd_reg64(addr, s->reg_action, size);
+        break;
+    case ERST_VALUE_OFFSET + 0:
+    case ERST_VALUE_OFFSET + 4:
+        val = erst_rd_reg64(addr, s->reg_value, size);
+        break;
+    default:
+        break;
+    }
+    trace_acpi_erst_reg_read(addr, val, size);
+    return val;
+}
+
+static const MemoryRegionOps erst_reg_ops = {
+    .read = erst_reg_read,
+    .write = erst_reg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+/*******************************************************************/
+/*******************************************************************/
+static int erst_post_load(void *opaque, int version_id)
+{
+    ERSTDeviceState *s = opaque;
+
+    /* Recompute pointer to header */
+    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
+    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
+
+    return 0;
+}
+
+static const VMStateDescription erst_vmstate  = {
+    .name = "acpi-erst",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = erst_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(operation, ERSTDeviceState),
+        VMSTATE_UINT8(busy_status, ERSTDeviceState),
+        VMSTATE_UINT8(command_status, ERSTDeviceState),
+        VMSTATE_UINT32(record_offset, ERSTDeviceState),
+        VMSTATE_UINT64(reg_action, ERSTDeviceState),
+        VMSTATE_UINT64(reg_value, ERSTDeviceState),
+        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
+        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
+{
+    ERSTDeviceState *s = ACPIERST(pci_dev);
+
+    trace_acpi_erst_realizefn_in();
+
+    if (!s->hostmem) {
+        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(s->hostmem)) {
+        error_setg(errp, "can't use already busy memdev: %s",
+                   object_get_canonical_path_component(OBJECT(s->hostmem)));
+        return;
+    }
+
+    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
+
+    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
+    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
+
+    /* Initialize backend storage and record_count */
+    check_erst_backend_storage(s, errp);
+
+    /* BAR 0: Programming registers */
+    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
+                          TYPE_ACPI_ERST, ERST_REG_SIZE);
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
+
+    /* BAR 1: Exchange buffer memory */
+    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
+                            "erst.exchange",
+                            le32_to_cpu(s->header->record_size), errp);
+    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                        &s->exchange_mr);
+
+    /* Include the backend storage in the migration stream */
+    vmstate_register_ram_global(s->hostmem_mr);
+
+    trace_acpi_erst_realizefn_out(s->storage_size);
+}
+
+static void erst_reset(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
+    s->operation = 0;
+    s->busy_status = 0;
+    s->command_status = STATUS_SUCCESS;
+    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
+    s->record_offset = 0;
+    s->next_record_index = s->first_record_index;
+    /* NOTE: first/last_record_index are computed only once */
+    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
+}
+
+static Property erst_properties[] = {
+    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
+                     default_record_size, ERST_RECORD_SIZE),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    trace_acpi_erst_class_init_in();
+    k->realize = erst_realizefn;
+    k->vendor_id = PCI_VENDOR_ID_REDHAT;
+    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
+    k->revision = 0x00;
+    k->class_id = PCI_CLASS_OTHERS;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    dc->user_creatable = true;
+    dc->hotpluggable = false;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    trace_acpi_erst_class_init_out();
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_PCI_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index adf6347..f5b2298 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -22,6 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 974d770..2250126 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+
+# erst.c
+acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
+acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
+acpi_erst_realizefn_in(void)
+acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
+acpi_erst_reset_in(unsigned record_count) "record_count %u"
+acpi_erst_reset_out(unsigned record_count) "record_count %u"
+acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
+acpi_erst_class_init_in(void)
+acpi_erst_class_init_out(void)
-- 
1.8.3.1


