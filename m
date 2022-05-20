Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C320652EA50
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:51:38 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0EK-0003gQ-LU
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns09E-00019p-Et
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns098-00021b-Rc
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:19 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9bqtg002438;
 Fri, 20 May 2022 10:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Ac6qu7TS08j8t9uCeQ0tkp3iCqkXOqQudZyRBY8Nkz4=;
 b=SHQ4UpJl79q8C/9KTHphUQoJG2Tsia5Gn4qKVcFhnuuUaDxSx7XQ8Qqf/Vbidp7s2PBS
 DdDXbVU6TI0yXEL8MgPRKL2GV423x0dZ2CZD6FVEJYmrsPS3kiwPYEd86vS0Q1Yxni7u
 Ij/6wXGeuvPGx3B9mm5SIxTalGkAqiumDyt0JhynVobNmKyDW5jISD1D8APbEbZEhc29
 eF2VV9DDaf0g26riqyQVLcMZ7XitkhT9Z+15k7nJ12U9gFyZjABMp+ygCKyZ1WWGhyBL
 bqL/Qf2Hlmjee9BPWJgmjpavLIGBedYT7Bu4+dExOGUbmdAsZwRl1MeLSCpYoKqKxebs kA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g241sepde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:09 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAjteA017101; Fri, 20 May 2022 10:46:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g22v6c9ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRArKGS+S1w+wJEAW5AoaRNa2kuZx/qs9P46TgC9I3moRNHzQC1mOG58+zpFcF5SjcvmBL4LxXhZ3116mMUTbD9cymdSChM7qJp2l0BJM6jL2valjsQGV2jRcuxzIOd/rKDAkwbaQKi3B2vVMZh3eXxeyl+oAdUP/s+8UXu8BDnGTx15mw5lodHMBF9oKV8x8pOIAL9i6THINVprT3bmomEPfyMt5/iDV9ZAarlNNhy/fX9J1xjqprqSMPMeBL47+JiIemhYIoV48ipWY/zMP6fa6dk4DD6UHeTR3mCeq9e/6lkLXiwdDipDkrRd7SRFUCFpRv7aO8gZo3xyJx6wXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac6qu7TS08j8t9uCeQ0tkp3iCqkXOqQudZyRBY8Nkz4=;
 b=KzdqkZGC95pBdhH5cJhlI+EAsryVX41oNqosGf1z2WPMHw75+CuATZl+oQ8Z72nEep3OVE+gYH1nnjvYHVgv3ABJyQNZDrahmOIyjsQaHlgpsjdASk/PCaQII2CjBNcQlnc75v+36pTqpRftOn9Crga1zbkupR6/YVvXmrEnVNZ+U31x7L/8MB1FkNHtQHx98Vzuw9jbbZADlJ2E4oeOymb9hv7iHSXP4o2mgjvWmojD/so5hsl8WTZ98g/aLcWZzHapHOajBaLOZSJ1WD9rxYPOfCt90gHjdg6WmU5vGjmJbWd+yCggTXlKPDtzzUWIrDy0gL1/PHjWuweabCKchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac6qu7TS08j8t9uCeQ0tkp3iCqkXOqQudZyRBY8Nkz4=;
 b=XJMe3alcwoCjeNzXinWV+aC4ciJHrzEP8QlfXRbIoGRz0nYyhjTdYD4wJZRccg9PDM4UA+Q4nasANJrzAo+HilZWQv2HHxllppTL2OUZpWyykylxfGLCwpS+Z+OD1x+HqNUcjhCjzVpoipCIayWybXWqeZKX6125jnr12sN511k=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1378.namprd10.prod.outlook.com (2603:10b6:404:44::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 10:46:06 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:46:06 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 5/5] i386/pc: restrict AMD only enforcing of valid IOVAs to
 new machine type
