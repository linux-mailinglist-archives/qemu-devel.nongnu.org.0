Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E03B09DE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:04:26 +0200 (CEST)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvisz-0002wT-0h
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvied-0006uo-20
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieX-0005ra-Kc
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:34 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFfZ0q023674; Tue, 22 Jun 2021 15:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=DnODBEZZ8O0m5vcqrfahTdKq89kIv2xSX00HE/WENs8=;
 b=m5rsL7gWYD7212wLlpf2PHfW4/6HEvatQlIGOmWu7QoBuTI0TUd52v/rVC9UQSApqSZ+
 A+Xmbmt5hW0+nya1OvLLvPu3nQCTZKsPaXI1AK2+quyEmhH4vbNJPkMchUbK7x9aqV8L
 zjCLRiApaT+hLEO8eNTQMKCWnbt11oCtJ2sMT5KV3nuqs1XCVsx8HFRhCOk1tjRMTRlb
 4IOoBnaibQyCH8m3gVKKP4v7kOi7yj9ovQeNF3qA2PvABfpLV1vXcAgOB0VHkRGNNXKm
 bGWnI8nTnGDd1Rce6ExDiS3ogKmnO1R59K5BSoilVR6IbG+tZRXx5r5lnSdz6vgeyeZj 9w== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39ap66kr12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:23 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFjtIl102936;
 Tue, 22 Jun 2021 15:49:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3998d7pmyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqfYF0CRPNhsI2ptd2YhxGMi+Nk3Cpy1fIWhB7tLhCWX39aq3BqVDKe2wWSKyqDJgtz8wT6QoWHXVWLFb+GA1RuR6pkxlGOgL91863n0vkDAAAPaU1KMWx3rdTftt8v5tzK5OJCpM7S6vVbGxSO+fqxtKQRYfM6JgQb5rrkpRYvq/BobjDo43Xa+v5bhbhaXt9n0RjV6aqPlLBsUUxM8+gqK1jq2F41uERlf3TQt2MDWVbjibJzNWes5DUOqV0WPIYJDjEUctntK86rBoZ+xPr7cPXiNuyceg+RAw0Id31gEH865sr5w7StT+XimZzZczAySp/vzzTScEjqWGyGj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnODBEZZ8O0m5vcqrfahTdKq89kIv2xSX00HE/WENs8=;
 b=Rxa6XdA3tayPUpTbqbUzSLGhnu4xsBRufj9XKqr07/Cenp6PTWqj+e9nZifKXqMCBg3DD8RrTETlc8bSJpVoBfRQyJmxPacfxUqZIzqy2Nkm8OgYgikq7wesiSWLAqDnedX3RypnYoqg03sFfmFH8IiQBrQbd7J4LLz945155OKH+pS33IbyWBMB0DpJwqfaCRVuYCHqPF6wgGbQe5CBFona63GGij4Y2LkyNZJsAx6ys10bc71XqgX/d7DgqYw0ZO9M7d+BND9gpnLAyQfrFGBYHCYc4Saeh7n3BBI76w5/+zemVlo4Siaj7kluMOXOfD9bbmsLPdkcKIxeDRoEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnODBEZZ8O0m5vcqrfahTdKq89kIv2xSX00HE/WENs8=;
 b=pbyqukewLVwbQSY3RV/cHiNaa+sr7zTnUwZMvOL78shBOy90rFCCxWMfSUWwNMmD4IVhtYhQEvfdDHPgcKCGM54JsuXPHgjpAUBgyfwd21jqEp0jrGqef+j5ujhvtmu0hgnUduasgwnxXqjUBdgJoohC/TsuWymXT8RfSToVM84=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4078.namprd10.prod.outlook.com (2603:10b6:208:180::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 15:49:21 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:20 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
Date: Tue, 22 Jun 2021 16:49:00 +0100
Message-Id: <20210622154905.30858-2-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622154905.30858-1-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paddy.uk.oracle.com (94.61.1.144) by
 LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fa5e9c5-2e40-43a7-5171-08d935954cf6
X-MS-TrafficTypeDiagnostic: MN2PR10MB4078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB4078AD4E57F714769E872970BB099@MN2PR10MB4078.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0d28m9zaL8RqWhP2cfN8lNVjYiI/jXcG1dxIQ1AOWQxoIqEXTQw5/C/wKDynGZj204AGSmH9da1sqyCIkv8p1C0cP6rmzzc0pxAh6YREgGVNPSxx+2q5GQtJkZciC6ZXojyaCQT+6KvKdvjXiwRzAxyvzYRQw+8BW++wlHR10xU6g3rsHnmtlG9y24IJ2In8/DdcA0lQo8uNKm6HWoj8yvRagIJPv3XH8yCAMlBM8l2tm7WdlZ0hitCYlTfzZmeX6C+RYtUWdLp6ROr60qNJ5IkcHuriixDj/o7ZI/QOm24JYmDfHxI5hI4earlgRXqAxpaTfnCJkY5koMFZMm2VeZlCyflGFT+S7S2GYdM2xKwKV3AE49O//LKN7+YkOZVbXSoFn44CXhyYNCW4s1giLsMSaOMdebTpqC2+CP/wXYaO0/TYSJhWefGxxF8MMn9SbPxGF8DcXctyZI76OK4ntveUki/Yyfo8i/k3Zv5cfIB3UqoqnMgkstroEjpSWEPqoe2G0KAmKK6uAGXL/2Ug6BC4UN6UrtTIdoXdFkI8gE5F/mTq5fkmx4K+Ip4LphjpPM7x0DMPNFp/T2HA5+eWc+SxLcv0ayl1inhbRvpri/SLwwyKs5nTO/RmdMTvcuhPFlu7QOVHXKlcNlOWHFeJ+yEcHyiAuc87w5vAR4EzDJXbnMhdFWuEAariGXYx00awJSt+YayL1UOD27vDMVkPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(376002)(136003)(6916009)(8936002)(103116003)(2616005)(54906003)(1076003)(38350700002)(956004)(6666004)(66556008)(66946007)(52116002)(8676002)(83380400001)(107886003)(66476007)(5660300002)(7696005)(38100700002)(36756003)(2906002)(86362001)(186003)(478600001)(316002)(26005)(4326008)(6486002)(16526019)(15650500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QcOMjo9/A6LLXSvs9mDc7yP76KWYyatvxWTdP9lG+BeKbSF+u12tCLFCcguS?=
 =?us-ascii?Q?MaPPHdd+GjNTAEJd9VjUQQ3RpOpHvbTOKLhTosgeo5gHqf9gvWSY7S0ObS8w?=
 =?us-ascii?Q?6M3gWLnTppP1VCl31NhyZYQflVX9zVXYs0v78XQy0or1UqZ8rJrrgRT3+0qc?=
 =?us-ascii?Q?OuDWL2FOnhnrgxb6w/MFZsiyWldW0Wj0e9SoS7exGZ48OpiYOU5SDiXW4HTY?=
 =?us-ascii?Q?dHob5oDIAOftKwgMA8hKT8UVFeF2axm3wTo3g+TFDhFqaTwSZFGQ/rKaKA4C?=
 =?us-ascii?Q?auT/jp0seVwH5LNPq9xDFFrrCXoewKh05QHWPHthny/P9CM/Rbqe8pz6Cyvc?=
 =?us-ascii?Q?Sw8rohvVCDvt8V6yQyzJe+a4EryyRiASNBBE1a3Er8zQw1/aTfHI/5nebu3U?=
 =?us-ascii?Q?/z7lw6pBZMw1tYkZB9egBOWZVunKUtsXmcLXxL5vGVn0re3Xpcvljjd4o+fF?=
 =?us-ascii?Q?zjOx7UREucdghGn3y8+Y9mg0a2jyIPeo4A6UcdM1D6I6MWqRrY8ApWzp/cNU?=
 =?us-ascii?Q?ToJQ34tgBKE2UallPNRIWW4sd5EGfPI8Urp1XRabkwdfyKdtvT4aefdqHVsM?=
 =?us-ascii?Q?9EmtWvvaDoDQSCZwuf1rjFtAvk67cbyCaAznK2bMaUDPV+xADf1QU9sAiRqv?=
 =?us-ascii?Q?k+flHuGKOIBAFEDdonnvzqvWEO/WqKiWSNy6cy3IV6osEh+gU6/clvY7vXde?=
 =?us-ascii?Q?sToWdvxhv7n4xgWzLb5Dw3rnhtxPKJngSaRDdIK8SIItGOIt0l5DjQBq1oso?=
 =?us-ascii?Q?KbBU7zE6OJu8jJZacR38vxAUqvHXl3dS62v38VnEU6Nx+ygm9USsdnKqw1/L?=
 =?us-ascii?Q?sSyna20g/7v/IUka7K4fEkymOasNkLeEYnSrWL6T2H1OfALiPtQqZpIFDcVy?=
 =?us-ascii?Q?liTPJdK3lO245dVDKQokwcPFK7acEmg68/JhfynvMBrj4L3QpiW3OC6Y3vMi?=
 =?us-ascii?Q?YEk23FgMG050CFrxiVNQwrmPHV18coTsYCoVjAm5qhRk/Dw2iCT6tNmq2BJV?=
 =?us-ascii?Q?K0P0+nd/8KbMsz3iQUDCe6TV6eo604574xmEGLQpre4qMLkieab56ysZrb1j?=
 =?us-ascii?Q?LRNTUXMh1TQtWRLtbt/aur7LUkla2DU5ja7qzJerNqK1/YT0dt32NyMNkSuL?=
 =?us-ascii?Q?j2dfOhRwZfnnifQUy29olIjpEwtGj/z1tFwqG7RvZr9OaiIIgfKMCiJMCV6J?=
 =?us-ascii?Q?Ujn7ogbL/I+00Y1KUcyGQu0+i0dd8i44nu4TPxNAbtXkFgyV3L7sD/oYrhkj?=
 =?us-ascii?Q?Q1Q1pZbkV/DJrh5BnWHbiWk4EsRHgV2s7bIaqI/AVOUlrp3p9B+LAdnl86Wy?=
 =?us-ascii?Q?wuFSCi5u6dZSmeNofYAqkc64?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa5e9c5-2e40-43a7-5171-08d935954cf6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:20.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqo4jXcJY9Prp3t4aS1tbDDGKXFOFH3SHC9fgQLwHQXDd5T5eEZ3gCFX+GZa/zkxWqt0yi3flW8Ah7x3j0O3mhjhc/SiF3HYuQnqlysX/CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4078
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220098
X-Proofpoint-ORIG-GUID: tIBprWI-ILpEGABSmCDM7V7wSFAsR6yi
X-Proofpoint-GUID: tIBprWI-ILpEGABSmCDM7V7wSFAsR6yi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is assumed that the whole GPA space is available to be
DMA addressable, within a given address space limit. Since
v5.4 based that is not true, and VFIO will validate whether
the selected IOVA is indeed valid i.e. not reserved by IOMMU
on behalf of some specific devices or platform-defined.

AMD systems with an IOMMU are examples of such platforms and
particularly may export only these ranges as allowed:

	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)

