Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7D2F4CCE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:12:18 +0100 (CET)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgsj-00078n-9u
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzgj2-0000ud-P0; Wed, 13 Jan 2021 09:02:16 -0500
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:22199 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzgj0-0001rj-G0; Wed, 13 Jan 2021 09:02:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N11zT+k8al7PDjyHFfwZQ12HVBh0bQSOulob8iTGLMn2SQPpWINRXIvRf/972IT6DiFlINaAjnP+JKnMTrc3dhFHUe3kKoTr8sX8Z8SPPa/My8cAQgz1AbloOD4CjqeRXyRCKnzMYvkJcWiwRp7CEDASDkofdCPT/t0MQVArYHnEumyubvCpe9Brh/CrpXd9GpDnbAg51bsxepiKMVdfar6FQ2oVkOkKgUQ39so/q+PePwphw1hZI0sPWv9cGWkQDUIdPcYvFALgMOHN0xdDw2SqxOIG5cmvUgkNKMqUfXVS7XJV6o8twA1Eq19b/QgESCe68o2fGFzZPS2gxsW6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlhAGNNlp89g5iMxbN/dC/BsMGDpYR+HhDb+GnOYNc8=;
 b=GnXnomf6qEU9SZs33bPRA/tSBBgm/TrEdCrZlIzJPyjf+XegiPStQsPMnFQ02Fa3MAKOojdf/3ONwKQFYc9evyAhr/BQX+lfaRrRd7SdE4wpci4zmUnM/EgkrDJOLlCNniLw1Oubj+87ztmZDt/0tVCdIMndaeE67GNk2gF0dW35tRsWpumavKpCLvUhCzTcemUPpHe07W1zriCrwOmToDp6wakprDrKnSoucP6+j8hBJuilHQ6Zq1/d8owAO1yO2BnzylYU5joamrmid1CDhmlx8YFPm+xVUyvSwwR5QTLrdzTonfOot9hRC7jf4rhYtc3IopocY2y6p2ZwdjUEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlhAGNNlp89g5iMxbN/dC/BsMGDpYR+HhDb+GnOYNc8=;
 b=T2LMYcGR4fcnawzQiGDUejtiTFavFppUQqdOui+z7xCXIYZy6+fvSTK8AJeadHyBPKRTV6ix1jC6Xtu9DSvDelJm2Ny0siLglghUJBzwD/1hPKDEZMAm0XfEtECmHzVUgyFWXIU6sipSzmVjMP3XiXTa3ynBS5Y+pLMKB1EVv5U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 14:02:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 14:02:11 +0000
Subject: Re: iotest 129
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <6e00b90e-5c95-8b02-23c2-0acfe9862f6a@redhat.com>
 <4474f468-dc8c-8e53-2d46-183823918863@virtuozzo.com>
 <22115060-4169-d979-3750-8a527914564a@redhat.com>
 <b53c13cf-be73-815b-e7b1-42897375ddaf@virtuozzo.com>
