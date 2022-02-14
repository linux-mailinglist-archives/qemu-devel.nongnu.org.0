Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E684B4F45
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:48:56 +0100 (CET)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZqh-0000r0-Im
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJZmq-0007fx-63
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:44:57 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJZmm-00039p-Ek
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=pn0E8PRDKOfjz518I0YD2nMJZA3azVJGNe6BxdUhMOg=; b=kccAmCUWa2wZRGre0u5DZ2mp7N
 59OI+mGPmCqPy6ZKi9eSdeJdkIG+0DfvR1ddvXSYzjEKj0hP6F0rizZDUjZlNci+EdP2sBqezTJVe
 eYGCUygqWWodYH/pWH6DGPK5wb+d7ZnaGJqi2j2ezzSF5uR+QtmBfLjI4QPj8NMUXRDblHNM5BPuJ
 ng8o2yTwIbbrzVi2lpB4L20GS+1r7gIVxYK8CscMJQyO7kkb7kVsfJii62kJKBioUriTwXpDOB9oM
 wUSIpQsfadKaP2shiBbNHItMKYZ5BY10siu3e4R0FB1a83ZVzO9e6aoh7h1GzebJF9jQ15auU47DN
 14GIz68P1C5KM1AK+E0uJUd+exrujg8zUAg4wgbG3GIZgTGmQTHgP6AcbNWdsSzPddrxyS17aCFFi
 ItBDsMimt1Owy480dqoXOGmnsxVJmIcmSsXxo1WswP7EZQSX5w9DeP83NNyTdJ6LgAPqHZUkJa+mH
 170/XezdVGhE/XFS6I8N4t0JjcWCUbZj4xcQkXv9qwJWzjwLrMrVO8aBDYyKGqXcDiConAGMTgCuC
 46jdqnhNFz/8fJ13VigQKuyBdcDx/ETK3sCts7v3b+VVIbxk8OdA0tRwnd4rkYdiIL4yTzsG0a03G
 0GiSZM0CCAwfY717yxdi/xx0q8O3BN0KGvJWq11hU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Vitaly Chikunov <vt@altlinux.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Date: Mon, 14 Feb 2022 12:44:48 +0100
Message-ID: <2442070.WHyy189egQ@silver>
In-Reply-To: <20220214113653.087a06e2@bahia>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <2037112.271zI61438@silver> <20220214113653.087a06e2@bahia>
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

On Montag, 14. Februar 2022 11:36:53 CET Greg Kurz wrote:
> On Mon, 14 Feb 2022 10:47:43 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Sonntag, 13. Februar 2022 21:33:10 CET Peter Maydell wrote:
> > > On Thu, 10 Feb 2022 at 11:33, Christian Schoenebeck
> > >=20
> > > <qemu_oss@crudebyte.com> wrote:
> > > > The following changes since commit=20
0a301624c2f4ced3331ffd5bce85b4274fe132af:
> > > >   Merge remote-tracking branch
> > > >   'remotes/pmaydell/tags/pull-target-arm-20220208' into staging
> > > >   (2022-02-08 11:40:08 +0000)>
> > > >=20
> > > > are available in the Git repository at:
> > > >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220210
> > > >=20
> > > > for you to fetch changes up to=20
de19c79dad6a2cad54ae04ce754d47c07bf9bc93:
> > > >   9pfs: Fix segfault in do_readdir_many caused by struct dirent
> > > >   overread
> > > >   (2022-02-10 11:56:01 +0100)>
> > > >=20
> > > > ----------------------------------------------------------------9d8=
2f6
> > > > a3e68c2 9pfs: fixes and cleanup
> > > >=20
> > > > * Fifth patch fixes a 9pfs server crash that happened on some syste=
ms
> > > > due
> > > >=20
> > > >   to incorrect (system dependant) handling of struct dirent size.
> > > >=20
> > > > * Tests: Second patch fixes a test error that happened on some syst=
ems
> > > > due
> > > >=20
> > > >   mkdir() being called twice for creating the test directory for the
> > > >   9p
> > > >   'local' tests.
> > > >=20
> > > > * Tests: Third patch fixes a memory leak.
> > > >=20
> > > > * Tests: The remaining two patches are code cleanup.
> > > >=20
> > > > ----------------------------------------------------------------
> > >=20
> > > Hi; this fails CI for the build-oss-fuzz job, which finds
> > > a heap-buffer-overflow:
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2087610013
> >=20
> > So this is about the 'dirent' patch:
> > https://github.com/cschoenebeck/qemu/commit/de19c79dad6a2cad54ae04ce754=
d47
> > c07bf9bc93
> >=20
> > In conjunction with the 9p fuzzing tests:
> > https://wiki.qemu.org/Documentation/9p#Fuzzing
> >=20
> > I first thought it might be a false positive due to the unorthodox
> > handling of dirent duplication by that patch, but from the ASan output
> > below I am not really sure about that.
>=20
> No, this is an actual bug. See below.

