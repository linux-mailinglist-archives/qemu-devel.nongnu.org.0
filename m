Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB502D6518
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 19:34:04 +0100 (CET)
Received: from localhost ([::1]:36856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQlP-0003Nc-Dz
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 13:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knQhz-0002Uu-2s; Thu, 10 Dec 2020 13:30:35 -0500
Received: from mail-eopbgr60094.outbound.protection.outlook.com
 ([40.107.6.94]:26790 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knQhs-0000Ex-If; Thu, 10 Dec 2020 13:30:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaTp+0wOBC657IRO/nf8edMhPIt3uku5TYvqeB1Qb15r5M1MeYSXGjSMuTcgnrkv6QV+h1p2lKq6KUIc7WoWr7Y5S1Vl0USwx+TsRGFxddV5JBL1JYlFmteW9kQUUcGujXaFqhxhhBoj44Brqi5vlVM5ICNsmiAn9A76fdqN6NpjmgvdtUhSIx4+duHHMt5YWVlGoU4KGHrvOciP9EFOBHSDnIdny7w8rFybRxGNMrs9p0IyCCK7pIKfmVdO1vD+ksZ5cJ9DtyLufxgBg6QbxrZqIQw5iz5tPZ9ehTlEUtbJks8sGr1+D5cIaD0UiuXdS6CqJtAvAh3u51XzUEmGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ6LTojsLoA6c+BZX99qnSzTEiayQkN83cCVjUk98q0=;
 b=jSu6zUX9fbJqHbli4GgPoKCjC4q8HembBannJnhM9rVm7hAM2xhjCrgxAhcY7l0xsTrXaRVGxahLdendvtfGq2MQCquPQu668NcX6D+3JE9czyekMxz3gxhzqSSeMhYnDK91xTEjz+u+EnCQmaZN24FUY5P8Eh3jjrnp8gsTkgRq5s84+ce2quCJ1u3SO/+UD0QritLSriCvLdiu3m8SV2sqXvJ68Xn6NkL4eHAFrrGT7+FEEVP5C2mla1a9WGsyMsVzm/hR78wdx0V0L438kldulTjsEEaDGIvjk+Y1cjisYFTS/v+rw7VOZKXPEffFxSrKVqiGDWBdX7CzK0nb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ6LTojsLoA6c+BZX99qnSzTEiayQkN83cCVjUk98q0=;
 b=c2R3DzdNOLBlQWpYo326LYqvPN1ynSL1vq8/d6v8WuNMJloFyhoRmXMZI7nZQBKHz0Dbh56Ulhy7SPHb0RYunLKogyf4Uvw5Dp+tlnxGNn4ulYTdsPK4k72CXVZCXW3jYJHw0FIn/i0GaI5Ouo/FO0eXdwYgECGLNidkoBOe9xU=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com (2603:10a6:10:fa::16)
 by DBBPR08MB6041.eurprd08.prod.outlook.com (2603:10a6:10:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 18:30:16 +0000
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::382b:db97:31c6:7520]) by DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::382b:db97:31c6:7520%9]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 18:30:16 +0000
Subject: Re: [PATCH v14 05/13] qapi: create BlockdevOptionsCor structure for
 COR driver
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-6-vsementsov@virtuozzo.com>
 <e3621773-9000-31e6-5f41-9a7bfd5ccbbe@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <42e4cd28-e073-b8d6-4853-ddf3a47dec59@virtuozzo.com>
