Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4772C483719
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:42:34 +0100 (CET)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SHw-0001IY-Rg
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:42:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4SDL-0008M4-TK
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 13:37:47 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4SDJ-0008N3-Mz
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 13:37:47 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N33ZD-1mPbC410nN-013RQp; Mon, 03 Jan 2022 19:37:41 +0100
Message-ID: <75604d1b-8cd1-b984-bcfe-c7c7d8d10728@vivier.eu>
Date: Mon, 3 Jan 2022 19:37:40 +0100
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
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 1/2] linux-user: add sched_getattr support
In-Reply-To: <CABn_tOn3aqXwPx2q173BEOTUoBjTtDLYuF34kf4mHbeAG+6+NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rz63a4LYeqL+UH2o8ujZpCSDoLXXbxMKp5LWfJ9jboNfE48zsbe
 FPLMZCYLpPoZqg05PZlO3IkPh+nZNam+nByEKWlqqF1CUUDSbKZTtTVhHi+WIWSEo/aeXf8
 Fla+burTwxMKMXfqUkJu6EB3vd6FkQtsJ2vFWniyhJQhPLCD8yWy9+FdundFnDuF0j09aDw
 0iQ7Ymi3mgF5PLm4MU21g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:amjpEhQqtsU=:YRNQjb/QY8fTguwwHWQdv9
 3NRx3jMkqBxdc/cdUVA6ACY4259Ah2Amj6zj/sHYQZVOrisAompzsY5H8Ob+eV4+ndUpFOOZr
 JpC4XuEQL3g60b6/vN8J5fxHcQfDo7vFyoKeOQm6K4GFrti/abSwRCJXPBADKgwlmmI8PyC0D
 4jeOhUDciZoitsIi+/5bIfYZri7LFwzZGdQy5dpijUJubcV/atf4AjrkIHbVkq+Nh6lHyaqny
 tL0viKqhAbmECWwz/CHipQVMnfcswXspB8aSVr9oXhwVRFVFqluLE3g1eXY8HD3SGTYEMvIfH
 W53K+rJk4hOGl7zzXa2vh6+SV6y20yzKDvvDncdNnCn7QogxFCjmsk54CxG2Buzq7/FevyfLs
 nRgbKqycaYT5qO0d/y/7Y5AdCNyGfnIK0EGiY2P4nQBlA8r/vsI2y1UfGK7bqAOYKtUodOffk
 X70zhPSRRvwukq9bof70iuWTxSbE8WzP/bRQVLhSvX9xuZOImRuwP9cjazmXF00vkptg0N6wj
 ZSrmV5rPNdGUxfry3ELX2rDZApmT61ujMmljuGxBx55U0+JzjaFmkYX4ow6pX90oXKwKOJdXh
 j2cz32m4CZBp/10tKyERmxHIZJtQcYch4UXYATE+wV9bXZ2vI1Dr4WqQNzxYeExezKFkS5asP
 yISSzc+tfaR8EF5GlPmSAuAwsu1nmV7/FeDxCEaucJ6NDv/MfosSNK1c6GP41Q4werH8=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Le 03/01/2022 à 18:07, Tõnis Tiigi a écrit :
