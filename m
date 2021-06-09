Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665CC3A1B28
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:41:59 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1HC-0007lg-GQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr1G5-0006n1-4D; Wed, 09 Jun 2021 12:40:49 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:14689 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr1G1-0007Y9-Q9; Wed, 09 Jun 2021 12:40:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfbZwiu/4ogtMp/CtX8Js4GmU6W5M7Qmg3jQ8ryAeL8G7xeV/Vr6+E+QYIkp4VUQ/3EAXljTJ9n+ywWbMjLHszHgIHwr+NSEDO6j+yakvO485OuZYMHmFvUpRdU8K2diVrvLfCaGDcwzFeEoTi0wvzosZ3gTMv922/hR8xRczG767EKlAKE2GpLwDhV1ffSMmCoTN+2NbzwCw2FD0w74NlwQgj53OTR8to6LOz7kIHDMbygMTRfjWNndvTNun7G7jJiFADpPOttS+7stDtfh8iu6nuZSxuOkX9F4Ph1gtqfAJaYn/2JIPOJFUP50db0vhxRr4YKTN3nhuBlzhxL1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHnW2KU/Cd0HU2gYKT5NX4lTFqc8R7rpUmC73ASbkQ=;
 b=e9hzdsKcZHzgiBUltqaShGPboOPRJ938DXlm6bT4x9/TIIokZQsCYUqowjFhs8zo1NtLBaTfQ94Pxvg5Ov0PRa5LIQ79Y8VB7QV2LLXDH5dQmRkzAD/56OC1GFzxCahTmSz5LamFommKighjhPiHVAJNYyIBoL5ldcAbrWoEbHxdPQenwrtw+oBqoLgc/ym/nl5XKzKm1DyrVq6urWVy4Nd3dIfGeZce1KTl5OGNstOBe/Aw6KtkIPo3VhTm5mOoPDagmnP4/SvUYC9HOUE2u7WC+EF73yaWS2z1p0As9UzMaIce/6SPVPiYDJa76EnsPdiP/zN5slLqCafqMXMLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHnW2KU/Cd0HU2gYKT5NX4lTFqc8R7rpUmC73ASbkQ=;
 b=TFMh6xAiPqodauWfshRVS8w8swLbVk0a+i1w9n8iv8BnIapeXT6cKP5qqfBgjLxSYxw+0qy4skghumftUfJtwQoLJbKREKazpio6uzBwIaYR820NcCJUsuWV05DAJyl3R9Ebdn0mi+4T9/o8rXvpfME/K1Eqd6ymbDvtgpV1Uuo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 16:40:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 16:40:41 +0000
Subject: Re: [PATCH v4 0/6] Allow changing bs->file on reopen
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <b2420fae-1ce5-ee5b-792a-ede183280ec7@virtuozzo.com>
 <YMDkCxp3PD9TmMwp@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <66ad2cc8-00bb-a84c-f187-9886851f8468@virtuozzo.com>
