Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E6B4851B8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:21:09 +0100 (CET)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n54Ls-0001LC-7e
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n54Jx-0000Df-7o
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n54Jv-00069J-Nn
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641381547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0x8HhFhfPnDDaR+VN6cluLYe5EjWqyv/Dhpx+ACL1QY=;
 b=XSRNmbrv/S5cIld4Irmm9WBu3lVta9+I/HeAdhl2nurVjtE0DhLQ862a7jFNDeQApO7EPK
 81Ds5hMqUEPnh0KUcUZbrx9y+z8LfRwm0cMdMHUvAvBZAqGHdBtRomp+Vf3BvqlBIk41OM
 lVTiJPfkHuu7kS+Hb1ZAe1krjNBzLH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-3Tr0UIGwNs62ryEdfa-CWg-1; Wed, 05 Jan 2022 06:19:03 -0500
X-MC-Unique: 3Tr0UIGwNs62ryEdfa-CWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5834100C661;
 Wed,  5 Jan 2022 11:19:02 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0AB708D3;
 Wed,  5 Jan 2022 11:18:53 +0000 (UTC)
Date: Wed, 5 Jan 2022 11:18:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [RFC 5/5] libvhost-user: handle removal of identical regions
Message-ID: <YdV+nMs86IWxEZJN@stefanha-x1.localdomain>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-6-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20211215222939.24738-6-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Ql+7nanYcuqCbVI"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+Ql+7nanYcuqCbVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:29:55PM +0000, Raphael Norwitz wrote:
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 74a9980194..2f465a4f0e 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -809,6 +809,7 @@ static bool
>  vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region=
 =3D &m;
>      int i;
> +    bool found =3D false;
> =20
>      if (vmsg->fd_num !=3D 1 ||
>          vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> @@ -831,25 +832,25 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>              VuDevRegion *r =3D &dev->regions[i];
>              void *m =3D (void *) (uintptr_t) r->mmap_addr;
> =20
> -            if (m) {
> +            if (m && !found) {
>                  munmap(m, r->size + r->mmap_offset);
>              }

Why is only the first region unmapped? My interpretation of
vu_add_mem_reg() is that it mmaps duplicate regions to unique mmap_addr
addresses, so we need to munmap each of them.

> =20
> -            break;
> +            /*
> +             * Shift all affected entries by 1 to close the hole at inde=
x i and
> +             * zero out the last entry.
> +             */
> +            memmove(dev->regions + i, dev->regions + i + 1,
> +                    sizeof(VuDevRegion) * (dev->nregions - i - 1));
> +            memset(dev->regions + dev->nregions - 1, 0, sizeof(VuDevRegi=
on));
> +            DPRINT("Successfully removed a region\n");
> +            dev->nregions--;
> +
> +            found =3D true;
>          }

i-- is missing. dev->regions[] has been shortened so we need to check
the same element again.

--+Ql+7nanYcuqCbVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVfpwACgkQnKSrs4Gr
c8iETwgAmBfFd4ifH0feW3wUu3qI69+6PBBH674VPtsrXUTl6JxmM6QmUNLtKvDl
JfwCRntkMpL6sWfKYiBy5Z09iNU6EGM1cO7nndrcTJeG6YMHfA/oE/YR8JlbqPdX
Ye64ya0SRmDtuS3TIfQ50eqr3IZULAq4DDEFivgtMVd4/6Jw1/L+G3akFFeDpHdO
63nW4L96GJ79ML1L2c3NWdDJ9Cd2xm/kjc5osgXSG22dp4sKENT1dSshSLlgOmGx
L96OuYMMCcJZQbVcgY4T+Hc1ShFHP1qC09eOezqm1Fc/eOGEQRxGC/EHF++3UcX0
vdJil/vDE4/vuzWMPrria3cm5YRx8w==
=SQme
-----END PGP SIGNATURE-----

--+Ql+7nanYcuqCbVI--


