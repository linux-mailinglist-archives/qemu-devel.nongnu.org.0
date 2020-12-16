Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139202DC015
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 13:20:31 +0100 (CET)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpVn9-0006FI-1P
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 07:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpVl8-0005ix-TX; Wed, 16 Dec 2020 07:18:22 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:28177 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpVl4-0001a9-Kx; Wed, 16 Dec 2020 07:18:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsb2LAzfAcq90eypei0cm/P02wwTkIn8bhvYS8NeKXGmyJEVmQtTInvy3sEUbninJsOgM/UedBVhN2sL2Z22V4W/F7eVrQb4eQYbORt05kSBcV0XG3kS++VvAfV1aDriHvACzq/8C1LIQ0AlBPfs77LJIS0BSHutUavZdcmDGWMGmvNw3bNUyqFPvQ/0eFXD/Z6ccJUvrjUd34+cmNN0YZUDmFiho1CgjcTfkC5bcug0aGPP3EWZHtvyZoOVgn8O/9tDHrB8Q5jZix8cWQwEiuYUA5PDkKfAi9AD1fPNwjd0d6I5IW5uKzUkZXNxi+JqTxL10pKeA/hAibbg2PAtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b48RweCtI+7RTzqfgaRtofiHB+dNw7siESID/DqQc2E=;
 b=YY/oayWXpChIGSi3vu9SYUqAP/0BmkvIpsZ9W6azEO0YLPHKx+KAKXkZ8JNdrFLbZLyH3QSFCW3JHpjRsl0+31A7bAUP7mIbUbZZMJkNmVMSl5PzUseg1NZTJoR54h23e8Od1GnHCVZXX7Hg8AU49dPfkolIC7Vp2rwC8xKuLl4kdpwTqq4ZO+jZ0z9KjCXf/Es3ziD6INLF0LjEh5vV4AM2WbNXaFdO/fJoaeO+xXUaxxIuxrAGhy2v3S5auUZ64JoChl8+UzBpxza4o0nJz8J8/pRHbHfgK8Fu+ysOSzJfjMh7z2jRPLsXwOA5ZqahO6ZZi93uspvbfsMeHp5l7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b48RweCtI+7RTzqfgaRtofiHB+dNw7siESID/DqQc2E=;
 b=POFq36ZSBimMbEdjqsTKtvJXOvh936KCXurg1b425PGQDq2gG+HCCiZ2Pd1dqZR0R0b2GkY4XwiEoVEPX3xcd/1G6sla7zti1MMzYoTbng7MZEkK3nKxl9M9Zy6jbze3iJCP5/WFyaxRxQ4cRz9PRjsUUSF4SA4U01IaDfXs/Ng=
