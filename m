Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B24C1B47
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:58:11 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwq2-0005M5-Jn
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:58:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwe9-00034c-Id
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:53 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwe6-0008EI-BV
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:52 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIELY2006537; 
 Wed, 23 Feb 2022 18:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Xo0ghy9Lm9jEwG11dPPFgyR3HUL5YANg2GKkAN8LDW4=;
 b=sjxIRfK/UxCgw9Q0OnAyn5oLbY6vq8PcecddQdDfgieQaoEOgB1ArO2uhrGd0k0+iu93
 MnKu0kL1+nUjj4erTFGyS5NpQbW/LqIX+bGPlnf/W9sHt+qkMd3EO0x399RRCPzQ9byn
 2DS9vCQ+FhJY85v9ScyjVHZi2fMIUGaZ4ndbjzUtfwE2OvER2DKdRXQbUz+/iIU9X4zT
 9kveyjG0KIvvLytfKKqpAMVdnUrO1u3+VZmgVESl0cuA+PlLvT6dOVyyonRXHH3lV5lH
 7nyMZHDwE3U0gEOVhcA2gwd8NTTL/Iw2HCEY5w2aQJUSqQddgT/71/XpeDmHA7jnAyJ3 ug== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ect3cn1mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIav2x048581;
 Wed, 23 Feb 2022 18:45:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 3eapkj2dr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3HIhtB8G16Mz3VSNMpfK5OQ8onHxva33pGDktrQ2lVLB20et9D18CEJGY7501ELyvGUos36W9F4rKjHfFNCIMUhMz0Qbi4nzh1wQ1LDhws2hYHdBdCkU0A32H29XojNJcxiA410HKwkWsr7O6roeIe33thGpxGPicgjrZ2rYJ0cf0c+dzMLtBs0i8uk88zfPvuz4ojp2FmowdmwZTwyxHFrwrBXWt5DpQ/L4SaEDwTdq2jdAHr0FBHYO9r7EFnwehzKWpaFvtTK3qKnejRcmrwETPAtAAWdG1i17X6VTV9TR9ps8VCQ7fCRq34280+L7HUNXUgU2jYJASRXgvccOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo0ghy9Lm9jEwG11dPPFgyR3HUL5YANg2GKkAN8LDW4=;
 b=LpSDh97lVo7keji4rwf+0Ayt/JCczNxkY5cISSUbmY6WzexQMj9Wa8bRrdBXpVmnv0qFG7E6rjhpYM7rYfvQwwKNNDeb2CVsIc7pNJqfWPn0F3Bl24H6826f1nufvVuEADsPoyFVcqHDTDZdQmlGxHmU4Cd+ruSAeEk/tqEHWlM1x25ZSyHTiWrKWZ8u7BHAgSalHbCgkQ2mJm67RyHh3A3PlU+WKuNukzehsOhr0AEOhjLdbIy6FbR5lb6Xhlx90gs/wBqk2D1+HnnNey3dAc2B4ACuy5uZwO/c7rATzSCgxcCT/WNJtP1yJrd4YNXJNM83y0tuz+lGWah5EE1D7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo0ghy9Lm9jEwG11dPPFgyR3HUL5YANg2GKkAN8LDW4=;
 b=zI+GxQSUYPWXc8NbbrZzYZkaFCHpW0k+LMpt7SHSWVU+0OiFmGLiGZ0g4FhI9eBhlyPUH9GmVHXFMhRUqynqOtgGFNnNuEGnxP+4KuJvVDX3Y95/5KFUf/C2TdgWpHCZvZfuSwbZPgfk3/2vgJxkAM0KHYOiA/Y69D/U8U4Xw2M=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:42 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:42 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] i386/pc: restrict AMD only enforcing of valid IOVAs to
 new machine type