Yep, the patch would turn the 9p tests' synth driver buggy. :/ Vitaly, I fe=
ar=20
the patch needs a v5.

> > Is there a way to get the content of local variables?
> >=20
> > Would it be possible that the following issue (g_memdup vs. g_memdup2)
> > might apply here?
> > https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdu=
p2-> > now/5538
> >=20
> > Best regards,
> > Christian Schoenebeck
> >=20
> > > 8/152 qemu:qtest+qtest-i386 / qtest-i386/qos-test ERROR 66.74s killed
> > > by signal 6 SIGABRT
> > >=20
> > > >>> QTEST_QEMU_BINARY=3D./qemu-system-i386
> > > >>> QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-=
daemo
> > > >>> n
> > > >>> MALLOC_PERTURB_=3D120
> > > >>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate=
=2Ddaem
> > > >>> on.
> > > >>> sh QTEST_QEMU_IMG=3D./qemu-img
> > > >>> /builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test --t=
ap
> > > >>> -k
> > >=20
> > > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80
> > > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 Listing only the last 100 lines
> > > from
> > > a long log.
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7270=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7270=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7ffc79fb0000; bottom 0x7ff908ffd000; size:
> > > 0x000370fb3000 (14780411904)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7276=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7276=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7fff7e4a8000; bottom 0x7fd6363fd000; size:
> > > 0x0029480ab000 (177302319104)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7282=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7282=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7ffee6e7f000; bottom 0x7f32fb5fd000; size:
> > > 0x00cbeb882000 (875829927936)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7288=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7288=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7ffc6118e000; bottom 0x7f6391cfd000; size:
> > > 0x0098cf491000 (656312700928)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7294=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7294=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7ffef665d000; bottom 0x7f69dc8fd000; size:
> > > 0x009519d60000 (640383582208)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7300=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7300=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7ffe33db0000; bottom 0x7f01421fd000; size:
> > > 0x00fcf1bb3000 (1086387335168)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D7306=3D=3DWARNING: ASan doesn't fully support makecontext/swapc=
ontext
> > > functions and may produce false positives in some cases!
> > > =3D=3D7306=3D=3DWARNING: ASan is ignoring requested __asan_handle_no_=
return:
> > > stack type: default top: 0x7ffebd618000; bottom 0x7ff1179fd000; size:
> > > 0x000da5c1b000 (58615508992)
> > > False positive error reports may follow
> > > For details see https://github.com/google/sanitizers/issues/189
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D7306=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addr=
ess
> > > 0x612000030768 at pc 0x562351066c74 bp 0x7ff1078c3a90 sp
> > > 0x7ff1078c3240
> > > READ of size 48830 at 0x612000030768 thread T4
>=20
> The size looks pretty big to me. Test file paths in virtio-9p-test are
> only a couple of bytes long...

Right.

> > > #0 0x562351066c73 in __interceptor_memcpy.part.0 asan_interceptors.cp=
p.o
> > > #1 0x7ff1290d443f in g_memdup (/lib64/libglib-2.0.so.0+0x6e43f)
> > > #2 0x56235134537a in do_readdir_many
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:146:19
> > > #3 0x56235134537a in v9fs_co_readdir_many
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:225:5
> > > #4 0x56235132d626 in v9fs_do_readdir
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2430:13
> > > #5 0x56235132d626 in v9fs_readdir
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:2543:13
> > > #6 0x56235257101e in coroutine_trampoline
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c=
:17
> > > 3:9
> > > #7 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
> > > 0x612000030768 is located 0 bytes to the right of 296-byte region
> > > [0x612000030640,0x612000030768)
> > > allocated by thread T4 here:
> > > #0 0x5623510a4e47 in malloc
> > > (/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x1146e47)
> > > #1 0x7ff1290c03d8 in g_malloc (/lib64/libglib-2.0.so.0+0x5a3d8)
>=20
> i.e.
>=20
>     synth_open =3D g_malloc(sizeof(*synth_open));
>=20
> and we have:
>=20
> typedef struct V9fsSynthOpenState {
>     off_t offset;
>     V9fsSynthNode *node;
>     struct dirent dent;
> } V9fsSynthOpenState;
>=20
> It looks like that qemu_dirent_dup() ends up using an
> uninitialized dent->d_reclen.
>=20
> The synth backend should be fixed to honor d_reclen, or
> at least to allocate with g_new0().

Yes, I overlooked that this is not initialized with zero already.

With g_new0() d_reclen would be zero and qemu_dirent_dup() would then fallb=
ack=20
to the portable branch (as I assumed it already would):

