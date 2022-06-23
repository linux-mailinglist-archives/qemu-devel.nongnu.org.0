Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01433557E82
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:18:30 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ObE-0005QK-1H
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4OZn-0004cE-7l
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:17:00 -0400
Received: from mail-os0jpn01on2113.outbound.protection.outlook.com
 ([40.107.113.113]:51944 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4OZk-0007D8-2u
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:16:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5MRN0ERxjYpisTfgfnAansIzErB5pNMmbfBRH7ZJV9YiaLqp4eNC8/gz6+ioNwzv7CQYYpCTTbuWQxAdNSsrXF6k12BxUQo2OXkRCUjlAP/T/jj/+W6KJWdVsXxy29E4OLVyk3GCrOYGbRdrhKoC19fTm7eg6/qxLogsXJ7zlx2Cfu2HCXO6L+tHGJJBLVWYbr06jh2ceXEy+2TH2hW7yA+3UAAHGghnTvdEFIrcEO3htNuJLLXS4RSZfizLQbZ5MpsxDbaFZ9D5Y721oaXha5TDHPvViFGhZJC2lAJpTmwJfy/kMmx+pW82NqgGCPUM0UkE72D0qnE4mqTNLVMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+QN98xGXhNnfyykMh9yJRZHzxOBS5wNJ5L5NY4h8RY=;
 b=K0gM21H35TaD3PCY2n3CtUsI0IuBkNEMlQDMmm2MidZ604sPW5kEW15TJZv6Y/oVt4wVvTSx6jm1J8kubXbmSlMrRS8+/WXzu36rig/5XLVF2KlvHlVePVG0ZBshFg9y6uDb/gerDlBSQPB+1pnbpx8IM/Nid0V1IBHp0WCCI//rlukI2dxwV+0rTIWEHRF+K6Ca8G7USDhwxMvFlzswL1XYnuNA2ZEEF8sab27Eg7gdYDcCQVsZljPf2BZpgmaiAeYYqwQmzbHnG/boxs5xBj/oFxa2z4ZaZFJfapXjqpPGh0hev3LM67rBRqryM+dPX9O6Uy7seSnjVny4mwzA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+QN98xGXhNnfyykMh9yJRZHzxOBS5wNJ5L5NY4h8RY=;
 b=b0bgybmtWixugoF6agJJWVKVxHqLPk8H/JfRq9cdMO4S8LwnOHEBM7PfzM7OI6pLzmUduZJgZ0nIGVy1xSaXS4tq5ppaITovlM1MAfQri5XB6p5Z1b6mGwqmwOjmF+gEGMvmn2PhlZuGwyHNnjtX+8WWiFV9S+mjX17/FzmHlow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYYP286MB1522.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:11a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.16; Thu, 23 Jun 2022 15:16:48 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 15:16:47 +0000
Date: Thu, 23 Jun 2022 23:16:39 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: Re: [PATCH v2 0/3] CanoKey: Fix xHCI compatibility and CCID ZLP
Message-ID: <YrSD1xGYsWWk996E@Sun>
References: <YqcptnhfCtUn2+T6@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqcptnhfCtUn2+T6@Sun>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0acd3a5e-5a36-411e-7edc-08da552b6404
X-MS-TrafficTypeDiagnostic: TYYP286MB1522:EE_
X-Microsoft-Antispam-PRVS: <TYYP286MB15227D71ACF961AB291C33EDBCB59@TYYP286MB1522.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xCAaLj5w//T+KnrlelPIZGUjm1aEDa1UNi7LD8Cjh9NALoUUNw4GpSs5mzZG6Ora6Zcx7UXzEXTQQJORO9ZpDCCkeAsQ7eJADbGiUzAPb9fquKhCTi2PL6neTlQF18/ZBxvv9ReKT5niHnWFo0JpkYDd6rrCTRiDWncecrKMWHm/cPPYDP50mMojmswLOdnSsy2HTv1GM8oWmHJOP/DP6zxZFHCWDFqshUqRuTuctfi8dI2XjzTVi01k5VuOhFFfto6YfJhiE6HTHsSf9/y8YGggMRXVfQROIR0Gh728cFUPLoWkvqdYviGu9r7DKE0Mv40xVkDLTLw/lC8aMcJeRE5cszZqEQgbGhJO6J00qlvDaLacDlKeRZnfQl3ZlhOLBUrATadQ7N3KDd5OEd9zvMNBhuFO1SKQRAcYpNwU97XjqcYk2IvfLJcsPFeHRCdV7xgS0ENQUSybDezt1X7WrYD/mSNXAmPm4+xd+FOCV/SCWuI7J/I7k4gL8h37qbUdV7PbrwkaSuKZ2upSczH7UxUcGcV6dgsUHbuEDAheMS5artqVpQKxAxeTUeVVvK8ZhJfYtV7OaaMYzdH1G7rBl5JDnK1DO2UFwSz11RWrjoj36DAlhaYR4nukDBbW9p5eJIpw+Q2JlQPtpkFje1YY5V0T9HetiJcAWq0hZ7HI1Bb+jONkJZcsWsEax13RVUn1aFj7LHguFw44aPad1Jm3+M+FBnosyavLqFL4QJy97VQuGZ8f1VJvmxUJ+y8nUgzl7udDRexu0CVu4Wit71/4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(396003)(346002)(376002)(39830400003)(136003)(41320700001)(8676002)(33716001)(86362001)(186003)(8936002)(786003)(4326008)(316002)(6486002)(66556008)(6916009)(66476007)(478600001)(2906002)(5660300002)(66946007)(966005)(83380400001)(6666004)(41300700001)(6512007)(6506007)(38100700002)(9686003)(52116002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jFkAyxkaSOhhvNq8qxvP5AK320UOG6DJgQHDGWtyS5uy11K0lbQZlvbtT5da?=
 =?us-ascii?Q?HhwpPd/GVE7mrSPE12E0GRop2ZhkO4Locbjtl8PuOPsmaaneT1qf7vi62Vrn?=
 =?us-ascii?Q?8b26DCcXHBnzWfXHJKUwJg8CseUf+1QlxVUFKT1Mef/yVm1X1vvzQ7A9/iPz?=
 =?us-ascii?Q?HRPOUxqik/QNvspNbNkGFU7/Bw1Rs1YWMa/AqA9ZFlMgSSo/brsZLxsQMKH4?=
 =?us-ascii?Q?lffkpCSfwjYdTfmVbrw238tJy9IFMe5bOvyJIIuXCkL2OgDFscXf8BKZIC+a?=
 =?us-ascii?Q?LfjHNbx1hljMBuO+SqPDVOgQ89nYjkq9g/8H4NDlI30GReTObgm4FjwjRJdz?=
 =?us-ascii?Q?TNotVD/k1WRATTx2wHOVKQGVEEta+gQ+cdixjvkvmNg6ycrroBYx95LWCnb1?=
 =?us-ascii?Q?tcW9gPo/f9ntKRTDtZG7Y18RYNNsTFovXPYlP91LKVP3byqsiyYGCFg4n8oT?=
 =?us-ascii?Q?jrd51dhrvqE8L40tgTcl1+LK6wIfs91fPVFPKLpvWb7dnFWAkGv87F+oHpkJ?=
 =?us-ascii?Q?8Wz7ngdKwaRlMUpFfbd9nNJz2361P31f5vPZLB9kQL3G15KMKyRPccRKrRV1?=
 =?us-ascii?Q?iKF2gSUwu3iz7jzM/XXdKFadYAwKM70qPzPQBNRpwtYTgAWLozg1ydWNxxMW?=
 =?us-ascii?Q?hN+htJ6rj9jcX0jFs5dlySbm9djEHZrKcExVXUajDMhQn6A4NWPTsIJX8huE?=
 =?us-ascii?Q?spMHdP9zzlzn5Ywh4b3l/7d+vlbEy90S7fLRxLs6KqyY0HsD8TeDfwCZC5aY?=
 =?us-ascii?Q?m7A1qP/JUDCNgOG0vS4fJAnmJWBzAGUZ0MZ65MP5BPYdYJLe1GN+2+YgKe02?=
 =?us-ascii?Q?Tk4a4Jouo91Tjv6vsBnfM+Td9pwbh0MJjdvKpHq4WckovJaK3jkWTzz5i3Se?=
 =?us-ascii?Q?tfRnknAxBzHMsrpudt/2lVy+PTOTj4KAgqTZsuB4XF4hAWYlteBobsZWQthk?=
 =?us-ascii?Q?0N1g4QLNhHb3OcIKB4gnrC4LHwbl8yyN5q3oFXVZp2O6N1HiTxrZae0/+enC?=
 =?us-ascii?Q?nzRhpFZWMXcBI7VnjsrjU/HVnauoJK0TucYc2QOW5O2aH1qlYENT5Wb2lBB+?=
 =?us-ascii?Q?LUPQJzHElLvyFZ4TtPzrQ9cKgfCehDDe5Hf2l8VrxqEKD0u5q4AEIqb/IDPU?=
 =?us-ascii?Q?B8oBxak4VFxXbnaQ4eCM4MQTIrJdPKoqSPmSeFiAcsuY7JgrysYv7+J4Z/1R?=
 =?us-ascii?Q?gNomp/1/l92KT2sUw9Rcb38nZDYcinnf7AfFnUBeD7NnJM0Z+oCXnFApa3eP?=
 =?us-ascii?Q?4L0pmvBnkkzLSxIEHNGcA39SeEr6h1ZoCI8KDsJ05O1ljrnEulgABZMVDhOz?=
 =?us-ascii?Q?7OWTGgCfiBSn0JXPDJway1D/c6EivjjcxIARuNtwgugTYaI9MgZcOGVasYC6?=
 =?us-ascii?Q?rAsEl/DteVnKpMM4ZY+QthgHbNpDyonjAIxxFIFUlPxNUtrV5oWDpFjSGZvm?=
 =?us-ascii?Q?qdEFBQROnjiYl6soNb2xG9kzdV69jBs6FSKY90jWnLYK6GfA86Q/RtJscVP+?=
 =?us-ascii?Q?dbEGDZcpQzN/tI/UQry9hMtdiyArn3LvKSfjLGlTnrPqVyr7GcgduWlI1yjW?=
 =?us-ascii?Q?a95/L1IgLwfYtlI8gp6vJboeT43+JQXzskSxqRg5Mazy5WrQrGXEMIWJmf3v?=
 =?us-ascii?Q?OliBUXjK2Sn/cvNDbZ3sqM84dI8GwwGzrB12iQeFOxwuvllrtJd+BPQ3q48t?=
 =?us-ascii?Q?/Ga3dYTjhmEK6GT+Zcdrvh2SPTHn/Rej5+tjlZzdW3Ot/K35NQzUvAnUwG2M?=
 =?us-ascii?Q?QsDDhwGBFg=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acd3a5e-5a36-411e-7edc-08da552b6404
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 15:16:47.8192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhyqf7qM7XomBble5FSJXTyU0KWZCuZwsqhmMAQkGeX/I/COzQIdJAIq2MoHZ1R6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1522
Received-SPF: pass client-ip=40.107.113.113; envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Mon, Jun 13, 2022 at 08:12:38PM +0800, Hongren (Zenithal) Zheng wrote:
 
> ---
> v2: 
>   * use usb_ep_get instead of recording ep_in_pointer
>       as suggested by kraxel
>   * CI result for v2 is at
> https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/562306905

Hi kraxel, is there any further feedback on this?

BTW, as the commit "add myself as CanoKey maintainer" has been
merged, how should I submit patches on CanoKey to you and QEMU?

For my own patches, I assume I should submit them as PATCHes
to you and the list, and after enough review it will be passed
via you by a git PULL.

For other contributors, before I can send PULL (my key is not signed yet)
I think I should first give Reviewed-by tags then request you
to pass them. After I can send PULL, I think I can just
send it to you (or who will be more appropriate?)

Regards,

> 
> Hongren (Zenithal) Zheng (3):
>   hw/usb/canokey: Fix CCID ZLP
>   hw/usb/canokey: fix compatibility of qemu-xhci
>   docs/system/devices/usb/canokey: remove limitations on qemu-xhci
> 
>  docs/system/devices/canokey.rst | 10 ----------
>  hw/usb/canokey.c                | 30 ++++++++++++++++++++++++++----
>  2 files changed, 26 insertions(+), 14 deletions(-)
> 
> -- 
> 2.35.1
> 

