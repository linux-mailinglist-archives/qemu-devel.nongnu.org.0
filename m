Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11095387A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:47:44 +0200 (CEST)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj04V-0004vp-3c
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lizxH-0003tZ-VG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lizxE-0005pf-76
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621345208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p88JZC0M2xMsBQrZDFipg3n0aiARTrP5g+aA9GOA4NU=;
 b=Hl72y0Q+irtvQD0EEuapYjfeb4NXwVtxiNJ6oF4hNLIkT/WYglJ6dc5wI3B1uSJuzP39xs
 xs3jAnXxJIgs7PnXxq3AYm4ZnV3N0zJJdZCLnU+emuUoGxxW/a+UCIeyA8wjNWmquo5cj2
 zswtkhldupHXzDHbQ6A40DTPGhGWsWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-CD9a0CBBOpGB-zqcP-_wmQ-1; Tue, 18 May 2021 09:40:07 -0400
X-MC-Unique: CD9a0CBBOpGB-zqcP-_wmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48815814703;
 Tue, 18 May 2021 13:39:48 +0000 (UTC)
Received: from localhost (ovpn-115-196.ams2.redhat.com [10.36.115.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5C752CC01;
 Tue, 18 May 2021 13:39:47 +0000 (UTC)
Date: Tue, 18 May 2021 14:39:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V3 00/22] Live Update
Message-ID: <YKPDotJVB/82SDaU@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKJWO6sGIFuzpdkZ@stefanha-x1.localdomain>
 <20210517131001.792593f0.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517131001.792593f0.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ro1V6yWHigp0ywQe"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Steven Sistare <steven.sistare@oracle.com>, vfio-users@redhat.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Ro1V6yWHigp0ywQe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 01:10:01PM -0600, Alex Williamson wrote:
> On Mon, 17 May 2021 12:40:43 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Fri, May 14, 2021 at 11:15:18AM -0400, Steven Sistare wrote:
> > > On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote: =20
> > > > On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote: =20
> > > >> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote: =20
> > > >>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote: =
=20
> > > >>>> Provide the cprsave and cprload commands for live update.  These=
 save and
> > > >>>> restore VM state, with minimal guest pause time, so that qemu ma=
y be updated
> > > >>>> to a new version in between.
> > > >>>>
> > > >>>> cprsave stops the VM and saves vmstate to an ordinary file.  It =
supports two
> > > >>>> modes: restart and reboot.  For restart, cprsave exec's the qemu=
 binary (or
> > > >>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu resta=
rts in a
> > > >>>> paused state and waits for the cprload command. =20
> > > >>>
> > > >>> I think cprsave/cprload could be generalized by using QMP to stas=
h the
> > > >>> file descriptors. The 'getfd' QMP command already exists and QEMU=
 code
> > > >>> already opens fds passed using this mechanism.
> > > >>>
> > > >>> I haven't checked but it may be possible to drop some patches by =
reusing
> > > >>> QEMU's monitor file descriptor passing since the code already kno=
ws how
> > > >>> to open from 'getfd' fds.
> > > >>>
> > > >>> The reason why using QMP is interesting is because it eliminates =
the
> > > >>> need for execve(2). QEMU may be unable to execute a program due t=
o
> > > >>> chroot, seccomp, etc.
> > > >>>
> > > >>> QMP would enable cprsave/cprload to work both with and without
> > > >>> execve(2).
> > > >>>
> > > >>> One tricky thing with this approach might be startup ordering: ho=
w to
> > > >>> get fds via the QMP monitor in the new process before processing =
the
> > > >>> entire command-line. =20
> > > >>
> > > >> Early on I experimented with a similar approach.  Old qemu passed =
descriptors to an
> > > >> escrow process and exited; new qemu started and retrieved the desc=
riptors from escrow.
> > > >> vfio mostly worked after I hacked the kernel to suppress the origi=
nal-pid owner check.
> > > >> I suspect my recent vfio extensions would smooth the rough edges. =
=20
> > > >=20
> > > > I wonder about the reason for VFIO's pid limitation, maybe because =
it
> > > > pins pages from the original process? =20
> > >=20
> > > The dma unmap code verifies that the requesting task is the same as t=
he task that mapped
> > > the pages.  We could add an ioctl that passes ownership to a new task=
.  We would also need
> > > to fix locked memory accounting, which is associated with the mm of t=
he original task.
> > >  =20
> > > > Is this VFIO pid limitation the main reason why you chose to make Q=
EMU
> > > > execve(2) the new binary? =20
> > >=20
> > > That is one.  Plus, re-attaching to named shared memory for pc.ram ca=
uses the vfio conflict
> > > errors I mentioned in the previous email.  We would need to suppress =
redundant dma map calls,
> > > but allow legitimate dma maps and unmaps in response to the ongoing a=
ddress space changes and
> > > diff callbacks caused by some drivers. It would be messy and fragile.=
 In general, it felt like=20
> > > I was working against vfio rather than with it.
> > >=20
> > > Another big reason is a requirement to preserve anonymous memory for =
legacy qemu updates (via
> > > code injection which I briefly mentioned in KVM forum).  If we extend=
 cpr to allow updates=20
> > > without exec, I still need the exec option.
> > >  =20
> > > >> However, the main issue is that guest ram must be backed by named =
shared memory, and
> > > >> we would need to add code to support shared memory for all the sec=
ondary memory objects.
> > > >> That makes it less interesting for us at this time; we care about =
updating legacy qemu=20
> > > >> instances with anonymous guest memory. =20
> > > >=20
> > > > Thanks for explaining this more in the other sub-thread. The second=
ary
> > > > memory objects you mentioned are relatively small so I don't think
> > > > saving them in the traditional way is a problem.
> > > >=20
> > > > Two approaches for zero-copy memory migration fit into QEMU's exist=
ing
> > > > migration infrastructure:
> > > >=20
> > > > - Marking RAM blocks that are backed by named memory (tmpfs, hugetl=
bfs,
> > > >   etc) so they are not saved into the savevm file. The existing --o=
bject
> > > >   memory-backend-file syntax can be used.
> > > >=20
> > > > - Extending the live migration protocol to detect when file descrip=
tor
> > > >   passing is available (i.e. UNIX domain socket migration) and usin=
g
> > > >   that for memory-backend-* objects that have fds.
> > > >=20
> > > > Either of these approaches would handle RAM with existing savevm/mi=
grate
> > > > commands. =20
> > >=20
> > > Yes, but the vfio issues would still need to be solved, and we would =
need new
> > > command line options to back existing and future secondary memory obj=
ects with=20
> > > named shared memory.
> > >  =20
> > > > The remaining issue is how to migrate VFIO and other file descripto=
rs
> > > > that cannot be reopened by the new process. As mentioned, QEMU alre=
ady
> > > > has file descriptor passing support in the QMP monitor and support =
for
> > > > opening passed file descriptors (see qemu_open_internal(),
> > > > monitor_fd_param(), and socket_get_fd()).
> > > >=20
> > > > The advantage of integrating live update functionality into the exi=
sting
> > > > savevm/migrate commands is that it will work in more use cases with
> > > > less code duplication/maintenance/bitrot prevention than the
> > > > special-case cprsave command in this patch series.
> > > >=20
> > > > Maybe there is a fundamental technical reason why live update needs=
 to
> > > > be different from QEMU's existing migration commands but I haven't
> > > > figured it out yet. =20
> > >=20
> > > vfio and anonymous memory.
> > >=20
> > > Regarding code duplication, I did consider whether to extend the migr=
ation
> > > syntax and implementation versus creating something new.  Those funct=
ions
> > > handle stuff like bdrv snapshot, aio, and migration which are n/a for=
 the cpr
> > > use case, and the cpr functions handle state that is n/a for the migr=
ation case.
> > > I judged that handling both in the same functions would be less reada=
ble and
> > > maintainable.  After feedback during the V1 review, I simplified the =
cprsave
> > > code by by calling qemu_save_device_state, as Xen does, thus eliminat=
ing any
> > > interaction with the migration code.
> > >=20
> > > Regarding bit rot, I still need to add a cpr test to the test suite, =
when the=20
> > > review is more complete and folks agree on the final form of the func=
tionality.
> > >=20
> > > I do like the idea of supporting update without exec, but as a future=
 project,=20
> > > and not at the expense of dropping update with exec. =20
> >=20
> > Alex: We're discussing how to live update QEMU while VFIO devices are
> > running. This patch series introduces monitor commands that call
> > execve(2) to run the new QEMU binary and inherit the memory/vfio/etc
> > file descriptors. This way live update is transparent to VFIO but it
> > won't work if a sandboxed QEMU process is forbidden to call execve(2).
> > What are your thoughts on 1) the execve(2) approach and 2) extending
> > VFIO to allow running devices to be attached to a different process so
> > that execve(2) is not necessary?
>=20
> Tracking processes is largely to support page pinning; we need to be
> able to support both asynchronous page pinning to handle requests from
> mdev drivers and we need to make sure pinned page accounting is
> tracked to the same process.  If userspace can "pay" for locked pages
> from one process on mappping, then "credit" them to another process on
> unmap, that seems fairly exploitable.  We'd need some way to transfer
> the locked memory accounting or handle it outside of vfio.  Thanks,

