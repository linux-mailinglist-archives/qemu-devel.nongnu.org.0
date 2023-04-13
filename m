Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931956E0B62
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 12:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmuAc-0000Dg-IR; Thu, 13 Apr 2023 06:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1pmuAa-0000DQ-0s; Thu, 13 Apr 2023 06:27:12 -0400
Received: from mail-sgaapc01olkn2050.outbound.protection.outlook.com
 ([40.92.53.50] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1pmuAW-00055t-Ha; Thu, 13 Apr 2023 06:27:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSkw02e7JU1D6a9qHYmO0di2FwL2AACY2zOgC1sy7Y0/2WteZjj/NjEWkI21f83Wt/noSqJpAJeUNMyusjSxe5+rNNoNBuz2n+R64OIpbGvULUGZZ7J4NvBy0HmvhVUfKVA2MoCTUK0BnqY/Uw+C97rg+ZfdxvKzI8vYUv3pJ/BDFeZ6Na0l3bHO5V2yLF35PVYpIpskWiRscevdQaJsNsMEkClbSer82JQL5+AvHoWv/IMhpu0GNWDf5qeRg7HH7e4vkipcQa+yV9WqL7vHMCPC7QDLFjzkDasK2ZQzFSb3/ViKGyIHgbVqx9gEcecyTzkPDkPBCJGjWk5cYeWshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pls04sFk3rdeP3xN6jzibTJThLiw3w/++DPBKuhGYzE=;
 b=QlF1QHb3aGq2nOkO/KYtM18x41DZUjm1Y0f8oNIpM5Hlc4yV8vgK2/ZHxiSF3ZoDjMs+2ZkQzd3ph+YUI9/4oR4BC6hj0E5f/dsYJ23SXJe8Eihjoi6z9gaduk4d2oj2/tgc6vtFqeaqdaiuUPXz+6qpSh3TBRakqXuRUKZOfywG9pugT5krOMZgLbW5qwE9HeuncRBHL6EQaPR5M3Mij0uFJmgd6NhllplUOWUmcurW0XHmQOlb/q2QkuVgSHFQGxmRzOksW2yB0lM2e6qdsXERSODxrbl0ieVbbb2vp6612enhvkTI8J/uEP0Pnyf15muytE9ZWZaBXR9GpYUF2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TYZPR06MB4303.apcprd06.prod.outlook.com (2603:1096:400:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:22:00 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555%6]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:22:00 +0000
Message-ID: <TYZPR06MB54182D72B75971C4EEC471639D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Thu, 13 Apr 2023 19:21:57 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <87sfd6po7k.fsf@linaro.org>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <87sfd6po7k.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [m7q39ITLZjBougRcamq5sknQFS0Z50Sus2mEdMTOlgctQbKGej8q8UycP0PnWxwfgAHsogM+Yl8=]
X-ClientProxiedBy: TYAPR01CA0018.jpnprd01.prod.outlook.com (2603:1096:404::30)
 To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <b77f1d8c-6200-9e35-1660-973251dd9527@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TYZPR06MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dba3869-42fc-4286-4711-08db3c08eaba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEnQ9bbefsogiJG06cP848Xwb7f0QRNRk4vDtjfqENPc1fHGH0ywjTKlC/d21I/xxgs9+KG4Ptm73oqQTQGs2sc69qO94uMSzZj7o3Dc6+bIny1st2Q8v9mPExiizVnRk9whOD81H5sZmhxlmEvK8vDTWAUEaZna+5YUAUaZ8U3go/9r1Rq5/kexi0cKXXokdI/d/n2cIhuKzhIcNb3YzLNwa/yCtZGISG3vxZqREad9TS33LmCm8Aw1IXjKsObn+K5P44MuqZ20iu3l9gsp9d+0Sqf5jQtQ/zcz0lOVWfogjBb50R01IlwawPoyNP0Db9vBSDrmyYrGFD+CCdE4PYWUoYvo7NNv29HIPJjKu8imAxPwDlgwnQXHfHL1oObUFF6turMG42z16fylW0vWH6MHF8EnbfSUXFzcuNcV99uzq68qIgTPaT1L5D34AbpzhT4EFxLPPPdYSIGg5iIMiwAM9oQEqIBXxMcf0XXdMMSGlfPAC+f99BLHfvrFIQwB+vYsyZU/Romy+8/nUFk80dWWkmYSm4Oy8ucLM+W21cbGFypoprJECJ18EZDAwan4FL/XApV1OmUEe2RzjP5FrdNCq8jEE0wbBaAFczOYai91B9pkY8SW3jJUxFmabOZp/tW22B6pBQKNysL13mI+fEDGVvexvPyjTV+dR4TZTR8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRmcExSbXJrWGg0bmNDN3FRRzdRWDFmZmxLalhaRW15SFMybUJXTkt3L1hD?=
 =?utf-8?B?YzZycDBXWDF5Mk53UnQvYUNNcU1HMWZ3VEUvYzZSMURiVmpVNktTelFzUWNB?=
 =?utf-8?B?MVYxUDNXWDg4WVZpVStnUkViYkhwUlpBWHF3WTlKdWdQaGtFNnlReUV3V3lh?=
 =?utf-8?B?MUdxaDlIZEdVVjlNdVJkUC9uLzRadmlHMlVudmd5TlBJeDhkdkhSVW9SWkpU?=
 =?utf-8?B?SmN6WitpMzhpd2NjRVY2RUdOTlF0bVpISklyWjN0WmVnVmdmTldQc3NORTIx?=
 =?utf-8?B?RHdyQy9SZ1JHK3hZRElvSWZnMGJBOExTcXRUNlBpaDh4Z2xNU0FYZ1ZTZldw?=
 =?utf-8?B?b1RvcXpEc0RZNG9DM1JRbFVJL1NrVWZwcE9jaGpzWmpZN1YrekVOV0FpOHJJ?=
 =?utf-8?B?cDlXYmFBK0xaTTZGV29TaEtOWUhGMGtUYm5PTi9XcTVqVGg4ZXhTR1loWTJG?=
 =?utf-8?B?NG5JbTdCeldxOUZsQnB2ekRvNHEyRHFYaWFPZzIyS3EzY3VvaTB1Ynoxamdo?=
 =?utf-8?B?aW9HNHBaYS9oTWQyVlc5aWVWRXJTcE0zYllSTnJNZlp4VmdCUnRuSmFnWkxS?=
 =?utf-8?B?b2dmOE4zZXVBSERFVHVsRzV0QlMwdlYza0VkRG8yTWpycUZSVnZqMWo2STRF?=
 =?utf-8?B?UTQvUWdNRXlXZFZJaUpmODFRQTltMjlINlF1S1J0ZnNQQVBUTkhidVllbjBX?=
 =?utf-8?B?NGw4UlA1a1duSDRzMHozS0pWNjR4MVYyWFFLUnFrQ0JnQVU5anB0dG5rOTFo?=
 =?utf-8?B?dEFBdUhuNFd2NkIrYkZPMWxsdGZBRDdGdmt5MjVsS2xhb1JsRDg3ZVZxOHll?=
 =?utf-8?B?ZVZGOWE4dUdTYjEvMHdnb1ZCMnBhU3Q2dEVGNlZ5WUx4OHREa0NMaGRZRWc4?=
 =?utf-8?B?Z0RGMUhaemRVS0M2TnYrdkF1SFpKSHgwMXNuaURWN3kzRm5rY2g1ZUh0WTlv?=
 =?utf-8?B?WW9OcHhQNVRBOTFpR3NtVGQwdTd0aGg1cmtBelF1aFhXQlhTd3UzSC9INVha?=
 =?utf-8?B?ejhuYXpaNEJURUhTdEVFNzRhWjM4RFNyOU1XcDk1Z3F0Z011VmJQM2orUHhO?=
 =?utf-8?B?czF1bUtocVdTcXJTR0NoTFFxcjhSWHNVR3E2Q2svT1lrZnFoQUpUTmFwLzY0?=
 =?utf-8?B?eVNNTktlcjZqeitDYWMxU1B5NEl3ZlNEV2pxOE01YlhWZkx4eXIzaWhHdC9l?=
 =?utf-8?B?bXgwMEZ0UmZRakMvSmhQdDhaV1l4U3VxSDB2eTlXQmdtSWMzc0xuK1BKSndl?=
 =?utf-8?B?cnRoRDNRYjVGK1pWQi9kQVZ3UC9XNWtEVXl5bGFPZVFyRHRYTGVGckRyaWJa?=
 =?utf-8?B?eEZxTDU3U25YUC9QbXhSZ2RkREt5RStHSE94TTlWMDBTRU9pSmVWUXRjdDNS?=
 =?utf-8?B?NnFBUG9rd3J0aHBFRllhVGMraVhka1J2OFdGek9tak1rOWFUbjdWV2FkeTgr?=
 =?utf-8?B?Y1FyS2k2VlJ2NDhUWnMxUjlqMEl0ajlIeWJqWXN1ekpyMFhtUEV0eXYzWTdv?=
 =?utf-8?B?WmMvNmdNSmd1aEl6bElwQmRjMVFSTVpHTGZuSzkzdUtUQVRsWTFLSWY1Wmxy?=
 =?utf-8?B?WnF0TnNmaE0yem1ocmRNS2ZOL0M2c1l6VHdpeGRYZEE0VStLOTBRNWd6ZzA5?=
 =?utf-8?B?UDNNaGY2Z3hhRUQwRjBVN0hVV2lFUUFVR2U3QVZTVlF2OExOd3dwbDhuYU9P?=
 =?utf-8?B?aGFlcEQxZ3p2Rms2aFlHMUxxNW5zTkptdy9sUSt2emI3NHQ1UkR0RHJRPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dba3869-42fc-4286-4711-08db3c08eaba
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:22:00.1949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4303
Received-SPF: pass client-ip=40.92.53.50; envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Thank you for the review. I will reflect them in the next version.

On 2023/04/11 21:57, Alex Bennée wrote:
> 
> Yohei Kojima <y-koj@outlook.jp> writes:
> 
>> This commit adds the following description:
>> 1. `memdev` option is recommended over `mem` option (see [1,2])
>> 2. users must specify memory for all NUMA nodes (see [2])
>>
>> This commit also separates descriptions for `mem` and `memdev` into two
>> paragraphs. The old doc describes legacy `mem` option first, and it was
>> a bit confusing.
>>
>> Related documantations:
>> [1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
>> [2] https://www.qemu.org/docs/master/about/removed-features.html
>>
>> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
>> ---
>>  qemu-options.hx | 25 ++++++++++++++++---------
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 59bdf67a2c..174f0d0c2d 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -405,15 +405,22 @@ SRST
>>          -numa node,nodeid=0 -numa node,nodeid=1 \
>>          -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
>>  
>> -    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
>> -    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
>> -    a given memory backend device to a node. If '\ ``mem``\ ' and
>> -    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
>> -
>> -
>> -    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
>> -    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
>> -    use it.
>> +    '\ ``memdev``\ ' option assigns RAM from a given memory backend
>> +    device to a node. It is recommended to use '\ ``memdev``\ ' option
>> +    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
>> +    option provides better performance and more control over the
>> +    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
>> +    '\ ``-memory-backend-ram``\ ' allows memory preallocation).
>> +
>> +    For compatibility reasons, legacy '\ ``mem``\ ' option is
>> +    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
>> +    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
>> +    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
>> +    option, and vice versa.
>> +
>> +    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
>> +    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
>> +    for '\ ``-numa node``\ ' without memory specified was removed.
> 
> I think this mixes up memdev and mem too much. It would be better to
> make the lead up to the example just talk about memdev (as it is the
> preferred option) and move the discussion about backwards compatibility
> to after the example. You can use the .. note:: annotation to put it in
> a nice little box, something like:
> 
> .. note::
> 
>     For compatibility reasons, legacy '\ ``mem``\ ' option is
>     supported in 5.0 and older machine types. Note that '\ ``mem``\ '
>     and '\ ``memdev``\ ' are mutually exclusive. If one node uses '\
>     ``memdev``\ ', the rest of the nodes must also use the '\
>     ``memdev``\ ' option, and vice versa.
> 
> 
>>  
>>      '\ ``initiator``\ ' is an additional option that points to an
>>      initiator NUMA node that has best performance (the lowest latency or
> 
> 

