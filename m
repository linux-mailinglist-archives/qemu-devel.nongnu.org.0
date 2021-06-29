Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF23B79F6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:36:53 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLPY-0006Ed-FD
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lyLNv-0005Lc-BY
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:35:11 -0400
Received: from mail-mw2nam12on20629.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::629]:21249
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lyLNo-0000N5-Ez
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:35:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmGxwAhIg7zgR6PQrHtsFBJaHyIVE62qcqDa3b58CZ4Xt79OLumEWInpXJ4djHOy0fWBmdJnnlGxQpufLWyz6piUbXrmWfVtvfmZkP+Ww6ZcIGzXc99tGjaSuO2gj6F9c7LLiLsmX2gg4TcA7XZnC2b74/7jMXwpvUAW9SEdcQW2R7wb9DLmIwIzDRgtMg5cLoa/rvWdvaxdFFScSIlBi00Fs99Aer22Ir6+Aj5SB+O0ejtuJ24WgHBVFTXZGQWhFWzws0KzUOPNy3TL5QSw1FBi6mDiAkaUTolroxMSupYvJQANXsYhXNLe4WnARPaYBnjBl4ClcihfU2+IVHg1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fSHajc9DkSxIPY+SyTPVS7b0G1b/5vGb7bVt+xHFdg=;
 b=FUj8dX9ov2WBAHFaZjziycfXS//cSy3FJHKCEGisPA5nYx8MlcHlOkUGAEwRTJ3vvBAEj0R9CdYE0C8C/m7y8q51J8wWbfuXRHlBhPKT4dYQNfuj8fM+/yDe49VSSYwnjM74Om8M+ruSLXpbpJqhwvSrigQW18IfM91ab7C0wkaupA5BjM2jB1tPAhmCzzTENT7olul2vd28r3oru2Y6Fz5Tz+J9u4mn8TOmcLMP+/0DJ9PkStQ6USK8cBme3duvgGp0DAEf2Yf3EViymOSE8Uq4UVQ2R4CCC6Vw02uRBBJGx8u24q3nahJeAdPOnKSReAcbf+h2UDyMWDowLhI18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fSHajc9DkSxIPY+SyTPVS7b0G1b/5vGb7bVt+xHFdg=;
 b=hzYP0RgZz7xSvFfTyS1gU92B6+mYpePW73DyMO9DJ0eh8O6uVWdzDy8s13oq6gWg1CjTx5t+rBtAB/l2IcClkTR396IhMoBFI7YLKEgFgWm/FtL/eKr7HfKnL/8IntFOVlD5ewTAEQnh35aLpZj8FJhNEoO9usjXLY3MULc5Ty4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MWHPR12MB1757.namprd12.prod.outlook.com (2603:10b6:300:111::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 21:29:59 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::bdeb:29f3:2bf1:bfa7]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::bdeb:29f3:2bf1:bfa7%8]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 21:29:58 +0000
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, wei.huang2@amd.com
Cc: ehabkost@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 like.xu@linux.intel.com
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <5da16b31-6cf1-eabe-0e76-dbfbb0fc37da@amd.com>
Date: Tue, 29 Jun 2021 16:29:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNsoyqFvzXL0FXC8@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0701CA0015.namprd07.prod.outlook.com
 (2603:10b6:803:28::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.0] (165.204.77.1) by
 SN4PR0701CA0015.namprd07.prod.outlook.com (2603:10b6:803:28::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Tue, 29 Jun 2021 21:29:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcbe9889-1fb7-42b9-8441-08d93b450bc0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1757478710B07753C4FDBA5695029@MWHPR12MB1757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5J4pq2uft7wH7yHv0uonp5zy36ihP2AE8lGdADzN4tlcgv0JHZ/YKI/IPQ7DqqkPxKwQS/4pgBZ2B8uSW0B56Z4R9+a5OROflaiTk4ZuktCkIIZibfRpPlf8K6j2Wn77AoR+xp087Ol1ElRYv+0KAInwDVml9gGQExl30EGyVGlCQ3NV05IfupqPzh2xzEAJ0xaLx/tbi8QkVB2iubgVnNADogN0UZhtX9Jo2TfZ73WlUh2ag87xukWyoDZN4i+gHK/U4af5aZGT7j87alTHy62MABc/ubuy0QtK4xl2Xqqg5LUWR0IxTdyAmr3VqSLVyeJ6xZVwe/ZgjIGFDLyzCKu29NUoMC4ng+GGXrof0rxu6Qv9N7E4iCOecl170Ueqy2M+atU9586+BUbgztvplbK9M1jEvHlMSUqEIL9vmm1YcTMBtWnYkJWti753OOMcj2K7+BZN3rKjTe+Q0IV+6jKQCuA5wbm/Hj05t2OuiAjjXI9txUA3KSiZlp0kNeNhMgUyOQma3nJqMZ2qIS6yaigMqywCLJaTqMKXMgmBXER/Pwxt3ZxO2EGR3iiRJagjx5CQfVpKVyjtzA2OvuthHkoUuSJcAc6z8JU/e2vs8ql7IlEp1KHgRqiw/sDqv10ZWJ7Tja7xD6+/Iu+mc6sMH9zqlzOnAK6DXcXl7uSsA1Iif7YHCsjrA5kamsVJWLn2brJJBuDWE9+Qax8wAbq7a5YICFOw8V9tmvgSw5JonSS6Q/52NNwjnUcYLliWdwmoqunrPwTqg+0r3W8YDRzqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4553.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(8676002)(53546011)(31686004)(36756003)(2906002)(4326008)(44832011)(66946007)(6486002)(52116002)(478600001)(8936002)(6636002)(5660300002)(26005)(16526019)(38100700002)(38350700002)(83380400001)(66556008)(66476007)(110136005)(316002)(186003)(2616005)(31696002)(16576012)(86362001)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3RFSXNDS2NPWGU5VWRWc1pCODI5UnBMZTZhK1ZuWE1kZnM4Tnh4TitLdWhH?=
 =?utf-8?B?dEpIR2k5amc4bnJDRkpTT0xqblhPZHRRQmF0dkFEZ1JsOU5YRkNrdGcyMGZx?=
 =?utf-8?B?SWRSa3lvdC9Wa2E0ZDF2Nm1sRnlhNjhyWXQ1L2k5RlN1WlNJQTBoWkFNVE4y?=
 =?utf-8?B?Q21KV3JTNjhFdDl3dkYzUU43Q3luRktkYjV5dnFjRVZCM1lTeVpWajYzQXFH?=
 =?utf-8?B?YmlOajVUYUY3aVl2cHZuaSsvc3JxOXF3Snk0V1lLeHpWZzg1TE1ob1NVcFFU?=
 =?utf-8?B?TEtScmQvL3YxUGlQQTRYRFg0L25iQ3ZScllvSU9IOWc1M2lRNlBOSWhod0dK?=
 =?utf-8?B?YndoaUtkbGtiVXRka3p3LzJjeDlqT0IxTTFYb2dXU2xKNTl0Tlp5aDIrZlBr?=
 =?utf-8?B?ZUVkK0JVSGJjKy8zakt1RnhzaWx5R3Z1OUMvMGJJMmlwSGhjSTUwd2Q0aEJa?=
 =?utf-8?B?akttMytVdCs4YUpqVFBTRDFvYWRtVUFHdlRmSXpLYzlkbk9Mam5odVQwVFEv?=
 =?utf-8?B?c1VGV1dNTy81bnBoQlV2d04wNjl0VENodlRwWWZTLzBnbjN6WUFETHlMaVF4?=
 =?utf-8?B?Q3NWamlUbjl4RU5IZG1KYTU0ek0xMG1ZQXFvc1VkM3A5Ykx0ZXlJMEI1N2RF?=
 =?utf-8?B?UXhzTHhZSTZVRkVNSVgydUtNSEZsRi9jSzByKzl2dDRIL3ZEY3c2QUlwS0Fa?=
 =?utf-8?B?QmFmeGJQMC83dHFqWGt3WlYzN2xOQkJYaFJsaVByYXY2cmo1UVlMN1ArNC91?=
 =?utf-8?B?K2pGV2QvZ250bUNNYWE1VGpwZm9teVcwSjk1cm5yakZtdERYRE15Z2pheEhu?=
 =?utf-8?B?UEgvMEx5U1IwWDhJL2pQd1BlOVpacldieUw0TFQvdWtYa29DMG4vdktwQllQ?=
 =?utf-8?B?dTN3WFVmSnVDeWZET0h0bzkyS0JKaVJtN015VmJ5TGdKWko5ZEZ2WFk5TWlr?=
 =?utf-8?B?OHo3SmRaWTZrdEFQd2YwTkxNMTMrNFNEdTFOZ0FadnhIcEF0VEFTUVRlOFlD?=
 =?utf-8?B?ZE0zaFpvdHdsa1hYaE5hZDljL1FPbVcxdkNtVExvdndld1pEaHorZ0UyelJq?=
 =?utf-8?B?NjZ4TWtCd0tjeEZKUHhEeFl5V04yZjBjK3M2eUFteHRJZk9pZW9yWnI5akJ6?=
 =?utf-8?B?bFhYREJyaXVFai9HZnB5TTBqUVl6QnUzN2EwYTJGa3c1SmtrbWI1cEgwODkr?=
 =?utf-8?B?TmVOSGJkYTlWN29XTEs1cjA5K2JhakZvd1N4L1IxL3BLTUgzU09PUHF4dXBu?=
 =?utf-8?B?TlpCS1ljcWY1b1h1L1E5NHdXdTRtS2lTR1h1V0hSdTltMDRLZHkxQWIwSWxZ?=
 =?utf-8?B?TjI0WGpvR1U2VzBrcUlJZUtteUozcTNEVTdaNFNqNlVwSHl4d0FnTEQxNy9D?=
 =?utf-8?B?b3czeFR6cng4UEVDZXM3SjFERWhDR2ZkVnU0R0NxTlc3OVAvY1lsVGFyeUVZ?=
 =?utf-8?B?aEtkakVaNFpuanNwTmFCWWppZ0VuRmsyTmJJbGxuWENaaFltQU1oenJNTWtB?=
 =?utf-8?B?Ulk4MDNCd0F2S2RSUlpxc3ZrNUd5SFFvRUIzNmt0YjVwUlh6a3QxQXo5cXhv?=
 =?utf-8?B?Y3ZIMDNZYi9QbXlIb1R2b29HeEp5M1hGZ2N3a0RUcmpKVTh5QkgvSSt3WXNt?=
 =?utf-8?B?a2FkWC9WOG1US2l3ckd3UEt3RHBrN0VVaVVZYUZ6T1E5R0F3bXE0MXVNVm0x?=
 =?utf-8?B?Y2NmeUVvZzlDLzJyUXV4VzN2aUZVT0E1bjNQaTJNYmFOTHRqdG1rWDc3VVN2?=
 =?utf-8?Q?uceIQwnOBMAYvfou2jmklIouuGeMJav8WEIjI7Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbe9889-1fb7-42b9-8441-08d93b450bc0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 21:29:58.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmdUk1umk5eO6wBPvjlvNm3aKDJkN4AB6LRPklGV90zb06kbYwU8IM82eTBIYWU7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1757
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::629;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 6/29/21 9:06 AM, Dr. David Alan Gilbert wrote:
> * zhenwei pi (pizhenwei@bytedance.com) wrote:
>> A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
>> should not be changed to 0x1f in multi-dies case.
>>
>> Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
>> for multi-dies PCMachine)
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> 
> (Copying in Babu)
> 
> Hmm I think you're right.  I've cc'd in Babu and Wei.
> 
> Eduardo: What do we need to do about compatibility, do we need to wire
> this to machine type or CPU version?
> 
> Dave
> 
>> ---
>>  target/i386/cpu.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index a9fe1662d3..3934c559e4 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>>              }
>>          }
>>  
>> -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
>> -        if (env->nr_dies > 1) {
>> +        /*
>> +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
>> +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
>> +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.

The patch appears correct to me. AMD should use leaf 0xB to detect
extended topology. What is the problem here? Or is it just correcting the
cpuid based on the SPECS?

AMD uses nr_dies to simulate some topology. I dont know if it could become
a problem after this patch.


>> +         */
>> +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
>>              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
>>          }
>>  
>> -- 
>> 2.25.1
>>
>>

