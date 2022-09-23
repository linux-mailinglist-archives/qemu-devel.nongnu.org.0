Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE225E81EC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:44:02 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obneb-0005Xm-AT
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nb91605@student.uni-lj.si>)
 id 1obn8q-0001QW-1K; Fri, 23 Sep 2022 14:11:14 -0400
Received: from mail-db5eur02on2124.outbound.protection.outlook.com
 ([40.107.249.124]:41664 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nb91605@student.uni-lj.si>)
 id 1obn8n-0006fp-Dp; Fri, 23 Sep 2022 14:11:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iw5oz3yNG+yaFhcRzHCAD0FB7dWvxxeyS0YCkM2sjDwKTiwevvManeMNKa01nlaLKAyY6exAAevSWOi/+ewHJXivUdvhbnT1v921itEA0GHQmB93OPllGZmmM6KWoOZK5fE0mikdNhBS/azGFzFPUrdP8y+qewuQtQ6Oop1LFU6wUmLrFJF32s0wy9wTD6nA4DAlnLtcwLExt9HcUgRVpM8+Og/6yYpok5J/TgocoUZUWpxgd8eETs8YsSD0sTxY1g7rd1LWI25w6c3wSEqJY9e3mCobHg2whzlQPXqXRzIeLz6RmiyfG9MzGnBw7rv/MLrf2mAA/DJwrNsrzW3eHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbucMRn8cdkfI609T7dfL9QU2LiqJSOAlh6I3Imen40=;
 b=G18ITmRPKtE7LkkrRXMjyx//n6VZ6iKYQyTbeXsUQUrzZAFSGLeW01VUqDHrscM5CiC1CGttS8Iz1t4RsKbsyySNW0HTZby1Cq9Z/VBC/77ILF5IWmU/uhY01afjfuxuvCkMaTIblOUqTWbP/VvYqhMCYenhRXVAbYry25Ubb5y5Q9HiBysZMY3+p8qTMzyZKrOMZd2dmuGreZY3HPEy/VIAzOSJAsz4UlFrJnMHZPVSjxOEm2c1qaDUHmx9hgrhacXVr9u9rClZ72/Un6EpMkMvgrXEAVIou6PPht9Z+tuvuf64lAG9C2/mwa1Q9C0q6g4jr/Y+zLtMo9tzVMYYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uni-lj.si; dmarc=pass action=none
 header.from=student.uni-lj.si; dkim=pass header.d=student.uni-lj.si; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilj.onmicrosoft.com; 
 s=selector2-unilj-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbucMRn8cdkfI609T7dfL9QU2LiqJSOAlh6I3Imen40=;
 b=lTpUxhplLw6OtFKXwGg9G9C33zKDi3z/aJBfymqmqbRaK+fuDyVDvwk5IfwyJnobAp9GgP//cx1PR8nAKuOGcOjO/efnVdEAs0CJsHEpHFnUbvishqKRidzd9ILaarChi0SSuXPM9+A1aqLTx4qkNw60oBe4dqyJ9ay1Xtinjpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=student.uni-lj.si;
Received: from AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5aa::21)
 by VI1PR10MB3709.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 18:11:03 +0000
Received: from AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59c1:9a43:2c70:6774]) by AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59c1:9a43:2c70:6774%4]) with mapi id 15.20.5654.016; Fri, 23 Sep 2022
 18:11:03 +0000
Message-ID: <ba56cadd-cc55-52a3-97cc-ee7c3e0e1dd4@student.uni-lj.si>
Date: Fri, 23 Sep 2022 20:11:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] arm/monitor: add register name resolution
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220910141213.111154-1-nb91605@student.uni-lj.si>
 <CAFEAcA8Up7DN1J7hLiXmuWhA-Ni3PKu7pUr=D_fPjqqzuqQMNw@mail.gmail.com>
Content-Language: en-US
From: Nikola Brkovic <nb91605@student.uni-lj.si>
In-Reply-To: <CAFEAcA8Up7DN1J7hLiXmuWhA-Ni3PKu7pUr=D_fPjqqzuqQMNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0246.eurprd07.prod.outlook.com
 (2603:10a6:802:58::49) To AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR10MB7043:EE_|VI1PR10MB3709:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d09d17-a636-4653-1609-08da9d8ef9d1
