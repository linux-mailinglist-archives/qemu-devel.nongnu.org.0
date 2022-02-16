Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF84B867F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:11:14 +0100 (CET)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIDH-0000yo-DI
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:11:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKIBa-0007bW-Ni
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKIBR-0005eA-QK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gFeIoJw3MWAgRN+Am9jfkP/Ejstseez5e/kjW9IxWPs=;
 b=hNgmcWdsLD1CWtjBISLvudZltii29s+sIReIS+6ZmJ5xYYrGqv6+GUzzHYPg+NQs6TGomd
 W/fP4CPQq/V1PcwvWBxOIY/H8Y44fDxya5gCaE6vJRwiIFX9KoyB5f+9NOfkic5qcd6WZE
 6R7xuA1YHScksy6IQe+ByZjsUeD6M74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-TWl6q1lQOzyaiyo4eZeixA-1; Wed, 16 Feb 2022 06:09:04 -0500
X-MC-Unique: TWl6q1lQOzyaiyo4eZeixA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C8E2F26;
 Wed, 16 Feb 2022 11:09:02 +0000 (UTC)
Received: from localhost (unknown [10.39.195.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E613510841E0;
 Wed, 16 Feb 2022 11:08:04 +0000 (UTC)
Date: Wed, 16 Feb 2022 11:08:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 4/8] ioregionfd: Introduce IORegionDFObject type
Message-ID: <YgzbE0QBaJ4ml2H5@stefanha-x1.localdomain>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
 <YgppIUOpkYUKwB5K@stefanha-x1.localdomain>
 <20220215181812.GB33858@nuker>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="91T4X1kC33M4VDxU"
Content-Disposition: inline
In-Reply-To: <20220215181812.GB33858@nuker>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--91T4X1kC33M4VDxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 10:18:12AM -0800, Elena wrote:
> On Mon, Feb 14, 2022 at 02:37:21PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Feb 07, 2022 at 11:22:18PM -0800, Elena Ufimtseva wrote:
> > > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > ---
> > >  meson.build                    |  15 ++-
> > >  qapi/qom.json                  |  32 +++++-
> > >  include/hw/remote/ioregionfd.h |  40 +++++++
> > >  hw/remote/ioregionfd.c         | 196 +++++++++++++++++++++++++++++++=
++
> > >  Kconfig.host                   |   3 +
> > >  MAINTAINERS                    |   2 +
> > >  hw/remote/Kconfig              |   4 +
> > >  hw/remote/meson.build          |   1 +
> > >  meson_options.txt              |   2 +
> > >  scripts/meson-buildoptions.sh  |   3 +
> > >  10 files changed, 294 insertions(+), 4 deletions(-)
> > >  create mode 100644 include/hw/remote/ioregionfd.h
> > >  create mode 100644 hw/remote/ioregionfd.c
> > >=20
> > > diff --git a/meson.build b/meson.build
> > > index 96de1a6ef9..6483e754bd 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -258,6 +258,17 @@ if targetos !=3D 'linux' and get_option('multipr=
ocess').enabled()
> > >  endif
> > >  multiprocess_allowed =3D targetos =3D=3D 'linux' and not get_option(=
'multiprocess').disabled()
> > > =20
> > > +# TODO: drop this limitation
> >=20
> > What is the reason for the limitation?
> >
>=20
> The idea is to limit use of this acceleration until the API is more
> generic and does not need mutliprocess.

Please document that intention so readers understand why a limitation
is in place.

Thanks,
Stefan

--91T4X1kC33M4VDxU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIM2xMACgkQnKSrs4Gr
c8jZrgf6Ap+KnoP0Qkyuj6HI5e4eBKq9/4FVeAtj1b3Ab1E1f7DNrJLuVca/Cp08
nujFYimLF7GnyG3yfrBcVppNkoexpRGpExyBDw1QykGWCUBkCkE60zMWyyoYYE7q
XzX51eOHsL+f+HjhaggkTacwlKg5RrnLY/abRzbIKmpQjPPQcGJNeTpro+sk5A2K
OdzIMgkdUFtScz4JX9JOpueU2zpFJ2/oH4QhxSUbJgJnHKRli6b1HxVooOhzlr5a
gfT6JslSgztstBau6X8V7w7lSTOfx18MFjVNLwnOHYpK7z1dkokn79aJqf83u+h9
OB0Z6XjdLYNgEsXjZzB5uFISY8ouBA==
=8m8C
-----END PGP SIGNATURE-----

--91T4X1kC33M4VDxU--


