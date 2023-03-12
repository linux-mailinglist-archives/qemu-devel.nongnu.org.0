Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329126B68F1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 18:47:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbPmV-0005sy-Bf; Sun, 12 Mar 2023 13:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbPmN-0005sU-Cq
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:46:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbPmK-00023L-8t
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:46:43 -0400
Received: by mail-pg1-x52a.google.com with SMTP id y189so1520371pgb.10
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678643198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oPBzkjbBPzsK4KX86nvkU55NfWHrtolhRPBkbRHqLk=;
 b=hbd/XFaaWq9rzXhhw16eunXcMDcXu3jt1h8S0YcJn9H4OtUYRmXjr2P1WSk4nKDjkJ
 MwVfcHzMmC6ZktH4OFCzYk7X4svQSxtgCntiEyBNRJpTButp8CBoUFgZoLLeuIwzSHLK
 nhlHUXxdBka9E7QKwLnYBJyPblk/Z6hF04mIKI4H47h3hOirjbc9aBhTb0NTC9yyAjsD
 yC/HEc9QlF0vGEjeZMKyMEZjhET1XOXHBKFCHw7fml4xV4fZGu4uWL+7R1sjwmEfEiwz
 NDwV+oHPQdPB5+kDmWKWEmaVmez0LMaVq3eeGe1H1kC3mCBEzv4julRSa0V1lL8Ec7dV
 J+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678643198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oPBzkjbBPzsK4KX86nvkU55NfWHrtolhRPBkbRHqLk=;
 b=pJAo7j/xnTVvkVY8fw0RksQReoYzModxcWOYIfIAkbcgsd70MMExEmLZKzUWp0p0sn
 AcY6oa3jWwOXkEXuqMlcZpd8qFiHkdLAZtNxHI0lLX0wAhDuxFYlGtqItNrzWQs/WtzL
 I2SzYaKDhWGkWJmCbjV0sDxbdfqKD2LQxyb6K9iZ2d0L+NYnA5wrXjA/tUkezA1Ijg9m
 D92X/VvJL7dlYVi2tClFLf+41J70pwq54eiVFDpN0hpmxwXF8IuE3678hg8CaRRkLrrr
 DlZkZsoQB7+WMDjCKSMMlPf5HbT/8PoGQHsyFk3cwqawHGrBBw1ZBzcmxxoR7/T2pDd8
 pOuA==
X-Gm-Message-State: AO0yUKWTqdp2zcLLBAtqTxaSnkS7uBxsyNkKVZ3vdQL6oZmNXXRYb5D9
 zNey28Jum3uvVtjuqjykPy00tKEZyEpYx2sCe2Ai9s4ajiOZ8xYkwX8=
X-Google-Smtp-Source: AK7set+tq+A+dty7Z3GdZt++/yMqOOTkFsxcBOf7JLC0cTMViavzAztvLLVMQQPGfP3sLDYgvtHCzKjj0Z4mEQEub6s=
X-Received: by 2002:a63:8c45:0:b0:508:9e77:5bb2 with SMTP id
 q5-20020a638c45000000b005089e775bb2mr1548056pgn.9.1678643198564; Sun, 12 Mar
 2023 10:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 17:46:26 +0000
Message-ID: <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 12 Mar 2023 at 14:06, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 7 Mar 2023 at 09:53, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Sat, 4 Mar 2023 at 15:39, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > >
> > > On Thu, 2 Mar 2023 at 17:22, Peter Maydell <peter.maydell@linaro.org>=
 wrote:
> > > >
> > > > migration-test has been flaky for a long time, both in CI and
> > > > otherwise:
> > > >
> > >
> > >
> > > > In the cases where I've looked at the underlying log, this seems to
> > > > be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
> > > > specific subtest by default until somebody can track down the
> > > > underlying cause. Enthusiasts can opt back in by setting
> > > > QEMU_TEST_FLAKY_TESTS=3D1 in their environment.
> > >
> > > So I'm going to apply this, because hopefully it will improve
> > > the reliability a bit, but it's clearly not all of the
> > > issues with migration-test
>
> Here's another one, on the s390x CI runner:
> https://gitlab.com/qemu-project/qemu/-/jobs/3917587994

