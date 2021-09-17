Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424740FD85
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:06:18 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGNU-0004cM-Fm
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mRGGv-00009g-1B
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mRGGs-0003AN-7L
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631894365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wFWPZAFHSRf41Gn3sI9uh7ggsVtFgkzv9iodOqcvkAg=;
 b=N6QU8ELnK469ZHW/r2J0V7TKirFK+w5woNAXhT3EB6/N/S7Ho5nR4KlNtq2WJCcTbR48vY
 OXzqQ34YsRcD3Sod9tzHY5nk7daZ7pJsXV4ZLjSU0nJ5NDVCmhQrqRSZLXVH+HUHvjN0gT
 1TH6LteuKWeOIdgaULrzXA2sFYKM8fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-z7tUXkY7Nk2DhoJnfVgcpA-1; Fri, 17 Sep 2021 11:59:18 -0400
X-MC-Unique: z7tUXkY7Nk2DhoJnfVgcpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBF0D1084683;
 Fri, 17 Sep 2021 15:59:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 588B15C1C5;
 Fri, 17 Sep 2021 15:59:10 +0000 (UTC)
Date: Fri, 17 Sep 2021 16:59:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUS7TUQ11WtyqCMf@stefanha-x1.localdomain>
References: <YURYvaOpya498Xx2@yekko>
 <YUR9RXXZ4lSRfcyB@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YUR9RXXZ4lSRfcyB@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aZEcIB46odRFmFnX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: peter.maydell@linaro.org, slp@redhat.com, cohuck@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, sgarzare@redhat.com,
 alex.bennee@linaro.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aZEcIB46odRFmFnX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 12:34:29PM +0100, Daniel P. Berrang=E9 wrote:
> On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:
> > Hi all,
> >=20
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build.
> >=20
> > I've added the information to our wiki at:
> > =09https://wiki.qemu.org/RustInQemu
> >=20
> > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > Windows are pretty much ok, with the exception of Linux on Sparc.
> > There are a lot of gaps in *BSD support, however.
>=20
> To me the coverage looks pretty much what I'd expect to need
> for QEMU - almost all boxes that I'd want to see green are
> green, except OpenBSD, possibly x86 32-bit for *BSD and
> sparc(64) on Linux.
>=20
> Mostly it highlights that we've never explicitly declared what
> our architecture coverage is intended to be. We do check host
> arches in configure, but we didn't distinguish this by OS and
> I think that's a mistake.
>=20
> In terms of our CI coverage, the only non-x86 testing we do
> is for Linux based systems.
>=20
> Although its possible people use non-x86 on non-Linux, I don't
> recall any discussions/bugs/patches targetting this situation,
> so if we do have users I doubt there's many.

macOS on Apple silicon is a non-x86 non-Linux host platform that is
currently receiving some developer attention. Luckily
aarch64-apple-darwin is in Tier 2 with host tools.

Stefan

--aZEcIB46odRFmFnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFEu00ACgkQnKSrs4Gr
c8iW/ggAvINpXO2C9A0A0hWSPtLVoVczKHLJVQdtWdHuE+jxLNQBswymyznBjU9T
YBksbAZWwufwTrNW1EVnbpAzf8hDqJ25+4KPfxZagypAWd49A3i20Mm9WtlvejI5
Mv5+eE2tBdSeGU81Zfk7nU7Seq45r3mXbev0yWNUCg7A9Xx/ww7ZUpAKgYtcG229
xS/ZIR3+Ton2lFmEBy1vTQjr8X3hUb1LLk31PvCY3eOStUge9l4QJEX3Buw/rOqT
+ALQ4S2a3+e1dQoL4GtnUSE54VYvJ/erEsBgvBXfOyn72UeIxOcUihq7IrOm1llW
DBXOZIbVetFAi6qcImAdIZU1sUt/7Q==
=s/XY
-----END PGP SIGNATURE-----

--aZEcIB46odRFmFnX--


