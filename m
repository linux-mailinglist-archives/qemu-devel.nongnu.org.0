Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4813524649
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 09:01:03 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np2oo-0008WC-KL
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 03:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1np2ke-0006u5-Cg; Thu, 12 May 2022 02:56:44 -0400
Received: from corp-ob08.yahoo-corp.jp ([183.79.94.93]:59280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1np2kZ-0000YX-VZ; Thu, 12 May 2022 02:56:43 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01lp2113.outbound.protection.outlook.com [104.47.23.113])
 by corp-ob08.yahoo-corp.jp (Postfix) with ESMTPS id 6DAF219FB187;
 Thu, 12 May 2022 15:56:31 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1652338591;
 bh=3Irb0zuudvOiyxdWsHDl4bz1draOjABYL3tHZ1WlJiM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=nXF+smfxb7I8KZh/oMm9laUhvlz3zGJhu6wuq2H4xDEig4iBwLUrszEyGmnEqBTAY
 Dj28FAPemW7IZ7X6Di6hZDZqUR3Z8XmwXZra57ZPtfc4MTdyu/onFvaRg7WHpoHDlk
 fYJV2qOdaXdPloz4737mEhfyjLc5MxCx/b/KvgXU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkvSgjh3NXaWU8H3TBamTvnLa3NzUHc1XwREsde3kdA0nIKCZ8FYyeO0kODLo5GwaqE9gEF8TmuBagDd2ANwoY3VbUNMJs7unCI5Zf/3PgKZqf/0nXXNCF8yhhyF5gi8lzxSN5IH0TlovMycgtI0KosvwyH+Fx7Ub9d+4hXVTH+FTj+mZLeIcmtauxLuGhmElN3hevBxiMuVrGv4lMHq20tGom+njMuk1H3E9kcxpIEkjdxGKMNt2ARvc2Fk8zKyXJYSJNXuO5Yxa7w54GRYQFfcA/xu+Xk79LSJQOaT/gBWZLIrwdWFVJMG+BaW/u41TvzVrSVSXbxAOnnm8kPYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Irb0zuudvOiyxdWsHDl4bz1draOjABYL3tHZ1WlJiM=;
 b=n6UgIyN3TL4EM8Quy2vfVuvOd8YDc76HozAC+UZZvIUa/o3NxN8GS5/tF998ebOW9h1T6SgoAoQ9umKk7nwbB2dfh0kwqhVzA9vsoAX4eGzqoCQYAARJmGGAXEaJIYaIDOte8jb4gbMf7xc/jejghBnqvszZyRAHLtKKBE+R9JJ7Ec9XG0A6AeSuusrB/SEaneulm0+llhkZzUtpmAwLIVrBnJieggZCKG+u2Xh0lFqsCa+BtcJcPGqo3WZF8uIpRjQwE4rAMJ9I0e1r/B9XISF9anL0QPIAD1juGmjIl8rB7LSa8HM50FVTZn4JHLYRMRk+ewaXIGDsKOuOdVh2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Irb0zuudvOiyxdWsHDl4bz1draOjABYL3tHZ1WlJiM=;
 b=MZ6wjkrOyJj9QH5FGR/+/l2QxsVye4UMJV5DnhpWtgPfqcGAQ5n36wN2wWVw7vZx1T9UvarRTWYWpWeUnn3gQNk+3zdbEwqYgk710DsBFE8NspiU1vvK5pgN2fJk3vGSBi6Pdf4td1T7FDwi6NJdmBR9f9C3w1aDwfi33fdyAHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com (2603:1096:400:1e6::5)
 by OS3PR01MB8302.jpnprd01.prod.outlook.com (2603:1096:604:1a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 06:56:29 +0000
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::a9da:d25a:6eb4:96e4]) by TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::a9da:d25a:6eb4:96e4%4]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 06:56:29 +0000
Message-ID: <41c8f1d4-be27-4110-33c0-b53a701a9cb6@yahoo-corp.jp>
Date: Thu, 12 May 2022 15:56:19 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] coroutine: Revert to constant batch size
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20220510151020.105528-1-kwolf@redhat.com>
 <20220510151020.105528-3-kwolf@redhat.com>
