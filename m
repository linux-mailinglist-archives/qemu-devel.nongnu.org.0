Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4F466A5B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:20:47 +0100 (CET)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrdN-0003rR-VB
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSm-0007BO-4C
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSk-0006Nc-7W
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:47 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IPJNH015766; 
 Thu, 2 Dec 2021 19:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=r7nwrnGRl2gkSYbtjAxYXIMnCyPNB1g9YnGJOvn/WPeDpi20ViAqMubUXBucODFKrSzY
 zF5nAzu0SqOUiKmOL+j4V6Ezw0c7hRMWkIu7gkj9m5l4ufwGnuaVc7cJALAqmPS/H1a9
 uKVNpd/Nhk8TZ3Fm1sSwWbUvQPW0X7JtYDWGQCFnp34wU27jUU0VvJu9eI+t96hwsSEA
 zT4nGNBv/9wrYQ9wBg79rPcJRkCau4j33z1C47hPpSFZjA8oSUZnOGOvHYR+AwfDIt75
 cIgS59SxcgDLGabWLh2mUvYppin4gbD29XD1h8V9B+v8Bmy8sOrPQjJ1jFQQSgUjjo2G 8A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp7t1t6wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IpgJP085846;
 Thu, 2 Dec 2021 19:09:26 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by aserp3030.oracle.com with ESMTP id 3ckaqk1xwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf3TKSX76d+pa8yxyNn1qFyVXUBwZYpsQac0LbUeoc0udo7aA8zEyY5HoJ0puxLcxSVHQjHivZoxLg0ApsdfpEnmBKQE3aSi9p84jmEpbRR9m+nTHsIL5K28QwmBZ2TURKLomSLKGCU8HTEHrb3R+4puUf27j4r4Ad8sTV5AiKNXIA8WoZzDWkj8w1l2nfo39KQSCtLAQ2Gs+k7nRbZd8OPuTEmiUX7cVZH21gP+d/TUDZnyn0+8z1TmJbtHIK158lVMpM3Q/2Nf+Stys5qj+oNpk07sd3LMgos3wb9UNKBkN0FuSKDjt62mZZqyizt+JZRse8hq/XrzkPBQerEoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=KzQRIImRE3+WvutJcO6Qy7eBBc+d/AmALp5FEm9WHvNz+uEJZfdpsVq3/BuUcQTEf5WsdUbkZcopCiE1Y1mghR6oZ/YMceGHFU2MyALodPQQhkGRH90iq4Rt4I+086bGov3ht+NixTltFg+DKDNlVm/M6l/C2B3kWsFL67el/YZkiRzL9x2mStOIjEuuCPUEnivYxf+tHjVbQ/P86VtVibud6vtTvzGVpoC9gtGZvQjbtxXcP0n0lrZFaau3q/CmVJ8HrpA5yLpvkZkgG3KuvT3mtdfon5cQ2hxthZD2/hGJRiAtHEyuJWmt/pieIKHfEFtSvpr6cNWlEoSHDk5cGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=AzQR+/gd9+V6oNLoTp5hGcHyjGp6BVsqoMljNN+CHbeW6o6E5wE0UWTgsP74Jg49Tu9jsLzwGo1A4nAEilAEcpt3JrbaENqV3gq3ay9zVbCKvnB4+Lq+1yFqgS4YOoK3+NByWTWUJZLRLiexjPuWCqMDJRNgM+SfvkS5NO9LJ8Q=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1760.namprd10.prod.outlook.com (2603:10b6:301:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 19:09:24 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:23 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/10] ACPI ERST: header file for ERST