Date: Fri, 20 May 2022 11:45:32 +0100
Message-Id: <20220520104532.9816-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a4c46e3-51d0-4a42-a65b-08da3a4df12b
X-MS-TrafficTypeDiagnostic: BN6PR10MB1378:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1378093771F111F71C7CD85FBBD39@BN6PR10MB1378.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJKH0k1xsmhXqH+AZTl9aRyubf8lQD8ahenL3StBAhYwuMW542n4EanCRD+LVaCL8uyfIR59P4l7Jd8wBtn6/oS7xN/1/4W2M7VW/XDA0iAOGvmACgTXu5o68dQmqJdB9pWWj4GFMEe2UnQKEIhBfZc/SRgV/TmPaC2u2nlNMHrXNtW6YivfOAjpEEJDHR9nxrImm2573vPXAHsCGQhjROkpbJq1RcF0B9XoKuPC3DFsU2Z+Pnbtx6E+FvqojRVpswYyWDlalXZtCslVpjwvErtKWWiQPEE2KkTRL6E1x2bQ9OH/b35kV8VngDln/WBvMDDRULgDpX8IfJCIo6Rd5Iiw5hittsq4p3AlJ3EvBbW/6RQmREM1jxT+d/WK44VHMVYl1Pq0f0l8RnLb4dkqog1Nxw2g7QbOF04AZsvo0Ahe+Q1nOTD//E/QJHmM1V3aWHDujiRAF9MgDPrzc86OH1PWpYZoYdTKAh4QJCSpXYl26imXtQFzAjD6Zhpv7LrZTkGE1GHkgETPK2WQ3Ih+c6lxlblLqG5cFc4mzj+nmd7S3dVgZhlek1G9UJfdsn8M/4b+pqCICUulQglR2lH8F9m2s1tN67c7YrCoAs5J/7y4X5dqZznUS925IareC+ty80nsXe4Trmya3iZvz/virT1yyF7ZXS2yMYcfn6NyEy4SN6HEUR1FPKp1KhsEZtTn7bemMC4P5tdyERWTcyiMrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8936002)(66946007)(6666004)(7416002)(83380400001)(508600001)(66476007)(54906003)(6916009)(66556008)(6512007)(8676002)(6506007)(4326008)(26005)(52116002)(2616005)(38350700002)(38100700002)(86362001)(316002)(186003)(1076003)(107886003)(103116003)(2906002)(6486002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lq/NgRMScQAhXKJMOGvZDc/Am6p+puiYZMBaEWD7d3JcEnnwQHCVsIktALcQ?=
 =?us-ascii?Q?9MHtgyHmAoOkUtDiZCVavfw6/vPwivSPo4ibllvsDVrdrWpU5BLGwYT7N1TS?=
 =?us-ascii?Q?0uNyZa5QkdHuFwSpHrnkejzjsrczS/tvNq6kHdpampJu0szYf8CUIbhug4Tq?=
 =?us-ascii?Q?eKGrBG67bR8OE3YVcCmmQ3wJCVHJjECGgQnm9zNEA2PRJYhDx+CbDZ1Le362?=
 =?us-ascii?Q?8/0oFAEmLBbgp8z58J/dU+rbqTYHgFprlANZYy+pVbXNXa7vVHMZ9nvOJRkz?=
 =?us-ascii?Q?EiII1F1wp8SEr55EbOPHye5OMSiYblmEw3tKqNaL0kIzLZ5uR6YoeZhzsLk9?=
 =?us-ascii?Q?Z7Ykf/sqyEufa4XoNaP1mhllo6LQb3cPNw3pOXdsoTWeHnbWvS15g9ok1xYy?=
 =?us-ascii?Q?xcwA5AX4Bpw/ZwaqxDL7XRcWXnbmsmrOTikJJGv50pKShTVBMTDugfhto50q?=
 =?us-ascii?Q?N/Ktn3cZ4s6LfRa3nOJBA8RlOiOTKFrRNEQPHi81D3RGE+TjRi3MZFVc9jUu?=
 =?us-ascii?Q?JEx8XXsqMnm866EksL7Cod60Go8unDqm22rldNIwf12sZ1GvyrcDKnmRzWgc?=
 =?us-ascii?Q?4tNL5zs3JJA2dQG3ZqfpeaNIuwgv7MJdcAYWF7DyffcxlrvYC2JwJwDdcQY5?=
 =?us-ascii?Q?DQgTIM4O8/2B/AmDbS9FxUVu31Yy0xzBbYpgrO4UL+MVru83Owy58MzX+8zo?=
 =?us-ascii?Q?hZueXSnDdsUZi0qbgzzjacXIQC+wvr3O0UDkSzHinzdS3JugLzGZtlpHQ+gT?=
 =?us-ascii?Q?96iZi/YVbdubufRr68/lifxRJpU6a+sn1J5OpfrLSp7VJxdflXMK9TaR2WuO?=
 =?us-ascii?Q?OAFKcTlG96f33yvzSDRwln2uCFihO9PowIgC0uNQnrI1r5IBNSFDJ3JlJ9/E?=
 =?us-ascii?Q?udHCwSvXGgk5F6gt+EB/70eSmEKCMjgsXEiXcndh8zqWW0Qm8VsJE8192esl?=
 =?us-ascii?Q?eG0ox/yZ+4DbfNqGlNp0frD78ZqGJw6lR+4E4UssCS6z1dLrL3c45w0LcXkF?=
 =?us-ascii?Q?f8CfmSt/iP3FQy/1Rhrg/bojXlOWcYqMlWyLR2mwCVbZEBecz6S3pmEi/QyU?=
 =?us-ascii?Q?XYq+vdgY8hiR5MxnyZwm0fO9gpeKpSYxEU3T9FCx6j9gvS7mX+aV8UDoKY9n?=
 =?us-ascii?Q?X+5KJyETE3FHQiaRXK2l8vS23kjMAC7OszsPHZA8z3v5y7qDB02dxplHMzri?=
 =?us-ascii?Q?4VtAUCCDXm+dvTrmotwlo7fpTdbIzbnvPtFNA4PsX8ivAu1CfNiSI8mIgEOJ?=
 =?us-ascii?Q?RdEzyHclydnshnhLaGOov3YUiX3e4/CsQH4+AsqIWuY76dEpgFSIuyOhWyO/?=
 =?us-ascii?Q?CMQ1Uz+fn2VmZRkHuNpF5jDybQxnBXL5kNGfRAfUDWIoz8oipmzMQ48hcyDD?=
 =?us-ascii?Q?7raqscNvRa4h05wb7tZoLU4vn/148jX8qUVCzv/KpZUzvW3De4jW5z8NgSpp?=
 =?us-ascii?Q?UPMhCvrHWaMYsk02gVxDQBaTf/qTWjfkEmX2GbaKyMP/ODo6WYvo0wLkWg4i?=
 =?us-ascii?Q?dUFRJQrLEoT4PkqyFfMasmdlTeaP+SaHjflW5IsO3wBF9J4z4AtX75CwiIPV?=
 =?us-ascii?Q?DYJdfaMtQqmzx30cSZBQEJDC9U8q1y+kNwQn+LSRMmtHBCrhG7tVVu1Tuj8C?=
 =?us-ascii?Q?96n0LwYMbaJND7rO+AAXb6xaiiK+n3maGw5qcdUFuSssCbyt0G89iBMkNNE+?=
 =?us-ascii?Q?/yzUWJ3ySPNDlFJUIEf6QUC7Tyxna3yyQipZFS7TP5KsDF80RzmUKuMG6B/Z?=
 =?us-ascii?Q?2dTBqzZd9QEZWbz3y7YFayeaR/IlVtM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4c46e3-51d0-4a42-a65b-08da3a4df12b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:46:06.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRQXCmWNUe9d2isNj01QNQu6IokhACgQpnJshGW7pfZGQLdwfPS+RMjVTJbApYEHYB8/BlQw4yB8s4YwRvCqJyL9UozKsrnNUKVYJHefvbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1378
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200079
X-Proofpoint-GUID: tPQq3-dTmgchROzatlSu43UYa3cETghQ
X-Proofpoint-ORIG-GUID: tPQq3-dTmgchROzatlSu43UYa3cETghQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 652ae8ff9ccf..62f9af91f19f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -862,6 +862,7 @@ static hwaddr x86_max_phys_addr(PCMachineState *pcms,
 static void x86_update_above_4g_mem_start(PCMachineState *pcms,
                                           uint64_t pci_hole64_size)
 {
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     CPUX86State *env = &X86_CPU(first_cpu)->env;
     hwaddr start = x86ms->above_4g_mem_start;
@@ -870,9 +871,10 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
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
 
@@ -1881,6 +1883,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_valid_iova = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 57bb5b8f2aea..74176a210d56 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -437,9 +437,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
 
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
index 4d5c2fbd976b..bc38a6ba4c67 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -381,8 +381,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
 
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
index 9c847faea2f8..22119131eca7 100644
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