X-ETR: Bypass spam filtering for student.uni-lj.si
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivHKREc8c0a6fYpcKKWQ5YWi3TIqIBnHqDW3bKUX+iVGhIMiK96oIUjwg/HlKByfW5VWbE1aT2Nenm5IP/Ud/nrfeY1f/r6EI4iau8oXofkJelQ2cKMqgrDwiiPhGUd5wm5CZ5dnRoTM4j8I9IMrr4L8oovLmb3EnXWZpFRszxE9o/uYGaSiALMNL2JtXx/v9TU1DDN+b8HOo4/6attYnOca6IfudBgFazYrowo6yPcK/qu495XCPjmyLsPHpqAewo3XZJyEPrTYrxrTthYhg9ILJiCizaIMsMxDdS+GCVKqwh25AjxO4fH3q4dHyCYZhkDR6R5MCVcZ1zMAWhSo/bl3DN0dy4kxfdRdsQbnqrmPMlfqZhzKApIn97izNhZgIl35t//dFK+hHEuRlM2IFYlISK5QlgeIn+Q/XjSPbmU75iSj1qPyedOewCueILMkS0n+AyeFPiePq5fO4sgl82PbNiZ797SEa6znr0IetnTT/dZbS/EUgOWhSUm5K8LDPYVQ9ZH/5rrbiAy/sNxu886ekjFZ/8hBTkevSv4kMrEqSA8c8doGTL3EO//Ds09Asvv/Xuuw15nxZlMLHesumNZEK86hb7vHHWW86HZuyFHJXYoTJc4WMlu1Mx5mUkpeleIsGm9qiFm02Obs6jnXFsXQhC5oOpuw4J1VJ8mwK4Gx5djtZeIkaO7R2D9W2aP8XfUM9SL9nRj4gYISKO8J0y4j+wwp2p4hcN0e6Gqe1gQXcCNoc25bhUB3x1JMgNpEODJR9nUIQ9BELXRqU5yhaqu06a70l624UlMVQId4pCR2vxv18Pas2Zfd+LY9mgv1RxNyXFu6B+HpCmE2GtL6robzl1oKwxkx+XgyrfxsNq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(6916009)(8676002)(316002)(8936002)(66556008)(66946007)(6486002)(66476007)(478600001)(5660300002)(26005)(786003)(6506007)(6512007)(4326008)(41320700001)(53546011)(2616005)(86362001)(83380400001)(41300700001)(966005)(2906002)(31696002)(186003)(52116002)(31686004)(38350700002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVQyUmtqc2tYTHlHZlI1dit3NmwrSnJrQmpOdFFiRlQwREh0cC9Vb3N1TmN4?=
 =?utf-8?B?S0h4S0Z6UWxYaytpYm1VVVR1NFNJU0k5K2dJZmJnelg0dy9QN20ybysyUlEz?=
 =?utf-8?B?aGs0R2plZ0MzeWU5OURLdFpKMUVRSnpHYytEL094LzlzbTh0M25YQ2ROdkVY?=
 =?utf-8?B?RWlETU5YQjhkTUx1dE1mSFNOQUlnbjdxb3l2MWpRMGpFTHpzTHA3c0RCUmox?=
 =?utf-8?B?MVFxWjAyL0dwdXhMNzQyTDlVbm80dXl0V1NDSHVGc3NicnJaaUlxS2RNZ1Av?=
 =?utf-8?B?b0lLQ3NQVE9GU2RxTTFsWXcwWWJTeUdJREZwSkRPNU05bDFwdXZTaWVTcGRy?=
 =?utf-8?B?N3pVWDROZ0hUVmZzdHo0alNNcUs3NGlmZGRwQkU0ckYyUTJnZjRaVXpFelZG?=
 =?utf-8?B?azc1ellSdkliZ01ESHRyMnd4V1FndlJOUEpqVlZOZmpFMHZTMjg2MFVEWGdh?=
 =?utf-8?B?NjZ3K2xnaWtIT2FPd2h1NmZwaytJajR0MktsemFkTHNFZnpVbVhiVllZc254?=
 =?utf-8?B?ckxWQ1JYUmk1TUE5UE1KVFFLakxMamhQdEJ0Vk5jTHZmT3NoZ3lSeG52MFVw?=
 =?utf-8?B?SFgwQ1JVRW1QdUpCeGNFMHZuTkFGWWNORkdRRW9uN0FOUkJMcmc0VHFlSHFX?=
 =?utf-8?B?SjV0UHhVdnNTbHZYN3hNT0VzeWVnV05JNjlVQVB6eFBjV0JsYWdPajlWU01t?=
 =?utf-8?B?elQ4elA0MitnbzExTzNtMit2QmkzQXdpNi80WkdqeVJMUzBVait3dUE3dEg4?=
 =?utf-8?B?cDZzWXJnUkh3b0wvNkNzYjJQUDFsWU9KYjIzc2t6QW1pWE1WTi9JN2hWdkdO?=
 =?utf-8?B?bmszSFFZQ1RWUE9IZ0ZPK05hRDhsa1VnTkhhY2djUVhRVFZidU9tdDc4R0xO?=
 =?utf-8?B?MDJxZjN1a0I5STVpVlF0cTlOVlA5T0l4NVk4VUZTTnQwN09GUmpvRVZRMkh6?=
 =?utf-8?B?R0kxKysxcm9GSitOTTVZeXduUC9pYmE5bEtXY1VoNDdKbncwVmNQR1V1Mys1?=
 =?utf-8?B?Q1FnanZMYnNzYlNub3N0R2Yzc3RIT0lSYU5vSUhZbFAyeG1USUhybU84T1pD?=
 =?utf-8?B?bUJqdUpqNU01QUJsaVY4ekIvTS9nMjA5aUtEaEV6aFpmUVJ5cy9QTlB0djFq?=
 =?utf-8?B?bzVQK0hvUXhGbHYyTVo1cXNyMGppRCs2UEZndGZNQ29JbTJqRUpTK1RQV0lJ?=
 =?utf-8?B?cnoreDhVekNPUGYyaDJYckFHck9XT2phUjhmdUFUS0szUGFTVjl4aGQvSmZ5?=
 =?utf-8?B?ZkpqdmdwMjN4UURwbVBLZkNLN1hFT2J6WjlZRWVxOE1Qb3hwRDNhSEFwVFg0?=
 =?utf-8?B?Y01qYllUYVoxdm4vS3c5NE13U2FVUEI5NkxsbUNLa3VESW9rZllNaXA3ajZa?=
 =?utf-8?B?SWNNaWc1ZE8zNFl0Qy9tMEJHQWZudjQwMHhTZmJHZFhMS05qOGpVQ1pGMU5F?=
 =?utf-8?B?cGhWS1ZuUU5KUXFQUldpTWZsemgyMGxoa1Q2Q2VmdTg1Um95WGxQZGlydWN1?=
 =?utf-8?B?SSs4ekdqU0pHZVdxdWwwbm5FUkdDVVc2ekZPRGc2WXhsdFR6V2NrVHRKUTZZ?=
 =?utf-8?B?NkhVWTcrNEVEM3hWckp0NlRBcUI1dXlpcWk3ZU1GSkdyeHFudnN1Mmp3UDJ0?=
 =?utf-8?B?VFlLOVpYWjBxaHhFdGRLQ3BVUTJ3QjZoTko4ckdnT0J1ejFIdzBzdk5zRGx1?=
 =?utf-8?B?Z1VGdzhFTXUwQ21WME84SzNCby90ZllLaTd6RmgxYk84ZHdyUmVYSXNGczFv?=
 =?utf-8?B?TWpWTzhPTS90QXNmR0YvdXNlK2E0MlovUGNRTE1QOTU1bGdkS00vNWg0ZHdX?=
 =?utf-8?B?TTVTOEtSUW43K2tTK09paGl3eXNGb1pweFdudmhWc2U1VmJielE5SjVHSUQ3?=
 =?utf-8?B?VkY1UnpDTXdsN2p0TFJEbFJPVS95Q21ENHF4S3doc1VNRzltUGhTci9mZURC?=
 =?utf-8?B?UGpKcHYwSDl1N0s5WXVDZ2F5SVByZEcxQkF1QVRMQnVJNEJoSWhHWDlnV0Jy?=
 =?utf-8?B?Nlc4YjFPMUxTZkhLLzZldmw1M0Jrd3N5bURnVEZEL2NXeEVyWlRyZzJseHBV?=
 =?utf-8?B?Nnp4RTlHNkE2ZStNYjlhaHE1M2dBLzNxOVFqcGs5dllyM2JpbWpORkpRRE5r?=
 =?utf-8?B?Mnp2SnFqZGpPSlgvRC9TZTRQenRVYnVWc2VBV1Jpd0pXRGR2U1RFZDVlaWF5?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: student.uni-lj.si
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d09d17-a636-4653-1609-08da9d8ef9d1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 18:11:02.9742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a6cc90df-f580-49dc-903f-87af5a75338e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zmtUOSrqWRSFcX+MXI8jVTXI4H4SHNbjWBSXQGPdd6zYr5N/qF1qsxsETmWCEczuf7nmB37w1waQPjJNjuBHypEOX7naETE1shYU2qFTBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3709
Received-SPF: pass client-ip=40.107.249.124;
 envelope-from=nb91605@student.uni-lj.si;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, thank you for your feedback.

