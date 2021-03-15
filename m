Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478333B24B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:12:17 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLm52-0000c3-0x
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLm2Z-0007Ii-Sn
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:09:43 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:41342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLm2W-0001oq-3j
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:09:43 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FC4ExC041345;
 Mon, 15 Mar 2021 12:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=KXM4bL0MgvRbtaErGXKWsXtuZXj+jA0RWVVeE/OA8fc=;
 b=PYOr7XiK1PF2PxuAlPBZjSInz+5L1FidXK0FkbxaWSMoUsji4B7CCMubv2I/iBtAZbn7
 rvsCKR7623t+zjRZPz7kWaZWiVWQFB2zUAxs2ypiZsK3AJCX/+z+ebhjSL2mxjDJ7zJo
 AABDi0KBkvD7oAJWpZBEtqujduM8Y0Ctm7t6EPOxzPjK8uqfcfuWjFEt6YY1Krg6Y1Kv
 AZFhfC+bWf5Te8fRXY34l7YWbR2RBFQI3u+U6TrO0CE2/OARBDswE5eX6iTjwUJKE0bm
 rrNxf229GS1EpcCUhUIC8/qWkeQ9GU/dQGV6OIFcz805rIrmZbEXTHsAeBFwvdPTWnED hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 378jwbbpb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:09:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FC5864123233;
 Mon, 15 Mar 2021 12:09:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3020.oracle.com with ESMTP id 37a4ere829-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN16hP1JpLZt+vpaghHQsnXDxI9xvvNFhSSNNB9yoqnuP6kFSGm9mwge8RMMdrhCByJfY4uDwaHbQXUZGvfg41Ftw+kOt/bjfZevnKjqmkwN3q7bf4ccBOFURWJg3yimSyY7rPAPybCMu5ii9zyPAVnXcbBBukHgGNM3EaYXxC+m3CNW5H5pdYHiEhveLo4Lk7BC7KqenEcbz0CaOCCjsOSIkpUi7MJayckJjsh8kuABYffCMi1QuBpzHLvGQdIKcQW+pSBGrKOWmpNpmvj1Mvbs9WV/+u6nSrLQu61dhcK/Psa7wtDS7XnDZbBWFuFkNFDJAVibLDub04UvsaPFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXM4bL0MgvRbtaErGXKWsXtuZXj+jA0RWVVeE/OA8fc=;
 b=kdsaR3kkp9uaKjDpM3paJQ3ylRcWb7ZOHDnyjZgh5ibHSdp6C4nwUiQm/YE2DBEQ9BhdhINWWekgbs4O0VWfiSsN7cwY/9zS5iKz18YXbhk/1RU7N3/5faDusaJdQayi1E0+EgxDPNFLwXlIAbmMGHh0HfM9FL9Waksxy5XJcDkfcti6Sy9zk/DrYHJngO1lH97tMhpeAGBH0lqqQzaARenACF5eQmiiTbiI/t0/CRNMHrhjntYUih71LvWfdgw5tb9KCwo9Z0PCebFmsieCYneP5hppQKWsl9O+HNCUI4xoUva0wAMIknk+aPxZUKhBXI5N1LdG1U3RR3xGb2lTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXM4bL0MgvRbtaErGXKWsXtuZXj+jA0RWVVeE/OA8fc=;
 b=Q6+l80YddT5DVTqzMhygJo8bmdjix8EF57r0F0h0YEhVDrOWtfMnzoMOS01HGvw/wQDihaIsijgw9DnQHkqvYyy9y7dL/JmlV5RKWx/Qvdvj5yZOTMmwm1jvOfv92Qrc9pRtZpG8WurAPfh5pPxWE0C5Dfow6uOzf0hPoDGW4Cc=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DS7PR10MB5376.namprd10.prod.outlook.com (2603:10b6:5:3a9::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 12:09:32 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 12:09:32 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/3] memory: add a sparse memory device for fuzzing
In-Reply-To: <20210313231859.941263-2-alxndr@bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
 <20210313231859.941263-2-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 12:09:27 +0000
