Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BDF49CFCF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:37:06 +0100 (CET)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClI9-0005JG-Nm
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAT-0006Hv-7T
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:09 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAN-00034Z-SZ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:08 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFosUP022408; 
 Wed, 26 Jan 2022 16:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=pfxB+VcIR29m0kDhwbS75MnrFcCajGGeGLUlra3zisWlSGR3PC96Cbfe71bE/6DoIvmr
 ShHu76BRXnm6ZjSwW8bxuIihjBxqN4jvrJqT0ENrVrszdWhmnMTWP7kEM6R+1oS3/+7Q
 XSAzg3+MbT2XjAs9rMFuB+WYPSfEGFMiQD+zpjR5cOmvm+UOVnS1MurRYmzjXNEua1GS
 pOuzWyB9Qa+Y8xaB2uNV9pGxHSsUIKwcnQS3GuTO1CcIDEsfC9o3CFbaeHMUjLwV1jIw
 fwzncHigmgSvZUpaN3T89Qd2+oJCZmLKv2IiuLI8CH3EtvRrAkBoPj/OrSTF01ofrpJS Zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjf3rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:29:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAnAv183810;
 Wed, 26 Jan 2022 16:28:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 3dtax8qprr-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaHOnmP/cE+uSDi8wEQM9kLszddoh3NDWU8g8rcyNS58hi6RqrhOrCigaS2q231h+thRnxHKjw5PAW7o/koWvMh99MugXsRcx+2XLHkh3VNfTUdn1Jk1pYMnPFHAVg53khn4W0WCih+Usobvv4LO+fv6QnkXOoqbn3EZHv46tcP4Z64Vx7sd4wpAnGvB+SCosX4tuLl8+0HFSoXEKgUjHgsmglOt1nEuAGHHqYg3KgK1Hu611Zp0rcElRMJC29/XPQY1To/oZOa4mACPjyeA42TGJijKEZj/Z8tolT0w9nvzdtF2Mbh61fBasdNaw33SyUf4R1iaf+5bpeMRA1AUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=SYDhtk2550OicEIdV4lXJL7qC1LYE+m5TmVw1zjXH9pIHP9e92MxaaqZIdB6eBbBc2BZQO1UTK4Kb2uNdwq3QPOBMAwNDMhAYlVAGAbimn0X+7Hq/Z61r4JgMu1UV+ku0GU23RYw0t4chHRRA1CCVYwbGhLngAdvJFX9GSUusCGbDfLJggBuolSCohsZZjz2WeyxcHWSg1gFUPQarOy9X6iQS8CYmpc+fT5+h4ZLLmTIrfvEhPyVkDJEOdxVb4TqgzTD7IDh+YpGNk+a2OcyTVUfeWMXAd/XhTPoKuPXbrwjpFoem2q+3ea7C64F2Ki7IJiuJCEIi0iKlDBGsKaG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=VCNDu5C0LVZBjyRa83gIKwYmrZpaszxBtrcp0j/WiMcxRqiA0ieR/OSZ+q0l6gJfPT3Y3yt3IOtuReN90KeAKGySCaxoazMUU5oQeDOlpYddMqJim7g/QRyIGRDUBpVEvER8cMrhhH1cKCP9CkvDB2hEzb8PLWKwLe48+s8BR2M=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:57 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:57 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Date: Wed, 26 Jan 2022 11:28:31 -0500