Date: Wed, 9 Jun 2021 19:40:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMDkCxp3PD9TmMwp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:208:be::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR04CA0106.eurprd04.prod.outlook.com (2603:10a6:208:be::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 16:40:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d46b69-5d62-4cfe-9e81-08d92b6551b8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5079:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5079BAD33BDB2BFD79C09435C1369@AM6PR08MB5079.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXaGa2BFPIyYf8jloLQGQXTz3hyd3Ne5qCE3rjlu/fKnYyZLxqmaplkEY/Su1Gogg2RVAfY+eaiG/ynowBhbiB4bPXsY+EDYeKgg5jTi5GT77NlY7WOqJMGUCvUFLDYcR9CrGwWSfMRJSPlZkGEnd2sBbHSRW5Gw/9CvRvtLhYqHMlclHumxV3VdSAwGf0fm4D5bj1K6azLC69LtXuP9/TuFpV0kS1CFu3nsy2mW2zJ9fAGoD2/Wr2L0hr/cz/UUFU+BomXrP3qd6ZYTF4hQZnZx+VWUE3ibldlBuy9dgQEbjaOc+laKGShxjXZXuAwN9P9iVN+0JNs7JblPmg9M5g56lqJNtLrWeAuLT5SUo2d6PDQvQZrHQ2zxvT8qPtGkZZpS4U9o7ot104ynRHHDhZBuVLPqpAj62KMnAAkuE//htv+fzK/NC/d4SNXeLOHiJMrKEirt3n08o4xnQf/VtzLP4eFzGhsp+5xDw4lCiLzWfZp8djOm185DpXazkpykU5zfTxvop8T2vfn/FFXCSA5EIvtb/V3WOMZxx030Z6IatiqPhGw1szrrW4V3r7HlrDxsmWQZnfE6xKVL3iM39OB16voNL5rd/FvVUpCldBuqz0Ycdjw0sCePX4oqe9ftVzpsglWmzxwQS7yNKo9aiLkkHEgoIPdFI+nBZW1vV/6ovsJfvdVYlQIYq9BY+xaU70L3s/9b3gJ4ORT47y4oOecRYxgofM7E2EpJjpIpPzCGX9U5oPzYFR5PKBoV5nq+WLzWqZ/Xan17QZv2MuGQYiONzOWX5b7XMS/saRJ6ztwUabc3yQbuLrdYpn7IKs86zPyCqlid/FzNsr6m3YNkug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(366004)(136003)(346002)(8936002)(16576012)(31696002)(26005)(66946007)(16526019)(966005)(316002)(186003)(956004)(66556008)(36756003)(478600001)(52116002)(6916009)(4326008)(8676002)(2906002)(38350700002)(6486002)(83380400001)(86362001)(38100700002)(66476007)(5660300002)(54906003)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mm45ZlNTOHY0c1hRR0JYOGp0NThaUlZYQ29aVElBWFUxUzNiSjNBZU5RM0tE?=
 =?utf-8?B?VTAyRzVwQUh5TE5wd1dpYWI4SWRqdHdlM0xlMlpNeGd0OXB3UUV5TUtQSTYy?=
 =?utf-8?B?Q1dNSEUzdFFNcDVLckFidDYyYW1LOHgvOHBBRzFMbVVjTTByQ0UrSkMweUEv?=
 =?utf-8?B?aTV4RTFjbVh1V1BkVmRHWHN5UTgyUzFJZXFzQ2hFLzNLNGw2VGZ6ZS9RUXhm?=
 =?utf-8?B?V3plWmhoQng5VmFrN2o4eWI4UFhmZ1dibmxkKzRpWFFUNkU5TnJQVDdBbnVm?=
 =?utf-8?B?NFJzMTNlTlF3ZU9XMThyTG16Mi9Uazc5NVhjRENFVnlKYzJXaEN6TTIycmJJ?=
 =?utf-8?B?Mi9DZURVenNaaUdMNU5QNDg4ODZzbDVkbHhjNTNSVlZBQjY5MWVXeXo4ajRR?=
 =?utf-8?B?WlIrYkttbVhJOEdDYmt3RXRrc1RlRm52MUxjNDBSRlVCa2U0U2VjcVZ1SkVo?=
 =?utf-8?B?ZXlsRENRNXlNamJrVytUSFlpZEhpUWM4ZkpCdzUzSThDVmFCTlBVTHJCTHp2?=
 =?utf-8?B?VHNaV3VqOWd2OGlHeXdsSkZxZkpWQTc3emNJMHYweVZIekRETDdRS3Q1VUcw?=
 =?utf-8?B?SEdaOW1xU3k0UldjSFEwRDJiT1VTbzVNcXRWOWpVTUYzVnQ4MzgzbUloWjdv?=
 =?utf-8?B?ODVCRzhsR1dleWNQS1NXVC9xRmE5WEsrYW9IQ0pab3I5Tlp0bVZTQk5EU3Nz?=
 =?utf-8?B?QVpjVkx5Y3lFMlJlYXpuaEd6UXNDWVVCOFVNYVdNS2Z4ZWl0eFk0Z0ltQ0F3?=
 =?utf-8?B?Ulh4U1RoVkJrN3BCUTlzdjJiS055ZlQ4NVJIanVCdVpvRWhUWVo1WXI5T3cr?=
 =?utf-8?B?Zm9SY1ZhaVE3NEdleDVpVGl0UE5jcTN3eUxiTmp3bC9KYmxJMURxVE9TZ1pY?=
 =?utf-8?B?aUVKQVhGR2tOckRBVFpTM1c3bmY5TStMNjVyWGUvbGl4WFlibVRnSC90dkps?=
 =?utf-8?B?NWIrV1R2a3NLNmpjNzJEbnRaWCtmZE41WFlKS2p5cXVCQzZtcGtUaDhreFFl?=
 =?utf-8?B?TjF1bGVubjVrYzlBL2hGZURjbVdaeWRzZENXR1NudUo2OERDaU80dC9ndWlJ?=
 =?utf-8?B?VUhQTzh3MVA4TzFDWnRGcjJhc1dyWjNJS1JDbDJUdVpVRXFhWXJ3OWdPTEF2?=
 =?utf-8?B?Um4yaGFDYlBZUStsYXpRazdENHV0ZlYzK3QrUnFIbG9jMXE2TmxTNU9yV1lp?=
 =?utf-8?B?NElJdFFtZnFoTE9wVUdRZlVmOW9CNmNmNjJnN2tCbGNjRy83alBKMWkzcE4x?=
 =?utf-8?B?UUc0Uko2VXZrMDF2S1A0empJK2lCME15QjRFMGRhN2F3VjNmT0d4VkRwVmxM?=
 =?utf-8?B?L3laSTgzbGUyZWkvYmxCWlFMbytNNno2OWs4U0xRVE4zVXFpQlVSRHFOOHFz?=
 =?utf-8?B?ZEtEWURLS29OT0lBdG13czg2Q2FyTlZQdWJESWZ2WEJVNkdGYkZhcTdHaXJa?=
 =?utf-8?B?N28xbmlJaUEvMVFVbmxtKzZ0WHdwMGhXamtkR0daSEhYRGRINE1ucFJxWHI3?=
 =?utf-8?B?d2pHZmRiVklQcHdXblE0U0RnWlJIVUJQUHhCV3FORUs0cVl6WnlKUkZUZ28v?=
 =?utf-8?B?b2VhRnp6VWR4OVhNRUYxQmRKRnpCaEdPOHRPbEk3MWVvUHh6dnljNE5iZDhT?=
 =?utf-8?B?aEI0dlhKSEdDNDRIYXljWDRTWHd1SlFLQmVpMGZJMkYxZWxkejZ1NUpCb3R6?=
 =?utf-8?B?SktxNDV5UlNwbEdWbWptZjgyKzg4bjB2VnVFWjVhdUZYTnUzaHdES1F2azdB?=
 =?utf-8?Q?GqCMCFIE9dk+v6W0fbMTHfDdhciWEWbYfYQj3zr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d46b69-5d62-4cfe-9e81-08d92b6551b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 16:40:41.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b903wz5azSnEzCuON34Rwh+b2PSd5woen196/wTk66breKicvj0MK7XLJx6qcdg5FWqN3yhQTprOExPlOmVR0f+qevWKTjXqlAvgjwrTaLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.06.2021 18:53, Kevin Wolf wrote:
> Am 14.05.2021 um 17:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi Alberto!
>>
>> What are your plans for v5? I'm now finishing a new series which makes
>> backup-top filter public, and I want to base it on your series
>> (otherwise I can't add a test).
> 
> Berto, where are we with this? I see that Vladimir picked up one or two
> patches for his series, but I think we still need a v5 at least for the
> rest?
> 
> If you can't find the time, should someone else pick up all patches?
> 
> Kevin

My "[PATCH v5 0/9] Allow changing bs->file on reopen" supersedes the "subject" part of the series. I think we now should start from taking it. Hmm, and I should check, does it conflict with recently merged block-permission-folloup and with beginning of "[PATCH v4 00/35] block: publish backup-top filter" which is already almost reviewed by Max and should land soon I hope (ohh, seems I should issue v5 for python conflictes).

So, I propose the following plan:

1. I'll rebase and send "block: publish backup-top filter" series today-tomorrow. It's big, and mostly reviewed, let's not lose r-bs by rebases.

2. I'll rebase and send if needed (if it conflicts with master and/or [1]) "[PATCH v5 0/9] Allow changing bs->file on reopen"

3. Then we'll decide what to do with the rest. Finally, I can take it if I have some time (the head is spinning from the number of tasks ;)

I also think that we can drop x- prefix even without supporting of multiple reopen, and implement it later as an option. QAPI interface is powerful enough for such enhancements.

> 
>> 17.03.2021 20:15, Alberto Garcia wrote:
>>> Based-on: <20210317143529.615584-1-vsementsov@virtuozzo.com>
>>>
>>> Hello,
>>>
>>> this is the same as v3, but rebased on top of Vladimir's "block:
>>> update graph permissions update v3", which you can get here:
>>>
>>> git: https://src.openvz.org/scm/~vsementsov/qemu.git
>>> tag: up-block-topologic-perm-v3
>>>
>>> Tip: you may find it easier to review patch 4 if you use 'git diff -w'
>>> since a big part of the changes that you see in
>>> qmp_x_blockdev_reopen() are just indentation changes.
>>>
>>> Berto
>>>
>>> v4:
>>> - Rebase on top of version 3 of Vladimir's branch
>>> v3: https://lists.gnu.org/archive/html/qemu-block/2021-03/msg00553.html
>>> v2: https://lists.gnu.org/archive/html/qemu-block/2021-02/msg00623.html
>>> v1: https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
>>>
>>> Output of git backport-diff against v3:
>>>
>>> Key:
>>> [----] : patches are identical
>>> [####] : number of functional differences between upstream/downstream patch
>>> [down] : patch is downstream-only
>>> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
>>>
>>> 001/6:[----] [--] 'block: Add bdrv_reopen_queue_free()'
>>> 002/6:[0018] [FC] 'block: Allow changing bs->file on reopen'
>>> 003/6:[----] [--] 'iotests: Test replacing files with x-blockdev-reopen'
>>> 004/6:[0071] [FC] 'block: Support multiple reopening with x-blockdev-reopen'
>>> 005/6:[----] [--] 'iotests: Test reopening multiple devices at the same time'
>>> 006/6:[----] [-C] 'block: Make blockdev-reopen stable API'
>>>
>>> Alberto Garcia (6):
>>>     block: Add bdrv_reopen_queue_free()
>>>     block: Allow changing bs->file on reopen
>>>     iotests: Test replacing files with x-blockdev-reopen
>>>     block: Support multiple reopening with x-blockdev-reopen
>>>     iotests: Test reopening multiple devices at the same time
>>>     block: Make blockdev-reopen stable API
>>>
>>>    qapi/block-core.json       |  24 ++---
>>>    include/block/block.h      |   2 +
>>>    block.c                    | 135 ++++++++++++++++----------
>>>    blockdev.c                 |  78 +++++++++------
>>>    tests/qemu-iotests/155     |   9 +-
>>>    tests/qemu-iotests/165     |   4 +-
>>>    tests/qemu-iotests/245     | 190 +++++++++++++++++++++++++++++++++----
>>>    tests/qemu-iotests/245.out |  11 ++-
>>>    tests/qemu-iotests/248     |   4 +-
>>>    tests/qemu-iotests/248.out |   2 +-
>>>    tests/qemu-iotests/296     |  11 ++-
>>>    tests/qemu-iotests/298     |   4 +-
>>>    12 files changed, 351 insertions(+), 123 deletions(-)
>>>
>>
>>
>> -- 
>> Best regards,
>> Vladimir
>>
> 


-- 
Best regards,
Vladimir

