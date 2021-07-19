Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EA3CD056
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:15:33 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PN7-0004R7-0P
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5PLD-0003Co-Uh; Mon, 19 Jul 2021 05:13:35 -0400
Received: from mail-eopbgr30125.outbound.protection.outlook.com
 ([40.107.3.125]:43780 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5PLB-0007OF-F3; Mon, 19 Jul 2021 05:13:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHySFqzGoAwPfAhnHc3Up8HuKXPXwoaQLlLH8CbFJ4VvlrzZZmwfQZT/zk/JyRgbRs/SYNazIjMC14g5/TaTpyfoD3b5hz1a8l5EK05hmDPvdy4ol0bPVMW1ZTnN41XVwgZdNWyY2xzdyhLvePA35gFox6gzbT/BizFNTX4LtR4cDJEa2wCmrEf5WIFkgpE52q015j5bfXCye0wkoeGh7m0g1K4y1GgMvDslcblKL+c8a4M1VAFf1pPwbLXyCQtjETHOpU55BR6iFgSbi/OxnRNGNxKkiaMmmxEVeC7mhuWNXoWA3ZNDvaAoWavaFbLIDZrLComjvCziBrNi8VyT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl6Hr17ykcg6/P56C3rlkFd6jsVKwTtZ1Mlzu89UakA=;
 b=WeOl4GIIXBQCVp3WBRs+KiXKJq4qpVkqqbQLqtyShbDTee5hsW3fYRHStHN8eXa67y613MIDB8qtNdAuvGFMt1rej+igyAYqcIcoFRV23R1LEjzBApLmV7DN1qABX5JTFixwLGCx7AY+LoYfALaoi8c5qEHgeAlYRucFD/ASwsaU4Jw86yaoFy+RYxQeUVGHCMoaWK83ioHV8sYwmghUsKlMFTOpOZSFKRVqbZlUb36aWTDQ5ZCpN7UyVqxpiOvpvYlGXUL/AYFP1ezVnIQUUk29x0kEhEyPE/6PkGApJ4fGQ932/zu0vp11H66lHnBg5iTCzLCWNem7V1zVl5Q8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl6Hr17ykcg6/P56C3rlkFd6jsVKwTtZ1Mlzu89UakA=;
 b=d0MDclW7mQnFu4VWR5NATDX+PBgOsvKzRjF7xPOd+d70RFrE51z0HWjmri3e9oFCuBVE9+tdCkyUN3OJEEhFZgxZpj9mJRTmV/eqq0xdNz+gl+Y5H37yw/+/OhfPJP0ezmfj0QATJq5qd37iThWBRE6smzA6Wb/U0RDBJGlpqyA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 19 Jul
 2021 09:13:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 09:13:29 +0000
Subject: Re: [PATCH v5 3/5] block/nbd: refactor nbd_recv_coroutines_wake_all()
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
 <20210714165916.102363-4-vsementsov@virtuozzo.com>
 <20210716212513.x5dtfslhgtyufx6x@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3a3c7b13-d0b1-2c47-7f26-3776e5894847@virtuozzo.com>
Date: Mon, 19 Jul 2021 12:13:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210716212513.x5dtfslhgtyufx6x@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR3P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 09:13:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42cc9304-a3b8-41e9-4524-08d94a9578ee
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-Microsoft-Antispam-PRVS: <AM6PR08MB46003D0321E4F3A247ADDF1DC1E19@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ygt6riYrCWWXBKySSJcRvJCyKNmKHcvZN59LcRa0o41+I6PQtAS7/dwfEINRBxE4A6C5zk62C/7X5nTyi4Fvn2hX/nhTxgnFhMGXUpxDX4Gie7eyi3jDXSTh2UT/kYCuxWxiHIDPtI9XF5nek7fTTNcC5wdIUvpL1vRQj8ajuWZSOwbLhbWs4hD2pkH9ftCpVdOg8QhCFmnF8xIJ9E9gCBVT/kFNzrBvXKVImVC/t0volsbrYxYyRQ++z7ymIcPexSsS7Tkg5UCbuk1PjOMoxl3HSeGO+GqgDUvBwze0G9x7c8qzLF0VA3M42cpECWjuC6UGDiKSG6iWLhld0ShjN14/No8mMhZhV5ydj9yJgO3f2zO+dh0B/ONqYjsV33ZlQaMqPSTIsWAWebq4kZNdvEH/8bapb4fFtnNM/Pf0i3k2mj6CfIoLjoBzAfG8iwJdeLRBX5RrqvZvFIq1qAY2ag8I6j6I1NxwoVmjpycE32ixihoT3Xo8boP+4UGPgzMtCRNgat+vBfYSaMqJCZXAm6JEBZWUyJy17o6Q5/PqCjcuvaKndt6DkXk2lehcWInFC9dzlUAyIIxtMYH9quIy/V2Ii2i6ur/aRDU6RBUFPWoV9FRb7s1Bd5EgVGrTvrS4cd0n8obOu+RTZAkrmXp6ZzTg0eNOyqEQ80QUTyhtxyODX1CfP05E2lStqywwq5Hv47jR/jnU3lwP/8MvjPwMknHEiAsfUJ4vEiTQ5Jx8Dlfnt1VPj35maDdQ11QFAvnW13eObJnuiI6IdSdtq3fu4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(376002)(136003)(366004)(478600001)(36756003)(5660300002)(16576012)(86362001)(38350700002)(38100700002)(186003)(83380400001)(26005)(6916009)(2616005)(31686004)(52116002)(2906002)(66476007)(31696002)(956004)(4326008)(66946007)(8676002)(316002)(66556008)(8936002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWYzTjczNks3cDB1VTFmVG8waUhyWkFWZTNKbmVhTmhyNERtUVV4R0QvUDgv?=
 =?utf-8?B?czVUZjhoZnUrVDV5cGZxNzJvMStsWnJESWRjeUoyandlaDZVaERHeUJQZGVz?=
 =?utf-8?B?MmYxMXlNSmtjNnFaL2ZIc2NyWi9Db1phNzR2Unl1ZzlpdmYwakpPUWdhMitM?=
 =?utf-8?B?NEZpVGJTRW9qSllXZit2S1FBa1N0STNDNkVCYWNocDYrU2Y5RGRPbWJTVEJK?=
 =?utf-8?B?L2Q2ZFJxNms0VkJUZ3N2Y2xTNzNwN2g3UGZKVWpVcW9wcW1sZFE0akpPNDF3?=
 =?utf-8?B?K0x4WmpEUjFRakFHYVhkUGNCMGlSZU5rNUQxZWFYVUg3SWVZaXFDMkdERDhk?=
 =?utf-8?B?WkM4NHEvZEdXVzJMeEtDU3FTdVBGb1RkcytFUkFlNFJzRk51TUZSL2dLRndx?=
 =?utf-8?B?ckhuemM4aUZRRkdiUE9LSll5T2lGRS9sc2hGT1lRbkk5bjJHVXI4Ym5idkND?=
 =?utf-8?B?OEtSRUFjcFJndFZtUTE5bzdaazZyRjlGSzZFWWxVSXgyVlI1YXZNSTRYb3M2?=
 =?utf-8?B?aG5NTzRzMXN1KzJ3MHgxVW1NUG1oeFVoZkdwSzlJQVFlVjcrN3Q3Rko0WVJ2?=
 =?utf-8?B?MnRSbHpSdFpBZTU1RXB4L3pyVFVwVWloZktZSHZWRzlOam5HOStnNVZZcXVZ?=
 =?utf-8?B?TDBsNFpZUFh1YVBRMTRRd08wUVF6bFh5Y01BRExHdncvVlFGVnVscWNscnQr?=
 =?utf-8?B?bEdpaFFZa2FqR2JJNUR3ZDEvSExsZVVJVkM4NCtLcHFnR3J3dU1UQXRnZVg3?=
 =?utf-8?B?TjZHTlhpNTFXeXNpV1ZlVE9KV0VtTi8wVThGTXNCWVV4QTViOHdjVldyd1pp?=
 =?utf-8?B?alR5VzNVYy9ZQ3NBMjlEMmUxeFBkSGlVc3ovWjJ2VkxyTlBaYkdrMHlJeWor?=
 =?utf-8?B?SEFONktJdjVaN2IvL0g2NkpDOXlvbU5DOFhYUVFubzd5THlMWUIrZklUbVJQ?=
 =?utf-8?B?NHVPYkVaenJCcjk1MzdXeGtrSUgwUEp0TTY2QisvYVczT29lQ0dGZTVoOUhx?=
 =?utf-8?B?UWlMOUhkUGxYSi82Z3lOZVQ0b0hFWElUVkh3SWx3TzBzZWthNHlJSzNZcVEx?=
 =?utf-8?B?TG9MU2ttWXdSYkxBMTdSQk13MWRwbk1RYjdBRnhCVWt4MTJ5QUZGYXNhdkxi?=
 =?utf-8?B?cHZBYUdJbVlqc0RjcWxhWGNvYXFWMDc3bGtSYitla08zZWpyNDZRcE9XN1Q1?=
 =?utf-8?B?blIwaTB1b2FJajljYUdxZ0UxR0h4L0RjTnAxcDQxZ0NTbmI4RHpFL2c0aXZ1?=
 =?utf-8?B?WkpiZHhlM2dRTXhhaHpQYkR3L2F6YWZZWVlDK2pSRnNGVmhORWs1UlE2amRj?=
 =?utf-8?B?OVNXQ1UrWnlVd09OR2o2a1grU2EyZ0RUQXUzejBiakFuRXVQYmp5WEdMSG4z?=
 =?utf-8?B?RURTK0w0NE5NbjZITCtITjNhWDhRRVBmWlRwS0FnWE5naGlMbC8rVStlM21h?=
 =?utf-8?B?bGNTZGIwWFNoMVZndkg1bUxTVzBmVXVLUCt2N0RVTzZvcisrK1Bla2N4elJG?=
 =?utf-8?B?Mlk2eTY2RXNBTTExSklrbHFOaTN1NmxVSHdOY1gxbUxma2YrVXZGWTVQVFc3?=
 =?utf-8?B?cmUxemVzMDIxL0RCVi9pUjlDU2lFSHE3Q2k2NTNYd045bWdycmRzaGpLZG9O?=
 =?utf-8?B?Wk90b1VGcll1R08zNkIwU2txMVhCL1lzUjlBMEpVSjJBcUhWTUZmZGFjUDhE?=
 =?utf-8?B?anFqZ0lCa3d4Umd1L1dlOWVpNXo4Q1dvWDNPN0wvRkhIQVRENyt1c1NPbGVq?=
 =?utf-8?Q?RAerXQ+35084PiuxqWBtmw7MEG1h9VFs1MRN9Md?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cc9304-a3b8-41e9-4524-08d94a9578ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 09:13:29.1160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvGftg4ne7Uh108Q+kED5M3a5iV0BQq4mPcKfmUoQGUrnny+wgddCOMMJRtF3tOQfVhMzsLyWO+TIWLrQAPmlCh3maEkDAUaVIHFxg3YEBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.3.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.07, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.07.2021 00:25, Eric Blake wrote:
> On Wed, Jul 14, 2021 at 07:59:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Split out nbd_recv_coroutine_wake(), as it will be used in separate.
> 
> s/in separate/separately/
> 
>> Also add a possibility to wake only first found sleeping coroutine.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 24 ++++++++++++++++--------
>>   1 file changed, 16 insertions(+), 8 deletions(-)
>>
> 
>> +
>> +static void nbd_recv_coroutines_wake_all(BDRVNBDState *s, bool only_one)
> 
> Without reading docs (including the parameter name), I would have guessed:
> 
> wake_all(s, true) - wakes all
> wake_all(s, false) - wakes one
> 
> but your code does:
> 
> wake_all(s, true) - wakes one
> wake_all(s, false) - wakes all
> 
> Maybe that means this function and/or its parameter is now misnamed.
> Having the _all in the name with true to NOT be all is what threw me.
> Would the following be any better:
> 
> nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
> 
> where
> 
> wake(s, true) - wakes all
> wake(s, false) - wakes one
> 
> and where your helper function needs to be renamed, and callers
> updated to match those semantics?
> 

No objections, will do)

Actually in a previous commit message I promise to rename the function, but actually don't do it.

>>   {
>>       int i;
>>   
>>       for (i = 0; i < MAX_NBD_REQUESTS; i++) {
>> -        NBDClientRequest *req = &s->requests[i];
>> -
>> -        if (req->coroutine && req->receiving) {
>> -            req->receiving = false;
>> -            aio_co_wake(req->coroutine);
>> +        if (nbd_recv_coroutine_wake(&s->requests[i]) && only_one) {
>> +            return;
> 
> But while I'm not sold on the naming, the change in logic (to be able
> to wake any one waiter but not the whole list) looks useful for future
> patches.
> 


-- 
Best regards,
Vladimir

