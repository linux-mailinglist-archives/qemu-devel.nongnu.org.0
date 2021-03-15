Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78633B290
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:25:33 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmHs-0000YA-LG
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLm5m-0002P4-0A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:13:02 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLm5j-0003nK-TT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:13:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FC5aRh118461;
 Mon, 15 Mar 2021 12:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=HCtVgl4Kb75vNUd1xvBO5YYWX/02gmrGuYLwdkoCw34=;
 b=z+TML770JSt7z5GK3axtofEbWMMZs1vvnIBgLd8pdSsWzHNXcA+9WOHar82R0TZ+Zof/
 7sLHOmwed1s8sYoal2NHMxS2t3vAOlEltBPGbvxghDqiwT+qE44YUA8XuPFv6on/Fr55
 NfP8Ol6KxH96VQad2Bg6ebPiMs+mbd2XGOPhvVt3eW2u8RFlbKkQ/eM67sA0ITBemUKz
 c8tPLhQa7+4c0zJTqznh/OWlY2h9gja4t9gV4/wD/bzvHnplqkg6+D/wEpb4mXtAEg60
 7DG8sNQKUTtMb6+8xyvB61FqOTlktYsBWlGR/K54HYvm6dF770gc86U3I3dxFCUx9Xz8 NA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 378p1nkheq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:12:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FCAT0v003582;
 Mon, 15 Mar 2021 12:12:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3030.oracle.com with ESMTP id 3796ys18sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU8gfiSvhnrGhJngBKg6R1ze6tpbs3VbMghr2wsjUNAo9Ub8hjy7kNDuZl4lBUE4icODS4i0Mh8kBDbgYkOt2r4Cs9IAQRKztllhusA6LY8jXpHoRhGtAjQg0vASAkFF+RmiAmPNSQY6o5sQtwhVMARSbdfcCPHzXxl+LhVrO2yZEwFoUI3sTPkp4XsOOBd26Fk/4ok/wE0zQOz/zdlNRR64XWuMc+a7OG18HsmttbhDa6IvZ3LIYMEx3GD6oIIl/2m0KRPdMVZPvwCMpvsCyUR2hx1jtJg/Wn5AN3agE0XKIhn1dkz1lATD08qFVTT6N1+TAeIGUpFrrqWeXKmvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCtVgl4Kb75vNUd1xvBO5YYWX/02gmrGuYLwdkoCw34=;
 b=FdbsXDsFDBhRwZu6reuVW4G0in0f4Z9jHUkiyMh7nI6e1cTnSy7cPnA4Llpt3DW+4i4G3f6r0hX4H0eNkTVTRzk9R8aBiwiGnScQKosDXCba19t13VfTswRpImtVHQx7I3rGVy+2uXsRK0n+/Z22tPuGx8vmTkxxks4H0Zq+YyFPtjFP2IAKZhd+dSBvh/dNPHVKSajT0Y/jdnNKD0TvWNUk8woYsmvLeTL9F2Og82WE1Yhl5hAUMrH5WKA6DFoC9NoaU3msDmSEqE1Y71c33szJ6uGJKOmvT8W0QkemNo0vC+Nz0SCCX6vkBaYBGpY07DaEELgVi+jtM44gJVab+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCtVgl4Kb75vNUd1xvBO5YYWX/02gmrGuYLwdkoCw34=;
 b=nko3LnSlD/jMkKh25cJ7HToNspeSlh0Ys1+gAXpHxUXYzrfHHrh7Jp0ZJAgOC2e2dSZcTg1TvS+UAIot8lSRuCHpAyNeDIVOk8/TSvrEiCeF2rsuRHkoZmLt9PYaZ9v8/VWBFAhyFFqoTpAH7B49Gs3vbKdUe74QrON+aGNgv94=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM5PR10MB1516.namprd10.prod.outlook.com (2603:10b6:3:7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Mon, 15 Mar 2021 12:12:52 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 12:12:52 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/3] fuzz: move some DMA hooks
In-Reply-To: <20210313231859.941263-4-alxndr@bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
 <20210313231859.941263-4-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 12:12:48 +0000
