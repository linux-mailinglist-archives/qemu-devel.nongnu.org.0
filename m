Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F584C1B24
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:53:28 +0100 (CET)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwlR-000537-Af
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdw-0002nk-D5
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwds-0008C1-U0
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:39 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIDl3N029457; 
 Wed, 23 Feb 2022 18:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=F5aiZIhb/l6ji679I24bJowr3aZocsfwOnibMBDVeCM=;
 b=dQur+GcNR+g/NvngRT/qlRyaJaTAf6i/2DFiLUcVy94OgTgd08aDspjw1VBVgaZj5jhg
 tjrM875Un8I5OFYReZ8Ad+eNw995o7Sysl1MRo1kstfA/w8Oj7mxCCOZIyE8yxxPSl7c
 zshmOlXvhddi1cEEvA5DHfQsuOsTLTViOfKJYdGRLoqC2eFpCukWTOpzr42clvBL9Q7y
 GMtzEmgr3mnOhc3TlN/lATvxuTorfZpWiURwoNbK4k4A903Y5hhGEUvAuFe7rL4eMaeC
 QEizHDpRQb2xV4mSZNG1gStiuVbo2y0TS/eMFLjm26YfzBtD0OwligDb6/DaMT2u1D+i Uw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ectsx57ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIaVW3114426;
 Wed, 23 Feb 2022 18:45:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 3eb482umpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrWYV7i06BLoYtFEEwZdEu0fTwXTABdUnkrUlKpxAHlbfom2bs4bKId3U0IXXG/d4wOy7ytV5cudZSstrHk+dqc10dguxTwAkhCBd71BPoTvN9Ag2J5Xul0qQNalfcOve4tVPKKNjVGMHPWSsMhcmKEbpAiSV2yw689MrbDeZDSY5D50+15X2/1u6Ly9NWKJnNVcTI5fMuOh8ab+PrjzCDBkfEHNywQFYN9IHjkyetHTUAPh9tWHO3SP2W1dx6nkOmnvxBsCCN6ODWsL0qEwOTP90zD0mcd/SK+EVKJsex/AG+CkllP96a/6qF/Vv5dWma9DQ0qZOTdnOrganfqAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5aiZIhb/l6ji679I24bJowr3aZocsfwOnibMBDVeCM=;
 b=BwPhu0L9Mg9iW3YevWJujvf2jr2FVNw9IQwbPbs1K/1w6WX10LIOQWaJ3kDq5kj7DV1370nMk8sj6c9WGI7cOIQS9IFYxEkZqZwk9+4Ffom118LHJSJ13ZgPFWckMRmAY10WDpgTkM4FA36oScE7FAd4aMNrbEAf1cxjXO8bIZje5WTWmDao0H4XVRJ3QrpW6xvz6DQU0Lkq4GolFBuOhZa069hQ+zGaCFZlNzEyCANFuYFzDvnXEWOfjeog6mj+Li6znTAUhWWZvNihlDyfwiLdeb1XGti+DMY9xCUZRMcU9fpUOyjp0oCHnTm5wfB90EG9bylJb0BHiUIwF40ZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5aiZIhb/l6ji679I24bJowr3aZocsfwOnibMBDVeCM=;
 b=VcXktUUTbDJTnXwzBrRh3SNVVPi2Vk7rXkDkuxhNrGZJfxBwe7wBG7LHg2qTCnAFSxkB+hlzyeD+b0Z9Y9rbFSUZns2nHBB4PYbTNuxOtuvPIxsmwemxVf5g92wRe30OkQoPg3SidCgqZJkzkQsXVC/ly6s+8W4R2QlYx2OTKko=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:28 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:28 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Date: Wed, 23 Feb 2022 18:44:49 +0000
