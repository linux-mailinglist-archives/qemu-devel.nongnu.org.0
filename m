Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2A4838C5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:19:01 +0100 (CET)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VfQ-0005Tu-MB
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:19:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4Ve5-00044l-R6
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 17:17:37 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:34063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4Ve2-00082v-Ho
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 17:17:37 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7AAk-1mLQtE09r2-017YHF; Mon, 03 Jan 2022 23:17:32 +0100
Message-ID: <66c90d94-ca29-2ba3-3b17-4a7a58f1d296@vivier.eu>
Date: Mon, 3 Jan 2022 23:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: =?UTF-8?Q?T=c3=b5nis_Tiigi?= <tonistiigi@gmail.com>
References: <20211223064728.18048-1-tonistiigi@gmail.com>
 <20211223064728.18048-2-tonistiigi@gmail.com>
 <e506a0b4-2505-d136-53f8-c1bcafc204a1@vivier.eu>
 <CABn_tOmPjctnJU465R1b4ykRvryidj56rGeMKnaLJ+H3WAt8aw@mail.gmail.com>
 <CABn_tOn3aqXwPx2q173BEOTUoBjTtDLYuF34kf4mHbeAG+6+NQ@mail.gmail.com>
 <75604d1b-8cd1-b984-bcfe-c7c7d8d10728@vivier.eu>
 <CABn_tOnQTgTu3XUyvKWiKgm53ep_NiL=qz6qQcp2vjT7y6rsgQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 1/2] linux-user: add sched_getattr support
In-Reply-To: <CABn_tOnQTgTu3XUyvKWiKgm53ep_NiL=qz6qQcp2vjT7y6rsgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MSGrRVfmdKwAm1nLtHnjTdNx9SfpJkgIj/HnegRkSNG58eUjUAY
 rHq89+ABsVvjVa7SHNwl+QGbETZf1vMHNy6eYwHVh/nJwCoi6Q5fxYSkqLpi/8xYtPU4c3N
 5Cs6nIgR0rMb3km73cWA6qNc7kuUZSZXU+uaRl/zifFwyYDkujMy0tdSm1AiUjCmYC4MK14
 PYnECoav68nyISkfTnJiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PSIIrqLU6Zg=:HhOZ/lSbTsG13wLgKi2zED
 g8YGcERLG0La/1+7kWuwGCvf7LpUCB4fVdgvcT1yXa+cVeQKpz/jvyLhk1fyWBGV58OOboo1i
 7drsHTi+hqM47u/QNiWh2pVrIOnKPrESaE4zRw0VqS58eRmr1mgajVbXKfnRDmOTtiPSZ4Cao
 o53jgSzUnlMNQEYS06JadgyWnawqS3l7eJ0O8MAcjJpBX7PQ4u26/AeF61KKouCb78joS3QlH
 dbki4+WTj+X/dl6MC+vE1pVzotYr04ZpRLxjznzYWx9o4szYOC9QJCwCDPJvUxGjVO1UrQxkV
 ubcPlROw+BNrVA2ySD0RTbkKN8mGj9Zyi8dnZlzcC7vCKmiAN/7vLbOWmozZw0Q47fsWNjYfb
 kilBeejR4bMqtP67qZFjQkJJDkr8T8FAINBrfh0QtyzfN+Mv8bpZfF8uNmtUx4O6eEng/HZW4
 7iOo319h0H6HTToUlhuM3D2c6zeIV+sWsIJ8YcHE/C4Ilz+C22oAjXjHuROHAR4WyOA/A7U4Y
 EFaytdfea4Ab5aHjS4Nt8ecGISlw83twJ61xUxu4UfNj4pmV3mah/wOFqfgf2NOAACRlVuOaa
 VL+Pxz1ie445UW4EjV/3D1doWf7hKValJgSyqlrPLXV3ccFFa4P1OQ/b1Jo6Jf4ycA3JixKD4
 pwbQ9UKxCswerZRpcMJfzDEYwmvGILycDS/DgALu6TuxSHiJc6BX/d7ASqROD25Xfl3M=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/01/2022 à 20:31, Tõnis Tiigi a écrit :
