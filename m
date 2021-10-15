Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811D42FBB4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:07:31 +0200 (CEST)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSYE-0006i6-Dl
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUW-0003uk-N2
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUV-0007jy-3J
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:40 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIgHiA024951; 
 Fri, 15 Oct 2021 19:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=ScSFAwmqzhfOLFafajzHE1kps1OMIZWRdwhBdZuPhxmb3kP9b8KnBgHbiLBCi9M0B2lq
 873G/pKLL0Ji9jEXGChYIENZWoJBAT6DHhvcBAwYjAD0mMYrM0gIkxLzadn4+azamcXw
 8GOGDhx87/TVux3BWexAKsO25JKIdECxEIQSOcfD35SOE3z3Qk7oO44cYANnHd5oz2ML
 tnsEASm2MjK6/OoBEGxOU3T0RCW51zCJwcPm3MKMl1xBN6tpmqkKGUA9CdJgBYljMTdP
 rbovx3lYHbfJQB7yhjYsdi6pq5xPAjV4X3jpXWrDArRBzXMn0K4rnArxRxOdUNfEXDqQ Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgfser4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ0bbr082576;
 Fri, 15 Oct 2021 19:03:34 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
 by aserp3030.oracle.com with ESMTP id 3bkyxxaq0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwjLHyVKlp514Po1yXtfQbet3/HE5RUtkv5HsRzvqGyV4RqGJfGs9T6+ASkhI5J+9k6BqTgj2wmzUhS4r7wXZTxq5z4sbgh1YIkRqDXGRhC7SO5ejS/Af85hCcI6wMZ5A68p4U5dRkGHw4id1MKdizTebgDbZmA4WLJmD2hWr+zwEClmiIfZBO63hcoBOfQXUfpKp9W6ydW9GDckOPSEx060gpoM2p75OCAFs5cOVLH+hc9C8TP9kjZrF0KTCWF3pp/Acfiu23cZZDYNlHrL+2uAQnBW46ljFVCt+/0hxABnbF6NfT/pq9YBNJprg31vAQrn0aeExr0d/p02ZsbHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=cYY54kvz2IrISmAik6Ml5w61xrzJexa3NT77G7Nh6X43OqtVHEUwfIj3oUiIYbORF81CyeTe40si//d7ekjrSr1q4DziRhOd1h3yEFsrcPvwngbEpR9fl/BzSkmf8wiuEwGDOSlZU9i3Px31nHFzbD2AAB6jDFrMbgkK3iWeVMWydZqn2MChB4aVGkxIaxtco9kgPSvSm6KVNwxGYWqpZ1q38xU6WUfQIkQ1DHQbt5Ms+8qCuy0cg11NlXQczpqYh9d/5YZjwYJ7TmV0WMfsKaxPprVKFLYM5NGAB2SsRQnbVwx9LyIApf9O1B+3uZcrHgqpgVMJgRO2Qd3nB0iflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=T9M9agxxvprFiUt33K6AwFnrOonRt5Cqt4FlE+m72AEP4NCVCCKy6XxJiLnaMYIi5AGV0q3iqLdZBdys5gOwzbisfcKJQ9MGplQ4UcEbfBPaeMGlOLI6xH424ltVrRnKGhoQ6ltgZzASWweX++MBpFkh4Fj4oU8suaJToij7YWQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:32 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/10] ACPI ERST: header file for ERST
