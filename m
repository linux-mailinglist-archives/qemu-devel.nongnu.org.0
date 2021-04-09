Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B668359B4C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:09:03 +0200 (CEST)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUo4U-00063h-GA
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUo2q-0004ed-5k; Fri, 09 Apr 2021 06:07:20 -0400
Received: from mail-db8eur05on2130.outbound.protection.outlook.com
 ([40.107.20.130]:40640 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUo2m-000471-6f; Fri, 09 Apr 2021 06:07:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z57YUbNbOuu9vktCQluNU5/MFVgwahTrp8AKUkCIX8DNt+2dBgxcN6/rTA4afKsdYhuOU3HJGlXT9Pffg5sw0FcYmIWOPU4CLWlTuPlm6/NYsKc3N8rov3cyBDvEkpUajoz5uqv2DfDYqRUasLsaXuwMphSfcTBKiQKUi6euzLRFd60XNDNFXl4N0w8g1GDtzo5230uSDmUYSxKa+zL5atqj9TK0IPOBxR6feSKgPk6yZKdgJuESRH0d72PmS4McpQ90oXnKGA6seD7cXfPfcQ/bUnXBy21eTKetADNWhAvSOlOtUWdutSawdVIwSUrkkrk1dQJ12nE3c6IBOEupig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKJ8ap7keFw1806f89q+xaFk1GSJJPsAqiYgYFFO1Bc=;
 b=Q8nYQgv7xSndZ1jJBG0L89/y+uPp6CwjSy58tLfzfi2KjnG6ZTS7YdBjAFIPY8vKx3r4hi6AlnsuXTo3stC2EOrmUCdkihtfPsI8T4JgW35yb502w5dLiLyTVwhfi0RBu/rAuPgtQxN+gSyexfiwjtT0aalhluOgymkQnAtR4FcrUxdtydiTVgLE6nKlr7yQfcAiuFMo0UoF2sFEcZv6rEgzd2AXZ2wReJePmQ/y+e0JSz0yiVcSIx6ymMqhQB+fmgdEGiPgzsms9RptkaTOVOV0H9IUO+RQ/WZ4eAt+3T8SjgYfLooGxQE4yhCvN8nuu8warMof4TbHJdAWkxJX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKJ8ap7keFw1806f89q+xaFk1GSJJPsAqiYgYFFO1Bc=;
 b=Z2jmsQtOyrOxjl+Feb2LTRnwKkjfuK4u6sYMG7J1pIYudBn7mnyYoRs/x8Su3K8F0VLsByxE8Sf6H14sRt5xlZMNhweta+Hryb6IUfIK3x4UtEL6TVUAIv0UML5mF0ctJyTxG9Prl+1NnmQTQA9rVqBZDRHqMy9rjWjrDak4Ta8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 9 Apr
 2021 10:07:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 10:07:10 +0000
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <505ba75a-996b-0c65-0c49-add50e55e3ce@virtuozzo.com>
 <66c60724-d3b5-383b-7a19-9e9498e1c132@redhat.com>
 <ad98de4b-a51f-1cce-c44d-a80110712a42@virtuozzo.com>
 <da048f58-43a6-6811-6ad2-0d7899737a23@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <43b679be-5b06-5b29-755b-76966915a5dc@virtuozzo.com>
Date: Fri, 9 Apr 2021 13:07:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <da048f58-43a6-6811-6ad2-0d7899737a23@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM0PR06CA0110.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM0PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:208:ab::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 10:07:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acb75e75-8d75-4ef5-66c0-08d8fb3f3d08
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333441919A584A0BEFE2BDAC1739@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahmA0S/7Ks+8QloX749heE9faox1rhgjOUX6KFcyxzyyFY3aJSQKKNI5NrZQ51FyhYcNJSzgH3l6wdaSafvv3To7sQJM9gYgCj1/C2JnZWYcBEMiX/k8gbbGuyJePd7H+mcs7FxC4Kjp3kM4ag9+hdamPU87aNQlNtKHHjyF42R0Xr9tW5ag2AlFGKkb/Io3Qlydju7pDM6HBkRSrESGnY+U2o7/C/pcM6tUCaAaCL54v57bXtvN0KMxUdEO7kViXtMeC1TF9dWJivp/GZ4tT95h1nRnaBo33B0wZ9XJ98WFtYojbFdFwK4trg4n6mlrkEPp0JO+oozIasT2rHiv6Wf3s3HFeb9vHtrC5ZCWhBSinFOhszAbd0yTRNibIrocxtBbKojl+f/nXxOsgEoDNG0xm+/iSPaxoEjnBDg/JVEsWGR33uo4dOK31wP2ONgf4cwatIPLcaHNSpOZJJT4lui70KDnJur2/0xVNneWrHN8uMKI6VGU/b+6/ItvuqfeFvAMpOD6/204eyoK8jJWvZ2gRwwi7v7W5aPWM+QokdeZysuQ87/UBylNaf5UTkSvwNPsSvm3qazLvuvy9DfTROQdrJR21V9/DAf9Dm623uLQtvV66D0G+t3LSb3MwrTreWZAvM2/CZsF3Q+FT4VnOmN2SXaS21YlGXiFQ9FzZF4TiKGvpCdZirjdwEBHPskFrXXN4Rq5h+oJ9LdQ6nTIShRgBDdsqgxay8k8hgXTaRWpndYWU/U3xdXT3/X9YiU4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39840400004)(5660300002)(36756003)(38350700001)(53546011)(38100700001)(66946007)(4326008)(186003)(8676002)(16576012)(8936002)(16526019)(66476007)(66556008)(316002)(83380400001)(6486002)(478600001)(956004)(2616005)(110136005)(26005)(31696002)(52116002)(2906002)(31686004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHg1Wml1L2VianYxNXVXVUc2cmo0bGZrSlFSZmc4ZmNUMXRjbXJvT0ZQejAx?=
 =?utf-8?B?bnhkaHJJNDd6QUJVaWZTTERyYmQvUlF2RlMxVjNVc3M2L201UlEyYWhKSVBW?=
 =?utf-8?B?TXl1NmNld0ZwV3hwN0ZhYVZRL1FvWkJXTkVQd0dobG83K2U2Y0s4SVhVVTBm?=
 =?utf-8?B?M3NoazRtL3BnV092bzVEb21BMng4WVBUekZtVWFYMGZEL25kUW1oeDJtaFJs?=
 =?utf-8?B?aCtEdmFmQnZWdUM5ZEVhZ2cxcU53QzllN3hzQkZjMnpmQVBOVmVjYkhxUys3?=
 =?utf-8?B?U09HeG41RmQ4czdrTlU4QzNnbmx6NVU3TExZOVh4R2JUaFNma20vTFBITDh1?=
 =?utf-8?B?MnJ2NjVNc2JYckY3VDRWSU1XOGJYMk5FeG5qWm1KZzF6ZDdmZjQ5YzVndGhl?=
 =?utf-8?B?ZlFtS3B3bTVNOGFhdVFGY3lpZ25SZm9FWEhrQTAzME9GSGpoS09aSmRyZ1NR?=
 =?utf-8?B?OXJSYWs0aVVnbEh3M1ZjWjJWNG9EOTVYTlBlY20zeHBtNGx0NVFKcDRpU1VU?=
 =?utf-8?B?YXh2TExqWklYZjBJZVlSMTBGYnRnQ2Z5bTdTZUxQYkFnNWF2L0pIb3k1NjJ6?=
 =?utf-8?B?azBBMnNHQ3FGUXZaM1JpanhML0tUZmtvM3huRjBXU1dGT1hhMFJoUFlWWmcv?=
 =?utf-8?B?aCsrb0xObFZXWVBPaXpmZG5UdzBoNUN4TzhJc214R3hPVEE2SUtRVmovS29y?=
 =?utf-8?B?c2IvS3ZxVHYwQVRJQ1d3RUZhaldjNEpsTzBONk1zZGV4YzNkMFlIVCtGeUxY?=
 =?utf-8?B?YmVYQ0lBbHNnTFYxbWdobmNQSVZ6LzcwdWo3SnZmaHpXbEdJQ2UrSXh0Nko2?=
 =?utf-8?B?aTV1bHlzTzExOE4vRTV5UU5iWmdhYndHOGNkdWZmU2ZRejRiMWxPdGQwZFJs?=
 =?utf-8?B?SlZ2cngzcksxNkpuUlRRSVROZS9KblZyK1pHeUNDaDd5amU0WGRQVURCdEEw?=
 =?utf-8?B?SmV4d216TlFBR3EzK2NDNXZ3VWo4L1h2aWJ2WVdEbHJFUTMwLzAxVXFMdG44?=
 =?utf-8?B?dFIrdGgxdnJGUjFHa3RvZkMzR1loY2M3NlhvdDl4aUppMlFDNHNtblBSQmlt?=
 =?utf-8?B?cFQ4aUlhV3I2OEl0S3pGdmlzV0xHQTUrYXM3S0QxaTJ2cHIvVll6eGpTdDFG?=
 =?utf-8?B?YTkvRUNsUlo4aGtwMnlQMWZzcVpLVEsvNm4wUUJLQUNZSWg1bGhUT1FqV25y?=
 =?utf-8?B?dGJCbTJ2djJCcUFKNHNVMjk5cDJKVXdPS2pmRjNSOHRxaWtjQ2VIQUhBM2Ez?=
 =?utf-8?B?M3FmanFRQTBZZWhNT2pubWNXdDB5OXlwaWdhRzdvbi9HMlhpalF0dW53ZXB3?=
 =?utf-8?B?ZDNNOGNyUEhwUzUvc1BPSXZwZ05zbVplaStBOXJuZ1h0eS91c0pJSGU0c0NO?=
 =?utf-8?B?VWV5NHZpYk9NQk4wSERaTnJPT3d2by9lVE9Fc0VhdlVsdnJwZTRvQk95bElK?=
 =?utf-8?B?cUFNRFF4Mk9BeW5CQmlVMzlkVktBeVY5MnZqRnMySzc2ZTBybUp3cS9ra1Ur?=
 =?utf-8?B?SExBYWdkMDdYL21iVlpkTXFBZDdpd2tXNEM0emRSMjBWRjA2b3V3QllKbzZ0?=
 =?utf-8?B?RWJkSEs3aFMyYkVKZVRQVVV5RktRdHhhZHpjT3UwclUyWGxCbmtTTTlpMEhi?=
 =?utf-8?B?T1F3NHRtUXJPQ011d2luejFzRU5lT1M4aGpGZlA1aW9IWjBlQzJmMFJESjJU?=
 =?utf-8?B?KzUyYXRlMlh5N2ptTlFrTkdnVHBHZkpueVZTd1ZGQmE2RWRlS0hid0FHdzJI?=
 =?utf-8?Q?gbopYJGdhCFz/LyETAatvAXTJ4mmUAcKmBTp5F1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb75e75-8d75-4ef5-66c0-08d8fb3f3d08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 10:07:10.2270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgYTHI1slImn6cUZ9hNNnh912VtByXiZXXplipeyetOO/l1I+TNSdd8BAeuVESYkdpvn2blGsCPCwrnQLSLdC3ggFfTMqGPQaCKckcoobxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.04.2021 12:51, Max Reitz wrote:
> On 08.04.21 19:26, Vladimir Sementsov-Ogievskiy wrote:
>> 08.04.2021 20:04, John Snow wrote:
>>> On 4/8/21 12:58 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>> job-complete command is async. Can we instead just add a boolean like job->completion_requested, and set it if job-complete called in STANDBY state, and on job_resume job_complete will be called automatically if this boolean is true?
>>>
>>> job_complete has a synchronous setup, though -- we lose out on a lot of synchronous error checking in that circumstance.
>>
>> yes, that's a problem..
>>
>>>
>>> I was not able to audit it to determine that it'd be safe to attempt that setup during a drained section -- I imagine it won't work and will fail, though.
>>>
>>> So I thought we'd have to signal completion and run the setup *later*, but what do we do if we get an error then? Does the entire job fail? Do we emit some new event? ("BLOCK_JOB_COMPLETION_FAILED" ?) Is it recoverable?
>>>
>>
>> Isn't it possible even now, that after successful job-complete job still fails and we report BLOCK_JOB_COMPLETED with error?
>>
>> And actually, how much benefit user get from the fact that job-complete may fail?
>>
>> We can make job-complete a simple always-success boolean flag setter like job-pause.
> 
> I wanted to say the following:
> 
>   But job-pause does always succeed, in contrast to block-job-complete.
> 
>   block-job-complete is more akin to job-finalize, which too is a
>   synchronous operation.
> 
> But when I wrote that last sentence, I asked myself whether what mirror_complete() does isn’t actually a remnant of what we had to do when we didn’t have job-finalize yet.  Shouldn’t that all be in mirror_exit_common()?  What’s the advantage of opening the backing chain or putting blockers on the to-replace node in block-job-complete? Aren’t that all graph-changing operation, basically, i.e. stuff that should be done in job-finalize?
> 
> If we move everything to mirror_exit_common(), all that remains to do is basically set some should_complete flag (could even be part of the Job struct), and then the whole problem disappears.
> 
> Thoughts?
> 

Sounds good.. ButI want to understand first one simple thing: can job fail even after block-job-complete succeeded?

As I understand current users think that it can't. And block-job-complete is documented as "This command completes an active background block operation synchronously". So it's assumed that if block-job-complete succeeded we are totally done.

But maybe, it's wrong? Can mirror_prepare fail after mirror_complete success? And user must check job status after job is finalized? Or check error in BLOCK_JOB_COMPLETED event?



-- 
Best regards,
Vladimir

