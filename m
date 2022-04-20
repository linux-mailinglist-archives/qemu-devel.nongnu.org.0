Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D91509175
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:35:16 +0200 (CEST)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhH2h-0005Gl-5b
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgP-0008Ef-Oc
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgM-00046q-MA
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:13 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KHtmlc024600; 
 Wed, 20 Apr 2022 20:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=bkCBpaEdMfwp5++DTO+dPJHgqI7Gi2vI9EplTww8tJo=;
 b=QxifX5jvrQRB6wxOGzvFiiryZlEWq+DRxYMTNJwLhI6+g/yMLkSO8QCNRLdLh6nSEjTX
 R7EY+jQkBhz/pBj0GZZhKdijgqGYGzzMBxyzY2cNOMMzUlVkwxx3keYzHGlsexlt9Cqt
 d2M/FSMjjo9GPG54zS+k3TkuxPODjg58lq7Yl2QG5kL/EdLjvxdh+4J+xZZoUglKji9l
 w888X5sIfNFi23xDCDMmPdg31/1KM50fjwzx/xMssoT1+SwpPmqPoWbqDr4tfJ0mLyQB
 bt/txVj5jzHqfjWeq1k8E//wsIJ67nM8UtHoyktJ2iehuB2uifBkArszy3UxOXd9ayzm kw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9hxyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:11:59 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KKAkkD028909; Wed, 20 Apr 2022 20:11:58 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8872xr-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxwhgoFAZIVXjN612e+bfq1gpXdwIFWc5B3mn8JUkeDQTI3Y0D/Wt7iMSUNnVfmwA1CEIzW0LB2h/vy2hHFclB21XKNtYq+Rjx6e9zAyCcjHJFyaveLdJW0OLd6863JgEYvsWIGhLfxnZXG4ZMuCU+xtKfSjL7gaKiuKTt8L67meytcHPIuXKmgY9s9yfr4lUuW1bYfpumoACQ6XcgUaQ/A6F4av9tVOozr1+HpvAwA6TwcW3mRBxlL3qEXapfXH2z5ZcZhnjpGUVCVfrT7u4TEUBWuJijsp6DVSa02+cAA9f0VYC1VWFgVncllvgCaj+KliJ8rW+Z2UzcUk1Jx5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkCBpaEdMfwp5++DTO+dPJHgqI7Gi2vI9EplTww8tJo=;
 b=fOQfIBZWE1oe9WHQvn5hwghGXDGAkicsNMzQV5WEELAKrlKcBKzriTXT0uT2dag/lsvZs8Fct045kuhse5eOcs72CwBZTL6dr3X/lZ4NMRAc3aKQEp+ZGLOHdargLF/b4tNnQ8iY3IMejb2CZTWLz4LmbnUsKdSOag/DL2oZiZWzhBVIR0PKqfSihWE7/S3aCAH8F7pAlu+AmBwF1CG3deY2+gzIk7Dy1F2k3HCsaTohr46Xiq/auOlUZEDj/OhR3xEWXGcW1dhO8nztPULuSNHE0XVZAwIoVBxnKj+Q/SsDAfiq/BXxyR+dJfFu4P9vFkMcuiqtaWXScA5CZQVfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkCBpaEdMfwp5++DTO+dPJHgqI7Gi2vI9EplTww8tJo=;
 b=Y5s15bnlfi0YiEPE9Gx/AFmJ6insH9KKmt/D2TbHGs8paKMhDHVwPhCJF0dvKDKqhRHqlBhp2RkISV/emWeFeAsNzT9AMifGNzcgtbqBiPk4CSUaOnndwciaSS519sBPotFCjPerMyxHLRJNntzNiNCyQ3D5PsURoESJcrNZDdw=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5644.namprd10.prod.outlook.com (2603:10b6:510:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 20:11:55 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 20:11:55 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] i386/pc: create pci-host qdev prior to pc_memory_init()
