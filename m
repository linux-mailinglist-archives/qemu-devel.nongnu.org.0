Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9A340E3D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:29:57 +0100 (CET)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyLD-0001cx-Qb
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMyK1-0000zP-0R
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMyJw-0000qr-Se
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616095715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IP8zQJuJTjWFf/poKPLB5jk84JyOwSZO40gw1e7lUuw=;
 b=Lklv/y9O7tpCwvttyqNNPtuUr5dA0fG1yVCOV0xefjXEbI/Ia4kw0xWCL23BHTD8b3gd0j
 H8Qbt+dQawvtFnP6k9EHGuBrIlSwuzGKEm2CzHzxV6BQlbhXcgm7hOMDuCG6BeTaiMxDE/
 A8y1BRtx/meFFGPlxTQvb0OGHDgrZJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-4-i703p1Ndia01kyAi9GZQ-1; Thu, 18 Mar 2021 15:28:31 -0400
X-MC-Unique: 4-i703p1Ndia01kyAi9GZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB8BE180FCA2;
 Thu, 18 Mar 2021 19:28:29 +0000 (UTC)
Received: from localhost (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B1735C1D1;
 Thu, 18 Mar 2021 19:28:29 +0000 (UTC)
Date: Thu, 18 Mar 2021 19:28:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
Message-ID: <YFOp3IFtglsxPJ9V@stefanha-x1.localdomain>
References: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
 <CAPcyv4hONDtHmUFF70rCc3y3+GX4ix1BdqxMOrWBRwG3mtTXPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hONDtHmUFF70rCc3y3+GX4ix1BdqxMOrWBRwG3mtTXPw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xc6Kvbte/jG1bLWq"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Jeff Moyer <jmoyer@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Haozhong Zhang <haozhong.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Xc6Kvbte/jG1bLWq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 04:52:03PM -0700, Dan Williams wrote:
> On Wed, Mar 17, 2021 at 4:49 AM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > Hi,
> > Microsoft and Intel developed two different ACPI NVDIMM _DSM interfaces=
.
> >
> > The specs for the Intel interface are available here:
> > https://pmem.io/documents/NVDIMM_DSM_Interface_Example.pdf
> >
> > This is the interface that QEMU emulates. It has been reported that
> > Windows 2016 Server and 2019 Server guests do not recognize QEMU's
> > emulated NVDIMM devices using the Microsoft driver.
> >
> > I'd like to understand the path forward that will allow both Linux and
> > Windows guests to successfully use QEMU's emulated NVDIMM device
> > (https://gitlab.com/qemu-project/qemu/-/blob/master/hw/acpi/nvdimm.c).
> >
> > Are/have these two interfaces being/been unified?
>=20
> No, they service 2 different classes of NVDIMMs. The Microsoft
> specification was defined for NVDIMM-N devices that are the
> traditional battery/super-capacitor backed DDR with sometimes an equal
> amount of flash to squirrel away data to non-volatile media on power
> loss. The Intel one is for a persistent media class of device where
> there is no need to communicate health attributes like "energy source
> died" or "restore from flash" failed.
>=20
> > Should QEMU emulate both of them to make running Windows guests easy?
>=20
> Depends on how tolerant Windows is to different format-interface-code
> implementations and what QEMU should return on each of the functions
> it decides to implement.
>=20
> Note that QEMU only implements a small subset of the Intel commands,
> i.e. just enough to provision namespaces in the NVDIMM label area.
> "NVDIMM label area" is a concept that is newer than the NVDIMM-N
> definition which is why you don't see labels mentioned in the
> Microsoft specification. Since then ACPI has developed common label
> area access methods, see "6.5.10 NVDIMM Label Methods" in the ACPI 6.4
> specification.
>=20
> Note that you'll also see "9.20.8 NVDIMM Device Methods" in that spec
> for some health management commands that overlap what the Microsoft
> and Intel specs communicate. Linux does not support them since any
> platform that might support them will also support the Intel
> specification so there's no driving need for Linux to migrate. I do
> not know the status of that command support in Windows, or the HPE
> command support in Windows for that matter.
>=20
> If you need to support guests that expect the Hyper-V command
> definition, and will fail to attach NVDIMM support in the absence of
> that definition then QEMU needs UUID_NFIT_DIMM_N_HYPERV support, note
> that is a different command set than even UUID_NFIT_DIMM_N_MSFT
> (include/acpi/acuuid.h). That would also require changes to virtual
> ACPI NFIT to advertise the correlated format interface code. There may
> be more... you would need someone from Hyper-V land to enumerate all
> that is expected.
>=20

Thanks!

Stefan

--Xc6Kvbte/jG1bLWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBTqdwACgkQnKSrs4Gr
c8jwtAgAo2uo49XVxMAzPy8gySN2lEh9JiVedpE8siSCnIEBDPfTnj+j1VvRCaGs
1czvDheFyfNlKLFl0MtAxdmYGnwzrrw1pNidfzopqmUfW8MUXfBtjgH9tqg7vBCy
0aq9fHuIH3YXqUcrvSZWh3odGJWYLnkRarlJ9Yovm8LUfVbyAfO3DkzuNpw/xaBt
6Vj5ewiZGMJDgR7Q+KjCoijAQdLtzEyneI89qgKRGQbt+UqH259R5rHABlgsjcuj
++KkbQ/lCnrrV4emMewMCvhFkhISHIo0YyL2vCgAY9gQJg6wnV2yxWQmNtNWVnh1
Gp6GHrEZN/ps7uFOSJdMWiYD5pvn4A==
=lgUh
-----END PGP SIGNATURE-----

--Xc6Kvbte/jG1bLWq--


