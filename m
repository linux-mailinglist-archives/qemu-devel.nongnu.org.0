Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E644A4F69
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:27:21 +0100 (CET)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcKd-0002kB-SN
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:27:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEbt4-0007Mz-CJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:58:50 -0500
Received: from [2607:f8b0:4864:20::62b] (port=37752
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEbt1-0008Ng-MZ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:58:50 -0500
Received: by mail-pl1-x62b.google.com with SMTP id j16so13287019plx.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTPYdCL787Y7m8xp55FStrrlxPw5OHdzRHY0ar9aWWQ=;
 b=B9m1XfO45DdvHOTGraGlIRCanN4CfBBpguId+CsOSICNBD1+/7jJJh1oq+JDbPgKby
 Idxi7B64fnwxeqvYzDyvvGOs71hCKJEi34M1lll+MoAdYBt5Maa4bGaCUJmO2FLyzf/D
 mn1BKtz7bM/5SZC1u4tDDZ9ei+TtPWcAq69Se3ilxY0XEKWSFYLPw6dQclO7KcRjzOao
 J96vjf3EXLQIIFo2UB1ThJ2zlEQhC+31u0MT523jCMPUIO1IeEsL75sJzR+y9b7skjTq
 48xyyrx+s42zJnhBh/2Ic2y84H75oNTt7Qd+HARtuxTqYnVwWc0vzJogxKArp33P/ZzS
 ip6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTPYdCL787Y7m8xp55FStrrlxPw5OHdzRHY0ar9aWWQ=;
 b=PXsgE4Pk2ABq+oG0COkb/GIEonERTB9YzJu66W5zIIw80sDQPDNbY7ys4qiROgRIrQ
 Jq+KnHkxF7mTgeJjim9dahjlnxxK0XRaej3SWJmhjC2e9fZ6XWUk5bRdeGvmahPSB7KH
 EHXWomQukd7ZkkJuW6PdFRoA93P0C4Je7EK/fVYywvOSVBDL/TtOoSafJtH522q6zGnF
 CQ3F3ifuHlIa2cM7orBKXEIfJn3HejJR6yRMWmTUpw0yPHZzPEUJIkNr+9O5+/3HUVRi
 b8yaqZpLkbiwXAyy81lrrljDJhjhG4neOTuCrcUlYk3berZ/kvRAfXn0W8UUIjKqqxJy
 nvKA==
X-Gm-Message-State: AOAM5323/sB+bhxPMKEt2+UG/Sm9g2VrjlJ72GBcQKKf4a2yGpZ+SCuz
 PP9KrBbZmtPJs5VjLOS81tPEqXyeWsUjwiUUo5s=
X-Google-Smtp-Source: ABdhPJzORGbl3MVmEbtyvUg0kzxgEmn6jvdfulm5FzDhzuw0hI6L6ALY8miU5nZNuwg7ccGW1gR+C2OeEuJQtfDKpMs=
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr34939368pjb.89.1643655525738; 
 Mon, 31 Jan 2022 10:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20211102164317.45658-1-david@redhat.com>
 <20211102164317.45658-3-david@redhat.com>
 <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
 <3f971963-8424-ba36-7723-1d60251c10cd@redhat.com>
In-Reply-To: <3f971963-8424-ba36-7723-1d60251c10cd@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 31 Jan 2022 19:58:34 +0100
Message-ID: <CAPan3Woi0oPAnkSt8ZYAVyh_AFb06oK17zJnc7zr7NEqaMfFVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
To: David Hildenbrand <david@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000beaa0c05d6e55f43"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000beaa0c05d6e55f43
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Jan 31, 2022 at 9:11 AM David Hildenbrand <david@redhat.com> wrote:

> On 30.01.22 23:50, Niek Linnenbank wrote:
> > Hi David,
>
> Hi Niek,
>
> thanks for the report.
>
> >
> > While I realize my response is quite late, I wanted to report this error
> > I found when running the acceptance
> > tests for the orangepi-pc machine using avocado:
> >
> > ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
> > --show=app,console run -t machine:orangepi-pc
> > tests/avocado/boot_linux_console.py
> > ...
> >  (4/5)
> >
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
> > -console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> > \console: DRAM:
> > INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> > reached\nOriginal status: ERROR\n{'name':
> >
> '4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08',
> > 'logdir': '/home/fox/avocado/job-results/job-2022-01-30T23.09-af49e...
> > (90.64 s)
> >  (5/5)
> >
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
> > /console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
> > console: DRAM:
> > INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> > reached\nOriginal status: ERROR\n{'name':
> >
> '5-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9',
> > 'logdir': '/home/fox/avocado/job-results/job-2022-01-30T23.09-af49...
> > (90.64 s)
> > RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 |
> > CANCEL 0
> > JOB TIME   : 221.25 s
> >
> > Basically the two tests freeze during the part where the U-Boot
> > bootloader needs to detect the amount of memory. We model this in the
> > hw/misc/allwinner-h3-dramc.c file.
> > And when running the machine manually it shows an assert on
> > 'alias->mapped_via_alias >= 0'. When running manually via gdb, I was
> > able to collect this backtrace:
> >
> > $ gdb ./build/qemu-system-arm
> > ...
> > gdb) run -M orangepi-pc -nographic
> > ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img
> > ...
> > U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> > DRAM:
> > qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion:
> > Assertion `alias->mapped_via_alias >= 0' failed.
> >
> > Thread 4 "qemu-system-arm" received signal SIGABRT, Aborted.
> > [Switching to Thread 0x7ffff5f72700 (LWP 32866)]
> > __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > 50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> > (gdb) bt
> > #0  __GI_raise (sig=sig@entry=6) at
> ../sysdeps/unix/sysv/linux/raise.c:50
> > #1  0x00007ffff7535859 in __GI_abort () at abort.c:79
> > #2  0x00007ffff7535729 in __assert_fail_base
> >     (fmt=0x7ffff76cb588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
> > assertion=0x55555642fd65 "alias->mapped_via_alias >= 0",
> > file=0x55555642f8cd "../softmmu/memory.c", line=2588,
> > function=<optimized out>)
> >     at assert.c:92
> > #3  0x00007ffff7546f36 in __GI___assert_fail
> >     (assertion=0x55555642fd65 "alias->mapped_via_alias >= 0",
> > file=0x55555642f8cd "../softmmu/memory.c", line=2588,
> > function=0x555556430690 <__PRETTY_FUNCTION__.8>
> > "memory_region_del_subregion") at assert.c:101
> > #4  0x0000555555e587e0 in memory_region_del_subregion
> > (mr=0x555556f0bc00, subregion=0x7ffff5fa1090) at ../softmmu/memory.c:2588
> > #5  0x0000555555e589f3 in memory_region_readd_subregion
> > (mr=0x7ffff5fa1090) at ../softmmu/memory.c:2630
> > #6  0x0000555555e58a5f in memory_region_set_address (mr=0x7ffff5fa1090,
> > addr=1090519040) at ../softmmu/memory.c:2642
> > #7  0x0000555555ac352b in allwinner_h3_dramc_map_rows (s=0x7ffff5fa0c50,
> > row_bits=16 '\020', bank_bits=2 '\002', page_size=512) at
> > ../hw/misc/allwinner-h3-dramc.c:92
> > #8  0x0000555555ac36c2 in allwinner_h3_dramcom_write
> > (opaque=0x7ffff5fa0c50, offset=0, val=4396785, size=4) at
> > ../hw/misc/allwinner-h3-dramc.c:131
> > #9  0x0000555555e52561 in memory_region_write_accessor
> > (mr=0x7ffff5fa11a0, addr=0, value=0x7ffff5f710e8, size=4, shift=0,
> > mask=4294967295, attrs=...) at ../softmmu/memory.c:492
> > #10 0x0000555555e527ad in access_with_adjusted_size (addr=0,
> > value=0x7ffff5f710e8, size=4, access_size_min=4, access_size_max=4,
> > access_fn=
> >     0x555555e52467 <memory_region_write_accessor>, mr=0x7ffff5fa11a0,
> > attrs=...) at ../softmmu/memory.c:554
> > #11 0x0000555555e55935 in memory_region_dispatch_write
> > (mr=0x7ffff5fa11a0, addr=0, data=4396785, op=MO_32, attrs=...) at
> > ../softmmu/memory.c:1514
> > #12 0x0000555555f891ae in io_writex (env=0x7ffff5f7ce30,
> > iotlbentry=0x7fffec0275f0, mmu_idx=7, val=4396785, addr=29761536,
> > retaddr=140734938367479, op=MO_32) at ../accel/tcg/cputlb.c:1420
> > #13 0x0000555555f8ba10 in store_helper (env=0x7ffff5f7ce30,
> > addr=29761536, val=4396785, oi=3623, retaddr=140734938367479, op=MO_32)
> > at ../accel/tcg/cputlb.c:2355
> > #14 0x0000555555f8bdda in full_le_stl_mmu (env=0x7ffff5f7ce30,
> > addr=29761536, val=4396785, oi=3623, retaddr=140734938367479) at
> > ../accel/tcg/cputlb.c:2443
> > #15 0x0000555555f8be16 in helper_le_stl_mmu (env=0x7ffff5f7ce30,
> > addr=29761536, val=4396785, oi=3623, retaddr=140734938367479) at
> > ../accel/tcg/cputlb.c:2449
> > #16 0x00007fff680245f7 in code_gen_buffer ()
> > #17 0x0000555555f754cb in cpu_tb_exec (cpu=0x7ffff5f730a0,
> > itb=0x7fffa802b400, tb_exit=0x7ffff5f7182c) at
> ../accel/tcg/cpu-exec.c:357
> > #18 0x0000555555f76366 in cpu_loop_exec_tb (cpu=0x7ffff5f730a0,
> > tb=0x7fffa802b400, last_tb=0x7ffff5f71840, tb_exit=0x7ffff5f7182c) at
> > ../accel/tcg/cpu-exec.c:842
> > #19 0x0000555555f76720 in cpu_exec (cpu=0x7ffff5f730a0) at
> > ../accel/tcg/cpu-exec.c:1001
> > #20 0x0000555555f993dd in tcg_cpus_exec (cpu=0x7ffff5f730a0) at
> > ../accel/tcg/tcg-accel-ops.c:67
> > #21 0x0000555555f9976d in mttcg_cpu_thread_fn (arg=0x7ffff5f730a0) at
> > ../accel/tcg/tcg-accel-ops-mttcg.c:95
> > #22 0x000055555624bf4d in qemu_thread_start (args=0x5555572b6780) at
> > ../util/qemu-thread-posix.c:556
> > #23 0x00007ffff770b609 in start_thread (arg=<optimized out>) at
> > pthread_create.c:477
> > #24 0x00007ffff7632293 in clone () at
> > ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> >
> > So it seems that the hw/misc/allwinner-h3-dramc.c file is using the call
> > memory_region_set_address, where internally we are calling
> > memory_region_del_subregion.
>
> Okay, so we're using memory_region_set_address() on an alias after
> marking it as enabled.
>
> memory_region_readd_subregion() detect if the region is already added
> via "mr->container" ... so in the old code, the
>
> memory_region_del_subregion()
> mr->container = container;
> memory_region_update_container_subregions(mr);
>
> I think the issue is that we want to do a "del+add" but we do a
> "del+hack", not a proper add.
>

Okey, yeah that makes sense.


>
> Would something like the following do the trick (untested)?:
>
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 0d39cf3da6..7a1c8158c5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2633,8 +2633,7 @@ static void
> memory_region_readd_subregion(MemoryRegion *mr)
>          memory_region_transaction_begin();
>          memory_region_ref(mr);
>          memory_region_del_subregion(container, mr);
> -        mr->container = container;
> -        memory_region_update_container_subregions(mr);
> +        memory_region_add_subregion_common(container, mr->addr, mr);
>          memory_region_unref(mr);
>          memory_region_transaction_commit();
>      }
>

Yes, this resolved the assertion problem indeed. I've re-run all acceptance
tests for the orangepi-pc machine with this change applied to
the current master at 95a6af2a00, and all tests are passing.

How do we proceed from here, can this become a new patch maybe?

Thanks for your help,
Niek

>
>
> --
> Thanks,
>
> David / dhildenb
>
>

-- 
Niek Linnenbank

--000000000000beaa0c05d6e55f43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi David,<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 31, 2022 at 9:11=
 AM David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 30.01.22 23:50, Niek Linnenbank wrote:<br>
&gt; Hi David,<br>
<br>
Hi Niek,<br>
<br>
thanks for the report.<br>
<br>
&gt; <br>
&gt; While I realize my response is quite late, I wanted to report this err=
or<br>
&gt; I found when running the acceptance<br>
&gt; tests for the orangepi-pc machine using avocado:<br>
&gt; <br>
&gt; ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avoca=
do<br>
&gt; --show=3Dapp,console run -t machine:orangepi-pc<br>
&gt; tests/avocado/boot_linux_console.py<br>
&gt; ...<br>
&gt; =C2=A0(4/5)<br>
&gt; tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi=
_bionic_20_08:<br>
&gt; -console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)<br=
>
&gt; \console: DRAM:<br>
&gt; INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeo=
ut<br>
&gt; reached\nOriginal status: ERROR\n{&#39;name&#39;:<br>
&gt; &#39;4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_bionic_20_08&#39;,<br>
&gt; &#39;logdir&#39;: &#39;/home/fox/avocado/job-results/job-2022-01-30T23=
.09-af49e...<br>
&gt; (90.64 s)<br>
&gt; =C2=A0(5/5)<br>
&gt; tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi=
_uboot_netbsd9:<br>
&gt; /console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)<br>
&gt; console: DRAM:<br>
&gt; INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeo=
ut<br>
&gt; reached\nOriginal status: ERROR\n{&#39;name&#39;:<br>
&gt; &#39;5-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_uboot_netbsd9&#39;,<br>
&gt; &#39;logdir&#39;: &#39;/home/fox/avocado/job-results/job-2022-01-30T23=
.09-af49...<br>
&gt; (90.64 s)<br>
&gt; RESULTS =C2=A0 =C2=A0: PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | I=
NTERRUPT 2 |<br>
&gt; CANCEL 0<br>
&gt; JOB TIME =C2=A0 : 221.25 s<br>
&gt; <br>
&gt; Basically the two tests freeze during the part where the U-Boot<br>
&gt; bootloader needs to detect the amount of memory. We model this in the<=
br>
&gt; hw/misc/allwinner-h3-dramc.c file.<br>
&gt; And when running the machine manually it shows an assert on<br>
&gt; &#39;alias-&gt;mapped_via_alias &gt;=3D 0&#39;. When running manually =
via gdb, I was<br>
&gt; able to collect this backtrace:<br>
&gt; <br>
&gt; $ gdb ./build/qemu-system-arm<br>
&gt; ...<br>
&gt; gdb) run -M orangepi-pc -nographic<br>
&gt; ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img<br>
&gt; ...<br>
&gt; U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)<br>
&gt; DRAM:<br>
&gt; qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion=
:<br>
&gt; Assertion `alias-&gt;mapped_via_alias &gt;=3D 0&#39; failed.<br>
&gt; <br>
&gt; Thread 4 &quot;qemu-system-arm&quot; received signal SIGABRT, Aborted.=
<br>
&gt; [Switching to Thread 0x7ffff5f72700 (LWP 32866)]<br>
&gt; __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c=
:50<br>
&gt; 50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.<br>
&gt; (gdb) bt<br>
&gt; #0 =C2=A0__GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linu=
x/raise.c:50<br>
&gt; #1 =C2=A00x00007ffff7535859 in __GI_abort () at abort.c:79<br>
&gt; #2 =C2=A00x00007ffff7535729 in __assert_fail_base<br>
&gt; =C2=A0 =C2=A0 (fmt=3D0x7ffff76cb588 &quot;%s%s%s:%u: %s%sAssertion `%s=
&#39; failed.\n%n&quot;,<br>
&gt; assertion=3D0x55555642fd65 &quot;alias-&gt;mapped_via_alias &gt;=3D 0&=
quot;,<br>
&gt; file=3D0x55555642f8cd &quot;../softmmu/memory.c&quot;, line=3D2588,<br=
>
&gt; function=3D&lt;optimized out&gt;)<br>
&gt; =C2=A0 =C2=A0 at assert.c:92<br>
&gt; #3 =C2=A00x00007ffff7546f36 in __GI___assert_fail<br>
&gt; =C2=A0 =C2=A0 (assertion=3D0x55555642fd65 &quot;alias-&gt;mapped_via_a=
lias &gt;=3D 0&quot;,<br>
&gt; file=3D0x55555642f8cd &quot;../softmmu/memory.c&quot;, line=3D2588,<br=
>
&gt; function=3D0x555556430690 &lt;__PRETTY_FUNCTION__.8&gt;<br>
&gt; &quot;memory_region_del_subregion&quot;) at assert.c:101<br>
&gt; #4 =C2=A00x0000555555e587e0 in memory_region_del_subregion<br>
&gt; (mr=3D0x555556f0bc00, subregion=3D0x7ffff5fa1090) at ../softmmu/memory=
.c:2588<br>
&gt; #5 =C2=A00x0000555555e589f3 in memory_region_readd_subregion<br>
&gt; (mr=3D0x7ffff5fa1090) at ../softmmu/memory.c:2630<br>
&gt; #6 =C2=A00x0000555555e58a5f in memory_region_set_address (mr=3D0x7ffff=
5fa1090,<br>
&gt; addr=3D1090519040) at ../softmmu/memory.c:2642<br>
&gt; #7 =C2=A00x0000555555ac352b in allwinner_h3_dramc_map_rows (s=3D0x7fff=
f5fa0c50,<br>
&gt; row_bits=3D16 &#39;\020&#39;, bank_bits=3D2 &#39;\002&#39;, page_size=
=3D512) at<br>
&gt; ../hw/misc/allwinner-h3-dramc.c:92<br>
&gt; #8 =C2=A00x0000555555ac36c2 in allwinner_h3_dramcom_write<br>
&gt; (opaque=3D0x7ffff5fa0c50, offset=3D0, val=3D4396785, size=3D4) at<br>
&gt; ../hw/misc/allwinner-h3-dramc.c:131<br>
&gt; #9 =C2=A00x0000555555e52561 in memory_region_write_accessor<br>
&gt; (mr=3D0x7ffff5fa11a0, addr=3D0, value=3D0x7ffff5f710e8, size=3D4, shif=
t=3D0,<br>
&gt; mask=3D4294967295, attrs=3D...) at ../softmmu/memory.c:492<br>
&gt; #10 0x0000555555e527ad in access_with_adjusted_size (addr=3D0,<br>
&gt; value=3D0x7ffff5f710e8, size=3D4, access_size_min=3D4, access_size_max=
=3D4,<br>
&gt; access_fn=3D<br>
&gt; =C2=A0 =C2=A0 0x555555e52467 &lt;memory_region_write_accessor&gt;, mr=
=3D0x7ffff5fa11a0,<br>
&gt; attrs=3D...) at ../softmmu/memory.c:554<br>
&gt; #11 0x0000555555e55935 in memory_region_dispatch_write<br>
&gt; (mr=3D0x7ffff5fa11a0, addr=3D0, data=3D4396785, op=3DMO_32, attrs=3D..=
.) at<br>
&gt; ../softmmu/memory.c:1514<br>
&gt; #12 0x0000555555f891ae in io_writex (env=3D0x7ffff5f7ce30,<br>
&gt; iotlbentry=3D0x7fffec0275f0, mmu_idx=3D7, val=3D4396785, addr=3D297615=
36,<br>
&gt; retaddr=3D140734938367479, op=3DMO_32) at ../accel/tcg/cputlb.c:1420<b=
r>
&gt; #13 0x0000555555f8ba10 in store_helper (env=3D0x7ffff5f7ce30,<br>
&gt; addr=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734938367479, =
op=3DMO_32)<br>
&gt; at ../accel/tcg/cputlb.c:2355<br>
&gt; #14 0x0000555555f8bdda in full_le_stl_mmu (env=3D0x7ffff5f7ce30,<br>
&gt; addr=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734938367479) =
at<br>
&gt; ../accel/tcg/cputlb.c:2443<br>
&gt; #15 0x0000555555f8be16 in helper_le_stl_mmu (env=3D0x7ffff5f7ce30,<br>
&gt; addr=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734938367479) =
at<br>
&gt; ../accel/tcg/cputlb.c:2449<br>
&gt; #16 0x00007fff680245f7 in code_gen_buffer ()<br>
&gt; #17 0x0000555555f754cb in cpu_tb_exec (cpu=3D0x7ffff5f730a0,<br>
&gt; itb=3D0x7fffa802b400, tb_exit=3D0x7ffff5f7182c) at ../accel/tcg/cpu-ex=
ec.c:357<br>
&gt; #18 0x0000555555f76366 in cpu_loop_exec_tb (cpu=3D0x7ffff5f730a0,<br>
&gt; tb=3D0x7fffa802b400, last_tb=3D0x7ffff5f71840, tb_exit=3D0x7ffff5f7182=
c) at<br>
&gt; ../accel/tcg/cpu-exec.c:842<br>
&gt; #19 0x0000555555f76720 in cpu_exec (cpu=3D0x7ffff5f730a0) at<br>
&gt; ../accel/tcg/cpu-exec.c:1001<br>
&gt; #20 0x0000555555f993dd in tcg_cpus_exec (cpu=3D0x7ffff5f730a0) at<br>
&gt; ../accel/tcg/tcg-accel-ops.c:67<br>
&gt; #21 0x0000555555f9976d in mttcg_cpu_thread_fn (arg=3D0x7ffff5f730a0) a=
t<br>
&gt; ../accel/tcg/tcg-accel-ops-mttcg.c:95<br>
&gt; #22 0x000055555624bf4d in qemu_thread_start (args=3D0x5555572b6780) at=
<br>
&gt; ../util/qemu-thread-posix.c:556<br>
&gt; #23 0x00007ffff770b609 in start_thread (arg=3D&lt;optimized out&gt;) a=
t<br>
&gt; pthread_create.c:477<br>
&gt; #24 0x00007ffff7632293 in clone () at<br>
&gt; ../sysdeps/unix/sysv/linux/x86_64/clone.S:95<br>
&gt; <br>
&gt; So it seems that the hw/misc/allwinner-h3-dramc.c file is using the ca=
ll<br>
&gt; memory_region_set_address, where internally we are calling<br>
&gt; memory_region_del_subregion.<br>
<br>
Okay, so we&#39;re using memory_region_set_address() on an alias after<br>
marking it as enabled.<br>
<br>
memory_region_readd_subregion() detect if the region is already added<br>
via &quot;mr-&gt;container&quot; ... so in the old code, the<br>
<br>
memory_region_del_subregion()<br>
mr-&gt;container =3D container;<br>
memory_region_update_container_subregions(mr);<br>
<br>
I think the issue is that we want to do a &quot;del+add&quot; but we do a<b=
r>
&quot;del+hack&quot;, not a proper add.<br></blockquote><div><br></div><div=
>Okey, yeah that makes sense.</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Would something like the following do the trick (untested)?:<br>
<br>
<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index 0d39cf3da6..7a1c8158c5 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -2633,8 +2633,7 @@ static void<br>
memory_region_readd_subregion(MemoryRegion *mr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_begin();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_ref(mr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_del_subregion(container, mr=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr-&gt;container =3D container;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_update_container_subregions(mr);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion_common(container, =
mr-&gt;addr, mr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_unref(mr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_commit();<br>
=C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>Yes, this resolve=
d the assertion problem indeed. I&#39;ve re-run all acceptance tests for th=
e orangepi-pc machine with this change applied to</div><div>the current mas=
ter at 95a6af2a00, and all tests are passing.</div><div><br></div><div>How =
do we proceed from here, can this become a new patch maybe? <br></div><div>=
<br></div><div>Thanks for your help,</div><div>Niek <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000beaa0c05d6e55f43--

