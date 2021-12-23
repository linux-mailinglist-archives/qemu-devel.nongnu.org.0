Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5A47E99C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 00:04:25 +0100 (CET)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0X8K-00032C-1v
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 18:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0X5A-00018Q-Ut
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:01:08 -0500
Received: from [2a00:1450:4864:20::336] (port=37679
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0X55-0002tT-2p
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:01:08 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso6397025wmd.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 15:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tNqpmMaDv9MdMZS5ZmgPTGNYQQv/WcM281YZkb9L+YE=;
 b=Nyzqz0nmu5ty0ENHKVsC+g0vnbYKPfZgDDVUyU8O0sl1hyPjMmCaKvmsiT5X03O/tF
 VxFXXuJoG2xmmzgPpM1e3T3tk9K0tJ5WQLcf6o6wu0TFQQM+804ZgJSP3o3a0Oc22/eE
 kLHQy7AsCOixf9BEY7plOgAPUMZ6i+reV4zI47vXCeE/nq7jbaT+PqPAg3L4FHToVgG9
 y+DMqs89F4hlwtlopVKQE0O+6yQ51/q78W5SqMuYVvNAZ9ELqSyuI6PWM2c4F2JSr2/R
 gO0cMS9bof/gmJc9z5zXRwgvrVmIkGfTYrlIFfGQhHT+xcqxDDpUkNC5tWd0g9HuOa4K
 FIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tNqpmMaDv9MdMZS5ZmgPTGNYQQv/WcM281YZkb9L+YE=;
 b=6RzUvNNDBXtDv1uKaBP95IRznK/mRQJJ53/y3Ul7Yrt302aA58n4gnR6DylaOhJG6w
 SvFc4QBefRknJi8XiyhJSQOeIWbcK2kar46UYJGt31e2qTdczlf1FLoVH8MWx3E237cB
 uPyEhAg/nK5iZ7+G7/XuVvZaC9Ylpl+vUyqMa6tZ26kUY5xBLW0WUK/5171ntPFmJYS4
 klTxQrJY62pZIqwdiWJ4QlU25kJUmW24+sjH957i2ZvyI5I3tDjEAXrhl4X8ynb/rPAx
 TW6SGFrjehJf34T0h2ufpk4EX+AlNgVPw1X4L6QWky0FpNTkAibPfeXq6jm2W6XOkhIn
 ieAg==
X-Gm-Message-State: AOAM532Ox7YU0K7kefe3VRCN9SdIUU+FNW66cMbx0DjBO52aicg/ONMg
 u1tsVOImIkBKARewl8tt3pHJ22Mz8nAkfVQPIgPVj5z66EY=
X-Google-Smtp-Source: ABdhPJwByTjKfmlFDDw9+w1Ucvxsi30Zm/qbT9mGbkhrNuN8aAGOuzR+0O20sfP52BMN59LLNIET3jIBPEF6NLd9Xjk=
X-Received: by 2002:a05:600c:3797:: with SMTP id
 o23mr3130664wmr.178.1640300456166; 
 Thu, 23 Dec 2021 15:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20211223064728.18048-1-tonistiigi@gmail.com>
 <20211223064728.18048-2-tonistiigi@gmail.com>
 <e506a0b4-2505-d136-53f8-c1bcafc204a1@vivier.eu>
In-Reply-To: <e506a0b4-2505-d136-53f8-c1bcafc204a1@vivier.eu>
From: =?UTF-8?B?VMO1bmlzIFRpaWdp?= <tonistiigi@gmail.com>
Date: Thu, 23 Dec 2021 15:00:45 -0800
Message-ID: <CABn_tOmPjctnJU465R1b4ykRvryidj56rGeMKnaLJ+H3WAt8aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] linux-user: add sched_getattr support
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=tonistiigi@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Dec 23, 2021 at 1:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 23/12/2021 =C3=A0 07:47, Tonis Tiigi a =C3=A9crit :
>
> Please copy here what you explain in PATCH 0 regarding this patch.
> (do the same for PATCH 1)
>
> > Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> > ---
> >   linux-user/syscall.c      | 94 ++++++++++++++++++++++++++++++++++++++=
+
> >   linux-user/syscall_defs.h | 14 ++++++
> >   2 files changed, 108 insertions(+)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index f1cfcc8104..2f5a0fac5a 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -339,6 +339,12 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, =
unsigned int, len,
> >   #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
> >   _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
> >             unsigned long *, user_mask_ptr);
> > +#define __NR_sys_sched_getattr __NR_sched_getattr
> > +_syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr=
 *, attr,
