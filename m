Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF21D9D51
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 18:56:42 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb5Xl-0007K2-Uf
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 12:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jb5Vi-0004pN-SU; Tue, 19 May 2020 12:54:34 -0400
Received: from mail-am6eur05on2121.outbound.protection.outlook.com
 ([40.107.22.121]:11617 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jb5Vg-0007Xf-Dq; Tue, 19 May 2020 12:54:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKgZjtXGuN3TPLbO5bOo3i7gSIdaMVZSfUvKpg5usnLPlcNNO36weF9Jj1N7CJ9QapgJteGaTmbvUUq6f57tnGGQ1quEozUgRSK38bGPI9itWYPegaEDsbfQA+07KTfbbEjuXycJlj2siANWeareTsGhPbJxsfyHC23pB+bGcZ9bYGn7q4KNarrk3oTwcjRIznirHDs7DfaDufYj+/ewysZ+7RkzW7nM+p+rBcXAkTXDjjRzrDN37XmwpLPhx2MvOFT/b075RVPmQCuukZWN6kyAYdS7fHbf0CBnNgegAX/ljqmyLgveS1Touc/NJJOUKjZdaHHZs8D8H8eUAElrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbDem7c1wgD4uCtC4MnTUwOorcMGqza6rG9421CkclM=;
 b=D6usyasrS2lqAsVp93gbiHno0EjF8cCUIbZOIcA0tbBrGyGWjSmYMKMSmISvqKEHX94hqRBURRAPE4cYoMvz3zBGBTsHR1fGxzmSrbutzQCGEYfbfc40xkpmdCOjkIOcmpAxCyMZIiqXdTQG4bA70O07tCsQRzKWwBac/+bkfFWSgq9yLCEWEH8k9LE61uHxZNe3EK9U+LyKyE9owRNnvMOUyN5IYcTeYkz6hn69E3LwD+TcBO+DsHcsYfVFQX6p1MzsmRQmvEjRfIjQi9KsJzMgAoECpt+cn2mdjpzKB18/rmquharG4ZYvhfr+hr3Us2QsWbUrAS+VqEfZ4gsxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbDem7c1wgD4uCtC4MnTUwOorcMGqza6rG9421CkclM=;
 b=tCo6MJDAXaecC1YKslJeP2uEVlAWDNBEvv19cBJq2YGk29k5NdqetOE0tsciNJh7UkMtO2XNfyFHX2X8iW4SC28710x97+315beXC7FAI4GmbIXoZccxbvxRTuDILviNRzgMzjPhPIqeHazO0PpEjfRI5UMxLGoUMeeGXKLYES0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5367.eurprd08.prod.outlook.com (2603:10a6:20b:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Tue, 19 May
 2020 16:54:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::acfa:5:88c8:b7b9]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::acfa:5:88c8:b7b9%4]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 16:54:29 +0000
Subject: Re: [PATCH v2 5/9] block/io: expand in_flight inc/dec section: simple
 cases
To: Kevin Wolf <kwolf@redhat.com>
References: <20200427143907.5710-1-vsementsov@virtuozzo.com>
 <20200427143907.5710-6-vsementsov@virtuozzo.com>
 <efc8e783-0541-6b95-1356-71ccc823cad2@virtuozzo.com>
 <20200519105241.GH7652@linux.fritz.box>
 <d1908d96-4950-22be-45c0-86750f5780c6@virtuozzo.com>
 <20200519111648.GK7652@linux.fritz.box>
 <f3f34ee7-836e-c329-a1f3-65586faec85f@virtuozzo.com>
 <88c250c4-af4f-ef6a-3bf3-4e8f8643c32c@virtuozzo.com>
 <20200519143316.GO7652@linux.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3c1dda3a-b551-b5e0-3592-fa90ed854bbc@virtuozzo.com>
Date: Tue, 19 May 2020 19:54:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200519143316.GO7652@linux.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.178) by
 AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Tue, 19 May 2020 16:54:28 +0000
