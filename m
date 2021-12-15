Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF596475C55
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:54:48 +0100 (CET)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWcB-0008E4-Kr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:54:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMr-0000oj-2p
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMn-0000Uo-P8
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:56 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEgO3D008084; 
 Wed, 15 Dec 2021 15:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=O9Yah+9BgDL0QkA3d8SCCSGSCokotk/bgqZv2YM8qtuXgZTZAPLemh7WklgIxBM+xNEv
 rxfQh8/9OTp1wOmnlg+gTQ/dypvaY+M9NrED4CQ3Qy4deSKDIeLG/a4XH3+IwV9BXxc9
 ioxZUKCkM3iCvZGBeRnKxk/sr5VPX9r3T2Ezzf1s1RscEtYV0J87Xq/zitl3W/93w9Rm
 b5lsdl9J5VSiG6WqlsqeBA6L4jpSQhl/miph0FRBBfFXDjboteatfS7ih3Qsb0XXD8pk
 fe3NkGq8TibcTsTw5aUumSlp83cFCLj+4KhGhgwnscv3LxVUUP9A+KVG9I+jE/J8MnGp aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff7b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWwI094240;
 Wed, 15 Dec 2021 15:38:48 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0ww6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lyq6fd9Kma4pGHYFP5DcYzSpG7c9ugDkbcJ/A3VeW3BG99um6Ijj2p7tudrj3cV1TA6PLb7YTsVXvs6GM50769gmCTm3x8ZEpwyItYhASCh8qWcy4+50BAWZevo3zAKE0G9QoEPs4Glkr/2dyTlbz9CXg9r/LrLrGAeSRbka4NZlubnWJsgWzSh0wxl51tfRN0gExJILTRT1HeNyxxUO8NT7AG1Qv32DBapjlvH6nFMEno4cM1hVLwrDk+jyTQP0JSVaKAFXulxDU5tp8UWnnd+R5mmaO8A3JAgss7R9w/yaRFSWh20ZSW7MttgQekk7OCVJxoJGYITahso5py9+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=HhdI6oeNWi+LaqpelLdTKtMH5aFkXHyWiHl2z6nAJz1rriO4CXJLMAnYXeLO4+GXIFuztrZOTMs9EHRm138amh0QIeUO/YZqn9gVwv9VlfAlS2rjLLTHFqa6DHuG8C4z5DXasIop6y9BZvs5RRBUJlHeG5gmeeuHrte/3+8AzvNtt7N7d5tE1Wq7+orMUram7ngAB8CpSs3FnrOXB15Maz77Y5Jzd6R7P56j2T+pnOW3CuuW1o7yWRuZmm+P/j1ELBSta7bZVvcKfbCGgTA5gh8E9r1BaZ2u8mxrrodc/gOIt5ueA5LGsO++wyawb0KLrDzWKTqQfey4XkuYIvCsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=KlUFicyvlxsrm+RgwuuPc1dAav1aAlhZDcjN+9tPSd5gSpq6xl6VreJLhBPmAPk6UuKTeNwkrQ2PaEsvl5atsISIHKGsoPDsYtU9x11JZMSZ7+5IyUywTHBjGA8ju+mavgA7/VC4Y6h/RgpAt7fYMgu9v8moxKQ7/4GDxi9HYf0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5474.namprd10.prod.outlook.com (2603:10b6:5:35e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:36 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:36 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 04/10] ACPI ERST: header file for ERST