> > +          unsigned int, size, unsigned int, flags);
> > +#define __NR_sys_sched_setattr __NR_sched_setattr
> > +_syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr=
 *, attr,
> > +          unsigned int, flags);
> >   #define __NR_sys_getcpu __NR_getcpu
> >   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *,=
 tcache);
> >   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> > @@ -10593,6 +10599,94 @@ static abi_long do_syscall1(void *cpu_env, int=
 num, abi_long arg1,
> >           }
> >       case TARGET_NR_sched_getscheduler:
> >           return get_errno(sched_getscheduler(arg1));
> > +    case TARGET_NR_sched_getattr:
> > +        {
> > +            struct target_sched_attr *target_scha;
> > +            struct target_sched_attr scha;
>
> In fact, this scha is used with the host syscall, so it must be  sched_at=
tr.


Where do you want me to define the "host variant" of sched_attr and
with what types for the properties? Or do you want additional
typedef(where?) so the name is less confusing? All properties in this
type are fixed length and identical for all architectures.

>
>
> > +            if (arg2 =3D=3D 0) {
> > +                return -TARGET_EINVAL;
> > +            }
> > +            if (arg3 > sizeof(scha)) {
> > +                arg3 =3D sizeof(scha);
> > +            }
> > +            ret =3D get_errno(sys_sched_getattr(arg1, &scha, arg3, arg=
4));
> > +            if (!is_error(ret)) {
> > +                target_scha =3D lock_user(VERIFY_WRITE, arg2, arg3, 0)=
;
> > +                if (!target_scha) {
> > +                    return -TARGET_EFAULT;
> > +                }
> > +                target_scha->size =3D tswap32(scha.size);
> > +                target_scha->sched_policy =3D tswap32(scha.sched_polic=
y);
> > +                target_scha->sched_flags =3D tswap64(scha.sched_flags)=
;
> > +                target_scha->sched_nice =3D tswap32(scha.sched_nice);
> > +                target_scha->sched_priority =3D tswap32(scha.sched_pri=
ority);
> > +                target_scha->sched_runtime =3D tswap64(scha.sched_runt=
ime);
> > +                target_scha->sched_deadline =3D tswap64(scha.sched_dea=
dline);
> > +                target_scha->sched_period =3D tswap64(scha.sched_perio=
d);
> > +                if (scha.size > offsetof(struct target_sched_attr, sch=
ed_util_min)) {
> > +                    target_scha->sched_util_min =3D tswap32(scha.sched=
_util_min);
> > +                    target_scha->sched_util_max =3D tswap32(scha.sched=
_util_max);
> > +                }
> > +                unlock_user(target_scha, arg2, arg3);
> > +            }
> > +            return ret;
> > +        }
> > +    case TARGET_NR_sched_setattr:
> > +        {
> > +            struct target_sched_attr *target_scha;
> > +            struct target_sched_attr scha;
>
> scha is sched_attr as it is used with the host syscall.
>
>
> > +            if (arg2 =3D=3D 0) {
> > +                return -TARGET_EINVAL;
> > +            }
> > +            uint32_t size;
>
> QEMU coding style doesn't allow to mix declarations and statements.
>
> > +            if (get_user_u32(size, arg2)) {
> > +                return -TARGET_EFAULT;
> > +            }
> > +            if (!size) {
> > +                size =3D offsetof(struct target_sched_attr, sched_util=
_min);
> > +            }
> > +            if (size < offsetof(struct target_sched_attr, sched_util_m=
in)) {
> > +                if (put_user_u32(sizeof(struct target_sched_attr), arg=
2)) {
> > +                    return -TARGET_EFAULT;
> > +                }
> > +                return -TARGET_E2BIG;
> > +            }
> > +
> > +            if (size > sizeof(scha)) {
> > +                for (int i =3D sizeof(scha); i < size; i++) {
> > +                    uint8_t b;
> > +                    if (get_user_u8(b, arg2 + i)) {
> > +                        return -TARGET_EFAULT;
> > +                    }
> > +                    if (b !=3D 0) {
> > +                        if (put_user_u32(sizeof(struct target_sched_at=
tr), arg2)) {
> > +                            return -TARGET_EFAULT;
> > +                        }
> > +                        return -TARGET_E2BIG;
> > +                    }
> > +                }
> > +                size =3D sizeof(scha);
> > +            }
>
> I guess this is the code to mimic kernel copy_struct_from_user(), the par=
t when usize > ksize.
>
> It's a little bit ugly, but I can't disagree because the kernel does the =
same.
>
> except that the kernel check for unsigned rather than for 8bit. Could you=
 change that?


You mean "unsigned long" like in
https://github.com/torvalds/linux/blob/76657eaef4a759e695eb1883d4f1d9af1e4f=
f9a8/lib/usercopy.c#L57
? That would mean that this code needs to be much more complicated to
handle the cases for the unaligned start and end bytes, need
aligned_byte_mask helper etc. Even though kernel seems to have extra
code for these cases iiuc it can still get EFAULT on specific
conditions.

>
>
> The best would be to define check_zeroed_user() in Qemu and use it here.
>
> > +
> > +            target_scha =3D lock_user(VERIFY_READ, arg2, size, 1);
> > +            if (!target_scha) {
> > +                return -TARGET_EFAULT;
> > +            }
> > +            scha.size =3D size;
> > +            scha.sched_policy =3D tswap32(target_scha->sched_policy);
> > +            scha.sched_flags =3D tswap64(target_scha->sched_flags);
> > +            scha.sched_nice =3D tswap32(target_scha->sched_nice);
> > +            scha.sched_priority =3D tswap32(target_scha->sched_priorit=
y);
> > +            scha.sched_runtime =3D tswap64(target_scha->sched_runtime)=
;
> > +            scha.sched_deadline =3D tswap64(target_scha->sched_deadlin=
e);
> > +            scha.sched_period =3D tswap64(target_scha->sched_period);
> > +            if (size > offsetof(struct target_sched_attr, sched_util_m=
in)) {
> > +                scha.sched_util_min =3D tswap32(target_scha->sched_uti=
l_min);
> > +                scha.sched_util_max =3D tswap32(target_scha->sched_uti=
l_max);
> > +            }
> > +            unlock_user(target_scha, arg2, 0);
> > +            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
> > +        }
> >       case TARGET_NR_sched_yield:
> >           return get_errno(sched_yield());
> >       case TARGET_NR_sched_get_priority_max:
> > diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> > index 0b13975937..310d6ce8ad 100644
> > --- a/linux-user/syscall_defs.h
> > +++ b/linux-user/syscall_defs.h
> > @@ -2914,4 +2914,18 @@ struct target_statx {
> >      /* 0x100 */
> >   };
> >
> > +/* from kernel's include/linux/sched/types.h */
> > +struct target_sched_attr {
> > +    abi_uint size;
> > +    abi_uint sched_policy;
> > +    abi_ullong sched_flags;
> > +    abi_int sched_nice;
> > +    abi_uint sched_priority;
> > +    abi_ullong sched_runtime;
> > +    abi_ullong sched_deadline;
> > +    abi_ullong sched_period;
> > +    abi_uint sched_util_min;
> > +    abi_uint sched_util_max;
> > +};
> > +
> >   #endif
>
> Thanks,
> Laurent