From: =?UTF-8?B?5oiQ5bedIOW8mOaouQ==?= <hnarukaw@yahoo-corp.jp>
In-Reply-To: <20220510151020.105528-3-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::34) To TYWPR01MB10194.jpnprd01.prod.outlook.com
 (2603:1096:400:1e6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cf9103d-1ed2-451c-f955-08da33e48a33
X-MS-TrafficTypeDiagnostic: OS3PR01MB8302:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB8302E8D8C5A2AB76F0AD552180CB9@OS3PR01MB8302.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hAxoXn+3oiaG+j+UbETqtCM5Z27lj9t1j4AnbbdnQ8p4uZsLLjevvMWTaxhVkW3o9otSG4N+ZjkIN8vaT0GzD1aFUh+YP+1UBzxGedRrWWnlY11owFnBx1zVCU2CfQDRkJCu8GYFl9jqd6iz6Q3T0NYgmGFKa/ZHg5VayTQ5oi14urRDAx+KXXYHZFDc/4xwpaj5ZlyTMDebm268HDX3rlnjAAoJByeDocW5oXkWeXVlMJV+BTsKVqCuRM31MLqtzG7Ib23qazk3strQxMIOeQYimHDTqxYm/xm5edbhQ2M3O3pNvp8SDeakPVi0M8ypj81Y48NFTR1j/uiRe4ZxNuwIHBs9bI9IQgxk8H8khHUwE8bjXWo5ygE90pUQzGz5ObanOhOd/C2DGTxLR1R7SCXj4mEXarT654xbClLKqhe4HJzK6Bj/ajRunbiorF+e6JIRrdgxQA4VkphGl6FPJBwf2V1NVASiER2+SswslBHGfw9dR66XMT8WwmKlBcv23cEkyguzV10wz+TimZsjFiz3sPQmp/jv4EwtGore/gGfyXzBgwADMTTAkSOHSxNpLhzzp/EofS5Mu/rUrv4sIcS9/LtinqLkGXiXRaxQy2vZWYPGcGbSNdlXADQ/9e7l4w2nyNKX1MbS4cngNz5s1KZiOnrXPAceFjyKkqX6fiUvOqSXjA4TNWg9JTRFVaxb81qOZlKBASmPDtS2uaO5BJWfaHKcDJ29T566i1jwCpJx4yKjXI9X/X6nwv+3jaOOan9hxXDMKvdMUN7dPvxOXVGpUKX+BbAt7Nd0xwXAjNbCMp4QI+J/D0mOYBf7gKIt1HOar7XOMXllYy47fuDZs8KhpVE0/t22rB7DNgCZts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB10194.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6486002)(508600001)(52116002)(66946007)(31686004)(66476007)(2616005)(4326008)(85182001)(31696002)(66556008)(8676002)(8936002)(5660300002)(2906002)(186003)(86362001)(36756003)(53546011)(38100700002)(83380400001)(82960400001)(6512007)(316002)(6506007)(26005)(6666004)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGoxbnM2a0h1eUx6TTgyR2FtbnhMUlhNNkh3Z1pYN3dod0JsZzlzVzA2MFVG?=
 =?utf-8?B?V1cwZzA0VWU3UTRuenlyU2NmQ3MwaCtTZXRYcjd5dkE3NWRWNVliUTBuVjM1?=
 =?utf-8?B?QXQ5UE8xTjBmb3BpNmRDcHlVSTE5SUE4bEJvZ2lpTm0yTW1FdzZrRHVkZ2tI?=
 =?utf-8?B?eDYvMU1EeU5ibUFLYm1FQWtEZmVFT0o4UGVseGErekZjeW9QZ2s0OCtzbDdN?=
 =?utf-8?B?QVlXYklNSW84UHRNUk12SEkrbDV3SlFIQzVFemZEQU1OdVk2THZjbDJBaHBn?=
 =?utf-8?B?V1VCUFArbHBsWnlzNW9ZTlFSUnRQczRwVmlZTWV6YmI4Lys3TTdDWkwzTnEv?=
 =?utf-8?B?dFFYSlh6T1BpaElLR3hpR0NWY2EvSHlYSW9odDlhcGw1QnlTdEJoL2ptMXNq?=
 =?utf-8?B?UEk2TGZTQ3pFRy9CTWZESUt5MVFxaFNaem4ySTdiYyttb0hTamFETVVkVHpy?=
 =?utf-8?B?RzBHL2RSWGdSNmNQOEphcDIxN01vcjhodlFNWjZyS2UwUHhpZUNKZVhHZjFK?=
 =?utf-8?B?cW5rZ1BlajQ5aFgxUGhNblQyTncrdkFDUlFRNGRhQml1QXNTc2ZzeXFNTk5h?=
 =?utf-8?B?V2drNDRxblBOZkc3NEdsS1pORGozYzRDbVRSN1JmbFJNQm9FTzM3eEdGQWZP?=
 =?utf-8?B?STEvN3ZhNWZCcHl5WHRPcHI0bXYzcktoaGNZRGZFSllNVFhHNFYwYmt6UVFE?=
 =?utf-8?B?T0ZYL1AyTWpMaU1LNEFFejlXdkZodVlPdE9iSURQb1VmNHdQWDRuRHhvYi9W?=
 =?utf-8?B?ZlI2aWVjMkVTWVFabE1HQmJhN1VMSEtKZWp5S0JQSDhteXVSbmNIbGFBaHRk?=
 =?utf-8?B?b0RiYTVla0dUT283bDFzM0xqK3JjYWVGKzBDak5ZcXF1S1c1eWRBMkZ0NUlQ?=
 =?utf-8?B?RHpPTzBsdzhMS2U5bVFCam1MUDJ4OXNuTjV6SjNXblV6RDBieko0bEx3WEls?=
 =?utf-8?B?cURmWDJIT0d1UDBXUG1wWDd4NUJiL0FYZ2dKTVB5MjRDa2E1ckQzZU1WaU1a?=
 =?utf-8?B?aTBPUWdld2FsUC9uRlFaM2R2LzExUnhtRXVZS1ZpWUc0dFNQQjVTODE3WmNm?=
 =?utf-8?B?SUg1QWE4KzRydVhJRDB6Sno3aU0ydFFtK3h2akJoNmdIYVYwQmlmZ2xrUitn?=
 =?utf-8?B?bmNWTU9vcGt0cGRoVkQxaFlWV0ZkTGdBeHpqL3BUY3dIbVlvb2R1a2ZpTVlH?=
 =?utf-8?B?MGR2Zzd4YVZJRTZXTXVtV3hGRENSY3U3R0RmRU9aUkFFd3J0ajJFT2I3RlpV?=
 =?utf-8?B?NGhoK3Y0ejRVWjFaWlZXb1Z0SlBwblIvZk5NK3hHcDljeHBVMnBLRmxtbUJT?=
 =?utf-8?B?MWw1cjRBbW1QWkFEUUpNMU43ZGY2dUtacDU2K1lBT0hPcnZIbktTSUhGSG95?=
 =?utf-8?B?ZnMyNCtOcVd6TTdZOU5iRmtWK29Ud25kTmlsMlVFdGZVbHVBQVliendMV3Iw?=
 =?utf-8?B?ajBUTkh1VXIyZVprNnkxQzZEZU1JZ3M1Q3VmMUlydWQvUVQ5UWQ0Yk51bXg3?=
 =?utf-8?B?dXZSamtSYmpWeVR3QWplYW15ZkF2WEFxbmIveXowV0FqY2FMWDBWSkhvSEpU?=
 =?utf-8?B?UjAzWUNIS2xiMmp2cGdPcHpJUnRhYlNMWS95c1VkNXhmZ0ZJWTVrMmMrcUpN?=
 =?utf-8?B?VXFmaVYyZy9SeDdqSnp1SzBuNW95aDExNlM0ZDBNbWdvOC9uZVVCZUtKL1l6?=
 =?utf-8?B?VXJYYlVWV3lnUDV4UmQ3YnBtcmhqUEM1b2JRbmE5K1g5SjlLclRTcXEvOXJu?=
 =?utf-8?B?SkxiQ09mWUNTSllneDl3STNKQit1cHZ3VytIK0tHaVpvSFI3UDVXdFFSaE83?=
 =?utf-8?B?Q0lVaURFMXpiWWZtNy9XdUFSeVFJdkNuUU83cTlla2N6VGdyVVZ0VHlUczho?=
 =?utf-8?B?a2xGSFVUTmw2dzQzamVINlJFN0MzUGs1YnpmN3lVcjF2dG5tRXdFMTNObVk0?=
 =?utf-8?B?UWF6MzJtOHJ3S3JNSUd2b2gwSlhsU29vSVkrVkJHeDFtS3JFdmdCOW96Ukw4?=
 =?utf-8?B?NVpNalplNmxQU0U4M1ZOQlhRTGNOREQvWmtGc2VDV01aUFRncVk5ZklSQ0Jy?=
 =?utf-8?B?MXJmMWNwZTBEMzFNZm9kRUp5Rzh3dy9CcjdWRlFsaGJ6SzJtdmFPMmZjTkJI?=
 =?utf-8?B?ZTBySmJLVEdSQkRmTFNzSytWNlJzU1FXVWpDS29TS2d0T3JXb28xam9KSWFP?=
 =?utf-8?B?TlZwaHVSSm1vSHQvQ25XUlhsMTdMNnU0T3lxVWNNQmtzc0ZJdWlVUXhsOGRY?=
 =?utf-8?B?d21KcWoydHlrMmhEN0pNZkV6bmM5aStSMGh5U1FXZkZHSi9xNjBVY2lsdHVw?=
 =?utf-8?B?NnhGNVhLZE9qbE9wUDhBVmlDSjBLWWp3RmtWano0NXJuSVRsNmFnZz09?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf9103d-1ed2-451c-f955-08da33e48a33
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10194.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 06:56:29.1506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHNdwumVxja0SrU++1Si+l6I62Ojj4bAL3U3pTJCLCNk5SXbGJJSJ9BHxyLu1JvkA3Mfb2t0rYn2m2f7fFU2zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8302
Received-SPF: pass client-ip=183.79.94.93; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob08.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for your fix.

