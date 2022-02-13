Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7F4B3D73
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 21:34:50 +0100 (CET)
Received: from localhost ([::1]:57468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJLa5-0008OS-MF
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 15:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJLYm-0007fP-8N
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 15:33:28 -0500
Received: from [2a00:1450:4864:20::433] (port=44015
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJLYi-0001SS-DJ
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 15:33:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id i14so23740374wrc.10
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 12:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W/GYqVnumJs3YluWknjaUBQ5KALhJCWb+RSTrL8Y3fg=;
 b=r1DtLhIEZqpLflADOAOcDTBeHvz31Xlqoi0rlMc9uXqcX/Kd8hEEZfcNL57FyK+Yfu
 ISn1NHwBKP3kIIF/j5WzX/AOxczoOE7vFjKvyFXpG7gevYsDUV2PqQeXteP1CcTxpTmt
 deFkeby1ngXIYIBlEubPAiZB5qZ7Vd/SHksdZV29Bj5TUIZp1EgJHE/1fW7p7yp6W6sH
 n6P67KtSMZZKptPN6IzP/9HSVYAcVYoMTHDVNj6HgzY1Yxvbsy9QpN4r0cKl28LOMTLb
 DYeKJU1PUE/UZiKcsWRzIOf7GBsVbYwxKFWuejYq4u/0RvRB5ZNA/06m1PA62DYofFjq
 POqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W/GYqVnumJs3YluWknjaUBQ5KALhJCWb+RSTrL8Y3fg=;
 b=XjLIm3T81iTE83yMez3cSFQS6lsAVoBZlrizNJf60pAB+UcNuCT/MKuxP2au3PzP55
 Ogl1XkkQ8d9qEWwiWzBWSgRcslwdcZYThsSz47ynK5XHWSYWr0uXXCP2LsRX0Qk31kbA
 suQkI3d9TKo0mH4xlZLoRk/zEy2i7UdrHCDo6wOrFjKvlQhRiNGHP3BXY3ngu/a5XwxV
 OeQDapVstC284yUZEZyDFHVbFfgAaR2Y8l4WqPB0AEzA1wehp+qUz5+ZcDSgVuSAu8AA
 aGdA+h4aa3voc1zsMdv3cXHZ3UagiyNiZ68ybxOqRaDjPE+a0316Bm2K6IjLoqKbX1eQ
 cXKw==
X-Gm-Message-State: AOAM531XwHM1PdezRHOa8izBtzNKx9bEjvobHvoVTcqi0QiAKlWd5Zuq
 zkCt1Sn7PjakfYdGJqI5Fq+I1hiS8FwsiYT94vGfLw==
X-Google-Smtp-Source: ABdhPJxDdEALsFmhByyYjq4XwAu4LnEh4ksXvzQm1TvxSLoxyKk1rWpn61IqYSrBiqdZbTG5Ufbl92PWWdKBqGLy6V4=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr9091323wrs.521.1644784401936; 
 Sun, 13 Feb 2022 12:33:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1644492115.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Feb 2022 20:33:10 +0000
Message-ID: <CAFEAcA-VRNzxOwMX4nPPm0vQba1ufL5yVwW5P1j9S2u7_fbW-w@mail.gmail.com>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 11:33, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132=
af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220210
>
> for you to fetch changes up to de19c79dad6a2cad54ae04ce754d47c07bf9bc93:
>
>   9pfs: Fix segfault in do_readdir_many caused by struct dirent overread =
(2022-02-10 11:56:01 +0100)
>
> ----------------------------------------------------------------
> 9pfs: fixes and cleanup
>
> * Fifth patch fixes a 9pfs server crash that happened on some systems due
>   to incorrect (system dependant) handling of struct dirent size.
>
> * Tests: Second patch fixes a test error that happened on some systems du=
e
>   mkdir() being called twice for creating the test directory for the 9p
>   'local' tests.
>
> * Tests: Third patch fixes a memory leak.
>
> * Tests: The remaining two patches are code cleanup.
>
> ----------------------------------------------------------------

Hi; this fails CI for the build-oss-fuzz job, which finds
a heap-buffer-overflow:
https://gitlab.com/qemu-project/qemu/-/jobs/2087610013

8/152 qemu:qtest+qtest-i386 / qtest-i386/qos-test ERROR 66.74s killed
by signal 6 SIGABRT
>>> QTEST_QEMU_BINARY=3D./qemu-system-i386 QTEST_QEMU_STORAGE_DAEMON_BINARY=
=3D./storage-daemon/qemu-storage-daemon MALLOC_PERTURB_=3D120 G_TEST_DBUS_D=
AEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_I=
MG=3D./qemu-img /builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-te=
st --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
Listing only the last 100 lines from a long log.
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7270=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7270=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7ffc79fb0000; bottom 0x7ff908ffd000; size:
0x000370fb3000 (14780411904)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7276=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7276=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7fff7e4a8000; bottom 0x7fd6363fd000; size:
0x0029480ab000 (177302319104)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7282=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7282=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7ffee6e7f000; bottom 0x7f32fb5fd000; size:
0x00cbeb882000 (875829927936)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7288=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7288=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7ffc6118e000; bottom 0x7f6391cfd000; size:
0x0098cf491000 (656312700928)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7294=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7294=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7ffef665d000; bottom 0x7f69dc8fd000; size:
0x009519d60000 (640383582208)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7300=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7300=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7ffe33db0000; bottom 0x7f01421fd000; size:
0x00fcf1bb3000 (1086387335168)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D7306=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
=3D=3D7306=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_return=
:
stack type: default top: 0x7ffebd618000; bottom 0x7ff1179fd000; size:
0x000da5c1b000 (58615508992)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D7306=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address
0x612000030768 at pc 0x562351066c74 bp 0x7ff1078c3a90 sp
0x7ff1078c3240
READ of size 48830 at 0x612000030768 thread T4
#0 0x562351066c73 in __interceptor_memcpy.part.0 asan_interceptors.cpp.o
#1 0x7ff1290d443f in g_memdup (/lib64/libglib-2.0.so.0+0x6e43f)
#2 0x56235134537a in do_readdir_many
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:146:19
#3 0x56235134537a in v9fs_co_readdir_many
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:225:5
#4 0x56235132d626 in v9fs_do_readdir
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2430:13
#5 0x56235132d626 in v9fs_readdir
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2543:13
#6 0x56235257101e in coroutine_trampoline
/builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c:173:9
#7 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
0x612000030768 is located 0 bytes to the right of 296-byte region
[0x612000030640,0x612000030768)
allocated by thread T4 here:
#0 0x5623510a4e47 in malloc
(/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x1146e47)
#1 0x7ff1290c03d8 in g_malloc (/lib64/libglib-2.0.so.0+0x5a3d8)
#2 0x56235131e659 in synth_opendir
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p-synth.c:185:18
#3 0x5623513462f5 in v9fs_co_opendir
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:321:5
#4 0x5623513257d7 in v9fs_open
/builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:1959:15
#5 0x56235257101e in coroutine_trampoline
/builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c:173:9
#6 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
Thread T4 created by T0 here:
#0 0x562351015926 in pthread_create
(/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x10b7926)
#1 0x5623525351ea in qemu_thread_create
/builds/qemu-project/qemu/build-oss-fuzz/../util/qemu-thread-posix.c:596:11
#2 0x5623525a4588 in do_spawn_thread
/builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:134:5
#3 0x5623525a4588 in spawn_thread_bh_fn
/builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:142:5
#4 0x562352569814 in aio_bh_call
/builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:141:5
#5 0x562352569814 in aio_bh_poll
/builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:169:13
#6 0x5623525248cc in aio_dispatch
/builds/qemu-project/qemu/build-oss-fuzz/../util/aio-posix.c:415:5
#7 0x56235256c34c in aio_ctx_dispatch
/builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:311:5
#8 0x7ff1290bb05e in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x550=
5e)
SUMMARY: AddressSanitizer: heap-buffer-overflow
asan_interceptors.cpp.o in __interceptor_memcpy.part.0
Shadow bytes around the buggy address:
0x0c247fffe090: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
0x0c247fffe0a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
0x0c247fffe0b0: fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa fa
0x0c247fffe0c0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
0x0c247fffe0d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=3D>0x0c247fffe0e0: 00 00 00 00 00 00 00 00 00 00 00 00 00[fa]fa fa
0x0c247fffe0f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
0x0c247fffe100: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
0x0c247fffe110: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
0x0c247fffe120: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
0x0c247fffe130: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
Addressable: 00
Partially addressable: 01 02 03 04 05 06 07
Heap left redzone: fa
Freed heap region: fd
Stack left redzone: f1
Stack mid redzone: f2
Stack right redzone: f3
Stack after return: f5
Stack use after scope: f8
Global redzone: f9
Global init order: f6
Poisoned by user: f7
Container overflow: fc
Array cookie: ac
Intra object redzone: bb
ASan internal: fe
Left alloca redzone: ca
Right alloca redzone: cb
=3D=3D7306=3D=3DABORTING


thanks
-- PMM