The choice of registers was relatively arbitrary, I chose registers
that would be accessible and valid under all profiles and not part
of the CP15.

I will look into how this could be implemented through gdbstub,
as I was not aware of that possibility.

Kind regards,
Nikola

On 9/22/22 15:15, Peter Maydell wrote:
> On Sat, 10 Sept 2022 at 15:14, Nikola Brkovic <nb91605@student.uni-lj.si> wrote:
>> This patch allows the monitor to resolve the
>> stack pointer, instruction pointer,
>> system status register and FPU status register
>> on ARM targets.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1145
>>
>> Signed-off-by: Nikola Brkovic <nb91605@student.uni-lj.si>
>> ---
>>   target/arm/monitor.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
>> index 80c64fa355..143c95bca4 100644
>> --- a/target/arm/monitor.c
>> +++ b/target/arm/monitor.c
>> @@ -31,6 +31,7 @@
>>   #include "qapi/qmp/qerror.h"
>>   #include "qapi/qmp/qdict.h"
>>   #include "qom/qom-qobject.h"
>> +#include "monitor/hmp-target.h"
>>
>>   static GICCapability *gic_cap_new(int version)
>>   {
>> @@ -228,3 +229,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>
>>       return expansion_info;
>>   }
>> +
>> +static target_long monitor_get_cpsr(Monitor *mon, const struct MonitorDef *md,
>> +                                    int val)
>> +{
>> +    CPUArchState *env = mon_get_cpu_env(mon);
>> +    return cpsr_read(env);
>> +}
>> +
>> +const MonitorDef monitor_defs[] = {
>> +    { "sp|r13", offsetof(CPUARMState, regs[13])},
>> +    { "lr|r14", offsetof(CPUARMState, regs[14])},
>> +#ifndef TARGET_AARCH64
>> +    { "pc|r15|ip", offsetof(CPUARMState, regs[15]) },
>> +#else
>> +    { "pc|ip", offsetof(CPUARMState, pc) },
>> +#endif
>> +
>> +    /* State registers */
>> +    { "cpsr", 0, &monitor_get_cpsr},
>> +    { "fpscr", offsetof(CPUARMState, vfp.fp_status)},
> Hi; thanks for this patch. Unfortunately, it doesn't look to
> me like it handles the fact that 64-bit vs 32-bit is a runtime
> question, not a compile-time one:
>
> (1) if this is a 64-bit CPU executing AArch64 code then we
> shouldn't be resolving sp/lr as regs[13] and regs[14]
> (2) if this is a 64-bit CPU executing AArch32 code then
> we shouldn't be resolving pc/ip as env->pc.
>
> As a more minor bug:
> (3) fpscr isn't only in vfp.fp_status, it's more complicated
> than that -- you need to call vfp_get_fpscr().
>
> Also, why only these registers ?
>
> As a wider design thing, I'm not really a fan of target_monitor_defs():
> it's the kind of quick hack that got added to QEMU decades ago
> when we supported about three different target architectures but
> which doesn't scale to the set we support now. It would be nicer
> to be able to tie this into the existing gdbstub support code for
> reading and writing registers. (Though that too has issues with
> CPUs which support multiple modes like AArch32 vs AArch64).
>
> thanks
> -- PMM

