Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3151397B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:15:06 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6nJ-0005OT-AU
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5l3-0003Qu-0R
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:08:41 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:46315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5l1-0002xu-7r
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:08:40 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f7d19cac0bso56025937b3.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E4sJdyzOZFuctR73Cgf43MKCMHXbivpIR6IAculxqb0=;
 b=iPOiSkGiJx+wcHOmkqVnNjxguxrh7jUy73qHN9PG6kKyIQNcPR6/AumTT2ekUVgfaG
 6kI/hdSyvzvVoEjb+KZE6e9Ju5KFRT/fApuo/QGYo32RKd6qfFAFJ9nvmXV1YwS/lOiO
 tnu6Xir3mIbzlJLnQP4rbUD9/XBndSWwYzTD+4JPFIHsBPaggf//GNhyuhqg54ZF35BW
 dL5WnFkqUwL9TzkjLlSGo8hqTrN+2/oATfsQ/3VetX1Lw53vWLf43mtz7ceJf0zuBkhb
 JbxnxORfQ64hxsKYY79N2UqvwQkRwXRBKvO8OYlK+F61owpQu7vkwDRK6UPHQnQpIcgq
 piFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E4sJdyzOZFuctR73Cgf43MKCMHXbivpIR6IAculxqb0=;
 b=d0Jt61agTCb8ma1PUssIUgO/YZv3/rmv7TEvVUYEXYMbwAvJG1eV2SRw9yp7wOnqie
 O4p3SG39Lom7DNi0Eg+Ng0NP9Nrg6ywLCMOvnIzIKhnu0Nk+Z4U1QYcfc5vh5f8qgk6x
 w9w2vodVMiMoPBeAHQGlV/WE/nVtsTc8FpmSwJnyxOjIbBLleMpN8PmE9mEGVkI2r75M
 vfhw0iNDgKMKA2YZ2Qgz1o1wLzM4k1Li8vTtZI2IgOpNb1rtwCQUA6JZRWVwFAMxGL6W
 VE8423GjSoMnmdENzZzqKRrqMUea73jGJ88aR13YoeC6tZ8IdGLwhAb+9ayUQOvaJZ5n
 T65w==
X-Gm-Message-State: AOAM533TqTudxIs1XgIXHaKYApZktHF1P6BQL2fsWv+Gf69RXXxEdEKi
 Aja7bn3bak/I1agcS23DlcLkGpdNwFWu/hN2hnsZzA==
X-Google-Smtp-Source: ABdhPJzJ7LUPzSFfMLQObnFYrnJmWS/tfolUGJx/+W905sMGWiuEAgXtTmxRAP0qrzp2B93q+w4/xOAHmsDV1Ge0vqM=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr24439703ywb.469.1651158512016; Thu, 28
 Apr 2022 08:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_X7d9-e+u3UpB5WvJrmJhhRKdw8EhUzCdFDNVfhFF8mg@mail.gmail.com>
 <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com>
 <87zglee9w3.fsf@secure.mitica>
In-Reply-To: <87zglee9w3.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 16:08:20 +0100
Message-ID: <CAFEAcA8rxwMmWm_CnFMG7407h5pTdPeVJVG8bJC9uryUZHDd_w@mail.gmail.com>
Subject: Re: hang in migration-test (s390 host)
To: quintela@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 08:04, Juan Quintela <quintela@redhat.com> wrote:
>
> Laurent Vivier <lvivier@redhat.com> wrote:
> > Perhaps Juan or Thomas can help too (added to cc)
> >
> > Is this a regression?
> > It looks like a bug in QEMU as it doesn't move from cancelling to cancelled.

I had a repeat of this hang (same machine), so here's the debug
info I wasn't able to gather the first time round.

