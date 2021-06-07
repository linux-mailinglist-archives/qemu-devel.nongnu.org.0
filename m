Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B195639D4D4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:17:46 +0200 (CEST)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8a1-0002CN-QU
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq8Yv-0001Mc-Jd; Mon, 07 Jun 2021 02:16:37 -0400
Received: from mail-eopbgr130118.outbound.protection.outlook.com
 ([40.107.13.118]:59873 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq8Yr-000878-Db; Mon, 07 Jun 2021 02:16:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijjukF7dAE2Hh34maptPRe4m1/VHbIctBIWj3pDoSUzkHSVlchhQSHa51ir1gdJ8xPwZ9NsfxCdVn5kui+Q4bJjT24ME4x89BrnWxvVusLc/Ll9C/UrSJ4F4OGit9zjQTIYjXYusPxVDDuC34tV+5IwswadlGqMm/JhdM3EYuybUV+AuXcPwZ2WsmedIHj3Gdl1aK2RaaU8R53DsvEUUf7vGEwz8BzoDcwQpDmYVdwlPTJVX0fzxzRFUe6Mwnl6fP94FYTMgTlPgbu5e10vhRGIoAKUK2/R9Za87QuY4vSb2HCKhs7QGQrkgutNKjERv9xrZ7WuXeT0rZzo0mugsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cnrrDMaLu26PoA4hNTy35X5TKiLtJ+f3nFK1qIn5EQ=;
 b=SHvv2C5cfXQ+VycaoNuG7ZrO7Caxubi5XIRx4xLf71YKnzghCf2eTvoU2wCqQJB/lmXiyZtcgh2lb0+qwqT2ZUZCCujSYJ7g6tvpR7fgkM768L99ZvbHt5+et3sDETuIaBmT6ScjjB3Z1e67loYQc7eWN7qE3hdoRuUa5f0WX4WlP4fFnoty1heoSP4po3z8Jj9U/o8ZNyyynPyGVeuxWVvP5lxfBP9MkGc0gN0vi6yCwsqxayT6ieNPGm1KV9YKGYrrQSBBdXVPUgB2FeOQScehFFF5yjMsAS9ubGbj51TS3VvM+bceAJcvmVHwO7WBwrjAEVmOx+H15wx3WLgIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cnrrDMaLu26PoA4hNTy35X5TKiLtJ+f3nFK1qIn5EQ=;
 b=jovupimZ3GNfzBqPGNOOT761ycfDydQbeXy2ftcy3imn3/ab01Re91tCTI3i4hPN8f7Lahe1NAyN0OAG+bWrfQ0vch4CoF+oWwrQ7n9sVOXwQOVyrbirmAV+dhimRTrwSvMLxZv+hSddgOZyZym4SSV63ToPsAHFRLZvyx2TWoQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 06:16:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 06:16:30 +0000
Subject: Re: [PATCH v3 1/7] file-posix: fix max_iov for /dev/sg devices
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-2-pbonzini@redhat.com>
 <6426cb5d-9b3e-ca6b-35d4-c4cd5488c448@virtuozzo.com>
Message-ID: <88380860-3888-b4a3-c367-9da9aea1886f@virtuozzo.com>
Date: Mon, 7 Jun 2021 09:16:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6426cb5d-9b3e-ca6b-35d4-c4cd5488c448@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: AM9P193CA0016.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 AM9P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Mon, 7 Jun 2021 06:16:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 944e65e2-c614-4975-5098-08d9297bca24
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59902D770FC34FC070594ACEC1389@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCFwdV/wHfsrMRcJqueWu2cSaoA9a1XmqB+otWDvXzlV9Ww1DcrH8IopSAylK6Yk2J29baP7VomegXrZ1NA1fLFACiAEd6ahJarGTROKCTTNbiIttZAaa4UfcWxJCv5CHOFs30J6mj8XDtAu3GNhceZK0XNJ3LDkNNN/wIo+CVs/46RUsxebEq2x8g4yOZxqGg0ijAnnrJAsf9lhBSyIEwBSHD/DI6cnmSvuLix+gXsQVNGOQwqG4XaqVm0CMlrpS9vceFnIkWanKDEX3reriVaqeDmCGc3dDocw7Nueelp3Q/j9e0KMBGwl32FNuZBSor4ucgYokR4z1serJQYIubuKxXZh8PaH4qJVHioTryuC/gS5L5WdOVWVRo0EuemJLSeY+yX0IoZ1zT1NNWAPPHDdE/ROt9UTcZQ2/YmDlQMnnPKFy7zg+Ismk0DFvA7k0tlkNInarhXvRo1QfT712xwm3AKMpOOSurZSRfQpLRVyzaos8gqGcdC0YSSJU4XQfn96IG5SeDIc0jeAs4XvM29ljakiFzEoIrvqfa6tbxoBZnx7yDyT0sJsEenDZImThr/9QiyTc6XaDcTJWG9+3DGXa9B24QzmYHSYDo1EIAjcMJwy/IDauBz1v0Ty9RepYTjejZi4/IfKQNdS2aQZO9hS2xtt52RwNBS9TuzufA/frVb4Ic60yVKgg24lG2KZAqdcrHMi+pi1jHKFohXW//ORvanQ+qkTbWjGyhfvHjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(2906002)(5660300002)(36756003)(26005)(186003)(16526019)(956004)(31686004)(16576012)(6486002)(86362001)(8676002)(83380400001)(31696002)(52116002)(4326008)(66946007)(66476007)(66556008)(38350700002)(38100700002)(478600001)(8936002)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVFsRWYxMytROG14SXpRMDMxZlRFNGtoL2luRmVsYWFSUnpuVUJDUlduM0xW?=
 =?utf-8?B?MVZjNndjNjJKUGJPcHZUNmNTQlJFWlBVYTZCTXRQTld1S3NtZk40c0RsZUdN?=
 =?utf-8?B?MisremF0cjdGNWhvLzRGM3ZPaDVjQVlRKzRlNDFqQ1FkL2RvUWpZanZLUFV1?=
 =?utf-8?B?enp0dkVFK0cyZmRtUHlraUVmQjNmSTdWOEVlYU80TVduN0FLaXBrZTFEbFVn?=
 =?utf-8?B?TGxuN0dFbi9pR1FjOWU2cWJnUjlIWldHWXJ4Q2dUbHZVMEU2L0JDbHc2OWQ5?=
 =?utf-8?B?dDVNUENCU2tuSVBxa3NoNklNYU95VHF4MEU1N2dmemgvTGVOQjcrSkEwc25C?=
 =?utf-8?B?aUVuY3J5bm05a25zaDlBRXJsQktPaGlNYjhqYzlhVzRMb2RFTi9FamdSRi9l?=
 =?utf-8?B?NVFScTJLbVd4YWIyRWpBMEl5MnNBUnVWQjRlUy94VGtOelFCZXBIc3I1Sm43?=
 =?utf-8?B?NlFMZFc4Mm5PbHEza2I2a1FEWmd0c3RYeVVGNmp3d0pqcWk1SWJEdEVEMEJE?=
 =?utf-8?B?ZkNHUnBITzdSUmoyTFViNTlNZjJRUEl4V0tqYWRLbjdxV1F1MUJJSFBvVCt0?=
 =?utf-8?B?OUVQREpKL0w2V21nbWhYTktiQmdGczFsbkRnT3lNRUo3dHNRQjJ6eE1mVFpW?=
 =?utf-8?B?ZDh5WTlDTm4rcXMzMjJXa2dpSTJYN1FtSnVDbjZObXN3bzZQTFZCMzgvdkJN?=
 =?utf-8?B?QWhsaFVEYWZBc0U2NkdsTGhCUDZySTl1N0s1aXB0cWFWaDZvZmxsWWVFb25p?=
 =?utf-8?B?YTJ3d3dPSW82akVrTmVIdFVQbGxBc2ZlNnE2TVQ0NzYzbm4xZ2Nha2MwaFBU?=
 =?utf-8?B?QTBsU1VaZWNYNzFaempkOFJwcW9YcDdqMjRFTXFvalY0RzBScmVxUHNPT3c4?=
 =?utf-8?B?b1FuL3Qyd3dld1Rsbktvb0p0SEFHWXoxaUhueG40WTZacW9SMndXaVpLWis2?=
 =?utf-8?B?M1YzM1lXN2NZWnE5c3JTbU8zTGkxMm9ST21LU2c1Y3hnb3pkSEsza1pJSzFV?=
 =?utf-8?B?K29CcE9pQ2VOWkgwSHJONm5lRmEwdFBNN3VscSszaUNFLzBYaGVYNFg3a2Zt?=
 =?utf-8?B?Z1padkY3aVpWRWYxYVhOc1A2Wm5wZTdWSHV3NnVhdUVuVWpKdmFMY2lyV25m?=
 =?utf-8?B?dGs2RGhuZTcvdlNaNEh5TlNqdnZYOTBzOHhxK0lzK1ZZTDYxcUpLZjlyL1R2?=
 =?utf-8?B?dVRLZmVTbURDS2hseU5Td3B5Rkg3VzRrcEkxWFAxOTlLOEl5c3lYK3ZEUGk0?=
 =?utf-8?B?UXdoQ2d5Z3ZVZjJPb3gyNTc2MTlxODVaelNQTzlwMHpOV2FzekJWaHJWVGcv?=
 =?utf-8?B?TzFod2hqcmxOSGxoc3UzcGZNNWFxeVlLRzBGV2p4aXdyZ09NUWVtL3MrS25K?=
 =?utf-8?B?WU9lUDN6UHMwVmdpWEJ5NHIyMUkyK2xxSzM2UzNtRkdqY1ZFVCtvQThnT1BT?=
 =?utf-8?B?YW5QOHVDaVV5ai91TVRTRkluaFk5Ujc4MVVqTiswZFZVR1BSWXozTHVuVm05?=
 =?utf-8?B?WlZBVTlVUlMzL1VHdnl4Q3BHSWhXN3VrV2l0MkFjUGljdHFhU3k1VEVTNWFQ?=
 =?utf-8?B?bWltYm5nL0FiaVlEZnZTZ0FQd1N5VytYSlc0Z0IyS3piOXhDTnIwK1FKK1Ju?=
 =?utf-8?B?NU85TVpOV28xRlFiMW9JdnJxQmZZRThzN3kxUjNBc1ZvNkVoaG5rNDN0T3cx?=
 =?utf-8?B?YXBJeUtWVGU4aGcyVWhpbW5nQzMwYjhUUys3TUc2eDdtM1FoTUlVL2h2QnlF?=
 =?utf-8?Q?LT0cswY81cLRw6KOXCpFFDOlO28yA8LFz9DZFky?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944e65e2-c614-4975-5098-08d9297bca24
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 06:16:30.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eLOHSv6tbT2Uemk1jvy7h/9lu4bxryRUQmqin7AdBuVLhxIhNmrPgI/nS/v/pSYiyaS8rOKpYWIkKg2C131TPBj2LWS4Gtvjp+ypppjyto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.13.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

07.06.2021 08:39, Vladimir Sementsov-Ogievskiy wrote:
> 03.06.2021 16:37, Paolo Bonzini wrote:
>> Even though it was only called for devices that have bs->sg set (which
>> must be character devices),
>> sg_get_max_segments looked at /sys/dev/block which only works for
>> block devices.
>>
>> On Linux the sg driver has its own way to provide the maximum number of
>> iovecs in a scatter/gather list.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/file-posix.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index f37dfc10b3..58db526cc2 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>>           goto out;
>>       }
>> +    if (S_ISCHR(st->st_mode)) {
>> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
>> +            return ret;
> 
> So, this is a new most-probable path for char-dev, yes?
> 
> Is it better do it at start of the function to avoid extra fstat() ?

Haha, stupid question, sorry my morning sleepy eyes. fstat is used for outer if condition.

> 
>> +        }
>> +        return -EIO;
>> +    }
>> +
>> +    if (!S_ISBLK(st->st_mode)) {
>> +        return -ENOTSUP;
>> +    }
>> +
>>       sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
>>                                   major(st.st_rdev), minor(st.st_rdev));
>>       sysfd = open(sysfspath, O_RDONLY);
>>
> 
> 


-- 
Best regards,
Vladimir