> Ping Laurent. Any suggestions for the follow-up questions?
> 
> On Thu, Dec 23, 2021 at 3:00 PM Tõnis Tiigi <tonistiigi@gmail.com> wrote:
>>
>> On Thu, Dec 23, 2021 at 1:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> Le 23/12/2021 à 07:47, Tonis Tiigi a écrit :
>>>
>>> Please copy here what you explain in PATCH 0 regarding this patch.
>>> (do the same for PATCH 1)
>>>
>>>> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
>>>> ---
>>>>    linux-user/syscall.c      | 94 +++++++++++++++++++++++++++++++++++++++
>>>>    linux-user/syscall_defs.h | 14 ++++++
>>>>    2 files changed, 108 insertions(+)
>>>>
>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>> index f1cfcc8104..2f5a0fac5a 100644
>>>> --- a/linux-user/syscall.c
>>>> +++ b/linux-user/syscall.c
>>>> @@ -339,6 +339,12 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
>>>>    #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
>>>>    _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
>>>>              unsigned long *, user_mask_ptr);
>>>> +#define __NR_sys_sched_getattr __NR_sched_getattr
>>>> +_syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
>>>> +          unsigned int, size, unsigned int, flags);
>>>> +#define __NR_sys_sched_setattr __NR_sched_setattr
>>>> +_syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
>>>> +          unsigned int, flags);
>>>>    #define __NR_sys_getcpu __NR_getcpu
>>>>    _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>>>>    _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
>>>> @@ -10593,6 +10599,94 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>>>            }
>>>>        case TARGET_NR_sched_getscheduler:
>>>>            return get_errno(sched_getscheduler(arg1));
>>>> +    case TARGET_NR_sched_getattr:
>>>> +        {
>>>> +            struct target_sched_attr *target_scha;
>>>> +            struct target_sched_attr scha;
>>>
>>> In fact, this scha is used with the host syscall, so it must be  sched_attr.
>>
>>
>> Where do you want me to define the "host variant" of sched_attr and
>> with what types for the properties? Or do you want additional
>> typedef(where?) so the name is less confusing? All properties in this
>> type are fixed length and identical for all architectures.

It's better to use the host variant with the host syscall.

Normally sched_attr comes with kernel headers, so it should be available and you should not have to 
define it.

We need to define a target property because alignment also matters as the alignment for type can 
differ from an architecture to another. I agree that in most cases it should not be needed but I 
think it's cleaner like that.

so for this part, only replace "struct target_sched_attr scha;" by "struct sched_att scha;"

>>
>>>
>>>
>>>> +            if (arg2 == 0) {
>>>> +                return -TARGET_EINVAL;
>>>> +            }
>>>> +            if (arg3 > sizeof(scha)) {
>>>> +                arg3 = sizeof(scha);
>>>> +            }
>>>> +            ret = get_errno(sys_sched_getattr(arg1, &scha, arg3, arg4));
>>>> +            if (!is_error(ret)) {
>>>> +                target_scha = lock_user(VERIFY_WRITE, arg2, arg3, 0);
>>>> +                if (!target_scha) {
>>>> +                    return -TARGET_EFAULT;
>>>> +                }
>>>> +                target_scha->size = tswap32(scha.size);
>>>> +                target_scha->sched_policy = tswap32(scha.sched_policy);
>>>> +                target_scha->sched_flags = tswap64(scha.sched_flags);
>>>> +                target_scha->sched_nice = tswap32(scha.sched_nice);
>>>> +                target_scha->sched_priority = tswap32(scha.sched_priority);
>>>> +                target_scha->sched_runtime = tswap64(scha.sched_runtime);
>>>> +                target_scha->sched_deadline = tswap64(scha.sched_deadline);
>>>> +                target_scha->sched_period = tswap64(scha.sched_period);
>>>> +                if (scha.size > offsetof(struct target_sched_attr, sched_util_min)) {
>>>> +                    target_scha->sched_util_min = tswap32(scha.sched_util_min);
>>>> +                    target_scha->sched_util_max = tswap32(scha.sched_util_max);
>>>> +                }
>>>> +                unlock_user(target_scha, arg2, arg3);
>>>> +            }
>>>> +            return ret;
>>>> +        }
>>>> +    case TARGET_NR_sched_setattr:
>>>> +        {
>>>> +            struct target_sched_attr *target_scha;
>>>> +            struct target_sched_attr scha;
>>>
>>> scha is sched_attr as it is used with the host syscall.
>>>
>>>
>>>> +            if (arg2 == 0) {
>>>> +                return -TARGET_EINVAL;
>>>> +            }
>>>> +            uint32_t size;
>>>
>>> QEMU coding style doesn't allow to mix declarations and statements.
>>>
>>>> +            if (get_user_u32(size, arg2)) {
>>>> +                return -TARGET_EFAULT;
>>>> +            }
>>>> +            if (!size) {
>>>> +                size = offsetof(struct target_sched_attr, sched_util_min);
>>>> +            }
>>>> +            if (size < offsetof(struct target_sched_attr, sched_util_min)) {
>>>> +                if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
>>>> +                    return -TARGET_EFAULT;
>>>> +                }
>>>> +                return -TARGET_E2BIG;
>>>> +            }
>>>> +
>>>> +            if (size > sizeof(scha)) {
>>>> +                for (int i = sizeof(scha); i < size; i++) {
>>>> +                    uint8_t b;
>>>> +                    if (get_user_u8(b, arg2 + i)) {
>>>> +                        return -TARGET_EFAULT;
>>>> +                    }
>>>> +                    if (b != 0) {
>>>> +                        if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
>>>> +                            return -TARGET_EFAULT;
>>>> +                        }
>>>> +                        return -TARGET_E2BIG;
>>>> +                    }
>>>> +                }
>>>> +                size = sizeof(scha);
>>>> +            }
>>>
>>> I guess this is the code to mimic kernel copy_struct_from_user(), the part when usize > ksize.
>>>
>>> It's a little bit ugly, but I can't disagree because the kernel does the same.
>>>
>>> except that the kernel check for unsigned rather than for 8bit. Could you change that?
>>
>>
>> You mean "unsigned long" like in
>> https://github.com/torvalds/linux/blob/76657eaef4a759e695eb1883d4f1d9af1e4ff9a8/lib/usercopy.c#L57