We already know of accounting for the 4G hole, albeit if the
guest is big enough we will fail to allocate a >1010G given
the ~12G hole at the 1Tb boundary, reserved for HyperTransport.

When creating the region above 4G, take into account what
IOVAs are allowed by defining the known allowed ranges
and search for the next free IOVA ranges. When finding a
invalid IOVA we mark them as reserved and proceed to the
next allowed IOVA region.

After accounting for the 1Tb hole on AMD hosts, mtree should
look like:

0000000100000000-000000fcffffffff (prio 0, i/o):
	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
0000010000000000-000001037fffffff (prio 0, i/o):
	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff

Co-developed-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c         | 103 +++++++++++++++++++++++++++++++++++++++----
 include/hw/i386/pc.h |  57 ++++++++++++++++++++++++
 target/i386/cpu.h    |   3 ++
 3 files changed, 154 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c6d8d0d84d91..52a5473ba846 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -91,6 +91,7 @@
 #include "qapi/qmp/qerror.h"
 #include "e820_memory_layout.h"
 #include "fw_cfg.h"
+#include "target/i386/cpu.h"
 #include "trace.h"
 #include CONFIG_DEVICES
 
@@ -860,6 +861,93 @@ void xen_load_linux(PCMachineState *pcms)
     x86ms->fw_cfg = fw_cfg;
 }
 