Date: Wed, 23 Feb 2022 18:44:55 +0000
Message-Id: <20220223184455.9057-7-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220223184455.9057-1-joao.m.martins@oracle.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7cfd879-7af1-406a-a274-08d9f6fcb176
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB41440FA96C891F60AA1C127BBB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KdYqQzuLgJq4b/UB+27KTVjoYnpoTactodGdL1MUfJbqXI05aXpemw0Li/zDiI/yHnxLHmdhzDlRrpmEBJxhN04sX1P5PDrJDN9I0VoJ4n/chhyfHuRN1gJ2Tts4yIVJxDCHpcOLa+1oHiRwx4cEALOomK/bFqVcvPo6Ywj22gAiVnEbIH6lvEcUQWZv45TUuHaB4OjtY6pYpsAhQ+NGmV4oK5d+739heAhbfG5kwbLNrS6CZqDWezybDPwWWIDASR+r4OGZr9nor36Np7GXeO/unUEzAGvQ6Yt/13cOpyNfwn4NmmHTlgwHgmDHYH9rIXASTZasSt1ikPnQzuQ7CjsPEeMFF8xBsuvGdr9uPR7xm80z+gAYJ+ubNxqnFPjGZDIGF5rK3veUHJrLmEYsR96QBkAP9MtviaMB7ebIP+4ReHkzf15/0A9rYZwOuy2u1ZS7uBJtYOmWMPKfmeicrp6zVqctOAoDKk7/wEhUuWmCVnuIKSKwMIt9KHZ2la37HMbzyO+s8E7NZuo9dY/BvBF0uM2YWDeLPCH9+K+4DfuUl8Mf4A2gBQRBUuO3kNGwN2EH0ZKkJos8zkz9uvYIxdIPeNMWQel4tbzClSBPU+UhKqUFbImU3+dHaf7Nw/7N5MVcmrotO6hPNVfD9PfHDsGDkS7qBmdHc3fl2MS/MwGK81kPUaEhMW0nvLUg+SR8PBUHF3mA0N3ZIP0di8rFVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B742zwbnliWV3DhUbE0liX2g1bgJeNWV2xkdctFOEISa21XS52618uka10Tu?=
 =?us-ascii?Q?S2F7tkbznbTjyoTtE2yQ9UhddwU6Q3d5dzdY8vZzEiT814yHSXEKCQKNS3O6?=
 =?us-ascii?Q?APam0JmijQ7QA/PNFdRFSKz5rV0ebPDFiDTpfGuBPV1L+HCcqQ115xYssC59?=
 =?us-ascii?Q?V8+j74ma4hxmbWh34aXDlYWAK4woSS0Sz1DSOzGVNEML8ZA/ew9WIGchfLuB?=
 =?us-ascii?Q?4VSm/u9hBo5pxdGUilm6o1CGYU0MbOS3x6IfJtI8xll0rz0a0QREMbcL9yQw?=
 =?us-ascii?Q?mGNEZU8MwOb0qD4r3Lwirmvf89ATVxLmRmpbUJiYSspaX730rEc4popRaZzH?=
 =?us-ascii?Q?bqFtX/x99Lnic9kQRNUCgZbxN9rqFbr5yeLXHdUb2p0V5WHKJ9FUVqQ4EE7T?=
 =?us-ascii?Q?jXCbSrL/qzrocDHhIeByeZvzFxAvSQKTBM1940cU4IidhADgL0JNuNKn/BJJ?=
 =?us-ascii?Q?62JVQFy6AgjinvwCHndrcN3zdG6FX/AgiUHLdxdkANTdSezZzemvvm1j0pup?=
 =?us-ascii?Q?f03gYsokAzuVF+HjM5QKsirfkdFPwQkIoJp/aUiNWr5HFsfq6BpboerhLQhV?=
 =?us-ascii?Q?7PyE39/wfrKiv0bnw0hV1BDaYGYkiV+HL1xhOj6vPCFIvvKNLZR4u77hA+Jz?=
 =?us-ascii?Q?hwiP9iNRCTVFH8FrnWGOAoimdAHA/TqsRRoQ9DxLw2smofzauh7iVW015//O?=
 =?us-ascii?Q?Yaz0WyTMXsk0XLNuFL+vSpoZSW2+Bb7Z72/oB/sQKseyZEa6VrGjWL8NFN0h?=
 =?us-ascii?Q?i9juVUv61CfFawO12WOkKH+wc8dxTIWTaCoB64RdYjkKlrgje7v/tl4z9bS3?=
 =?us-ascii?Q?pGWcCmaudOFgqTSGh2j1helKR4TZGc2k23T2G2rcX//gsj7lD+zDS0PBjLZo?=
 =?us-ascii?Q?jw5aRRzfyGMXeC3U0bpCUadxNG68R+7lNzUe59NlJaGxEXkqhnutj1e5xGxW?=
 =?us-ascii?Q?juDD/DgKm65DN04vEojaqRQKFVWxrlk4SOlqKBT2918yMO7FgvPvRAY99VjS?=
 =?us-ascii?Q?M8bOv/yfAltBw1W9CQ2KObUd/tXHcW4Q7Sb8sn4etO3etb4Hr354Hpb3c1TR?=
 =?us-ascii?Q?Ls1Xs4Cm04g9raplIMkqq/LUdwnw7hsf8AHEStzi4GycEf4vVPl12/6nYoI4?=
 =?us-ascii?Q?elYRUCeIbYtHejEbcDslVwm98dg/9acSySc9kmcv11t9804XXMxTI9MgQiWU?=
 =?us-ascii?Q?qF1GteY+dcrlS+C7lAg8mmZohfbN8Cj3FkatVYAto8WtpPWrsJm0xYeZXvuX?=
 =?us-ascii?Q?c/sK84sZavB+RqrnHX+KD8XPZMGewmHpARCLf/oMXPu+jbI2BZL1Z7itttIl?=
 =?us-ascii?Q?cRgx4xVC68UqehEF8SJrcCzxL9bkEV1O9bVEoAqhxQmEgS06/g+JtUd/E35N?=
 =?us-ascii?Q?dWlCO3ix/cHt2v7G61GL4P6VENMq+NpioAn1Tv2njYrV93W1rEwJTUqCLeyi?=
 =?us-ascii?Q?bO2jra37bKMhIyB08TM7QlQm5B8CRY2KLP9CYGsW8duxVq/q1g73vx5/ekwl?=
 =?us-ascii?Q?P9b86L9HW2nsPDL2cc0E2ByN1RxCt13TTtI3A1xkmib8uj++Y+Rk9kRBQYG9?=
 =?us-ascii?Q?cs9z5c1cMmgp6XfhtADuRksrVa8sfpfXt1lFuskZuEHDPHIuogxqpML4lCce?=
 =?us-ascii?Q?E/OM0Wi0j/zy58DOFQSdgeyCmn2SlayKTH0hebvWgocgyxuLEDniHUZ+FfMi?=
 =?us-ascii?Q?5XdRzg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cfd879-7af1-406a-a274-08d9f6fcb176
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:42.1356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enissnNoeDtwVVna7xnZ6zJnNsxNnQ3mfgBZuzojV6z112Tpd6uBR5UFTR6fnX2QQJft4mnVT7RIqHzieVtPwtQ/wQoeb1dmZyN9bpPuo8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230106
X-Proofpoint-ORIG-GUID: NZMFhO-7GCuF8sMzBZQ7k1KSLPKMQG-G
X-Proofpoint-GUID: NZMFhO-7GCuF8sMzBZQ7k1KSLPKMQG-G
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The added enforcing is only relevant in the case of AMD where the
range right before the 1TB is restricted and cannot be DMA mapped
by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
or possibly other kinds of IOMMU events in the AMD IOMMU.