Date: Thu,  2 Dec 2021 14:08:56 -0500
Message-Id: <1638472142-14396-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c290a90f-1967-43a6-7245-08d9b5c74096
X-MS-TrafficTypeDiagnostic: MWHPR10MB1760:
X-Microsoft-Antispam-PRVS: <MWHPR10MB17603CD331251CBDA30271E497699@MWHPR10MB1760.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BqX29643LkW/P56MeVVyE3sFgSD+Chf0wqqnykFMosxpFQ1NIZgShUqP2iJuT0M5ZTqfEN9+XRPdCm5nAx0UL188qMplzmwEevxkzduI92qTqfY3O9hBKYmAiSS07yPBTBqSk2GGAXvHP/ETkp7IwEmT0VbAXzoclUhIHoPR2eOoauIqos0J3ApAeUehQdhszVMhxhSo02sXUJExpGgGrFMQ0kxf6nhnhn2h96c1y9d3ogX855P2+oPqWVJN5nr41uhEcP2KJO6tv78T+cWknHy8g0lKfHdgly0mBGFzmHs9bSFU/IsBn43rk6rtURI7L/n5kmJmLsvAj/fp3GNLpYsQbfaGN0yA0j6QV+t0+l3+7pBduYplsNclb2lqNpTgbY/k9j/lSuWw85GXzLqlgMKDRI6azNa8pLm4FT5aZtF+KtflCiP0Vf5nr1QRcjRPKGc2dAb3jjbGJDEbWSqeukIe8hBrRX3xwdkbZha+mQ66s4pDFYxSrA/MFpE93Eh84Nck+GUL9QiQiIdTy2TxUqMzq8vrKygzDOkr2Ct4wpnmNuulCHqAb+vJfvm9s3CDwLRCCS7SajcrkufwiZt0prtFLIE8E7e6MTlyMxiZ7/VlyO8XVijSvAdBFKwcC8eMvlAz+ixlnSlAAc0fPWqTnvdKKq2Sc1bTdnFya4HCmu/h50D86mNTNDJCQ9atbHhuilQU8SgM3vmMbzgnb0qM9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(38100700002)(38350700002)(66556008)(36756003)(316002)(66476007)(66946007)(2906002)(4744005)(186003)(6486002)(8676002)(6916009)(26005)(5660300002)(107886003)(52116002)(8936002)(508600001)(7696005)(956004)(4326008)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sENA7feRbgAbdR97q1uen2zGpfvQ8YIkzt97+r5Kvz7qjrf3zbyrtD3fhXLe?=
 =?us-ascii?Q?en3oLpIYRdC8Rk2DhKw1Gmmb+Hmaxbu7nAZ359HeTQ6WLew44MI7WNnoN0zP?=
 =?us-ascii?Q?vP1LMIVOJqlBqYiKuAlsf47tiEKfoLXKcFr/FL2IOHRsKxSOLRW9Emm6bnFf?=
 =?us-ascii?Q?lurGR3pcpnm2ElH+Ro65mlU5xp1gJ8om1OgTfK0q40NG4ld6+JNBaUDiLv6J?=
 =?us-ascii?Q?SyTToc/9SSHE0p+iIG8YtJcg0LsP/4hn3bbvTaZm5jGJNOvcs8BYf/WyKaOy?=
 =?us-ascii?Q?M/+ABnswJ62DPF5MonwKOp/n18tnO1Bj5Lg7AiApGtiGDMe080pKXLqj/Za/?=
 =?us-ascii?Q?cGw8SyHFd5ekmk8r8GRSe0+8+vfPExhi8ceuqr3uPeDrbz5OY3UP9Jd4ipTD?=
 =?us-ascii?Q?3fnAHg1X+akR1WYXRmiNUPvEG/ipctlW4Y2a7rLyYRWeC9y6tZ/hB24vGQ8X?=
 =?us-ascii?Q?wVbfU1N2KrRNLKBSBylvIU+cNGmqxjy34tSisq10DKbKR/V13gwP9A1AUUQE?=
 =?us-ascii?Q?mHWyTgncWfKQAw23pOdi0cunrM5B8IkMowQdDLm6xzLb6v91vwGnLiaFYUbb?=
 =?us-ascii?Q?ASA3BCJugaPlFjKwJPtV3qXiwGKayV35Gv1Tmt960tBR7uL4k54VsIQ/qWwP?=
 =?us-ascii?Q?NdH58AM2P1JBBduP/Z/T6gJJi9g+3eM6eHmeFTVy5YIiXCkE99iG76g8TR/C?=
 =?us-ascii?Q?jGJZJYau9gmTShqy0a2Mz0fu3tyZRthhIg85WVHPb/nW753hN3/hgVOrwypX?=
 =?us-ascii?Q?Q0bKwjEO3vqWxDcXFdjJSsDVO5F+3Cyg2upUIL48ibecEOqpAk7J6iCnFwDU?=
 =?us-ascii?Q?37j8bwYi/eIxF0elSyPLVWXOWEF9veE96COlmG+1jzWFAtrsudCkpOC9aOnv?=
 =?us-ascii?Q?L/5aNZlOqVs/Qxrw3DRD+05qwz5DD7gCvoPVa157gEKDm5YWg9fg9ixf0Fag?=
 =?us-ascii?Q?K3FwGpUFOWmvOg5gHXULeco/OluijjU1Tj7IHjQ6gVyVMhdVIRkc+83E+FUo?=
 =?us-ascii?Q?uSbPT4J3rFAMIDLpbBUFMgeA5nz5o2n1+Xf1iXzT1cOVf4ayDEY+LVyHqjuH?=
 =?us-ascii?Q?nDqZqQ4XpyTG1XxSuKK7xtWGMaZ1C9qyW90d35WpngX8Z4ntI6+OkCnnhD4F?=
 =?us-ascii?Q?uMGkcE1468r+lKY5jJq50O1GwnDprlwM1ZCgSVQ/Bj9NOD3cdaV2ehrCvXOo?=
 =?us-ascii?Q?UYZ75tatbMVFc00hKeqp2+sGviPj+KxOn7oK6GzTRO64Pqne5kbYsUsw0QMr?=
 =?us-ascii?Q?PcU090e1HPP98KvPnOZSLwDOzWJpxFCtMKaQN1qxtNh+xXwdDNK7m2ClRPo5?=
 =?us-ascii?Q?YMoa+PCc5vIZ79bxsyr4cw8ioyDiNGkl/cDuaIbuC0CK0jTvWiKsw6PKBWtC?=
 =?us-ascii?Q?5xppm8LXbnHV+Z1iYmf+WkSn8cRZiac4smctLCHLXIpevGBZDP9rMXAcCbpF?=
 =?us-ascii?Q?yiDvZULYfu3efL+oKBI6aZAkIaBc3KAr9iT6qwFU6nQcpVIC8clIvgO6Ko8B?=
 =?us-ascii?Q?M0pXLzz8uz8lvFV6xUWGOLWxX9soK33LbvigGSYTTpeJeG6We8+RncmY1TsJ?=
 =?us-ascii?Q?FQG9j2ktgEfx5yu54kcDre/fmGC5k1GHh2KPQ4enjnLQjQGnrVTE/kfqxgwZ?=
 =?us-ascii?Q?4aI4IJeqWEHVXdhtVfM6zZDbmLi3r/Mu1OgPMaknzFOormylS0nI9HZ4QzzB?=
 =?us-ascii?Q?5SETfA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c290a90f-1967-43a6-7245-08d9b5c74096
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:23.7918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uadi9rWxxRZ4gW6FLFotL3x6Aam9Y4G/X65+bTgHN0m6i/2bmxt/H4zUIMGrm5SulPWkYAtpfvT+WYORxGtMpZcPuGWK81V33L7wuF+JbzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: k428dbZxr2uCLdOJiqSTiE_ngbjT9R_e
X-Proofpoint-GUID: k428dbZxr2uCLdOJiqSTiE_ngbjT9R_e
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