And here's a backtrace from a hung migration-test on the s390x
runner (looks like a deadlock, none of these processes were
using CPU):

Process tree:
migration-test(1464515)=E2=94=80=E2=94=AC=E2=94=80qemu-system-aar(1465117)
                        =E2=94=94=E2=94=80qemu-system-aar(1465125)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 1464515
gitlab-+ 1464515 1463129  0 14:27 ?        00:00:02
/home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/build/tests/qtest/m=
igration-test
--tap -k
[New LWP 1464517]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
__libc_recv (fd=3Dfd@entry=3D5, buf=3Dbuf@entry=3D0x3ffc06f9987,
len=3Dlen@entry=3D1, flags=3Dflags@entry=3D0) at
../sysdeps/unix/sysv/linux/recv.c:30
30      ../sysdeps/unix/sysv/linux/recv.c: No such file or directory.

Thread 2 (Thread 0x3ff9faff900 (LWP 1464517)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa1175ae34 in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa118d96b8 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa117879ea in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa11759e9a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ffa0487e66 in start_thread (arg=3D0x3ff9faff900) at
pthread_create.c:477
#6  0x000003ffa037cbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffa0b6d990 (LWP 1464515)):
#0  __libc_recv (fd=3Dfd@entry=3D5, buf=3Dbuf@entry=3D0x3ffc06f9987,
len=3Dlen@entry=3D1, flags=3Dflags@entry=3D0) at
../sysdeps/unix/sysv/linux/recv.c:30
#1  0x000002aa1172ba22 in recv (__flags=3D0, __n=3D1, __buf=3D0x3ffc06f9987=
,
__fd=3D5) at /usr/include/s390x-linux-gnu/bits/socket2.h:44
#2  qmp_fd_receive (fd=3D<optimized out>) at ../tests/qtest/libqmp.c:73
#3  0x000002aa11729b8e in qtest_qmp_receive_dict (s=3D0x2aa129b97d0) at
../tests/qtest/libqtest.c:837
#4  qtest_qmp_eventwait_ref (event=3D<optimized out>, s=3D<optimized out>)
at ../tests/qtest/libqtest.c:837
#5  qtest_qmp_eventwait_ref (s=3D0x2aa129b97d0, event=3D<optimized out>)
at ../tests/qtest/libqtest.c:828
#6  0x000002aa11729c1a in qtest_qmp_eventwait (s=3D<optimized out>,
event=3D<optimized out>) at ../tests/qtest/libqtest.c:850
#7  0x000002aa1171ec56 in test_postcopy_common (args=3D0x3ffc06f9c88) at
../tests/qtest/migration-test.c:1161
#8  0x000002aa1171edb4 in test_postcopy_preempt () at
../tests/qtest/migration-test.c:1178
#9  0x000003ffa067e608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#10 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#11 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#13 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ffa067eada in g_test_run_suite () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000003ffa067eb10 in g_test_run () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#16 0x000002aa1171ab14 in main (argc=3D<optimized out>, argv=3D<optimized
out>) at ../tests/qtest/migration-test.c:2615
[Inferior 1 (process 1464515) detached]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 1465117
gitlab-+ 1465117 1464515  0 14:28 ?        00:00:01
./qemu-system-aarch64 -qtest unix:/tmp/qtest-1464515.sock -qtest-log
/dev/null -chardev socket,path=3D/tmp/qtest-1464515.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg
-machine virt,gic-version=3Dmax -name source,debug-threads=3Don -m 150M
-serial file:/tmp/migration-test-G3X601/src_serial -cpu max -kernel
/tmp/migration-test-G3X601/bootsect -accel qtest
[New LWP 1465122]
[New LWP 1465123]
[New LWP 1465124]
[New LWP 1465137]
[New LWP 1465138]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ffa66f1c8c in __ppoll (fds=3D0x2aa1f1c96f0, nfds=3D5,
timeout=3D<optimized out>, timeout@entry=3D0x3fff71f9968,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 6 (Thread 0x3ff950fe900 (LWP 1465138)):
#0  __libc_sendmsg (fd=3D<optimized out>, msg=3Dmsg@entry=3D0x3ff950f9800,
flags=3Dflags@entry=3D0) at ../sysdeps/unix/sysv/linux/sendmsg.c:30
#1  0x000002aa1cb4c81a in qio_channel_socket_writev (ioc=3D<optimized
out>, iov=3D<optimized out>, niov=3D<optimized out>, fds=3D<optimized out>,
nfds=3D<optimized out>, flags=3D0, errp=3D0x3ff950f9b70) at
../io/channel-socket.c:605
#2  0x000002aa1cb51e78 in qio_channel_writev_full
(ioc=3Dioc@entry=3D0x2aa1e8ee400, iov=3D0x2aa1f1bac90, niov=3D64,
fds=3Dfds@entry=3D0x0, nfds=3Dnfds@entry=3D0, flags=3D0, errp=3D0x3ff950f9b=
70) at
../io/channel.c:108
#3  0x000002aa1cb52cf0 in qio_channel_writev_full_all
(ioc=3D0x2aa1e8ee400, iov=3Diov@entry=3D0x2aa1e5fe4d0, niov=3D<optimized ou=
t>,
fds=3Dfds@entry=3D0x0, nfds=3Dnfds@entry=3D0, flags=3D0, errp=3D0x3ff950f9b=
70) at
../io/channel.c:263
#4  0x000002aa1cb52d9e in qio_channel_writev_all (ioc=3D<optimized out>,
iov=3Diov@entry=3D0x2aa1e5fe4d0, niov=3D<optimized out>,
errp=3Derrp@entry=3D0x3ff950f9b70) at ../io/channel.c:242
#5  0x000002aa1c6de2a4 in qemu_fflush (f=3Df@entry=3D0x2aa1e5f6490) at
../migration/qemu-file.c:302
#6  0x000002aa1c6de532 in qemu_fflush (f=3D0x2aa1e5f6490) at
../migration/qemu-file.c:297
#7  add_to_iovec (f=3Df@entry=3D0x2aa1e5f6490, buf=3D<optimized out>,
size=3Dsize@entry=3D4096, may_free=3D<optimized out>) at
../migration/qemu-file.c:510
#8  0x000002aa1c6dea16 in qemu_put_buffer_async
(f=3Df@entry=3D0x2aa1e5f6490, buf=3D<error reading variable: value has been
optimized out>, size=3Dsize@entry=3D4096, may_free=3D<optimized out>) at
../migration/qemu-file.c:535
#9  0x000002aa1cabcad6 in save_normal_page (async=3D<optimized out>,
buf=3D<optimized out>, offset=3D1306624, block=3D0x2aa1e60cab0,
pss=3D0x3ff28001440) at ../migration/ram.c:1400
#10 ram_save_page (pss=3D0x3ff28001440, rs=3D<optimized out>) at
../migration/ram.c:1449
#11 ram_save_target_page_legacy (rs=3D<optimized out>,
pss=3D0x3ff28001440) at ../migration/ram.c:2381
#12 0x000002aa1cab9906 in ram_save_host_page (pss=3D0x3ff28001440,
rs=3D0x3ff28001440) at ../migration/ram.c:2539
#13 ram_find_and_save_block (rs=3Drs@entry=3D0x3ff28001440) at
../migration/ram.c:2620
#14 0x000002aa1cab9fe4 in ram_save_iterate (f=3D0x2aa1e5f6490,
opaque=3D<optimized out>) at ../migration/ram.c:3361
#15 0x000002aa1c6fa934 in qemu_savevm_state_iterate (f=3D0x2aa1e5f6490,
postcopy=3D<optimized out>) at ../migration/savevm.c:1345
#16 0x000002aa1c6ede24 in migration_iteration_run (s=3D0x2aa1e2cdcd0) at
../migration/migration.c:3896
#17 migration_thread (opaque=3Dopaque@entry=3D0x2aa1e2cdcd0) at
../migration/migration.c:4124
#18 0x000002aa1ccc462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#19 0x000003ffa6807e66 in start_thread (arg=3D0x3ff950fe900) at
pthread_create.c:477
#20 0x000003ffa66fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 5 (Thread 0x3ff958ff900 (LWP 1465137)):
#0  __libc_recvmsg (fd=3D<optimized out>, msg=3Dmsg@entry=3D0x3ff958fa9f0,
flags=3Dflags@entry=3D0) at ../sysdeps/unix/sysv/linux/recvmsg.c:30
#1  0x000002aa1cb4cad4 in qio_channel_socket_readv (ioc=3D<optimized
out>, iov=3D<optimized out>, niov=3D<optimized out>, fds=3D0x0, nfds=3D0x0,
flags=3D0, errp=3D0x3ff958faca8) at ../io/channel-socket.c:532
#2  0x000002aa1cb51d60 in qio_channel_readv_full (ioc=3D0x2aa1e8ee400,
iov=3Diov@entry=3D0x3ff958fabf0, niov=3Dniov@entry=3D1, fds=3Dfds@entry=3D0=
x0,
nfds=3Dnfds@entry=3D0x0, flags=3D0, errp=3D0x3ff958faca8) at
../io/channel.c:74
#3  0x000002aa1cb51fe6 in qio_channel_read (ioc=3D<optimized out>,
buf=3Dbuf@entry=3D0x2aa1e7a3c38 "", buflen=3Dbuflen@entry=3D32768,
errp=3Derrp@entry=3D0x3ff958faca8) at ../io/channel.c:314
#4  0x000002aa1c6de13e in qemu_fill_buffer (f=3D0x2aa1e7a3c00) at
../migration/qemu-file.c:415
#5  0x000002aa1c6ded18 in qemu_peek_byte (f=3D0x2aa1e7a3c00,
offset=3D<optimized out>) at ../migration/qemu-file.c:707
#6  0x000002aa1c6defba in qemu_get_byte (f=3D0x2aa1e7a3c00) at
../migration/qemu-file.c:720
#7  qemu_get_be16 (f=3Df@entry=3D0x2aa1e7a3c00) at ../migration/qemu-file.c=
:800
#8  0x000002aa1c6ea7e8 in source_return_path_thread
(opaque=3Dopaque@entry=3D0x2aa1e2cdcd0) at ../migration/migration.c:2995
#9  0x000002aa1ccc462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#10 0x000003ffa6807e66 in start_thread (arg=3D0x3ff958ff900) at
pthread_create.c:477
#11 0x000003ffa66fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 4 (Thread 0x3ff9662e900 (LWP 1465124)):
#0  futex_wait_cancelable (private=3D0, expected=3D0,
futex_word=3D0x2aa1e5daeb8) at ../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=3D0x0, clockid=3D0,
mutex=3D0x2aa1d75bf80 <qemu_global_mutex>, cond=3D0x2aa1e5dae90) at
pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=3Dcond@entry=3D0x2aa1e5dae90,
mutex=3Dmutex@entry=3D0x2aa1d75bf80 <qemu_global_mutex>) at
pthread_cond_wait.c:647
#3  0x000002aa1ccc500e in qemu_cond_wait_impl (cond=3D0x2aa1e5dae90,
mutex=3D0x2aa1d75bf80 <qemu_global_mutex>, file=3D0x2aa1ce5d9bc
"../softmmu/cpus.c", line=3D<optimized out>) at
../util/qemu-thread-posix.c:225
#4  0x000002aa1c6bdf0e in qemu_wait_io_event
(cpu=3Dcpu@entry=3D0x2aa1e70c750) at ../softmmu/cpus.c:424
#5  0x000002aa1cb34412 in mttcg_cpu_thread_fn
(arg=3Darg@entry=3D0x2aa1e70c750) at
../accel/tcg/tcg-accel-ops-mttcg.c:123
#6  0x000002aa1ccc462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#7  0x000003ffa6807e66 in start_thread (arg=3D0x3ff9662e900) at
pthread_create.c:477
#8  0x000003ffa66fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff97021900 (LWP 1465123)):
#0  0x000003ffa66f1b32 in __GI___poll (fds=3D0x3ff480036b0, nfds=3D3,
timeout=3D<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ffa8ed4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ffa8ed4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa1cb74afe in iothread_run
(opaque=3Dopaque@entry=3D0x2aa1e371400) at ../iothread.c:70
#4  0x000002aa1ccc462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ffa6807e66 in start_thread (arg=3D0x3ff97021900) at
pthread_create.c:477
#6  0x000003ffa66fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff97923900 (LWP 1465122)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa1ccc55c4 in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa1d78e5d0 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa1ccce19a in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa1ccc462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ffa6807e66 in start_thread (arg=3D0x3ff97923900) at
pthread_create.c:477
#6  0x000003ffa66fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffaa07e4a0 (LWP 1465117)):
#0  0x000003ffa66f1c8c in __ppoll (fds=3D0x2aa1f1c96f0, nfds=3D5,
timeout=3D<optimized out>, timeout@entry=3D0x3fff71f9968,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa1ccda44a in ppoll (__ss=3D0x0, __timeout=3D0x3fff71f9968,
__nfds=3D<optimized out>, __fds=3D<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=3D<optimized out>, nfds=3D<optimized out>,
timeout=3Dtimeout@entry=3D1000000000) at ../util/qemu-timer.c:351
#3  0x000002aa1ccd7460 in os_host_main_loop_wait (timeout=3D1000000000)
at ../util/main-loop.c:312
#4  main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-lo=
op.c:603
#5  0x000002aa1c6c4ae4 in qemu_main_loop () at ../softmmu/runstate.c:731
#6  0x000002aa1c42c5ba in qemu_default_main () at ../softmmu/main.c:37
#7  0x000003ffa662440a in __libc_start_main (main=3D0x2aa1c428b90
<main>, argc=3D<optimized out>, argv=3D0x3fff71f9db8, init=3D<optimized
out>, fini=3D<optimized out>, rtld_fini=3D0x3ffaa090e50 <_dl_fini>,
stack_end=3D0x3fff71f9d00) at libc-start.c:308
#8  0x000002aa1c42c4e4 in _start () at ../softmmu/main.c:48
[Inferior 1 (process 1465117) detached]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 1465125
gitlab-+ 1465125 1464515  0 14:28 ?        00:00:00
./qemu-system-aarch64 -qtest unix:/tmp/qtest-1464515.sock -qtest-log
/dev/null -chardev socket,path=3D/tmp/qtest-1464515.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg
-machine virt,gic-version=3Dmax -name target,debug-threads=3Don -m 150M
-serial file:/tmp/migration-test-G3X601/dest_serial -incoming
unix:/tmp/migration-test-G3X601/migsocket -cpu max -kernel
/tmp/migration-test-G3X601/bootsect -accel qtest
[New LWP 1465133]
[New LWP 1465134]
[New LWP 1465135]
[New LWP 1465140]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
futex_wait_cancelable (private=3D0, expected=3D0,
futex_word=3D0x2aa2b37b560) at ../sysdeps/nptl/futex-internal.h:183
183     ../sysdeps/nptl/futex-internal.h: No such file or directory.