Message-ID: <m2y2eosjns.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0316.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::21) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0316.eurprd04.prod.outlook.com (2603:10a6:10:2b5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 12:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e255e5a2-7e37-4480-230f-08d8e7ab30e2
X-MS-TrafficTypeDiagnostic: DS7PR10MB5376:
X-Microsoft-Antispam-PRVS: <DS7PR10MB5376EFFB6D0F851DCB1E4DB5F46C9@DS7PR10MB5376.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SoW/cu4drCb6UV9YUkWAasSzD8IUEEDwYU91kOf8sib/2us2t+cTrzFKOahaPWtcmvGN62meIYls6+EgJi71QE4IubEQ8MRfMkcKNpYumk489eS8JPx6SMNumb/o0c9p0u9bP0gP2vZGxwSbLMJ1IPoQ4C4bRdyf8LoTSzz8whq25hE8p9jbIgE7Yf/mjpapEl0bNEZAWUGGNLhwlFj6Pue+bkRRuWHYdwQZQnDaYQNtcPSbhavW8N7Tsossa1WJvH7R8emoGNXdyYCkC0Bjj6ZaVBKTgDF88pZJmpjCL2iNr4UQudos7FEXC8N5TKMSnxM+g0dSFYJP5JLQq/1X3dJdDtiFvV/YNUmGRw2KvxB9ISr4fr6PMzNqC43f3ui+L2UHQWAV5+Hc+dsFU9Vh0NpyrMSRzxkMb7RTMwZu6GDZZkBjHP6EG/m/8FPEfSgVa6qZSVJfzjyBGtZpAw9Pdw8vXGxHDallljoYYW1NPWCR+duPuNJ/niLmRcpDdZ2+wiUHdYMci347rLVgcpR7t/ELCFnFMfv/9j47exNuq1FJmD05jUpIc4w95WolM19s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(2906002)(5660300002)(83380400001)(316002)(44832011)(7696005)(8886007)(956004)(66556008)(8936002)(8676002)(6666004)(52116002)(86362001)(16526019)(26005)(2616005)(36756003)(4326008)(54906003)(66476007)(66946007)(186003)(478600001)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fgm4y6BaNcIacX6vJQGo12hxPawapIx1uNqxV2msHBYIwFXB7zGqj8G6nZSK?=
 =?us-ascii?Q?sprw8orMurAaWv9PE8WkF1lVTQkQd9IFDjltIrTDlVkktCjpq/QyXdb+jxbz?=
 =?us-ascii?Q?YGDFqFhihuc2KXgopnbQTzKFkQSompwnQM23TGHjEgPEbZMiiTEnzo5x8Vz2?=
 =?us-ascii?Q?/RPswMaPbzD25f6HxxjSQJHuGXWU07GlAXsv2t2GNuKlEFdE1O3KUNAiRcP3?=
 =?us-ascii?Q?htcfYS0/QgOZ/PJiFNaRKOs/Rbkh0ESmaKXC3ZzE+AxZ4NgP7MNThuJtJ0Wi?=
 =?us-ascii?Q?UHItt3c5Q5MJtmrNoPIwKNq8Lp23wHnq3nRmNOE5sbu8hszNpsKanldUNCN5?=
 =?us-ascii?Q?1MsUIWFCy9d3vaC7hw19V01EBua02hUVyC9TMQ8JQyXNieMCJholiBaQ65u2?=
 =?us-ascii?Q?XVN/0ArjEDH/CSZIHU/K1tZQtpzB1zPtQ7k/1u5RBTmn0qpT59Jql98rRx3u?=
 =?us-ascii?Q?xJRz4ONrOS+JBHJ4DvQqIMhJ0JOTyw3b/Wy1glRZt23mXfBYoMHXwWukr6f5?=
 =?us-ascii?Q?GZq+As1aRUuvpMG1cdzCeKiVB1F0BGZGjKpKhzwQU3v5JRQLpwfn8y03lNOv?=
 =?us-ascii?Q?QbWcxxElGa1pVVzS0LsfVZF8kZPdqFMmt75riE1NMmuTj2JNL8mXrYy+88k1?=
 =?us-ascii?Q?rYL9hHcu+ATD7Oz6midUL/VhO3U+hbRo3QdYKtQoV2hb+yOXiYGBL8Ci7BJW?=
 =?us-ascii?Q?78MfG7b3BCNKot3LsU/UfwDXVAWxakVhgyzS5yW591XnhhnLpIfFIp6t2qQy?=
 =?us-ascii?Q?IGV5/sBgXA9aiS+FVrPHyCyNIn2Hz3wZnodSJFaYmZzqlCrWxqsqmRz58/+T?=
 =?us-ascii?Q?5XFpWe+k4vzlq87hKx06yGXAGjPHEDxGfC0kod2dffAq8Zfr6JgijeqtLrgq?=
 =?us-ascii?Q?xArEldf7Tj8m3SJHb08jbnEHKk9kbPMS/EQn0eJbP3NV3ckcl3q2fkBTy1kK?=
 =?us-ascii?Q?oRIhqBwBbJS8mSYjFAtNA28VGoWC3ZMKpxvnip5NL0fpEoE+UAPEQUy+i4WU?=
 =?us-ascii?Q?7/dunioksaMb6jz4Ft5TYbuEr2yj7jVxQ6dvM0AZfybeprIM9HDpuHCTh0Q5?=
 =?us-ascii?Q?+fbXCUacH3xdRVL1sFw3Hrh3P4K8olbtRs2zRkql0T5l5jaq7G0dLJf5ICQJ?=
 =?us-ascii?Q?bQLo181GsXaozbzKrRbTH9ZTnrZQekwWmejxeGDK7iV2YO101IspEkd5GtMI?=
 =?us-ascii?Q?uVoXgPo8UJzZI+xWr9S8uUXrbQo7+VuSGPLqx1r4PQQOP4b5iSto4Ny3zWgP?=
 =?us-ascii?Q?oeyz0K08hjOW1vBdsCzr087TmhLJX6rCGdxjINlpD/cUGIZBtjVNReJn/F1m?=
 =?us-ascii?Q?kq6uPpB0ILSwuwUkwwobaysK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e255e5a2-7e37-4480-230f-08d8e7ab30e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 12:09:32.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjKe/E/Fz4cRx/00UYew9BClg0loTO1Z/yd37vQNneA7dSFN5k9EfLe1UZNyrWi4lLxCw4PpsuC29VFCjwGOoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5376
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150086
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150086
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darren.kenny@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>, bsd@redhat.com,
 stefanha@redhat.com, Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Saturday, 2021-03-13 at 18:18:57 -05, Alexander Bulekov wrote:
> For testing, it can be useful to simulate an enormous amount of memory
> (e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
> When something writes a nonzero value to a sparse-mem address, we
> allocate a block of memory. This block is kept around, until all of the
> bytes within the block are zero-ed. The device has a very low priority

I don't see code below that actually checks if a block is zero-ed and
removes it from the hash table, so is this comment correct?

> (so it can be mapped beneath actual RAM, and virtual device MMIO
> regions).
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  MAINTAINERS                 |   1 +
>  hw/mem/meson.build          |   1 +
>  hw/mem/sparse-mem.c         | 152 ++++++++++++++++++++++++++++++++++++
>  include/hw/mem/sparse-mem.h |  19 +++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 hw/mem/sparse-mem.c
>  create mode 100644 include/hw/mem/sparse-mem.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f22d83c178..9e3d8b1401 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2618,6 +2618,7 @@ R: Thomas Huth <thuth@redhat.com>
>  S: Maintained
>  F: tests/qtest/fuzz/
>  F: scripts/oss-fuzz/
> +F: hw/mem/sparse-mem.c
>  F: docs/devel/fuzzing.rst
>  
>  Register API
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 0d22f2b572..ef79e04678 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,5 +1,6 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> +mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
> new file mode 100644
> index 0000000000..575a287f59
> --- /dev/null
> +++ b/hw/mem/sparse-mem.c
> @@ -0,0 +1,152 @@
> +/*
> + * A sparse memory device. Useful for fuzzing
> + *
> + * Copyright Red Hat Inc., 2021
> + *
> + * Authors:
> + *  Alexander Bulekov   <alxndr@bu.edu>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/address-spaces.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "qapi/error.h"
> +#include "qemu/units.h"
> +#include "sysemu/qtest.h"
> +#include "hw/mem/sparse-mem.h"
> +
> +#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
> +#define SPARSE_BLOCK_SIZE 0x1000

This is assuming a 4K block size, should that be the same as the system
pagesize is? Or will it not matter w.r.t. how this is being consumed?

> +
> +typedef struct SparseMemState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion mmio;
> +    uint64_t baseaddr;
> +    uint64_t length;
> +    uint64_t size_used;
> +    uint64_t maxsize;
> +    GHashTable *mapped;
> +} SparseMemState;
> +
> +typedef struct sparse_mem_block {
> +    uint8_t data[SPARSE_BLOCK_SIZE];
> +} sparse_mem_block;
> +
> +static uint64_t sparse_mem_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    printf("SPARSEREAD %lx\n", addr);

Should this printf() be a logging/trace call? Or do you really want it to be
printed all the time? Also seems out of place before the declaration of
the variables.

Thanks,

Darren.