> >> [Inferior 1 (process 2771497) detached]
> >> ===========================================================
> >> PROCESS: 2772862
> >> gitlab-+ 2772862 2771497 99 Mar23 ?        18:45:28 ./qemu-system-i386
> >> -qtest unix:/tmp/qtest-2771497.sock -qtest-log /dev/null -chardev
> >> socket,path=/tmp/qtest-2771497.qmp,id=char0 -mon
> >> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> >> source,debug-threads=on -m 150M -serial
> >> file:/tmp/migration-test-f6G71L/src_serial -drive
> >> file=/tmp/migration-test-f6G71L/bootsect,format=raw -accel qtest
>
> Source of migration thread.
>
> >> [New LWP 2772864]
> >> [New LWP 2772866]
> >> [New LWP 2772867]
> >> [New LWP 2772915]
> >> [Thread debugging using libthread_db enabled]
> >> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> >> 0x000003ff94ef1c9c in __ppoll (fds=0x2aa179a6f30, nfds=5,
> >> timeout=<optimized out>, timeout@entry=0x3fff557b588,
> >> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> >> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
> >> Thread 5 (Thread 0x3ff1b7f6900 (LWP 2772915)):
> >> #0  futex_abstimed_wait_cancelable (private=0, abstime=0x0, clockid=0,
> >> expected=0, futex_word=0x2aa1881f634) at
> >> ../sysdeps/nptl/futex-internal.h:320
> >> #1  do_futex_wait (sem=sem@entry=0x2aa1881f630, abstime=0x0,
> >> clockid=0) at sem_waitcommon.c:112
> >> #2  0x000003ff95011870 in __new_sem_wait_slow
> >> (sem=sem@entry=0x2aa1881f630, abstime=0x0, clockid=0) at
> >> sem_waitcommon.c:184
> >> #3  0x000003ff9501190e in __new_sem_wait (sem=sem@entry=0x2aa1881f630)
> >> at sem_wait.c:42
> >> #4  0x000002aa165b1416 in qemu_sem_wait (sem=sem@entry=0x2aa1881f630)
> >> at ../util/qemu-thread-posix.c:358
> >> #5  0x000002aa16023434 in multifd_send_sync_main (f=0x2aa17993760) at
> >> ../migration/multifd.c:610
> >> #6  0x000002aa162a8f18 in ram_save_iterate (f=0x2aa17993760,
> >> opaque=<optimized out>) at ../migration/ram.c:3049
> >> #7  0x000002aa1602bafc in qemu_savevm_state_iterate (f=0x2aa17993760,
> >> postcopy=<optimized out>) at ../migration/savevm.c:1296
> >> #8  0x000002aa1601fe4e in migration_iteration_run (s=0x2aa17748010) at
> >> ../migration/migration.c:3607
> >> #9  migration_thread (opaque=opaque@entry=0x2aa17748010) at
> >> ../migration/migration.c:3838
> >> #10 0x000002aa165b05c2 in qemu_thread_start (args=<optimized out>) at
> >> ../util/qemu-thread-posix.c:556
> >> #11 0x000003ff95007e66 in start_thread (arg=0x3ff1b7f6900) at
> >> pthread_create.c:477
> >> #12 0x000003ff94efcbf6 in thread_start () at
> >> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
>
> Migration main thread in multifd_send_sync_main(), waiting for the
> semaphore in
>
>     for (i = 0; i < migrate_multifd_channels(); i++) {
>         MultiFDSendParams *p = &multifd_send_state->params[i];
>
>         trace_multifd_send_sync_main_wait(p->id);
>         qemu_sem_wait(&p->sem_sync);
>     }
>
> Knowing the value of i would be great.  See the end of the email, I
> think it is going to be 0.

gdb says i is 1. Possibly the compiler has enthusiastically
reordered the 'i++' above the qemu_sem_wait(), though.
I tried to get gdb to tell me the value of migrate_multifd_channels(),
but that was a mistake because gdb's attempt to execute code in
the debuggee to answer that question did not work and left it
in a state where it was broken and I had to kill it.

Is there something we can put into either QEMU or the test
case that will let us get some better information when this
happens again ?

thanks
-- PMM

