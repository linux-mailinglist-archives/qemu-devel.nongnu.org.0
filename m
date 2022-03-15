Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3734D9D5E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:22:14 +0100 (CET)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU83x-0003Cx-MN
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:22:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7zM-0007fO-R6
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7zK-0005xH-CW
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OF9Yb3w60WengjDkWa7Ut+IWr9HuNrA2+Qowu1Usvjk=;
 b=VpQWMwstesdYK6J1V6B/Fmi5E/ZMq5xlrGZv+dr9Pm6xTcSh7wcENw2hHlhiDoP4tGya+4
 kLGcpHb3KZAo1JaVxdmV6s6C2GbZCttHjPykwL46ijfVTwgDa17oUumMrPW6ht2s980SPG
 /GFerPpViV3wml253f+xj1uywNzbriM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-U7wX269aPXq4cO4lYruW4A-1; Tue, 15 Mar 2022 10:17:22 -0400
X-MC-Unique: U7wX269aPXq4cO4lYruW4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05721185A79C;
 Tue, 15 Mar 2022 14:17:22 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC5C6C33264;
 Tue, 15 Mar 2022 14:17:21 +0000 (UTC)
Date: Tue, 15 Mar 2022 14:17:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Tom Tromey <tom@tromey.com>
Subject: Re: How to backtrace an separate stack?
Message-ID: <YjCf8BPW+jITJain@stefanha-x1.localdomain>
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87mti11yy9.fsf@tromey.com> <87r174gtuv.fsf@tromey.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eK5eZ5fY7+SvEjCs"
Content-Disposition: inline
In-Reply-To: <87r174gtuv.fsf@tromey.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: gdb@sourceware.org, qemu-devel@nongnu.org, pedro@palves.net,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eK5eZ5fY7+SvEjCs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 02:30:16PM -0600, Tom Tromey wrote:
> Tom> IMO this is just a longstanding hole in GDB.  Green threads exist,
> Tom> so it would be good for GDB to have a way to inspect them.
>=20
> I took a stab at implementing this recently.  It's still very rough but
> it's good enough to discuss whether it's something I should try to
> polish.
>=20
> For testing the proof of concept, I used vireo, a simple user-space
> thread setup based on makecontext.
>=20
> https://github.com/geofft/vireo
>=20
> I've appended the Python code that teaches gdb how to find vireo
> threads.  It's incomplete, as in, if you re-'run', it will fail.
>=20
> Here's what a session looks like:
>=20
>     (gdb) cont
>     Continuing.
>     [New Vireo Thread 1]
>     [New Vireo Thread 2]
>     send 0 from 0 to 1
>=20
>     Thread 1 "pingpong" hit Breakpoint 2, pingpong () at examples/pingpon=
g.c:27
>     27			int i =3D vireo_recv(&who);
>     (gdb) info thread
>       Id   Target Id                                    Frame=20
>     * 1    Thread 0x7ffff7cb2b80 (LWP 42208) "pingpong" pingpong () at ex=
amples/pingpong.c:27
>       2    Vireo Thread 1 "pingpong"                    pingpong () at ex=
amples/pingpong.c:27
>       3    Vireo Thread 2 "pingpong"                    pingpong () at ex=
amples/pingpong.c:27
>     (gdb) thread 3
>     [Switching to thread 3 (Vireo Thread 2)]
>     #0  pingpong () at examples/pingpong.c:27
>     27			int i =3D vireo_recv(&who);
>     (gdb) bt
>     #0  pingpong () at examples/pingpong.c:27
>     #1  0x00007ffff7d329c0 in ?? () from /lib64/libc.so.6
>     #2  0x00007ffff7fc20e0 in ?? () from /home/tromey/gdb/vireo/examples/=
=2E./libvireo.so
>     #3  0x0000000000000000 in ?? ()
>=20
> I realize now, writing this, that the approach to underlying threads
> should be improved.  These need to be tracked more actively, so that
> breakpoint stops can report the corresponding green thread.  You can see
> above that this isn't done.  Also I think the "Frame" info is wrong
> right now.
>=20
> Anyway, the basic idea is to let Python tell gdb about the existence of
> green threads, and let gdb mostly treat them identically to OS threads.
> Under the hood, things like 'continue' will use the underlying OS
> thread.
>=20
> You can play with this if you want.  It's on 'submit/green-threads' on
> my github.  Be warned that I rebase a lot.

This looks cool! Would it be useful to see a port of QEMU's coroutine.py
script to your green threads API?

> Some things to work out:
>=20
> - Exactly how should the 'underlying thread' concept work?
>   Hooking into the inferior's scheduler seems slow, and also
>   like it could present a chicken/egg problem.
>   Maybe it needs a "green thread provider" object so that on
>   a stop we can query that to see if the green thread corresponding
>   to an OS thread is already known.

