Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC4287DA6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 23:09:30 +0200 (CEST)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQdAH-0007PO-UJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 17:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kQd8s-0006PN-1W; Thu, 08 Oct 2020 17:08:03 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kQd8n-0002uC-HV; Thu, 08 Oct 2020 17:08:01 -0400
Received: by mail-il1-x133.google.com with SMTP id o18so7223365ill.2;
 Thu, 08 Oct 2020 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8wGw1bQKjLmdDuCCMwLCKEcpMrQ/51xudvGHXz1YuUI=;
 b=jtiwrfg2Mb3CO2+FAO5xUZl2kr8gzHUtjUB2qtxQMje0vOALQk3busiG89JDJOic6u
 ZKUsNo5DHNcQVVgFjMdF9FuqUGm30HKvOAUV4K+VG9rc4R3jhGd8ebqqBjTA8tD4C0vf
 Eq8W1JD4Wd8mb7eC2MdrxpMU4azXyS2orSwRUb8sOsY5pgGBy0PvYcWblA/U7+ibjAaz
 god/2F3Z5PSu+Q+u3/qXFq+VDN3vwqH2+egSfByAZTHgxvHixDfAH4PlM/OJx4Z/E5O6
 nqA8tPNtGMr67vyCZUs6n5eRgrxKDPvQmH3rjJyFKBv8oMwHsRhEhPkxJhOuHAa1u/J3
 xXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8wGw1bQKjLmdDuCCMwLCKEcpMrQ/51xudvGHXz1YuUI=;
 b=m8n4T50JrXTZrVys0CRJUAorzY4qlPwXhBUsrCNQWu2VS/I25fzOf/SGDemgbmK5Qu
 o1DW/7HtL9aBFhxnJW6GnLg4PIk1nr1ZYrj/sszr5Uba/YUcVieUsfvd3IrmeOlz46Zd
 lRlpx449JJF1duROMxjtPZZv3B1j+RY7N2DTNqvh9HO5ouQE6KWfXzZh4iUHDJCM9zPz
 mCHNRctNNCFAtc/TofOGhbPlRZCjet8SIOYJCges2OIFb1/psWnWdogkm+JBgqG/jOC4
 Gn1doIwMYtT9JXgRIWpH3pcwgWCw/2MexPy25fdnF3aaEENL80Ai3nlVZ15+ACB+F0zz
 88sA==
X-Gm-Message-State: AOAM533ZV448d+JtLjAXWJyx8LC+T1nv5j98XWNy5yWV5N3h9jQCW7iB
 9tJGRHmu57sYQMS3XvaVlN05sjEjPtTuUKJxZvk=
X-Google-Smtp-Source: ABdhPJy4dsE64vuxOnjdVL0w95kR6ehkEdW6nVxyjJPEyi9JFwiKYpXi35wW0FkVxHeyE055et3qRwjoPjBbCgcAaU0=
X-Received: by 2002:a92:d850:: with SMTP id h16mr7874809ilq.281.1602191274339; 
 Thu, 08 Oct 2020 14:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
 <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com> <87blhe1esd.fsf@linaro.org>
 <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com> <87362q1bxl.fsf@linaro.org>
 <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
In-Reply-To: <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Thu, 8 Oct 2020 14:07:27 -0700
Message-ID: <CADBGO79XkF7hAxDmrPm9Za16rXPHbB2L6xD2zr8puDLQp+z0Fw@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: Thomas <74cmonty@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=pauldzim@gmail.com; helo=mail-il1-x133.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

What does 'top' say while the emulation is running? I have an 8 cpu-thread
system, yet 'top' never shows more than about 300% cpu. I would have
thought it would get closer to 800% cpu. And running qemu as root with
nice -20 doesn't seem to make much difference.

- Paul

