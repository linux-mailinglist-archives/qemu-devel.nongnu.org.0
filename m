Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7741CD54
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 22:22:27 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVg5x-0007OY-MZ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 16:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVg4I-0005p7-CM
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 16:20:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVg4F-0002FT-Se
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 16:20:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f78-20020a1c1f51000000b0030cdb3d6079so2607691wmf.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFl9A+eQocEAUVeAXLkk8LMsFtyXeeli5XbJns1iLP4=;
 b=l2M68TKDiEU90jD8Rtb+xOx/NGQdx5pZPtGl8Kzhat3oWHZQODAyJ1o3HBS0ImvknM
 1tcrpJq0E5zUnjCDk2xRZ/2ZP/uMRRqj1/+BABy2i2GVnIhwG2jgv3DeQ4Kd4APaAcg9
 DnMOvREDNujei3+Ot38/MIojirzPy6dFb1bQd8UGdpRc2rh/eLJIvf7I5KULMMuDIash
 kzRw5Xfogx4ijNOgYey59Pef97tFjd0C0b+0IEkCda+fAoWp51KcXGTCAdGYQ1n4S5c2
 D5ZiBwiOcZdhBiQEw15fSpkQmcTjZcYZvDTHaC3/E+Hfsw26JHWgQzvfoJDShlWoso4X
 J8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFl9A+eQocEAUVeAXLkk8LMsFtyXeeli5XbJns1iLP4=;
 b=Vym6QauHIW7wp+BCuxjmYzQo3/Ova5NqjoPSAMAHUrzs1jpWAqhXztJK+6b2B3/yZG
 XZWRoh9lU08DZTZNdJiS/MxYqyTPbmU/jX38bFhwLhyj0dE2BxvMzOzqxANj9yerdc3d
 hDDFd3Xde3ScDOqAh1DH3ircrjbQ6QVpwAtxovcjv8wOQAlxx2B/2eylFYd9doktyO98
 qgrvjF3zjW8LHLY4AbrW8mwamKDRHEkb0o3uYcXffRQQ2MAM10QRn8n8PfzB2IzpyPvr
 em/ROCcOAU7Pl9GfYelTf1G11iRL4bpFEAD7BnJapo8TxYhKtFOTeFy7x4L/e8AGYBJZ
 Io8g==
X-Gm-Message-State: AOAM532mkVB04tiYy1ZpOWWd8gWKbZ9uqx5ZtsTbizj4Lw4ITTA/N0oI
 GshSjCmNx+wV8qWfj2Kyx0zwLcxNU187YmK6lN4H0Q==
X-Google-Smtp-Source: ABdhPJxGSZTjAmlSknEiGKItGfh/lHI8MkfO3yZZssnZBsHKOqWoEjqMDOofVzf+XC4fT2YkDpuCYax0CblGEDYaTl8=
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr12425998wmq.21.1632946836614; 
 Wed, 29 Sep 2021 13:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210928125116.183620-1-pbonzini@redhat.com>
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Sep 2021 21:19:42 +0100
Message-ID: <CAFEAcA_K_xaqbiLig4NNMuWMM2uyeU_r8z5c+k7Wb09rSR2d2w@mail.gmail.com>
Subject: Re: [PULL 00/33] x86 and misc changes for 2021-09-28
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Sept 2021 at 14:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 14f02d8a9ec1746823c106933a4c8f062f9e0f95:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/integration-testing-20210927' into staging (2021-09-27 19:52:43 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 824ba1e99c8bc12048636ea43dec923385ff042f:
>
>   meson_options.txt: Switch the default value for the vnc option to 'auto' (2021-09-28 14:50:14 +0200)
>
> ----------------------------------------------------------------
> * SGX implementation for x86
> * Miscellaneous bugfixes
> * Fix dependencies from ROMs to qtests
>
> ----------------------------------------------------------------

This causes "make check" to hang on my local x86-64 machine
(consistently). Last output printed is:

Not run: 220 287
Passed all 121 iotests
make: Leaving directory '/mnt/nvmedisk/linaro/qemu-for-merges/build/all'
make: Entering directory '/mnt/nvmedisk/linaro/qemu-for-merges/build/all'
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/pxe-test --tap -k
Broken pipe
ERROR qtest-i386/pxe-test - too few tests run (expected 4, got 0)
Makefile.mtest:664: recipe for target 'run-test-81' failed
make: *** [run-test-81] Error 1
make: Leaving directory '/mnt/nvmedisk/linaro/qemu-for-merges/build/all'
make: *** Waiting for unfinished jobs....
make: Entering directory '/mnt/nvmedisk/linaro/qemu-for-merges/build/all'
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/bios-tables-test --tap -k
Broken pipe
ERROR qtest-i386/bios-tables-test - too few tests run (expected 37, got 0)
Makefile.mtest:368: recipe for target 'run-test-44' failed
make: *** [run-test-44] Error 1
make: Leaving directory '/mnt/nvmedisk/linaro/qemu-for-merges/build/all'