Message-Id: <1643214514-2839-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816b7041-d1ac-408e-1c9e-08d9e0e8f3c8
X-MS-TrafficTypeDiagnostic: CO1PR10MB4450:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB44508BEA767540337D8DBC7897209@CO1PR10MB4450.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtAIFmxKGZ/qHLwmGcF/ZjqX1VF4oSxXoo/nOWzAG/c4D9KtUVhDOI3gjhjjUx0Hah4MZYarc+sSQ8BZtfzC4s7aurY1Pj5nHVQMy0vRZuL5EYya6FnmJ5oOam+tpxB/r//tActfMkV5AA6ByOjWp6e0DWUPxQbWK4UgIBzGKXE/Nge/xXT8rOxj6hSaNvOpa3Q5s6QRVXpTvv0jHeDJ+KZoZSUIW/QsSMZ7lOkFC98mCjHnXHDRaUtdzhynUGKGG7IRSkg8rVHhdN4ZQO4F63fHfGrbmoH5uMdLFDSvsWUF2v+KFLv+SZGtxUWrbMf9rhr8VIPVS6noNukGBKZi8bTLewhq4RzytT85ZXsBenDcvVbjPhQYivgm48pCTjrWjNsoDykbDF7Kol9yzvVCyIAuHhCzeP0viDhvqrYiS/ua6m5bcPUElfYaawm+rGASk5RKZP17iqcYG3tNfcr/xh3v00e+pr6lQPXCw7idgkmjHrrAMB740UVasNtqF5eeKaIjWHJZ/5RxZzy7bclBIBhZT2BeDBMvVHOKun40oGsVZI+awgRMrzxZ7qxCMDvIidEfFOmAac21GLsGuume+m1jB0/AB65MVLRrs5KPBU+Mhz0bEilVlGqEuXw5BsE7yOYVCVqUPHEqK6baip+ffXbbL22GDKKJj+58Thn8ckYxcbrPahNtRO0scjY7vwKO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(6916009)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(508600001)(86362001)(316002)(5660300002)(6512007)(107886003)(36756003)(38350700002)(38100700002)(186003)(26005)(2616005)(2906002)(6666004)(52116002)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxgepdxGwMxsuPb24bFcBqeEvg91mqJwIzZi+ofDCjnwC2nhSzTGzPLRNVbf?=
 =?us-ascii?Q?Cxfg4DSJjzq8HrtaWnoGZtHfW347v28mHkDM/xLDCT7H3zfL3UIU22EQDRwG?=
 =?us-ascii?Q?e+psR9QzJuBBMnfMPwBKWAhs7C1crNPx6z2+23Oi1iE96qCF+s0o5XDu5Lnd?=
 =?us-ascii?Q?zlUex2D5ns3CQ7MOsqFbMz5Ux4HzD7LJ2m+S+YrRY8/dSMEwvcSjjhesNnGg?=
 =?us-ascii?Q?aIqRdF8Bpy/PJ+LgtbUXrn3RnWPaFrueZECurcqsG8iitmCe2UaKwK0NJyoD?=
 =?us-ascii?Q?bevTjcvdGm8UvHYssXmXLo9XB+fAzPdrTwO04aeqYeMiLfpOf4oYIu6lO2I2?=
 =?us-ascii?Q?rGH4il5x9uVvHG7EwuFfBP6cZhbkumklf0foYcri8MxTNEuyYpAVDLnagm/R?=
 =?us-ascii?Q?pdlWvulgZgZNw1imJ8p3Lj/6yWa0+Z1e2yXpYdDNldbHhOqD48PEmUnp4RRu?=
 =?us-ascii?Q?Di7K8lOqvOU2lT8thmxQt27I74iXnDRON2r9c8Z7r/MfSL9KfBp5uyHxoH/B?=
 =?us-ascii?Q?dPTEbufyV07vFpOGS7eaP1ZfT3Icr5KoX0saI9Kz1Jdjn1OWMmvEM/iUgoA4?=
 =?us-ascii?Q?qxFKUHoHH53qfYv2/ZBFZ3LVVQsYpAjnBt5w0ohe9orjyeKclbRVISDg6M8A?=
 =?us-ascii?Q?qWpzmThGhjNBUV5unuiD2qJrxHXqWnhQ1lQeYySiKaKmplbCHwKaArQvTXOa?=
 =?us-ascii?Q?YvvhEkN3o5FOZHS6pN1+AONqOuZ5VOIcH8/plK6a11c5CbEtM93ZQel20khQ?=
 =?us-ascii?Q?mUdXvt63MvqyMAz0COQBUqsnfMYgPjY5WqV2tZln1MDSX5Ejz1AtVocjrgyU?=
 =?us-ascii?Q?3PfyWudx9qz+LQJ/JZlUVNU7neZU13SEs3VJHRcp/B0b1KrCCKz0zpKKeXGl?=
 =?us-ascii?Q?0D1gWzTSCXZrq+TXnKODezNTsmaiB0CfP+RIzX5DQIz/9KvbEtFsOWbDEixp?=
 =?us-ascii?Q?pvWf197X8efJt8axXFESmq9/kaTRKQQK1uLKxRg8kGxTIaOQ8jjg5JPd6Q6S?=
 =?us-ascii?Q?Z4eS29toEmbxpnQw0lWkIv3nwCGZg0X5/samtqOZGaXrBXlG39jZk1FtD30+?=
 =?us-ascii?Q?G2RYz2DpcYgboJcC2lvHtnLGBbyR1kU243++VuS5w07N+SJlPmzbaaJW26sg?=
 =?us-ascii?Q?AQFYUGhheaqTHl+a4LEYO2wWsA2fP5vZbVn89NYgCHYFPeh1nlmV5EwkKj1Q?=
 =?us-ascii?Q?jYvZbaYyjSnfvi4NsGVPrVRI3f3xgSvTLl75XDMvGF0VH08/ZakEixIxutt8?=
 =?us-ascii?Q?6gR7XofDOLv7zLcc5rizYNCFi1usxgXppc1Z1Fbe/WXRfxu97kGKrXDrFHtM?=
 =?us-ascii?Q?ZsrxWNCxFghsN81k4b93y8hwqh5LIvdePjMwaqD87ipTA5+d3UUJgpj21D1p?=
 =?us-ascii?Q?+hyCfCkicNd2L5zCIOfRdC+jHy1Chh1XlhSgh/mUAOKTjpWcbwnZo38lH8GK?=
 =?us-ascii?Q?4i6W7eEgBw38TMDxAArFqyPRbs8B23LGAQbtllwhehRJoww7szE0ixujQR0m?=
 =?us-ascii?Q?9p12DcRLjaDzSrilDf1hzzKTAVOkO9OdlttS6aXaWcQbntVm5I9XABwWylqW?=
 =?us-ascii?Q?JyYl+yJjqIUV/9Dm2zpT+JHR3pFAAwuEwR1lvBYv3XJNNbuj5E3YfGqf4mqi?=
 =?us-ascii?Q?4Trqay6AI8z2dw3KfoYxkFRH0KsLL2M3QfPLSg6f6KBH5Y1mRtBQ6/gwCKeb?=
 =?us-ascii?Q?ipAkdw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816b7041-d1ac-408e-1c9e-08d9e0e8f3c8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:57.7741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGAUh44MEtEaN6OL86lJoafsGcJ2dJckw6p0cvWf6ZABCAzEE2ji59JyAto8XmumaAaqW5T01Y7ZMcvRYN6sVqJTAoeSOe7Ew08+JRr3qAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: IKc8jUzyF2b973JJR0mgIgS8uxxLS0lB
X-Proofpoint-ORIG-GUID: IKc8jUzyF2b973JJR0mgIgS8uxxLS0lB
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

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-build.c   | 15 +++++++++++++++
 hw/i386/acpi-microvm.c | 15 +++++++++++++++
 include/hw/acpi/erst.h |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce823e8..ebd47aa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
@@ -74,6 +75,8 @@
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
 
+#include CONFIG_DEVICES
+
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
  * a little bit, there should be plenty of free space since the DSDT
@@ -2575,6 +2578,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 196d318..68ca7e7 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -40,6 +41,8 @@
 #include "acpi-common.h"
 #include "acpi-microvm.h"
 
+#include CONFIG_DEVICES
+
 static void acpi_dsdt_add_virtio(Aml *scope,
                                  MicrovmMachineState *mms)
 {
@@ -207,6 +210,18 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
index 9d63717..b747fe7 100644
--- a/include/hw/acpi/erst.h
+++ b/include/hw/acpi/erst.h
@@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
 
 #define TYPE_ACPI_ERST "acpi-erst"
 
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
 #endif
-- 
1.8.3.1


