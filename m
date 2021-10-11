Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EDE428BAA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:59:54 +0200 (CEST)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZt29-0002l5-81
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZt0z-00025P-T3
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:58:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZt0w-0002Kx-1P
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633949916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRKCucrms1Y+rbYVzMmuDZaQ1jTP5fwO8fxSFBA2Znw=;
 b=PdpkcblD1cSMxspW+yH3UVTaWh5mMjon9Cb5z+b+PF1w4l+qlCrPyl8c5UZDqERHiSP+6j
 uQDSY0JxY6MvJKMF/LFq4+iX+lJyKgGfJv5jxhIzCMpn9bwrsFU7WNwqA7YRIEk0zQ+p8I
 YUCHRWRy8iMu5HLVd6kKL2qu7D5X5HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-6LPm55XEMsWGh18FhtRuxg-1; Mon, 11 Oct 2021 06:58:34 -0400
X-MC-Unique: 6LPm55XEMsWGh18FhtRuxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2991E84A5E0;
 Mon, 11 Oct 2021 10:58:33 +0000 (UTC)
Received: from localhost (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A104B60843;
 Mon, 11 Oct 2021 10:58:30 +0000 (UTC)
Date: Mon, 11 Oct 2021 11:58:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YWQY1CQ/qUsMBnoD@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
 <163337608907.347510.4401699281486806089@amd.com>
 <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
 <20211011072130.i3vemilk23o4djdz@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211011072130.i3vemilk23o4djdz@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NkGipk3583W8cGPQ"
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
 Michael Roth <michael.roth@amd.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NkGipk3583W8cGPQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 09:21:30AM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> > > I guess the main question is who is using the ROM/BIOS sources in the
> > > tarballs, and would this 2-step process work for those users? If ther=
e
> > > are distros relying on them then maybe there are some more logistics =
to
> > > consider since the make-release downloads are both time-consuming and
> > > prone to network errors/stalls since it relies on the availability of=
 a
> > > good number of different hosts.
> >=20
> > Great, maybe Gerd can comment on splitting out firmware.
>=20
> I think the binaries are mostly a convenience feature for developers.
> Distros typically build from source anyway, and typically they build
> from upstream source instead of qemu submodule.
>=20
> The idea to split them out to a separate repo is exists for quite a
> while.  I have an old qemu-firmware repo laying around on my disk, which
> basically moves roms/ + submodules and the binaries built from it over.
>=20
> I think with the switch to gitlab it doesn't make sense any more to
> commit pre-built firmware binaries to a git repo.  Instead we should
> build the firmware in gitlab ci, i.e. effectively move the build rules
> we have right now in roms/Makefile to .gitlab-ci.d/, then publish the
> firmware binaries as build artifacts or gitlab pages.
>=20
> When done just remove the pre-build binaries from git and add a helper
> script to fetch firmware binaries from gitlab instead.
>=20
> > QEMU mirrors firmware sources on GitLab too. We're able to provide the
> > same level of download availability on our mirror firmware repos as for
> > the main qemu.git repo.
>=20
> I think enabling CI for the firmware mirrors should work given that it
> is possible to specify a custom CI/CD configuration file, i.e. use
> something like
>=20
>     /qemu-project/qemu/.gitlab-ci.d/firmware/seabios.yml
>=20
> or
>=20
>     /qemu-project/qemu-firmware/seabios.yml
>=20
> as config file for the=20
>=20
>     /qemu-project/seabios/
>=20
> mirror.  Then we can publish binaries using gitlab pages at
>=20
>     https://qemu-project.gitlab.io/seabios/
>=20
> That way we also don't need the roms/ submodules any more, i.e. we
> can remove both sources and binaries for the firmware from the
> release tarballs.

Thanks!

For developer convenience it would be nice to avoid manual steps after
git clone qemu.git. Maybe ./configure should check for firmware blobs
and automatically download them. There could be a ./configure
--disable-firmware-download option that distros can use to skip the
download when building everything from source.

Stefan

--NkGipk3583W8cGPQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFkGMwACgkQnKSrs4Gr
c8hXTwgApLN4jqFORxQ3BBrefbJ50rGfOASQlEh1B79gziqpodTvgIy7A4Q9i2md
pdZIm/Sun7S/vl4Ap1lDwq9+F8U7VgLM6FEjOZDlSkQXFWwIjRN3HRGH0xPShw7v
oZOWW5Uad5wbvhpCEKpqqNEjn5lGiX/Jej7C3ylZykik7r0CThO0x48aQna2hU8B
lJ4CYKY3OLx5iz21qfPGZ7cpi22dwW6Ylq4g5cP+HEDxK2k+aLUZKSE+E/4ScLTu
MkfNWop5CCFunCkEM4H1IVRy1QGQE+gKyaiJnz1RspYf86GwFesp4RIuzsOgGnFz
+PIUgRM2giOiF4royNS3VykZDsyQ+Q==
=6HWZ
-----END PGP SIGNATURE-----

--NkGipk3583W8cGPQ--


