Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07F4D8A87
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:09:02 +0100 (CET)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToBp-0003lB-TG
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:09:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nToAX-0002Hm-EW
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nToAV-0003SB-2r
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647277658;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIHfc79yWy7UmGtqjBFylt4psjb8qB4fcHb7kCqDoOU=;
 b=elIIbQbjMGhEfIb/0JDd/gCEYShKxsUNuUiIPYzFjhsiMT30D+Vc9AO7dGwdq+vBmGZ5p+
 /4ZcUaxjIaFLKoPqn2S33Dtx0q6Afr2qNLl5cGn9jFYSZjFgi5FUQcFHL4OuJRgsfELwdg
 lUzfAIoMp9hEPwh/Ho9htoG7hNoDErU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-Kx3hkNLAPqCc3ZGwj5Imjg-1; Mon, 14 Mar 2022 13:07:25 -0400
X-MC-Unique: Kx3hkNLAPqCc3ZGwj5Imjg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E12323806729;
 Mon, 14 Mar 2022 17:07:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCAD04B6104;
 Mon, 14 Mar 2022 17:07:22 +0000 (UTC)
Date: Mon, 14 Mar 2022 17:07:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yi92SN2Z3OZi82pS@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, quintela@redhat.com, s.reiter@proxmox.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 04:56:18PM +0000, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 18:47, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >
> > * Philippe Mathieu-Daudé (philippe.mathieu.daude@gmail.com) wrote:
> > > I'm seeing an error on the s390x runner:
> > >
> > > ▶  26/547 ERROR:../tests/qtest/migration-test.c:276:check_guests_ram:
> > > assertion failed: (bad == 0) ERROR
> > >
> > >  26/547 qemu:qtest+qtest-i386 / qtest-i386/migration-test            ERROR
> > > 78.87s   killed by signal 6 SIGABRT
> > >
> > > https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/562515884#L7848
> >
> > Yeh, thuth mentioned that, it seems to only be s390 which is odd.
> > I'm not seeing anything obviously architecture dependent in that set, or
> > for that matter that plays with the ram migration stream much.
> > Is this reliable enough that someone with a tame s390 could bisect?
> 
> Didn't see a SIGABRT, but here's a gdb backtrace of a hang
> in the migration test on s390 host. I have also observed the
> migration test hanging on macos host, so I don't think this is
> s390-specific.
> 
> Process tree:
> migration-test(455775)-+-qemu-system-i38(456194)
>                        |-qemu-system-i38(456200)
>                        `-qemu-system-i38(456266)
> ===========================================================
> PROCESS: 455775
> linux1    455775  312266  5 14:36 pts/0    00:07:19
> ./tests/qtest/migration-test -tap -k
> [New LWP 455776]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> __libc_read (nbytes=1, buf=0x3ffe69fd816, fd=4) at
> ../sysdeps/unix/sysv/linux/read.c:26
> 26      ../sysdeps/unix/sysv/linux/read.c: No such file or directory.


> 
> #5  0x000002aa1e894ede in qtest_vqmp (s=0x2aa200f6a20,
> fmt=0x2aa1e8f140c "{ 'execute': 'query-migrate' }", ap=0x3ffe69fdb80)
> at ../../tests/qtest/libqtest.c:749

So the test harness is waiting for a reply to 'query-migrate'.

This should be fast unless QEMU has hung in the main event
loop servicing monitor commands, or stopped.


> ===========================================================
> PROCESS: 456194
> linux1    456194  455775 85 14:39 pts/0    01:54:06 ./qemu-system-i386
> -qtest unix:/tmp/qtest-455775.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-455775.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> source,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-dmqzpM/src_serial -drive
> file=/tmp/migration-test-dmqzpM/bootsect,format=raw -accel qtest
> [New LWP 456196]
> [New LWP 456197]
> [New LWP 456198]
> [New LWP 456229]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> 0x000003ff9a071c9c in __ppoll (fds=0x2aa2c46c2f0, nfds=5,
> timeout=<optimized out>, sigmask=0x0) at
> ../sysdeps/unix/sysv/linux/ppoll.c:44
> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
> 
> Thread 5 (Thread 0x3fee0ff9900 (LWP 456229)):
> #0  futex_abstimed_wait_cancelable (private=0, abstime=0x0, clockid=0,
> expected=0, futex_word=0x2aa2c46e7e4) at
> ../sysdeps/nptl/futex-internal.h:320
> #1  do_futex_wait (sem=sem@entry=0x2aa2c46e7e0, abstime=0x0,
> clockid=0) at sem_waitcommon.c:112
> #2  0x000003ff9a191870 in __new_sem_wait_slow (sem=0x2aa2c46e7e0,
> abstime=0x0, clockid=0) at sem_waitcommon.c:184
> #3  0x000003ff9a19190e in __new_sem_wait (sem=<optimized out>) at sem_wait.c:42
> #4  0x000002aa2923da1e in qemu_sem_wait (sem=0x2aa2c46e7e0) at
> ../../util/qemu-thread-posix.c:358
> #5  0x000002aa289483cc in multifd_send_sync_main (f=0x2aa2b5f92d0) at
> ../../migration/multifd.c:610
> #6  0x000002aa28dfa30c in ram_save_iterate (f=0x2aa2b5f92d0,
> opaque=0x2aa29bf75d0 <ram_state>) at ../../migration/ram.c:3049
> #7  0x000002aa28958fee in qemu_savevm_state_iterate (f=0x2aa2b5f92d0,
> postcopy=false) at ../../migration/savevm.c:1296
> #8  0x000002aa28942d40 in migration_iteration_run (s=0x2aa2b3f9800) at
> ../../migration/migration.c:3607
> #9  0x000002aa289434da in migration_thread (opaque=0x2aa2b3f9800) at
> ../../migration/migration.c:3838
> #10 0x000002aa2923e020 in qemu_thread_start (args=0x2aa2b8b29e0) at
> ../../util/qemu-thread-posix.c:556
> #11 0x000003ff9a187e66 in start_thread (arg=0x3fee0ff9900) at
> pthread_create.c:477
> #12 0x000003ff9a07cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 4 (Thread 0x3ff89f2f900 (LWP 456198)):
> #0  env_neg (env=0x2aa2b5f5030) at /home/linux1/qemu/include/exec/cpu-all.h:478
> #1  0x000002aa28f5376a in env_tlb (env=0x2aa2b5f5030) at
> /home/linux1/qemu/include/exec/cpu-all.h:502
> #2  0x000002aa28f538a8 in tlb_index (env=0x2aa2b5f5030, mmu_idx=2,
> addr=73265152) at /home/linux1/qemu/include/exec/cpu_ldst.h:366
> #3  0x000002aa28f574bc in tlb_set_page_with_attrs (cpu=0x2aa2b5ec750,
> vaddr=73265152, paddr=73265152, attrs=..., prot=7, mmu_idx=2,
> size=4096) at ../../accel/tcg/cputlb.c:1194
> #4  0x000002aa28cdfd3e in handle_mmu_fault (cs=0x2aa2b5ec750,
> addr=73265152, size=1, is_write1=0, mmu_idx=2) at
> ../../target/i386/tcg/sysemu/excp_helper.c:442
> #5  0x000002aa28cdfe90 in x86_cpu_tlb_fill (cs=0x2aa2b5ec750,
> addr=73265152, size=1, access_type=MMU_DATA_LOAD, mmu_idx=2,
> probe=false, retaddr=4393820748608) at
> ../../target/i386/tcg/sysemu/excp_helper.c:468
> #6  0x000002aa28f5794e in tlb_fill (cpu=0x2aa2b5ec750, addr=73265152,
> size=1, access_type=MMU_DATA_LOAD, mmu_idx=2, retaddr=4393820748608)
> at ../../accel/tcg/cputlb.c:1313
> #7  0x000002aa28f59982 in load_helper (env=0x2aa2b5f5030,
> addr=73265152, oi=3586, retaddr=4393820748608, op=MO_8,
> code_read=false, full_load=0x2aa28f59db0 <full_ldub_mmu>) at
> ../../accel/tcg/cputlb.c:1934
> #8  0x000002aa28f59e2e in full_ldub_mmu (env=0x2aa2b5f5030,
> addr=73265152, oi=3586, retaddr=4393820748608) at
> ../../accel/tcg/cputlb.c:2025
> #9  0x000002aa28f59e94 in helper_ret_ldub_mmu (env=0x2aa2b5f5030,
> addr=73265152, oi=3586, retaddr=4393820748608) at
> ../../accel/tcg/cputlb.c:2031
> #10 0x000003ff041ffbfa in code_gen_buffer ()
> #11 0x000002aa28f3cfba in cpu_tb_exec (cpu=0x2aa2b5ec750,
> itb=0x3ff441ffa00, tb_exit=0x3ff89f2af44) at
> ../../accel/tcg/cpu-exec.c:357
> #12 0x000002aa28f3e47e in cpu_loop_exec_tb (cpu=0x2aa2b5ec750,
> tb=0x3ff441ffa00, last_tb=0x3ff89f2af58, tb_exit=0x3ff89f2af44) at
> ../../accel/tcg/cpu-exec.c:847
> #13 0x000002aa28f3e970 in cpu_exec (cpu=0x2aa2b5ec750) at
> ../../accel/tcg/cpu-exec.c:1006
> #14 0x000002aa28f71a1e in tcg_cpus_exec (cpu=0x2aa2b5ec750) at
> ../../accel/tcg/tcg-accel-ops.c:68
> #15 0x000002aa28f71efe in mttcg_cpu_thread_fn (arg=0x2aa2b5ec750) at
> ../../accel/tcg/tcg-accel-ops-mttcg.c:96
> #16 0x000002aa2923e020 in qemu_thread_start (args=0x2aa2b60bb00) at
> ../../util/qemu-thread-posix.c:556
> #17 0x000003ff9a187e66 in start_thread (arg=0x3ff89f2f900) at
> pthread_create.c:477
> #18 0x000003ff9a07cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff8a821900 (LWP 456197)):
> #0  0x000003ff9a071b42 in __GI___poll (fds=0x3fefc003280, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ff9c7d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ff9c7d4790 in g_main_loop_run () at
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa28fd9d56 in iothread_run (opaque=0x2aa2b339750) at
> ../../iothread.c:73
> #4  0x000002aa2923e020 in qemu_thread_start (args=0x2aa2b2e7980) at
> ../../util/qemu-thread-posix.c:556
> #5  0x000003ff9a187e66 in start_thread (arg=0x3ff8a821900) at
> pthread_create.c:477
> #6  0x000003ff9a07cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff8b1a4900 (LWP 456196)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa2923db52 in qemu_futex_wait (f=0x2aa29c14244
> <rcu_call_ready_event>, val=4294967295) at
> /home/linux1/qemu/include/qemu/futex.h:29
> #2  0x000002aa2923ddf6 in qemu_event_wait (ev=0x2aa29c14244
> <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:481
> #3  0x000002aa2924cbd2 in call_rcu_thread (opaque=0x0) at ../../util/rcu.c:261
> #4  0x000002aa2923e020 in qemu_thread_start (args=0x2aa2b26ac90) at
> ../../util/qemu-thread-posix.c:556
> #5  0x000003ff9a187e66 in start_thread (arg=0x3ff8b1a4900) at
> pthread_create.c:477
> #6  0x000003ff9a07cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ff9d5fe440 (LWP 456194)):
> #0  0x000003ff9a071c9c in __ppoll (fds=0x2aa2c46c2f0, nfds=5,
> timeout=<optimized out>, sigmask=0x0) at
> ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x000002aa2927a3e4 in qemu_poll_ns (fds=0x2aa2c46c2f0, nfds=5,
> timeout=27206167) at ../../util/qemu-timer.c:348
> #2  0x000002aa29272280 in os_host_main_loop_wait (timeout=27206167) at
> ../../util/main-loop.c:250
> #3  0x000002aa29272434 in main_loop_wait (nonblocking=0) at
> ../../util/main-loop.c:531
> #4  0x000002aa28901276 in qemu_main_loop () at ../../softmmu/runstate.c:727
> #5  0x000002aa2887d2ce in main (argc=25, argv=0x3fff647eac8,
> envp=0x3fff647eb98) at ../../softmmu/main.c:50
> [Inferior 1 (process 456194) detached]


No obvious sign of a hang that would cause it to fail to reply
to 'query-migrate'



> ===========================================================
> PROCESS: 456266
> linux1    456266  455775  0 14:39 pts/0    00:00:00 ./qemu-system-i386
> -qtest unix:/tmp/qtest-455775.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-455775.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> target,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-dmqzpM/dest_serial -incoming defer -drive
> file=/tmp/migration-test-dmqzpM/bootsect,format=raw -accel qtest
> [New LWP 456268]
> [New LWP 456269]
> [New LWP 456270]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> 0x000003ff9a271c9c in __ppoll (fds=0x2aa0435eb40, nfds=6,
> timeout=<optimized out>, sigmask=0x0) at
> ../sysdeps/unix/sysv/linux/ppoll.c:44
> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
> 
> Thread 4 (Thread 0x3ff8a12f900 (LWP 456270)):
> #0  futex_wait_cancelable (private=0, expected=0,
> futex_word=0x2aa0459cbac) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
> mutex=0x2aa02ddec88 <qemu_global_mutex>, cond=0x2aa0459cb80) at
> pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=0x2aa0459cb80, mutex=0x2aa02ddec88
> <qemu_global_mutex>) at pthread_cond_wait.c:638
> #3  0x000002aa0243d498 in qemu_cond_wait_impl (cond=0x2aa0459cb80,
> mutex=0x2aa02ddec88 <qemu_global_mutex>, file=0x2aa024e81e8
> "../../softmmu/cpus.c", line=424) at
> ../../util/qemu-thread-posix.c:195
> #4  0x000002aa01af4cc0 in qemu_wait_io_event (cpu=0x2aa0457d750) at
> ../../softmmu/cpus.c:424
> #5  0x000002aa02172028 in mttcg_cpu_thread_fn (arg=0x2aa0457d750) at
> ../../accel/tcg/tcg-accel-ops-mttcg.c:124
> #6  0x000002aa0243e020 in qemu_thread_start (args=0x2aa0459cbc0) at
> ../../util/qemu-thread-posix.c:556
> #7  0x000003ff9a387e66 in start_thread (arg=0x3ff8a12f900) at
> pthread_create.c:477
> #8  0x000003ff9a27cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff8aa21900 (LWP 456269)):
> #0  0x000003ff9a271b42 in __GI___poll (fds=0x3fefc003280, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ff9c9d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ff9c9d4790 in g_main_loop_run () at
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa021d9d56 in iothread_run (opaque=0x2aa042ca750) at
> ../../iothread.c:73
> #4  0x000002aa0243e020 in qemu_thread_start (args=0x2aa04278980) at
> ../../util/qemu-thread-posix.c:556
> #5  0x000003ff9a387e66 in start_thread (arg=0x3ff8aa21900) at
> pthread_create.c:477
> #6  0x000003ff9a27cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff8b3a4900 (LWP 456268)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa0243db52 in qemu_futex_wait (f=0x2aa02e14244
> <rcu_call_ready_event>, val=4294967295) at
> /home/linux1/qemu/include/qemu/futex.h:29
> #2  0x000002aa0243ddf6 in qemu_event_wait (ev=0x2aa02e14244
> <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:481
> #3  0x000002aa0244cbd2 in call_rcu_thread (opaque=0x0) at ../../util/rcu.c:261
> #4  0x000002aa0243e020 in qemu_thread_start (args=0x2aa041fbc90) at
> ../../util/qemu-thread-posix.c:556
> #5  0x000003ff9a387e66 in start_thread (arg=0x3ff8b3a4900) at
> pthread_create.c:477
> #6  0x000003ff9a27cbf6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ff9d7fe440 (LWP 456266)):
> #0  0x000003ff9a271c9c in __ppoll (fds=0x2aa0435eb40, nfds=6,
> timeout=<optimized out>, sigmask=0x0) at
> ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x000002aa0247a3e4 in qemu_poll_ns (fds=0x2aa0435eb40, nfds=6,
> timeout=1000000000) at ../../util/qemu-timer.c:348
> #2  0x000002aa02472280 in os_host_main_loop_wait (timeout=1000000000)
> at ../../util/main-loop.c:250
> #3  0x000002aa02472434 in main_loop_wait (nonblocking=0) at
> ../../util/main-loop.c:531
> #4  0x000002aa01b01276 in qemu_main_loop () at ../../softmmu/runstate.c:727
> #5  0x000002aa01a7d2ce in main (argc=27, argv=0x3ffe38fe7e8,
> envp=0x3ffe38fe8c8) at ../../softmmu/main.c:50
> [Inferior 1 (process 456266) detached]

No obvious sign of trouble here either.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