Message-ID: <5d80983b-79ef-4d81-45a3-b00666c09c26@virtuozzo.com>
Date: Wed, 13 Jan 2021 17:02:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <b53c13cf-be73-815b-e7b1-42897375ddaf@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Wed, 13 Jan 2021 14:02:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfc59861-c0f9-4a8c-7740-08d8b7cbd2e1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376227A922B814555DFBD7DC1A90@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HOGneIcPOLAZuEigP6SEngLWkHtnP42dJKb4CHdVQB8h2DznS0LEXXLP6377p7FVqmXF4t1HN5MImUJ5Fss0nuzyQHjD+WOaK7OwRj8CbJWu6hEUOmtxJwA48jtqlH+LvEnG9Zz3hCm2mRKX14aJac5UMVmb1MoCRC+T8KTPuHRy9SYt1ygKBQ8tdAOEnuKK4JViRLZJKYp5K5jFR8daSkqRtxIa7Snh2KRNuhbsKezpzVApwoT3bmypnjuXAWMt0BgghLPW41gB0+ETPJE4Lojg/FeXK9tNwauAPwK28oiTtTx9W7djDBQWGo6uCvz90hltHXEUAgC5xuBv+Xw4Kuy3wo7jGXg5sxesP5kgYofdxmhuaBZtbhQWo8ArHgk7HwAC6bBSIc+EWKydYVAlXaMTqNm3UiohO/2awdNK0KDX2pLWsLKYtmx06abD7QQcOy1RLSI1IjaOZMfNv/e0ibNXfTnuazSsbjf0Ta7ObQ8Uf7Vfz7IOuBwzJ/OaCpjUUQuj69v9rHTs2qUTBVSau9fJ8CCmU6joWRplKPO0/rzOy+RAIq0ZRod7urvPN5+n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39840400004)(396003)(366004)(2906002)(16576012)(66476007)(956004)(316002)(54906003)(8676002)(36756003)(66556008)(86362001)(478600001)(2616005)(83380400001)(8936002)(52116002)(31696002)(186003)(16526019)(66946007)(6486002)(7116003)(31686004)(53546011)(4326008)(110136005)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGlUYkFFWXlmNjdrbzcyWUtIWVJoelVic2cxOFkrL0tJRk80TkdBdjlGMGVo?=
 =?utf-8?B?VGVLNndVMXgwS2wwU202QVZJOXArQVhnY2NPcVZEdGFCcXZ1eW5YY3VPNWs3?=
 =?utf-8?B?eCt6dnZBOEZwdkJBcXhidG9PTVdzQk5JUjEzMEJaMFVFd1JMODJlRDh6RW9Z?=
 =?utf-8?B?V2xKN2lDTWVRNFlhbUhkQ2V2Z1FuYmhldXFBdWpOS00ycmpsVm9nZUxqVmw0?=
 =?utf-8?B?aUpUQ2owZG0wZHQvU2wvckFwK1JiNEI5MFplRkRHRHZFckdmcVIzWHBsSUhU?=
 =?utf-8?B?MzJ0ejVMSm1qWFlaT05nOWVCL0dZdlZ4QXo0M0JjeDVURkM2NUp4ZExXZnor?=
 =?utf-8?B?cTJpNGhSYXpzMlhHcE8zSkU4NFpCd2RHdVhvSGI2VjF6YXVILzF2REVEYk9V?=
 =?utf-8?B?dDhMR2dVZXFJMDA3aG1oYXM1SnVnZzZrT3N3Qkd0dThrMEhhOWdRY245eGdy?=
 =?utf-8?B?R0hhTzVOMnV6Tyt5bS9vdUM1SkxxMkdQRDVVOXVLWi96ZW5TU1Y4VkFyK1Jv?=
 =?utf-8?B?czM2Y09xNGJpSVJZRE02dnJXTHdLeUVNajB4NW5rRUY0RXI4VUJDUmtsaU1X?=
 =?utf-8?B?VThsLzZ3Mkh0L2I1eGxoekVhcnpPMlFhdDIxR3NEL0pwa0E5a2l0S1Z1L1Bj?=
 =?utf-8?B?MkFZRWtmOVZXUXM2bWpnZzNWYXJFM1QzREtmZjNIZ1l3TnR5RjdSUmxJN0lr?=
 =?utf-8?B?UFVLL3U0S0tWZi83RThjbjVidXc2OS95NGRuaWFqSG1OZHp2aGh2YjZkQ2tr?=
 =?utf-8?B?aG5YZy9KcElJOHJ2cUJBUXV4RWhHcTdiKzUyY1p4Z29RclpYNjdxUGFFVitW?=
 =?utf-8?B?UjBjNlpSSlc2UjlKVGRveExOcDMxOVIxSVVHaTN4OEdXN2ZlbVM2TkNNZSta?=
 =?utf-8?B?aXlVeUZJZnU4aUJxK01yUkxhaG1zdjgvd3VFa251a0llUklTSEdaY0o2dkJ5?=
 =?utf-8?B?RWN3MGtRL1hNZlZ2eFpzS0lTaVhTTUt0a1F6V3c2SHNjTi9MRm5aUjc1K2ps?=
 =?utf-8?B?YXRqTVpPSkFMN2x5TFFXSDk0bjNNUkZURFF2akxUWE9MY2VvVkpXRlR3UnEy?=
 =?utf-8?B?enRuTDNQNlV1bnQ3S2Juajd0ZkgyV1U2cGtFK0ExbWhhTXcwQXBzRzNUSTZP?=
 =?utf-8?B?Szk4OTdCeEZxYVByVk1NbU9Ycm5hRDZHanBvbEp2bk85dzI4QnJneS96eTF6?=
 =?utf-8?B?L1ZPS0kxZHF6RmZtNUtGanBJd2ZlUkozcWozTmpWNk80SWp6ZjlGbGxiV2hz?=
 =?utf-8?B?THhKZzBQcEFxV05Wd09vZGh4U05DRXFQa0Z3RDdOa2ovbGlXL1pSbHk5ZGVF?=
 =?utf-8?Q?3NKRwUI4TouX/MCGDWKtj0xQeIfLF6toWX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 14:02:11.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc59861-c0f9-4a8c-7740-08d8b7cbd2e1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1NlM7CMKEwB4agL56f8HtRB25rWKi5+QVdvGLaNOxORVZFB1rid70FakFKq/8ifso8Bsh8SBi50mf0WFxntjPZcvC7jdVLXVfKGJ77hM/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BIGNUM_EMAILS=0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 16:59, Vladimir Sementsov-Ogievskiy wrote:
