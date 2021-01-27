Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCBF30581A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:19:29 +0100 (CET)
Received: from localhost ([::1]:48380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hv6-0006jl-1a
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4hu0-0006II-U1
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4htx-00037Q-Sp
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611742695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QJWW2uHnRevuVmuOoI5RLo9F1+8aWhdHTFpQF9yTaGs=;
 b=barykymjXrE3UnXAyqni8Or+m+iHGe58ZbE0VzCsZtvGy/IyCxuIQJmIhMyoJezBzjn3Zt
 ZpaE7KIwnuWL2t1zIOm5G83dWC787QgnO/b15e1cO1KQaF+uWqixojFUNd48J+U2qg6rPl
 mBO1qmwsaFXvuWoQm890afjLlPGGj1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-c2r3I6qfMt--1uMJInt51g-1; Wed, 27 Jan 2021 05:18:10 -0500
X-MC-Unique: c2r3I6qfMt--1uMJInt51g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87E1190A7AF;
 Wed, 27 Jan 2021 10:18:09 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64FE060C05;
 Wed, 27 Jan 2021 10:18:06 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:18:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
Message-ID: <20210127101805.GD299797@stefanha-x1.localdomain>
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210126181604.1a4c69c6@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:16:04PM +0100, Greg Kurz wrote:
> On Tue, 26 Jan 2021 10:35:02 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > A well-behaved FUSE client does not attempt to open special files with
> > FUSE_OPEN because they are handled on the client side (e.g. device node=
s
> > are handled by client-side device drivers).
> >=20
> > The check to prevent virtiofsd from opening special files is missing in
> > a few cases, most notably FUSE_OPEN. A malicious client can cause
> > virtiofsd to open a device node, potentially allowing the guest to
> > escape.=20
>=20
> or pretty much anything nasty you can think of, e.g. DoS if the malicious
> client repeatedly asks virtiofsd to open FIFOs the other side of which is
> never opened.
>=20
> > This can be exploited by a modified guest device driver. It is
> > not exploitable from guest userspace since the guest kernel will handle
> > special files inside the guest instead of sending FUSE requests.
> >=20
> > This patch adds the missing checks to virtiofsd. This is a short-term
> > solution because it does not prevent a compromised virtiofsd process
> > from opening device nodes on the host.
> >=20
> > Reported-by: Alex Xu <alex@alxu.ca>
> > Fixes: CVE-2020-35517
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
>=20
> The patch looks pretty good to me. It just seems to be missing a change i=
n
> lo_create():
>=20
>     fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFO=
LLOW,
>                 mode);
>=20
> A malicious guest could have created anything called ${name} in this dire=
ctory
> before calling FUSE_CREATE and we'll open it blindly, or I'm missing some=
thing ?

Good point! I will send another revision.

Stefan

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARPd0ACgkQnKSrs4Gr
c8gNIgf/YdElsWhjcT1Hu1brzUPWC4zSiIUK/CUDnKO015eJiCh2jyQ/7tyuAHOO
njwtXBydBtlbR45lSsDmusMJjpAICE0dJvqShMjYD7WwMXD81Fl8KJFoBseenU8g
HBrIBouy7OTuuHtOdJ8ofvopuR+CR4zWicrZRmChRRhpKM7UfQPEjbgof4FtpvPL
XK4CVTGeTtci++icwTQgGPAnvUYn3RJv0be37pIbzKjABfKaAk/NGf3d8HXxLN/9
n7sJQGj+Lt9y849TfZUhR1/7woPCmBSFBEM2fCpQfTIsU20V7QhgSQMOI4qD0hi0
T2l7yvHbjKBqXshib1TJA8FFoh2D5w==
=RnDm
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--


