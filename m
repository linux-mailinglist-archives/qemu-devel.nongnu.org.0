Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3DC509144
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:16:59 +0200 (CEST)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGl0-0007lP-CT
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgR-0008JF-9y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgO-000476-JB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:14 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KIcDlO019815; 
 Wed, 20 Apr 2022 20:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QzlP5MoJgft5qU4CI76F5zDkTCEEEuVgL58CuV6KK40=;
 b=OUw0nOVviTdakwLKUvDjiFp0hLYGgAW6by35eQr0LI3SVZSP41Okey7yaa137+X9zukU
 pixFzVXJDJ3Ph1uKbbLCCyV2LS4hyiy/drTe717VBWtUlGTnNeBhnog42QFu5NxKk/8W
 Za/WZ6epqTMsyB5fI0dfDbTuw3YDDkMuThYpc4A2KkQX2zC3P3lOMQ/uSyM2Y0/8K+dT
 R0DoTNaxb+zq4FCO3giLRE+LaTpiYQ6OV6tI8dQxkUr1DcEeb0EeqnHKwTgXvsV9Hwkh
 iLQSNEpVGYwpI5q9ZpIX2JJPv44StkGkomzryQkZpXqps+N5WmK5+kLLRf1VI0v8pZ52 bg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1aa47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:06 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KKAhBw028667; Wed, 20 Apr 2022 20:12:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm88736v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chcg4x6b8xfE6hw04fFVrPXR3s5i5RxChDTInNnb7xYUnQ+3PQmjhMcZjU2LSSJmOGOXpATRJA0QprmqmZ/pDhSae30KTkpIbimxYTEWucGLVxcvX5c3eGnS/hmafYnip2dgGblBeUWS8d1PVwFps6lruce4UMC4ajxnts844wHAEZFkeZqA3+OSUhaIpg7FHAeWchxlTLisVSAZXGKFwHzCJ7IwFtco62DHTtCqOtIhv6USc97Ebl2bhc4h1yZV2DycyPLMEZJYFjn2MQO4SU8kHbfUj/4Pv4Szq75nLvbw3kwbuCqFyCsCr6w2nYBCxYBULdwgjltyysiSyeylVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzlP5MoJgft5qU4CI76F5zDkTCEEEuVgL58CuV6KK40=;
 b=VAwePk/+DyuUyOSHymmpejMxvLlL6QJhJoJ27yJgwciYegNE7ONvYXstHsMR3Mm+nqTXS//+bfHhjTIsnr8txqSLuuZcw9tWv4+Otiezc2/wTxR/OBzVN0exYLtlZH7ek6pfuYXN4pYbHMqXIs96416XI+SbZZ9VIbGLiC+nE2uEX4ucpOLT8iZHNbzMyPOhqhwlqCTk9fpX4GA4tVcZIKhso90+4utMKE0OTF2GBPJTcHx6dAeeSwFDO5IoG8/HkxmXgbnjuiSxDeg52LBRkMaM2QnYwcH4i3VFyWBkrntdCVAangUwJnl0iXz+bLbtAiSa+SMoYFIW/aSlSlJEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzlP5MoJgft5qU4CI76F5zDkTCEEEuVgL58CuV6KK40=;
 b=md8ahB1lm27VVcTef6oXbgfCk783Ih1r0i/v8bPR8sMwVCcmicelYi+M7sWMMdFCOmdxDlVZHOPxsx8kqw2yhj5fQqwcEU3/rp2WPW6FpM3yrgs9TvgCsvQSiOGRE5zi0BablCE0rTd0DF/gNJ5xDCvTk5Wju2I4pCXY0MI+2iQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB5438.namprd10.prod.outlook.com (2603:10b6:a03:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Wed, 20 Apr
 2022 20:12:03 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 20:12:03 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] i386/pc: restrict AMD only enforcing of valid IOVAs to
 new machine type