Message-Id: <20220223184455.9057-1-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b298c1a-5aa2-4c68-954c-08d9f6fca8d5
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4144135185BE0E437A209E49BB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ccRxAcc2xI8nWhUERGBEtYIAM3yRyMpMbqF5QO6uoTGIux3mJ1Zc9DAonOkQ8A8ir6Zo4E2FvM4fIeLo5S0U8nk1g9o4j7xkSlEG3v8ilGSYuvxzLMnqSFM7GkZmGIF+wylJQCYYWJaS5WE3p5YP9VXGI240yLCdS8LZSP2gL1mkX0iqVXhezgDCy26oXD8Sdz+bLJ3KrPfkadbnmXJlUGuWB6ZwZ1eJL4S6tpqTtgjOAE2F52A7956FlAi7pbD23gmuXZ8hg/fWr3vjvl7iVzFZNSHE7c3sRMkr9l5szy3m2lGNxotiVWSdUQ9HrGWeTW8kgzNiv52bfVSC8L+zhz9frXyKo5Uca63Hj3385ChMNQZEl0OK/CC33adDwdOt7M8gRb8LBQaQGpo2upkPgBH+AesrWQffwhxezOPR1zafhg+dWRJgcEMN+5vDpkCDpTMDauw++kH8aLU6LQfzlwnEC4gC9kpLPIARmNGOSMKt57+M04USFqD7zsxLM5efSyItybSG3JqTyiSr/Ln7kkwDXs4CO+5qCD5qojUmsNr2nl0FbquQ0CUtKsluvmmkxk80hI6/INPJ+0HOy3TvfHR3wemrpGd0HrRLav85WHUZflMkbRlvFsHKhxcCLST1Ff7YWSH4WmCemLy3raAYvdPS8NYui+vAuALFfFtStWO8t0zyNTL0O5O4BphgwXxJXu/fE5Y9UuaDmelkhMq9zkFC/zsM8ntIpud8hCJnl3Z6HRmfupltUKNBAd5o0e4ZHM/oB1X/Rl4ZUHK9vqctrahidvcInsPXV+YQC5C4hQaB++niPsepwF62FYf0yBi+Be4EH88BhnD7qr57RhsxcRMv5zUa2KJot8mojY1/Xg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(966005)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pfiHhjFuLotaXMibEmINKDnq7iYezGWg8iKG6rikz4YR7JjmvHfOH5M1A9v8?=
 =?us-ascii?Q?7nWGrA1V2cOv03Lq1BMx2bGCDauwdEtjGhw2JFWRRQeyAapsr5UCirNMJlxI?=
 =?us-ascii?Q?CBGb3T+K1WZpNRqnl4oSxg7VOM5Av+8wpdgTAVFFGi6QJtm6FM6slvhgdNhP?=
 =?us-ascii?Q?5RxbQw3d6T1mzi9phkqcwGmP0Q6L/Z5T/dCAHQAWcHHKe6a1cnNOmNTZfHIY?=
 =?us-ascii?Q?xznoVaWYm+6TSOj+YxS8JpD6ru3r/0kAoWd9JFJ6D/eu+RaG7aAy3+q+TI24?=
 =?us-ascii?Q?BVBguth0UkH+flSMA4Oq/BAGU6D6DjjpWMSiDZNbojpvDcZkFE78mXA29ghV?=
 =?us-ascii?Q?qnJNR5eYNaomppH8Uc8u8PEYfjx4YNZGrMkrtuH7P1wDX870BIZ5F8cy8byt?=
 =?us-ascii?Q?rK+SMS9FinwrL86t9z3tH8xOt0B9UKalmBslXOl7yuZaZ13YYcJzv1yKoR4k?=
 =?us-ascii?Q?47xNjBKlcGxT5HF7Pd5J1W8/W6JvnqIZBM6tIMucMrjuTsy8PNwdfk1SaxD7?=
 =?us-ascii?Q?JkUigajZtm7x7YKsd34+icOAWnXjdy3ScLigxdqDNVP2qZoPAoazpovHVZEv?=
 =?us-ascii?Q?AG4mSU7MzQdo0IY3YSA1JFCl8GBvDoH/ZPxBcMjf5UIyqX/CUDzM8mzQ8TM6?=
 =?us-ascii?Q?bFX/weedbVO+zTelydlkGhMMuQwGAdV1KLufW4tw38JGGc1iFQgW9/BtA7/7?=
 =?us-ascii?Q?7UHwaE46G9qXwC6WwIo5gFnmY7VlW33Z3QdHAwFLY2H5s8SqMz5QZ34Tg5p+?=
 =?us-ascii?Q?wjzK6tYh6Tbmr5za//yGOSYLEH3sedYAFaTVXOPP2R8/JvffxOhK+HjqRjlO?=
 =?us-ascii?Q?YAbUyC3GRtsgTJGPkUs3ygEorZ6Gg27ZuuSrgLCpIcEmrGpEA7NkDhbNleMm?=
 =?us-ascii?Q?LEEe0/DtpizwHoyIkRbDHeFd7QC5+C8v3CIziSIhsc87ZgQdjRUeQcHrceb0?=
 =?us-ascii?Q?+v0JlnJ2UI9LEhpWbeVPi2E8ezQWBEgQWRoRMMMHh9vzyDtn0s++ExdqQ3jy?=
 =?us-ascii?Q?jXR9sW2D+Yfy6glkpba76eeatvh2f86b1xz8Bw6D5n+Q53RLCyeBLsS0AcDC?=
 =?us-ascii?Q?JM6YL01R/i6f63BC+3sBb4UNE8vIuUl/7lfHrRFg3UMfnilniRmdpyidPUI4?=
 =?us-ascii?Q?ti4ZWoOx1b5KhcExxP3NH1yPeS/N5vgZwet7BCJSnrEhgNBJ1PUCF0/PxylF?=
 =?us-ascii?Q?E9D+7zX6kN09VHlbOGr3onUEGjx+WRBKw1PjjhCdF0cJ5fexPyYtTXxdPVIq?=
 =?us-ascii?Q?MyyTzYRfIeFMivf0n6cgpMSW9utno7IEdR7hIIjqDCQZ/TJAfJj2jgmriRre?=
 =?us-ascii?Q?yeR2Q1RKZ0tHcU1tywqJer/7nGR50Z32LSothIJ4o8ZhVrk5Z6AEmj1/4+LA?=
 =?us-ascii?Q?ukBwZsMYPop0adUUvthlF/ZhxWtDyiPwi4WJOpQSa6ozhuAo5x0pWPjbtozz?=
 =?us-ascii?Q?TgcaIXnEIF8JTZEWSq1MgeQk6rym3N2r9wGAIoLVSX3QRCk+nZdq3NhRbDoP?=
 =?us-ascii?Q?BVQOmneqVs1cOmw9XoEssIWKKl3tBe7lAENhJt2LVTm3ah24H27DM+83qMEb?=
 =?us-ascii?Q?w1TgDVhRvE06PTlsx9E8ijksa+UAo0jVMfXLLXR5ZuoHZkLwpqY0OvUJchQp?=
 =?us-ascii?Q?zVSzIEugHW7paDvwC0vCXduCCGMYW8vcXi2+N5sePuhcQI3YkwW/2nvquBR4?=
 =?us-ascii?Q?9ZhfAA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b298c1a-5aa2-4c68-954c-08d9f6fca8d5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:27.9867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaOiR2bTfsXVx+UxfZw5yGnaVvDcYUoA8L2tcSscWfeqRmpDNPNx7b4QOhzHCYFOSht8pPfBTrXa4xHOV8Y2dJczBDgsPXgZqIIn4aK5qHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230106