> On Mon, Jan 3, 2022 at 10:37 AM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 03/01/2022 à 18:07, Tõnis Tiigi a écrit :
>>> Ping Laurent. Any suggestions for the follow-up questions?
>>>
>>> On Thu, Dec 23, 2021 at 3:00 PM Tõnis Tiigi <tonistiigi@gmail.com> wrote:
>>>>
>>>> On Thu, Dec 23, 2021 at 1:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>>>>
>>>>> Le 23/12/2021 à 07:47, Tonis Tiigi a écrit :
>>>>>
>>>>> Please copy here what you explain in PATCH 0 regarding this patch.
>>>>> (do the same for PATCH 1)
>>>>>
>>>>>> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
>>>>>> ---
>>>>>>     linux-user/syscall.c      | 94 +++++++++++++++++++++++++++++++++++++++
>>>>>>     linux-user/syscall_defs.h | 14 ++++++
>>>>>>     2 files changed, 108 insertions(+)
>>>>>>
>>>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>>>> index f1cfcc8104..2f5a0fac5a 100644
>>>>>> --- a/linux-user/syscall.c
>>>>>> +++ b/linux-user/syscall.c
>>>>>> @@ -339,6 +339,12 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
>>>>>>     #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
>>>>>>     _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
>>>>>>               unsigned long *, user_mask_ptr);
>>>>>> +#define __NR_sys_sched_getattr __NR_sched_getattr
>>>>>> +_syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
>>>>>> +          unsigned int, size, unsigned int, flags);
>>>>>> +#define __NR_sys_sched_setattr __NR_sched_setattr
>>>>>> +_syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
>>>>>> +          unsigned int, flags);
>>>>>>     #define __NR_sys_getcpu __NR_getcpu
>>>>>>     _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>>>>>>     _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
>>>>>> @@ -10593,6 +10599,94 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>>>>>             }
>>>>>>         case TARGET_NR_sched_getscheduler:
>>>>>>             return get_errno(sched_getscheduler(arg1));
>>>>>> +    case TARGET_NR_sched_getattr:
>>>>>> +        {
>>>>>> +            struct target_sched_attr *target_scha;
>>>>>> +            struct target_sched_attr scha;
>>>>>
>>>>> In fact, this scha is used with the host syscall, so it must be  sched_attr.
>>>>
>>>>
>>>> Where do you want me to define the "host variant" of sched_attr and
>>>> with what types for the properties? Or do you want additional
>>>> typedef(where?) so the name is less confusing? All properties in this
>>>> type are fixed length and identical for all architectures.
>>
>> It's better to use the host variant with the host syscall.
>>
>> Normally sched_attr comes with kernel headers, so it should be available and you should not have to
>> define it.
>>
>> We need to define a target property because alignment also matters as the alignment for type can
>> differ from an architecture to another. I agree that in most cases it should not be needed but I
>> think it's cleaner like that.
>>
>> so for this part, only replace "struct target_sched_attr scha;" by "struct sched_att scha;"
> 
> sched_attr is defined in linux/sched/types.h . I can't include it
> directly as it conflicts with libc headers with "redefinition of
> 'struct sched_param'". It looks like
> https://lkml.org/lkml/2020/5/28/810 attempted to resolve this conflict
> but was not merged and seems to be stuck in kernel vs glibc blame
> cycle.
>

So the best to do is to define a struct host_sched_attr (a strict copy of the kernel one) and use it 
with sched_getattr().

See for instance prlimit64 implementation:

163a05a8398b ("linux-user: Implement prlimit64 syscall")

it's a bit old, but it shows the main idea of a host structure for the host side, a target structure 
for the target side (we have introduced the abi type since).

>>
>>>>
>>>>>
>>>>>
>>>>>> +            if (arg2 == 0) {
>>>>>> +                return -TARGET_EINVAL;
>>>>>> +            }
>>>>>> +            if (arg3 > sizeof(scha)) {
>>>>>> +                arg3 = sizeof(scha);
>>>>>> +            }
>>>>>> +            ret = get_errno(sys_sched_getattr(arg1, &scha, arg3, arg4));
>>>>>> +            if (!is_error(ret)) {
>>>>>> +                target_scha = lock_user(VERIFY_WRITE, arg2, arg3, 0);
>>>>>> +                if (!target_scha) {
>>>>>> +                    return -TARGET_EFAULT;
>>>>>> +                }
>>>>>> +                target_scha->size = tswap32(scha.size);
>>>>>> +                target_scha->sched_policy = tswap32(scha.sched_policy);
>>>>>> +                target_scha->sched_flags = tswap64(scha.sched_flags);
>>>>>> +                target_scha->sched_nice = tswap32(scha.sched_nice);
>>>>>> +                target_scha->sched_priority = tswap32(scha.sched_priority);
>>>>>> +                target_scha->sched_runtime = tswap64(scha.sched_runtime);
>>>>>> +                target_scha->sched_deadline = tswap64(scha.sched_deadline);
>>>>>> +                target_scha->sched_period = tswap64(scha.sched_period);
>>>>>> +                if (scha.size > offsetof(struct target_sched_attr, sched_util_min)) {
>>>>>> +                    target_scha->sched_util_min = tswap32(scha.sched_util_min);
>>>>>> +                    target_scha->sched_util_max = tswap32(scha.sched_util_max);
>>>>>> +                }
>>>>>> +                unlock_user(target_scha, arg2, arg3);
>>>>>> +            }
>>>>>> +            return ret;
>>>>>> +        }
>>>>>> +    case TARGET_NR_sched_setattr:
>>>>>> +        {
>>>>>> +            struct target_sched_attr *target_scha;
>>>>>> +            struct target_sched_attr scha;
>>>>>
>>>>> scha is sched_attr as it is used with the host syscall.
>>>>>
>>>>>
>>>>>> +            if (arg2 == 0) {
>>>>>> +                return -TARGET_EINVAL;
>>>>>> +            }
>>>>>> +            uint32_t size;
>>>>>
>>>>> QEMU coding style doesn't allow to mix declarations and statements.
>>>>>
>>>>>> +            if (get_user_u32(size, arg2)) {
>>>>>> +                return -TARGET_EFAULT;
>>>>>> +            }
>>>>>> +            if (!size) {
>>>>>> +                size = offsetof(struct target_sched_attr, sched_util_min);
>>>>>> +            }
>>>>>> +            if (size < offsetof(struct target_sched_attr, sched_util_min)) {
>>>>>> +                if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
>>>>>> +                    return -TARGET_EFAULT;
>>>>>> +                }
>>>>>> +                return -TARGET_E2BIG;
>>>>>> +            }
>>>>>> +
>>>>>> +            if (size > sizeof(scha)) {
>>>>>> +                for (int i = sizeof(scha); i < size; i++) {
>>>>>> +                    uint8_t b;
>>>>>> +                    if (get_user_u8(b, arg2 + i)) {
>>>>>> +                        return -TARGET_EFAULT;
>>>>>> +                    }
>>>>>> +                    if (b != 0) {
>>>>>> +                        if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
>>>>>> +                            return -TARGET_EFAULT;
>>>>>> +                        }
>>>>>> +                        return -TARGET_E2BIG;
>>>>>> +                    }
>>>>>> +                }
>>>>>> +                size = sizeof(scha);
>>>>>> +            }
>>>>>
>>>>> I guess this is the code to mimic kernel copy_struct_from_user(), the part when usize > ksize.
>>>>>
>>>>> It's a little bit ugly, but I can't disagree because the kernel does the same.
>>>>>
>>>>> except that the kernel check for unsigned rather than for 8bit. Could you change that?
>>>>
>>>>
>>>> You mean "unsigned long" like in
>>>> https://github.com/torvalds/linux/blob/76657eaef4a759e695eb1883d4f1d9af1e4ff9a8/lib/usercopy.c#L57
>>
>> yes
>>
>>>> ? That would mean that this code needs to be much more complicated to
>>>> handle the cases for the unaligned start and end bytes, need
>>>> aligned_byte_mask helper etc. Even though kernel seems to have extra
>>>> code for these cases iiuc it can still get EFAULT on specific
>>>> conditions.
>>
>> OK, I don't want too complicated code here, so I think we can keep your version.
>> But could you move this code to a function?
> 
> Sure, but could you tell me where do you want it defined. syscall.c
> does not seem to have generic helper functions and current helpers
> seem to be macros in qemu.h . Also, are we talking about a function
> like check_zeroed_user() or a variant of lock_user() with two size
> parameters(or lock_user_struct() with extra size param)?

You can put it in syscall.c, and I'm thinking more about a function like check_zeroed_user().
But feel free to do as you want, and if you think it's not a good idea to have a function you can 
keep the code as is.

Thanks,
Laurent

