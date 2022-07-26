Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F15811C9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:19:22 +0200 (CEST)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIav-00024s-4p
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1oGIVT-0007B5-3Q
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:13:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1oGIVM-0001bV-Q0
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:13:42 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q8Tle7026987;
 Tue, 26 Jul 2022 11:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=LMQzhZ5d+uo9GwgY6P2ze+0b3GfY8xiqucHaThXQsIE=;
 b=zK1BTA2FVnM5+USOi2+pch5+i42pN9dvNRjWGjR2RpbvCyyoEMkDuaoQK01kHxAMwVwx
 katibv83I9zRntNIcjMM3YWqQgh5x3KvaVOia/hElHbuGguTCBGoZWBKk5xLDztbEG3N
 k2Kfr4Bj0CUsBsy/c10XlLTefIZeKCO+E88WnPm6/rXDc38GB06JLALxqGZXf5JaYjld
 stv1lwE74UWlghRSMf+KnB6+hd/l6DP/IzAtPtG7SwbbxQ+FrjQZK7a/NVhYSLQGPUPl
 ajDDs3KH/vXs1gnZv4T6tjeQx7Yzn+I+o23p4gUlteBAcSR7oMj7tvaU4FvTYUNNf8Ut 7w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9anwugf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 11:13:29 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QA3i5P017794; Tue, 26 Jul 2022 11:13:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh650cjf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 11:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrIGPplbql+ykDOh/z3odjAZrcwFP8Swh652TuG3LK2Wp0YGKJToUb2o6b1B4jUSOQzfP1rC0WhqXTru9YyscrB5Po/ea53KozDaUAXepTPEcYOxLb3nfTYI4CMdh/idyO5pyOqerF02s7CY5ttXCfX/6maCd9uVndCgPgR7Jj1wI9BcxUvYU3v7KIxOYM1xaZRnN+e2jObMy0KPoW4JXuk0G8yEt2r9OVD9TWpfWZhslcsRqKRAx/dXtt8aI1Z5Z5zWScjji5A9uvNB3OOvSHsgBj7Ss7Oishm1/NLHIAV2gWIsFncEde1bjnobbxHWhPIZ6s/fwdW+71lIcI8Qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMQzhZ5d+uo9GwgY6P2ze+0b3GfY8xiqucHaThXQsIE=;
 b=hR3YpRe4BMAGexqx+ZVuudFQ2YMFCJBg1LboMIk7KN8jNQf3RmSG0ldVbVDJjpeAeEA2wDG/MJtFi02B9MRMUVRs/ImU9iZZWdMNPBgsAuLb5ahCSY4Si0JNK3WTbJ/rd1yaKQ5uSsUtD6s6SAnfYBWhvgW1qQi9+Con4pCwYZaH6VfFdHMgegdcZqEQFikBOQUKPK2hMO1QZPHZpa+vhHoIlhreX87jYxCbaxhabTTpmKjMoIxeCmgOG91sTr09IgYfx0p5Iy+rvO4dugYYt+onTNe5hAyDIVdGzJK2c4cpR05ndclk573GPjpKSe69WEjn/U8y8DXXwng11Pd6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMQzhZ5d+uo9GwgY6P2ze+0b3GfY8xiqucHaThXQsIE=;
 b=aKolwgX0WWfxkUgFPOO5a5fDG2lFCRliaddi16H9f+vcpQg4drvrC/Lrm6iwu85KgSvBPMwjwjqQPnv7JSdBGFif4pkrKewGliDjhrZIzARitG+fFmwDpiXkFU/W39BzUPuqzsUbtG3YhLFoHue+/4t/Kzo3YNI+fhQ393ev/ys=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by CY4PR10MB1286.namprd10.prod.outlook.com (2603:10b6:903:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Tue, 26 Jul
 2022 11:13:21 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::89fe:338:779d:6bb0]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::89fe:338:779d:6bb0%8]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 11:13:21 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: zhenwei pi <pizhenwei@bytedance.com>, dgilbert@redhat.com
Cc: qemu-devel@nongnu.org, armbru@redhat.com, zhenwei pi
 <pizhenwei@bytedance.com>
