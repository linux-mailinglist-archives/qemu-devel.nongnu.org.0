Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0F46830E0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsDD-0003Aq-34; Tue, 31 Jan 2023 10:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsD3-00030E-Fk
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:06:13 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsCx-0002Ca-1a
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:06:07 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N1fzM-1ocq8W0WpE-011wTL; Tue, 31 Jan 2023 16:06:00 +0100
Message-ID: <e3a4c23e-ee63-02f7-7cb8-76a344f096f8@vivier.eu>
Date: Tue, 31 Jan 2023 16:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <Y9Q7BlDc/VX+1SBL@p100>
 <521ea804-5afc-fb19-db72-e1ed73300781@vivier.eu>
 <79a67002-0294-3a87-41ed-82bbb2689bf0@gmx.de>
 <e4f75988-4906-bce9-5617-9014d8b45b2b@vivier.eu>
 <871b2b31-a04a-254a-bced-f07fa821109a@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <871b2b31-a04a-254a-bced-f07fa821109a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kFkd4B/iVGDzqrLcMUIIckxUnw6fJ8oVvoLddNqls7cygK3Dg4W
 QF8NgIievrD9rcH7vA1+vDYZ+mrH5Oni98GWUOIxVK2bKA45z6cSZRCbgBxUHnMlMSuqWr3
 3RLgMkLBGHT3XaUMbkQSqV86yyFk0NvH+xxtiuKMsgwt3oBBI5TS8H2qc2cnE2RXWP8RNxk
 BUVIAsrJfuUx9CTC9y/sQ==
UI-OutboundReport: notjunk:1;M01:P0:OLUzjD6uR6o=;4DrzzWCdyMyitGn2PgE2GMbIgim
 WVgVBtN5zqqfHnjSc/U+qek4B/DMiAMZcXP+JqSPqTj/2pq2uiVsKXpwJa6Dp3HXGi4Hs43qC
 c4cDT29nhl4itiNo2g/7+emPcsspfzTdBYqwWhZ8Zrv3cguJP941FBS9d+eYrV1XaM0RgqhD/
 kHlpUKdC1OMCN/qctnFVuVPpQ5KnYcg7CahXTLI4BWi8jsDSBqnqNtLqYXDftq+Ml24bmv53W
 REGvDVlpGy/iFtiQV+tEH53NViUXfb6PBBR+OdUAxxAhPAOW0LYMdMip89s+hM85Bc9ulfdNU
 1y4lXiiEsj1SbprLqwfjqiRP3invkw9H5eYywtxdoOxWkrYL073Jt0J8oBhNnTuqq/LHo7NPN
 NyZ7KsXmKudGUSnjYC6IDwjvgIf7+ecNR1ud8beuD+ekEZzEUQlEWt9ysKL24HwFi6XiP4JNv
 VkxogoXhqqHdv1QUUvfdFW7fBwcFxxnfk3ZQZzBkQtq1sE8HuGh6E902PclB8y33iUQ6NS+CE
 Ay7HzJ677vQPCJJcZsE5yBCFqLQuj+43JzVDdMnsjQNpTAc0vs1QT+/6I7Q3LGDB9WcZtfDwA
 uCipiY4UHVGMohSovq9gQ1BA56YYmmN6f7gdyHxbN7V7gLeZrD9WWij9tECFKaF+w7VnZQyKS
 iSUkhm2VNKs+SiG3vDoeFf9qFhc/uhp2W7b+zOp0Dw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 31/01/2023 à 14:08, Helge Deller a écrit :
> On 1/31/23 12:04, Laurent Vivier wrote:
>> Le 30/01/2023 à 23:11, Helge Deller a écrit :
>>> On 1/30/23 10:26, Laurent Vivier wrote:
>>>> Le 27/01/2023 à 21:58, Helge Deller a écrit :
>>>>> Make the strace look nicer for those two syscalls.
>>>>>
>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>> ---
>>>>> v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent Vivier
>>>>>
>>>>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>>>>> index 82dc1a1e20..379536f5c9 100644
>>>>> --- a/linux-user/strace.c
>>>>> +++ b/linux-user/strace.c
>>>>> @@ -3824,6 +3824,25 @@ print_rlimit64(abi_ulong rlim_addr, int last)
>>>>>       }
>>>>>   }
>>>>>
>>>>> +#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
>>>>> +static void
>>>>> +print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *name,
>>>>> +           abi_long arg0, abi_long arg1, abi_long arg2,
>>>>> +           abi_long arg3, abi_long arg4, abi_long arg5)
>>>>> +{
>>>>> +    if (regpairs_aligned(cpu_env, TARGET_NR_pread64)) {
>>>>> +        arg3 = arg4;
>>>>> +        arg4 = arg5;
>>>>> +    }
>>>>> +    print_syscall_prologue(name);
>>>>> +    print_raw_param("%d", arg0, 0);
>>>>> +    print_pointer(arg1, 0);
>>>>> +    print_raw_param("%d", arg2, 0);
>>>>> +    qemu_log("%lld", (long long)target_offset64(arg3, arg4));
>>>>
>>>> better to use:
>>>>
>>>> print_raw_param("%" PRIu64, target_offset64(arg3, arg4), 1);
>>>
>>> I thought of that as well, but that won't work, as print_raw_param()
>>> takes an "abi_long" value, which is just a 32-bit value on 32-bit targets.
>>> See print_rlimit64(), it's used there with qemu_log() as well.
>>
>> Yes, you're right.
>>
>> But even with qemu_log() I would prefer you use "%"PRIu64 rather than %lld.
>> Or better define a print_raw_param64() (or similar) and update print_fallocate(), 
>> print_truncate64() and print_ftruncate64().
> 
> As adding such define is a unrelated change to this patch, I'd propose that I send a follow-up
> patch on top of this one which adds print_raw_param64() (or similar) and replaces all
> usages of qemu_log() with 64-bit values and use "%"PRIu64 then.
> Ok?

yes

> If yes, should that define include the last 0/1 parameter to print the "," ?
> I think so, because then it's consistent with print_raw_param().

you're right.

Thanks,
Laurent
> 
> Helge
> 


