Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E2548379A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 20:33:42 +0100 (CET)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4T5R-0000gJ-7Z
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 14:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4T3M-0008B3-Q8
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 14:31:33 -0500
Received: from [2a00:1450:4864:20::42e] (port=41756
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4T3K-0003U9-42
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 14:31:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v6so10005669wra.8
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 11:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PoX29qnOXjWtjL54akfYmQFnHzp93yZW0nAxQmo0dWo=;
 b=gTJe7HtthrfLF7ZPe42onMTJ+RY4efEkVf0UUQCpVF4th/Vz9BJryHRXuyVvA9D93c
 VHtIUAGcOyEAvufqjBMTHL7qqcC8EO/gpTebN7Ja25vA7lMrUytPB312rODwTOKGvGww
 DgdP9yg89r2XdCUMG3ZOec7Wn7XWZ0QyLaRwMWDQLykKBpgVeMrfX+jX8MEhespUaHxf
 xrf4h6e7pCw0lcY9/7YFmqOVrPv5fMa3e7OAoPOiDXBCOwUns66uwrB2fHMzo+KkhUCy
 g+i973yNw0ETArbbqaI31WjmHlC4t3F+mAyTDIQMWwqdkFq3oftX8ZB/fq/4avQkA2za
 nY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PoX29qnOXjWtjL54akfYmQFnHzp93yZW0nAxQmo0dWo=;
 b=5IuUGmGPa+o1DuiOzTEj+sDZ+y2iu3OI5u1TDDHqI3SGKcqoGWA5INtSSO4tGbmpfB
 mNlKwtbrSqln+qgJK4GYtw9ZbFks13nz9RQSJDCS+F+uCAoZRR8hZvbXo2M6DWjUyMuo
 KHmv91G4wGfXHq6g3xdS4vzPp5ptTANOGCDcsIV5hQ3mnc8k4bMYjl3J5e9eEmd1zyHR
 cxuPcSVbr7uuyUgFj8iHIdeQpxUlzb3vMvYOxXLZOqAf7PcGuXgfv4K8zEJkdD6UA5Ty
 SPE2hB5l+Tt1iNu4MMJ2SpFQWFGJvKSSTJEgTeSPG8IcLuIuk11vpp5pQ226gpded4Vx
 ZogA==
X-Gm-Message-State: AOAM530SfTlvUxJCySV50R7lzeAuOUMQKkwDtARFng/hEPCK1IlfShis
 zw3vVkwPxTccaHbGUbb198PtwXo71DM28Ag6Y8w=
X-Google-Smtp-Source: ABdhPJzXWFkXBRtG0AEjUC5ty0h5dMbJQfKA98j+sy2usF0R2wTSSJ3/xUUicit1IhSAZL28rxg8Le1+RDo/0FkXFbI=
X-Received: by 2002:adf:ec85:: with SMTP id z5mr39748162wrn.568.1641238288408; 
 Mon, 03 Jan 2022 11:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20211223064728.18048-1-tonistiigi@gmail.com>
 <20211223064728.18048-2-tonistiigi@gmail.com>
 <e506a0b4-2505-d136-53f8-c1bcafc204a1@vivier.eu>
 <CABn_tOmPjctnJU465R1b4ykRvryidj56rGeMKnaLJ+H3WAt8aw@mail.gmail.com>
 <CABn_tOn3aqXwPx2q173BEOTUoBjTtDLYuF34kf4mHbeAG+6+NQ@mail.gmail.com>
 <75604d1b-8cd1-b984-bcfe-c7c7d8d10728@vivier.eu>
In-Reply-To: <75604d1b-8cd1-b984-bcfe-c7c7d8d10728@vivier.eu>
From: =?UTF-8?B?VMO1bmlzIFRpaWdp?= <tonistiigi@gmail.com>
Date: Mon, 3 Jan 2022 11:31:17 -0800
Message-ID: <CABn_tOnQTgTu3XUyvKWiKgm53ep_NiL=qz6qQcp2vjT7y6rsgQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] linux-user: add sched_getattr support
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=tonistiigi@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Jan 3, 2022 at 10:37 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 03/01/2022 =C3=A0 18:07, T=C3=B5nis Tiigi a =C3=A9crit :
> > Ping Laurent. Any suggestions for the follow-up questions?
> >
> > On Thu, Dec 23, 2021 at 3:00 PM T=C3=B5nis Tiigi <tonistiigi@gmail.com>=
 wrote:
> >>
> >> On Thu, Dec 23, 2021 at 1:03 PM Laurent Vivier <laurent@vivier.eu> wro=
te:
> >>>
> >>> Le 23/12/2021 =C3=A0 07:47, Tonis Tiigi a =C3=A9crit :
> >>>
> >>> Please copy here what you explain in PATCH 0 regarding this patch.
> >>> (do the same for PATCH 1)
> >>>
> >>>> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> >>>> ---
> >>>>    linux-user/syscall.c      | 94 ++++++++++++++++++++++++++++++++++=
+++++
> >>>>    linux-user/syscall_defs.h | 14 ++++++
> >>>>    2 files changed, 108 insertions(+)
> >>>>
> >>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> >>>> index f1cfcc8104..2f5a0fac5a 100644
> >>>> --- a/linux-user/syscall.c
> >>>> +++ b/linux-user/syscall.c
> >>>> @@ -339,6 +339,12 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pi=
d, unsigned int, len,
> >>>>    #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
> >>>>    _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, l=
en,
> >>>>              unsigned long *, user_mask_ptr);
> >>>> +#define __NR_sys_sched_getattr __NR_sched_getattr
> >>>> +_syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_a=
ttr *, attr,
> >>>> +          unsigned int, size, unsigned int, flags);
> >>>> +#define __NR_sys_sched_setattr __NR_sched_setattr
> >>>> +_syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_a=
ttr *, attr,
> >>>> +          unsigned int, flags);
> >>>>    #define __NR_sys_getcpu __NR_getcpu
> >>>>    _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, voi=
d *, tcache);
> >>>>    _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cm=
d,
> >>>> @@ -10593,6 +10599,94 @@ static abi_long do_syscall1(void *cpu_env, =
int num, abi_long arg1,
> >>>>            }
> >>>>        case TARGET_NR_sched_getscheduler:
> >>>>            return get_errno(sched_getscheduler(arg1));
> >>>> +    case TARGET_NR_sched_getattr:
> >>>> +        {
> >>>> +            struct target_sched_attr *target_scha;
> >>>> +            struct target_sched_attr scha;
> >>>
> >>> In fact, this scha is used with the host syscall, so it must be  sche=
d_attr.
> >>
> >>
> >> Where do you want me to define the "host variant" of sched_attr and
> >> with what types for the properties? Or do you want additional
> >> typedef(where?) so the name is less confusing? All properties in this
> >> type are fixed length and identical for all architectures.
>
> It's better to use the host variant with the host syscall.
>
> Normally sched_attr comes with kernel headers, so it should be available =
and you should not have to
> define it.
>
> We need to define a target property because alignment also matters as the=
 alignment for type can
> differ from an architecture to another. I agree that in most cases it sho=
uld not be needed but I
> think it's cleaner like that.
>
> so for this part, only replace "struct target_sched_attr scha;" by "struc=
t sched_att scha;"

sched_attr is defined in linux/sched/types.h . I can't include it
directly as it conflicts with libc headers with "redefinition of
'struct sched_param'". It looks like
https://lkml.org/lkml/2020/5/28/810 attempted to resolve this conflict
but was not merged and seems to be stuck in kernel vs glibc blame
cycle.

>
> >>
> >>>
> >>>
> >>>> +            if (arg2 =3D=3D 0) {
> >>>> +                return -TARGET_EINVAL;
> >>>> +            }
> >>>> +            if (arg3 > sizeof(scha)) {
> >>>> +                arg3 =3D sizeof(scha);
> >>>> +            }
> >>>> +            ret =3D get_errno(sys_sched_getattr(arg1, &scha, arg3, =
arg4));
> >>>> +            if (!is_error(ret)) {
> >>>> +                target_scha =3D lock_user(VERIFY_WRITE, arg2, arg3,=
 0);
> >>>> +                if (!target_scha) {
> >>>> +                    return -TARGET_EFAULT;
> >>>> +                }
> >>>> +                target_scha->size =3D tswap32(scha.size);
> >>>> +                target_scha->sched_policy =3D tswap32(scha.sched_po=
licy);
> >>>> +                target_scha->sched_flags =3D tswap64(scha.sched_fla=
gs);
> >>>> +                target_scha->sched_nice =3D tswap32(scha.sched_nice=
);
> >>>> +                target_scha->sched_priority =3D tswap32(scha.sched_=
priority);
> >>>> +                target_scha->sched_runtime =3D tswap64(scha.sched_r=
untime);
> >>>> +                target_scha->sched_deadline =3D tswap64(scha.sched_=
deadline);
> >>>> +                target_scha->sched_period =3D tswap64(scha.sched_pe=
riod);
> >>>> +                if (scha.size > offsetof(struct target_sched_attr, =
sched_util_min)) {
> >>>> +                    target_scha->sched_util_min =3D tswap32(scha.sc=
hed_util_min);
> >>>> +                    target_scha->sched_util_max =3D tswap32(scha.sc=
hed_util_max);
> >>>> +                }
> >>>> +                unlock_user(target_scha, arg2, arg3);
> >>>> +            }
> >>>> +            return ret;
> >>>> +        }
> >>>> +    case TARGET_NR_sched_setattr:
> >>>> +        {
> >>>> +            struct target_sched_attr *target_scha;
> >>>> +            struct target_sched_attr scha;
> >>>
> >>> scha is sched_attr as it is used with the host syscall.
> >>>
> >>>
> >>>> +            if (arg2 =3D=3D 0) {
> >>>> +                return -TARGET_EINVAL;
> >>>> +            }
> >>>> +            uint32_t size;
> >>>
> >>> QEMU coding style doesn't allow to mix declarations and statements.
> >>>
> >>>> +            if (get_user_u32(size, arg2)) {
> >>>> +                return -TARGET_EFAULT;
> >>>> +            }
> >>>> +            if (!size) {
> >>>> +                size =3D offsetof(struct target_sched_attr, sched_u=
til_min);
> >>>> +            }
> >>>> +            if (size < offsetof(struct target_sched_attr, sched_uti=
l_min)) {
> >>>> +                if (put_user_u32(sizeof(struct target_sched_attr), =
arg2)) {
> >>>> +                    return -TARGET_EFAULT;
> >>>> +                }
> >>>> +                return -TARGET_E2BIG;
> >>>> +            }
> >>>> +
> >>>> +            if (size > sizeof(scha)) {
> >>>> +                for (int i =3D sizeof(scha); i < size; i++) {
> >>>> +                    uint8_t b;
> >>>> +                    if (get_user_u8(b, arg2 + i)) {
> >>>> +                        return -TARGET_EFAULT;
> >>>> +                    }
> >>>> +                    if (b !=3D 0) {
> >>>> +                        if (put_user_u32(sizeof(struct target_sched=
_attr), arg2)) {
> >>>> +                            return -TARGET_EFAULT;
> >>>> +                        }
> >>>> +                        return -TARGET_E2BIG;
> >>>> +                    }
> >>>> +                }
> >>>> +                size =3D sizeof(scha);
> >>>> +            }
> >>>
> >>> I guess this is the code to mimic kernel copy_struct_from_user(), the=
 part when usize > ksize.
> >>>
> >>> It's a little bit ugly, but I can't disagree because the kernel does =
the same.
> >>>
> >>> except that the kernel check for unsigned rather than for 8bit. Could=
 you change that?
> >>
> >>
> >> You mean "unsigned long" like in
> >> https://github.com/torvalds/linux/blob/76657eaef4a759e695eb1883d4f1d9a=
f1e4ff9a8/lib/usercopy.c#L57
>
> yes
>
> >> ? That would mean that this code needs to be much more complicated to
> >> handle the cases for the unaligned start and end bytes, need
> >> aligned_byte_mask helper etc. Even though kernel seems to have extra
> >> code for these cases iiuc it can still get EFAULT on specific
> >> conditions.
>
> OK, I don't want too complicated code here, so I think we can keep your v=
ersion.
> But could you move this code to a function?

Sure, but could you tell me where do you want it defined. syscall.c
does not seem to have generic helper functions and current helpers
seem to be macros in qemu.h . Also, are we talking about a function
like check_zeroed_user() or a variant of lock_user() with two size
parameters(or lock_user_struct() with extra size param)?

>
> >>>
> >>>
> >>> The best would be to define check_zeroed_user() in Qemu and use it he=
re.
> >>>
> >>>> +
> >>>> +            target_scha =3D lock_user(VERIFY_READ, arg2, size, 1);
> >>>> +            if (!target_scha) {
> >>>> +                return -TARGET_EFAULT;
> >>>> +            }
> >>>> +            scha.size =3D size;
> >>>> +            scha.sched_policy =3D tswap32(target_scha->sched_policy=
);
> >>>> +            scha.sched_flags =3D tswap64(target_scha->sched_flags);
> >>>> +            scha.sched_nice =3D tswap32(target_scha->sched_nice);
> >>>> +            scha.sched_priority =3D tswap32(target_scha->sched_prio=
rity);
> >>>> +            scha.sched_runtime =3D tswap64(target_scha->sched_runti=
me);
> >>>> +            scha.sched_deadline =3D tswap64(target_scha->sched_dead=
line);
> >>>> +            scha.sched_period =3D tswap64(target_scha->sched_period=
);
> >>>> +            if (size > offsetof(struct target_sched_attr, sched_uti=
l_min)) {
> >>>> +                scha.sched_util_min =3D tswap32(target_scha->sched_=
util_min);
> >>>> +                scha.sched_util_max =3D tswap32(target_scha->sched_=
util_max);
> >>>> +            }
> >>>> +            unlock_user(target_scha, arg2, 0);
> >>>> +            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
> >>>> +        }
> >>>>        case TARGET_NR_sched_yield:
> >>>>            return get_errno(sched_yield());
> >>>>        case TARGET_NR_sched_get_priority_max:
> >>>> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> >>>> index 0b13975937..310d6ce8ad 100644
> >>>> --- a/linux-user/syscall_defs.h
> >>>> +++ b/linux-user/syscall_defs.h
> >>>> @@ -2914,4 +2914,18 @@ struct target_statx {
> >>>>       /* 0x100 */
> >>>>    };
> >>>>
> >>>> +/* from kernel's include/linux/sched/types.h */
> >>>> +struct target_sched_attr {
> >>>> +    abi_uint size;
> >>>> +    abi_uint sched_policy;
> >>>> +    abi_ullong sched_flags;
> >>>> +    abi_int sched_nice;
> >>>> +    abi_uint sched_priority;
> >>>> +    abi_ullong sched_runtime;
> >>>> +    abi_ullong sched_deadline;
> >>>> +    abi_ullong sched_period;
> >>>> +    abi_uint sched_util_min;
> >>>> +    abi_uint sched_util_max;
> >>>> +};
> >>>> +
> >>>>    #endif
> >>>
> >>> Thanks,
> >>> Laurent
>