+struct GPARange usable_iova_ranges[] = {
+    { .start = 4 * GiB, .end = UINT64_MAX, .name = "ram-above-4g" },
+
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. The range is:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define DEFAULT_NR_USABLE_IOVAS 1
+#define AMD_MAX_PHYSADDR_BELOW_1TB  0xfcffffffff
+    { .start = 1 * TiB, .end = UINT64_MAX, .name = "ram-above-1t" },
+};
+
+ uint32_t nb_iova_ranges = DEFAULT_NR_USABLE_IOVAS;
+
+static void init_usable_iova_ranges(void)
+{
+    uint32_t eax, vendor[3];
+
+    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
+    if (IS_AMD_VENDOR(vendor)) {
+        usable_iova_ranges[0].end = AMD_MAX_PHYSADDR_BELOW_1TB;
+        nb_iova_ranges++;
+    }
+}
+
+static void add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
+                                hwaddr base, hwaddr size, hwaddr offset)
+{
+    hwaddr start, region_size, resv_start, resv_end;
+    struct GPARange *range;
+    MemoryRegion *region;
+    uint32_t index;
+
+    for_each_usable_range(index, base, size, range, start, region_size) {
+        region = g_malloc(sizeof(*region));
+        memory_region_init_alias(region, NULL, range->name, ram,
+                                 offset, region_size);
+        memory_region_add_subregion(system_memory, start, region);
+        e820_add_entry(start, region_size, E820_RAM);
+
+        assert(size >= region_size);
+        if (size == region_size) {
+            return;
+        }
+
+        /*
+         * There's memory left to create a region for, so there should be
+         * another valid IOVA range left.  Creating the reserved region
+         * would also be pointless.
+         */
+        if (index + 1 == nb_iova_ranges) {
+            return;
+        }
+
+        resv_start = start + region_size;
+        resv_end = usable_iova_ranges[index + 1].start;
+
+        /* Create a reserved region in the IOVA hole. */
+        e820_add_entry(resv_start, resv_end - resv_start, E820_RESERVED);
+
+        offset += region_size;
+    }
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -867,7 +955,7 @@ void pc_memory_init(PCMachineState *pcms,
 {
     int linux_boot, i;
     MemoryRegion *option_rom_mr;
-    MemoryRegion *ram_below_4g, *ram_above_4g;
+    MemoryRegion *ram_below_4g;
     FWCfgState *fw_cfg;
     MachineState *machine = MACHINE(pcms);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -877,6 +965,8 @@ void pc_memory_init(PCMachineState *pcms,
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
 
+    init_usable_iova_ranges();
+
     linux_boot = (machine->kernel_filename != NULL);
 
     /*
@@ -888,16 +978,11 @@ void pc_memory_init(PCMachineState *pcms,
     memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
                              0, x86ms->below_4g_mem_size);
     memory_region_add_subregion(system_memory, 0, ram_below_4g);
+
     e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
     if (x86ms->above_4g_mem_size > 0) {
-        ram_above_4g = g_malloc(sizeof(*ram_above_4g));
-        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
-                                 machine->ram,
-                                 x86ms->below_4g_mem_size,
-                                 x86ms->above_4g_mem_size);
-        memory_region_add_subregion(system_memory, 0x100000000ULL,
-                                    ram_above_4g);
-        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
+        add_memory_region(system_memory, machine->ram, 4 * GiB,
+                          x86ms->above_4g_mem_size, x86ms->below_4g_mem_size);
     }
 
     if (!pcmc->has_reserved_memory &&
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1522a3359a93..73b8e2900c72 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -151,6 +151,63 @@ void pc_guest_info_init(PCMachineState *pcms);
 #define PCI_HOST_BELOW_4G_MEM_SIZE     "below-4g-mem-size"
 #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
 
+struct GPARange {
+    uint64_t start;
+    uint64_t end;
+#define range_len(r) ((r).end - (r).start + 1)
+
+    const char *name;
+};
+
+extern uint32_t nb_iova_ranges;
+extern struct GPARange usable_iova_ranges[];
+
+static inline void next_iova_range_index(uint32_t i, hwaddr base, hwaddr size,
+                                         hwaddr *start, hwaddr *region_size,
+                                         uint32_t *index, struct GPARange **r)
+{
+    struct GPARange *range;
+
+    while (i < nb_iova_ranges) {
+        range = &usable_iova_ranges[i];
+        if (range->end >= base) {
+            break;
+        }
+        i++;
+    }
+
+    *index = i;
+    /* index is out of bounds or no region left to process */
+    if (i >= nb_iova_ranges || !size) {
+        return;
+    }
+
+    *start = MAX(range->start, base);
+    *region_size = MIN(range->end - *start + 1, size);
+    *r = range;
+}
+
+/*
+ * for_each_usable_range() - iterates over usable IOVA regions
+ *
+ * @i:      range index within usable_iova_ranges
+ * @base:   requested address we want to use
+ * @size:   total size of the region with @base
+ * @r:      range indexed by @i within usable_iova_ranges
+ * @s:      calculated usable iova address base
+ * @i_size: calculated usable iova region size starting @s
+ *
+ * Use this iterator to walk through usable GPA ranges. Platforms
+ * such as AMD with IOMMU capable hardware restrict certain address
+ * ranges for Hyper Transport. This iterator helper lets user avoid
+ * using those said reserved ranges.
+ */
+#define for_each_usable_range(i, base, size, r, s, i_size) \
+    for (s = 0, i_size = 0, r = NULL, \
+         next_iova_range_index(0, base, size, &s, &i_size, &i, &r); \
+         i < nb_iova_ranges && size != 0; \
+         size -= i_size, \
+         next_iova_range_index(i + 1, base, size, &s, &i_size, &i, &r))
 
 void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1e11071d817b..f8f15a4523c6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -869,6 +869,9 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define IS_AMD_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_AMD_1 && \
                          (env)->cpuid_vendor2 == CPUID_VENDOR_AMD_2 && \
                          (env)->cpuid_vendor3 == CPUID_VENDOR_AMD_3)
+#define IS_AMD_VENDOR(vendor) ((vendor[0]) == CPUID_VENDOR_AMD_1 && \
+                         (vendor[1]) == CPUID_VENDOR_AMD_2 && \
+                         (vendor[2]) == CPUID_VENDOR_AMD_3)
 
 #define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
 #define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */
-- 
2.17.1