Subject: Re: [PATCH] monitor: Support specified vCPU registers
In-Reply-To: <20220719075544.932927-1-pizhenwei@bytedance.com>
References: <20220719075544.932927-1-pizhenwei@bytedance.com>
Date: Tue, 26 Jul 2022 12:13:17 +0100
Message-ID: <m2a68wxh2q.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::23) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d46a07a-8124-4328-9ffa-08da6ef7d99b
X-MS-TrafficTypeDiagnostic: CY4PR10MB1286:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EkuyO/lPnsjrBbUvRtwWe41DlD2X7FgB1Y8sDMUhuIfWPwyNBcY97SRXYLyrjGT/o6U1Z6cnD1WotQPAmuEic2RGldEb2+5Lst2x0x0kw8JBtuf2lgXXXsLE5QseQrbb3sRSy4igT5n9RMWovuPnF6ATPnjXzIObZ9Ics+cpXPIS/LZ/lEjJjmRK1VpJ1+E3xfFxR6BvjaO+kHLTpaTDtwOPisiJRcLgBiy+nkjJO94WChkJfcCh3KmZf8Eh7MzZI4lDJESgJG0CdXiZGKqIqM6FRjg/5tDXjlIYqP31dbjYZ1Di9AwLTPth6qzpBxl+I72zKgqCKfuTxMXuGmoZNpAHgK/jbxQtgVjd5Z7Aa+UEy2xvbc1iLPmyMYRMYpAJF0teg/DlfS/Eoq4ubUCFnLoyq2txfNbGCvgZ2MmvGzDEWiMnXVhIjCSe3EZqFAuY1QehX/uX6oO5AmdYsBsUlrzIWUv6vJj1L2NaVkKGTcvgfQ2e4GX4Ygg3f5Ws+pqENtZaMwFSikfNWCGVP/BtXka0194nu1JZogTVrysZsrlHaGNV1KFP8IPuzE18gSWcFVHUstHsgD4hiSR0XueTLLacxr+V04/Dni/tloXsRNRGMnua8opB1FRKs2V+W0O+MDrlLzRVKrP7D45Mhv57hOPGFy8O4/f0eopRp/UCul8kYjHCKmhWEP5n4kAwLzgEM0KAChNufcgBBA+2lyeRJtWOPuexbc+rqCgUrnuD+nE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(39860400002)(396003)(8936002)(83380400001)(38100700002)(41300700001)(36756003)(6666004)(86362001)(5660300002)(186003)(6486002)(478600001)(4326008)(66556008)(8676002)(66946007)(66476007)(6506007)(44832011)(26005)(2906002)(6512007)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YaSfYwKHlHT3yqQSfoVdC/FiYkXmEiSJIg2kcxu+8iiXtyjEql74vDqxMTMA?=
 =?us-ascii?Q?FoFvKmoHU/ikBMp5RPQyCtDYOMdCPjQHgAJtLaOkur+J8/RVVpBStcNndCUg?=
 =?us-ascii?Q?yoSxe9GH21GlkrFwbshJZ/XCTI/u/zIQa8AbKNlBSYL9r5Ky4Pkp2iO+7HsH?=
 =?us-ascii?Q?y2hyQPqVc3shETHInOG9+PJOtfUdGEgLI3CEzmRBoAchdERcH/NFQLOfq3oU?=
 =?us-ascii?Q?qaz7LS+TLQSN0sb2pGN5+az3QuZ6WGMM7rL+Yyn471bwfpgyigWiv/LML5n1?=
 =?us-ascii?Q?JLMrrxZteAaLx9rWEkxJHzjcJ13bZQPJ1+qHjIPM4KPK+pTh/sr/XHL/vaqu?=
 =?us-ascii?Q?rutlapoAtSrTUEpsxwvbJwfj7zUzdwmVtt3wuiI0ENM7Ii0+aCOUNC8x8Huu?=
 =?us-ascii?Q?/+t4frTJkUaos0sRIhZOfYY0MEP9Q2OVlXC12QBD3YrwEubueWC2yEQV4jOk?=
 =?us-ascii?Q?sZjMPFIJPw6rAiI+leoEkNepAYcvY9kncJlFse69oazF/gTnhWuHIE/VtboH?=
 =?us-ascii?Q?tHzMEpETW64oyGIkjhyiF68emTk0ioILLVm10m/ptOcBgI1gGKgqwbUofxMp?=
 =?us-ascii?Q?9bxppLBWpuW1YQ3at54o1f4IqNZd5MiYO2WCLshWKmliwPbSV3AZreXoeZur?=
 =?us-ascii?Q?O2Qpl8B7XjRZHJfqNYMxPkHe3Ouvjxe/SMok6SpavenDa3c+u1MfpYew3KRN?=
 =?us-ascii?Q?xFxxgSXTJ1t9BaLXAxdWTd0Do3ze5oeL1nXxBhFl3p/znFgsKoRpohybW8V3?=
 =?us-ascii?Q?0IiS2yCSOVHRXyU/oNli6R5OPTwBZhMBsRCbIhV2Se1tWOTZxKaFKH6tHP3B?=
 =?us-ascii?Q?7oDamHn19qAtYfXoHWWP16We40u3oJ7mhSz4CXRRaj5E3mQlSaxEdPGEv1xB?=
 =?us-ascii?Q?QbafK3fRL4UtGtQ9vGX0BQmCkafBjPgocIie784x3niEDP6hRQVAgmCdPq9a?=
 =?us-ascii?Q?pmd65jgmj9Nxin5wvYgf8E6r15uSQLHH6Z4tnXjbVFw5Uk3Um7E4tiVtFKBH?=
 =?us-ascii?Q?pw01QFEjF40Th4cJ0c3/DC37TGho732Jpk9o1HhomNuJy2JyOIKZoiln6Swz?=
 =?us-ascii?Q?qknV0mOTq0d56gaTA7XABb7i1A40caSMkyasQ3NGlVimaEPm8he56ezY1kmE?=
 =?us-ascii?Q?oEIb/PDALVfQeAw4e/lJ1liptX7/o672USUqbA3lskmLscb/P4Zsiv2V5hJ+?=
 =?us-ascii?Q?3Yfa2fB0OPmcfd3aW5CM51hspaS/6TBBtp+E5cTgzKO6Fz08Nbpt4GafqUFd?=
 =?us-ascii?Q?ibwul6vdRDVRCVeuY71FFW0vusKHS2zX1xxI9nt6CSiMJXl2K4t9KxGV5gl7?=
 =?us-ascii?Q?bg3t9/+4z3P+yXvLTZ4k/RPCni/ouLUk4owIp6bwjh7FLnZEtz0J5JTGC+eV?=
 =?us-ascii?Q?jnIUY2UhHNUYwsYWsE83xDKgsTbe2xRTU98u3LD6VVxmsySXJNpqCnrevyB9?=
 =?us-ascii?Q?pR5ZF2P0Ooe/k0Os30MVT96k/n9RH0o9qjk+sbYc0TrRVa4euWhu/Yrt2HgW?=
 =?us-ascii?Q?tgtolwBqInsCV5QFq0IdcR00rdS5WxbWxoAw65Ro1BBfQts13Mf2YKKxtOBr?=
 =?us-ascii?Q?39jCVSWUtshCnUQ7wqzuQCPs5jTkLUGP3azMLsMM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d46a07a-8124-4328-9ffa-08da6ef7d99b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 11:13:21.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avAQP++UtelJBSwg9Nnst4IC2UF2jJO47yVgkWFXbLoQbquppqex7M3efenGN8qtbIRN6dei3Ax6Iw8qkwpMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1286
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260042
X-Proofpoint-ORIG-GUID: 97tD3Cffa3ryqFWD1bAcSWojlcbv-BVW
X-Proofpoint-GUID: 97tD3Cffa3ryqFWD1bAcSWojlcbv-BVW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tuesday, 2022-07-19 at 15:55:44 +08, zhenwei pi wrote:
> Originally we have to get all the vCPU registers and parse the
> specified one. To improve the performance of this usage, allow user
> specified vCPU id to query registers.
>
> Run a VM with 16 vCPU, use bcc tool to track the latency of
> 'hmp_info_registers':
> 'info registers -a' uses about 3ms;
> 'info register 12' uses about 150us.

