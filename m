Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCF4851A0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:09:21 +0100 (CET)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n54AS-0001Yg-0A
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n548H-00006I-PT
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n548G-0001SL-CV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641380823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=upVTfo0AeCZS5QDp97HCVnNdSTvivtQOoACEXl1XuaQ=;
 b=QlU3Ga9WWJAkuxUKWzRfv9X48XxWsFlGVk986v0JMM0Elj/+iseEfHMArK0iGCNy7/1/jE
 uQ+FA513z2GOVjUnkTHoHtGiYLaJxRw4O1u0uFnpZS21aKdo1WdRfrbpqlJakJ6HhxSjkT
 DwqdFSlHtWxMenRHuZc0DSpgChj+A0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-JWcVIcWnO0qXpGb5ZWgS4g-1; Wed, 05 Jan 2022 06:07:00 -0500
X-MC-Unique: JWcVIcWnO0qXpGb5ZWgS4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DDE510151E4;
 Wed,  5 Jan 2022 11:06:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4480E7AD1C;
 Wed,  5 Jan 2022 11:06:36 +0000 (UTC)
Date: Wed, 5 Jan 2022 11:06:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [RFC 4/5] libvhost-user: prevent over-running max RAM slots
Message-ID: <YdV7unSQACBuniBi@stefanha-x1.localdomain>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-5-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20211215222939.24738-5-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5znFJsUPVeFbsjAq"
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

--5znFJsUPVeFbsjAq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:29:54PM +0000, Raphael Norwitz wrote:
> When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
> libvhost-user, no guardrails were added to protect against QEMU
> attempting to hot-add too many RAM slots to a VM with a libvhost-user
> based backed attached.
>=20
> This change adds the missing error handling by introducing a check on
> the number of RAM slots the device has available before proceeding to
> process the VHOST_USER_ADD_MEM_REG message.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 714cc7e08b..74a9980194 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -690,6 +690,11 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
>      void *mmap_addr;
> =20
> +    if (dev->nregions =3D=3D VHOST_USER_MAX_RAM_SLOTS) {
> +        vu_panic(dev, "No free ram slots available");
> +        return true;

return false

Stefan

--5znFJsUPVeFbsjAq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVe7oACgkQnKSrs4Gr
c8g+7wgAlaP0/zdbC8c04PGh8EF4Epdhv+AhNZnVEfDT2gOJinNl0VBzmu1FFFgD
Jau85n4CDjHMigrtj8m7Wo6e3FhgHTokAEZ4ksQSTFFYUsPKwcQAnc+I2Lgvb3JS
xx/X6nA08+rKn4Q/TMWNOXk1G00FH/Y/M1npkct5DtQZWS74Apfci9wtnfjctqa3
JjZYvnD88U+fWgoJ6P/upaTAktK0pDNcqJM7lRyuEKU5cO+TeIs/p3+cCOehcRu5
VG6nTOXTW9oALI3cg+mk5mB8dAp6QYx42tmt/DgGfeGcGfVvsK8U7PylWzls4QYQ
3It6keAKkFHHOJUkB8o/pm/tXfVUmQ==
=RfjX
-----END PGP SIGNATURE-----

--5znFJsUPVeFbsjAq--


