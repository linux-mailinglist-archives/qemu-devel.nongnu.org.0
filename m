Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607FA2D2B73
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:52:05 +0100 (CET)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcTM-0008GI-D2
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmcRl-0007cV-Hv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmcRi-0007Bz-K2
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607431821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJb0yL8t1J27rgEdifFpbwxMbbWe+gLBx9boQJ2XmHM=;
 b=W3sVRo2rXQ6ov6FXR7bAt9syzBrWnxprYxsw/h23OUoflEKRSbkK+9yIEeu4kgNa4EUir5
 eF6E6FAnnF5yCIEzqKdtJc/W8U7wxK22IvPHLG54FVHbEcYIKyDEXon+4EVvACzRCL6ECY
 eBVSzMHlWBrNVS9063l0/OCDTIaQkBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-KvBjyZkePhajU5E9LyZ3Nw-1; Tue, 08 Dec 2020 07:50:20 -0500
X-MC-Unique: KvBjyZkePhajU5E9LyZ3Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594C2800D53;
 Tue,  8 Dec 2020 12:50:18 +0000 (UTC)
Received: from gondolin (ovpn-113-5.ams2.redhat.com [10.36.113.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE59236FA;
 Tue,  8 Dec 2020 12:50:07 +0000 (UTC)
Date: Tue, 8 Dec 2020 13:50:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [for-6.0 v5 12/13] securable guest memory: Alter virtio default
 properties for protected guests
Message-ID: <20201208135005.100d56fb.cohuck@redhat.com>
In-Reply-To: <20201208112829.0f8fcdf4.pasic@linux.ibm.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-13-david@gibson.dropbear.id.au>
 <d739cae2-9197-76a5-1c19-057bfe832187@de.ibm.com>
 <20201204091706.4432dc1e.cohuck@redhat.com>
 <038214d1-580d-6692-cd1e-701cd41b5cf8@de.ibm.com>
 <20201204154310.158b410e.pasic@linux.ibm.com>
 <20201208015403.GB2555@yekko.fritz.box>
 <20201208112829.0f8fcdf4.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; boundary="Sig_/zPKYOXDOdv+NokJBOjze+4x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, pbonzini@redhat.com, thuth@redhat.com,
 berrange@redhat.com, david@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/zPKYOXDOdv+NokJBOjze+4x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Dec 2020 11:28:29 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 8 Dec 2020 12:54:03 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > > > >>> +         * Virtio devices can't count on directly accessing gu=
est
> > > > >>> +         * memory, so they need iommu_platform=3Don to use nor=
mal DMA
> > > > >>> +         * mechanisms.  That requires also disabling legacy vi=
rtio
> > > > >>> +         * support for those virtio pci devices which allow it=
.
> > > > >>> +         */
> > > > >>> +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-l=
egacy",
> > > > >>> +                                   "on", true);
> > > > >>> +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_=
platform",
> > > > >>> +                                   "on", false);     =20
> > > > >>
> > > > >> I have not followed all the history (sorry). Should we also set =
iommu_platform
> > > > >> for virtio-ccw? Halil?
> > > > >>   =20
> > > > >=20
> > > > > That line should add iommu_platform for all virtio devices, shoul=
dn't
> > > > > it?   =20
> > > >=20
> > > > Yes, sorry. Was misreading that with the line above.=20
> > > >    =20
> > >=20
> > > I believe this is the best we can get. In a sense it is still a
> > > pessimization,   =20
> >=20
> > I'm not really clear on what you're getting at here. =20
>=20
> By pessimiziation, I mean that we are going to indicate
> _F_PLATFORM_ACCESS even if it isn't necessary, because the guest never
> opted in for confidential/memory protection/memory encryption. We have
> discussed this before, and I don't see a better solution that works for
> everybody.

If you consider specifying the secure guest option as a way to tell
QEMU to make everything ready for running a secure guest, I'd certainly
consider it necessary. If you do not want to force it, you should not
do the secure guest preparation setup.

--Sig_/zPKYOXDOdv+NokJBOjze+4x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl/Pdn0ACgkQ3s9rk8bw
L6/WxQ//f/A6jyDw7guGkEzpz6GouCnT9Rv+qkv2DwDmqMMApEcnKzUW1lF+xLn4
mpJMFa39IgSLzZgxLvSuVTEOPd2TT9kuJoRWatc4G5fZx5EM0yZGaARFJsXLykVp
G1/jn8gNfTe7l1y/EQx1resDpqjg/Tyjo98TZKRKFrOFkGRLJsEyVMI/5gDI+ZuZ
HmrIuR82ptPxWktd/iWkgkQvWv5WjZ47V0l6UKA0VDoXvVcfK/RGlO0nq+tXMrH9
b1jSRYG7jSQCWEXy2Ob/7TLRDlBI7ge0QKy73qumeoK9XOdH0WWZBFQOc3GUDt2I
R9sWJD+xiSs4381NktXN84iWzna41mpHVD5JWd3d65vA/Ad5kI/AmZrTvPZeh3GT
Iln47HOyYmbnmcey5ET65wL6b4HqfIVuWRrB46ue4QMrbXnSh8fsfjJ+tuj2TNl0
bigqqTHhXk4CbgWJF4rn+ppBHLtwycPfadU6jhGGl2Ld0Yj9CVShrOwtgyM1k/JW
MwrqOPpKTenX33/PhB1pl4B7mpXxGItb7FGmmn9qKQMPE1tIUTjdw9SdG3iBETCg
Y9LQEgStJbhtPQESKs93WoXawuTsP3L4Ij1zoMt9J3XytEd36KnhjFkYupTLub5h
foM4guYfcr0Npy0iQ3+3poCq9jnGo9jPi8SWdbrKQUIN0mU/jBI=
=RMCQ
-----END PGP SIGNATURE-----

--Sig_/zPKYOXDOdv+NokJBOjze+4x--


