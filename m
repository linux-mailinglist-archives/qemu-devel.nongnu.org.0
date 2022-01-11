Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3048AA46
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:15:56 +0100 (CET)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DFz-0005CG-Qn
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7DEN-0003rj-Uq
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7DEJ-0000cw-R6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641892451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcN5eFSsu6S2MK8FPkY8/J8UQ58pmGzozQSPjMkK5Uo=;
 b=BJ51bixhsBO9Buxl5ud6oka63WTQFzRYHhD+auHNsQUEIuFajGX1RBziFvEgRsyF3Cixwe
 p0ongUZUsP6EmwJp9zEN+SLFQ47n5lReHdiEMq8rGWrJHM1uExT/JgR9liqu7+dzLmZtcb
 TNH6LDjoCrn1q4AKhf1ow0zfSVuJS0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-eUjxjv_AMDOhCWG7N4uofA-1; Tue, 11 Jan 2022 04:14:05 -0500
X-MC-Unique: eUjxjv_AMDOhCWG7N4uofA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A92D1923B83;
 Tue, 11 Jan 2022 09:14:04 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C68A76F12A;
 Tue, 11 Jan 2022 09:13:44 +0000 (UTC)
Date: Tue, 11 Jan 2022 09:13:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Message-ID: <Yd1KRwmSoz8blQjq@stefanha-x1.localdomain>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-2-raphael.norwitz@nutanix.com>
 <20220110043354-mutt-send-email-mst@kernel.org>
 <20220110194253.GA7751@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20220110194253.GA7751@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1uMBR0La+8kqJS0q"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1uMBR0La+8kqJS0q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 07:43:06PM +0000, Raphael Norwitz wrote:
> On Mon, Jan 10, 2022 at 04:36:34AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 06, 2022 at 06:47:26AM +0000, Raphael Norwitz wrote:
> > > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> >=20
> >=20
> > Raphael any chance you can add a bit more to commit logs?
> > E.g. what happens right now if you pass more?
> >
>=20
> Sure - I'll add those details.
>=20
> > > ---
> > >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/=
libvhost-user/libvhost-user.c
> > > index 787f4d2d4f..a6dadeb637 100644
> > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> > >      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
> > >      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_re=
gion =3D &m;
> > > =20
> > > +    if (vmsg->fd_num !=3D 1 ||
> > > +        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> >=20
> > Is there a chance someone is sending larger messages and relying
> > on libvhost-user to ignore padding?
> >=20
>=20
> Great point -  I didn't consider padding. I'll drop the vmsg->size check
> here.

A vmsg->size > sizeof(vmsg->payload.memreg) check is still reasonable.

Without a check we'll treat the 0-initialized vmsg bytes as input,
which should be okay as long as there is input validation later on. In
some cases 0s may really be valid input and we'll perform some
operation. So in the end, I think checking vmsg->size is safest, just
ignore extra bytes.

Stefan

--1uMBR0La+8kqJS0q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHdSkYACgkQnKSrs4Gr
c8hExQgAoIYzelQ5d9prE67ETIjmAQokJw/zKSEf6vJW5JG7/2Gc/mf7nvFuVN57
RDbfxGDCBojdEo5lTFy86uJG7Ph6xjO05B+92MaoJyKmNKsEobhBdo/ciFbpzSYe
ajCLNTkDhMO25elxPjAeQKp7xHdXNoEljb5qG/OO0eVhbdnNcpKWA9ZK7j5zU/1D
hnOYoS0S2lIExaG3p/H7pfcGY2TuumHttyL2pwVu+npd4kfMj6n4zEgT9JjnyBZm
QHzUpHFmBmtpEECH1MI2U2a4bWkVOA0m6SHgNgRDTK/sL5yjSOr+mJEZmWIld6eg
e3ArsSWsh5UO396sia1imh9UmnR0KA==
=+sQ4
-----END PGP SIGNATURE-----

--1uMBR0La+8kqJS0q--