Date: Thu, 10 Dec 2020 21:30:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <e3621773-9000-31e6-5f41-9a7bfd5ccbbe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM9P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::7) To DB8PR08MB5499.eurprd08.prod.outlook.com
 (2603:10a6:10:fa::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM9P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 18:30:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 784dc7c2-5ad4-4f10-1331-08d89d39a43e
X-MS-TrafficTypeDiagnostic: DBBPR08MB6041:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB604180E591DC2D8D17B223F6C1CB0@DBBPR08MB6041.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HE/9VTMVHytb9gp22raQneXFMNndCPkApeKxh038waEeuQ4olFY0i3hKAehWI7Ik0gs89VHeRPJpWQFZaQZbjcdvLzqzvC06TvChK+MiPZ+D2A0MWBiVWeVro2LbawhiK/SxM1YIfTsLqEVdNzmz59pUfCgVNQnpAdSIxo3E8fAFR9ncKSkuoXhZ2pUXyWfruF97hU3F87VM/ggPi4qEGLnbTHQ9mNOSTyz2w79cdxRZ8zif7QXApvDyulri4Jgq25Y8Uag2yOT2UbN8qx9rSVji1oqOObnlbju+Ucyj6j5UZNYj7SDZsN20ZdExaiABNjYMl2ETHosA+CY4IcH4DIk4Ti+V+hu5WZNc7YT816Gj1QKpupWUt97hhLZdGOlw8oJdE1YVGH5pLS94nCUXqaax79ihGlarBmdGa0eBeYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR08MB5499.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(346002)(396003)(8936002)(16526019)(66476007)(66556008)(66946007)(16576012)(36756003)(4326008)(107886003)(5660300002)(2906002)(31686004)(316002)(8676002)(478600001)(6486002)(956004)(86362001)(53546011)(2616005)(52116002)(31696002)(186003)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUI0emN1MGdaUC9CQWZkRkgzQSttVzZENUp3bnI5U1o5QkJoM0RyeWZ6N0wz?=
 =?utf-8?B?eFpPYWJsVUtsakJxVU9MSUMxOWhXbVFqYlNZOGg2R1RUQmJqckZFR3VWU3Bu?=
 =?utf-8?B?YTFwZWZLaEk1dzZ1OWFMeUpXdWdmTk44VjUxK0t4dVhlbG1OMDNaOTlET3pN?=
 =?utf-8?B?UTU0N05iVUtrL3hCK2l0T1plaUNEa2ExUm5jSnh4VDlpOVNKaGQ0MW5raDg4?=
 =?utf-8?B?T2VsSllnV2pqVHJzTCtmNXQ2RllSbG5FUHp2MDJhM3BmOEdUM0p6UmV5MWRM?=
 =?utf-8?B?aGJweFpFcTVWZDFqSmFUQ0QwVHJOMG5uSzJMS3pUcWJ5QVNGYmFtWURIejJh?=
 =?utf-8?B?M3NZUUhLMmZuWkRWcXljbjFrRUtPODlIMVhVZU1pZ2JhZmJWbWphWmZXN0Iy?=
 =?utf-8?B?cVYvQlBFTmxvR1Z0cHVXZm1hTEpEdE01UnhxZUVrSkgxcFRVc3J1TmxOdllT?=
 =?utf-8?B?NXFrWFc5R29HOUQrSm5hMDhyTnRUcHNkVmdjZmhJczZSQ2JYbGcrYnI2VDFz?=
 =?utf-8?B?UUFVcENXaGlRQWY3bmFsL0NhOS8xV2xpeFk5VTJPYjJ2aHFTd2x2OVRQME8w?=
 =?utf-8?B?YWVoOE9sdXgwUEZRWGdGdGNSN04xWjMxTFhFUmpxNkx5YkNjTjAyeDVKcm9h?=
 =?utf-8?B?WUQ4RCtDSElSbUV1WnNDdHpSYnJsMDlBNmEyMDVPVzYyVHhROUMwVk9vc1pF?=
 =?utf-8?B?b3llUTFmeHhGNEt1RU1JZXdUYytwU2VpMzZpV3dJZTZXdmtSQlM2S290S2dE?=
 =?utf-8?B?VHo1RElWWTN3ME5qY1dwTHIzeTZ5dkx2V1JzaTFHQXRIQVorRWNIMHZjdDFY?=
 =?utf-8?B?RHhaYTgzQm15LzJkckhPQk1GUUN6QmNIeFowbkRRNWhnVnhLdGM4SC9ZSGNm?=
 =?utf-8?B?eXFxSGhid3Iycis5UmE1dXF6RE9HWFEwK1hoZWs3TDUyVkJKMHplay9lbUZv?=
 =?utf-8?B?eHJ2S3UrUlppSEdlVlZrRFdsbXh5WjNuMU1iM1B6RVRNcStGL3RkdXFGQnN4?=
 =?utf-8?B?WlBHa0JqL01XR1czcitKRW9mazNLQ3BKZWVWWVRlZVV4RUl4OUduWEFQZU92?=
 =?utf-8?B?ZjU5YytZNEhLNFZQTldjSUpDQmZDalFxdTMvRko1RFJFcHNxNUJBa253UlJx?=
 =?utf-8?B?SjFsTTRHaG8xbzNrNDZyeWRRSWZ5UUhTVUlrb1g1RHpNem9vTzlGNWw0bHpB?=
 =?utf-8?B?VDVpRXFiK2RhV3pRVitFa0s2V2tXUFl1eVo1ZjJxaTZkTGpZUkhhSElsN241?=
 =?utf-8?B?cFBtUnBwUEFoZUFMVmF2QmZlNC90SW8xeGo2SjE3b01YQzJ5RWNwNUVoTkZU?=
 =?utf-8?Q?QoPqGaCzWm7anqFEUeJM3zUoFBOF4whRrg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: DB8PR08MB5499.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 18:30:16.6187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 784dc7c2-5ad4-4f10-1331-08d89d39a43e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABsgQ+BIPP4v0/0GiDZb7ekQC04z9tDTWXlSXgaAKYlHQiCHQXTf4ijtFE+4vl6ck91AYEsKQcJc4U6OVW6DgNsK8u5QF2yXB7AoXmoxo4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6041
Received-SPF: pass client-ip=40.107.6.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.12.2020 20:43, Max Reitz wrote:
> I don’t like this patch’s subject very much, because I find the implementation of the @bottom option to be more noteworthy than the addition of the QAPI structure.
> 
> 
> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> Create the BlockdevOptionsCor structure for COR driver specific options
>> splitting it off form the BlockdevOptionsGenericFormat. The only option
>> 'bottom' node in the structure denotes an image file that limits the
>> COR operations in the backing chain.
>> We are going to use the COR-filter for a block-stream job and will pass
>> a bottom node name to the COR driver. The bottom node is the first
>> non-filter overlay of the base. It was introduced because the base node
>> itself may change due to possible concurrent jobs.
>>
>> Suggested-by: Max Reitz <mreitz@redhat.com>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>    [vsementsov: fix bdrv_is_allocated_above() usage]
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json | 21 +++++++++++++++-
>>   block/copy-on-read.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
>>   2 files changed, 75 insertions(+), 3 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 8ef3df6767..04055ef50c 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -3942,6 +3942,25 @@
>>     'data': { 'throttle-group': 'str',
>>               'file' : 'BlockdevRef'
>>                } }
>> +
>> +##
>> +# @BlockdevOptionsCor:
>> +#
>> +# Driver specific block device options for the copy-on-read driver.
>> +#
>> +# @bottom: the name of a non-filter node (allocation-bearing layer) that limits
>> +#          the COR operations in the backing chain (inclusive).
> 
> This seems to me like something’s missing.  Perhaps technically there isn’t, but “limits the COR operations” begs the question (to me) “Limits them in what way?” (to which the answer is: No data below @bottom is copied).
> 
> Could you make it more verbose?  Perhaps something like “The name of a non-filter node (allocation-bearing layer) that limits the COR operations in the backing chain (inclusive), so that no data below this node will be copied by this filter”?