X-Proofpoint-ORIG-GUID: yp6eKPJIdV3A4v1yml17JdqF6ftFg25u
X-Proofpoint-GUID: yp6eKPJIdV3A4v1yml17JdqF6ftFg25u
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

RFCv2[3] -> v3:

* Add missing brackets in single line statement, in patch 5 (David)
* Change ranges printf to use PRIx64, in patch 5 (David)
* Move the check to after changing above_4g_mem_start, in patch 5 (David)
* Make the check generic and move it to pc_memory_init rather being specific
to AMD, as the check is useful to capture invalid phys-bits
configs (patch 5, Igor).
* Fix comment as 'Start address of the initial RAM above 4G' in patch 1 (Igor)
* Consider pci_hole64_size in patch 4 (Igor)
* To consider pci_hole64_size in max used addr we need to get it from pci-host,
so introduce two new patches (2 and 3) which move only the qdev_new("i440fx") or
qdev_new("q35") to be before pc_memory_init().
* Consider sgx_epc.size in max used address, in patch 4 (Igor)
* Rename relocate_4g() to x86_update_above_4g_mem_start() (Igor)
* Keep warn_report() in patch 5, as erroring out will break a few x86_64 qtests
due to pci_hole64 accounting surprass phys-bits possible maxphysaddr.

