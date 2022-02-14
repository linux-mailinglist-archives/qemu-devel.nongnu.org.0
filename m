Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088754B4B64
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:41:41 +0100 (CET)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYnc-0005a0-4b
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:41:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJYjL-0003Dl-1W
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:37:15 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:32615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJYjI-0000OK-5c
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:37:14 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-3yZCuYQuN6C_Ex7e7cY3Xg-1; Mon, 14 Feb 2022 05:36:58 -0500
X-MC-Unique: 3yZCuYQuN6C_Ex7e7cY3Xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DA5C18A0F2A;
 Mon, 14 Feb 2022 10:36:56 +0000 (UTC)
Received: from bahia (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135625E4A5;
 Mon, 14 Feb 2022 10:36:54 +0000 (UTC)
Date: Mon, 14 Feb 2022 11:36:53 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Message-ID: <20220214113653.087a06e2@bahia>
In-Reply-To: <2037112.271zI61438@silver>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <CAFEAcA-VRNzxOwMX4nPPm0vQba1ufL5yVwW5P1j9S2u7_fbW-w@mail.gmail.com>
 <2037112.271zI61438@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Vitaly Chikunov <vt@altlinux.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, "Dmitry V . Levin" <ldv@altlinux.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 10:47:43 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Sonntag, 13. Februar 2022 21:33:10 CET Peter Maydell wrote:
> > On Thu, 10 Feb 2022 at 11:33, Christian Schoenebeck
> >=20
> > <qemu_oss@crudebyte.com> wrote:
> > > The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274f=
e132af:
> > >   Merge remote-tracking branch
> > >   'remotes/pmaydell/tags/pull-target-arm-20220208' into staging
> > >   (2022-02-08 11:40:08 +0000)>=20
> > > are available in the Git repository at:
> > >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220210
> > >=20
> > > for you to fetch changes up to de19c79dad6a2cad54ae04ce754d47c07bf9bc=
93:
> > >   9pfs: Fix segfault in do_readdir_many caused by struct dirent overr=
ead
> > >   (2022-02-10 11:56:01 +0100)>=20
> > > ----------------------------------------------------------------9d82f=
6a3e68c2
> > > 9pfs: fixes and cleanup
> > >=20
> > > * Fifth patch fixes a 9pfs server crash that happened on some systems=
 due
> > >=20
> > >   to incorrect (system dependant) handling of struct dirent size.
> > >=20
> > > * Tests: Second patch fixes a test error that happened on some system=
s due
> > >=20
> > >   mkdir() being called twice for creating the test directory for the =
9p
> > >   'local' tests.
> > >=20
> > > * Tests: Third patch fixes a memory leak.
> > >=20
> > > * Tests: The remaining two patches are code cleanup.
> > >=20
> > > ----------------------------------------------------------------
> >=20
> > Hi; this fails CI for the build-oss-fuzz job, which finds
> > a heap-buffer-overflow:
> > https://gitlab.com/qemu-project/qemu/-/jobs/2087610013
>=20
> So this is about the 'dirent' patch:
> https://github.com/cschoenebeck/qemu/commit/de19c79dad6a2cad54ae04ce754d4=
7c07bf9bc93
>=20
> In conjunction with the 9p fuzzing tests:
> https://wiki.qemu.org/Documentation/9p#Fuzzing
>=20
> I first thought it might be a false positive due to the unorthodox handli=
ng of
> dirent duplication by that patch, but from the ASan output below I am not
> really sure about that.
>=20

No, this is an actual bug. See below.

> Is there a way to get the content of local variables?
>=20
> Would it be possible that the following issue (g_memdup vs. g_memdup2) mi=
ght
> apply here?
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2=
-now/5538
>=20
> Best regards,
> Christian Schoenebeck
>=20
> >=20
> > 8/152 qemu:qtest+qtest-i386 / qtest-i386/qos-test ERROR 66.74s killed
> > by signal 6 SIGABRT
> >=20
> > >>> QTEST_QEMU_BINARY=3D./qemu-system-i386
> > >>> QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-da=
emon
> > >>> MALLOC_PERTURB_=3D120
> > >>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-d=
aemon.
> > >>> sh QTEST_QEMU_IMG=3D./qemu-img
> > >>> /builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test --tap=
 -k
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 Listing only the last 100 lines fro=
m
> > a long log.
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7270=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7270=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7ffc79fb0000; bottom 0x7ff908ffd000; size:
> > 0x000370fb3000 (14780411904)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7276=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7276=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7fff7e4a8000; bottom 0x7fd6363fd000; size:
> > 0x0029480ab000 (177302319104)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7282=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7282=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7ffee6e7f000; bottom 0x7f32fb5fd000; size:
> > 0x00cbeb882000 (875829927936)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7288=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7288=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7ffc6118e000; bottom 0x7f6391cfd000; size:
> > 0x0098cf491000 (656312700928)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7294=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7294=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7ffef665d000; bottom 0x7f69dc8fd000; size:
> > 0x009519d60000 (640383582208)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7300=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7300=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7ffe33db0000; bottom 0x7f01421fd000; size:
> > 0x00fcf1bb3000 (1086387335168)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D7306=3D=3DWARNING: ASan doesn't fully support makecontext/swapcon=
text
> > functions and may produce false positives in some cases!
> > =3D=3D7306=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_re=
turn:
> > stack type: default top: 0x7ffebd618000; bottom 0x7ff1179fd000; size:
> > 0x000da5c1b000 (58615508992)
> > False positive error reports may follow
> > For details see https://github.com/google/sanitizers/issues/189
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D7306=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s
> > 0x612000030768 at pc 0x562351066c74 bp 0x7ff1078c3a90 sp
> > 0x7ff1078c3240
> > READ of size 48830 at 0x612000030768 thread T4

The size looks pretty big to me. Test file paths in virtio-9p-test are
only a couple of bytes long...

> > #0 0x562351066c73 in __interceptor_memcpy.part.0 asan_interceptors.cpp.=
o
> > #1 0x7ff1290d443f in g_memdup (/lib64/libglib-2.0.so.0+0x6e43f)
> > #2 0x56235134537a in do_readdir_many
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:146:19
> > #3 0x56235134537a in v9fs_co_readdir_many
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:225:5
> > #4 0x56235132d626 in v9fs_do_readdir
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2430:13
> > #5 0x56235132d626 in v9fs_readdir
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2543:13
> > #6 0x56235257101e in coroutine_trampoline
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c:1=
73:9
> > #7 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
> > 0x612000030768 is located 0 bytes to the right of 296-byte region
> > [0x612000030640,0x612000030768)
> > allocated by thread T4 here:
> > #0 0x5623510a4e47 in malloc
> > (/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x1146e47)
> > #1 0x7ff1290c03d8 in g_malloc (/lib64/libglib-2.0.so.0+0x5a3d8)

i.e.

    synth_open =3D g_malloc(sizeof(*synth_open));

and we have:

typedef struct V9fsSynthOpenState {
    off_t offset;
    V9fsSynthNode *node;
    struct dirent dent;
} V9fsSynthOpenState;

It looks like that qemu_dirent_dup() ends up using an
uninitialized dent->d_reclen.

The synth backend should be fixed to honor d_reclen, or
at least to allocate with g_new0().

Cheers,

--
Greg

> > #2 0x56235131e659 in synth_opendir
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p-synth.c:185:18
> > #3 0x5623513462f5 in v9fs_co_opendir
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:321:5
> > #4 0x5623513257d7 in v9fs_open
> > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:1959:15
> > #5 0x56235257101e in coroutine_trampoline
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c:1=
73:9
> > #6 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
> > Thread T4 created by T0 here:
> > #0 0x562351015926 in pthread_create
> > (/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x10b7926)
> > #1 0x5623525351ea in qemu_thread_create
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/qemu-thread-posix.c:59=
6:11
> > #2 0x5623525a4588 in do_spawn_thread
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:134:5
> > #3 0x5623525a4588 in spawn_thread_bh_fn
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:142:5
> > #4 0x562352569814 in aio_bh_call
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:141:5
> > #5 0x562352569814 in aio_bh_poll
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:169:13
> > #6 0x5623525248cc in aio_dispatch
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/aio-posix.c:415:5
> > #7 0x56235256c34c in aio_ctx_dispatch
> > /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:311:5
> > #8 0x7ff1290bb05e in g_main_context_dispatch
> > (/lib64/libglib-2.0.so.0+0x5505e) SUMMARY: AddressSanitizer:
> > heap-buffer-overflow
> > asan_interceptors.cpp.o in __interceptor_memcpy.part.0
> > Shadow bytes around the buggy address:
> > 0x0c247fffe090: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
> > 0x0c247fffe0a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> > 0x0c247fffe0b0: fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa fa
> > 0x0c247fffe0c0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
> > 0x0c247fffe0d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > =3D>0x0c247fffe0e0: 00 00 00 00 00 00 00 00 00 00 00 00 00[fa]fa fa
> > 0x0c247fffe0f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > 0x0c247fffe100: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > 0x0c247fffe110: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > 0x0c247fffe120: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > 0x0c247fffe130: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > Shadow byte legend (one shadow byte represents 8 application bytes):
> > Addressable: 00
> > Partially addressable: 01 02 03 04 05 06 07
> > Heap left redzone: fa
> > Freed heap region: fd
> > Stack left redzone: f1
> > Stack mid redzone: f2
> > Stack right redzone: f3
> > Stack after return: f5
> > Stack use after scope: f8
> > Global redzone: f9
> > Global init order: f6
> > Poisoned by user: f7
> > Container overflow: fc
> > Array cookie: ac
> > Intra object redzone: bb
> > ASan internal: fe
> > Left alloca redzone: ca
> > Right alloca redzone: cb
> > =3D=3D7306=3D=3DABORTING
> >=20
> >=20
> > thanks
> > -- PMM
>=20
>=20


