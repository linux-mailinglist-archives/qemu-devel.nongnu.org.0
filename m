Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E74D13D0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:50:54 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWUX-0004d4-LW
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWRa-0003vX-Rj
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWRX-0004Vb-OR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646732861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=haqJwB1NHn5392uiBkabn0mkcmMXkfpVq9rP0OOGGhk=;
 b=Qc8M6uZXZPVHHDwuDMB/aV0cn+dRBPRCEZThb4WLFjvsss3vQqxBY+dskDlxmIA0Lya8fp
 Xw0NeXDAHfKlOuMiamkqw9zH8LF+xN/xQghdj5K0Bhhn+nU07zO3xxCrBcI0KXeU08ag+O
 ydu81n8lOIkfnPxLQtRri0KlTv+x+OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-Dow6mmVWNaajruGABS2NXg-1; Tue, 08 Mar 2022 04:47:36 -0500
X-MC-Unique: Dow6mmVWNaajruGABS2NXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66CF1006AA6;
 Tue,  8 Mar 2022 09:47:34 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB6BD105501B;
 Tue,  8 Mar 2022 09:47:32 +0000 (UTC)
Date: Tue, 8 Mar 2022 09:47:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Pedro Alves <pedro@palves.net>
Subject: Re: How to backtrace an separate stack?
Message-ID: <YicmM0VLPDeMcEh4@stefanha-x1.localdomain>
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <bb91b504-aa47-49fe-9382-2b366449293f@palves.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2NfJ9RPELN7eYHHj"
Content-Disposition: inline
In-Reply-To: <bb91b504-aa47-49fe-9382-2b366449293f@palves.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: gdb@sourceware.org, tom@tromey.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2NfJ9RPELN7eYHHj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 10:49:47AM +0000, Pedro Alves wrote:
> On 2022-03-03 11:22, Stefan Hajnoczi wrote:
> > Hi,
> > The QEMU emulator uses coroutines with separate stacks. It can be
> > challenging to debug coroutines that have yielded because GDB is not
> > aware of them (no thread is currently executing them).
> >=20
> > QEMU has a GDB Python script that helps. It "creates" a stack frame for
> > a given coroutine by temporarily setting register values and then using
> > the "bt" command. This works on a live process under ptrace control but
> > not for coredumps where registers can't be set.
> >=20
> > Here is the script (or see the bottom of this email for an inline copy
> > of the relevant code):
> > https://gitlab.com/qemu-project/qemu/-/blob/master/scripts/qemugdb/coro=
utine.py
> >=20
> > I hoped that "select-frame address ADDRESS" could be used instead so
> > this would work on coredumps too. Unfortunately "select-frame" only
> > searches stack frames that GDB is already aware of, so it cannot be used
> > to backtrace coroutine stacks.
> >=20
> > Is there a way to backtrace a stack at an arbitrary address in GDB?
>=20
> I don't think there's an easy/great answer.  Maybe it could
> be done with a Python unwinder [1]?  See gdb.python/py-unwind-user-regs.py
> in the GDB testsuite for an example you could probably start with.

I tried writing an unwinder that returns the topmost coroutine stack
frame. "info threads" + "bt" shows the main stack though:

  (gdb) qemu coroutine 0x55be3c592120
    Id   Target Id                         Frame
  * 1    Thread 0x7f7abbdd4f00 (LWP 58989) Returning a frame with rip 0x55b=
e3ae19ff4
  0x00007f7abcd2489e in __ppoll (fds=3D0x21, nfds=3D6717500806073509987, ti=
meout=3D<optimized out>, sigmask=3D0x1f000) at ../sysdeps/unix/sysv/linux/p=
poll.c:43
  ...
  #0  0x00007f7abcd2489e in __ppoll (fds=3D0x55be3c78a9f0, nfds=3D43, timeo=
ut=3D<optimized out>, timeout@entry=3D0x7ffef27cc040, sigmask=3Dsigmask@ent=
ry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:43
  #1  0x000055be3ae26435 in ppoll (__ss=3D0x0, __timeout=3D0x7ffef27cc040, =
__nfds=3D<optimized out>, __fds=3D<optimized out>) at /usr/include/bits/pol=
l2.h:81

I was hoping that frame #1 would be the coroutine stack since the debug
message "Returning a frame with rip 0x55be3ae19ff4" shows the unwinder
was invoked.

I've included the code below in case anyone has suggestions for making
the unwinder work. See bt_jmpbuf() and the Unwinder class.

The idea is that bt_jmpbuf() passes the registers of the coroutine to
the unwinder and invokes "info thread" + "bt". The unwinder only returns
a stack frame the first time it's invoked. It cannot unwind successive
stack frames so it disables itself after returning the topmost one (I
was hoping GDB's built-in unwinder would take over from there).

Thanks,
Stefan
---
#
# GDB debugging support
#
# Copyright 2012 Red Hat, Inc. and/or its affiliates
#
# Authors:
#  Avi Kivity <avi@redhat.com>
#
# This work is licensed under the terms of the GNU GPL, version 2
# or later.  See the COPYING file in the top-level directory.

import gdb
import gdb.unwinder

VOID_PTR =3D gdb.lookup_type('void').pointer()


class FrameId(object):
    def __init__(self, sp, pc):
        self.sp =3D sp
        self.pc =3D pc


class Unwinder(gdb.unwinder.Unwinder):
    def __init__(self):
        super(Unwinder, self).__init__('QEMU coroutine unwinder')
        self._regs =3D None

    def arm(self, regs):
        self._regs =3D regs

    def __call__(self, pending_frame):
        print('A')
        if not self._regs:
            return None
        regs =3D self._regs
        self._regs =3D None

        frame_id =3D FrameId(regs['rbp'], regs['rip'])
        unwind_info =3D pending_frame.create_unwind_info(frame_id)
        for reg_name in regs:
            unwind_info.add_saved_register(reg_name, regs[reg_name])

        print('Returning a frame with rip 0x%x' % regs['rip'])
        return unwind_info


unwinder =3D Unwinder()
gdb.unwinder.register_unwinder(None, unwinder)


def pthread_self():
    '''Fetch pthread_self() from the glibc start_thread function.'''
    f =3D gdb.newest_frame()
    while f.name() !=3D 'start_thread':
        f =3D f.older()
        if f is None:
            return gdb.parse_and_eval('$fs_base')

    try:
        return f.read_var("arg")
    except ValueError:
        return gdb.parse_and_eval('$fs_base')

def get_glibc_pointer_guard():
    '''Fetch glibc pointer guard value'''
    fs_base =3D pthread_self()
    return gdb.parse_and_eval('*(uint64_t*)((uint64_t)%s + 0x30)' % fs_base)

def glibc_ptr_demangle(val, pointer_guard):
    '''Undo effect of glibc's PTR_MANGLE()'''
    return gdb.parse_and_eval('(((uint64_t)%s >> 0x11) | ((uint64_t)%s << (=
64 - 0x11))) ^ (uint64_t)%s' % (val, val, pointer_guard))