Thread 5 (Thread 0x3ff749fe900 (LWP 1465140)):
#0  0x000003ff858f1b32 in __GI___poll (fds=3Dfds@entry=3D0x3ff10000b60,
nfds=3D2, nfds@entry=3D<error reading variable: value has been optimized
out>, timeout=3Dtimeout@entry=3D-1) at
../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000002aa284f520e in poll (__timeout=3D-1, __nfds=3D<optimized out>,
__fds=3D0x3ff10000b60) at /usr/include/s390x-linux-gnu/bits/poll2.h:46
#2  postcopy_ram_fault_thread (opaque=3Dopaque@entry=3D0x2aa2b37b3a0) at
../migration/postcopy-ram.c:952
#3  0x000002aa28ac462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#4  0x000003ff85a07e66 in start_thread (arg=3D0x3ff749fe900) at
pthread_create.c:477
#5  0x000003ff858fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 4 (Thread 0x3ff7582e900 (LWP 1465135)):
#0  futex_wait_cancelable (private=3D0, expected=3D0,
futex_word=3D0x2aa2b82310c) at ../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=3D0x0, clockid=3D0,
mutex=3D0x2aa2955bf80 <qemu_global_mutex>, cond=3D0x2aa2b8230e0) at
pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=3Dcond@entry=3D0x2aa2b8230e0,
mutex=3Dmutex@entry=3D0x2aa2955bf80 <qemu_global_mutex>) at
pthread_cond_wait.c:647
#3  0x000002aa28ac500e in qemu_cond_wait_impl (cond=3D0x2aa2b8230e0,
mutex=3D0x2aa2955bf80 <qemu_global_mutex>, file=3D0x2aa28c5d9bc
"../softmmu/cpus.c", line=3D<optimized out>) at
../util/qemu-thread-posix.c:225
#4  0x000002aa284bdf0e in qemu_wait_io_event
(cpu=3Dcpu@entry=3D0x2aa2b7b9750) at ../softmmu/cpus.c:424
#5  0x000002aa28934412 in mttcg_cpu_thread_fn
(arg=3Darg@entry=3D0x2aa2b7b9750) at
../accel/tcg/tcg-accel-ops-mttcg.c:123
#6  0x000002aa28ac462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#7  0x000003ff85a07e66 in start_thread (arg=3D0x3ff7582e900) at
pthread_create.c:477
#8  0x000003ff858fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff76221900 (LWP 1465134)):
#0  0x000003ff858f1b32 in __GI___poll (fds=3D0x3ff280036b0, nfds=3D3,
timeout=3D<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ff880d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ff880d4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa28974afe in iothread_run
(opaque=3Dopaque@entry=3D0x2aa2b41e400) at ../iothread.c:70
#4  0x000002aa28ac462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff85a07e66 in start_thread (arg=3D0x3ff76221900) at
pthread_create.c:477
#6  0x000003ff858fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff76b23900 (LWP 1465133)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa28ac55c4 in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa2958e5d0 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa28ace19a in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa28ac462a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff85a07e66 in start_thread (arg=3D0x3ff76b23900) at
pthread_create.c:477
#6  0x000003ff858fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff8927e4a0 (LWP 1465125)):
#0  futex_wait_cancelable (private=3D0, expected=3D0,
futex_word=3D0x2aa2b37b560) at ../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=3D0x0, clockid=3D0,
mutex=3D0x2aa2b37b508, cond=3D0x2aa2b37b538) at pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=3Dcond@entry=3D0x2aa2b37b538,
mutex=3Dmutex@entry=3D0x2aa2b37b508) at pthread_cond_wait.c:647
#3  0x000002aa28ac500e in qemu_cond_wait_impl (cond=3D0x2aa2b37b538,
mutex=3D0x2aa2b37b508, file=3D0x2aa28d70dee "../util/qemu-thread-posix.c",
line=3D<optimized out>) at ../util/qemu-thread-posix.c:225
#4  0x000002aa28ac542e in qemu_sem_wait (sem=3D0x2aa2b37b508) at
../util/qemu-thread-posix.c:314
#5  0x000002aa284f485a in postcopy_ram_incoming_setup
(mis=3D0x2aa2b37b3a0, mis@entry=3D<error reading variable: value has been
optimized out>) at ../migration/postcopy-ram.c:1204
#6  0x000002aa284fbf70 in loadvm_postcopy_handle_listen
(mis=3D<optimized out>) at ../migration/savevm.c:2016
#7  loadvm_process_command (f=3D0x2aa2b85b7a0) at ../migration/savevm.c:237=
9
#8  qemu_loadvm_state_main (f=3Df@entry=3D0x2aa2b85b7a0,
mis=3D0x2aa2b37b3a0) at ../migration/savevm.c:2724
#9  0x000002aa284fc2fe in loadvm_handle_cmd_packaged (mis=3D<optimized
out>) at ../migration/savevm.c:2248
#10 loadvm_process_command (f=3D0x2aa2b6a3490) at ../migration/savevm.c:237=
3
#11 qemu_loadvm_state_main (f=3Df@entry=3D0x2aa2b6a3490,
mis=3Dmis@entry=3D0x2aa2b37b3a0) at ../migration/savevm.c:2724
#12 0x000002aa284fcf14 in qemu_loadvm_state (f=3D0x2aa2b6a3490) at
../migration/savevm.c:2790
#13 0x000002aa284e9f64 in process_incoming_migration_co
(opaque=3D<optimized out>) at ../migration/migration.c:606
#14 0x000002aa28ad92e6 in coroutine_trampoline (i0=3D<optimized out>,
i1=3D<optimized out>) at ../util/coroutine-ucontext.c:177
#15 0x000003ff858569c2 in __makecontext_ret () at
../sysdeps/unix/sysv/linux/s390/s390-64/__makecontext_ret.S:23
[Inferior 1 (process 1465125) detached]

-- PMM

