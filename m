Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25963E0365
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:35:15 +0200 (CEST)
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHzG-0001Lj-Pj
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBHyH-0008CW-To
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:34:13 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBHyF-0007c8-4F
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:34:13 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x14so3772362edr.12
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CqnJDrK8/trCPC7wIv1Mcve1vQw+jkDfTj2WeTZLMJo=;
 b=QnJuHSkFUn1ssiVgcMYEj57/gIxcoImzdeO4DX+XCNKmiHkHNK5iXd9zx59e7gKJqY
 J9okvFj+yrVIxDBp82yseiGRuZm0aSuBjY8b42tClxrTIkpC1lXM1joRbE22twumQLKQ
 tBzLqFuYg3VWerY9sf9yigl7V3KwxxBrOh/LaxmAVaS4nGZ0+Gehw+VSKdSlOaxPUWzN
 et23IlSv5aV4MQahE9yXoGLyEKyXc4folPxAtPr4y9BjS9CZTPS0x3GMtTk6QdrGExso
 BBaijVPnPnhnkVpJ/H1UWV4FF+XSBbiDkiudgz8RzROVzh7gz6BpGNku/h6vsKMKLywA
 F+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CqnJDrK8/trCPC7wIv1Mcve1vQw+jkDfTj2WeTZLMJo=;
 b=UXthuQq8fIoRTx2BTFcPpRkXCtJBM1OABJr05KVcVW5n9lrOLFJhVGtdvijjQuiVHF
 2AcnftaRk5WunQZPgQzKYJ7ttqgzGpVe/JduWcHE3eA+YgynfS/15VcgE3r5ht/B6d96
 0B6YHfGXhLI5diUDU6F6Q3pHfwrCiIofhFyqenwfYKZaSSQrxhhuCDfecI3fHJtVv/BV
 NO0ZmgdB3e8fFDFAaaOjFcnu/NLnOV+bxJ/duIOBIyY/9kULWVrKH6zYy57MKG8P84lD
 Vkc2t/SlMjTEKe1FEGfzO4N/lwNQpsAph1v+YKlhUF1t6x8rS2EmoEIOtw1xq41Tt6kW
 f1Yg==
X-Gm-Message-State: AOAM531sDIG5/Ec1RHv6EEMUXdvG1eLtd6tQlHeEpHMhJ7BnQwLx/DlB
 FN1ZyHOlCP1jYQVngr6C9LTer1WPowymzajewdC1MQ==
X-Google-Smtp-Source: ABdhPJxYzJzsKIksDn6IFhFeKH+HEFS0L/O+zb/P3kXxkQkX0wNmtIuI8R7edkONkV5lBgafq84nCebC0yG8J7n9Ils=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr52680edt.100.1628087648969;
 Wed, 04 Aug 2021 07:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-QcwjGtgzqkLshyU4NCq2ZhhdvJN3V_7rTCA4nUavhaQ@mail.gmail.com>
 <20210804094231-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210804094231-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 15:33:25 +0100
Message-ID: <CAFEAcA9yb9MzY3w1G5xcPdY0h-S=m2Z8YOxc7fLTU4TOJ4z6-w@mail.gmail.com>
Subject: Re: intermittent failure, s390 host, x86-64 guest, vhost-user-blk test
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 14:43, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Aug 04, 2021 at 01:40:37PM +0100, Peter Maydell wrote:
> > Saw this intermittent as part of my ad-hoc CI test setup.
> > The backtrace says that the QEMU process has somehow hung
> > during 'realize' of the vhost-user device...
>
> Hmm seems to have to do with the daemon not responding ...
> Cc a bunch more people ...

Here's another one; same thing, but a ppc64 guest, I think.

