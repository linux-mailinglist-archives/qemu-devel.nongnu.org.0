Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF63DF6A8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:55:36 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1Rn-00055m-DD
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB1Pc-0002IJ-4m
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB1PY-0000Dz-2C
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tgRZMrRF9vTEBAY5eIMITbgAljdNF49drYv/Lk1o/vA=;
 b=ZzKp6gSa939OanPmWlEWo65BYJ9/9RZ8R+6gcjnE990PyvNQ/LL8OkOt50DDgaPQXgSZL2
 VBRf0IN1Uy5WYVEyei3I/wN3rM5x4vXW1qdfjgXiYqe/qwHlijmyJL8dEY0WTezOa8S6IN
 jic0DEzlXuoMFimCiAizNtaKIFJh7Hs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-H1e7fYqbOK2meoZDtxzaog-1; Tue, 03 Aug 2021 16:53:14 -0400
X-MC-Unique: H1e7fYqbOK2meoZDtxzaog-1
Received: by mail-qv1-f71.google.com with SMTP id
 s12-20020ad4446c0000b029033a9344451cso70963qvt.21
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tgRZMrRF9vTEBAY5eIMITbgAljdNF49drYv/Lk1o/vA=;
 b=OXzowdkqAhULtlQyaLSxjH5+quEUpMZJhpGibKCNiYkGhx2FC5jNzFCjnyAfBWgTC/
 dytY02eMT8mhC9JTXg8RqnJZ2NAQDxg/Sxv6mjJNjTzsWyiRGfjFHLtIdi/w7njQY6x0
 YBmd7aD+K/M2gsjdjo4ZqAO6q091ITHxDU+RfHpbeFT67wIdbJgLoUQM0h6radqUlBxM
 5lEvg/BRWR6JLEVCITpvVT+YzaNV27635WXVa77D/h1YTe0QhK0pSyxNyn+ivmD01k/T
 AIgShILt+P7LhQhwXi9W5tjrowDlz0L+DMSVP114DQWS4eFkSpW4e9qyL4DAkLeg78GL
 uawQ==
X-Gm-Message-State: AOAM533ijW4T/Oo0TEZ3SgMlyQM7fMzGHuXXoUTTSHcTCTSI+yHgvKM0
 T2LS+7ee2OGoKaYtALV91BSuFruHQkcv4KU1NpQZRa6VHPoNFSaabt0kAVfWEaBACYZhVrUPgQw
 Y99jdQvoTXpJASr8=
X-Received: by 2002:a05:6214:2269:: with SMTP id
 gs9mr9961972qvb.6.1628023993389; 
 Tue, 03 Aug 2021 13:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWuwMXaY8NKvafTXIPg0pvnlsi2faMgCdmTgrosfzHisH7xH2053q3fIaQ7TE4AL66pj9+rg==
X-Received: by 2002:a05:6214:2269:: with SMTP id
 gs9mr9961960qvb.6.1628023993109; 
 Tue, 03 Aug 2021 13:53:13 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id h7sm5429qto.22.2021.08.03.13.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:53:12 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:53:11 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: migration-test hang, s390x host, aarch64 guest
Message-ID: <YQmst7/0R7j0AHNh@t490s>
References: <CAFEAcA_DPnxp+yn9cxR=bxr=QCdYOMvZJF2asMCmOAxu-nLZ-A@mail.gmail.com>
 <YQezG/iHFI10Bg4+@work-vm>