Sounds good for me.

> 
>> +#          For the block-stream job, it will be the first non-filter overlay of
>> +#          the base node. We do not involve the base node into the COR
>> +#          operations because the base may change due to a concurrent
>> +#          block-commit job on the same backing chain.
> 

I now see that paragraph conflicts with further introduce of "bottom" for stream job itself. I think it may be safely dropped. It's a wrong place to describe how block-stream works.

> I think the default behavior should be mentioned here somewhere, i.e. that no limit is applied, so that data from all backing layers may be copied.

agree

> 
>> +#
>> +# Since: 5.2
> 
> *6.0
> 
>> +##
>> +{ 'struct': 'BlockdevOptionsCor',
>> +  'base': 'BlockdevOptionsGenericFormat',
>> +  'data': { '*bottom': 'str' } }
>> +
>>   ##
>>   # @BlockdevOptions:
>>   #
> 
> [...]
> 
>> diff --git a/block/copy-on-read.c b/block/copy-on-read.c
>> index 618c4c4f43..67f61983c0 100644
>> --- a/block/copy-on-read.c
>> +++ b/block/copy-on-read.c
> 
> [...]
> 
>> @@ -51,7 +56,17 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
>>           ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>               bs->file->bs->supported_zero_flags);
>> +    if (bottom_node) {
>> +        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
>> +        if (!bottom_bs) {
>> +            error_setg(errp, "Bottom node '%s' not found", bottom_node);
>> +            qdict_del(options, "bottom");
>> +            return -EINVAL;
>> +        }
> 
> Should we verify that bottom_bs is not a filter, as required by the schema?
> 

yes, thanks for the catch!


Hmm.. Interesting, we don't freeze the backing chain in cor filter open. And I think we shouldn't. But then, bottom node may disappear. We should handle it without a crash.

I suggest:

1. document, that if bottom node disappear from the backing chain of the filter, it continues to work like without any specified "bottom" node

2. do bdrv_ref/bdrv_unref of bottom_bs, to not work with dead pointer

3. check in cor_co_preadv_part() is bottom_bs is still in backing chain or not

Haha, bottom node may return into backing chain at some moment and we can continue to handle it:)

-- 
Best regards,
Vladimir