Date: Fri, 15 Oct 2021 15:02:54 -0400
Message-Id: <1634324580-27120-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6579e7cd-3467-45fd-74fe-08d9900e7b42
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54414488090BA1D7B2C02D2697B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VEjVTm9NJWv0dJNbHFdgPIiTS+arp0VVcoEw05EJzjbxQfGjhcMjqZ3Ot8mwRmN/5i8QEcFrIWjg7K6463C9SDA1j9YqGov8kajV/GQN6SE/aB9damdITHxi95lT64lPqj6MQE1VTPeRXLG/GWzSGsUAsYrXhy98eIsBDRbLEDtP6mTr/cZGS8kvrZ9Kpk6vNzsk2Ayp6ay6sFLJwjb5/mme7MAcD8rH2h3EV7+Q0vGnW9ubPmIDS4wjUMLUssgdQd2NWzH3gH/jhOjTht8za7z/dIJBKZnaunMwQ7PAp9Pca3rADydwXwx9OCXsJMw2+KCGxR8Z9d4MwT50SytcoEbIfomB/yI6h57YI3Pfb1i9ii4EFg5v6QMTpxa3LcAzWVsC8tXLu/BTRW2Bllz1k9pFFVTfStotYKqEu0W6v0u31EslYWpou5ZWJCvwP5E12Rv2fdJ8ynhznYZMLrKmObz7GsOLGh+U1psCK1P8TW0K5CxjgDhr/Ak+3FCfj/SBRgUu8ZBP+DcPIOLtQOuDVUf2KxdeO98iPX3XMNq7xU5UReY6XaUtbG1srwk9K0gg7Ms7NeV41VBVa7gSWyF6VuXe6T+7XbLkr+HVtRCtGDJc/7A92dEZ76RJSc30nleLthm77UejGDFmzUqZ9AKnCs+Z0L+qGYa9yOa89wqKB8pVBtDzXZpWkgVA2jdlyAobcU/TWzq+Dtj/XoQyQFD9qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(4744005)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Zk2NNqmJZJjPPsbtXCK6SjC+Wi1cV2x/ggPM13QTeZxVIBs/VJCT4GizgUd?=
 =?us-ascii?Q?obx3U6qoq+jUrAxVtJu3zHky3+LmH4RPJ0aknCPe3HaVYP6fXkPk4TJvxYdE?=
 =?us-ascii?Q?jlzf79JvPvce9kIPP7yIgqCwTX/rz3mCvzotNzW5j82YbzEcMjgwnj2yLbyf?=
 =?us-ascii?Q?UDLEXaafkx+XJ8xOVhMdYW2b2l1U0+kr5ge2yG7BUZtPEKd6PYZyjF0w87vG?=
 =?us-ascii?Q?LP8iduzcHRrAAFjW/lFfIdtb3SNoJlZopUEKLjeH0UYs4Yuqg6kDsO1eeXnI?=
 =?us-ascii?Q?04GT5jwZE1rx9aBvWt65XfJhrtbSiSa2HZPyQUJX8tKCNgSXIBOMNwoRvAH4?=
 =?us-ascii?Q?k3ecKcKdKCZbcUnvpUPMGGvbKhwjmKm6AF7rpghxPMGV7riRnXk32u4lIZNb?=
 =?us-ascii?Q?ycQ9SMA+lUb/WWBkXJc5fbhxx4ScGhh7QI3ERwJw2zztNzMFAJe8slfkujDW?=
 =?us-ascii?Q?SKz20KKiL6qoOJw9NM07qtFz9kneSME4MmNi9fUSt3ni1VFWpSIzqE1xtyc+?=
 =?us-ascii?Q?Anid+XZYc8C4D91nRbaO63QejuQOCLRH7uZyfVs3cdkqFK2C1D/d+prg65d4?=
 =?us-ascii?Q?EVRKcLYzjFmEt96I+wqljvZdgAJF7XrZqa2189p9xcluwvSlw22ajojrhOGO?=
 =?us-ascii?Q?drKj1LmT3eMyEK3+5/psfpx+YDRnFgAMbkT5eVH1mYwwFX18iCZg3zjl8WZE?=
 =?us-ascii?Q?pqMUkrUpOhj0VX43WQ5Sd6iV0ggO4r0vRsNKZvuhx/y6mtNtdzw7V+kWFmo3?=
 =?us-ascii?Q?dSVA0Sa8fF6E1OHygceHDHDJUuF4KaweI1lbkWNbQUEzD1FN6YOt08qP56gb?=
 =?us-ascii?Q?cXYLko29EPDg3mRo2ZnY28hdX/8jiwpGy8hcp19M8eEAPJ3VvSZr88WeYJP2?=
 =?us-ascii?Q?AaEhHGlRABPyMBdZ1qF6kDUnyXLEuj0SEDCHmqcYPxQWZXSEu+BGHTshLSo7?=
 =?us-ascii?Q?t1TlDcs2Q4dj/MsqKQtjlkd3zecEKCadydh6ihnc3voORJ9iwzIk2fswqU1d?=
 =?us-ascii?Q?2+qzsqrFJ+cgOp+5KbttAe6jCxWfSN55lHbclDOBdYQBK42XxhNhSHEHNidy?=
 =?us-ascii?Q?Trubvw7qqJD2OHrPQdk0Pnq4OOT9N57h5cDpvUzUqlZ45TJTQ/hO2KNdYbna?=
 =?us-ascii?Q?pkIyBlMxoSSEw9gvX+0Q27ha4kvbxTgmnDnlguR/XX/SVd05Ml80OR9I8Al9?=
 =?us-ascii?Q?2xBJ7fVI6Dzzd4e9pAxWuB4Leuw3As8lOUULmwrbxVTGOUBLQ5+s5D/GJYQY?=
 =?us-ascii?Q?VPpN1kV3wbb7VBsqFyUuHVhV1RWHMc6f7ZdoFjsEtUq3imy6VB+wWsIeYpCt?=
 =?us-ascii?Q?B3hQglNFYp4gujFKw46HYYWg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579e7cd-3467-45fd-74fe-08d9900e7b42
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:32.3153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3aAKdBsg6jp5CrwShkbzKYIqi8E6kwRJmzzK2I/VFeefKdLWaHIZTHtrirECNjbDNna/8HV7oF3iLfxXTHe839yIu586d3b0XjiDEfWLuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150116
X-Proofpoint-ORIG-GUID: 1C7VrbsMmAb2BbRx9FF86URjvw_GknzV
X-Proofpoint-GUID: 1C7VrbsMmAb2BbRx9FF86URjvw_GknzV
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
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