MIME-Version: 1.0
In-Reply-To: <YQezG/iHFI10Bg4+@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 09:55:55AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > migration-test hung again during 'make check'.
> 
> ccing in Peter Xu
> 
> > Process tree:
> > 
> > ubuntu   42067  0.0  0.0   5460  3156 ?        S    13:55   0:00
> >            \_ bash -o pipefail -c echo
> > 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> > QTEST_QEMU_IMG=./qemu-img
> > G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> > QTEST_QEMU_BINARY=./qemu-system-aarch64
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> > tests/qtest/migration-test --tap -k' &&
> > MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> > QTEST_QEMU_IMG=./qemu-img
> > G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> > QTEST_QEMU_BINARY=./qemu-system-aarch64
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> > tests/qtest/migration-test --tap -k -m quick < /dev/null |
> > ./scripts/tap-driver.pl --test-name="qtest-aarch64/migration-test"
> > ubuntu   42070  0.0  0.0  78844  3184 ?        Sl   13:55   0:01
> >                \_ tests/qtest/migration-test --tap -k -m quick
> > ubuntu   43248  0.0  4.1 1401368 160852 ?      Sl   13:55   0:03
> >                |   \_ ./qemu-system-aarch64 -qtest
> > unix:/tmp/qtest-42070.sock -qtest-log /dev/null -chardev
> > socket,path=/tmp/qtest-42070.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -accel kvm -accel tcg
> > -machine virt,gic-version=max -name source,debug-threads=on -m 150M
> > -serial file:/tmp/migration-test-SL7EkN/src_serial -cpu max -kernel
> > /tmp/migration-test-SL7EkN/bootsect -accel qtest
> > ubuntu   43256  0.0  1.4 1394208 57648 ?       Sl   13:55   0:00
> >                |   \_ ./qemu-system-aarch64 -qtest
> > unix:/tmp/qtest-42070.sock -qtest-log /dev/null -chardev
> > socket,path=/tmp/qtest-42070.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -accel kvm -accel tcg
> > -machine virt,gic-version=max -name target,debug-threads=on -m 150M
> > -serial file:/tmp/migration-test-SL7EkN/dest_serial -incoming
> > unix:/tmp/migration-test-SL7EkN/migsocket -cpu max -kernel
> > /tmp/migration-test-SL7EkN/bootsect -accel qtest
> > ubuntu   42071  0.0  0.2  14116 11372 ?        S    13:55   0:00
> >                \_ perl ./scripts/tap-driver.pl
> > --test-name=qtest-aarch64/migration-test
> > 
> > Backtrace, migration-test process:
> > 
> > Thread 2 (Thread 0x3ff8ff7f910 (LWP 42075)):
> > #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
> > #1  0x000002aa1d0d1c1c in qemu_futex_wait (val=<optimized out>,
> > f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
> > #2  qemu_event_wait (ev=ev@entry=0x2aa1d0fda58 <rcu_call_ready_event>)
> > at ../../util/qemu-thread-posix.c:480
> > #3  0x000002aa1d0d0884 in call_rcu_thread (opaque=opaque@entry=0x0) at
> > ../../util/rcu.c:258
> > #4  0x000002aa1d0d0c32 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #5  0x000003ff90207aa8 in start_thread (arg=0x3ff8ff7f910) at
> > pthread_create.c:463
> > #6  0x000003ff900fa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 1 (Thread 0x3ff905f7c00 (LWP 42070)):
> > #0  0x000003ff90212978 in __waitpid (pid=<optimized out>,
> > stat_loc=stat_loc@entry=0x2aa1d5e06bc, options=options@entry=0)
> >     at ../sysdeps/unix/sysv/linux/waitpid.c:30
> > #1  0x000002aa1d0a2176 in qtest_kill_qemu (s=0x2aa1d5e06b0) at
> > ../../tests/qtest/libqtest.c:144
> > #2  0x000003ff903c0de6 in g_hook_list_invoke () from
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #3  <signal handler called>
> > #4  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
> > #5  0x000003ff9003f3ca in __GI_abort () at abort.c:79
> > #6  0x000003ff903fcbb2 in g_assertion_message () from
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #7  0x000003ff903fd2b4 in g_assertion_message_cmpstr () from
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #8  0x000002aa1d0a10f6 in check_migration_status
> > (ungoals=0x3ffffdfe198, goal=0x2aa1d0d75c0 "postcopy-paused",
> > who=0x2aa1d5dee90)
> 
>             g_assert_cmpstr(current_status, !=,  *ungoal);
> 
> >     at ../../tests/qtest/migration-helpers.c:146
> > #9  wait_for_migration_status (who=0x2aa1d5dee90, goal=<optimized
> > out>, ungoals=0x3ffffdfe198)
> >     at ../../tests/qtest/migration-helpers.c:156
> > #10 0x000002aa1d09f610 in test_postcopy_recovery () at
> > ../../tests/qtest/migration-test.c:773
> 
>     wait_for_migration_status(from, "postcopy-paused",
>                               (const char * []) { "failed", "active",
>                                                   "completed", NULL });
> 
> so I think that means it hit one of failed/active/completed rather than
> the postcopy-paused it expected (shame we can't tell which)
> 
> > #11 0x000003ff903fc70c in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #12 0x000003ff903fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #13 0x000003ff903fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #14 0x000003ff903fc648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #15 0x000003ff903fc8ee in g_test_run_suite () from
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #16 0x000003ff903fc928 in g_test_run () from
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #17 0x000002aa1d09d8f2 in main (argc=<optimized out>, argv=<optimized
> > out>) at ../../tests/qtest/migration-test.c:1495
> > 
> > 
> > Backtrace, QEMU process 43248:
> > 
> > Thread 5 (Thread 0x3ff8d7fe910 (LWP 43361)):
> > #0  0x000003ff9d110582 in futex_abstimed_wait_cancelable (private=0,
> > abstime=0x0, expected=0, futex_word=0x2aa1e27dfac)
> >     at ../sysdeps/unix/sysv/linux/futex-internal.h:205
> > #1  0x000003ff9d110582 in do_futex_wait (sem=sem@entry=0x2aa1e27dfa8,
> > abstime=0x0) at sem_waitcommon.c:111
> > #2  0x000003ff9d11068c in __new_sem_wait_slow
> > (sem=sem@entry=0x2aa1e27dfa8, abstime=0x0) at sem_waitcommon.c:181
> > #3  0x000003ff9d110734 in __new_sem_wait (sem=sem@entry=0x2aa1e27dfa8)
> > at sem_wait.c:42
> > #4  0x000002aa1b6dfb96 in qemu_sem_wait (sem=0x2aa1e27dfa8,
> > sem@entry=<error reading variable: value has been optimized out>)
> >     at ../../util/qemu-thread-posix.c:357
> > #5  0x000002aa1aefe5b0 in postcopy_pause_return_path_thread
> > (s=0x2aa1e27dc00) at ../../migration/migration.c:2654
> > #6  0x000002aa1aefe5b0 in source_return_path_thread
> > (opaque=opaque@entry=0x2aa1e27dc00) at
> > ../../migration/migration.c:2854
> > #7  0x000002aa1b6ded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #8  0x000003ff9d107aa8 in start_thread (arg=0x3ff8d7fe910) at
> > pthread_create.c:463
> > #9  0x000003ff9cffa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> OK, source waiting for recovery - my reading is we don't send the
> recovery until the next command in the test.
> 
> > 
> > Thread 4 (Thread 0x3ff8ed42910 (LWP 43252)):
> > #0  0x000003ff9d10d9fe in futex_wait_cancelable (private=<optimized
> > out>, expected=0, futex_word=0x2aa1e49ca68)
> >     at ../sysdeps/unix/sysv/linux/futex-internal.h:88
> > #1  0x000003ff9d10d9fe in __pthread_cond_wait_common (abstime=0x0,
> > mutex=0x2aa1c1a4840 <qemu_global_mutex>, cond=0x2aa1e49ca40)
> >     at pthread_cond_wait.c:502
> > #2  0x000003ff9d10d9fe in __pthread_cond_wait
> > (cond=cond@entry=0x2aa1e49ca40, mutex=mutex@entry=0x2aa1c1a4840
> > <qemu_global_mutex>)
> >     at pthread_cond_wait.c:655
> > #3  0x000002aa1b6df59e in qemu_cond_wait_impl (cond=0x2aa1e49ca40,
> > mutex=0x2aa1c1a4840 <qemu_global_mutex>, file=0x2aa1b8a93c6
> > "../../softmmu/cpus.c", line=<optimized out>) at
> > ../../util/qemu-thread-posix.c:194
> > #4  0x000002aa1b40764e in qemu_wait_io_event
> > (cpu=cpu@entry=0x2aa1e43aa50) at ../../softmmu/cpus.c:419
> > #5  0x000002aa1b406916 in mttcg_cpu_thread_fn
> > (arg=arg@entry=0x2aa1e43aa50) at
> > ../../accel/tcg/tcg-accel-ops-mttcg.c:98
> > #6  0x000002aa1b6ded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #7  0x000003ff9d107aa8 in start_thread (arg=0x3ff8ed42910) at
> > pthread_create.c:463
> > #8  0x000003ff9cffa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 3 (Thread 0x3ff8f735910 (LWP 43251)):
> > #0  0x000003ff9cfef1b0 in __GI___poll (fds=0x3ff64003620, nfds=3,
> > timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> > #1  0x000003ff9e852624 in  () at /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #2  0x000003ff9e852aa8 in g_main_loop_run () at
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #3  0x000002aa1b4eaf0e in iothread_run
> > (opaque=opaque@entry=0x2aa1df83b80) at ../../iothread.c:73
> > #4  0x000002aa1b6ded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #5  0x000003ff9d107aa8 in start_thread (arg=0x3ff8f735910) at
> > pthread_create.c:463
> > #6  0x000003ff9cffa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 2 (Thread 0x3ff90037910 (LWP 43250)):
> > #0  0x000003ff9cff52ea in syscall () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
> > #1  0x000002aa1b6dfd5c in qemu_futex_wait (val=<optimized out>,
> > f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
> > #2  0x000002aa1b6dfd5c in qemu_event_wait (ev=ev@entry=0x2aa1c1c3888
> > <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:480
> > #3  0x000002aa1b6d917c in call_rcu_thread (opaque=opaque@entry=0x0) at
> > ../../util/rcu.c:258
> > #4  0x000002aa1b6ded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #5  0x000003ff9d107aa8 in start_thread (arg=0x3ff90037910) at
> > pthread_create.c:463
> > #6  0x000003ff9cffa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 1 (Thread 0x3ff9feb5470 (LWP 43248)):
> > #0  0x000003ff9cfef302 in __GI_ppoll (fds=0x2aa1ed28d00, nfds=6,
> > timeout=<optimized out>,
> >     timeout@entry=0x3fff517ecf8, sigmask=sigmask@entry=0x0) at
> > ../sysdeps/unix/sysv/linux/ppoll.c:39
> > #1  0x000002aa1b701fec in ppoll (__ss=0x0, __timeout=0x3fff517ecf8,
> > __nfds=<optimized out>, __fds=<optimized out>)
> >     at /usr/include/s390x-linux-gnu/bits/poll2.h:77
> > #2  0x000002aa1b701fec in qemu_poll_ns (fds=<optimized out>,
> > nfds=<optimized out>, timeout=timeout@entry=1000000000)
> >     at ../../util/qemu-timer.c:348
> > #3  0x000002aa1b6d2f98 in os_host_main_loop_wait (timeout=1000000000)
> > at ../../util/main-loop.c:250
> > #4  0x000002aa1b6d2f98 in main_loop_wait
> > (nonblocking=nonblocking@entry=0) at ../../util/main-loop.c:531
> > #5  0x000002aa1b496d44 in qemu_main_loop () at ../../softmmu/runstate.c:726
> > #6  0x000002aa1ae6d3f0 in main (argc=<optimized out>, argv=<optimized
> > out>, envp=<optimized out>) at ../../softmmu/main.c:50
> > 
> > Backtrace, QEMU process 43256:
> > 
> > Thread 6 (Thread 0x3ff726ff910 (LWP 43440)):
> > #0  0x000003ffb9f10582 in futex_abstimed_wait_cancelable (private=0,
> > abstime=0x0, expected=0, futex_word=0x2aa1a75d2d4)
> >     at ../sysdeps/unix/sysv/linux/futex-internal.h:205
> > #1  0x000003ffb9f10582 in do_futex_wait (sem=sem@entry=0x2aa1a75d2d0,
> > abstime=0x0) at sem_waitcommon.c:111
> > #2  0x000003ffb9f1068c in __new_sem_wait_slow
> > (sem=sem@entry=0x2aa1a75d2d0, abstime=0x0) at sem_waitcommon.c:181
> > #3  0x000003ffb9f10734 in __new_sem_wait (sem=sem@entry=0x2aa1a75d2d0)
> > at sem_wait.c:42
> > #4  0x000002aa17ddfb96 in qemu_sem_wait (sem=sem@entry=0x2aa1a75d2d0)
> > at ../../util/qemu-thread-posix.c:357
> > #5  0x000002aa17599f06 in postcopy_pause_incoming (mis=<optimized
> > out>) at ../../migration/savevm.c:2600
> 
> So the dest is still waiting to be woken up from pause? Hmm I thought
> the test had already given it a kick.
> 
> > #6  0x000002aa17599f06 in qemu_loadvm_state_main
> > (f=f@entry=0x2aa1a751610, mis=mis@entry=0x2aa1a75d130)
> >     at ../../migration/savevm.c:2674
> > #7  0x000002aa1759af4a in postcopy_ram_listen_thread
> > (opaque=opaque@entry=0x0) at ../../migration/savevm.c:1872
> > #8  0x000002aa17dded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #9  0x000003ffb9f07aa8 in start_thread (arg=0x3ff726ff910) at
> > pthread_create.c:463
> > #10 0x000003ffb9dfa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 5 (Thread 0x3ff88ffe910 (LWP 43439)):
> > #0  0x000003ffb9f10582 in futex_abstimed_wait_cancelable (private=0,
> > abstime=0x0, expected=0, futex_word=0x2aa1a75d2fc)
> >     at ../sysdeps/unix/sysv/linux/futex-internal.h:205
> > #1  0x000003ffb9f10582 in do_futex_wait (sem=sem@entry=0x2aa1a75d2f8,
> > abstime=0x0) at sem_waitcommon.c:111
> > #2  0x000003ffb9f1068c in __new_sem_wait_slow
> > (sem=sem@entry=0x2aa1a75d2f8, abstime=0x0) at sem_waitcommon.c:181
> > #3  0x000003ffb9f10734 in __new_sem_wait (sem=sem@entry=0x2aa1a75d2f8)
> > at sem_wait.c:42
> > #4  0x000002aa17ddfb96 in qemu_sem_wait (sem=0x2aa1a75d2f8,
> > sem@entry=<error reading variable: value has been optimized out>)
> >     at ../../util/qemu-thread-posix.c:357
> > #5  0x000002aa177ae6aa in postcopy_pause_fault_thread (mis=<optimized
> > out>) at ../../migration/postcopy-ram.c:847
> > #6  0x000002aa177ae6aa in postcopy_ram_fault_thread
> > (opaque=opaque@entry=0x2aa1a75d130) at
> > ../../migration/postcopy-ram.c:911
> > #7  0x000002aa17dded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #8  0x000003ffb9f07aa8 in start_thread (arg=0x3ff88ffe910) at
> > pthread_create.c:463
> > #9  0x000003ffb9dfa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 4 (Thread 0x3ff89b18910 (LWP 43271)):
> > Python Exception <class 'gdb.error'> PC not saved:
> > 
> > Thread 3 (Thread 0x3ff8a319910 (LWP 43270)):
> > #0  0x000003ffb9def1b0 in __GI___poll (fds=0x3ff84003620, nfds=3,
> > timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> > #1  0x000003ffbb652624 in  () at /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #2  0x000003ffbb652aa8 in g_main_loop_run () at
> > /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> > #3  0x000002aa17beaf0e in iothread_run
> > (opaque=opaque@entry=0x2aa1a3aeb80) at ../../iothread.c:73
> > #4  0x000002aa17dded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #5  0x000003ffb9f07aa8 in start_thread (arg=0x3ff8a319910) at
> > pthread_create.c:463
> > #6  0x000003ffb9dfa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 2 (Thread 0x3fface37910 (LWP 43267)):
> > #0  0x000003ffb9df52ea in syscall () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
> > #1  0x000002aa17ddfd5c in qemu_futex_wait (val=<optimized out>,
> > f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
> > #2  0x000002aa17ddfd5c in qemu_event_wait (ev=ev@entry=0x2aa188c3888
> > <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:480
> > #3  0x000002aa17dd917c in call_rcu_thread (opaque=opaque@entry=0x0) at
> > ../../util/rcu.c:258
> > #4  0x000002aa17dded72 in qemu_thread_start (args=<optimized out>) at
> > ../../util/qemu-thread-posix.c:541
> > #5  0x000003ffb9f07aa8 in start_thread (arg=0x3fface37910) at
> > pthread_create.c:463
> > #6  0x000003ffb9dfa11e in thread_start () at
> > ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> > 
> > Thread 1 (Thread 0x3ffbccb5470 (LWP 43256)):
> > #0  0x000003ffb9f0d9fe in futex_wait_cancelable (private=<optimized
> > out>, expected=0, futex_word=0x2aa188a47e8 <qemu_pause_cond+40>)
> >     at ../sysdeps/unix/sysv/linux/futex-internal.h:88
> > #1  0x000003ffb9f0d9fe in __pthread_cond_wait_common (abstime=0x0,
> > mutex=0x2aa188a4840 <qemu_global_mutex>, cond=0x2aa188a47c0
> > <qemu_pause_cond>) at pthread_cond_wait.c:502
> > #2  0x000003ffb9f0d9fe in __pthread_cond_wait
> > (cond=cond@entry=0x2aa188a47c0 <qemu_pause_cond>,
> > mutex=mutex@entry=0x2aa188a4840 <qemu_global_mutex>) at
> > pthread_cond_wait.c:655
> > #3  0x000002aa17ddf59e in qemu_cond_wait_impl (cond=0x2aa188a47c0
> > <qemu_pause_cond>, mutex=0x2aa188a4840 <qemu_global_mutex>,
> > file=0x2aa17fa93c6 "../../softmmu/cpus.c", line=<optimized out>) at
> > ../../util/qemu-thread-posix.c:194
> > #4  0x000002aa17b079e2 in pause_all_vcpus () at ../../softmmu/cpus.c:562
> > #5  0x000002aa17b07aec in do_vm_stop
> > (state=state@entry=RUN_STATE_SHUTDOWN,
> > send_stop=send_stop@entry=false)
> >     at ../../softmmu/cpus.c:261
> 
> Hang on; how is the dest (?) in shutdown?

