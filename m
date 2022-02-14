Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BF4B4682
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:50:38 +0100 (CET)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJY0D-00055w-Ek
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:50:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJXxX-0003To-5w
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:47:53 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJXxU-0000tW-Ce
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TqO9CwKnNwPd8NwxnRy99meImJnVwzesqeOpM5eg2zo=; b=Iw5jLbde70WhRmnluDPvKC/xdc
 dyZ5Gin2TqOccWECy8mgcfDOCC/QjayAPHsMOWP4xf8a/f1t00iVSVAzSmWhOektZlZGbpRK9b4AR
 91d7LPgT1uQZcvLTOVa7jEBYWua/d2SJoT+kekKUP1z6R4xzWg1MfWKZMnkMkn80zGScPBWrZJfYg
 L++P8SKrjlWUM3LaYsIgDSoNV9zxmsWkOGb4jptCIz2jNa8f/eGPyUHs0W/jX+P2P/XZE99z/Ez15
 5yzFzvVQYIrqq/T2Sdl7Z3iEXYZgTGU2aLF293aipCduIcWcyvEXefl/bJptGmnD6aEnQenLLDlTx
 xAzAt36XYdps1AJhRD5rto0gt3r/z/r006mfew+ks4pAyez4q5nyiQYktmEYfxxm1rDkUGwtAde/P
 L3W8yEY7YNr0m1gSHknTyWK8ttaovuDkE6znO03WmD6gYHhfjG7XC5HDAtKJ9dMwzDi6UqmSMo36L
 M/1lpFofHhBZ9O80+WDETM/GelnEABxlDlLrsBuWtIzFEY9m6JmZkJWrzKssqbxUxPZpsbX+jr8iF
 7hfQsV9nz7jCFAFpcYIu+Y8zP4nGcsgMKEmywF6nA8jozWx8vnBeXv+HDBqU0j5jtMQ7rgVHOsOQ7
 HffOTIU1spRw9l4v+S/BveAZiBOw79TruzZWzBCD4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Vitaly Chikunov <vt@altlinux.org>, "Dmitry V . Levin" <ldv@altlinux.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Date: Mon, 14 Feb 2022 10:47:43 +0100
Message-ID: <2037112.271zI61438@silver>
In-Reply-To: <CAFEAcA-VRNzxOwMX4nPPm0vQba1ufL5yVwW5P1j9S2u7_fbW-w@mail.gmail.com>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <CAFEAcA-VRNzxOwMX4nPPm0vQba1ufL5yVwW5P1j9S2u7_fbW-w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 13. Februar 2022 21:33:10 CET Peter Maydell wrote:
> On Thu, 10 Feb 2022 at 11:33, Christian Schoenebeck
>=20
> <qemu_oss@crudebyte.com> wrote:
> > The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe1=
32af:
> >   Merge remote-tracking branch
> >   'remotes/pmaydell/tags/pull-target-arm-20220208' into staging
> >   (2022-02-08 11:40:08 +0000)>=20
> > are available in the Git repository at:
> >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220210
> >=20
> > for you to fetch changes up to de19c79dad6a2cad54ae04ce754d47c07bf9bc93:
> >   9pfs: Fix segfault in do_readdir_many caused by struct dirent overread
> >   (2022-02-10 11:56:01 +0100)>=20
> > ----------------------------------------------------------------
> > 9pfs: fixes and cleanup
> >=20
> > * Fifth patch fixes a 9pfs server crash that happened on some systems d=
ue
> >=20
> >   to incorrect (system dependant) handling of struct dirent size.
> >=20
> > * Tests: Second patch fixes a test error that happened on some systems =
due
> >=20
> >   mkdir() being called twice for creating the test directory for the 9p
> >   'local' tests.
> >=20
> > * Tests: Third patch fixes a memory leak.
> >=20
> > * Tests: The remaining two patches are code cleanup.
> >=20
> > ----------------------------------------------------------------
>=20
> Hi; this fails CI for the build-oss-fuzz job, which finds
> a heap-buffer-overflow:
> https://gitlab.com/qemu-project/qemu/-/jobs/2087610013

So this is about the 'dirent' patch:
https://github.com/cschoenebeck/qemu/commit/de19c79dad6a2cad54ae04ce754d47c=
07bf9bc93

In conjunction with the 9p fuzzing tests:
https://wiki.qemu.org/Documentation/9p#Fuzzing

I first thought it might be a false positive due to the unorthodox handling=
 of
dirent duplication by that patch, but from the ASan output below I am not
really sure about that.

Is there a way to get the content of local variables?

Would it be possible that the following issue (g_memdup vs. g_memdup2) might
apply here?
https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-n=
ow/5538

Best regards,
Christian Schoenebeck