Authentication-Results: smartx.com; dkim=none (message not signed)
 header.d=none;smartx.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3159.eurprd08.prod.outlook.com (2603:10a6:209:46::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 12:03:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 12:03:10 +0000
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
 <05c96a12-b343-fec4-4060-7110bb0850d0@virtuozzo.com>
 <20201216094959.GC189795@redhat.com>
 <e719c240-a232-c017-73e9-45dbcda619fd@virtuozzo.com>
 <20201216104122.GE189795@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b87bc8a5-0635-aa2e-9aa1-4b5c67ca65e5@virtuozzo.com>
Date: Wed, 16 Dec 2020 15:03:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201216104122.GE189795@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:208:ac::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.9 via Frontend Transport; Wed, 16 Dec 2020 12:03:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d8dcfef-e153-47cb-3ee0-08d8a1ba8ea2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3159:
X-Microsoft-Antispam-PRVS: <AM6PR08MB315906E0F3876BFD10B864DBC1C50@AM6PR08MB3159.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ot2wxEmtxOJUSn7KzkcpiK/xzzDfiJznBsoAnBkwOrznpUjYhgqVwh5XA2E4eADpOzj6OVH68Wr97hhiaFE/woQ5GLj2a2f+v8jUaBAIxqLrMNQliFw5f6NdjzGZ9yvAZxKVuFAm4Rsp7iP/hp4msfLkPwSBkncwrfvfu8rXK5zXGiIWvqiOdEbMn6PKnqcxKIcwpaYKSJLU/F0zV+QH5hpTeT7gFspwQ1vNbqZwCSTKcNjGSAzTlQA4ezbJdQN9BmM8vPBch1ek6NqWfybzXZAXS8otJUDGYv4H9hdVAx7FvBGoVJxNg8+jwVrbJ1UwZC9nROt4LQMg24PQngIsEFAFCdtdZVKHXQsh209uPyvXCSUGssj+7gErENiaIkiX9UmwL0/UiVGcgubp0CZX3M+TnebrmWT0vuBxLeM5i6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39840400004)(396003)(376002)(186003)(52116002)(478600001)(8936002)(4326008)(86362001)(8676002)(83380400001)(6916009)(26005)(54906003)(2906002)(31686004)(316002)(36756003)(66946007)(6486002)(16526019)(16576012)(5660300002)(31696002)(956004)(2616005)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djBGb1JiNlhkWWVIYTl3ZDJsWWsrUFJhR3Q2Mjk3cjlCc05LUU5meDhDNDFZ?=
 =?utf-8?B?MnVkWHV0eUE3Z0o4WUFuREZabVE3S2xpL2FadThlVmRVL0tickZaMk1NL1lh?=
 =?utf-8?B?R0RZK3dXdVN4RFllbGJCR2ZvZDVIak5uOGRJTUU0Rm9wZVZWTXZPM1dLS3pq?=
 =?utf-8?B?MlJ4Skx2bW1XRkFGcHBKdkJrQnZXUFhxR0ZlYnVrQkkrNWdweS9nZG92TUZu?=
 =?utf-8?B?ZnFyQUN4YmxlWEVVNjNIOGIvUnBPTEtWczBXejFxKzgwWUVlSE93TW44NCtr?=
 =?utf-8?B?ejFPRG05L21KNitYNlh5QTEzN05Kekx5aFRKcEZDeXZkTElOV08rcmlsSUpX?=
 =?utf-8?B?WHhZRW1pdUErbGJ1cWxIWklQaGlOOWtZTnJzWWlZaDZKSkNTNjBDVWdKT2ds?=
 =?utf-8?B?WkY4ZUJwWHhIQytkZ1NhNDc2YVpnVThnMDNuOU9pa1BJc05GTmY4dzRnWnQv?=
 =?utf-8?B?bzlHdDJDaUwvQ0NqYkpEdnVyT0pqYWV5R3BDWWZnVlNmQW5WNnc5S2JvMVpV?=
 =?utf-8?B?eTVmelRVaVd0OXdFenkvNE4wdnNSTjhjRFBuTS9QQ3N1ZUNwOWlaN1BSSWw1?=
 =?utf-8?B?YnZpQXpqd0s1S0l5aVNvM2pVY3JZamZaK0xLT0FOaWd1OHloVVd1dVFGMTQ2?=
 =?utf-8?B?TGFodjdrMEZ0N2V2MGFDUFc2YXpTaURjMG9XaytlSkdTY0d3dy94RDRKWm5H?=
 =?utf-8?B?c2xndVp6aHJqV1EyVEZuazJvbS9JdVdRWTN1dEVBRkdUT1BXcmZDOFBkRHRN?=
 =?utf-8?B?RmxPcno3aGZxSUNmYVpVOW5ZZHlRVzRLaFozM0wvTlFUU3ZhQ1NDUWJKeWtl?=
 =?utf-8?B?bnhwRDhSbXJnTFh1bWJlQ2kwR3VUVEo3MzZNRjhJbUhqaEtOak9jclZLSStK?=
 =?utf-8?B?NDFNQ0JXREM3WmRYaytnREdUQlNxT29FZ2tOcWNHSnlmNXVXcjBKdUw3VE1G?=
 =?utf-8?B?N3RZQXl1NjJ4MEZJNXk3R0F6aVNscnBpMmpVVllsTGFnU0FkN05ZdDZHV2xZ?=
 =?utf-8?B?Mkp5Z20zczlCVkJEb01TS2Z4RGkvQU0yTXcrUG51czYzcHh4SDFoQTNVMUt3?=
 =?utf-8?B?Z3IvRmJ6a29BRldzV1FQd2JyelR1b3FrQzFkVUo5elcrVEJxaVJadm1GY2ZT?=
 =?utf-8?B?RmFqeDU3d3ZHQjcxbHJPR3Ftb2lBY0JWSHduTVE4bVlscjdaZ2p0TC8vTjdi?=
 =?utf-8?B?RVhnRWdTZHFuWW8vQ1dJUCtlNm14R3d2YzZJQ2VpNUEweURCcXhidzg5L0k1?=
 =?utf-8?B?QnA4bWZiU3R0TXRtWUZwOWlEcnh5Q2Z6cDJrNU9YKzFOUUxDcEZCZWh2VWZI?=
 =?utf-8?Q?TlOMPH7PM59nh7y7hmjuswnpz3bmdGb167?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 12:03:10.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8dcfef-e153-47cb-3ee0-08d8a1ba8ea2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVOrlcUL4Bl4oDTXTl7slKpoBGwUWbeByj6IjN30qH6XTiG+wTaTacog28JRhfl1w1Jg8dXyuEkpo0sybIJ7rlmzF0Jhy8ZsePpDqnHQ/3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3159
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.12.2020 13:41, Daniel P. Berrangé wrote:
> On Wed, Dec 16, 2020 at 01:25:36PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 16.12.2020 12:49, Daniel P. Berrangé wrote:
>>> On Wed, Dec 16, 2020 at 11:22:38AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> 15.12.2020 13:53, Li Feng wrote:
>>>>> This patch addresses this issue:
>>>>> When accessing a volume on an NFS filesystem without supporting the file lock,
>>>>> tools, like qemu-img, will complain "Failed to lock byte 100".
>>>>>
>>>>> In the original code, the qemu_has_ofd_lock will test the lock on the
>>>>> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
>>>>> which depends on the underlay filesystem.
>>>>>
>>>>> In this patch, add a new 'qemu_has_file_lock' to detect whether the
>>>>> file supports the file lock. And disable the lock when the underlay file
>>>>> system doesn't support locks.
>>>>>
>>>>> Signed-off-by: Li Feng <fengli@smartx.com>
>>>>> ---
>>>>> v5: simplify the code.
>>>>> v4: use the fd as the qemu_has_file_lock argument.
>>>>> v3: don't call the qemu_has_ofd_lock, use a new function instead.
>>>>> v2: remove the refactoring.
>>>>> ---
>>>>>     block/file-posix.c   | 61 +++++++++++++++++++++++---------------------
>>>>>     include/qemu/osdep.h |  1 +
>>>>>     util/osdep.c         | 14 ++++++++++
>>>>>     3 files changed, 47 insertions(+), 29 deletions(-)
>>>>>
>>>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>>>> index 806764f7e3..4e00111031 100644
>>>>> --- a/block/file-posix.c
>>>>> +++ b/block/file-posix.c
>>>>> @@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>>>>>         s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
>>>>>     #endif
>>>>> +    s->open_flags = open_flags;
>>>>> +    raw_parse_flags(bdrv_flags, &s->open_flags, false);
>>>>> +
>>>>> +    s->fd = -1;
>>>>> +    fd = qemu_open(filename, s->open_flags, errp);
>>>>> +    ret = fd < 0 ? -errno : 0;
>>>>> +
>>>>> +    if (ret < 0) {
>>>>> +        if (ret == -EROFS) {
>>>>> +            ret = -EACCES;
>>>>> +        }
>>>>> +        goto fail;
>>>>> +    }
>>>>> +    s->fd = fd;
>>>>> +
>>>>>         locking = qapi_enum_parse(&OnOffAuto_lookup,
>>>>>                                   qemu_opt_get(opts, "locking"),
>>>>>                                   ON_OFF_AUTO_AUTO, &local_err);
>>>>> @@ -606,7 +621,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>>>>>             s->use_lock = false;
>>>>>             break;
>>>>
>>>> In case of ON_OFF_AUTO_ON: we do check qemu_has_ofd_lock() and print a warning.
>>>>
>>>> Probably we can also check new qemu_has_file_lock() and just do early fail, not waiting for permissions update..
>>>>
>>>>>         case ON_OFF_AUTO_AUTO:
>>>>> -        s->use_lock = qemu_has_ofd_lock();
>>>>> +        s->use_lock = qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();
>>>>>             break;
>>>>>         default:
>>>>>             abort();
>>>>> @@ -625,22 +640,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>>>>>         s->drop_cache = qemu_opt_get_bool(opts, "drop-cache", true);
>>>>>         s->check_cache_dropped = qemu_opt_get_bool(opts, "x-check-cache-dropped",
>>>>>                                                    false);
>>>>> -
>>>>> -    s->open_flags = open_flags;
>>>>> -    raw_parse_flags(bdrv_flags, &s->open_flags, false);
>>>>> -
>>>>> -    s->fd = -1;
>>>>> -    fd = qemu_open(filename, s->open_flags, errp);
>>>>> -    ret = fd < 0 ? -errno : 0;
>>>>> -
>>>>> -    if (ret < 0) {
>>>>> -        if (ret == -EROFS) {
>>>>> -            ret = -EACCES;
>>>>> -        }
>>>>> -        goto fail;
>>>>> -    }
>>>>> -    s->fd = fd;
>>>>> -
>>>>>         /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
>>>>>         if (s->open_flags & O_RDWR) {
>>>>>             ret = check_hdev_writable(s->fd);
>>>>> @@ -2388,6 +2387,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>>>>>         int fd;
>>>>>         uint64_t perm, shared;
>>>>>         int result = 0;
>>>>> +    bool use_lock;
>>>>>         /* Validate options and set default values */
>>>>>         assert(options->driver == BLOCKDEV_DRIVER_FILE);
>>>>> @@ -2428,19 +2428,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>>>>>         perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
>>>>>         shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
>>>>> -    /* Step one: Take locks */
>>>>> -    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
>>>>> -    if (result < 0) {
>>>>> -        goto out_close;
>>>>> -    }
>>>>> +    use_lock = qemu_has_file_lock(fd);
>>>>> +    if (use_lock) {
>>>>> +        /* Step one: Take locks */
>>>>> +        result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
>>>>> +        if (result < 0) {
>>>>> +            goto out_close;
>>>>> +        }
>>>>> -    /* Step two: Check that nobody else has taken conflicting locks */
>>>>> -    result = raw_check_lock_bytes(fd, perm, shared, errp);
>>>>> -    if (result < 0) {
>>>>> -        error_append_hint(errp,
>>>>> -                          "Is another process using the image [%s]?\n",
>>>>> -                          file_opts->filename);
>>>>> -        goto out_unlock;
>>>>> +        /* Step two: Check that nobody else has taken conflicting locks */
>>>>> +        result = raw_check_lock_bytes(fd, perm, shared, errp);
>>>>> +        if (result < 0) {
>>>>> +            error_append_hint(errp,
>>>>> +                              "Is another process using the image [%s]?\n",
>>>>> +                              file_opts->filename);
>>>>> +            goto out_unlock;
>>>>> +        }
>>>>>         }
>>>>
>>>> In raw_co_create(), I think you should also update code under "out_unlock:", we shouldn't
>>>> call raw_apply_lock_bytes(), when use_lock is false.
>>>>
>>>>
>>>> Another thing is call to raw_apply_lock_bytes() in raw_check_perm(). Looks like a preexisting bug. Why don't we check for s->use_lock?
>>>>
>>>>>         /* Clear the file by truncating it to 0 */
>>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>>>> index f9ec8c84e9..c7587be99d 100644
>>>>> --- a/include/qemu/osdep.h
>>>>> +++ b/include/qemu/osdep.h
>>>>> @@ -513,6 +513,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
>>>>>     int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>>>>>     int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
>>>>>     bool qemu_has_ofd_lock(void);
>>>>> +bool qemu_has_file_lock(int fd);
>>>>>     #endif
>>>>>     #if defined(__HAIKU__) && defined(__i386__)
>>>>> diff --git a/util/osdep.c b/util/osdep.c
>>>>> index 66d01b9160..dee1f076da 100644
>>>>> --- a/util/osdep.c
>>>>> +++ b/util/osdep.c
>>>>> @@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
>>>>>         }
>>>>>     }
>>>>> +bool qemu_has_file_lock(int fd)
>>>>> +{
>>>>> +    int ret;
>>>>> +    struct flock fl = {
>>>>> +        .l_whence = SEEK_SET,
>>>>> +        .l_start  = 0,
>>>>> +        .l_len    = 0,
>>>>> +        .l_type   = F_WRLCK,
>>>>> +    };
>>>>> +
>>>>> +    ret = fcntl(fd, F_GETLK, &fl);
>>>>
>>>> I think we need
>>>>
>>>>       qemu_probe_lock_ops();
>>>>       ret = fcntl(fd, fcntl_op_getlk, &fl);
>>>>
>>>> pattern instead, like in qemu_lock_fd_test(). Otherwise, what we check may differ with what we are going to use.
>>>
>>> No, we explicitly do *not* want that.  This function is *only*
>>> about checking whether traditional fcntl locks work or not on
>>> this specific file handle.
>>
>> Hmm, than may be name the function qemu_has_posix_lock(), to stress that fact? All other qemu*lock*(fd) API functions do rely on fcnt_op_getlk/fcntl_op_setlk and work with lock type determined by qemu_probe_lock_ops().
>>
>>>
>>> Support for OFD locks is a separate check, and its result
>>> applies system wide.
>>>
>>
>> Still, I don't follow, why should we check posix lock, when we are
>> going to use ofd locks. What if OFD locks are supported by kernel,
>> but specific file-system supports posix lock, but not ofd? Than
>> we'll fail the same way as described in commit message and the
>> patch doesn't help. Or what I miss?
> 
> That's not a scenario that exists. OFD locks are implemented by the
> kernel in the generic VFS layer, so apply to all filesystems. The
> filesystems merely have to support traditiaonl fcntl locks, and then
> they get OFD for free.
> 
> IOW, there are two separate questions the code needs answers to
> 
>   1. Does this specific filesystem support locking
>   2. Does the operating system support OFD locking
> 
> The problem in the commit message is because the original code was asking
> question 2 only and geting the correct answer that the OS supports OFD.
> The image was stored on a filesystem, however, that does not support fnctl
> locks at all and hence locking failed. This failure would happen regardless
> of whether OFD or traditional fcntl locks were used.
> 
> The problem is solved by also asking the first question before enabling
> use of locks.
> 

OK, thanks for explanation. Sorry, I was not attentive to previous versions, but I remember that something about this was discussed, so probably you explain this thing not the first time;( Hmm, still, what's wrong with checking fs by OFD lock trying? It will fail anyway? Or, it will NOT fail, because OFD knows that there is no locks, and will not ask filesystem driver and we will fail only later, when try to set the lock? If so, it worth a comment in file-posix.c.. As it looks like a design flaw of OFD locks.


-- 
Best regards,
Vladimir

