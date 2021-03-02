Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4993297AD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:16:56 +0100 (CET)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH19D-00063S-9e
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH17D-0005Nd-C4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH17B-0005gx-Ir
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614676488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=maIR51eXT9zTBMqj9UDl5+Si8M5/OCp9VNi7b66H+UI=;
 b=hWQRKru1nRY/uU2Upa4FzWfwY8f0hSmcm8OYcFHoLSKP4S7i6YyPS26bH1lAeOMsC5yhPQ
 xsGova5hh9rqX7cejCZ2QjKhJU1ZgAamULpRZizSJiwrZQvVQ3HFJHnRwJqi3NpR0sXubt
 AR18nZTuNklbIfNalmhqIZvJI8aJZn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-ctcLRAq8OoyJmLyzaDB2UA-1; Tue, 02 Mar 2021 04:14:46 -0500
X-MC-Unique: ctcLRAq8OoyJmLyzaDB2UA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480DF1966323;
 Tue,  2 Mar 2021 09:14:45 +0000 (UTC)
Received: from localhost (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD90A5945F;
 Tue,  2 Mar 2021 09:14:44 +0000 (UTC)
Date: Tue, 2 Mar 2021 09:14:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH] qemu-storage-daemon: add --pidfile option
Message-ID: <YD4CAwKFj0lMotRt@stefanha-x1.localdomain>
References: <20210301160857.130478-1-stefanha@redhat.com>
 <YD0TM9/myXkdobPf@redhat.com> <20210301162409.GA30079@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301162409.GA30079@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XBD7ZkubCiaTkqCk"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: afrosi@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XBD7ZkubCiaTkqCk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 04:24:09PM +0000, Richard W.M. Jones wrote:
> On Mon, Mar 01, 2021 at 04:15:47PM +0000, Daniel P. Berrang=E9 wrote:
> > On Mon, Mar 01, 2021 at 04:08:57PM +0000, Stefan Hajnoczi wrote:
> > > Daemons often have a --pidfile option where the pid is written to a f=
ile
> > > so that scripts can stop the daemon by sending a signal.
> > >=20
> > > The pid file also acts as a lock to prevent multiple instances of the
> > > daemon from launching for a given pid file.
> > >=20
> > > QEMU, qemu-nbd, qemu-ga, virtiofsd, and qemu-pr-helper all support th=
e
> > > --pidfile option. Add it to qemu-storage-daemon too.
> > >=20
> > > Reported-by: Richard W.M. Jones <rjones@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  docs/tools/qemu-storage-daemon.rst   | 10 ++++++++++
> > >  storage-daemon/qemu-storage-daemon.c | 29 ++++++++++++++++++++++++++=
++
> > >  2 files changed, 39 insertions(+)
> > >=20
> > > diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-sto=
rage-daemon.rst
> > > index f63627eaf6..8f4ab16ffc 100644
> > > --- a/docs/tools/qemu-storage-daemon.rst
> > > +++ b/docs/tools/qemu-storage-daemon.rst
> > > @@ -118,6 +118,16 @@ Standard options:
> > >    List object properties with ``<type>,help``. See the :manpage:`qem=
u(1)`
> > >    manual page for a description of the object properties.
> > > =20
> > > +.. option:: --pidfile PATH
> > > +
> > > +  is the path to a file where the daemon writes its pid. This allows=
 scripts to
> > > +  stop the daemon by sending a signal::
> > > +
> > > +    $ kill -SIGTERM $(<path/to/qsd.pid)
> > > +
> > > +  A file lock is applied to the file so only one instance of the dae=
mon can run
> > > +  with a given pid file path. The daemon unlinks its pid file when t=
erminating.
> >=20
> > Usually a pidfile wants to have some explicit synchronization rules
> > defined. AFAICS, qsd doesn't have a --daemonize option to sync against.
> > If we're using the FD passing trick for the monitor, however, we want
> > a guarantee that the pidfile is written before the monitor accepts the
> > first client.
> >=20
> > IOW, the parent process needs to know that once it has done the QMP
> > handshake, there is guaranteed tobe a pidfile present, or if the
> > QMP handshake fails, then the app is guaranteed to have quit.
> >=20
> > IIUC, this impl should be ok in this respect, because we won't process
> > the QMP handdshake until the main loop runs, at which point the pidfile
> > is present. So we just need to document that the pidfile is guaranteed
> > to be written by the time QMP is active.
>=20
> I'm not sure if I follow this exactly, but from my point of view I'd
> like to know that:
>=20
> (1) If we're using --nbd-server addr.type=3Dinet|unix then the PID file
> must not be created until the socket has been created and is
> listening.  Here I mean the NBD socket, but the same would apply to
> the QMP socket or any other listening socket.  This allows you to do
> scripting sanely (qemu-storage-daemon ... &) without arbitrary sleeps.

Okay. This is guaranteed by the code (--chardev creates the character
device and listens before the pid file is written).

> (2) If we're using the FD passing trick instead, we don't care and
> would probably not use the --pidfile option anyway (since we have the
> PID from calling fork).

Yep.

I will document the things that you and Dan mentioned.

Stefan

--XBD7ZkubCiaTkqCk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA+AgMACgkQnKSrs4Gr
c8g5cwgAsM3eJAIcJdLc2ZatDaalMXgLuuff42lj6VUagWG96B0NwgzEejSgKAsP
b8AaWMX3V0Kg8YyZZaGQ55N/eJRc7M5zu6Dcj6mqtl94Ui+U8vpSKLVQKKwv5egJ
kfPtzHL0fyvnyZaCOa7597LEh6uAPFF7fIA20Na0Dxpdq5BbdcY8NOQA9xetTIi2
tcO9Ag4NqtE8If/hysDVqLGxHqu9VIPhiKJcd3/MqiyqsjvOkpZhTXlDulcvDgC0
NjFAzhmqccCyv3uJlhtN51JsyiBLrGtfnw4RRDt6PyTfCNadi05xV2nMZuTRshGH
eS6pUDTbGPM1iwJeqepJOuJ+fGkNrw==
=gNlm
-----END PGP SIGNATURE-----

--XBD7ZkubCiaTkqCk--