On Thu, Oct 8, 2020 at 12:00 AM Thomas <74cmonty@gmail.com> wrote:
>
> Interesting enough is: my top figure reported by perf is like yours:
>
> Samples: 6M of event 'cycles:u', Event count (approx.): 1936571734942
> Overhead  Command          Shared Object                  Symbol
>    7,95%  qemu-system-arm  qemu-system-arm                [.]
> helper_lookup_tb_ptr
> =E2=97=86
>    4,16%  qemu-system-arm  qemu-system-arm                [.]
> cpu_get_tb_cpu_state
> =E2=96=92
>    2,52%  qemu-system-arm  libpthread-2.32.so             [.]
> __pthread_mutex_lock
> =E2=96=92
>    2,06%  qemu-system-arm  qemu-system-arm                [.]
> qht_lookup_custom
> =E2=96=92
>    1,66%  qemu-system-arm  qemu-system-arm                [.]
> tlb_set_page_with_attrs
> =E2=96=92
>    1,61%  qemu-system-arm  libpthread-2.32.so             [.]
> __pthread_mutex_unlock_usercnt
> =E2=96=92
>    1,59%  qemu-system-arm  qemu-system-arm                [.]
> get_phys_addr
> =E2=96=92
>    1,27%  qemu-system-arm  qemu-system-arm                [.]
> cpu_exec
> =E2=96=92
>    1,23%  qemu-system-arm  qemu-system-arm                [.]
> object_class_dynamic_cast_assert
> =E2=96=92
>    0,98%  qemu-system-arm  libc-2.32.so                   [.]
> _int_malloc
> =E2=96=92
>    0,95%  qemu-system-arm  qemu-system-arm                [.]
> object_dynamic_cast_assert
> =E2=96=92
>    0,95%  qemu-system-arm  qemu-system-arm                [.]
> tb_htable_lookup
> =E2=96=92
>    0,92%  qemu-system-arm  qemu-system-arm                [.]
> tcg_gen_code
> =E2=96=92
>    0,91%  qemu-system-arm  qemu-system-arm                [.]
> qemu_mutex_lock_impl
> =E2=96=92
>    0,75%  qemu-system-arm  qemu-system-arm                [.]
> get_page_addr_code_hostp
> =E2=96=92
>    0,73%  qemu-system-arm  qemu-system-arm                [.]
> tcg_optimize
> =E2=96=92
>    0,71%  qemu-system-arm  qemu-system-arm                [.]
> qemu_mutex_unlock_impl
> =E2=96=92
>    0,69%  qemu-system-arm  libc-2.32.so                   [.]
> _int_free
> =E2=96=92
>    0,64%  qemu-system-arm  qemu-system-arm                [.]
> tb_flush_jmp_cache
> =E2=96=92
>    0,63%  qemu-system-arm  qemu-system-arm                [.]
> address_space_ldl_le
> =E2=96=92
>    0,62%  qemu-system-arm  libpthread-2.32.so             [.]
> __lll_lock_wait
> =E2=96=92
>    0,58%  qemu-system-arm  libpthread-2.32.so             [.]
> pthread_cond_wait@@GLIBC_2.3.2
> =E2=96=92
>    0,52%  qemu-system-arm  qemu-system-arm                [.]
> cpu_reset_interrupt
> =E2=96=92
>    0,52%  qemu-system-arm  libc-2.32.so                   [.]
> cfree@GLIBC_2.2.5
> =E2=96=92
>    0,52%  qemu-system-arm  qemu-system-arm                [.]
> qemu_set_irq
> =E2=96=92
>
> However the absolute time is 3-4 minutes.
> And I don't know where I should start optimization now.
>
>
>
> Am 07.10.20 um 14:02 schrieb Alex Benn=C3=A9e:
> > Thomas Schneider <74cmonty@gmail.com> writes:
> >
> >> Are you referring to this tool?
> >> https://github.com/stefano-garzarella/qemu-boot-time
> >> <https://github.com/stefano-garzarella/qemu-boot-time>
> > No - just plain perf:
> >
> >   perf record $QEMU $ARGS
> >
> > Then a "perf report" which will show you the hotspots, for example:
> >
> >    8.92%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_t=
b_ptr
> >    4.76%  qemu-system-aar  qemu-system-aarch64      [.] liveness_pass_1
> >    3.69%  qemu-system-aar  qemu-system-aarch64      [.] tcg_gen_code
> >    2.95%  qemu-system-aar  qemu-system-aarch64      [.] qht_lookup_cust=
om
> >    2.93%  qemu-system-aar  qemu-system-aarch64      [.] tcg_optimize
> >    1.28%  qemu-system-aar  qemu-system-aarch64      [.] tcg_out_opc.isr=
a.15
> >    1.09%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr_l=
pae
> >    1.09%  qemu-system-aar  [kernel.kallsyms]        [k] isolate_freepag=
es_block
> >    1.05%  qemu-system-aar  qemu-system-aarch64      [.] cpu_get_tb_cpu_=
state
> >    0.98%  qemu-system-aar  [kernel.kallsyms]        [k] do_syscall_64
> >    0.94%  qemu-system-aar  qemu-system-aarch64      [.] tb_lookup_cmp
> >    0.78%  qemu-system-aar  qemu-system-aarch64      [.] init_ts_info
> >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_htable_looku=
p
> >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_gen_code
> >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tlb_set_page_wi=
th_attrs
> >
> >>
> >> Am 07.10.2020 um 13:00 schrieb Alex Benn=C3=A9e:
> >>> perf to record your boot
> >
>