>=20
> 8/152 qemu:qtest+qtest-i386 / qtest-i386/qos-test ERROR 66.74s killed
> by signal 6 SIGABRT
>=20
> >>> QTEST_QEMU_BINARY=3D./qemu-system-i386
> >>> QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daem=
on
> >>> MALLOC_PERTURB_=3D120
> >>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-dae=
mon.
> >>> sh QTEST_QEMU_IMG=3D./qemu-img
> >>> /builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test --tap -k
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 Listing only the last 100 lines from
> a long log.
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7270=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7270=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7ffc79fb0000; bottom 0x7ff908ffd000; size:
> 0x000370fb3000 (14780411904)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7276=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7276=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7fff7e4a8000; bottom 0x7fd6363fd000; size:
> 0x0029480ab000 (177302319104)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7282=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7282=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7ffee6e7f000; bottom 0x7f32fb5fd000; size:
> 0x00cbeb882000 (875829927936)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7288=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7288=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7ffc6118e000; bottom 0x7f6391cfd000; size:
> 0x0098cf491000 (656312700928)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7294=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7294=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7ffef665d000; bottom 0x7f69dc8fd000; size:
> 0x009519d60000 (640383582208)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7300=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7300=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7ffe33db0000; bottom 0x7f01421fd000; size:
> 0x00fcf1bb3000 (1086387335168)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D7306=3D=3DWARNING: ASan doesn't fully support makecontext/swapconte=
xt
> functions and may produce false positives in some cases!
> =3D=3D7306=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_retu=
rn:
> stack type: default top: 0x7ffebd618000; bottom 0x7ff1179fd000; size:
> 0x000da5c1b000 (58615508992)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D7306=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address
> 0x612000030768 at pc 0x562351066c74 bp 0x7ff1078c3a90 sp
> 0x7ff1078c3240
> READ of size 48830 at 0x612000030768 thread T4
> #0 0x562351066c73 in __interceptor_memcpy.part.0 asan_interceptors.cpp.o
> #1 0x7ff1290d443f in g_memdup (/lib64/libglib-2.0.so.0+0x6e43f)
> #2 0x56235134537a in do_readdir_many
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:146:19
> #3 0x56235134537a in v9fs_co_readdir_many
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:225:5
> #4 0x56235132d626 in v9fs_do_readdir
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2430:13
> #5 0x56235132d626 in v9fs_readdir
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2543:13
> #6 0x56235257101e in coroutine_trampoline
> /builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c:173=
:9
> #7 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
> 0x612000030768 is located 0 bytes to the right of 296-byte region
> [0x612000030640,0x612000030768)
> allocated by thread T4 here:
> #0 0x5623510a4e47 in malloc
> (/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x1146e47)
> #1 0x7ff1290c03d8 in g_malloc (/lib64/libglib-2.0.so.0+0x5a3d8)
> #2 0x56235131e659 in synth_opendir
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p-synth.c:185:18
> #3 0x5623513462f5 in v9fs_co_opendir
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:321:5
> #4 0x5623513257d7 in v9fs_open
> /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:1959:15
> #5 0x56235257101e in coroutine_trampoline
> /builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c:173=
:9
> #6 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
> Thread T4 created by T0 here:
> #0 0x562351015926 in pthread_create
> (/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x10b7926)
> #1 0x5623525351ea in qemu_thread_create
> /builds/qemu-project/qemu/build-oss-fuzz/../util/qemu-thread-posix.c:596:=
11
> #2 0x5623525a4588 in do_spawn_thread
> /builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:134:5
> #3 0x5623525a4588 in spawn_thread_bh_fn
> /builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:142:5
> #4 0x562352569814 in aio_bh_call
> /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:141:5
> #5 0x562352569814 in aio_bh_poll
> /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:169:13
> #6 0x5623525248cc in aio_dispatch
> /builds/qemu-project/qemu/build-oss-fuzz/../util/aio-posix.c:415:5
> #7 0x56235256c34c in aio_ctx_dispatch
> /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:311:5
> #8 0x7ff1290bb05e in g_main_context_dispatch
> (/lib64/libglib-2.0.so.0+0x5505e) SUMMARY: AddressSanitizer:
> heap-buffer-overflow
> asan_interceptors.cpp.o in __interceptor_memcpy.part.0
> Shadow bytes around the buggy address:
> 0x0c247fffe090: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
> 0x0c247fffe0a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> 0x0c247fffe0b0: fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa fa
> 0x0c247fffe0c0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
> 0x0c247fffe0d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> =3D>0x0c247fffe0e0: 00 00 00 00 00 00 00 00 00 00 00 00 00[fa]fa fa
> 0x0c247fffe0f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> 0x0c247fffe100: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> 0x0c247fffe110: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> 0x0c247fffe120: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> 0x0c247fffe130: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> Shadow byte legend (one shadow byte represents 8 application bytes):
> Addressable: 00
> Partially addressable: 01 02 03 04 05 06 07
> Heap left redzone: fa
> Freed heap region: fd
> Stack left redzone: f1
> Stack mid redzone: f2
> Stack right redzone: f3
> Stack after return: f5
> Stack use after scope: f8
> Global redzone: f9
> Global init order: f6
> Poisoned by user: f7
> Container overflow: fc
> Array cookie: ac
> Intra object redzone: bb
> ASan internal: fe
> Left alloca redzone: ca
> Right alloca redzone: cb
> =3D=3D7306=3D=3DABORTING
>=20
>=20
> thanks
> -- PMM



