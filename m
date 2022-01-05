Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A50485199
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:06:07 +0100 (CET)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n547L-0006c0-2b
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:06:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5453-0005FM-Ut
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n544x-0004uV-8P
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641380618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4gv6OLeRcKhdm2aqTSAMoR/dNHwUrstCh00G8skNZcY=;
 b=djHmQitytBk1M5YIrZY9CXkgFSZgGIpoofLaUqLK7L80c6OPC3mhaq9sDFmCLo2iqw4npS
 AUXGNL7Al7BYrDRzXnhcPKlXxGOL5r8xsYZjRpEVzRPvHvcgBGjonO4p5UfrNKeaKtRL9i
 t6iixKl14V9Q5X4fsSuxyHB9r7MUdIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-6b4NWyHRO8WWr2Z5VQFZaw-1; Wed, 05 Jan 2022 06:03:35 -0500
X-MC-Unique: 6b4NWyHRO8WWr2Z5VQFZaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A92B1898291;
 Wed,  5 Jan 2022 11:03:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD2B708D2;
 Wed,  5 Jan 2022 11:02:59 +0000 (UTC)
Date: Wed, 5 Jan 2022 11:02:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [RFC 2/5] libvhost-user: Add vu_add_mem_reg input validation
Message-ID: <YdV64lLf/ge46Q8k@stefanha-x1.localdomain>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-3-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20211215222939.24738-3-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B3bH969EFXWOVp56"
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

--B3bH969EFXWOVp56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:29:51PM +0000, Raphael Norwitz wrote:
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 573212a83b..80ef335254 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -690,6 +690,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
>      void *mmap_addr;
> =20
> +    if (vmsg->fd_num !=3D 1 ||
> +        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions"=
);
> +        return true;

return false - we don't want a reply to be sent.

Stefan

--B3bH969EFXWOVp56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVeuIACgkQnKSrs4Gr
c8g5JQgAi7x5ylqEJEBgZQX9QifRttDkrMon/dO6fmdA+ju8/9bVjCZOfb+PsQYU
5Rirban10jsPi37Pe0uBZtgwPCQ6oYsJ7Dr2fUZEZKGV71g+MkKM2k5W+Ye8IiNf
fpHpA01V330DOtdc+vAEfkw2XhQnA4xdo7XsuwrFQhEmI3WTiI1yVdXfTHzxFD9r
hqa0jPQnO4TYHIcdLeV/FYdn7BD/ETM/fyJQRnYBWySfysH1qKg6rl7rtwRwbMff
pXzt3exsGEWP1KNIQX8v/5+Mi8Z9CulM6mtz80bUxLb+J1dioJZ7brFCU0vWyFX4
z+IR6XoQYV1sA3IfyVTPkFRCRKcCCw==
=sRij
-----END PGP SIGNATURE-----

--B3bH969EFXWOVp56--