Date: Wed, 20 Apr 2022 21:11:35 +0100
Message-Id: <20220420201138.23854-3-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420201138.23854-1-joao.m.martins@oracle.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aec42b05-fa05-46aa-711c-08da230a0447
X-MS-TrafficTypeDiagnostic: PH0PR10MB5644:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5644529D61955563849AB84DBBF59@PH0PR10MB5644.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0tcA7BW8ma7bpBGtFZ38aFvkuvzv+ljsz+PvafUzyKZoBZUvEd1z2zi028wqMXm9fVWqTf/cMqSOs2pm/tb5wmg9K6M1wXXJM/jojeGNOYj1gqqIQV+Oj16KumXf9SeUffOTYhLkLOMNlj7KXSu7I3ChiWl4nG4talMKXpOpNnD5Pqi2FmCzuOJcYUTZqLmhZ9QYMayK2mNZbUn3a5+6a4twQMkeCJas0HSsaRqLd+E+1ElaKlPQgCBBk9PngGJIto7rrMLrYoskMKe5/ty4tnmxhhdGZNSqEizHo2mFmHzJZKkLWNWv7azw2ZvqaJm+YlvegY1hUhIEox5oWmfoMSSgX7gyhOcVt13lDMqVXr7cPn7dd0Giz6rmBzVc9AWEX+1AAvXUgJ1Rot/lyDu9RXsMLnDF4RiUjolOTBkEOZJznD88/Q+MciEuQWRFwygKEa57r+syt0apZU8yvoHT6ZJNhSJxSuEAt75BGSRE0ZWpoyeH7GfNvgJ0s/yw1kgfgL1O1qt0zrwaFIA4DL4NUH0ebpO0vF6JJVnuejFQHNyPqgH7spzax4swKYJpqDRdLEVkbU9xlGT1+XXAzz74Ai0K0WJEMcPgV4Na9MZ0DSZIV28iRWCLrMRUzr4xglDRwtKPA9GccfyPaeUDvyRaWmijTV93sf/+FseCqDWj9Rrb1xlvbk/zaB85bTily8VlZkw3NCoKxKAgEpM16WMEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(107886003)(26005)(6512007)(2616005)(6506007)(83380400001)(52116002)(36756003)(6666004)(8936002)(38100700002)(2906002)(6916009)(54906003)(38350700002)(6486002)(5660300002)(508600001)(7416002)(66476007)(66556008)(66946007)(8676002)(4326008)(316002)(86362001)(103116003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rYN7+NhlHY+FLpio7CUScFgRnzk+V+ObDVzhaoxgKGaYY/AQ9nf2nuqjFNsN?=
 =?us-ascii?Q?B1DMpUMnGubDoVsr863ktiW9y91TxQvPXq+SK2HGYE81Wj8ID8I+osvOyoio?=
 =?us-ascii?Q?AgzlYgeaLYlEopT1hqbs57peQ9I4JeJAG7ed4pRtgn4E2Z9BkU6tSKCnjojg?=
 =?us-ascii?Q?RYCkD/Bs1BC9OV+VOofUHoTNv44rMeF9WrxSpYUFoublXO+KJXrp2wWTsfTc?=
 =?us-ascii?Q?EAB2x1yCoTikxvOP1e4yInVB1VmwgFM11Ata8HBXIHL/XZjjxJN7gqAPPqUl?=
 =?us-ascii?Q?N3DGMuntYvB5lAaG1yA81MhpsOD9UsTMDvRnIzSM965YYOBqC0YEhxjl63kY?=
 =?us-ascii?Q?hELsfDjOfYNWroK3lZyKWwoP6HEl+xJVL40kEjsoNWyCauVZo2WnnWsPwxmW?=
 =?us-ascii?Q?CfG7htjrFYiKfPUsYWfiLoKS9PVFy/Mjp//w2A5CM8nK2GrHEG+4G2A8D9dS?=
 =?us-ascii?Q?JHqu9XEVUFX+Qw7uPFj6kMBFKte/LkhNogK9/5CWklDEXWzYPH9GfZ0XMJ4n?=
 =?us-ascii?Q?u9N3v2KDdu2099CYrf0TwBFluie0mY1v2O9+azOW7zaozeuAUwsOi/uVw87d?=
 =?us-ascii?Q?TOB4+LrLoxZb5ZyYuQgtAjCB3GdoR4CZpjoPoCtxGxWeA3/L0ggh78CiVlUc?=
 =?us-ascii?Q?ecIk2Mc4W29x5p/C+0L0V9ZqiM6hNoKNk9Bh2FKlnrmJ5zsNX4z7hKiPlL89?=
 =?us-ascii?Q?X8Qrlme9HlfkbagYXja6EofNiBBTtKvmWJf+7PFLWc6OHvTvw4W5ZQ9ecKzB?=
 =?us-ascii?Q?JQExWj6c7fFSHteDb6VZ51oIPMqBD7UROdEZO+QJgiKJ+0mDX0ggvZzEetHj?=
 =?us-ascii?Q?ki+h/No6CQEW5Xn+U4kvLGI75dLYHjClHeaJX9zZaZT4Xh9yfT19czblQ8Xr?=
 =?us-ascii?Q?BBpCyO9CekWRaGtGn8kMy9QZJofDvk6nCSooaiiAGX3G16E9Lzpqt8oG6oM0?=
 =?us-ascii?Q?aiyZwQ8aYUjS/2l7j138BhnsU8VjOSRNvyiQRcvwRD7r9XHDQJSXz7wG3Xkf?=
 =?us-ascii?Q?ZDJ7S05PTg1MdyuM9q84LOruZ3Fe962np841sjyMeO/70R3lkZ61X+EwdEmG?=
 =?us-ascii?Q?qeTNegdsBGgYll/2ipdjmEepCtIL5Gw8X+YVADojsRlbpZQg49WJlfj90wif?=
 =?us-ascii?Q?YytTNrz/+xxcTrwcR/kxVnzviVB91g+2czmJmWj4c/Vda5E/e+v/KymhgmSh?=
 =?us-ascii?Q?2fS9ARWUH46J1PuWu2FxwcQI2MwlaEj5aOEJQ53m/hAtW4geWwko69Q5wUt7?=
 =?us-ascii?Q?RbOE00lgYzry0BRHRkGjo7zXiaZzIQR8StW2KK+rBPG/37oCAzUdFEdl3Eh2?=
 =?us-ascii?Q?Y/KqGUD7nOBfe0j727EAdkAXS0XkEEQHruOfvYhOTH8zgbD5w6Se+JcgKpPd?=
 =?us-ascii?Q?nptuvkjqXZaQ8mqv2t8LTYAENqRW30UnSUl4AXZ10Mg8Qid9RcTysEjENpRg?=
 =?us-ascii?Q?HWUqQiCNhTXNUB+Y31F6BGYHtSHXcVHo0l129y/CLxSHbUcMBPPm6/hCcIC+?=
 =?us-ascii?Q?Yb3ZGF3eTF5i02BY/LjDcLedqdQQ1b7mWWo6QcdL7iIMsQlR6lLEvvY3pKf9?=
 =?us-ascii?Q?WHreE8uG1hU596wbzLl3NXOrbt1URSjpUrzHO/wNXlLUmpOaYaoxEvKZryB1?=
 =?us-ascii?Q?46WvNrvQIDwlo2lu1xKFZtInIFopzOaIHfR57y66+k8d23UghZYSbdX3vRId?=
 =?us-ascii?Q?RgHVjl3WTC2yeMiSEECqrTDA2kz8I4k/C1wIows0dAaCps+CU972yAv4FbEA?=
 =?us-ascii?Q?E6W0ly2w8yjjCgkXKDwMxc6j4fHjpiA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec42b05-fa05-46aa-711c-08da230a0447
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:11:55.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nS05q8gLALbownNruitbRfE96J9TwNmGzS4WOz9NpvQxHAhLu7M0CkxcoMbxDhGRyEWm6/NQTnyjICsHq1LxWIaPtK4ClOfpJBUNs8QGRgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5644
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_05:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200119
X-Proofpoint-ORIG-GUID: AvGVCsm9Re6wnBMrjAS_0IBNy_WvLqLQ
X-Proofpoint-GUID: AvGVCsm9Re6wnBMrjAS_0IBNy_WvLqLQ
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

At the start of pc_memory_init() we usually pass a range of
0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
32G (q35). To get the real user value, we need to get pci-host
passed property for default pci_hole64_size. Thus to get that,
create the qdev prior to memory init to better make estimations
on max used/phys addr.

This is in preparation to determine that host-phys-bits are
enough and also for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc_piix.c            | 5 ++++-
 hw/i386/pc_q35.c             | 6 +++---
 hw/pci-host/i440fx.c         | 3 +--
 include/hw/pci-host/i440fx.h | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4c185c72d014..8f985ff939cc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    DeviceState *i440fx_dev;
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
+        i440fx_dev = qdev_new(host_type);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
+        i440fx_dev = NULL;
     }
 
     pc_guest_info_init(pcms);
@@ -199,7 +202,7 @@ static void pc_init1(MachineState *machine,
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state,
+                              i440fx_dev, &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 302288342a91..62b85ad6bede 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
                             pcms->smbios_entry_point_type);
     }
 
-    /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
-
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    /* allocate ram and load rom/bios */
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b6e..5c1bab5c58ed 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -238,6 +238,7 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
 }
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+                    DeviceState *dev,
                     PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
@@ -247,7 +248,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_address_space,
                     MemoryRegion *ram_memory)
 {
-    DeviceState *dev;
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
@@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     unsigned i;
     I440FXState *i440fx;
 
-    dev = qdev_new(host_type);
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8fda..c4710445e30a 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -36,7 +36,7 @@ struct PCII440FXState {
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
+                    DeviceState *dev, PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
-- 
2.17.2