TYPO: I'm assuming that should be 'info registers 12'?

>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hmp-commands-info.hx |  6 +++---
>  monitor/misc.c       | 19 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 3ffa24bd67..6023e2b5c5 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -100,9 +100,9 @@ ERST
>  
>      {
>          .name       = "registers",
> -        .args_type  = "cpustate_all:-a",
> -        .params     = "[-a]",
> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> +        .args_type  = "cpustate_all:-a,vcpu:i?",
> +        .params     = "[-a] [vcpu]",

From what I can see in the code, only one of these may be specified at a
time - or at least, '-a' will take precedence.

Maybe it would read more correctly as '[-a|vcpu]' ?

> +        .help       = "show the cpu registers (-a: all - show register info for all cpus; vcpu: vCPU to query)",

Possibly also it would be worth saying "...; vcpu: specific vCPU to query"?

>          .cmd        = hmp_info_registers,
>      },
>  
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..b12309faad 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  {
>      bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
>      CPUState *cs;
>  
>      if (all_cpus) {
> @@ -314,6 +315,24 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
> +    } else if (vcpu >= 0) {
> +        CPUState *target_cs = NULL;
> +
> +        CPU_FOREACH(cs) {
> +            if (cs->cpu_index == vcpu) {
> +                target_cs = cs;
> +                break;
> +            }
> +        }
> +
> +        if (!target_cs) {
> +            monitor_printf(mon, "CPU#%d not available\n", vcpu);
> +            return;
> +        }
> +
> +        monitor_printf(mon, "\nCPU#%d\n", target_cs->cpu_index);
> +        cpu_dump_state(target_cs, NULL, CPU_DUMP_FPU);
> +        return;

This return call seems unnecessary here.

Thanks,

Darren.


