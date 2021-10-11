Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962A4293C8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:48:37 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxXX-0007oi-Ae
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZxVF-00078D-WF
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZxVC-00046g-GM
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633967168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=76x/raaXs8ZiXbZ4uaOmuO/V9TSZg15ZlcIQtVxgavQ=;
 b=h8EGbvBzqFWjkAeEjM2CLZUAMRG+BH5Sd11Cf8lWHOQFn95v/vRY/ftGmZjdC7l6pPcYj5
 IvBk46k+0u19IPRC8JYMy4IEWXLmRuQ52GlMF8fkr2TKRhlHew++rfOij9UH8fNra86jQf
 hk1p8pUznYQbRKp79bG/Otq0RaA9u2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-xQZCv-SeNzmHniz9Sj0v4Q-1; Mon, 11 Oct 2021 11:46:05 -0400
X-MC-Unique: xQZCv-SeNzmHniz9Sj0v4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DA0F84A5E1;
 Mon, 11 Oct 2021 15:46:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD6035D9C6;
 Mon, 11 Oct 2021 15:46:03 +0000 (UTC)
Date: Mon, 11 Oct 2021 16:46:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YWRcOYbxH6ygs/tj@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
 <163337608907.347510.4401699281486806089@amd.com>
 <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
 <20211011072130.i3vemilk23o4djdz@sirius.home.kraxel.org>
 <YWQY1CQ/qUsMBnoD@stefanha-x1.localdomain>
 <CANCZdfpsHTr0=Lc8TB0L846ZbfjFS0sNDyna_74HQaXdcuWSYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANCZdfpsHTr0=Lc8TB0L846ZbfjFS0sNDyna_74HQaXdcuWSYw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sFF7yuLhD0JiOTC/"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--sFF7yuLhD0JiOTC/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 08:28:34AM -0600, Warner Losh wrote:
> On Mon, Oct 11, 2021 at 4:59 AM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>=20
> > On Mon, Oct 11, 2021 at 09:21:30AM +0200, Gerd Hoffmann wrote:
> > >   Hi,
> > >
> > > > > I guess the main question is who is using the ROM/BIOS sources in=
 the
> > > > > tarballs, and would this 2-step process work for those users? If
> > there
> > > > > are distros relying on them then maybe there are some more logist=
ics
> > to
> > > > > consider since the make-release downloads are both time-consuming=
 and
> > > > > prone to network errors/stalls since it relies on the availabilit=
y
> > of a
> > > > > good number of different hosts.
> > > >
> > > > Great, maybe Gerd can comment on splitting out firmware.
> > >
> > > I think the binaries are mostly a convenience feature for developers.
> > > Distros typically build from source anyway, and typically they build
> > > from upstream source instead of qemu submodule.
> > >
> > > The idea to split them out to a separate repo is exists for quite a
> > > while.  I have an old qemu-firmware repo laying around on my disk, wh=
ich
> > > basically moves roms/ + submodules and the binaries built from it ove=
r.
> > >
> > > I think with the switch to gitlab it doesn't make sense any more to
> > > commit pre-built firmware binaries to a git repo.  Instead we should
> > > build the firmware in gitlab ci, i.e. effectively move the build rule=
s
> > > we have right now in roms/Makefile to .gitlab-ci.d/, then publish the
> > > firmware binaries as build artifacts or gitlab pages.
> > >
> > > When done just remove the pre-build binaries from git and add a helpe=
r
> > > script to fetch firmware binaries from gitlab instead.
> > >
> > > > QEMU mirrors firmware sources on GitLab too. We're able to provide =
the
> > > > same level of download availability on our mirror firmware repos as=
 for
> > > > the main qemu.git repo.
> > >
> > > I think enabling CI for the firmware mirrors should work given that i=
t
> > > is possible to specify a custom CI/CD configuration file, i.e. use
> > > something like
> > >
> > >     /qemu-project/qemu/.gitlab-ci.d/firmware/seabios.yml
> > >
> > > or
> > >
> > >     /qemu-project/qemu-firmware/seabios.yml
> > >
> > > as config file for the
> > >
> > >     /qemu-project/seabios/
> > >
> > > mirror.  Then we can publish binaries using gitlab pages at
> > >
> > >     https://qemu-project.gitlab.io/seabios/
> > >
> > > That way we also don't need the roms/ submodules any more, i.e. we
> > > can remove both sources and binaries for the firmware from the
> > > release tarballs.
> >
> > Thanks!
> >
> > For developer convenience it would be nice to avoid manual steps after
> > git clone qemu.git. Maybe ./configure should check for firmware blobs
> > and automatically download them. There could be a ./configure
> > --disable-firmware-download option that distros can use to skip the
> > download when building everything from source.
> >
>=20
> One thing to keep in mind about the downstream consumers: Many
> of them have two phases to their build process that run asynchronously
> to each other. There is a fetch phase that grabs everything, and a build
> phase that builds the binaries. The second phase may not have access
> to the internet for a variety of reasons (these days being a security
> measure, for good or ill). Please make sure that any such plans
> allow for this model.
>=20
> Today, that's all dealt with by grabbing tarballs from github which
> is how the submodules are dealt with. So long as the images
> had well known names, and could be fetched with the normal
> wget/cgit/fetch programs, that would suffice. Requiring use of
> some weird bespoke script would cause friction for the downstreams
> using qemu.
>=20
> So while I'm all for making things a little more independent,
> let's not do it in a way that makes life difficult for downstreams.
> There are more there than just a couple of big distro builders.

I think this is fine. Firmware blobs aren't needed to build QEMU, only
to run the system emulator.

Stefan

--sFF7yuLhD0JiOTC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFkXDkACgkQnKSrs4Gr
c8iTTAf/ZOXR0MdVpdhv+W6HFXPqSewl13JNJf+H5mZpld6a5dsUfUlPViWILG2u
a61o51IQpumjJgF1f9S4Ip3rIIDobv2zaZrzNQ0PudI39bHMQc6GPbch/V9Xtok5
ZYHHbZJMKCfJV5+OiirWRq+qGhtJr9I0K8Ya3EcVoGySlKA3I9Bu7phEhIYNpYx1
7FdzmyzL1L2lubvA1FK0rDArpHzsAY5fFb87AtFLFjzvR57WNq2H9Bce1Y2F+xfR
OWqoVKN0L2N6RdUcbAn32J6CoyIZnh7w4kd40b0derD16lYxu202JNrSXR8jcxqf
sAaPn/3C8duZb+SBEDivet3YuoPybA==
=O6fd
-----END PGP SIGNATURE-----

--sFF7yuLhD0JiOTC/--


