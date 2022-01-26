Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B9849CFDA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:39:17 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClKE-0007hX-O3
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:39:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAK-00069Z-Lm
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAJ-00033S-1Z
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:00 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFon0c028822; 
 Wed, 26 Jan 2022 16:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=EgXHMBHiYaf5xBaD1xMt0/gHgbeuaToeyaaX/arcrPn1OnVb+lCm2wBrazrlhuo/6lzI
 T1LAT4dMvEmGVh5zdmkr11A/Hb1kMANDWBgc0AFlPgG40SVOYMi+KqdiBSe7LfufDWNY
 ucp0Wysrjf5VRWMcihJlAyU64hE4Ld33/I15rQCCGTHf26p9dQzQKJOMyh73+G11ekPa
 j4PkXnqkpW347qrIysHsY5ICAd4PUSAy71Bh8eHUXKpQFKLSAP5GCFGIi7iNJKuvAI1U
 l9d5UKrJB7RRHIrTF48OPeODV9Km4uaaAtIS8cJ5iYA8bX4A1yibIU92oVJXaA4+GnVx FA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaaej16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGBLVD033512;
 Wed, 26 Jan 2022 16:28:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3030.oracle.com with ESMTP id 3dr7yj2fgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i42mS9dKNhMbJRyUD+iSAwaKhin6Je8v583cEibQck+b0xFsnOVA73U7T7QLwTPjjFyj98Lmhj6s2fpfdMiKEu2c1kvbOnNKAXE1gJz0v1LAMKhbXwOpXKYpxd+rmsmHUr/n9KHyDOhaNKhOMpZVdVY/NK49FWscp/dmUfabwMxxhEonebXh2/nffEmpOwiKK9utWQXXokHfRHExDh/aHbKu2QxaHRaMguh3lcuFspfPzqAZgRkYXLeRBuhh3UCaRB18PSDmPmqbrJ7/FLhfZkCRgMSwGwxSjEl6xaKH4xE7vODfwmPtvxR9i3FNp33RxuwUhvE5hqka/ajea6VtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=CHmH4kNflZriIcr6kxiox0VmAwfYanGHBrtABHQtFAqsrSy1d/rCH3k6gCwD5Jc8IOfMhl1mya5OslFCVDoaPyqkCc8EaYhv6vFfmwEOIBU7jd/g2TBTQP2oWfKqr9goGMH6l3+UIr/tKLJQ2UV9P/O3x5uxlUmX/rL7hC16YypJ7evXjQf7AQde7jWD3oTQFgKLyNNfdJZLNxeec5oQBvLPpTsGKg116je/1xGehpG6dmNTdn02Dbk7yZkVGme3HJsoapZsORjRIV16bqzlLobuGI3uwZoof2EdN9F+/gQG75g/Zc234VK0lYxnCHPYMNfdt78CmqoEoVNfNlyZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=MCb4DOne8NE8/xlgFKqaArZULM4/E3fhNYrg5VNYFx4CpbTkTYFpJvJTF8Ep75PbtsT01KIlWORNlOJGNji7NOaMMiQPh24h/FCfHgKsMru3fnCz5Hst1UcSKQ8q2jxf4jl4cGqbv2w+u1CRGWMrlclvMuFwQeR6T4DMQHK1ihc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN6PR10MB1571.namprd10.prod.outlook.com (2603:10b6:404:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:52 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 04/10] ACPI ERST: header file for ERST
