Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5F6D972C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:44:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOyf-0004hj-Fm; Thu, 06 Apr 2023 08:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pkOyc-0004hQ-Er
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:44:30 -0400
Received: from mail-psaapc01olkn2061.outbound.protection.outlook.com
 ([40.92.52.61] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pkOya-0000gX-Du
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:44:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irA+I5RIcHtFzFHTtzg5KB/dCdp+9/5zleei4YwSXSDiFNUpRrEEAdcd6lKZuiEersY+vjf9IuqhhxlmqXDfraCbeHonVenGDCMXyK+Ou4xwvWYGXLlPrS3HJh0BBTTwDiGa8tnmcSMlPBFrlM6QXXP+1fZiy2leg1YG5uW4C2sW+gYS3MRSYNzh8YvmpYAkgF7GLDQ0xwAb7ztxuAWDZlmmXrgGCtVXP1NNh9L4YTEZZazW+lmi/nudOWrbXMuCqVrjjyVYPJN1kDDflkyHzkpLCQ4z4fTt84zjsq3FJOlkNw66pAoFgFvxAV5haNwp6DbkzmVQiV/aVnrw5su7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jefl8DY1iLaiI+RD7QHWc4nEKselBPKMEMBynVrXmnA=;
 b=iUlc7f01R7HgY/42UMby9jblehCbbjVqa2EjzFEmwfrn3ztf5jU6ROLKsnDOqD2wZkCKd2V+SyWyIUJMwUbHIKOYXh8wgYoflvf1pqpFx0Jgpx7s3+E+OCzjKRPEWmwODwyxgxjHD79k2V2LFzynthE/kl7GQGe9Poi4s3+phVrIYdxUvGNTPaIjT+Wm2ufxSqpvB5+KTv7AwT1fPVaUMjWKK/3ssLKrgXoMBG/WBfi7LhyGyg/dqhSbtZkMWfmrQVmluMxIJnW7cTsAo9F/lmBX0CGYuaUGSQkucJG4KFBT2hJwuIaXUxbyDzJGD/Wdsp+zR5sRz5U2MJpbMdif7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by KL1PR0601MB5464.apcprd06.prod.outlook.com (2603:1096:820:c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.29; Thu, 6 Apr
 2023 12:39:19 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 12:39:19 +0000
Message-ID: <TYZPR06MB5418B404755830EDA5DE964E9D919@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Thu, 6 Apr 2023 21:39:18 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/4] util: Add thread-safe qemu_strerror() function
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <TYZPR06MB5418A6BDB94FB0D97ABA31299D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <87edp6oy7g.fsf@pond.sub.org>
 <TYZPR06MB5418A3EB07F30B8AEC1A28229D8F9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <87mt3ljslb.fsf@linaro.org>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <87mt3ljslb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [kGNWvlSrIkwLsNcf1B1NnXwVwnyfNN7+3/0yukpLPuB9esDNZewhKTCDGc4TJKRccZHRYgUCg5A=]
X-ClientProxiedBy: TYCPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:1::30) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <9d6d1412-dc2b-3fda-75ac-6f567a9d50ff@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|KL1PR0601MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: bd312923-84fb-4cf3-a074-08db369bf108
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1x9jPW0JqG4/Zehig3Yh1Ioe3E7Di4IMrk/bmMAyQm4J0tsDeOgwZdYNK/HRYtyJIl7EHUScZ6mmhOylg+jH+PcZEvkmB2zRd3YOmlxucC3UtEpAOI1/nx3hS6awzGAs4NhtFHdgARLgRJ2NiXie/FNZ1B3eOOPzpdtHphacQpU1IuY1Cd7DahLWA5Jk1powyCUVnJ5qZeja8q1I+8xiQVZsl4wUKFGnf5YKf+I6vYdZKMXGw3MaFoDNeAO+gl6m77uBk6CWjJLfoMAF6s2LVaRuswtayTwhIv+uupvxr2sqCCetQ5LNWQwplFTQE0GMoSUE2fTxJTVpCqTjgS9f+ynJ52YxNruRyMjBDT6NeR+BzSet48TDE0gjGAVCeP4TKNzVDf3cb5/+gtU4boWvDx0PkR5xeDGJtHiGhtBxRc04iMDu4I7MiSFdzwZvGfRj3TdK6CfMIwqGI9cMoYLAIaSNZVMqTKC3e9sGTVQguJfzv6ZhYkcUCHk/gMe2ZhzAe8C8Q7FJ7Ag80nq6kFqBW9CiAjMwM7kRskyR5gxpcwNPMWau3BncsPN98DlrtkWlrok9RqVbn+HOZQXBHMFBUy3pCFk3dEKHtUvTDdzjNs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGw2Q2lSbUs4YnRhRkMzS0JiOUV3TTgzb2xhb0FFZjB3bjQwN3Vqa3JURk9N?=
 =?utf-8?B?YStEWDZ5M2IrOHNoV0p4R3gvd2x0dlNLVzlTUHd5dm5qWHVqeTQwSGFITXQy?=
 =?utf-8?B?RmF1WVkrYTRtQmh6RFlmQ0NzN1FibFpnYTJvYmQyazJjZGlGYWdLTGVvRWtN?=
 =?utf-8?B?U0xmMCtOQjJubmVwcmtpODVNcU55NVNIV2ZQN2w2N1ZZWko2aUdvRVZkYTRQ?=
 =?utf-8?B?N3JNWkY1TlFGQ2lCazFyWEtUUzZVQWVoUTcwZzVadnZRaDI4VVhnNEszbGVD?=
 =?utf-8?B?dmhRcGFHdHpTRnlJRVdWemk3dkJnQm4vSE04VnlGQ0owL1pOMTFzUWNyc29j?=
 =?utf-8?B?UkNXM1VvZSt0STNyb0I5Q2VVc2s0TjU0M2NOTUxJSDRvR3dqYzA1M3RoWXZ4?=
 =?utf-8?B?MGFCanpsRG5lT29jNVZXaFJBS2NLcXRNb3paRjFVZ0pHTlR6QmhyTDlnL0Vx?=
 =?utf-8?B?eG84NlNBZm9TWU1kMThuZ29XTHNvWlNvc0R1SkREL3FHUURFamhWSGpuTDQr?=
 =?utf-8?B?d05raXJZREpaUEVEQ3dUdzFrSnQyQXo0NGNPYW5xSUpNUlVTMU5wTzUyZXFo?=
 =?utf-8?B?bnhnbllrVEQ1UzdvcEZITFIwdG10RVB5ZjIraHZnSm1aeUNpZUV5NUZYWFBG?=
 =?utf-8?B?UWRhZmlPMEk2cElaQk5GeWF1S245RTkwbVJqVVhxVEx1N0VGbnNSWVRrYlg1?=
 =?utf-8?B?QkxMQkFuY25Ra1NjSVNrS09vcTNlbktLKzg1dk12ODE2WVJXZXFuWjZ2L1Q2?=
 =?utf-8?B?T3c5aEdaRlJVMEp3WnVOVnFaZjhUODJIdWZHSTl1aWREYUZQelpOYlh2cm45?=
 =?utf-8?B?SDV0ZlBIc2FQUU9LbCtySlNVVU84R1pzKytzU2RUUk1NTlhKTnRtcnQ1dklP?=
 =?utf-8?B?eEpUa2k1SjRUOTZqdURWMlN5TUFzTy9GUnNXVStuTzI3V2Z1akwyVUZDOVc4?=
 =?utf-8?B?YVNLNjQwR3c2YTgxVXNqc2FDeDRFWHN2S1FXazNKWVh6d3hWQ2wwUlJ5bnNx?=
 =?utf-8?B?SDlVQjgxZW9uVHV1VCtVdmdtRmltWlRoYmpUdjFML3FJT2c4ZzJGVjE5OUdU?=
 =?utf-8?B?OUFzNk9STGwvcnc5UVdxaDZmUXhwVFQyc0cxQUFwWjFKUGViWkpmK20rVkg5?=
 =?utf-8?B?RHY2Uk5KVFRuaVk5QnhBRDlabG9CTE5TY2VJcTVYelFGdzFaSk5EODVCM0pp?=
 =?utf-8?B?NVRHMGNIaU4vVTB4OHZOMlVaVjRmZlF3K2I5OUU2ajl6bEJlS1ZGcCs1Q1pj?=
 =?utf-8?B?K0pMYWZqcHN3QUF1bElKVC9ScGUrdzNqVEczaTBaNTNCcVIwN0d1Sm9kdFlM?=
 =?utf-8?B?aUpTSEE5dU5PZ04reldvYnF1S2h2WGFaVGJNZzF0ZG00NzdaVjAveU9jYnF3?=
 =?utf-8?B?UUs0bW5jcjdjZFJTUlRWcGFmSTNBRkVDZmJza0dBMlZZTzMxbFdqS3QreVA3?=
 =?utf-8?B?dXlDbWVPeFcvMDViRGtJTmNoYlNVMjMwZ2h4T00rakQ0WTZRbGJlclNDK0JG?=
 =?utf-8?B?Ky94NnhnOVIxOUgrYXU4VmdJTndBVkVidlcyTTZUUlBHMmxnbTNLU2JoZGIw?=
 =?utf-8?B?SUtsNFJyYUZ1OE5mYnlQQ2VjRUVrUGozWlhpK0lTNXB6SnRrQTd0Y09qNzV3?=
 =?utf-8?B?SFEzT1lrZVJyRlhkRmcraVAvenlUYUdpeVZSY0hQWWQ5bmU3RXpTdTJGRmxD?=
 =?utf-8?B?cU5pcHpyYVFnRDZ5Ymg4TWhtTzVkWDRUWWh1N242K3diS243ZnBnUTR3PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bd312923-84fb-4cf3-a074-08db369bf108
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 12:39:19.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5464
Received-SPF: pass client-ip=40.92.52.61; envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.224, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2023/04/06 17:57, Alex Bennée wrote:
> 
> Yohei Kojima <y-koj@outlook.jp> writes:
> 
>> On 2023/03/31 4:06, Markus Armbruster wrote:
>>> Yohei Kojima <y-koj@outlook.jp> writes:
>>>
>>>> Add qemu_strerror() which follows the POSIX specification for
>>>> strerror(). While strerror() is not guaranteed to be thread-safe, this
>>>> function is thread-safe.
>>>
>>> Why not g_strerror()?
>>>
>>
>> Because g_strerror() uses mutex in its implementation and there is a
>> risk to occur the deadlock. If one thread enters g_strerror() (soon the
>> mutex is locked), then another thread calls fork(), and the forked
>> child process try to call g_strerror(), then deadlock occurs.
> 
> I think we should mention this avoids the deadlock in the commit
> message. With that:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thank you for the review. I will address that in the next version.

> 
> 
>>
>>>> This function is added to solve the following issue:
>>>> https://gitlab.com/qemu-project/qemu/-/issues/416
>>>
>>> The issue even asks for it...
>>>
>>
>> Originally yes, but Daniel told the deadlock (or a mutex starvation)
>> risk for g_strerror() in the later discussion of the issue. Probably I
>> should have mention that in the commit message or the cover letter.
>>
>>>> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
>>>
> 
> 