Date: Wed, 20 Apr 2022 21:11:38 +0100
Message-Id: <20220420201138.23854-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420201138.23854-1-joao.m.martins@oracle.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aca7c611-f870-4d00-8015-08da230a08a1
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5438:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5438A5C9773D8A80E18D07C1BBF59@SJ0PR10MB5438.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2CFbLtETtW25/L0P7oCTCs8k/iou7lviJ/VBnSHW616gdKm5Pc7PiAqBGLfutDi2Io9csj/lK9p/95MAVFpZJMmP+gtT3KQOs5PeOEAes7f62SFZL2pPO2krw/PCvWi7F48Wt0IA65z1q1rdKbj6EuFZ2+EjO6MGMsfPS3eABG7qPeRjXCDLPs2u331jKUJ2VgwDbw29FxMHZiFbePSKDmk4SPON9bB7v0YCZCaqSKSzrn0foi3sTbxmYOuRyIUvqGjZhvom9yWsOKUhEdNUP24DPuP+X276a0R10w4lFcDfckNfHbnbyPfOiRT6D28XfaUGQGimRC3xCE0RwxRwUcPBy8RbYKQvKqvFE75H5/IRj+QETghQ8o5xuBTRUxFogGY1eNDOQm8gYKTxc8uTNwKn9zklgPQ/JNl5YNkPgmjwW3EUpZFOrkMD9BwPiP3nDQe5umZPC9GDfhetIqr3j62xfZMEH6G0VVF8+MIijdVbkgiE+KlMn9354km9qPKDkyftjYiCLoJvBONiVVQ/vBDTjFjH18c5z2MfBP4PMAnnc42IHtiTBNk6tqIaUue6SYCydGnz6mkUyf7859PoARNpkvIwaxXFzkdiEGeumvZdLqp3OUBXTCX3tZkcJKEqOKO/T3ebbLYVgNliyPUQcL2J+gQ8tXamMn+GNuizlAqu8hqb3qBnHrHiJIr/J2q8C4zDSEqOSqkX/gmZFR0Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(8676002)(103116003)(2906002)(38100700002)(2616005)(107886003)(54906003)(508600001)(6666004)(7416002)(8936002)(5660300002)(66556008)(316002)(66476007)(6486002)(86362001)(4326008)(6512007)(52116002)(1076003)(186003)(83380400001)(38350700002)(6506007)(36756003)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kl/hWHhwS+AMeB+lqlafTHfoWOJ/YErCU0Wmhyd5o2YUJJbjK6E+TT5MFMk+?=
 =?us-ascii?Q?T1W2Bu0iQ5SZE8y6dkjtWj5+yOHgZvXAmCkV4x2sLsjpg32+AIvYZ8BKD1Ef?=
 =?us-ascii?Q?8zzGHGdkNTsuUaOCDlAd3rKtHfSPxssiSjr9rDVwUShmgaLD1pEMm78p5DJ9?=
 =?us-ascii?Q?z6qWH6gZVAtWvHQzfneZScH/2h34EIiEDucSyavROQA2bDpmU/+5o2D0c0te?=
 =?us-ascii?Q?fq8uSj+AjnsPLXJ8eA+1jUw23XZ5U50LpVu3zRO+LnLZ6BdT8hRbaLHsO7/9?=
 =?us-ascii?Q?bNq9sY4203DbQJDu2j/Z5CChrH5grWazocONU9zy3SD4/14BExxLYSasAD3O?=
 =?us-ascii?Q?wV5p/Y1mPBx75p/X3nvFDzRtmE24W1/bBjCNjD6T09K+bf+aN195n8kHWZmz?=
 =?us-ascii?Q?8ChcOwWqnGdWCOCw77FF0Dg/Cv7w9ZP3bUAhDwGFmqwHdFUZkaFX21TiLmHv?=
 =?us-ascii?Q?rOhMycOvT9pZiPPKjSp+rWBjwgd7IA/48Q7ycOndd0LTCF+vIX8kvU6KSuIp?=
 =?us-ascii?Q?A1yN3n3+dT3S8YunnNXlTUX3ZjBLPklpcXyeqLIOxU8CBsju1c+bKig6wK3l?=
 =?us-ascii?Q?vVKudV+6GYcDT4wOCgStFznLlYL1JCwDmSz9cgqKgd7mdutHQmHHVaN54JJ7?=
 =?us-ascii?Q?+/ruiw9SIABijuImm9+1czdGJcayI4EdaPSfYi1vM8gk5KnfVKRrkvLF4KGb?=
 =?us-ascii?Q?LZedYoiTYnmQ6YPdrvqqqtgu5d1zx9RYN/AJK/7vxiwVor70pPAx1yvtL21H?=
 =?us-ascii?Q?oOx4LevB4qiYKVdJqVWbfDDjV/RDgMDfBfAnKhHjzG9X65SfwoJONUjqt9VT?=
 =?us-ascii?Q?mVrVEVUUMGwKmyFK2+d5ikXK6WqIzsN9NVyfm4axUu3XMwq9VGTPQ9He5R6m?=
 =?us-ascii?Q?hPengQ7Kzc/Q1fzUzJf95qTMT2sbmwghxBRADeqXICU3RHkqHJ5V1JwtUwwt?=
 =?us-ascii?Q?xTzUvK9neyUZNKHxeKdzh0HsD7nuKhvEY6yZEC1ClzVwSYOAf270la4SWjWP?=
 =?us-ascii?Q?mQh7r4UUn6u5uIQtvwrCsK0n7VdFWEYHA2avRvsWF1L2i/nIrzg3EwhDrUjm?=
 =?us-ascii?Q?eZ23vfVnz4RXkcmAb8HPG1T04HPA16d9LObmkqrHIp4vmxKj5Fe0IIVT/qK3?=
 =?us-ascii?Q?LQUcoJswpExkN7YofS/9OfT+GIlKU/2Bbk8e5kXxxFka78LQc2B8oA7VZuCa?=
 =?us-ascii?Q?v691uiX1oSF1tzjpYKRv1GcE9qJADtQSe9v3TcGpMYxAMjMxeT7ogvQiyo5K?=
 =?us-ascii?Q?WSxOmO/CtpaHiR+JqpVB9UMELSXtti0OPtJECe3Y66VyNOThAhmf6UQGYq5I?=
 =?us-ascii?Q?g57BfcJIPt/nFzE6P5/AsTOC4z+wuNtcwPIsNxbaIWPAHrUZfqWK2xuYer7W?=
 =?us-ascii?Q?R1WlLn7NciZUkr8AoNucCWDiPFdeM78xmo1ia/gOb8vrxkNJy9XiWJRpZ1Bv?=
 =?us-ascii?Q?FC1b57ZDzxKVH/30oZjA0ZDBJtfiosxSOgKFjZAoYF0SbBFsnIF3UDmsv4QO?=
 =?us-ascii?Q?X54R6f23Lif3jfnsNpBA3z7hJ4Hhs4Aa2g6nHfKOX9W4GND1FsLAmaBHoK8F?=
 =?us-ascii?Q?8rMFvZgARRYiMihhpbM9EtRzZg2ttGItw3vJZe9qfIpttf6/dAHOnxdKh9t+?=
 =?us-ascii?Q?odWHwIBBKLAFF3S7eOGY+tB8wMsix60Pl08X2svupARQb2RUzCcGB/+IBjtT?=
 =?us-ascii?Q?PzRm1dYZgGUGApgEN5i5V8N312m7GVmHNbK3P00fcvQILVw7hs9GDd9X4tX6?=
 =?us-ascii?Q?iHzUAcWabU1kd1VRP5a7zfLMCVM/ZmM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca7c611-f870-4d00-8015-08da230a08a1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:12:03.1542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLjf70GPfU+DBQD9Qhb4HTnzY4GieoME6NIJ3p53HPBHCrqTxU1YRAhHTGXoAT4OvyLpBdW+dNXtRrS4+6leNGQ0YvdNkD4bfLYBhsb69+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5438
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_05:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200119
X-Proofpoint-ORIG-GUID: l5e0DhgpphkS4F4sguTjbdCNj-WiIIDw
X-Proofpoint-GUID: l5e0DhgpphkS4F4sguTjbdCNj-WiIIDw
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
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
 hw/i386/pc.c         | 7 +++++--
 hw/i386/pc_piix.c    | 2 ++
 hw/i386/pc_q35.c     | 2 ++
 include/hw/i386/pc.h | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index aac32ba0bd02..77d8747ef79b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -869,6 +869,7 @@ static hwaddr x86_max_phys_addr(PCMachineState *pcms,
 static void x86_update_above_4g_mem_start(PCMachineState *pcms,
                                           uint64_t pci_hole64_size)
 {
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     CPUX86State *env = &X86_CPU(first_cpu)->env;
     hwaddr start = x86ms->above_4g_mem_start;
@@ -877,9 +878,10 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
     /*
      * The HyperTransport range close to the 1T boundary is unique to AMD
      * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
-     * to above 1T to AMD vCPUs only.
+     * to above 1T to AMD vCPUs only. @enforce_valid_iova is only false in
+     * older machine types (<= 7.0) for compatibility purposes.
      */
-    if (!IS_AMD_CPU(env)) {
+    if (!IS_AMD_CPU(env) || !pcmc->enforce_valid_iova) {
         return;
     }
 
@@ -1848,6 +1850,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_valid_iova = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 00b4391e2e78..e12a40103be1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -435,9 +435,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
 
 static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->enforce_valid_iova = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 233aaf5ac50b..e7ff131601ec 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -379,8 +379,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
 
 static void pc_q35_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
+    pcmc->enforce_valid_iova = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b707d690a6d3..29b45a7847c4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -119,6 +119,7 @@ struct PCMachineClass {
     bool has_reserved_memory;
     bool enforce_aligned_dimm;
     bool broken_reserved_end;
+    bool enforce_valid_iova;
 
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
-- 
2.17.2