Date: Wed, 26 Jan 2022 11:28:28 -0500
Message-Id: <1643214514-2839-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2595358a-fa9d-468a-d024-08d9e0e8f082
X-MS-TrafficTypeDiagnostic: BN6PR10MB1571:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1571ED022C1561E8244DF85397209@BN6PR10MB1571.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lialu7Fi1gyz3vqHuCDa/ivKkRbfnwX0aS68w0bu/jg/Bg56+Olbhj9q+tcj0uWRwThiwv8p0weHaXyepe4TRkCBqbc5FESvhv/ElRooQXcgbAJ5NH4FT4M8MBV8bHa2IOdxY37JsTpDyu2acBzX06PqbgB0uDTOvfE2Op6yzHH4CXnhzRkzD5A8dB+26sNFYv+48WkHqmkuO/tZhj4tnj1CdDxKIoh47sJDDqZE0SD1pesr+itVOGQDG3/TdPvdzQIkL4I3HxeqSthy+3J1C8H3+5QIMN+8dqeox6Lo0ZjQPyfR3CcwPHeC+/2yLfzgWQ2REAXPPIt7ewwrQaDf6HFbk9Ehhv8WzyyzK+emtcGs/OOTRMoGGpBZiao8cddLgrgW4eWJ0SC/7PTRc2nVf7p/kBmSPqJLBYelN0ZrsEU5ROJFwqOSlewPn58ZDU2f9LfzHpGtw1/oHWCPq0HTFu1hMGlQG2BJk4r8V3J2l2iYUJowojPXNR6JJFrFya/BcjxyqldIxs6KMMNujzN6npKWR5rQltYW+4bzUXA9S2yUdzEitUJFKYGrvuxWizWPJ7KC5oZYHA5jpzom21v+9CW3brhyJGMVLIKG+MmyXX6YzDmM3hGbDh1O7RAoxvEL4YZ7JWEpBBn1rFcifftvzOwR3yLpzf70p91QuHsej55kMiWus54rhCNWP1wloI4PVDt3uTr4MkmZJPQ5e5XwmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4744005)(6512007)(66946007)(2616005)(6486002)(36756003)(2906002)(52116002)(6506007)(508600001)(5660300002)(6666004)(66556008)(4326008)(8676002)(8936002)(6916009)(26005)(107886003)(316002)(66476007)(186003)(38100700002)(38350700002)(86362001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pHD0t6v/Vai6YaGIU9KSvmkZwBPlWZyk5xzikhMcOvkIuGooLqeGp368zLFq?=
 =?us-ascii?Q?mgej7H24b3lAtplJCajvdwHLO1NwB0eHI/eET/QcfFhpbtcw/XJT385V7NnX?=
 =?us-ascii?Q?zcVV47e0kpTWPd4mF/W1rTI7Fez8BPKhsunEUwD3lyKv5FIX0wGTuxweb4vz?=
 =?us-ascii?Q?RlRrds7apMW47wYqZKaTzSVYB99jrlZg4wsXb5TCqKNdenYeFcxE0Eeqy+ay?=
 =?us-ascii?Q?NEyBgt5vAC0wnS1v4niasNUyLWzGwN1g8luFBxhei0cy4OS2MKBPpr9RYd+Q?=
 =?us-ascii?Q?rXjjd7lp46e9UStEEZkJl2lpbAEZxsC0Yeb51VmHhdNUUW2KdwApSE/VpJyj?=
 =?us-ascii?Q?39/xBk1V3UooyEXD/N/XRwuOSmcP9h4rHs+lVJe/fjM9pdWo/Hq8BHSdHBCk?=
 =?us-ascii?Q?MPUwscLfT7palPBAZxeQjaAOCSPT4eb0NdRFobfYZrdwSFcShKtcJl74zOrN?=
 =?us-ascii?Q?POt620FprU5TA/G20Z1A02reNPXLHdvgjMgR0iBtJHpyGimJDhZ8wwNWqenu?=
 =?us-ascii?Q?8JcT7hDbVnFTB786Suw1uDr8aUxZVLIwpUImsbL067Z0/WkCWlZ1Iq+tiLdn?=
 =?us-ascii?Q?bp3fmCkyZQbDHvK+evGRJJ/SQEwO5w5xYABV5mb2ESgk5sJjI4+w49Jz6qki?=
 =?us-ascii?Q?s1f1KDNYl+xdlA94whNWK7jz90VAoE5fR9LatCFMf6OL1CeOC9okMRXxCJph?=
 =?us-ascii?Q?dmTq05AcexNyzOZ4BwPlr+m5O1qC9H4OjA8pAV4Ph4XYIj0moFDzP2w6X1gA?=
 =?us-ascii?Q?igInOhnzNUGSGd9XTcGGstdemcoL98cBXYU4RZ29+6mvqH+mqWmcrTmPXBp7?=
 =?us-ascii?Q?HfbaKIZkMFkZE3z+h1EY0I5KcUwdg8tnjulQYFf2DEnCtp0bIUIsEKyVBzHP?=
 =?us-ascii?Q?3CleBYDWOaWQ3Gc57nmrfrpyC1mhJwx1eGffr0Yv/LMhXRdQ3bbVL1KnMPwG?=
 =?us-ascii?Q?pQntr+RS0dwurPQDa7bN49f6yohfch6b613nUe6u2lajBHE9HX1F793wqYUz?=
 =?us-ascii?Q?1uhcisWdM50qew/RiytNfRN/8sjNmKJZq0VTJ0S6vAUjGQkJW+QgATjS6QXP?=
 =?us-ascii?Q?jbH70UOmMy958asBd2jj+juWWABxCR5PjR99J6HohnMC5mWt9gwsTpR33MGA?=
 =?us-ascii?Q?PNbBIznbkb9oDV1OFRUm8Ic3POD2BXfLLICpoV/KMfSWKjOqFfoLcNQdBiel?=
 =?us-ascii?Q?S/OL19jf9lRsJ3xanLRPk6aAeOevCh3jLVqYJphCmtysxQKWXjKc33bHg9j0?=
 =?us-ascii?Q?EDpHO99sHYCsmUeDYKXWbvarqDafAC+S0eOvb00Es5gLA/b4fOgyRm9S2ZXC?=
 =?us-ascii?Q?thY4Rp2utyiULpXKM1GjsDyuQjV+Fm602Ft/q6Wxn1twHNqVp5Rd4WkCLl2h?=
 =?us-ascii?Q?FCw06OG05gFD9RQv36QlhDY9y+KI7ufoEEePr7CwrtlkHWBr4NXpaNU9sT5F?=
 =?us-ascii?Q?K4o2SrQ8uXWXP3abtFK7vO2n0m4zICeKlnOy45nUhTE53ZfldU40As2SnnLr?=
 =?us-ascii?Q?1RfWCFcfFIgXww7/kfNVhzjlVdx5lCIRPDkeQqNBej3Tsv+xEX0ay9Pj6vc3?=
 =?us-ascii?Q?tVeJxyUUut62SWJ2bbo0llmtE+N1+HLxJaCXc5dVAON7skcSxyo3bxlGZtvr?=
 =?us-ascii?Q?5vN8nDsKbiamowHzvaSg+7ShysYxARxjEWX6tu6dgAnZiME+oWwyL58hnT+1?=
 =?us-ascii?Q?TWSxsQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2595358a-fa9d-468a-d024-08d9e0e8f082
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:52.3493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zzen3isAAUumr9T0YrZ7Hq0BtlntXS+ZqVOIIM1OKDnvSR34lLHAN9zqzR8Qk+kEV4HCNvenMxckGC6nkcWef7avdT1WE8+GtyUWJ5hHeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1571
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: eO5RmcXKy63q_8Hrz2Ovlu7JRgVa-cpU
X-Proofpoint-ORIG-GUID: eO5RmcXKy63q_8Hrz2Ovlu7JRgVa-cpU
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

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/erst.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..9d63717
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,19 @@
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
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#endif
-- 
1.8.3.1