Thanks Igor/David for the comments!

---

This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
particularly when running on AMD systems with an IOMMU.

Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
affected by this extra validation. But AMD systems with IOMMU have a hole in
the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.

VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
 -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
of the failure:

qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
	failed to setup container for group 258: memory listener initialization failed:
		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)

Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
as documented on the links down below.

This small series tries to address that by dealing with this AMD-specific 1Tb hole,
but rather than dealing like the 4G hole, it instead relocates RAM above 4G
to be above the 1T if the maximum RAM range crosses the HT reserved range.
It is organized as following:

patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
         address of the 4G boundary

patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
	     to get accessing to pci_hole64_size. The actual pci-host
	     initialization is kept as is, only the qdev_new.

patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
possible address acrosses the HT region.

patch 5: Warns user if phys-bits is too low

patch 6: Ensure valid IOVAs only on new machine types, but not older
ones (<= v6.2.0)

The 'consequence' of this approach is that we may need more than the default
phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
address, consequently needing 41 phys-bits as opposed to the default of 40
(TCG_PHYS_BITS). Today there's already a precedent to depend on the user to
pick the right value of phys-bits (regardless of this series), so we warn in
case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
ram blocks, but it was mentioned over RFC that CMOS is only useful for very
old seabios. 

Additionally, the reserved region is added to E820 if the relocation is done.

Alternative options considered (in RFC[0]):

a) Dealing with the 1T hole like the 4G hole -- which also represents what
hardware closely does.

Thanks,
	Joao

Older Changelog,

RFC[0] -> RFCv2[3]:

* At Igor's suggestion in one of the patches I reworked the series enterily,
and more or less as he was thinking it is far simpler to relocate the
ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
and less intrusive. (patch 1 & 2)
* Check phys-bits is big enough prior to relocating (new patch 3)
* Remove the machine property, and it's only internal and set by new machine
version (Igor, patch 4).
* Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
* Add IOMMU SDM in the commit message (Igor, patch 2)

[0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/
[1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
[2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
[3] https://lore.kernel.org/qemu-devel/20220207202422.31582-1-joao.m.martins@oracle.com/T/#u


Joao Martins (6):
  hw/i386: add 4g boundary start to X86MachineState
  i386/pc: create pci-host qdev prior to pc_memory_init()
  i386/pc: pass pci_hole64_size to pc_memory_init()
  i386/pc: relocate 4g start to 1T where applicable
  i386/pc: warn if phys-bits is too low
  i386/pc: restrict AMD only enforcing of valid IOVAs to new machine
    type

 hw/i386/acpi-build.c         |   2 +-
 hw/i386/pc.c                 | 107 +++++++++++++++++++++++++++++++++--
 hw/i386/pc_piix.c            |  12 +++-
 hw/i386/pc_q35.c             |  14 ++++-
 hw/i386/sgx.c                |   2 +-
 hw/i386/x86.c                |   1 +
 hw/pci-host/i440fx.c         |  10 +++-
 include/hw/i386/pc.h         |   4 +-
 include/hw/i386/x86.h        |   3 +
 include/hw/pci-host/i440fx.h |   3 +-
 target/i386/cpu.h            |   4 ++
 11 files changed, 146 insertions(+), 16 deletions(-)

-- 
2.17.2


