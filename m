Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EA50913D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:14:22 +0200 (CEST)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGiT-0002Uf-N7
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgR-0008J2-7V
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgM-00046r-TU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:14 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KIMeGc019753; 
 Wed, 20 Apr 2022 20:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZFfdqyQjddt+HuYNb7Sy6JB8MQ0PtzLb81xq+TrgiSQ=;
 b=PbB3hAGfvZgP0xqa1HDTUM1BKlDg8i49aEeOd9212xSOw6COxUuG3CRDZ9VPCtXXQxBJ
 8OEwt0wP9WAIKnWFSsG8MfDX4XYBLej+wvRMjbh4RZmgWxUrO74A1w5/fa0mbEEH8m+g
 AwayP9yR6wlwDmC41xzJ9xC5Wl6cy+CG8IANFDcsUiGhhOHZVsNrD3CYx/Q+mztMNIZX
 KnjS+y5GAW3ONJCkK20aKV1N6XSheiV3Ny4maDr4wk9cnYLli5tjd3LawTlu7a+YBMjJ
 dYaSRmjiRgQQ2p+2jnyOd3y4UqVfxYZj/H/bKdxJeE+uqH/0IcEsXeHd9KUurbYjkXsZ 8g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1aa3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:01 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KKAgWH028562; Wed, 20 Apr 2022 20:12:00 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm88733r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUWj09pvnpbH7IaRbRBnLD3loFJLAxFZCVgwrBCjlSvkFa3ebBDYFuL+wTP+IPsttN5eVEVr8nEeu4hbobhQXXa9aBT7KpW7H/Yfb0qtdVbfNkc1OF4qh4OSO2ipmbutivJ0MslehMvLU5QEdHzyO0OOjPdU2wNooSbE7yIi+GPVqlaJpjIsl556CpNhppx+d1vTTZ5f0l5YxCzkzQg2v4+tAzpSBNhHpM9wPK5dYICO8de1Pw7sVzy5HmwzwKG6NLick/+XGAbwYfELBgGtzwkTmQ58Nx6YssHyfZ7eKXNtjalEOWqaWm++4IDHWFQXcVh+ciwvkSbzPIec8xHk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFfdqyQjddt+HuYNb7Sy6JB8MQ0PtzLb81xq+TrgiSQ=;
 b=VFwqmLi/AoVa8LgNuOwMPl+mb6i4WIoF/foX9ABrtcUbWo3dkx1kelaaXtzT4bh4t3jLUcI3caxoLaciTSbefgS9mawCMdnFIznyDJCSULDlxCxju5aGhJrsN8XE//RO6hDxUC44c209NbepmwvY3Y4ZtWgpKzvoZK52BI2NsLnqJYV4P3T/kF70FBtstJvPGkFWnr+VPUmalcbJlRy5giUzSCiqAlXFjJJjIV0v8Y/y1VUIKCqp6i0MCjalqnkREcuBiyfZBfCYszR8GBR1d3pCP0biZ0huchipaUNjUjNZAxlZGPnRFjtcRD6lgocbH1gt6y176M0gyxNBmW7ztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFfdqyQjddt+HuYNb7Sy6JB8MQ0PtzLb81xq+TrgiSQ=;
 b=BijoC9mg4clQAmGyJ8AfIG1aesZQN8+si59VjJfq3AtC+MON3tY6K/IjbjL2dp9K3szq9Yf2O6zDPuqisqQiYJYCe9o7sMe7w6dU5o6AWwkVQDkt3mJcAMfLeVrMa32JNLDjTiux8jkvRR+kp9AIkMjfKLEqPmmzoNGV/CwV2Q4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5644.namprd10.prod.outlook.com (2603:10b6:510:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 20:11:58 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 20:11:58 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] i386/pc: pass pci_hole64_size to pc_memory_init()