and tests/qtest/migration-test, tests/qtest/vmgenid-test and
tests/qtest/cdrom-test are all still running, but hung,
for a qemu-system-i386 guest.

Backtraces for cdrom-test; both processes are at 95%+ CPU
usage, so they're livelocked I guess.
The vmgenid-test hang looks similar to this one, with the test process
in qtest_qmp_receive and the QEMU process in pci_host_config_write_common().


cdrom-test(29050)---qemu-system-i38(29059)
===========================================================
PROCESS: 29050
petmay01 29050 29048 94 18:23 pts/3    02:42:16 tests/qtest/cdrom-test
--tap -k -m quick
[New LWP 29052]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
0x00007f56c73ee557 in g_list_last () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0

Thread 2 (Thread 0x7f56c6785700 (LWP 29052)):
#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x00005586532a767b in qemu_futex_wait (val=<optimised out>,
f=<optimised out>) at
/mnt/nvmedisk/linaro/qemu-for-merges/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x5586534d4c68
<rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:480
#3  0x00005586532a5428 in call_rcu_thread (opaque=opaque@entry=0x0) at
../../util/rcu.c:258
#4  0x00005586532a6796 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:557
#5  0x00007f56c6df06db in start_thread (arg=0x7f56c6785700) at
pthread_create.c:463
#6  0x00007f56c6b1971f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7f56c78af180 (LWP 29050)):
#0  0x00007f56c73ee557 in g_list_last () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#1  0x00007f56c73ee5b8 in g_list_append () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x000055865328744f in qtest_qmp_receive (s=0x558654965c00) at
../../tests/qtest/libqtest.c:642
#3  0x0000558653287c62 in qtest_vqmp (s=<optimised out>,
fmt=<optimised out>, ap=ap@entry=0x7ffe72cb7160) at
../../tests/qtest/libqtest.c:749
#4  0x0000558653287f34 in qtest_qmp (s=s@entry=0x558654965c00,
fmt=fmt@entry=0x5586532b523d "{ 'execute': 'query-status' }") at
../../tests/qtest/libqtest.c:790
#5  0x00005586532862db in boot_sector_test (qts=0x558654965c00) at
../../tests/qtest/boot-sector.c:161
#6  0x0000558653285fa4 in test_cdboot (data=<optimised out>) at
../../tests/qtest/cdrom-test.c:125
#7  0x00007f56c741905a in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#8  0x00007f56c7418f8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#9  0x00007f56c7418f8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#10 0x00007f56c7418f8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#11 0x00007f56c7419232 in g_test_run_suite () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#12 0x00007f56c7419251 in g_test_run () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#13 0x0000558653285473 in main (argc=<optimised out>, argv=<optimised
out>) at ../../tests/qtest/cdrom-test.c:235