Although, there's a case where it may make sense to disable the
IOVA relocation/validation when migrating from a
non-valid-IOVA-aware qemu to one that supports it.

Relocating RAM regions to after the 1Tb hole has consequences for
guest ABI because we are changing the memory mapping, so make
sure that only new machine enforce but not older ones.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c         | 6 ++++++
 hw/i386/pc_piix.c    | 2 ++
 hw/i386/pc_q35.c     | 2 ++
 include/hw/i386/pc.h | 1 +
 4 files changed, 11 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 11598a0a39e4..ef0a5325f98a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -859,9 +859,14 @@ static hwaddr x86_max_phys_addr(PCMachineState *pcms,
 static void x86_update_above_4g_mem_start(PCMachineState *pcms,
                                           uint64_t pci_hole64_size)
 {
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     uint32_t eax, vendor[3];
 
+    if (!pcmc->enforce_valid_iova) {
+        return;
+    }
+
     host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
     if (!IS_AMD_VENDOR(vendor)) {
         return;
@@ -1804,6 +1809,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_valid_iova = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5a608e30e28f..c322f9494384 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -435,9 +435,11 @@ DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
 
 static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_0_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->enforce_valid_iova = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index c81d21d1ebb4..53ed6df1e0e0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -379,8 +379,10 @@ DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
 
 static void pc_q35_6_2_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_0_machine_options(m);
     m->alias = NULL;
+    pcmc->enforce_valid_iova = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index d8b9c4ebd748..914340750498 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -117,6 +117,7 @@ struct PCMachineClass {
     bool has_reserved_memory;
     bool enforce_aligned_dimm;
     bool broken_reserved_end;
+    bool enforce_valid_iova;
 
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
-- 
2.17.2