def get_jmpbuf_regs(jmpbuf):
    JB_RBX  =3D 0
    JB_RBP  =3D 1
    JB_R12  =3D 2
    JB_R13  =3D 3
    JB_R14  =3D 4
    JB_R15  =3D 5
    JB_RSP  =3D 6
    JB_PC   =3D 7

    pointer_guard =3D get_glibc_pointer_guard()
    return {'rbx': jmpbuf[JB_RBX],
        'rbp': glibc_ptr_demangle(jmpbuf[JB_RBP], pointer_guard),
        'rsp': glibc_ptr_demangle(jmpbuf[JB_RSP], pointer_guard),
        'r12': jmpbuf[JB_R12],
        'r13': jmpbuf[JB_R13],
        'r14': jmpbuf[JB_R14],
        'r15': jmpbuf[JB_R15],
        'rip': glibc_ptr_demangle(jmpbuf[JB_PC], pointer_guard) }

def bt_jmpbuf(jmpbuf):
    '''Backtrace a jmpbuf'''
    regs =3D get_jmpbuf_regs(jmpbuf)
    unwinder.arm(regs)
    gdb.execute('info threads')
    gdb.execute('bt')

def co_cast(co):
    return co.cast(gdb.lookup_type('CoroutineUContext').pointer())

def coroutine_to_jmpbuf(co):
    coroutine_pointer =3D co_cast(co)
    return coroutine_pointer['env']['__jmpbuf']


class CoroutineCommand(gdb.Command):
    '''Display coroutine backtrace'''
    def __init__(self):
        gdb.Command.__init__(self, 'qemu coroutine', gdb.COMMAND_DATA,
                             gdb.COMPLETE_NONE)

    def invoke(self, arg, from_tty):
        argv =3D gdb.string_to_argv(arg)
        if len(argv) !=3D 1:
            gdb.write('usage: qemu coroutine <coroutine-pointer>\n')
            return

        bt_jmpbuf(coroutine_to_jmpbuf(gdb.parse_and_eval(argv[0])))

class CoroutineBt(gdb.Command):
    '''Display backtrace including coroutine switches'''
    def __init__(self):
        gdb.Command.__init__(self, 'qemu bt', gdb.COMMAND_STACK,
                             gdb.COMPLETE_NONE)

    def invoke(self, arg, from_tty):

        gdb.execute("bt")

        if gdb.parse_and_eval("qemu_in_coroutine()") =3D=3D False:
            return

        co_ptr =3D gdb.parse_and_eval("qemu_coroutine_self()")

        while True:
            co =3D co_cast(co_ptr)
            co_ptr =3D co["base"]["caller"]
            if co_ptr =3D=3D 0:
                break
            gdb.write("Coroutine at " + str(co_ptr) + ":\n")
            bt_jmpbuf(coroutine_to_jmpbuf(co_ptr))

class CoroutineSPFunction(gdb.Function):
    def __init__(self):
        gdb.Function.__init__(self, 'qemu_coroutine_sp')

    def invoke(self, addr):
        return get_jmpbuf_regs(coroutine_to_jmpbuf(addr))['rsp'].cast(VOID_=
PTR)

class CoroutinePCFunction(gdb.Function):
    def __init__(self):
        gdb.Function.__init__(self, 'qemu_coroutine_pc')

    def invoke(self, addr):
        return get_jmpbuf_regs(coroutine_to_jmpbuf(addr))['rip'].cast(VOID_=
PTR)

--2NfJ9RPELN7eYHHj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInJjMACgkQnKSrs4Gr
c8jrIgf/d1pveywN0bHZbt5/48oLWydjsZyXcy1SDY8RLl6jDG42jx0vWOEioJeA
sTCSCP7SmDNE9PdpGJ1jFnd7d5cLEb1XL0eRl+8dzCsJtgOcw8ePbiMhxKxiqPWK
hmv53639uDcInoK5Jb235z1IRmX+3v/UcZgeniGDDac2/+H311HPCXEjkEr95Vbg
kXgNyTkXO72wNK1GgFAbk1tipRYn39XGUUAyZGfnr8XVhvsq07t/J2c0PjE7Awef
keqi9pP+xEgESlwtv3iA8dJUBNDZQLhfw/Fmz0y+GBO2rv/zWaQZVxCjWlnHn1/G
2Jm1Ynbj29Dqs+BVFJkLUZDRCwgx4w==
=f0um
-----END PGP SIGNATURE-----

--2NfJ9RPELN7eYHHj--