Vhost's VHOST_SET_OWNER ioctl is somewhat similar. It's used to
associate the in-kernel vhost device with a userspace process and it's
mm.

Would it be possible to add a VFIO_SET_OWNER ioctl that associates the
current process with the vfio_device? Only one process would be the
owner at any given time.

I'm not sure how existing DMA mappings would behave, but this patch
series seems to rely on DMA continuing to work even though there is a
window of time when the execve(2) process doesn't have guest RAM
mmapped. So I guess existing DMA mappings continue to work because the
pages were previously pinned?

Stefan

--Ro1V6yWHigp0ywQe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCjw6IACgkQnKSrs4Gr
c8hLdwgAmXI/pJyI5z/th4G7Zs5IpPMzZS5AwQJpByfIBPCaaiH4dnT7ZOVmG78T
2RFwAGvn0WhwdkTQRCV8Dsmg0LefFTEWw51Y810IVtVwmkrRY4XsLK8XmbHDtrhR
rSgxBF1WtC093k/IYdAfq+nSLpwKVPwDX21n4B/DU1e2Sd0rjnVDCCBLEMvxYglo
4VB3uTsGjWJRry+lPOX53ZANtTiq9WFJEKvIc6VptbwQqu5M744+Eza2si8lm+KR
Efq/qa/A5WQjgNMwuVd4/PjzjgXJy4MLNFBGbfLtI4aaKmYNuOE1SEhQ9a73lDk0
OgNaD7wCwCv/ZteI5fpECatDpCBMxA==
=FyeP
-----END PGP SIGNATURE-----

--Ro1V6yWHigp0ywQe--


