Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2ED4CBF8C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:08:28 +0100 (CET)
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPm83-0006Vr-5a
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1nPm5f-0004GZ-H7; Thu, 03 Mar 2022 09:05:59 -0500
Received: from mga07.intel.com ([134.134.136.100]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1nPm5V-0003Zo-OC; Thu, 03 Mar 2022 09:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646316349; x=1677852349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GUlLKPsPmP6bu1qrda4FUS+b/sneKKvqx7MSg9MCRNI=;
 b=TfHJaacY1goyxnfmx26VgH5lLYoqi6hDKxM/mollXIk5aBJpAY8wn0Wk
 EllAHsd3evzTlNWj7h74rV6RG1w8LaNB2ZHtNqconp//OT6D+98K2WNTi
 RgDTCqc0x4YdoDWpNjWn8DSg9k5aSn0DISFd80rwTQR5y+LbS5iB3vTkP
 /lcw+mPLnxbip7Tq+d1FJRorY08O+axbekvRkWArDAEyFNxck1uFDs1pj
 gXMHY/5g+ocFGr8ilKVwHO97sZIV2PZmQDhcvKuEEZZqWw7484ABj8UaJ
 omexU/ej9udYv6zJslA0eZlenn1/y0REi2XvGp+b9XUNOna3r9wNd5DiQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="316901373"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="316901373"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="551757122"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 03 Mar 2022 06:05:17 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 06:05:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 06:05:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 06:05:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiKS3u59niWPa/aTlnEnJx70m+nb1PMENoZjAD2ttAoRNCu66qgkOK+PzNcmI9msiYuC6Roq92wGAE87oi6SqFTbUAXGdwwP8fExdFxUNN8MVALoErSAFDwTLza/wQchEotKkiG05l9SVJukoF67U3y1BDfZIjVO+XFB9YBvypmnGJ8q/k9NsBpYCgquYvkPf5G6Ys4AYdxMANCD4bg8xgnzmgIZMWZyY2pfWu5UJQ2oVriELqojn6nvwwek3mMLm3E5tOOeFnWOeXWrcfTiuy1vg9YsO6HD/Zh+ZizCIYDzQ41fqDmcieYBFhvioO7PoPmfdm6+7eB9R1FKtkbhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEKsihsiJUrXjJUXCKvlFKtFlEc7lF2WAi0VrXZpneM=;
 b=FQBpITMxc5lqnCClIVuM0G+WMqPY8Aw0tMzmrfub4CJoxJg+YUyRslcEAiJfrqZd2qCmMmHKji5/Sp0H9dD/TPvZtPFdfBRfYdDjntNOvVJcwha+G5ItPB7is1Hf8AQgkdkasFOAOM7eWRxLGY7BU3Oj/Yk/bSITF8MFsu2oN5I7p8XbIA3GFX8padcTL7zhA8Su8YF/iBfxTLNhpUwFUW5rcu4AKEWlW480QxIBACd/A814w0wOQQNhwoI8/rvTNwPAJp2ONDciKZKVqwtqY9fcs7ErjZaOhoELGXxQKzutf4NxcSIoFiWwnIb8clUKQ+7cQEFXWH4mx4kNAq1Sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 SN6PR11MB2655.namprd11.prod.outlook.com (2603:10b6:805:62::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Thu, 3 Mar 2022 14:05:14 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::31ec:b2bb:8e9d:641f]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::31ec:b2bb:8e9d:641f%8]) with mapi id 15.20.5017.026; Thu, 3 Mar 2022
 14:05:14 +0000
Message-ID: <e5a5e7c9-ab84-6e58-29f5-045ff71cf3f7@intel.com>
Date: Thu, 3 Mar 2022 22:05:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH] block/nbd.c: Fixed IO request coroutine not being wakeup
 when kill NBD server.
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 <eblake@redhat.com>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <chen.zhang@intel.com>
References: <20220303022145.328112-1-lei.rao@intel.com>
 <e9b5e0ec-a2fc-5f7b-6773-062979cee2a8@virtuozzo.com>
