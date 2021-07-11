Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BEE3C3FA7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 00:27:00 +0200 (CEST)
Received: from localhost ([::1]:60876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2hud-00018F-3X
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 18:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m2htF-0000Sx-0V
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 18:25:33 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m2htC-0001rx-GA
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 18:25:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id x16so7234723plg.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4xP5t8mbNTCq28DoX29XcI9bQOEQDPuhzE7zRD0VIPQ=;
 b=NNTBPwvCvmjvDrmwG7jRHlZ5MfzaaIkIQZq7Hx4gg73+NWMWBGf6umY0gHQQEsQhbC
 FrGtlSvzQ5ZwuBC+33gks1V9EN5JDW8hlia7VlCFJj4wdDOXkmo9TbGq/Vb1YEwHsoSU
 ms9r41tF6A8lnO4o3gv8OiSJb01RGlPw4WUzBmyvEjd9XcGze5RThbZBUXa2vJ5k0RKT
 OEeOUzApwfAumEQvJHDuzJQQDam2jQARqWNLJLWzmGe2L9ARlptP0OmNzfuB0vus+aYp
 jDfe79ddyFUpDzK3VQIxzDMVx1o66lj3XV47i5vUxBBsuRbPwPI2ny0sBg03NYahFZoP
 HQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4xP5t8mbNTCq28DoX29XcI9bQOEQDPuhzE7zRD0VIPQ=;
 b=fjZhtmxKzGhJpphUiAdO37nnquVg3y+N4YMCi9Id733H2KKu69EQarbYUwHdph7rfn
 ZkQ51iqu3xuH1yel+1VZqfSeAFFgVMkHusKEHIYHjvj4nL/irUCULVFQbzCiE8tAx/pS
 v5vGpiHinTred8WpMv+LXL1riCqnw3a3gEtGbJZNy10xPjiqtSwQ5vSePuFDTTDoyP7L
 Flfyw5Rg6Mwd5wtwDy7VbF5ORXPj2NokiCSBdk4K14ZklEfA2MW1mgSnYKTSG6i3ODJq
 oT2uACHs7jUN7cVRbO1gEJbHI9y4PzP0ncWuDcp0USZVoxPxDuLQRaFH+Z3LTE8gwiyi
 huHQ==
X-Gm-Message-State: AOAM5304dlkXAIZVXtuwq5mYZ/MeTQcgko5ju2gFuZXYwERoRovYVNC/
 2K2VKxj29VXbfI3CuB5lH6Y=
X-Google-Smtp-Source: ABdhPJxvNLEfKqmFN5UXI3JniAObQaxpS1l5iXIBSi/5jMv9TrV24vYpMg0lFq/oP8qMfvYO0V4PGA==
X-Received: by 2002:a17:90a:a6e:: with SMTP id
 o101mr30472769pjo.208.1626042329128; 
 Sun, 11 Jul 2021 15:25:29 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h9sm15312925pgi.43.2021.07.11.15.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 15:25:28 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 12 Jul 2021 06:20:33 +0800
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
Message-ID: <20210711222033.tb3paw53ayxrkagb@Rk>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=coiby.xu@gmail.com; helo=mail-pl1-x633.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 11, 2021 at 04:53:51PM +0100, Peter Maydell wrote:
>On Sat, 10 Jul 2021 at 14:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> I've noticed recently that intermittently 'make check' will hang on
>> my aarch32 test system (really an aarch64 box with an aarch32 chroot).
>>
>> I think from grep that this must be the vhost-user-blk test.
>
>I've also now seen this on qemu-system-i386 guest x86-64 Linux host:

Good to to know that! This makes it much easier for me to debug this
issue.

>
>Process tree:
>petmay01 28992  0.0  0.0 123812  8612 ?        Sl   14:46   0:01
>                           \_ tests/qtest/qos-test --tap -k -m quick
>petmay01 30068  0.0  0.0 379204 20580 ?        Sl   14:46   0:00
>                           |   \_ ./storage-daemon/qemu-storage-daemon
>--blockdev driver=file,node-name=disk0,filename=qtest.6kY6px --export
>type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-28992-sock.4Kgtk1,node-name=disk0,writable=on,num-queues=1
>petmay01 30070  0.0  0.1 1083248 63748 ?       Sl   14:46   0:00
>                           |   \_ ./qemu-system-i386 -qtest
>unix:/tmp/qtest-28992.sock -qtest-log /dev/null -chardev
>socket,path=/tmp/qtest-28992.qmp,id=char0 -mon
>chardev=char0,mode=control -display none -M pc -device
>vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
>memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem
>-m 256M -chardev socket,id=char1,path=/tmp/qtest-28992-sock.4Kgtk1
>-accel qtest
>
>
>Backtrace, qos-test:
>(gdb) thread apply all bt
>
>Thread 2 (Thread 0x7fd086f1c700 (LWP 28995)):
>#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
>#1  0x000056448599484b in qemu_futex_wait (val=<optimised out>,
>f=<optimised out>)
>    at /mnt/nvmedisk/linaro/qemu-for-merges/include/qemu/futex.h:29
>#2  qemu_event_wait (ev=ev@entry=0x564485c322e8 <rcu_call_ready_event>)
>    at ../../util/qemu-thread-posix.c:480
>#3  0x000056448599dc18 in call_rcu_thread (opaque=opaque@entry=0x0) at
>../../util/rcu.c:258
>#4  0x0000564485993966 in qemu_thread_start (args=<optimised out>)
>    at ../../util/qemu-thread-posix.c:541
>#5  0x00007fd088b446db in start_thread (arg=0x7fd086f1c700) at
>pthread_create.c:463
>#6  0x00007fd08886d71f in clone () at
>../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>Thread 1 (Thread 0x7fd089d9a900 (LWP 28992)):
>#0  0x00007fd088b4e474 in __libc_read (fd=6,
>buf=buf@entry=0x7fff05f024f0, nbytes=nbytes@entry=1024)
>    at ../sysdeps/unix/sysv/linux/read.c:27
>#1  0x0000564485947cb2 in read (__nbytes=1024, __buf=0x7fff05f024f0,
>__fd=<optimised out>)
>    at /usr/include/x86_64-linux-gnu/bits/unistd.h:44
>#2  qtest_client_socket_recv_line (s=0x5644866f38b0) at
>../../tests/qtest/libqtest.c:494
>#3  0x0000564485947e61 in qtest_rsp_args (s=s@entry=0x5644866f38b0,
>    expected_args=expected_args@entry=1) at ../../tests/qtest/libqtest.c:521
>#4  0x000056448594846f in qtest_query_target_endianness (s=0x5644866f38b0)
>    at ../../tests/qtest/libqtest.c:570
>#5  0x0000564485948ed2 in qtest_init_without_qmp_handshake
>(extra_args=<optimised out>)
>    at ../../tests/qtest/libqtest.c:332
>#6  0x0000564485949616 in qtest_init (extra_args=<optimised out>) at
>../../tests/qtest/libqtest.c:339
>#7  0x00005644859338cd in qtest_start (
>    args=0x5644866f6d00 "-M pc  -device
>vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
>memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
>-m 256M -chardev socket,id=char1,path=/tmp/qtest-28992-so"...) at
>../../tests/qtest/libqtest-single.h:29
>#8  restart_qemu_or_continue (
>    path=0x5644866f6d00 "-M pc  -device
>vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
>memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
>-m 256M -chardev socket,id=char1,path=/tmp/qtest-28992-so"...) at
>../../tests/qtest/qos-test.c:105
>#9  run_one_test (arg=<optimised out>) at ../../tests/qtest/qos-test.c:178
>#10 0x00007fd08990c05a in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#11 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#12 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#13 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#14 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#15 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#16 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#17 0x00007fd08990bf8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#18 0x00007fd08990c232 in g_test_run_suite () from
>/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#19 0x00007fd08990c251 in g_test_run () from
>/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#20 0x0000564485932359 in main (argc=<optimised out>, argv=<optimised
>out>, envp=<optimised out>)
>    at ../../tests/qtest/qos-test.c:338
>
>Backtrace, qemu-system-i386:Thread 4 (Thread 0x7f965ac7f700 (LWP 30079)):
>#0  0x00007f9674b6938c in __GI___sigtimedwait (set=<optimised out>,
>    set@entry=0x7f965ac7c090, info=info@entry=0x7f965ac7bfd0,
>timeout=timeout@entry=0x0)
>    at ../sysdeps/unix/sysv/linux/sigtimedwait.c:42
>#1  0x00007f9674f2c54c in __sigwait (set=set@entry=0x7f965ac7c090,
>sig=sig@entry=0x7f965ac7c08c)
>    at ../sysdeps/unix/sysv/linux/sigwait.c:28
>#2  0x000055c2a04af6b3 in dummy_cpu_thread_fn (arg=arg@entry=0x55c2a1727aa0)
>    at ../../accel/dummy-cpus.c:46
>#3  0x000055c2a07664e6 in qemu_thread_start (args=<optimised out>)
>    at ../../util/qemu-thread-posix.c:541
>#4  0x00007f9674f216db in start_thread (arg=0x7f965ac7f700) at
>pthread_create.c:463
>#5  0x00007f9674c4a71f in clone () at
>../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>Thread 3 (Thread 0x7f965b662700 (LWP 30078)):
>#0  0x00007f9674c3dcb9 in __GI___poll (fds=0x7f963c003240, nfds=3, timeout=-1)
>    at ../sysdeps/unix/sysv/linux/poll.c:29
>#1  0x00007f967969a6e9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#2  0x00007f967969aa82 in g_main_loop_run () at
>/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#3  0x000055c2a05ce261 in iothread_run
>(opaque=opaque@entry=0x55c2a144af00) at ../../iothread.c:73
>#4  0x000055c2a07664e6 in qemu_thread_start (args=<optimised out>)
>    at ../../util/qemu-thread-posix.c:541
>#5  0x00007f9674f216db in start_thread (arg=0x7f965b662700) at
>pthread_create.c:463
>#6  0x00007f9674c4a71f in clone () at
>../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>Thread 2 (Thread 0x7f965bf64700 (LWP 30076)):
>#0  0x00007f9674f2b1fd in __lll_lock_wait () at
>../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:135
>#1  0x00007f9674f24025 in __GI___pthread_mutex_lock
>(mutex=mutex@entry=0x55c2a12cad80 <qemu_global_mutex>) at
>../nptl/pthread_mutex_lock.c:80
>#2  0x000055c2a0766649 in qemu_mutex_lock_impl (mutex=0x55c2a12cad80
><qemu_global_mutex>, file=0x55c2a0cec7c2 "../../util/rcu.c", line=266)
>at ../../util/qemu-thread-posix.c:79
>#3  0x000055c2a0522c3f in qemu_mutex_lock_iothread_impl
>(file=file@entry=0x55c2a0cec7c2 "../../util/rcu.c",
>line=line@entry=266) at ../../softmmu/cpus.c:493
>#4  0x000055c2a0773a5d in call_rcu_thread (opaque=opaque@entry=0x0) at
>../../util/rcu.c:266
>#5  0x000055c2a07664e6 in qemu_thread_start (args=<optimised out>)
>    at ../../util/qemu-thread-posix.c:541
>#6  0x00007f9674f216db in start_thread (arg=0x7f965bf64700) at
>pthread_create.c:463
>#7  0x00007f9674c4a71f in clone () at
>../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>Thread 1 (Thread 0x7f967cfc3440 (LWP 30070)):
>#0  0x00007f9674c3dcb9 in __GI___poll (fds=0x55c2a165ea00, nfds=2, timeout=-1)
>    at ../sysdeps/unix/sysv/linux/poll.c:29
>#1  0x00007f967969a6e9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#2  0x00007f967969aa82 in g_main_loop_run () at
>/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>#3  0x000055c2a04afe5e in vhost_user_read
>(dev=dev@entry=0x55c2a24a9c80, msg=msg@entry=0x7ffc2dc57ca0)
>    at ../../hw/virtio/vhost-user.c:402
>#4  0x000055c2a04b10f9 in vhost_user_get_u64
>(dev=dev@entry=0x55c2a24a9c80, request=request@entry=1,
>u64=u64@entry=0x7ffc2dc57f60) at ../../hw/virtio/vhost-user.c:1334
>#5  0x000055c2a04b2b9e in vhost_user_get_features
>(features=0x7ffc2dc57f60, dev=0x55c2a24a9c80)
>    at ../../hw/virtio/vhost-user.c:1356
>#6  0x000055c2a04b2b9e in vhost_user_backend_init (dev=0x55c2a24a9c80,
>opaque=0x55c2a24a9f00, errp=0x7ffc2dc580e0) at
>../../hw/virtio/vhost-user.c:1877
>#7  0x000055c2a04a0d06 in vhost_dev_init
>(hdev=hdev@entry=0x55c2a24a9c80, opaque=opaque@entry=0x55c2a24a9f00,
>backend_type=backend_type@entry=VHOST_BACKEND_TYPE_USER,
>busyloop_timeout=busyloop_timeout@entry=0,
>errp=errp@entry=0x7ffc2dc580e0) at ../../hw/virtio/vhost.c:1302
>#8  0x000055c2a04bb09e in vhost_user_blk_connect
>(dev=dev@entry=0x55c2a24a9a30, errp=errp@entry=0x7ffc2dc580e0) at
>../../hw/block/vhost-user-blk.c:339
>#9  0x000055c2a04bb59b in vhost_user_blk_realize_connect
>(errp=0x7ffc2dc580e0, s=0x55c2a24a9a30)
>    at ../../hw/block/vhost-user-blk.c:440
>#10 0x000055c2a04bb59b in vhost_user_blk_device_realize
>(dev=0x55c2a24a9a30, errp=0x7ffc2dc580e0)
>    at ../../hw/block/vhost-user-blk.c:513
>#11 0x000055c2a05544b8 in virtio_device_realize (dev=0x55c2a24a9a30,
>errp=0x7ffc2dc58130)
>    at ../../hw/virtio/virtio.c:3657
>#12 0x000055c2a05b9b76 in device_set_realized (obj=0x55c2a24a9a30,
>value=true, errp=0x7ffc2dc581b0)
>    at ../../hw/core/qdev.c:761
>#13 0x000055c2a05a5f86 in property_set_bool (obj=0x55c2a24a9a30,
>v=<optimised out>, name=<optimised out>, opaque=0x55c2a14268e0,
>errp=0x7ffc2dc581b0) at ../../qom/object.c:2257
>#14 0x000055c2a05a83ab in object_property_set
>(obj=obj@entry=0x55c2a24a9a30, name=name@entry=0x55c2a0902a99
>"realized", v=v@entry=0x55c2a24f4eb0, errp=errp@entry=0x7ffc2dc58300)
>at ../../qom/object.c:1402
>#15 0x000055c2a05ab36f in object_property_set_qobject
>(obj=obj@entry=0x55c2a24a9a30, name=name@entry=0x55c2a0902a99
>"realized", value=value@entry=0x55c2a24f4df0,
>errp=errp@entry=0x7ffc2dc58300)
>    at ../../qom/qom-qobject.c:28
>#16 0x000055c2a05a85e4 in object_property_set_bool
>(obj=0x55c2a24a9a30, name=0x55c2a0902a99 "realized", value=<optimised
>out>, errp=0x7ffc2dc58300) at ../../qom/object.c:1472
>#17 0x000055c2a036a47f in virtio_pci_realize (pci_dev=0x55c2a24a17b0,
>errp=0x7ffc2dc58300)
>    at ../../hw/virtio/virtio-pci.c:1907
>#18 0x000055c2a038f64f in pci_qdev_realize (qdev=0x55c2a24a17b0,
>errp=<optimised out>)
>    at ../../hw/pci/pci.c:2116
>#19 0x000055c2a05b9b76 in device_set_realized (obj=0x55c2a24a17b0,
>value=true, errp=0x7ffc2dc58410)
>    at ../../hw/core/qdev.c:761
>#20 0x000055c2a05a5f86 in property_set_bool (obj=0x55c2a24a17b0,
>v=<optimised out>, name=<optimised out>, opaque=0x55c2a14268e0,
>errp=0x7ffc2dc58410) at ../../qom/object.c:2257
>#21 0x000055c2a05a83ab in object_property_set
>(obj=obj@entry=0x55c2a24a17b0, name=name@entry=0x55c2a0902a99
>"realized", v=v@entry=0x55c2a24ef1c0, errp=errp@entry=0x55c2a12ded88
><error_fatal>)
>    at ../../qom/object.c:1402
>#22 0x000055c2a05ab36f in object_property_set_qobject
>(obj=obj@entry=0x55c2a24a17b0, name=name@entry=0x55c2a0902a99
>"realized", value=value@entry=0x55c2a24ef180,
>errp=errp@entry=0x55c2a12ded88 <error_fatal>)
>    at ../../qom/qom-qobject.c:28
>#23 0x000055c2a05a85e4 in object_property_set_bool
>(obj=0x55c2a24a17b0, name=name@entry=0x55c2a0902a99 "realized",
>value=value@entry=true, errp=errp@entry=0x55c2a12ded88 <error_fatal>)
>    at ../../qom/object.c:1472
>#24 0x000055c2a05b8a3c in qdev_realize (dev=<optimised out>,
>bus=bus@entry=0x55c2a189c160, errp=errp@entry=0x55c2a12ded88
><error_fatal>) at ../../hw/core/qdev.c:389
>#25 0x000055c2a0312c8e in qdev_device_add (opts=0x55c2a1422400,
>errp=errp@entry=0x55c2a12ded88 <error_fatal>) at
>../../softmmu/qdev-monitor.c:673
>#26 0x000055c2a04e5e7f in device_init_func (opaque=<optimised out>,
>opts=<optimised out>, errp=0x55c2a12ded88 <error_fatal>) at
>../../softmmu/vl.c:1183
>#27 0x000055c2a076fbda in qemu_opts_foreach (list=<optimised out>,
>func=func@entry=0x55c2a04e5e70 <device_init_func>,
>opaque=opaque@entry=0x0, errp=errp@entry=0x55c2a12ded88 <error_fatal>)
>    at ../../util/qemu-option.c:1137
>#28 0x000055c2a04e89dd in qemu_create_cli_devices () at ../../softmmu/vl.c:2617
>#29 0x000055c2a04e89dd in qmp_x_exit_preconfig (errp=<optimised out>)
>at ../../softmmu/vl.c:2665
>#30 0x000055c2a04ebc0d in qemu_init (argc=<optimised out>,
>argv=<optimised out>, envp=<optimised out>)
>    at ../../softmmu/vl.c:3697
>#31 0x000055c2a01c68e9 in main (argc=<optimised out>, argv=<optimised
>out>, envp=<optimised out>)
>    at ../../softmmu/main.c:49
>
>
>Backtrace, qemu-storage-daemon:
>Thread 2 (Thread 0x7fb0bc104700 (LWP 30077)):
>#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
>#1  0x000055a679ea5a4b in qemu_futex_wait (val=<optimised out>,
>f=<optimised out>)
>    at /mnt/nvmedisk/linaro/qemu-for-merges/include/qemu/futex.h:29
>#2  qemu_event_wait (ev=ev@entry=0x55a67a1c87c8 <rcu_call_ready_event>)
>    at ../../util/qemu-thread-posix.c:480
>#3  0x000055a679eb1368 in call_rcu_thread (opaque=opaque@entry=0x0) at
>../../util/rcu.c:258
>#4  0x000055a679ea4b66 in qemu_thread_start (args=<optimised out>)
>    at ../../util/qemu-thread-posix.c:541
>#5  0x00007fb0cbe7d6db in start_thread (arg=0x7fb0bc104700) at
>pthread_create.c:463
>#6  0x00007fb0cbba671f in clone () at
>../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>Thread 1 (Thread 0x7fb0ce6070c0 (LWP 30068)):
>#0  0x00007fb0cbb99db6 in __GI_ppoll (fds=0x55a67aab9ec0, nfds=5,
>timeout=<optimised out>,
>    timeout@entry=0x0, sigmask=sigmask@entry=0x0) at
>../sysdeps/unix/sysv/linux/ppoll.c:39
>#1  0x000055a679eb61b9 in ppoll (__ss=0x0, __timeout=0x0,
>__nfds=<optimised out>,
>    __fds=<optimised out>) at /usr/include/x86_64-linux-gnu/bits/poll2.h:77
>#2  qemu_poll_ns (fds=<optimised out>, nfds=<optimised out>,
>timeout=timeout@entry=-1)
>    at ../../util/qemu-timer.c:336
>#3  0x000055a679ebd325 in os_host_main_loop_wait (timeout=-1) at
>../../util/main-loop.c:250
>#4  main_loop_wait (nonblocking=<optimised out>) at ../../util/main-loop.c:531
>#5  0x000055a679da650a in main (argc=5, argv=0x7fff3724cbf8)
>    at ../../storage-daemon/qemu-storage-daemon.c:345
>
>thanks
>-- PMM

-- 
Best regards,
Coiby

