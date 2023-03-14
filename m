Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27096B9582
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc4MT-0005qw-K3; Tue, 14 Mar 2023 09:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc4Lz-0005lG-CH
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc4Lv-0003T1-ES
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678799164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0eeslAZxmWftMJByMAcGHnQ9XuTvy5rSUGSlA4aFh0U=;
 b=TtDf/1/FYEBsYuW/C2bpfSDNboOILn2cneXsFwpfHWLydiZtBmAxscO05JDDyc6j1M7DfU
 nVZ7EML7VP8y5Sww/SF9TkxXpAX2aYMDYNGMvf/QnISmo/5Hyuj9iyAPccaJx67enTZrTn
 T9jE6PLQI76TnjPlWi0q366vtT9Esug=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-B2t3Pw4kP7mi7o1_yVw8AQ-1; Tue, 14 Mar 2023 09:06:03 -0400
X-MC-Unique: B2t3Pw4kP7mi7o1_yVw8AQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 470453804500;
 Tue, 14 Mar 2023 13:06:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E98540C6E67;
 Tue, 14 Mar 2023 13:06:00 +0000 (UTC)
Date: Tue, 14 Mar 2023 13:05:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZBBxNmIk9ySukxYo@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
 <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
 <ZBBIaX+cZD5Ud2wQ@work-vm>
 <CAFEAcA9uQzhTX6DshQeuyChh0CfgDseGdirbyDz08=UqAyqxDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9uQzhTX6DshQeuyChh0CfgDseGdirbyDz08=UqAyqxDA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 14, 2023 at 12:46:18PM +0000, Peter Maydell wrote:
> On Tue, 14 Mar 2023 at 10:12, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Copying Peter Xu on this one since it's poscopy, especially the newer
> > postcopy preempt.
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Sun, 12 Mar 2023 at 14:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > Here's another one, on the s390x CI runner:
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3917587994
> > >
> > > And here's a backtrace from a hung migration-test on the s390x
> > > runner (looks like a deadlock, none of these processes were
> > > using CPU):
> >
> > Ah a backtrace!
> 
> I've attached another 2 -- migration-test seems to fairly
> commonly hang on the s390 CI runner; there are several
> stuck tests on it at the moment.
> 
> -- PMM