From: "Rao, Lei" <lei.rao@intel.com>
In-Reply-To: <e9b5e0ec-a2fc-5f7b-6773-062979cee2a8@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HKAPR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:203:d0::22) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38ab0292-ad1e-4604-6ca6-08d9fd1ed6af
X-MS-TrafficTypeDiagnostic: SN6PR11MB2655:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB26553D7746477CE37D75BC79FD049@SN6PR11MB2655.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pp0Q7NgZZqZY6/BxMp9TtszF2F6VbljnC+3kCNCVrhnKj0pnzaoBNUB2SpnW7INQIViq1cZpvPqFk0sRV3wxr3twVEYGL5OxS70+0FR7hgqvfDREi2fhocxDXeVLIScb8QX23pWJGxcHZP+3sbJt49EiPkji6f7UK3AxDEqUsl3L/mIizsiLK7xz2LBR9f0Dtl1/fhfcInUDEjvtoRoYL3pDozFzoAgRsxLu+lexpLnr0AMWWiSwpUxesBjCt0zHTSKK0eBI9zOSMGeix6JG1g/M0g2vMyg4NJuGiyZh67cNEhkuJUd2sdS7o+5CYHASRsfmoPE5LGgkS+yS1zk69CSSchLlNwFHQXLbqEbciegXapxR1zR/nJ0+tH599TcdACtwT2kgmdVPFSZ3SSh4padWzRUsXPnRQFdSz9ApgJWXcsqeWUePmeKfr23tZwve8KyHNEILojWwFhBbqNTTMcKEHA42EnfYIDuhRKFQ7onRdMdz63ZJBEjFNJ7aCiqU2LHQO9LFVZCcjE1xV/uKmtcwNyAI1hearEam8br8Mi2Z5/UdH8mHBv5oAljjnj/dAgCe+bNQXgm+TYdfveLJ9x+nqvYgt3mLOD5qDExS0GTbNK4aTNTxk/EJ7a67Nui0WO6Kh31Zr22+DdPkpvI0HWrnLysgwHJJ+xeecDerQfVlIPl0jEC6R7Z2L3g+JjQr5pOv70eXkZEgpuWaBC7bngphqDC7RLILEG/ZXXaA8sg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(38100700002)(6636002)(31686004)(36756003)(316002)(8676002)(4326008)(31696002)(6486002)(66946007)(66476007)(66556008)(6506007)(86362001)(6512007)(5660300002)(508600001)(2906002)(53546011)(83380400001)(8936002)(6666004)(2616005)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXIzNy85U1dxNFlwUWM3d0creHV6eEhValhwRW90TXp1bnc3cmY2YU9Qbjhx?=
 =?utf-8?B?QUhlR2VVVUNJL29LWjBzc2ZkRTdzSEd0blJyWUp1MnEvbks4VUtaLzhQNmhj?=
 =?utf-8?B?aGx3N0tTMGdXNWxHbEQ3NStKSjBGdVhFWWxQZkM5WHVTUjZjSVAvV0lySkY2?=
 =?utf-8?B?SE13U0ZxZ0RUS0VCSzlpby9NVUc4OWNzWXlseGJtMWc4clZuVnIrTFVMelFZ?=
 =?utf-8?B?ejhjaG1pc0V6R1hyaGlXMFNXcmlubnQweElGWGZmQ1FtL0o4djROaDZENjAv?=
 =?utf-8?B?aUptYmtKd3V0TzZWWmdxOC9QRUFiai9XTzJxbTBpTUc3cWJYS1V6RTFYT3hy?=
 =?utf-8?B?Y1U0RnVCL0Vhd0tkSXFTRVNFTVRGTGd3MTB0ZWprQk82WEtta3M1UlpDV09L?=
 =?utf-8?B?OGZhZFRJbXdtY29RS2VjS2UxdGZ5L0ZKUFFBUXcxUDIxZzhLVk9OVFZ4c1l0?=
 =?utf-8?B?ZEVpMCtOWjRXVlZ2OHJYZVhNd0pSeUpmbnpaTS9lckc2UzhIbXJialBpc2tG?=
 =?utf-8?B?bWx5TzR0RDYweVU0M1ZxMGdnUUZ6WnFFZ3NTRWN4T3IxaGtic2kwaUdXVjlW?=
 =?utf-8?B?Tm9KMGJhZG5OSnY4ZlRVT29sVTRrbmx1QWFnWEtiQUZuM0lZV1R0dWJQelpt?=
 =?utf-8?B?N2FJNG1DWjg4U01KZzNnYzk2dU0waDBrOXVIcHh6ak9pcG14dStDRXRsSTln?=
 =?utf-8?B?cWNqL1ZJS2lKKzBBVlpEdXBRVy9XaEZETzRqK0xOeFRJY3gwTVBndWloaGdY?=
 =?utf-8?B?VWNmQ2hRTFBoQVVoNk5QK0lKSkprMytNd1ZudU5Idm5TNlYzazEvOUVHcEFS?=
 =?utf-8?B?czZES0JRaWtsMnNYRy92QUFpRnNkOUxtamU5ZWEzNytYY2d0Z0ZENnFKclpj?=
 =?utf-8?B?WldxeFZMYlpaQ3lCbTdhc0xSc0N1blpVNWFDQzN0eTROT005M3VuZjg2Uzl3?=
 =?utf-8?B?ck9tYnRBeGk2Vzc2RkRyOVFiMnp4emdoR3N2Z0hHOUp1Uk9BUmdvcEJVL2ZO?=
 =?utf-8?B?YlI0Umt1Y3djMmNjeDJwV1FSMFJiajl0MVlXVmo2aWVJM1VnL0VESUtBVHV4?=
 =?utf-8?B?R1BTU3BxN3J6cmFZVEpOOU9EcFhlNjI1VWduRTIzdEY4TWt1d1YxV1Q4TGNw?=
 =?utf-8?B?WitIckw1eVN3ZlF1SlhLelpTV0R3Rk8ydStPWFl1YlN0cDRMQlpsU1JlZG5Z?=
 =?utf-8?B?NitNYlA0cTdKUkpLU2k4MU1uU1BzN3hPdzdMSXZLWCswTklTcFpSWHpxZGtS?=
 =?utf-8?B?QjZBOUZhakFXQ3ExVGJyb2dCdXJveEVpZFBiRllJWi9CN0xyRjBQeDkrRXl5?=
 =?utf-8?B?R05jN3dDSU5rVlB6T3ZMb3hpRWthdE9QV04xOTJqZ3pITWxhYTQzYk5tWE92?=
 =?utf-8?B?UXF6MTN0ZzcvOUxRRG5mRHRONDVuRFpqSERVNjU4cWhaZkZQQk1HVkYwY3Ra?=
 =?utf-8?B?c28zbTlEL0ZSWHBtRnpiY1NyR2kvYi9qYjlsMFlrcUl1UzJjTEE5RE1wV01m?=
 =?utf-8?B?dzQxSitCcTQ4MCsrQ0REd1lrYTNyU3V1c0J0bEpnbWxoMUJmalRTcEUxUllT?=
 =?utf-8?B?UVY4QU83bmswYnFvb0xxRWp3MXFkZCtqQ0FyenhzcHJ5a3V1c0tNRktHYTBl?=
 =?utf-8?B?M1EyOXZ6SEQzUXhUSUhnTm5lRjJPb3FSU3oxNm5qSVFpVHYxQ2pzcXZITTlm?=
 =?utf-8?B?NEw3aWozTGxTZkZjMkFrOHFnQkxhbFRMSXpIYlVJb0NtekFwZXI5cW1CcVU3?=
 =?utf-8?B?RHQ3eHdsVzN6WlZManZQK2hXRWF3N3c3Q2RRU2tINjY4WG1WOGJhc1d0b1Va?=
 =?utf-8?B?NzA1aWZFbXkyUEV4OXhyNGNqdXVzbDF1VzJ6RlZLbEN4ckhaUjV6TjRxUjdZ?=
 =?utf-8?B?Wi9DdXZwVW5mL1ZhRzhLcG5PS2FzVHBSNGVLUExjTHE3VWh6WWJOa3NzV0RK?=
 =?utf-8?B?cGtqYXpaTFBJeHd2U1pMWWMwd0J2MUNhSEZ3YnhXd21xSEFTUFVlaUpEYm0r?=
 =?utf-8?B?QStyL3RtT2x5MkxZS1dNb1d6VU1hYVVmbnV3MVVzbFVDVGV4NzlIUmhlV1pR?=
 =?utf-8?B?T1RoeGpjenRlM0xrUGNVZEVLbDlIQkRnTlhGOG9YcVpCdUlQcERTckdUNGdC?=
 =?utf-8?B?UllRRjRPY0p6R1RvZ1lpNUE4eTExYmg3emU4d1ZaOXdSdDEzWEJ6bk9Fdmx2?=
 =?utf-8?Q?PxsuLDr3mUdMQTqEUUQlwWY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ab0292-ad1e-4604-6ca6-08d9fd1ed6af
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 14:05:14.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEc1wAhNaSx6eA1EXWGLckkqVI0+JAdknrjXNmUVM6hkG+gIJ1o1VCv72thOpdbW3LvFdCaRvmiVjTAm0lP1gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2655
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/3/2022 5:25 PM, Vladimir Sementsov-Ogievskiy wrote:
> 03.03.2022 05:21, Rao Lei wrote:
>> During the stress test, the IO request coroutine has a probability that it
>> can't be awakened when the NBD server is killed.
>>
>> The GDB statck is as follows:
>> (gdb) bt
>> 0  0x00007f2ff990cbf6 in __ppoll (fds=0x55575de85000, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>> 1  0x000055575c302e7c in qemu_poll_ns (fds=0x55575de85000, nfds=1, timeout=599999603140) at ../util/qemu-timer.c:348
>> 2  0x000055575c2d3c34 in fdmon_poll_wait (ctx=0x55575dc480f0, ready_list=0x7ffd9dd1dae0, timeout=599999603140) at ../util/fdmon-poll.c:80
>> 3  0x000055575c2d350d in aio_poll (ctx=0x55575dc480f0, blocking=true) at ../util/aio-posix.c:655
>> 4  0x000055575c16eabd in bdrv_do_drained_begin (bs=0x55575dee7fe0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at ../block/io.c:474
>> 5  0x000055575c16eba6 in bdrv_drained_begin (bs=0x55575dee7fe0) at ../block/io.c:480
>> 6  0x000055575c1aff33 in quorum_del_child (bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block/quorum.c:1130
>> 7  0x000055575c14239b in bdrv_del_child (parent_bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block.c:7705
>> 8  0x000055575c12da28 in qmp_x_blockdev_change
>>      (parent=0x55575df404c0 "colo-disk0", has_child=true, child=0x55575de867f0 "children.1", has_node=false, node=0x0, errp=0x7ffd9dd1dd08)
>>      at ../blockdev.c:3676
>> 9  0x000055575c258435 in qmp_marshal_x_blockdev_change (args=0x7f2fec008190, ret=0x7f2ff7b0bd98, errp=0x7f2ff7b0bd90) at qapi/qapi-commands-block-core.c:1675
>> 10 0x000055575c2c6201 in do_qmp_dispatch_bh (opaque=0x7f2ff7b0be30) at ../qapi/qmp-dispatch.c:129
>> 11 0x000055575c2ebb1c in aio_bh_call (bh=0x55575dc429c0) at ../util/async.c:141
>> 12 0x000055575c2ebc2a in aio_bh_poll (ctx=0x55575dc480f0) at ../util/async.c:169
>> 13 0x000055575c2d2d96 in aio_dispatch (ctx=0x55575dc480f0) at ../util/aio-posix.c:415
>> 14 0x000055575c2ec07f in aio_ctx_dispatch (source=0x55575dc480f0, callback=0x0, user_data=0x0) at ../util/async.c:311
>> 15 0x00007f2ff9e7cfbd in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
>> 16 0x000055575c2fd581 in glib_pollfds_poll () at ../util/main-loop.c:232
>> 17 0x000055575c2fd5ff in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
>> 18 0x000055575c2fd710 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
>> 19 0x000055575bfa7588 in qemu_main_loop () at ../softmmu/runstate.c:726
>> 20 0x000055575bbee57a in main (argc=60, argv=0x7ffd9dd1e0e8, envp=0x7ffd9dd1e2d0) at ../softmmu/main.c:50
>>
>> (gdb) qemu coroutine 0x55575e16aac0
>> 0  0x000055575c2ee7dc in qemu_coroutine_switch (from_=0x55575e16aac0, to_=0x7f2ff830fba0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
>> 1  0x000055575c2fe2a9 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:195
>> 2  0x000055575c2fe93c in qemu_co_queue_wait_impl (queue=0x55575dc46170, lock=0x7f2b32ad9850) at ../util/qemu-coroutine-lock.c:56
>> 3  0x000055575c17ddfb in nbd_co_send_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, qiov=0x55575dfc15d8) at ../block/nbd.c:478
>> 4  0x000055575c17f931 in nbd_co_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, write_qiov=0x55575dfc15d8) at ../block/nbd.c:1182
>> 5  0x000055575c17fe14 in nbd_client_co_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/nbd.c:1284
>> 6  0x000055575c170d25 in bdrv_driver_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>      at ../block/io.c:1264
>> 7  0x000055575c1733b4 in bdrv_aligned_pwritev
>>      (child=0x55575dff6890, req=0x7f2b32ad9ad0, offset=403487858688, bytes=4538368, align=1, qiov=0x55575dfc15d8, qiov_offset=0, flags=0) at ../block/io.c:2126
>> 8  0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>      at ../block/io.c:2314
>> 9  0x000055575c17391b in bdrv_co_pwritev (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
>> 10 0x000055575c1ee506 in replication_co_writev (bs=0x55575e9824f0, sector_num=788062224, remaining_sectors=8864, qiov=0x55575dfc15d8, flags=0)
>>      at ../block/replication.c:270
>> 11 0x000055575c170eed in bdrv_driver_pwritev (bs=0x55575e9824f0, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>      at ../block/io.c:1297
>> 12 0x000055575c1733b4 in bdrv_aligned_pwritev
>>      (child=0x55575dcea690, req=0x7f2b32ad9e00, offset=403487858688, bytes=4538368, align=512, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>      at ../block/io.c:2126
>> 13 0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>      at ../block/io.c:2314
>> 14 0x000055575c17391b in bdrv_co_pwritev (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
>> 15 0x000055575c1aeffa in write_quorum_entry (opaque=0x7f2fddaf8c50) at ../block/quorum.c:699
>> 16 0x000055575c2ee4db in coroutine_trampoline (i0=1578543808, i1=21847) at ../util/coroutine-ucontext.c:173
>> 17 0x00007f2ff9855660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
>>
>> When we do failover in COLO mode, QEMU will hang while it is waiting for the in flight IO.
>>  From the call trace, we can see the IO request coroutine which is waiting for send_mutex
> 
> Hmm, in call-trace above, it's not waiting for send_mutex, but sitting in yield() inside qemu_co_queue_wait()..
> 
>> has yield in nbd_co_send_request(). When we kill nbd server, it will never be wake up.
>> So, it is necessary to wake up the coroutine in nbd_channel_error().
>>
>> Signed-off-by: Rao Lei <lei.rao@intel.com>
>> ---
>>   block/nbd.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 5853d85d60..cf9dda537c 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -167,6 +167,7 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
>>           s->state = NBD_CLIENT_QUIT;
>>       }
>> +    qemu_co_queue_restart_all(&s->free_sema);
>>       nbd_recv_coroutines_wake(s, true);
>>   }
> 
> Hmm. I think, I understand the problem.
> 
> Actually, when request finishes, it calls qemu_co_queue_next(&s->free_sema). But I assume the problem is that we have a lot of requests in free_sema queue. So, when error occured, current MAX_NBD_REQUESTS finishes with error and they wake up at most MAX_NBD_REQUESTS from the queue.. But what if we still have a lot more requests in free_sema queue? Seems right, nobody will wake them.
> 
> I think better is simply move one line:
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 5853d85d60..33adfddc41 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -529,8 +529,8 @@ err:
>           if (i != -1) {
>               s->requests[i].coroutine = NULL;
>               s->in_flight--;
> -            qemu_co_queue_next(&s->free_sema);
>           }
> +        qemu_co_queue_next(&s->free_sema);
>       }
>       qemu_co_mutex_unlock(&s->send_mutex);
>       return rc;
> 
> 
> 
> Could you check, does it help you?
> 
> This way, every coroutine, that goes out from
>      while (s->in_flight == MAX_NBD_REQUESTS ||
>             (!nbd_client_connected(s) && s->in_flight > 0))
>      {
>          qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
>      }
> 
> will wake next coroutine, and thus we will not hang.
> 
> 
> In other words, I think, that the real problem is that in
> 
> case
> 
>      if (!nbd_client_connected(s)) {
>          rc = -EIO;
>          goto err;
>      }
> 
> of nbd_co_send_request(), we don't wake next coroutine in free_sema. So, let's fix it.

I think you are right and will rerun the stress test.

Thanks
Lei

> 

