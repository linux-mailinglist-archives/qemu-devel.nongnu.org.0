Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF105380906
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:55:34 +0200 (CEST)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWPl-0006HK-KM
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhWNp-0003KU-HA
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhWNl-0007Wt-6L
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620993207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C2XDn/F4ybpWykZlHChxyBvkIRwyYe2webcKZsCKsvw=;
 b=UdcFswr7wlvWTQquPcH/9xW1ObaJwo+MYbxRQjfPkRoiv5o5r+szBLLW4bMNmn/smhTynM
 lj91LlsPjPSXAJldqO82i5mIWtfTdmtk3iuCBWefAaNIghNk0S7DOpH1U3SfuE1reTYjsC
 QJjwrHo93VNrH3yUKuCaWlGC9i6nsrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-CFaOLUt3NrKRu37DC2LXCQ-1; Fri, 14 May 2021 07:53:23 -0400
X-MC-Unique: CFaOLUt3NrKRu37DC2LXCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19804106BB2B;
 Fri, 14 May 2021 11:53:21 +0000 (UTC)
Received: from localhost (ovpn-114-20.ams2.redhat.com [10.36.114.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFEB86267D;
 Fri, 14 May 2021 11:53:07 +0000 (UTC)
Date: Fri, 14 May 2021 12:53:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update
Message-ID: <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="34yWvFu3PPUcXz4l"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--34yWvFu3PPUcXz4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:
> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:
> > On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
> >> Provide the cprsave and cprload commands for live update.  These save =
and
> >> restore VM state, with minimal guest pause time, so that qemu may be u=
pdated
> >> to a new version in between.
> >>
> >> cprsave stops the VM and saves vmstate to an ordinary file.  It suppor=
ts two
> >> modes: restart and reboot.  For restart, cprsave exec's the qemu binar=
y (or
> >> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in=
 a
> >> paused state and waits for the cprload command.
> >=20
> > I think cprsave/cprload could be generalized by using QMP to stash the
> > file descriptors. The 'getfd' QMP command already exists and QEMU code
> > already opens fds passed using this mechanism.
> >=20
> > I haven't checked but it may be possible to drop some patches by reusin=
g
> > QEMU's monitor file descriptor passing since the code already knows how
> > to open from 'getfd' fds.
> >=20
> > The reason why using QMP is interesting is because it eliminates the
> > need for execve(2). QEMU may be unable to execute a program due to
> > chroot, seccomp, etc.
> >=20
> > QMP would enable cprsave/cprload to work both with and without
> > execve(2).
> >=20
> > One tricky thing with this approach might be startup ordering: how to
> > get fds via the QMP monitor in the new process before processing the
> > entire command-line.
>=20
> Early on I experimented with a similar approach.  Old qemu passed descrip=
tors to an
> escrow process and exited; new qemu started and retrieved the descriptors=
 from escrow.
> vfio mostly worked after I hacked the kernel to suppress the original-pid=
 owner check.
> I suspect my recent vfio extensions would smooth the rough edges.

I wonder about the reason for VFIO's pid limitation, maybe because it
pins pages from the original process?

Is this VFIO pid limitation the main reason why you chose to make QEMU
execve(2) the new binary?

> However, the main issue is that guest ram must be backed by named shared =
memory, and
> we would need to add code to support shared memory for all the secondary =
memory objects.
> That makes it less interesting for us at this time; we care about updatin=
g legacy qemu=20
> instances with anonymous guest memory.

Thanks for explaining this more in the other sub-thread. The secondary
memory objects you mentioned are relatively small so I don't think
saving them in the traditional way is a problem.

Two approaches for zero-copy memory migration fit into QEMU's existing
migration infrastructure:

- Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
  etc) so they are not saved into the savevm file. The existing --object
  memory-backend-file syntax can be used.

- Extending the live migration protocol to detect when file descriptor
  passing is available (i.e. UNIX domain socket migration) and using
  that for memory-backend-* objects that have fds.

Either of these approaches would handle RAM with existing savevm/migrate
commands.

The remaining issue is how to migrate VFIO and other file descriptors
that cannot be reopened by the new process. As mentioned, QEMU already
has file descriptor passing support in the QMP monitor and support for
opening passed file descriptors (see qemu_open_internal(),
monitor_fd_param(), and socket_get_fd()).

The advantage of integrating live update functionality into the existing
savevm/migrate commands is that it will work in more use cases with
less code duplication/maintenance/bitrot prevention than the
special-case cprsave command in this patch series.

Maybe there is a fundamental technical reason why live update needs to
be different from QEMU's existing migration commands but I haven't
figured it out yet.

Stefan

--34yWvFu3PPUcXz4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCeZKIACgkQnKSrs4Gr
c8hacgf9HcClYKxSHMZ1vFZpA1xIfr7D8Dtl+JYwRKB02Rs5EmfNr7USudviY2E8
u7yqt/4mW4j1lZt1k1ryiTemW2Xv+21Q1pAbAphOFu1rjRnNZDlLYdktnnHPibQM
y4Cf5NvxDHVVPog3fVeqiZV9+JC290CBE04Run8vfFaSY60KeTsp7wo6FXWh7K+N
nwq6M25Gz7gFcGJJW9igxN24qqficz+jS6wmd4UI9xfsfeR/uuyZLvOFpXf+rr5G
qeRXqF+eQF+fvzsCoWkd90F0cvtA9nPnV13iFlgCF58O4IxF8keltC395Pe4KHHy
mPOqaCpElZGQt03vYIqR6oo1kNbGjQ==
=kIZK
-----END PGP SIGNATURE-----

--34yWvFu3PPUcXz4l--