X-Originating-IP: [185.215.60.178]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c5d4f34-9b77-4ab8-c165-08d7fc154b95
X-MS-TrafficTypeDiagnostic: AM7PR08MB5367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5367EEEBE29590B2825906E6C1B90@AM7PR08MB5367.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRxj56/JTvIxqAFEofXV9MNk92AFkvSHB3kKrxp13y7sCPL6V5g82DJ0A0pyMBn0W8STyHAUpahyojuEwrwKxkyT+8NULmjmGLNwVmhPHOe+gri3Adc+94/wU9EyBDNQh2nWjKgPT+R8kybYSjQc8/AUr+qrfBebp/qgmRE42xnMLDNbNYL6SOydGZBVZMSgbDbehGSDWJWmjXgmJOwgY4ksbNASl31zVpGusC6VuOC6S4kMOq4YRMuYLvYORgYTmdehnMAh2RXZuzxwkBR+yJ9szg9lDMPOr72mcvyt+6HW7Zo/MxeM5AOS6fvUnZE0iW4u1n2x2ZoKH2EwehsT9sCuoRG1FqYe9WGA5+MwU891uHA3B8h5Eq/XpJLDF+C+002BN52QsoemqLSZo/ArhL7b1DKk+arLnYQES56MRMjMFvohxxEr1Te73bRlUhpte3bOEsYkeQWrKXnfrVxgnYdYIekpGpjjwLkTAlb+rc7FA7npz/ts60pVS9OG6IS3aFPo0KZ2ShMka7iH4YyhFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(107886003)(4326008)(2616005)(6916009)(16576012)(26005)(52116002)(186003)(16526019)(956004)(5660300002)(66476007)(8936002)(36756003)(6486002)(66946007)(66556008)(2906002)(31696002)(86362001)(8676002)(498600001)(31686004)(60764002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: vZHzGUfyApLY+iKgTwyWv430l3IK+9Tm3UFkwusBN7okwXMLYSCbIe3bZjQtA4YRcGKzgG2vLgf7Axt4xJSVvjy+Rg1OXNsgqwNZm87JO6THSqyzi1Mm7qCPln+RCeuTf7X/tnjSlYC+pfuRjosxT72J0SIJ7RtNl3lQ0+bUO790OaQuZXkt/HhaKo9fEFA6A+Bkrl71aF/Z1Q83pTanr0sHMKpWjbQP5I0DS2emYviDv9ys/BMAUWix65hiNg6jTPzJO7AElN0nE+Gr3QFPFQxPMoOXOSoi9oZwHS6otChTbGWRbgu6uucpwUwTzzbkyJaCI8DQPVOZj7/8AegLwDMy8II/ws8dZQ9vw0j2zScKH7ddOLF9gvSpdxQY5uh9xS1Ijz1jpOFG8My50vS/NkLXfnwfQhbSu9yVGph0k/T8sPy/aT6lSO9iEYo27aabeFZ5vWpVK7VHrJXwzWBp9QlYdfi+rZN5o2v7zPfZTW+T21IR47pCIF6bWpApWW6d
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5d4f34-9b77-4ab8-c165-08d7fc154b95
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 16:54:28.9599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niq73u9I/9ncIm4OywFa8Rvmn7ZN5gHL8sxwqI11D8wf3x3kjdACXRSXJLEYN3jDt8EWvmVUOISxbLBVdM6Jpl7+abUJYXR+CeOCjbsisz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5367
Received-SPF: pass client-ip=40.107.22.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 12:54:30
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.05.2020 17:33, Kevin Wolf wrote:
> Am 19.05.2020 um 16:01 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 19.05.2020 14:25, Vladimir Sementsov-Ogievskiy wrote:
>>> 19.05.2020 14:16, Kevin Wolf wrote:
>>>> Am 19.05.2020 um 13:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>> 19.05.2020 13:52, Kevin Wolf wrote:
>>>>>> Am 06.05.2020 um 09:02 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>> 27.04.2020 17:39, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>> It's safer to expand in_flight request to start before enter to
>>>>>>>> coroutine in synchronous wrappers, due to the following (theoretical)
>>>>>>>> problem:
>>>>>>>>
>>>>>>>> Consider write.
>>>>>>>> It's possible, that qemu_coroutine_enter only schedules execution,
>>>>>>>> assume such case.
>>>>>>>>
>>>>>>>> Then we may possibly have the following:
>>>>>>>>
>>>>>>>> 1. Somehow check that we are not in drained section in outer code.
>>>>>>>>
>>>>>>>> 2. Call bdrv_pwritev(), assuming that it will increase in_flight, which
>>>>>>>> will protect us from starting drained section.
>>>>>>>>
>>>>>>>> 3. It calls bdrv_prwv_co() -> bdrv_coroutine_enter() (not yet increased
>>>>>>>> in_flight).
>>>>>>>>
>>>>>>>> 4. Assume coroutine not yet actually entered, only scheduled, and we go
>>>>>>>> to some code, which starts drained section (as in_flight is zero).
>>>>>>>>
>>>>>>>> 5. Scheduled coroutine starts, and blindly increases in_flight, and we
>>>>>>>> are in drained section with in_flight request.
>>>>>>>>
>>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>>>
>>>>>>> Very interesting: this patch breaks test-replication. It hangs:
>>>>>>>
>>>>>>> (gdb) thr a a bt
>>>>>>>
>>>>>>> Thread 2 (Thread 0x7eff256cd700 (LWP 2843)):
>>>>>>> #0Â  0x00007eff2f5fd1fd in syscall () from /lib64/libc.so.6
>>>>>>> #1Â  0x000055af9a9a4f11 in qemu_futex_wait (f=0x55af9aa6f758 <rcu_call_ready_event>, val=4294967295) at /work/src/qemu/up-expand-bdrv-in_flight-bounds/include/qemu/futex.h:29
>>>>>>> #2Â  0x000055af9a9a50d5 in qemu_event_wait (ev=0x55af9aa6f758 <rcu_call_ready_event>) at util/qemu-thread-posix.c:459
>>>>>>> #3Â  0x000055af9a9bd20d in call_rcu_thread (opaque=0x0) at util/rcu.c:260
>>>>>>> #4Â  0x000055af9a9a5288 in qemu_thread_start (args=0x55af9c4f1b80) at util/qemu-thread-posix.c:519
>>>>>>> #5Â  0x00007eff2f6d44c0 in start_thread () from /lib64/libpthread.so.0
>>>>>>> #6Â  0x00007eff2f602553 in clone () from /lib64/libc.so.6
>>>>>>>
>>>>>>> Thread 1 (Thread 0x7eff25820a80 (LWP 2842)):
>>>>>>> #0Â  0x00007eff2f5f7bd6 in ppoll () from /lib64/libc.so.6
>>>>>>> #1Â  0x000055af9a99e405 in qemu_poll_ns (fds=0x55af9c52a830, nfds=1, timeout=-1) at util/qemu-timer.c:335
>>>>>>> #2Â  0x000055af9a9a1cab in fdmon_poll_wait (ctx=0x55af9c526890, ready_list=0x7ffc73e8c5d0, timeout=-1) at util/fdmon-poll.c:79
>>>>>>> #3Â  0x000055af9a9a160c in aio_poll (ctx=0x55af9c526890, blocking=true) at util/aio-posix.c:600
>>>>>>> #4Â  0x000055af9a8f0bb0 in bdrv_do_drained_begin (bs=0x55af9c52a8d0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:429
>>>>>>> #5Â  0x000055af9a8f0c95 in bdrv_drained_begin (bs=0x55af9c52a8d0) at block/io.c:435
>>>>>>> #6Â  0x000055af9a8dc6a8 in blk_drain (blk=0x55af9c542c10) at block/block-backend.c:1681
>>>>>>> #7Â  0x000055af9a8da0b6 in blk_unref (blk=0x55af9c542c10) at block/block-backend.c:473
>>>>>>> #8Â  0x000055af9a8eb5e7 in mirror_exit_common (job=0x55af9c6c45c0) at block/mirror.c:667
>>>>>>> #9Â  0x000055af9a8eb9c1 in mirror_prepare (job=0x55af9c6c45c0) at block/mirror.c:765
>>>>>>> #10 0x000055af9a87cd65 in job_prepare (job=0x55af9c6c45c0) at job.c:781
>>>>>>> #11 0x000055af9a87b62a in job_txn_apply (job=0x55af9c6c45c0, fn=0x55af9a87cd28 <job_prepare>) at job.c:158
>>>>>>> #12 0x000055af9a87cdee in job_do_finalize (job=0x55af9c6c45c0) at job.c:798
>>>>>>> #13 0x000055af9a87cfb5 in job_completed_txn_success (job=0x55af9c6c45c0) at job.c:852
>>>>>>> #14 0x000055af9a87d055 in job_completed (job=0x55af9c6c45c0) at job.c:865
>>>>>>> #15 0x000055af9a87d0a8 in job_exit (opaque=0x55af9c6c45c0) at job.c:885
>>>>>>> #16 0x000055af9a99b981 in aio_bh_call (bh=0x55af9c547440) at util/async.c:136
>>>>>>> #17 0x000055af9a99ba8b in aio_bh_poll (ctx=0x55af9c526890) at util/async.c:164
>>>>>>> #18 0x000055af9a9a17ff in aio_poll (ctx=0x55af9c526890, blocking=true) at util/aio-posix.c:650
>>>>>>> #19 0x000055af9a8f7011 in bdrv_flush (bs=0x55af9c53b900) at block/io.c:3019
>>>>>>> #20 0x000055af9a874351 in bdrv_close (bs=0x55af9c53b900) at block.c:4252
>>>>>>> #21 0x000055af9a874ca3 in bdrv_delete (bs=0x55af9c53b900) at block.c:4498
>>>>>>> #22 0x000055af9a877862 in bdrv_unref (bs=0x55af9c53b900) at block.c:5866
>>>>>>> #23 0x000055af9a870837 in bdrv_root_unref_child (child=0x55af9c6c4430) at block.c:2684
>>>>>>> #24 0x000055af9a8da9a2 in blk_remove_bs (blk=0x55af9c547bd0) at block/block-backend.c:803
>>>>>>> #25 0x000055af9a8d9e54 in blk_delete (blk=0x55af9c547bd0) at block/block-backend.c:422
>>>>>>> #26 0x000055af9a8da0f8 in blk_unref (blk=0x55af9c547bd0) at block/block-backend.c:477
>>>>>>> #27 0x000055af9a86a6f1 in teardown_secondary () at tests/test-replication.c:392
>>>>>>> #28 0x000055af9a86aac1 in test_secondary_stop () at tests/test-replication.c:490
>>>>>>> #29 0x00007eff2fd7df7e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>>>>> #30 0x00007eff2fd7dd24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>>>>> #31 0x00007eff2fd7dd24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>>>>> #32 0x00007eff2fd7e46a in g_test_run_suite () from /lib64/libglib-2.0.so.0
>>>>>>> #33 0x00007eff2fd7e485 in g_test_run () from /lib64/libglib-2.0.so.0
>>>>>>> #34 0x000055af9a86b19c in main (argc=1, argv=0x7ffc73e8d088) at tests/test-replication.c:645
>>>>>>>
>>>>>>>
>>>>>>> (gdb) p ((BlockBackend *)0x55af9c547bd0)->in_flight
>>>>>>> $5 = 0
>>>>>>> (gdb) p ((BlockBackend *)0x55af9c542c10)->in_flight
>>>>>>> $6 = 0
>>>>>>> (gdb) p ((BlockDriverState *)0x55af9c53b900)->in_flight
>>>>>>> $7 = 1
>>>>>>> (gdb) p ((BlockDriverState *)0x55af9c52a8d0)->in_flight
>>>>>>> $8 = 0
>>>>>>> (gdb) fr 20
>>>>>>> #20 0x000055af9a874351 in bdrv_close (bs=0x55af9c53b900) at block.c:4252
>>>>>>> 4252Â Â Â Â Â Â Â  bdrv_flush(bs);
>>>>>>> (gdb) p bs->node_name
>>>>>>> $9 = "#block5317", '\000' <repeats 21 times>
>>>>>>> (gdb) p bs->drv
>>>>>>> $10 = (BlockDriver *) 0x55af9aa63c40 <bdrv_replication>
>>>>>>> (gdb) p bs->in_flight
>>>>>>> $11 = 1
>>>>>>> (gdb) p bs->tracked_requests
>>>>>>> $12 = {lh_first = 0x0}
>>>>>>>
>>>>>>>
>>>>>>> So, we entered bdrv_flush at frame 19, and increased in_flight. Then
>>>>>>> we go to aio_poll and to nested event loop, and we never return to
>>>>>>> decrease in_flight field.
>>>>>>>
>>>>>>> Hmm. I'm afraid, I don't know what to do with that. Kevin, could you
>>>>>>> take a look? And could similar thing happen with blk layer, because of
>>>>>>> you recent similar patch?
>>>>>>
>>>>>> Hmm... You mean blk_prw(), right? Looks like it could have the same
>>>>>> problem, indeed.
>>>>>>
>>>>>> Maybe we need to move the blk/bdrv_dec_in_flight to inside the coroutine
>>>>>> (probably to the place where we currently have aio_wait_kick(), which
>>>>>> would already be built in for bdrv_dec_in_flight). This is the last
>>>>>> thing the coroutine does, so presumably it will still be late enough.
>>>>>>
>>>>>
>>>>> But moving "inc" into coroutine is dangerous too, as we discussed that
>>>>> coroutine_enter may only schedule the coroutine, and something may
>>>>> call drain before actual "inc".
>>>>
>>>> No, I mean moving only the dec, not inc. So inc before entering the
>>>> coroutine (outside of it), and dec at the end, but still inside the
>>>> coroutine.
>>>>
>>>
>>> Hmm. it probably make sense. Ha, I hastened to answer on
>>> cover-letter that this all to be dropped. Ok, I'll give it a roll
>>> and check your idea, thanks!
>>
>> Checked this helps. I think, I'd try to rebase it onto your "[RFC
>> PATCH 1/3] block: Factor out bdrv_run_co()"
> 
> I haven't received much feedback for that series yet. But I assume
> patch 1 won't be contentious, so that makes sense to me.
> 


I still have a question.

OK, what we achieve with this series?

We guarantee, that if someone call e.g. bdrv_pwrite, than it increases in_flight immediately, and drained section will not start until request finished. But what guarantees that user will not call bdrv_pwrite already in drained section? blk layer guarantees it: it has blk_wait_while_drained() guard. But what about all other users?

Some users just do nested request on child node: this should be safe anyway, as drained section will not start until parent request finishes..

blk users are protected by blk_wait_while_drained() and by blk->in_flight

And other users are most probably broken anyway and this series doesn't fix them.

So, I again doubt that we need this series..

-- 
Best regards,
Vladimir