yes

>> ? That would mean that this code needs to be much more complicated to
>> handle the cases for the unaligned start and end bytes, need
>> aligned_byte_mask helper etc. Even though kernel seems to have extra
>> code for these cases iiuc it can still get EFAULT on specific
>> conditions.

OK, I don't want too complicated code here, so I think we can keep your version.
But could you move this code to a function?

>>>
>>>
>>> The best would be to define check_zeroed_user() in Qemu and use it here.
>>>
>>>> +
>>>> +            target_scha = lock_user(VERIFY_READ, arg2, size, 1);
>>>> +            if (!target_scha) {
>>>> +                return -TARGET_EFAULT;
>>>> +            }
>>>> +            scha.size = size;
>>>> +            scha.sched_policy = tswap32(target_scha->sched_policy);
>>>> +            scha.sched_flags = tswap64(target_scha->sched_flags);
>>>> +            scha.sched_nice = tswap32(target_scha->sched_nice);
>>>> +            scha.sched_priority = tswap32(target_scha->sched_priority);
>>>> +            scha.sched_runtime = tswap64(target_scha->sched_runtime);
>>>> +            scha.sched_deadline = tswap64(target_scha->sched_deadline);
>>>> +            scha.sched_period = tswap64(target_scha->sched_period);
>>>> +            if (size > offsetof(struct target_sched_attr, sched_util_min)) {
>>>> +                scha.sched_util_min = tswap32(target_scha->sched_util_min);
>>>> +                scha.sched_util_max = tswap32(target_scha->sched_util_max);
>>>> +            }
>>>> +            unlock_user(target_scha, arg2, 0);
>>>> +            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
>>>> +        }
>>>>        case TARGET_NR_sched_yield:
>>>>            return get_errno(sched_yield());
>>>>        case TARGET_NR_sched_get_priority_max:
>>>> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
>>>> index 0b13975937..310d6ce8ad 100644
>>>> --- a/linux-user/syscall_defs.h
>>>> +++ b/linux-user/syscall_defs.h
>>>> @@ -2914,4 +2914,18 @@ struct target_statx {
>>>>       /* 0x100 */
>>>>    };
>>>>
>>>> +/* from kernel's include/linux/sched/types.h */
>>>> +struct target_sched_attr {
>>>> +    abi_uint size;
>>>> +    abi_uint sched_policy;
>>>> +    abi_ullong sched_flags;
>>>> +    abi_int sched_nice;
>>>> +    abi_uint sched_priority;
>>>> +    abi_ullong sched_runtime;
>>>> +    abi_ullong sched_deadline;
>>>> +    abi_ullong sched_period;
>>>> +    abi_uint sched_util_min;
>>>> +    abi_uint sched_util_max;
>>>> +};
>>>> +
>>>>    #endif
>>>
>>> Thanks,
>>> Laurent