Date: Wed, 15 Dec 2021 10:38:09 -0500
Message-Id: <1639582695-7328-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e0d52b5-b3d9-46b8-0f20-08d9bfe0f558
X-MS-TrafficTypeDiagnostic: CO6PR10MB5474:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB547470B4D3BE9C26F247854997769@CO6PR10MB5474.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9QDn0V9/RAnJ9/Q9UABbWRdiP5XoaO0Og90Hrfb3sfJZ08CQOJixcpSjGjCLiNVm5N39Rh6m1MRyZmj3wNabgIug6OC0IjH/2Gj4ktNBQFrVvcJwxAswIMY9wh3/j7kyVcjSdHtLmY6Gsn/yrB/3fdXJGdl0fzcmEPjOjSV+QmhHtAilpSihDUYFLAi4BphtLLeAopxs7MOza9pMSHhaKp5uN4VVdDF5j/1ASnJEODmz89WJaRlM+9UIvyw9L660O2Lpb4jEgkr7pmt/EEoVl2yJhH1sVljHD4gkJBTkUWEWU8I8ijruVedvE7ErGLzcrWpOWZDn8h/xMYbxVTuj6/ChAXZKrJoNoRxb7jw7mz5KFoVsM8w2XncOE7Gw3Z0ZKZWjJ16+yWcNgFA1KPLS5z7txwpgn4ZSYfiC9G2wbbH4ordza9PZdV1ry5d9DlaU6V5R9Hhz9j3BlH1IRgs9sIEKni5BYwYUYxPHRJXmfaha16jpFiPDx3p5oZM+71PWW1EVIXJNsRQHi6ctgFiGisW4w/Pf8iwZeykix/VA2IpCwGw6bEiuogBmeOGG+BNzCCJb5NdlAfcgo0RAFt3X5ZWVD9XPYDLlqH4aMsmrCaeJLVL+IQchqAsJud1ZK3t5rcHRnvAh6oQ9wTevihy8kWYwTWjGGlk5oM8UXNq7282l21KVxyFIRpSzvGwUZXhs/+SlCXPya5t4EnZwGbh+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(4744005)(508600001)(316002)(8936002)(38100700002)(8676002)(6506007)(38350700002)(2906002)(36756003)(107886003)(6486002)(26005)(6666004)(4326008)(66946007)(66476007)(2616005)(186003)(6512007)(86362001)(66556008)(6916009)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTzZXN2n8NOGfHQsvRnXO63H8gmbB4wKG4MB8rWP4aHWb4fX0W0G1LbKJt2i?=
 =?us-ascii?Q?xn9kw0KM57D6eH5p28N3lMlAURw6tVM59F1YTU8/ew/4F8PfiXGtKFjkkT1r?=
 =?us-ascii?Q?t9LUJOd0YRhw8X5nvl3aaBkw2G+6Xs92XwMFKxtxW+WwX5Hd4guR4JHoe8tt?=
 =?us-ascii?Q?unApwJr8peQCwMmGq/81NSPAmRohHiH+iRlPHOiyFFvEW6JqqQpIktC1UVjU?=
 =?us-ascii?Q?d+qPxHy5Cbl7KZ7fi0+EQyrLWgIc0nDAzkGr/5BZCP5CFhATh9wPGs6GolJt?=
 =?us-ascii?Q?OVpsFJJ/Wd1AJ6+VJmrmQ+c3qW6OBG0lW9CD1LzxOA3rNtLhMIevDwbMrje3?=
 =?us-ascii?Q?GkRJoRM53lIl5/km4mhby3lQJbx1CmmPwron6bidu30VkNq9zNY32kEmK7Uh?=
 =?us-ascii?Q?k/d4175o32r1yRwKcxyp/TErciC7qL4uOtohkEQUBjPvoApedx6FDIQx+a/6?=
 =?us-ascii?Q?YfiW2Qn9zZA6VLlwr0DZ0h/MreJJwDotMOEWzVL4f5xjrWc3WhAoR3ZH+KHe?=
 =?us-ascii?Q?i1+lVIb0s/HKAHU4G5Z7AUgOh3CDU25tbV85KyGaKiqwQusPITNOUmu6nYRU?=
 =?us-ascii?Q?XfXxqDHu9JxsdNut0z9Jo52lWNlIiR37zrFB1YHXVb5fR42crHWEbv3eRcY7?=
 =?us-ascii?Q?P3RZ+3ZzwLKid41qAsec8oKP1iPP6pTlcoFOZiLMQ5/pnUAJK7LhNS+KNTdV?=
 =?us-ascii?Q?fmpwBKg6vgRDkLtSBrt/KQByVHCtDCxFnS3awsNVQYnjD6365HLt2SdKgmG/?=
 =?us-ascii?Q?raj338QbNszZ6/kOfP89yw1U0Rilh2Mx+yg8l0VKBHjuG+46MxBKJuLG3BLs?=
 =?us-ascii?Q?bIQjIO8j7Gkd9LZs+a1OriYGf/ixX5k0/je/BUM4oEo9THIQiisns262EXhI?=
 =?us-ascii?Q?QdKGIl6yLdh4dEdQzSh66yrXiMIn3nwStyb3OWH6s2ektJJQyIOrZCUQCXtG?=
 =?us-ascii?Q?78VoUu8TP5Gg3gElmFAjsD4Qz/3ENe6XAk9IDJVaYRj8wS+6FRxG2nlsPwcs?=
 =?us-ascii?Q?q7oje02rojprxXCcD/ROblWYAYM35Hw1510eTlseCeF3+cloN4cgL2TI4wn/?=
 =?us-ascii?Q?LFhyCky5WXC7KHG70xFGjq1fMdwiwOWILzJddfqUqxaDY4YR9ChlaKu+J7E8?=
 =?us-ascii?Q?13gErSUsYKPkWmFlfPpQ6NjCZ8vfjNzCJuofEZB8EgB0dsYD8rLfKK5AXI/D?=
 =?us-ascii?Q?xGxOlx1w9f+xtvTAgj46NOA5u3Bza0qFw/mpK8rk4fxyKvEInsHfAj1qZOda?=
 =?us-ascii?Q?M6+7Oa/Bjl0BEFERknbp7RajTmwTShHJ2dLByMz/DW5UT247wH+neyDlbPUR?=
 =?us-ascii?Q?5hEAoJydkAxe19FILA7KKdpkDwe78q27CoS8ttw5NrUPmyiuVIegM8QoS46l?=
 =?us-ascii?Q?PMFsJJmuUgXAwe31Gvonwe/4DKHpTap0YiywHWyvTncyc/R35fOi25fevBYp?=
 =?us-ascii?Q?RjRtEJbSiTfmdqMwKLxAhWFRSi+CoYYhs22+k+ld67Yr14peYYyxQUtarxWq?=
 =?us-ascii?Q?TqY5YDcsB+GNF19hAnY5wJqMt6upUdVp18J7Z33lIWccb9my6R+FS6x7fd/J?=
 =?us-ascii?Q?i6sMwbC/kMcc1LjyNs4n/SJbwsiyFb5DmfSF7nfFu/e9vY05pCnlXu6NgOzF?=
 =?us-ascii?Q?Y7o5aW30XXcMzTz13VXw3I7V25MssRwRZXoVPOwGaPWZfZQqu/yp4THtr3g+?=
 =?us-ascii?Q?8fiQFQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0d52b5-b3d9-46b8-0f20-08d9bfe0f558
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:36.4872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35l/iBnHwq5MiJ6Zc3u4BRIiuJdTxwVyvu0AL8FSPK9R27ttBz0ayko5j0U+cicxvb1VrbqndCFbXWudNx+cxfR+cEGWD+BcInwbBuaQ0wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5474
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: Gc8xry_zsKVV9YwYEoJTO502pk-jw-nr
X-Proofpoint-GUID: Gc8xry_zsKVV9YwYEoJTO502pk-jw-nr
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