QEMU's coroutines aren't in a scheduler list so there is no way to
enumerate all coroutines. The Python script can register a GDB command
(e.g. "qemu coroutine 0x12345678") that makes GDB aware of the
coroutine.

The only automatic way of cleaning up coroutines that I can think of is
by placing a breakpoint on QEMU's internal coroutine deletion function
=66rom the Python script and then making GDB aware that the coroutine no
longer exists. It looks like this is the approach your vireo script
takes.

> - Do we need a special hook to stop unwinding per-green-thread.
>   You may not want to allow unwinding through the scheduler.

When we've used 'bt' on coroutine stacks in the past, reaching the end
of the stack wasn't a problem for the user. There is no error message
=66rom GDB.

>=20
> Tom
>=20
>=20
> import gdb
>=20
> thread_map =3D {}
>=20
> main_thread =3D None
>=20
> # From glibc/sysdeps/unix/sysv/linux/x86/sys/ucontext.h
> x8664_regs =3D [ 'r8', 'r9', 'r10', 'r11', 'r12', 'r13', 'r14',
>                'r15', 'rdi', 'rsi', 'rbp', 'rbx', 'rdx', 'rax',
>                'rcx', 'rsp', 'rip', 'efl', 'csgsfs', 'err',
>                'trapno', 'oldmask', 'cr2' ]
>=20
> def vireo_current():
>     return int(gdb.parse_and_eval('curenv')) + 1
>=20
> class VireoGreenThread:
>     def __init__(self, tid):
>         self.tid =3D tid
>=20
>     def _get_state(self):
>         return gdb.parse_and_eval('envs')[self.tid]['state']
>=20
>     def fetch(self, reg):
>         """Fetch REG from memory."""
>         global x8664_regs
>         global thread_map
>         thread =3D thread[self.tid]
>         state =3D self._get_state()
>         gregs =3D state['uc_mcontext']['gregs']
>         for i in range(0, len(x8664_regs)):
>             if reg is None or reg =3D=3D x8664_regs[i]:
>                 thread.write_register(x8664_regs[i], gregs[i])
>=20
>     def store(self, reg):
>         global x8664_regs
>         global thread_map
>         thread =3D thread[self.tid]
>         state =3D self._get_state()
>         gregs =3D state['uc_mcontext']['gregs']
>         for i in range(0, len(x8664_regs)):
>             if reg is None or reg =3D=3D x8664_regs[i]:
>                 gregs[i] =3D thread.read_register(x8664_regs[i])
>=20
>     def name(self):
>         return "Vireo Thread " + str(self.tid)
>=20
>     def underlying_thread(self):
>         if vireo_current() =3D=3D self.tid:
>             global main_thread
>             return main_thread
>         return None
>=20
> class VFinish(gdb.FinishBreakpoint):
>     def stop(self):
>         tid =3D int(self.return_value) + 1
>         global thread_map
>         thread_map[tid] =3D gdb.create_green_thread(tid, VireoGreenThread=
(tid))
>         return False
>=20
> class VCreate(gdb.Breakpoint):
>     def stop(self):
>         VFinish(gdb.newest_frame(), True)
>         return False
>=20
> class VExit(gdb.Breakpoint):
>     def stop(self):
>         global main_thread
>         if main_thread is None:
>             main_thread =3D gdb.selected_thread()
>         global thread_map
>         tid =3D vireo_current()
>         if tid in thread_map:
>             thread_map[tid].set_exited()
>             del thread_map[tid]
>=20
> VCreate('vireo_create', internal=3DTrue)
> VExit('vireo_exit', internal=3DTrue)
>=20

--eK5eZ5fY7+SvEjCs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwn/AACgkQnKSrs4Gr
c8jz2Af/dA42sZGPPp4PiZwiEmd92Lk5Mp1ehUtB8E4mZpfCzYqtgr0UiAEicbJ+
u+3BSRtoRs//+4fzcxgrS2wA5GWizU5SdDl33815KC2HlGWOqFz3OiOlq2GxUnav
jxAMZw94Wh/jT9+nvAsWkCzoHcGQlfpNVQXbPRU6yDcufeGDF3k9pX9C14NTX0w2
XKdRHuP7p2KTn99oxLfcAMHaZlCThQ+bu4bkQFuV8fRGJQVExfu4XZ5zxfhFAOgK
IpTRJU66TjuinSflP6ivD/Ifosm+QwvSC792NO0bOB37PVg+BcEe25J8QgCLvRza
RBJk+gqwBieGzLD2EBkLvOg1nYePug==
=TRkk
-----END PGP SIGNATURE-----

--eK5eZ5fY7+SvEjCs--