Date: Wed, 20 Apr 2022 21:11:36 +0100
Message-Id: <20220420201138.23854-4-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420201138.23854-1-joao.m.martins@oracle.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c3ad4e-49b5-48dd-c02a-08da230a059e
X-MS-TrafficTypeDiagnostic: PH0PR10MB5644:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5644CE40085FA024EC59965CBBF59@PH0PR10MB5644.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIs+Ye+AcxlOnZ/D9k+jy1NyWrPd42XICDpQYTgkdrNxxpXXonPFBmUWmkH+tUVi7I7uTMN7rUyK4PNuH3ypXtVVpo8ZgsmpPa525z0uXC5rBPMrbC7Q0ikHu2J9eaWefTVUDbqXVcKx7KGTw6V3TvGAmu0qv0z66cEd8RtB+dLuyJbhCtzG99mzO93TKbr/g3fuMi5IpImceJ0DO/xv6Xr+wXiYx6RR2IIEgvKW69vb6qwCQWL7w4bglAhaz+8bzOfSnxOQH/snM6glO2M1aS8SknPxySUH3vGWPsmcT65SzwH7fTBPU9C+ReU0ABqG8yYjP6XMbj5XEbmnPKVCebW164mbMFtxiMXAMrtx5bzlnRe1M5gz7VSDVFrfnqHRNjj46do1/aVO6Q3Wbbaq2cfMZUdfsuhEFDmMpMOhEtJmIIT7+Zv+GPu6+7oGIWO81BwIDfJf9Ozm7y/GpmBI7hwrpr+AQOL38ae916pK7ryr2btwrZ56R36h0J8pTzONPf1e+HPO/Lf784xKlOVtCqY0QvvBEWIVoETXoNnpMyfCkaiV2aMQTn8WMxrRwmOjZjfPKmhL4Hy4NIUm5ve/51Sdu1mYhOnuQklUkmnh7DCv1+m4e2JudCAJMi+PbWGExKAxNo7DuCNEf0qMigSJVYRypnNE8/Ml+YMT6DnjeVjTDEzvGU87i8suIdrjdSAUz5LBEz9CrKdRFZ8D90qzLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(107886003)(26005)(6512007)(2616005)(6506007)(83380400001)(52116002)(36756003)(6666004)(8936002)(38100700002)(2906002)(6916009)(54906003)(38350700002)(6486002)(5660300002)(508600001)(7416002)(66476007)(66556008)(66946007)(8676002)(4326008)(316002)(86362001)(103116003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5vf2Dp650FdCH7mR+iruSkxtKzHxDbeVu4Ck/qrTajOUAB6VOw7nvRkLpW2Z?=
 =?us-ascii?Q?kBaFbVddAsOWMldhOQxjjdfPWo+ZoC9XFWKWP6clEKrihquW3V1Y/SN30+Mt?=
 =?us-ascii?Q?4jD/+0es7b9HxY4fZ99u1c7kg0nLPeEJ1QWxmSsmlG8NO92fseE1KYE3DvSi?=
 =?us-ascii?Q?l6aT1RV3MpFQbWUiUy8HBkPukhJYFCJn9lo5V+Abns6ZzQ2Qc8OqbQTRIJJ7?=
 =?us-ascii?Q?B90uRChZpqKJgE1rU+t/9mD8dEjeuSJv+VE9Gfuyg4/M37k9g5HzzYUw9kWq?=
 =?us-ascii?Q?lc5/1Idwnsx8sKu9FXxbaniOm0NDzFJnOqTRTCcMiM27yu47XBU/bX+ClJCg?=
 =?us-ascii?Q?9LQg6JYoobBDYgswk2LwegQnol0Dh3t9zKE9Hu0C2KWLMaE63yPj4R3HaEFN?=
 =?us-ascii?Q?AqCimEUdX5iP56I3l5RKzlgbAqXhDtLPvIzoDCVWdm42Kso7eGYBou5t6Zma?=
 =?us-ascii?Q?bjYbIU6+qGeLIrp/ZZvWDOkP/T24LMyBJxi/osV+hxBNYvjHYiNDetBMvxlm?=
 =?us-ascii?Q?K+s4IFzK9FYMzZLbQSvpNtx03imxvOscMv0yUXGiJ9C+s0WHirynWhYsYcFk?=
 =?us-ascii?Q?wI/aIUG+9I9xbaMk76Z/2cf3K2LjkXukHFMEbyRTgs9JqdOrEsYt5lbxor7l?=
 =?us-ascii?Q?7oYPRrIN2jAJgkTETmeiImqzlM0Gk/0PZQCVWvcdFsKLt1Ej15a7GoQHktnX?=
 =?us-ascii?Q?1ds178PUrmTpqowoU4ylwPcKnWI06Ckv2hN22Uv0xJcyly44pqqGUloFcP/L?=
 =?us-ascii?Q?67LJyH7JpRf9EtXYINsUus20lS+EfmUZilWu06xp2sJcoNa5QQ64NwtBpaqc?=
 =?us-ascii?Q?vpIko2xqTdC/nWlHmceFVn8Dy3Wv1gx5OSaPVD6WeKoASUNv3ZirKZraMV19?=
 =?us-ascii?Q?bUi+0KD3ngl/BTANyRQjpTTTysLnGNMdp9EgxhOxnXwQVsOk+Os8mrPz81Ue?=
 =?us-ascii?Q?Chx9dkMXjWE9hGfRquRTbUlbtnK8vQTcojZ5tZBx/7oQDK73bSxXPeNYZ2gh?=
 =?us-ascii?Q?Wq+QpgCtmTfbqWQaqVfzqla2xKczwPk39Yza45+8hd+psYybnCHyupWQh+Hu?=
 =?us-ascii?Q?Y2AlsmvC6AkV62ZdVvnMbzZQLx3zfHvED68AJEldLbH4PkdlAoSqHveU1vBf?=
 =?us-ascii?Q?sym5ngI7y00Cjs+EWAIG4KZeyh3xmRf3+EsvUrS47O2xhHFrIMXLXZ8pI1TO?=
 =?us-ascii?Q?58cnuFsHoM+m1F5+0qoWQRltO4em5CNLhkRVaaffJM4EW9YVXCgQ4oAieMGk?=
 =?us-ascii?Q?JW4JmjlQZdzW8r7Wf8kSM2KaW+tsknYpNj0aY+bW+6DS9Pgo5p8w8p3cY0Hr?=
 =?us-ascii?Q?tliBGpY7Nc1jElDwQPZKJli54gmyEUtd0rIKjzJFjU50QDSYz70/BI0pVaj6?=
 =?us-ascii?Q?4jFwOdH/lkLdxserufcgJjPdj4L9XuF6OuCckWHDusshWLV10x8ygKyN/r3I?=
 =?us-ascii?Q?yaK5iUE/xNmnQHQ5a4g1bYNhy885lZPt2Hy8IB1FxsxqBal+pawk1WSuHudy?=
 =?us-ascii?Q?F7bxIZm1ocOGFhW2c48AUHS2VE90yPSYwhL9RUZ2Pq4aozHja2oLe2GengKo?=
 =?us-ascii?Q?onSVsBsGbX0beCL+9ii6vQJHWPODHCpdPHmOhB0/R1KaqEj9vJZm/XAVPepP?=
 =?us-ascii?Q?WuIRhADb356lS96/MYy7iv4gO3FbBWn3IJmNJHgb5RYbDyckKqqw1ZPJ016T?=
 =?us-ascii?Q?+YLgeeRsCdD1IQQ8KZUoI0c25YNe31EBEijA21rIyMLHaxjqYAtgIw1BzrdC?=
 =?us-ascii?Q?dx9+0jdj1BniUZfPBW8cnIh294bDqsA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c3ad4e-49b5-48dd-c02a-08da230a059e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:11:58.1030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9chj9gBmULdaKYqyNIDohMJub6vOC3qVGmlXOWoF6mMBxa+PbPWasph9ivC8QvBGgKoU2WJ1RyoCX0xutOlFOnYT5oo3QyPNZvAZ4Vv0aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5644
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_05:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200119
X-Proofpoint-ORIG-GUID: mwOZsPZ4QvqVehYcVTtDcxZCEAVbXSI1
X-Proofpoint-GUID: mwOZsPZ4QvqVehYcVTtDcxZCEAVbXSI1
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

Use the pre-initialized pci-host qdev and fetch the
pci-hole64-size into pc_memory_init() newly added argument.
piix needs a bit of care given all the !pci_enabled()
and that the pci_hole64_size is private to i440fx.

This is in preparation to determine that host-phys-bits are
enough and for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c                 | 3 ++-
 hw/i386/pc_piix.c            | 5 ++++-
 hw/i386/pc_q35.c             | 8 +++++++-
 hw/pci-host/i440fx.c         | 7 +++++++
 include/hw/i386/pc.h         | 3 ++-
 include/hw/pci-host/i440fx.h | 1 +
 6 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 177d98164bdf..8eaa32ee2106 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -806,7 +806,8 @@ void xen_load_linux(PCMachineState *pcms)
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory)
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size)
 {
     int linux_boot, i;
     MemoryRegion *option_rom_mr;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8f985ff939cc..00b4391e2e78 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    uint64_t hole64_size;
     DeviceState *i440fx_dev;
 
     /*
@@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
         i440fx_dev = qdev_new(host_type);
+        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
         i440fx_dev = NULL;
+        hole64_size = 0;
     }
 
     pc_guest_info_init(pcms);
@@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
     /* allocate ram and load rom/bios */
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
-                       rom_memory, &ram_memory);
+                       rom_memory, &ram_memory, hole64_size);
     } else {
         pc_system_flash_cleanup_unused(pcms);
         if (machine->kernel_filename != NULL) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 62b85ad6bede..233aaf5ac50b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool acpi_pcihp;
     bool keep_pci_slot_hpc;
+    uint64_t pci_hole64_size = 0;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    if (pcmc->pci_enabled) {
+        pci_hole64_size = q35_host->mch.pci_hole64_size;
+    }
+
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+                   pci_hole64_size);
 
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 5c1bab5c58ed..c5cc28250d5c 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
+{
+        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
+
+        return i440fx->pci_hole64_size;
+}
+
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     DeviceState *dev,
                     PCII440FXState **pi440fx_state,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 637367dc5fae..b707d690a6d3 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -160,7 +160,8 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory);
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index c4710445e30a..1299d6a2b0e4 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);
 
+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
 
 #endif
-- 
2.17.2