Process tree:
qos-test(34767)-+-qemu-storage-da(35116)
                `-qemu-system-ppc(35117)
===========================================================
PROCESS: 34767
ubuntu   34767 34766  0 09:03 ?        00:00:00 tests/qtest/qos-test
--tap -k -m quick
[New LWP 34769]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ff9b51165a in __libc_read (fd=<optimized out>,
buf=buf@entry=0x3ffcd77e180, nbytes=nbytes@entry=1024) at
../sysdeps/unix/sysv/linux/read.c:27
27      ../sysdeps/unix/sysv/linux/read.c: No such file or directory.

Thread 2 (Thread 0x3ff9aaff910 (LWP 34769)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
#1  0x000002aa06736a54 in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa067dc3a0 <rcu_call_ready_event>)
at ../../util/qemu-thread-posix.c:480
#3  0x000002aa0674efa4 in call_rcu_thread (opaque=opaque@entry=0x0) at
../../util/rcu.c:258
#4  0x000002aa06735a6a in qemu_thread_start (args=<optimized out>) at
../../util/qemu-thread-posix.c:541
#5  0x000003ff9b507aa8 in start_thread (arg=0x3ff9aaff910) at
pthread_create.c:463
#6  0x000003ff9b3fa11e in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff9bb70940 (LWP 34767)):
#0  0x000003ff9b51165a in __libc_read (fd=<optimized out>,
buf=buf@entry=0x3ffcd77e180, nbytes=nbytes@entry=1024) at
../sysdeps/unix/sysv/linux/read.c:27
#1  0x000002aa066dee7a in read (__nbytes=1024, __buf=0x3ffcd77e180,
__fd=<optimized out>) at /usr/include/s390x-linux-gnu/bits/unistd.h:44
#2  qtest_client_socket_recv_line (s=0x2aa0775f900) at
../../tests/qtest/libqtest.c:494
#3  0x000002aa066df032 in qtest_rsp_args (s=s@entry=0x2aa0775f900,
expected_args=expected_args@entry=1) at
../../tests/qtest/libqtest.c:521
#4  0x000002aa066df6f2 in qtest_query_target_endianness
(s=0x2aa0775f900) at ../../tests/qtest/libqtest.c:570
#5  0x000002aa066e0312 in qtest_init_without_qmp_handshake
(extra_args=<optimized out>) at ../../tests/qtest/libqtest.c:332
#6  0x000002aa066e09e2 in qtest_init (extra_args=<optimized out>) at
../../tests/qtest/libqtest.c:339
#7  0x000002aa066c7b76 in qtest_start (args=0x2aa07769df0 "-M pseries
-device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-347"...) at
../../tests/qtest/libqtest-single.h:29
#8  restart_qemu_or_continue (path=0x2aa07769df0 "-M pseries  -device
vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-347"...) at
../../tests/qtest/qos-test.c:105
#9  run_one_test (arg=<optimized out>) at ../../tests/qtest/qos-test.c:178
#10 0x000003ff9b7fc70c in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#11 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#13 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#16 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#17 0x000003ff9b7fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#18 0x000003ff9b7fc8ee in g_test_run_suite () from
/usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#19 0x000003ff9b7fc928 in g_test_run () from
/usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#20 0x000002aa066c6c9a in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at ../../tests/qtest/qos-test.c:338

===========================================================
PROCESS: 35116
ubuntu   35116 34767  0 09:03 ?        00:00:00
./storage-daemon/qemu-storage-daemon --blockdev
driver=file,node-name=disk0,filename=qtest.7TNoNG --export
type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-34767-sock.OysARz,node-name=disk0,writable=on,num-queues=8
--blockdev driver=file,node-name=disk1,filename=qtest.jZXeFU --export
type=vhost-user-blk,id=disk1,addr.type=unix,addr.path=/tmp/qtest-34767-sock.2aniJN,node-name=disk1,writable=on,num-queues=8
[New LWP 35124]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ff8b66f302 in __GI_ppoll (fds=0x2aa365db4b0, nfds=6,
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
at ../sysdeps/unix/sysv/linux/ppoll.c:39
39      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 2 (Thread 0x3ff80437910 (LWP 35124)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
#1  0x000002aa356cfa6c in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa357f1158 <rcu_call_ready_event>)
at ../../util/qemu-thread-posix.c:480
#3  0x000002aa356f498c in call_rcu_thread (opaque=opaque@entry=0x0) at
../../util/rcu.c:258
#4  0x000002aa356cea82 in qemu_thread_start (args=<optimized out>) at
../../util/qemu-thread-posix.c:541
#5  0x000003ff8b787aa8 in start_thread (arg=0x3ff80437910) at
pthread_create.c:463
#6  0x000003ff8b67a11e in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff8c6d90e0 (LWP 35116)):
#0  0x000003ff8b66f302 in __GI_ppoll (fds=0x2aa365db4b0, nfds=6,
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
at ../sysdeps/unix/sysv/linux/ppoll.c:39
#1  0x000002aa356db054 in ppoll (__ss=0x0, __timeout=0x0,
__nfds=<optimized out>, __fds=<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
timeout=timeout@entry=-1) at ../../util/qemu-timer.c:336
#3  0x000002aa356d1e48 in os_host_main_loop_wait (timeout=-1) at
../../util/main-loop.c:250
#4  main_loop_wait (nonblocking=<optimized out>) at ../../util/main-loop.c:531
#5  0x000002aa355b8dda in main (argc=<optimized out>,
argv=0x3ffe35ff3a8) at ../../storage-daemon/qemu-storage-daemon.c:345

===========================================================
PROCESS: 35117
ubuntu   35117 34767  0 09:03 ?        00:00:00 ./qemu-system-ppc64
-qtest unix:/tmp/qtest-34767.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-34767.qmp,id=char0 -mon
chardev=char0,mode=control -display none -M pseries -device
vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-34767-sock.OysARz
-chardev socket,id=char2,path=/tmp/qtest-34767-sock.2aniJN -accel
qtest
[New LWP 35121]
[New LWP 35122]
[New LWP 35123]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ffadc6f1b0 in __GI___poll (fds=0x2aa30cf1e70, nfds=2,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
29      ../sysdeps/unix/sysv/linux/poll.c: No such file or directory.

Thread 4 (Thread 0x3ff8f8c2910 (LWP 35123)):
#0  0x000003ffadd911f6 in __lll_lock_wait
(futex=futex@entry=0x2aa2fd3b5e0 <qemu_global_mutex>,
private=<optimized out>) at lowlevellock.c:46
#1  0x000003ffadd8a204 in __GI___pthread_mutex_lock
(mutex=mutex@entry=0x2aa2fd3b5e0 <qemu_global_mutex>) at
../nptl/pthread_mutex_lock.c:80
#2  0x000002aa2f380c36 in qemu_mutex_lock_impl (mutex=0x2aa2fd3b5e0
<qemu_global_mutex>, file=0x2aa2f4f6b98 "../../accel/dummy-cpus.c",
line=<optimized out>) at ../../util/qemu-thread-posix.c:79
#3  0x000002aa2f06dde0 in qemu_mutex_lock_iothread_impl
(file=file@entry=0x2aa2f4f6b98 "../../accel/dummy-cpus.c",
line=line@entry=52) at ../../softmmu/cpus.c:493
#4  0x000002aa2f0e706c in dummy_cpu_thread_fn
(arg=arg@entry=0x2aa310a4c00) at ../../accel/dummy-cpus.c:52
#5  0x000002aa2f380a7a in qemu_thread_start (args=<optimized out>) at
../../util/qemu-thread-posix.c:541
#6  0x000003ffadd87aa8 in start_thread (arg=0x3ff8f8c2910) at
pthread_create.c:463
#7  0x000003ffadc7a11e in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff901b4910 (LWP 35122)):
#0  0x000003ffadc6f1b0 in __GI___poll (fds=0x3ff800031f0, nfds=3,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ffaf2d2624 in  () at /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ffaf2d2aa8 in g_main_loop_run () at
/usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa2f1b4aa6 in iothread_run
(opaque=opaque@entry=0x2aa3093cb80) at ../../iothread.c:73
#4  0x000002aa2f380a7a in qemu_thread_start (args=<optimized out>) at
../../util/qemu-thread-posix.c:541
#5  0x000003ffadd87aa8 in start_thread (arg=0x3ff901b4910) at
pthread_create.c:463
#6  0x000003ffadc7a11e in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ffa0ab7910 (LWP 35121)):
#0  0x000003ffadd911f6 in __lll_lock_wait
(futex=futex@entry=0x2aa2fd3b5e0 <qemu_global_mutex>,
private=<optimized out>) at lowlevellock.c:46
#1  0x000003ffadd8a204 in __GI___pthread_mutex_lock
(mutex=mutex@entry=0x2aa2fd3b5e0 <qemu_global_mutex>) at
../nptl/pthread_mutex_lock.c:80
#2  0x000002aa2f380c36 in qemu_mutex_lock_impl (mutex=0x2aa2fd3b5e0
<qemu_global_mutex>, file=0x2aa2f919570 "../../util/rcu.c",
line=<optimized out>) at ../../util/qemu-thread-posix.c:79
#3  0x000002aa2f06dde0 in qemu_mutex_lock_iothread_impl
(file=file@entry=0x2aa2f919570 "../../util/rcu.c",
line=line@entry=266) at ../../softmmu/cpus.c:493
#4  0x000002aa2f3aa3ca in call_rcu_thread (opaque=opaque@entry=0x0) at
../../util/rcu.c:266
#5  0x000002aa2f380a7a in qemu_thread_start (args=<optimized out>) at
../../util/qemu-thread-posix.c:541
#6  0x000003ffadd87aa8 in start_thread (arg=0x3ffa0ab7910) at
pthread_create.c:463
#7  0x000003ffadc7a11e in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffb0935470 (LWP 35117)):
#0  0x000003ffadc6f1b0 in __GI___poll (fds=0x2aa30cf1e70, nfds=2,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ffaf2d2624 in  () at /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ffaf2d2aa8 in g_main_loop_run () at
/usr/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa2f16b4ce in vhost_user_read
(dev=dev@entry=0x2aa31c07e98, msg=msg@entry=0x3fff4c7ddac) at
../../hw/virtio/vhost-user.c:402
#4  0x000002aa2f16c85e in vhost_user_get_u64
(dev=dev@entry=0x2aa31c07e98, request=request@entry=1,
u64=u64@entry=0x3fff4c7e0e8) at ../../hw/virtio/vhost-user.c:1334
#5  0x000002aa2f16e378 in vhost_user_get_features
(features=0x3fff4c7e0e8, dev=0x2aa31c07e98) at
../../hw/virtio/vhost-user.c:1356
#6  0x000002aa2f16e378 in vhost_user_backend_init (dev=0x2aa31c07e98,
opaque=0x2aa31c08110, errp=0x3fff4c7e420) at
../../hw/virtio/vhost-user.c:1877
#7  0x000002aa2f08c354 in vhost_dev_init
(hdev=hdev@entry=0x2aa31c07e98, opaque=opaque@entry=0x2aa31c08110,
backend_type=backend_type@entry=VHOST_BACKEND_TYPE_USER,
busyloop_timeout=busyloop_timeout@entry=0,
errp=errp@entry=0x3fff4c7e420) at ../../hw/virtio/vhost.c:1302
#8  0x000002aa2f11721a in vhost_user_blk_connect
(dev=dev@entry=0x2aa31c07c48, errp=errp@entry=0x3fff4c7e420) at
../../hw/block/vhost-user-blk.c:339
#9  0x000002aa2f11771c in vhost_user_blk_realize_connect
(errp=0x3fff4c7e420, s=0x2aa31c07c48) at
../../hw/block/vhost-user-blk.c:440
#10 0x000002aa2f11771c in vhost_user_blk_device_realize
(dev=0x2aa31c07c48, errp=0x3fff4c7e420) at
../../hw/block/vhost-user-blk.c:513
#11 0x000002aa2f065078 in virtio_device_realize (dev=0x2aa31c07c48,
errp=0x3fff4c7e4e0) at ../../hw/virtio/virtio.c:3659
#12 0x000002aa2f2569d0 in device_set_realized (obj=<optimized out>,
value=<optimized out>, errp=0x3fff4c7e640) at ../../hw/core/qdev.c:761
#13 0x000002aa2f17c73a in property_set_bool
(obj=obj@entry=0x2aa31c07c48, v=v@entry=0x2aa31c515b0,
name=name@entry=0x2aa2f54928c "realized", opaque=0x2aa309ee830,
errp=errp@entry=0x3fff4c7e640) at ../../qom/object.c:2258
#14 0x000002aa2f17f2b4 in object_property_set
(obj=obj@entry=0x2aa31c07c48, name=name@entry=0x2aa2f54928c
"realized", v=v@entry=0x2aa31c515b0, errp=errp@entry=0x3fff4c7e930) at
../../qom/object.c:1403
#15 0x000002aa2f17c01c in object_property_set_qobject
(obj=obj@entry=0x2aa31c07c48, name=name@entry=0x2aa2f54928c
"realized", value=value@entry=0x2aa31c514f0,
errp=errp@entry=0x3fff4c7e930) at ../../qom/qom-qobject.c:28
#16 0x000002aa2f17f562 in object_property_set_bool (obj=0x2aa31c07c48,
name=0x2aa2f54928c "realized", value=<optimized out>,
errp=0x3fff4c7e930) at ../../qom/object.c:1473
#17 0x000002aa2ef3d27a in virtio_pci_realize (pci_dev=0x2aa31bffa50,
errp=0x3fff4c7e930) at ../../hw/virtio/virtio-pci.c:1907
#18 0x000002aa2ed95040 in pci_qdev_realize (qdev=0x2aa31bffa50,
errp=<optimized out>) at ../../hw/pci/pci.c:2148
#19 0x000002aa2f2569d0 in device_set_realized (obj=<optimized out>,
value=<optimized out>, errp=0x3fff4c7eb98) at ../../hw/core/qdev.c:761
#20 0x000002aa2f17c73a in property_set_bool
(obj=obj@entry=0x2aa31bffa50, v=v@entry=0x2aa31c4b500,
name=name@entry=0x2aa2f54928c "realized", opaque=0x2aa309ee830,
errp=errp@entry=0x3fff4c7eb98) at ../../qom/object.c:2258
#21 0x000002aa2f17f2b4 in object_property_set
(obj=obj@entry=0x2aa31bffa50, name=name@entry=0x2aa2f54928c
"realized", v=v@entry=0x2aa31c4b500, errp=errp@entry=0x2aa2fd583b8
<error_fatal>) at ../../qom/object.c:1403
#22 0x000002aa2f17c01c in object_property_set_qobject
(obj=obj@entry=0x2aa31bffa50, name=name@entry=0x2aa2f54928c
"realized", value=value@entry=0x2aa31c4b480,
errp=errp@entry=0x2aa2fd583b8 <error_fatal>) at
../../qom/qom-qobject.c:28
#23 0x000002aa2f17f562 in object_property_set_bool (obj=0x2aa31bffa50,
name=name@entry=0x2aa2f54928c "realized", value=value@entry=true,
errp=0x2aa2fd583b8 <error_fatal>, errp@entry=<error reading variable:
value has been optimized out>) at ../../qom/object.c:1473
#24 0x000002aa2f2555fe in qdev_realize (dev=<optimized out>,
bus=bus@entry=0x2aa31154980, errp=<error reading variable: value has
been optimized out>) at ../../hw/core/qdev.c:389
#25 0x000002aa2eda6ca4 in qdev_device_add (opts=<optimized out>,
errp=<optimized out>, errp@entry=0x2aa2fd583b8 <error_fatal>) at
../../softmmu/qdev-monitor.c:673
#26 0x000002aa2f10c23e in device_init_func (opaque=<optimized out>,
opts=<optimized out>, errp=0x2aa2fd583b8 <error_fatal>) at
../../softmmu/vl.c:1187
#27 0x000002aa2f389426 in qemu_opts_foreach (list=<optimized out>,
func=func@entry=0x2aa2f10c220 <device_init_func>,
opaque=opaque@entry=0x0, errp=0x2aa2fd583b8 <error_fatal>) at
../../util/qemu-option.c:1135
#28 0x000002aa2f10f1fe in qemu_create_cli_devices () at ../../softmmu/vl.c:2645
#29 0x000002aa2f10f1fe in qmp_x_exit_preconfig (errp=<optimized out>)
at ../../softmmu/vl.c:2693
#30 0x000002aa2f112586 in qemu_init (argc=<optimized out>,
argv=<optimized out>, envp=<optimized out>) at ../../softmmu/vl.c:3713
#31 0x000002aa2ecff442 in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at ../../softmmu/main.c:49

-- PMM