Yeh, the other "mistery" is we don't have migration thread running on src at
all...  So I'm thinking maybe the migration failed somehow, and migration
thread quitted already.

Normally for recovery test we'll be stuck in postcopy_pause() on the src, if
postcopy_do_resume() failed we'll stick with the postcopy_pause_sem and wait
forever there; that won't eat the migration thread.

So it's gone only if we went the other way to MIG_THR_ERR_FATAL, I think.  That
can possibly be caused by not reaching MIGRATION_STATUS_POSTCOPY_RECOVER state
for the previous "migrate -r" command.  However I've no clue on why.

Maybe.. the stderr could help on what has failed; but by default they're
dropped.  So I'm wondering whether we should apply some patch like this to the
test temporarily:

---8<---
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cc5e83d98a..d4e3c78acc 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -725,7 +725,7 @@ static void test_postcopy_recovery(void)
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    args->hide_stderr = true;
+    args->hide_stderr = false;
 
     if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
---8<---

So if postcopy recovery is the only thing that fails, then we enable stderr for
this test. When it crashes we have a chance to get the stderr of both src/dst
qemu, maybe?

Thanks,

> 
> > #6  0x000002aa17b07bb6 in vm_shutdown () at ../../softmmu/cpus.c:280
> > #7  0x000002aa17b9716e in qemu_cleanup () at ../../softmmu/runstate.c:812
> > #8  0x000002aa1756d3f6 in main (argc=<optimized out>, argv=<optimized
> > out>, envp=<optimized out>) at ../../softmmu/main.c:51
> > 
> > No, I dunno why thread 4 was odd. Backtracing that thread seems to
> > only work about one time in two. Here's the backtrace from a
> > success:
> 
> That maybe due to postcopy userfault; it can confuse things sometimes.
> 
> > #0  0x000002aa17b1ca2e in load_memop (op=MO_8, haddr=0x3ff80c6d000) at
> > ../../accel/tcg/cputlb.c:1860
> 
> So just a read, on a page boundary?  So possibly triggered a page read
> over postcopy?
> 
> Dave
> 
> > #1  0x000002aa17b1ca2e in load_helper (full_load=<optimized out>,
> > code_read=false, op=MO_8, retaddr=4396070052416, oi=<optimized out>,
> > addr=1177997312, env=0x2aa1a86f890) at ../../accel/tcg/cputlb.c:1980
> > #2  0x000002aa17b1ca2e in full_ldub_mmu (env=0x2aa1a86f890,
> > addr=1177997312, oi=<optimized out>, retaddr=4396070052416)
> >     at ../../accel/tcg/cputlb.c:1996
> > #3  0x000003ff8a31a35e in code_gen_buffer ()
> > #4  0x000002aa17bbabb4 in cpu_tb_exec (tb_exit=<synthetic pointer>,
> > itb=<optimized out>, cpu=<optimized out>)
> >     at ../../accel/tcg/cpu-exec.c:353
> > #5  0x000002aa17bbabb4 in cpu_loop_exec_tb (tb_exit=<synthetic
> > pointer>, last_tb=<synthetic pointer>, tb=<optimized out>,
> > cpu=<optimized out>) at ../../accel/tcg/cpu-exec.c:812
> > #6  0x000002aa17bbabb4 in cpu_exec (cpu=<optimized out>) at
> > ../../accel/tcg/cpu-exec.c:970
> > #7  0x000002aa18764620 in  ()
> > 
> > -- PMM
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

-- 
Peter Xu