===========================================================
PROCESS: 29059
petmay01 29059 29050 98 18:23 pts/3    02:49:53 ./qemu-system-i386
-qtest unix:/tmp/qtest-29050.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-29050.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg
-no-shutdown -cdrom cdrom-boot-iso-AphMQp -accel qtest
[New LWP 29074]
[New LWP 29078]
[New LWP 29080]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
0x00007fe4151ccdb6 in __GI_ppoll (fds=0x562d23a3a8c0, nfds=5,
timeout=<optimised out>, timeout@entry=0x7ffe201ef100,
sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39
39      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 4 (Thread 0x7fe3fabf6700 (LWP 29080)):
#0  0x0000562d2099581f in flatview_ref
(view=view@entry=0x562d2349bea0) at ../../softmmu/memory.c:303
#1  0x0000562d20996e1b in address_space_get_flatview
(as=as@entry=0x562d23735418) at ../../softmmu/memory.c:813
#2  0x0000562d20996eef in address_space_update_ioeventfds
(as=as@entry=0x562d23735418) at ../../softmmu/memory.c:835
#3  0x0000562d2099a6a8 in memory_region_transaction_commit () at
../../softmmu/memory.c:1104
#4  0x0000562d20759432 in pci_update_mappings
(d=d@entry=0x562d23b564b0) at ../../hw/pci/pci.c:1402
#5  0x0000562d20759b49 in pci_default_write_config (d=0x562d23b564b0,
addr=4, val_in=259, l=2) at ../../hw/pci/pci.c:1462
#6  0x0000562d2087beab in pci_host_config_write_common
(pci_dev=0x562d23b564b0, addr=4, limit=<optimised out>, val=259,
len=2) at ../../hw/pci/pci_host.c:83
#7  0x0000562d20998f61 in memory_region_write_accessor
(mr=0x562d236fc5a0, addr=0, value=<optimised out>, size=2,
shift=<optimised out>, mask=<optimised out>, attrs=...) at
../../softmmu/memory.c:492
#8  0x0000562d20995326 in access_with_adjusted_size
(addr=addr@entry=0, value=value@entry=0x7fe3fabf2f18,
size=size@entry=2, access_size_min=<optimised out>,
access_size_max=<optimised out>, access_fn=0x562d20998ed0
<memory_region_write_accessor>, mr=0x562d236fc5a0, attrs=...) at
../../softmmu/memory.c:554
#9  0x0000562d209984d2 in memory_region_dispatch_write
(mr=mr@entry=0x562d236fc5a0, addr=0, data=<optimised out>,
op=<optimised out>, attrs=attrs@entry=...) at
../../softmmu/memory.c:1511
#10 0x0000562d209c9bbd in flatview_write_continue
(fv=fv@entry=0x7fe3dc38f9f0, addr=addr@entry=3324, attrs=...,
ptr=ptr@entry=0x7fe41d8b3000, len=len@entry=2, addr1=<optimised out>,
l=<optimised out>, mr=0x562d236fc5a0) at ../../softmmu/physmem.c:2782
#11 0x0000562d209c9d56 in flatview_write (fv=0x7fe3dc38f9f0,
addr=addr@entry=3324, attrs=attrs@entry=...,
buf=buf@entry=0x7fe41d8b3000, len=len@entry=2) at
../../softmmu/physmem.c:2822
#12 0x0000562d209cc990 in address_space_write (as=0x562d217ddf80
<address_space_io>, addr=3324, attrs=..., buf=0x7fe41d8b3000, len=2)
at ../../softmmu/physmem.c:2914
#13 0x0000562d209cca35 in address_space_rw (as=<optimised out>,
addr=addr@entry=3324, attrs=..., attrs@entry=..., buf=<optimised out>,
len=len@entry=2, is_write=is_write@entry=true) at
../../softmmu/physmem.c:2924
#14 0x0000562d20a35783 in kvm_handle_io (count=1, size=2,
direction=<optimised out>, data=<optimised out>, attrs=..., port=3324)
at ../../accel/kvm/kvm-all.c:2635
#15 0x0000562d20a35783 in kvm_cpu_exec (cpu=cpu@entry=0x562d23587740)
at ../../accel/kvm/kvm-all.c:2886
#16 0x0000562d20a3b5c5 in kvm_vcpu_thread_fn
(arg=arg@entry=0x562d23587740) at ../../accel/kvm/kvm-accel-ops.c:49
#17 0x0000562d20c95346 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:557
#18 0x00007fe4154b06db in start_thread (arg=0x7fe3fabf6700) at
pthread_create.c:463
#19 0x00007fe4151d971f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7fe3fb5d9700 (LWP 29078)):
#0  0x00007fe4151cccb9 in __GI___poll (fds=0x7fe3f0003240, nfds=3,
timeout=-1) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007fe41b6676e9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fe41b667a82 in g_main_loop_run () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x0000562d20aa7c71 in iothread_run
(opaque=opaque@entry=0x562d231d9ef0) at ../../iothread.c:73
#4  0x0000562d20c95346 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:557
#5  0x00007fe4154b06db in start_thread (arg=0x7fe3fb5d9700) at
pthread_create.c:463
#6  0x00007fe4151d971f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7fe3fc7dd700 (LWP 29074)):
#0  0x00007fe4154bad50 in __GI___nanosleep
(requested_time=0x7fe3fc7da0e0, remaining=0x7fe3fc7da0f0) at
../sysdeps/unix/sysv/linux/nanosleep.c:28
#1  0x00007fe41b69097f in g_usleep () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x0000562d20c83e69 in call_rcu_thread (opaque=opaque@entry=0x0) at
../../util/rcu.c:250
#3  0x0000562d20c95346 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:557
#4  0x00007fe4154b06db in start_thread (arg=0x7fe3fc7dd700) at
pthread_create.c:463
#5  0x00007fe4151d971f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7fe41d83c440 (LWP 29059)):
#0  0x00007fe4151ccdb6 in __GI_ppoll (fds=0x562d23a3a8c0, nfds=5,
timeout=<optimised out>, timeout@entry=0x7ffe201ef100,
sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39
#1  0x0000562d20c98949 in ppoll (__ss=0x0, __timeout=0x7ffe201ef100,
__nfds=<optimised out>, __fds=<optimised out>) at
/usr/include/x86_64-linux-gnu/bits/poll2.h:77
#2  0x0000562d20c98949 in qemu_poll_ns (fds=<optimised out>,
nfds=<optimised out>, timeout=timeout@entry=28296000) at
../../util/qemu-timer.c:348
#3  0x0000562d20c9b605 in os_host_main_loop_wait (timeout=28296000) at
../../util/main-loop.c:250
#4  0x0000562d20c9b605 in main_loop_wait
(nonblocking=nonblocking@entry=0) at ../../util/main-loop.c:531
#5  0x0000562d20994e06 in qemu_main_loop () at ../../softmmu/runstate.c:726
#6  0x0000562d206c46de in main (argc=<optimised out>, argv=<optimised
out>, envp=<optimised out>) at ../../softmmu/main.c:50


-- PMM