Message-ID: <m2sg4wsji7.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0291.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::26) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0291.eurprd04.prod.outlook.com (2603:10a6:10:28c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 12:12:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a6d24e8-ccb4-4fc0-de28-08d8e7aba87d
X-MS-TrafficTypeDiagnostic: DM5PR10MB1516:
X-Microsoft-Antispam-PRVS: <DM5PR10MB1516401BA0346B8B2117ECC7F46C9@DM5PR10MB1516.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpW0Y2iQluJoWU3LuJkrZIsHI3SX+jFTsCtRCqau32EtAGnSxNN3n5ThazDF3oxhlaHyF8FpLwgq38ty/ebbjWKiGsKmIGzla2Rrok2b3okmwNirHoFRz8MuQ21A2ADygpS587LRkISEIrWAH2gI/Z5ygKuhwFX/tNyx7r3CVJOxuPmj6INYHugGdiqrMpWlO6Eqkdhv9VpfjIOU8fdYElkm8c/w4T5g1RJm+ymfYMUnKqbNUYUKYrngOLUcmq6XGE9jSWg6nrn/PzN/cXE/yJg+I1E/QNPewxCR/exNG5UNlGAKk14Fe+NXne/TPfg0NFE6w5poqnb+7gxv1QVC9m2nE76ukvBPItU01AYZh0BFArsqf4DEHXYkpo3+SJaJ6KslgAR9cOCjtcLDVrh9EMILAbKsBiXJ/7GJMRPWwUdEKgo/4aWQAq78Q0XC+ysEmpVlUa6FG68nVdl2PeKM6ugvgc43UzHi4ppQQkGIk9CMwPaY34NTFQRZ3V+4UfaauXQfgRwifcKl4mr+/i8kkltDG+0y58ISYae9/KQGYVZDoTNzWFeR7WBQ/meDVXdF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39860400002)(136003)(376002)(36756003)(16526019)(8886007)(6666004)(86362001)(2906002)(186003)(26005)(316002)(44832011)(5660300002)(4326008)(8936002)(8676002)(52116002)(7696005)(956004)(55016002)(2616005)(66946007)(478600001)(66556008)(66476007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5BchOkF/q3+gJcwMHI5TiynavUmw93oAKiL3AykUTeGQCWEeZThWF9U6TVPD?=
 =?us-ascii?Q?895ceu53KzfMcG5qUFoph7psFksAgGz6SPh0LebR2uADgyCNziPgh9PKfdv0?=
 =?us-ascii?Q?zCzg1B2RHsJ2dleMp8O4lxHnZo7lc5RbaC92E+afxbizxAYsaTL8IqB4jJ1j?=
 =?us-ascii?Q?WT1BBLKJ+XykqwjMMxp+xby/bCSus4+xIl/pqEYQ0R9OYZUzuzT7isrNuvVG?=
 =?us-ascii?Q?7gxUH6zScP+NMXzIZrjcyvfL5L1L4cibqQuFCNEr2RCwcNyHq8hRZCbAQUKM?=
 =?us-ascii?Q?3h8WRG7tBNmmKmw/WUghl55GxhD/aWHLQnQCoEkHUm4Y5yPaeTLBQy/RvhoZ?=
 =?us-ascii?Q?7i0MGS9bU9DXmfndrtj8kzom29576F77dd3xaWJAyegL1oiTVHIpwQ1B6xas?=
 =?us-ascii?Q?07sYCB4w8tRlGrlQLCrUYJB5EqzwdGcmQWVX5a1OV2MDdKNp5kCw8IiYnPp/?=
 =?us-ascii?Q?j4nLVg7VLdjFrJpBKZxOU0V3OetNz7O9WpEoW5xFH/CflRIFVbG4o0GD99kx?=
 =?us-ascii?Q?72zbMm+gxSeZMD7O/n8xBrSdwPPnb7b4mBW+xQfLJLYUmpfN2KgsFwKTe/GB?=
 =?us-ascii?Q?ECFjHTxd7rKpF/oAJQRwKb2p1mtz3zvwvlCTNw/6cPr/X2faKkd1x8qPLvJA?=
 =?us-ascii?Q?w0qKBxoVWVU5qLlUOHNTqV6R556FbofdcegExfb4AahIQQ1cY4HIhrQFXITp?=
 =?us-ascii?Q?osQkYJl+TOttlGXnaZGKZZhI+YUP+Eaj3xIoMlMQpujRWZxz9xjMKWbXp5yu?=
 =?us-ascii?Q?VTBV7xy/wLu96atXnedTTQG01TOQl0bjCj48PDN95q8PzUNEUu3gGbIE+B9D?=
 =?us-ascii?Q?2AEDYAUCS28+6+Q119nH/ysJbBe4ewiRC9IJAz62IQWbXrxa0D8u2ikvnjJQ?=
 =?us-ascii?Q?kQWV8gB7iVuVSEerCZ74Ml/Iugqlj0JDZ/PRfryFJxxeWKW4VyZlmlXNDNhn?=
 =?us-ascii?Q?GZY869QEkaPZA41MdPgAc8XFTh2j0c8i+xqG3exHBPPD3JcpSsQb2gkU5aXO?=
 =?us-ascii?Q?ndMQPHXTzUhNe89MuXJ0W3cz8Nm1QcjFi9pGvWNXhgxt8IuzYxxc8HUZueU1?=
 =?us-ascii?Q?+OTno47Zdc7Qn7zEIm15TPXf5xIH03gDdcXmK7wchv6pdNpYC2oFc2oSjfNb?=
 =?us-ascii?Q?GtI2AS4qlgf/V/wl59+yz8eXShzcBT7tQscTvAIXB6Z20X1WpL/EO6H9zy6B?=
 =?us-ascii?Q?jonuPL89n5cR247/DdCRpJ4aRIytNH+MaNAc9NvP5EMimaUP03gUTtBOXFD1?=
 =?us-ascii?Q?On6MsEqu6oVyMR0ZPrjIIvnG5ejqlTme4fDAWaDl+Ut8MtiGfz47D0NZi03S?=
 =?us-ascii?Q?MBLIMBYIkc5ohJYjNHqohXI5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6d24e8-ccb4-4fc0-de28-08d8e7aba87d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 12:12:52.7259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1o9rNRIYv6m7m3BNx051WCzPDH7ygNaObLCowvJepambhwkz+oagOWb0fZyHKd08FfTblAQQUZk4hTC04ZZVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1516
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150087
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150086
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=darren.kenny@oracle.com; helo=userp2120.oracle.com
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
Cc: pbonzini@redhat.com, bsd@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Saturday, 2021-03-13 at 18:18:59 -05, Alexander Bulekov wrote:
> For the sparse-mem device, we want the fuzzer to populate entire DMA
> reads from sparse-mem, rather than hooking into the individual MMIO
> memory_region_dispatch_read operations. Otherwise, the fuzzer will treat
> each sequential read separately (and populate it with a separate
> pattern). Work around this by rearranging some DMA hooks. Since the
> fuzzer has it's own logic to skip accidentally writing to MMIO regions,
> we can call the DMA cb, outside the flatview_translate loop.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  softmmu/memory.c  | 1 -
>  softmmu/physmem.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccde..3b8e428064 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1440,7 +1440,6 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>      unsigned size = memop_size(op);
>      MemTxResult r;
>  
> -    fuzz_dma_read_cb(addr, size, mr);
>      if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>          *pval = unassigned_mem_read(mr, addr, size);
>          return MEMTX_DECODE_ERROR;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 7e8b0fab89..6a58c86750 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2831,6 +2831,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>      bool release_lock = false;
>      uint8_t *buf = ptr;
>  
> +    fuzz_dma_read_cb(addr, len, mr);
>      for (;;) {
>          if (!memory_access_is_direct(mr, false)) {
>              /* I/O case */
> @@ -2841,7 +2842,6 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>              stn_he_p(buf, l, val);
>          } else {
>              /* RAM case */
> -            fuzz_dma_read_cb(addr, len, mr);
>              ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
>              memcpy(buf, ram_ptr, l);
>          }
> -- 
> 2.28.0