struct dirent *
qemu_dirent_dup(struct dirent *dent)
{
    size_t sz =3D 0;
#if defined _DIRENT_HAVE_D_RECLEN
    /* Avoid use of strlen() if platform supports d_reclen. */
    sz =3D dent->d_reclen;
#endif
    /*
     * Test sz for zero even if d_reclen is available
     * because some drivers may set d_reclen to zero.
     */
    if (sz =3D=3D 0) {
        /* Fallback to the most portable way. */
        sz =3D offsetof(struct dirent, d_name) +
                      strlen(dent->d_name) + 1;
    }
    return g_memdup(dent, sz);
}

Additionally I would add NAME_MAX to the V9fsSynthOpenState allocation size=
,=20
because it is known that some systems define dirent as flex-array (zero d_n=
ame=20
size).

I know Greg would not favour this solution (using g_new0), but it's the mos=
t=20
minimalistic and most portable solution. So I would favour it for now.

A cleaner solution on the long-term would be turning V9fsSynthOpenState's=20
'dent' member into a pointer and adding a new function to osdep like:

struct dirent *
qemu_dirent_new(const char* name) {
    ...
}

But I would like to postpone that qemu_dirent_new() solution, e.g. because =
I=20
guess some people would probably not like qemu_dirent_new() to have in osde=
p,=20
as it is probably not a general purpose function, and I am not keen putting=
=20
qemu_dirent_new() into a different location than qemu_dirent_dup(), because=
 it=20
would raise the danger that system dependent code might deviate in future.

Best regards,
Christian Schoenebeck

>=20
> Cheers,
>=20
> --
> Greg
>=20
> > > #2 0x56235131e659 in synth_opendir
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p-synth.c:185:18
> > > #3 0x5623513462f5 in v9fs_co_opendir
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/codir.c:321:5
> > > #4 0x5623513257d7 in v9fs_open
> > > /builds/qemu-project/qemu/build-oss-fuzz/../hw/9pfs/9p.c:1959:15
> > > #5 0x56235257101e in coroutine_trampoline
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/coroutine-ucontext.c=
:17
> > > 3:9
> > > #6 0x7ff126e0e84f (/lib64/libc.so.6+0x5784f)
> > > Thread T4 created by T0 here:
> > > #0 0x562351015926 in pthread_create
> > > (/builds/qemu-project/qemu/build-oss-fuzz/qemu-system-i386+0x10b7926)
> > > #1 0x5623525351ea in qemu_thread_create
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/qemu-thread-posix.c:=
596
> > > :11
> > > #2 0x5623525a4588 in do_spawn_thread
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:134:5
> > > #3 0x5623525a4588 in spawn_thread_bh_fn
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/thread-pool.c:142:5
> > > #4 0x562352569814 in aio_bh_call
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:141:5
> > > #5 0x562352569814 in aio_bh_poll
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:169:13
> > > #6 0x5623525248cc in aio_dispatch
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/aio-posix.c:415:5
> > > #7 0x56235256c34c in aio_ctx_dispatch
> > > /builds/qemu-project/qemu/build-oss-fuzz/../util/async.c:311:5
> > > #8 0x7ff1290bb05e in g_main_context_dispatch
> > > (/lib64/libglib-2.0.so.0+0x5505e) SUMMARY: AddressSanitizer:
> > > heap-buffer-overflow
> > > asan_interceptors.cpp.o in __interceptor_memcpy.part.0
> > > Shadow bytes around the buggy address:
> > > 0x0c247fffe090: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
> > > 0x0c247fffe0a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> > > 0x0c247fffe0b0: fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa fa
> > > 0x0c247fffe0c0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
> > > 0x0c247fffe0d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > =3D>0x0c247fffe0e0: 00 00 00 00 00 00 00 00 00 00 00 00 00[fa]fa fa
> > > 0x0c247fffe0f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > > 0x0c247fffe100: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > > 0x0c247fffe110: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > > 0x0c247fffe120: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > > 0x0c247fffe130: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > > Shadow byte legend (one shadow byte represents 8 application bytes):
> > > Addressable: 00
> > > Partially addressable: 01 02 03 04 05 06 07
> > > Heap left redzone: fa
> > > Freed heap region: fd
> > > Stack left redzone: f1
> > > Stack mid redzone: f2
> > > Stack right redzone: f3
> > > Stack after return: f5
> > > Stack use after scope: f8
> > > Global redzone: f9
> > > Global init order: f6
> > > Poisoned by user: f7
> > > Container overflow: fc
> > > Array cookie: ac
> > > Intra object redzone: bb
> > > ASan internal: fe
> > > Left alloca redzone: ca
> > > Right alloca redzone: cb
> > > =3D=3D7306=3D=3DABORTING
> > >=20
> > >=20
> > > thanks
> > > -- PMM