I confirmed that after applying this patch, my intended performance 
improvement by 4c41c69e is still kept in our environment.


On 2022/05/11 0:10, Kevin Wolf wrote:
> Commit 4c41c69e changed the way the coroutine pool is sized because for
> virtio-blk devices with a large queue size and heavy I/O, it was just
> too small and caused coroutines to be deleted and reallocated soon
> afterwards. The change made the size dynamic based on the number of
> queues and the queue size of virtio-blk devices.
> 
> There are two important numbers here: Slightly simplified, when a
> coroutine terminates, it is generally stored in the global release pool
> up to a certain pool size, and if the pool is full, it is freed.
> Conversely, when allocating a new coroutine, the coroutines in the
> release pool are reused if the pool already has reached a certain
> minimum size (the batch size), otherwise we allocate new coroutines.
> 
> The problem after commit 4c41c69e is that it not only increases the
> maximum pool size (which is the intended effect), but also the batch
> size for reusing coroutines (which is a bug). It means that in cases
> with many devices and/or a large queue size (which defaults to the
> number of vcpus for virtio-blk-pci), many thousand coroutines could be
> sitting in the release pool without being reused.
> 
> This is not only a waste of memory and allocations, but it actually
> makes the QEMU process likely to hit the vm.max_map_count limit on Linux
> because each coroutine requires two mappings (its stack and the guard
> page for the stack), causing it to abort() in qemu_alloc_stack() because
> when the limit is hit, mprotect() starts to fail with ENOMEM.
> 
> In order to fix the problem, change the batch size back to 64 to avoid
> uselessly accumulating coroutines in the release pool, but keep the
> dynamic maximum pool size so that coroutines aren't freed too early
> in heavy I/O scenarios.
> 
> Note that this fix doesn't strictly make it impossible to hit the limit,
> but this would only happen if most of the coroutines are actually in use
> at the same time, not just sitting in a pool. This is the same behaviour
> as we already had before commit 4c41c69e. Fully preventing this would
> require allowing qemu_coroutine_create() to return an error, but it
> doesn't seem to be a scenario that people hit in practice.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2079938
> Fixes: 4c41c69e05fe28c0f95f8abd2ebf407e95a4f04b
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   util/qemu-coroutine.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index ea23929a74..4a8bd63ef0 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -21,14 +21,20 @@
>   #include "qemu/coroutine-tls.h"
>   #include "block/aio.h"
>   
> -/** Initial batch size is 64, and is increased on demand */
> +/**
> + * The minimal batch size is always 64, coroutines from the release_pool are
> + * reused as soon as there are 64 coroutines in it. The maximum pool size starts
> + * with 64 and is increased on demand so that coroutines are not deleted even if
> + * they are not immediately reused.
> + */
>   enum {
> -    POOL_INITIAL_BATCH_SIZE = 64,
> +    POOL_MIN_BATCH_SIZE = 64,
> +    POOL_INITIAL_MAX_SIZE = 64,
>   };
>   
>   /** Free list to speed up creation */
>   static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
> -static unsigned int pool_batch_size = POOL_INITIAL_BATCH_SIZE;
> +static unsigned int pool_max_size = POOL_INITIAL_MAX_SIZE;
>   static unsigned int release_pool_size;
>   
>   typedef QSLIST_HEAD(, Coroutine) CoroutineQSList;
> @@ -57,7 +63,7 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
>   
>           co = QSLIST_FIRST(alloc_pool);
>           if (!co) {
> -            if (release_pool_size > qatomic_read(&pool_batch_size)) {
> +            if (release_pool_size > POOL_MIN_BATCH_SIZE) {
>                   /* Slow path; a good place to register the destructor, too.  */
>                   Notifier *notifier = get_ptr_coroutine_pool_cleanup_notifier();
>                   if (!notifier->notify) {
> @@ -95,12 +101,12 @@ static void coroutine_delete(Coroutine *co)
>       co->caller = NULL;
>   
>       if (CONFIG_COROUTINE_POOL) {
> -        if (release_pool_size < qatomic_read(&pool_batch_size) * 2) {
> +        if (release_pool_size < qatomic_read(&pool_max_size) * 2) {
>               QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
>               qatomic_inc(&release_pool_size);
>               return;
>           }
> -        if (get_alloc_pool_size() < qatomic_read(&pool_batch_size)) {
> +        if (get_alloc_pool_size() < qatomic_read(&pool_max_size)) {
>               QSLIST_INSERT_HEAD(get_ptr_alloc_pool(), co, pool_next);
>               set_alloc_pool_size(get_alloc_pool_size() + 1);
>               return;
> @@ -214,10 +220,10 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
>   
>   void qemu_coroutine_inc_pool_size(unsigned int additional_pool_size)
>   {
> -    qatomic_add(&pool_batch_size, additional_pool_size);
> +    qatomic_add(&pool_max_size, additional_pool_size);
>   }
>   
>   void qemu_coroutine_dec_pool_size(unsigned int removing_pool_size)
>   {
> -    qatomic_sub(&pool_batch_size, removing_pool_size);
> +    qatomic_sub(&pool_max_size, removing_pool_size);
>   }