> 13.01.2021 14:05, Max Reitz wrote:
>> On 13.01.21 10:53, Vladimir Sementsov-Ogievskiy wrote:
>>> 12.01.2021 20:44, Max Reitz wrote:
>>>> Hi,
>>>>
>>>> tl;dr: I have some troubles debugging what’s wrong with iotest 129. It wants to check that 'stop' does not drain a block job, but to me it seems like that’s exactly what’s happening with the mirror job.
>>>>
>>>>
>>>> For quite some time, I’ve had 129 disabled in my test branch because it fails all the time for me.  Now it came up again in Vladimir’s async backup series, and so I tried my hands at debugging it once again.
>>>>
>>>> Recap: 129 writes 128M to some image, then runs a block job from there (while the source drive is supposedly throttled), then issues a stop command, and checks that the job is not drained.  I.e., still running.
>>>>
>>>> (It checks the “running” state via @busy, which is probably wrong; it should verify that @state == 'running' (which wasn’t available back in 2015), but that’s not really why I’m writing this mail.)
>>>>
>>>> Like the last time I tried
>>>> (https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html) I can see that block jobs completely ignore BB throttling: If you apply the attachment show-progress.patch, you’ll probably see some progress made while the test waits for five seconds.  (Here, on tmpfs, mirror and commit get to READY, and backup completes.)
>>>>
>>>> OK, so now that block jobs don’t completely break with filters, you can instead use a filter node on the source (as I tried in the patch referenced above).  And to fully fix the test, we’d also replace the @busy == True check by @status == 'running'.  That’s the attachment filter-node-show-progress.patch.
>>>>
>>>> If I apply that, I can see that now there actually is some throttling. After the time.sleep(5), mirror and commit get to exactly 1 MB, and backup gets to 1.0625 MB.  Good.
>>>>
>>>> However, after the stop is issued, backup stays at 1.2 MB (good), but mirror and commit progress obviously without throttling to 30, 40, 50 MB, whatever.  So it appears to me they are drained by the stop. I.e., precisely what the iotest is trying to prove not to happen.
>>>
>>> I don't follow.. Increasing of progress means that jobs are drained?
>>
>> I don’t know.  It does mean that throttling is ignored for a bit, though.  I could imagine that’s because something is being drained.
>>
>>>> I plan to continue investigating, but I just wanted to send this mail to see whether perhaps someone has an idea on what’s going on.
>>>>
>>>> (My main problem is that bisecting this is hard.  AFAIK the throttling applied in master:129 has been broken ever since blockdev throttling was moved to the BB.  Even without the “Deal with filters” series, you can use at least mirror sync=full from filter nodes, so I tried to use filter-node-show-progress.patch for just test_drive_mirror(), but that only works back until fe4f0614ef9e361d (or rather 0f12264e7a4145 if you prefer not to get a SIGABRT).  Before that commit, it hangs.)
>>>>
>>>> Max
>>>
>>>
>>> Hmm, in show-progress.patch you call "stop" the second time.. It's a mistake I think..
>>
>> Ah, oops.  Yes, not sure, how that part got in (some rebasing mistake).
>>
>> Still, removing those three duplicated lines (stop + query-block-jobs) yields the same result.  (I mean, what else is to be expected; BB throttling does nothing, so even before the first stop, the jobs are READY/COMPLETED.)
>>
>>> Also, on current master x-bps-total I can find only in iotests.. Where is it defined o_O? If I change it to be bps-total, it fails.. Strange.
>>
>> block/throttle-groups.c defines x- as a THROTTLE_OPT_PREFIX... :/
>>
>>> I've run the test with your patch with throttling filter (and a bit more logging).. Interesting. It looks like throttling just don't work noramlly after stop.. I see that mirror does one 1M request, and it obviously overflow throttle limit, so during your next 5 seconds it does nothing (and we see progress of 1M). But immediately after "stop" command all 16 read requests pending for throttling goes, and then a lot more read requests (hmm, exactly 31) are issued and not throttled at all (but goes through throttle node). And then new 16 requests are issued and throttled. I've looked at throttle_group_co_io_limits_intercept() and I just don't understand how it works)
>>
>> Hm.  So you’re saying only the current set of requests are drained, but no new ones are generated?
> 
> hmm, what's not generated? New requests are generated.. But some requests are not throttled and I don't understand why.
> 
>>
>> Perhaps 129 was introduced to check that block jobs don’t run to completion on 'stop'.  The commit before it (e62303a437af72141^) makes block jobs pause in bdrv_drain_all(), so they don’t generate more requests.  Perhaps we just need to ensure that mirror won’t generate many concurrent requests.
> 
> But bdrv_drain_all() is not a "drain_begin", so after it jobs are resumed and new requests may be generated..
> 
>>
>> Indeed.  Setting buf_size=65536 leads to offset reaching 64k after the sleep, and then 128k after the stop.  That makes sense now.
>>
>> Now there’s only one problem: That doesn’t work with commit…
>>
>> Then again, the commit 129 uses is an active commit, i.e. just mirror. It looks like we can translate it into a non-active commit, though then we still have no control over the buffer size.  But then it only progresses to 2.5 MB, which I guess is fine...
>>
>> I suppose with your async backup series, we should then limit max-workers and max-chunk to the minimum for the backup job?
>>
> 
> I have a patch in the series which sets the backup speed to 1k and it is enough.
> 
> Let me summarize what I think about that all:
> 
> Jobs should continue running and do progress after "stop". So, test should check exactly this behavior. We also want to check that "stop" doesn't force jobs to finish synchronously (but we just doesn't have a synchronous finialization of job mechanism, so I think it's not possible anyway).
> 
> Test check that jobs are "busy" after stop, which is bad idea as we know. I think, test should do the following:
> 
> 1. check that after stop progress is less than maximum (which guarantees both that job was not finished prior to "stop", and that "stop" doesn't force synchronous finalization)
> 1.5 check also that job is in "running" state (not cancelled, for exmaple)
> 2. then, drop any throttling
> 3. wait for correct job finish
> 
> So we check success scenario, which is the main thing. We can still just cancel the job instead of [2,3], like test is already do.

Hmm, cancelling is bad idea, as in this way we can miss the bug, when job after "stop" is in running state but does no progress forever. So, if we want to cancel, we at least should check progress twice to be sure that job continues to work.

> 
> Than about throttling:
> 
> Why we need it? Because without throttling jobs may do their work too fast, and just finish prior to "stop" command.
> 
> And we see, that block_set_io_throttle definied throttling doesn't work good with block-jobs. Throttling filter works bad as well.
> 
> We can use "speed" of jobs instead, to throttle exactly block-jobs. And it must work. I'm sure at least, that for current (synchronous) backup, it's "speed" works good, and after my series "speed" in new async backup is smart enough and works good too. So, there is my patch "[PATCH v3 13/25] iotests: 129: prepare for backup over block-copy".
> 
> So, I can suggest to drop any throttling from the test (as it's not test of throttling) and debug and test throttling in separate. And instead, just use "speed" parameter for all the jobs (like a lot of other tests do).
> 


-- 
Best regards,
Vladimir