> Process tree:
> migration-test(1841031)-+-qemu-system-x86(1841381)
>                         `-qemu-system-x86(1841387)
> ===========================================================

> Thread 1 (Thread 0x3ffb126d990 (LWP 1841031)):
> #6  0x000002aa133a9c1a in qtest_qmp_eventwait (s=<optimized out>, event=<optimized out>) at ../tests/qtest/libqtest.c:850
> #7  0x000002aa1339ec56 in test_postcopy_common (args=0x3ffdac795e8) at ../tests/qtest/migration-test.c:1161
> #8  0x000002aa1339edb4 in test_postcopy_preempt () at ../tests/qtest/migration-test.c:1178

There's a stack frame optimized out between 6 & 7 which means we can't
tell which event it is waiting for - could be a STOP or RESUME depending
on where in migrate_postcopy_start it is.



> ===========================================================
> PROCESS: 1841381
> gitlab-+ 1841381 1841031  0 Mar13 ?        00:00:06 ./qemu-system-x86_64 -qtest unix:/tmp/qtest-1841031.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1841031.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 150M -serial file:/tmp/migration-test-RM5901/src_serial -drive file=/tmp/migration-test-RM5901/bootsect,format=raw -accel qtest


IIUC, the source QEMU

> 
> Thread 6 (Thread 0x3ff469f7900 (LWP 1841395)):
> #0  __libc_sendmsg (fd=<optimized out>, msg=msg@entry=0x3ff469f2810, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/sendmsg.c:30
> #1  0x000002aa1a34c52a in qio_channel_socket_writev (ioc=<optimized out>, iov=<optimized out>, niov=<optimized out>, fds=<optimized out>, nfds=<optimized out>, flags=0, errp=0x3ff469f2b80) at ../io/channel-socket.c:605
> #2  0x000002aa1a351b88 in qio_channel_writev_full (ioc=ioc@entry=0x2aa1c0f8400, iov=0x2aa1c0e88e0, niov=64, fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff469f2b80) at ../io/channel.c:108
> #3  0x000002aa1a352a00 in qio_channel_writev_full_all (ioc=0x2aa1c0f8400, iov=iov@entry=0x2aa1b2792a0, niov=<optimized out>, fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff469f2b80) at ../io/channel.c:263
> #4  0x000002aa1a352aae in qio_channel_writev_all (ioc=<optimized out>, iov=iov@entry=0x2aa1b2792a0, niov=<optimized out>, errp=errp@entry=0x3ff469f2b80) at ../io/channel.c:242
> #5  0x000002aa1a10de94 in qemu_fflush (f=f@entry=0x2aa1b271260) at ../migration/qemu-file.c:302
> #6  0x000002aa1a10e122 in qemu_fflush (f=0x2aa1b271260) at ../migration/qemu-file.c:297
> #7  add_to_iovec (f=f@entry=0x2aa1b271260, buf=<optimized out>, size=size@entry=4096, may_free=<optimized out>) at ../migration/qemu-file.c:510
> #8  0x000002aa1a10e606 in qemu_put_buffer_async (f=f@entry=0x2aa1b271260, buf=<error reading variable: value has been optimized out>, size=size@entry=4096, may_free=<optimized out>) at ../migration/qemu-file.c:535
> #9  0x000002aa1a2bd398 in save_normal_page (async=<optimized out>, buf=<optimized out>, offset=1175552, block=0x2aa1b19f340, pss=0x3ff40003000) at ../migration/ram.c:1400
> #10 ram_save_page (pss=0x3ff40003000, rs=0x3ff40003000) at ../migration/ram.c:1449
> #11 ram_save_target_page_legacy (rs=0x3ff40003000, pss=0x3ff40003000) at ../migration/ram.c:2381
> #12 0x000002aa1a2ba330 in ram_save_host_page (pss=0x3ff40003000, rs=0x3ff40003000) at ../migration/ram.c:2539
> #13 ram_find_and_save_block (rs=rs@entry=0x3ff40003000) at ../migration/ram.c:2620
> #14 0x000002aa1a2ba9e4 in ram_save_iterate (f=0x2aa1b271260, opaque=<optimized out>) at ../migration/ram.c:3361
> #15 0x000002aa1a12a524 in qemu_savevm_state_iterate (f=0x2aa1b271260, postcopy=<optimized out>) at ../migration/savevm.c:1345
> #16 0x000002aa1a11da14 in migration_iteration_run (s=0x2aa1af3a810) at ../migration/migration.c:3896
> #17 migration_thread (opaque=opaque@entry=0x2aa1af3a810) at ../migration/migration.c:4124
> #18 0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #19 0x000003ffb5307e66 in start_thread (arg=0x3ff469f7900) at pthread_create.c:477
> #20 0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Blocked sending some RAM plages to the dst, presumably because the socket buffer
is full.


> Thread 5 (Thread 0x3ff471f8900 (LWP 1841394)):
> #0  __libc_recvmsg (fd=<optimized out>, msg=msg@entry=0x3ff471f39f0, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recvmsg.c:30
> #1  0x000002aa1a34c7e4 in qio_channel_socket_readv (ioc=<optimized out>, iov=<optimized out>, niov=<optimized out>, fds=0x0, nfds=0x0, flags=0, errp=0x3ff471f3ca8) at ../io/channel-socket.c:532
> #2  0x000002aa1a351a70 in qio_channel_readv_full (ioc=0x2aa1c0f8400, iov=iov@entry=0x3ff471f3bf0, niov=niov@entry=1, fds=fds@entry=0x0, nfds=nfds@entry=0x0, flags=0, errp=0x3ff471f3ca8) at ../io/channel.c:74
> #3  0x000002aa1a351cf6 in qio_channel_read (ioc=<optimized out>, buf=buf@entry=0x2aa1b17d9d8 "", buflen=buflen@entry=32768, errp=errp@entry=0x3ff471f3ca8) at ../io/channel.c:314
> #4  0x000002aa1a10dd2e in qemu_fill_buffer (f=0x2aa1b17d9a0) at ../migration/qemu-file.c:415
> #5  0x000002aa1a10e908 in qemu_peek_byte (f=0x2aa1b17d9a0, offset=<optimized out>) at ../migration/qemu-file.c:707
> #6  0x000002aa1a10ebaa in qemu_get_byte (f=0x2aa1b17d9a0) at ../migration/qemu-file.c:720
> #7  qemu_get_be16 (f=f@entry=0x2aa1b17d9a0) at ../migration/qemu-file.c:800
> #8  0x000002aa1a11a3d8 in source_return_path_thread (opaque=opaque@entry=0x2aa1af3a810) at ../migration/migration.c:2995
> #9  0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #10 0x000003ffb5307e66 in start_thread (arg=0x3ff471f8900) at pthread_create.c:477
> #11 0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Blocked waiting for return data from the dst host. Dst probably
has't sent anything

Overall source QEMU doesn't look too suspicious.

> 
> PROCESS: 1841387
> gitlab-+ 1841387 1841031  0 Mar13 ?        00:00:00 ./qemu-system-x86_64 -qtest unix:/tmp/qtest-1841031.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1841031.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 150M -serial file:/tmp/migration-test-RM5901/dest_serial -incoming unix:/tmp/migration-test-RM5901/migsocket -drive file=/tmp/migration-test-RM5901/bootsect,format=raw -accel qtest

IIUC the dst target QEMU for the migration


> 
> Thread 1 (Thread 0x3ffa6efe4a0 (LWP 1841387)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa370039c0) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa37003968, cond=0x2aa37003998) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa37003998, mutex=mutex@entry=0x2aa37003968) at pthread_cond_wait.c:647
> #3  0x000002aa34c44cae in qemu_cond_wait_impl (cond=0x2aa37003998, mutex=0x2aa37003968, file=0x2aa34e65f06 "../util/qemu-thread-posix.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa34c450ce in qemu_sem_wait (sem=0x2aa37003968) at ../util/qemu-thread-posix.c:314
> #5  0x000002aa348a444a in postcopy_ram_incoming_setup (mis=0x2aa37003800, mis@entry=<error reading variable: value has been optimized out>) at ../migration/postcopy-ram.c:1204
> #6  0x000002aa348abb60 in loadvm_postcopy_handle_listen (mis=<optimized out>) at ../migration/savevm.c:2016
> #7  loadvm_process_command (f=0x2aa37201810) at ../migration/savevm.c:2379
> #8  qemu_loadvm_state_main (f=f@entry=0x2aa37201810, mis=0x2aa37003800) at ../migration/savevm.c:2724
> #9  0x000002aa348abeee in loadvm_handle_cmd_packaged (mis=<optimized out>) at ../migration/savevm.c:2248
> #10 loadvm_process_command (f=0x2aa370eb260) at ../migration/savevm.c:2373
> #11 qemu_loadvm_state_main (f=f@entry=0x2aa370eb260, mis=mis@entry=0x2aa37003800) at ../migration/savevm.c:2724
> #12 0x000002aa348acb04 in qemu_loadvm_state (f=0x2aa370eb260) at ../migration/savevm.c:2790
> #13 0x000002aa34899b54 in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:606
> #14 0x000002aa34c58f16 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #15 0x000003ffa34d69c2 in __makecontext_ret () at ../sysdeps/unix/sysv/linux/s390/s390-64/__makecontext_ret.S:23
> [Inferior 1 (process 1841387) detached]

The main thread has switched to a coroutine and is waiting on a semaphore
for

    qemu_sem_wait(&mis->postcopy_qemufile_dst_done);

This feels not right to me.  The sem wait is putting the coroutine to
sleep and so control never switches back to the main thread.

I'm not seeing what other running thread is ever going to call

    qemu_sem_post(&mis->postcopy_qemufile_dst_done);

Do we have a race here, where this will only work if the qemu_sem_post runs
before the qemu_sem_wait ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


