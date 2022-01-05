Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5C485193
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:04:41 +0100 (CET)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n545w-0005cB-Gh
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:04:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5438-0004IL-7n
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5434-0004KZ-7C
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641380491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHrRPJvUHGgTqaeeCfTGfHIU1KHODGOoimDaCzqZRow=;
 b=hTowi+g0gmiD8mujeVk1TRVg/POcOELiqkUscLkna3M8LVeO1fZfpVuNRb8lNDRRULYexl
 qdpEx71ZQNx5lxt7uqf+WWLiqwk9FSDT4GaE3+jRLCcyt99MRo0yASQ4LZCh9Te9nE2RzE
 ZfDHCHomdjr8rbSuspOKmm/30YmpHTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-MsoXNxmyM2O_8v9jXyvjZA-1; Wed, 05 Jan 2022 06:01:28 -0500
X-MC-Unique: MsoXNxmyM2O_8v9jXyvjZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74151824FB0;
 Wed,  5 Jan 2022 11:01:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CBBE1079F4D;
 Wed,  5 Jan 2022 11:00:36 +0000 (UTC)
Date: Wed, 5 Jan 2022 11:00:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [RFC 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Message-ID: <YdV6U/7Lna/rRvVo@stefanha-x1.localdomain>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-2-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20211215222939.24738-2-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uBiWE6k92EdcxiP3"
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

--uBiWE6k92EdcxiP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:29:48PM +0000, Raphael Norwitz wrote:
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 787f4d2d4f..573212a83b 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
>      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region=
 =3D &m;
> =20
> +    if (vmsg->fd_num !=3D 1 ||
> +        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions"=
);
> +        return true;

Most vu_panic() callers return false to indicate that a reply does not
need to be sent. When the return value is true vu_dispatch() sends a
response, which we don't want.

Note that vu_dispatch() returns true (success) when the message handler
function returns false. The success/failure behavior should probably be
separated from the reply_requested behavior :(.

Anyway, returning false is probably appropriate here.

Stefan

--uBiWE6k92EdcxiP3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVelMACgkQnKSrs4Gr
c8jseQf8DXqcfHU8xT4gaysTRoVTgkfUmNPPCZfvgzwyMKUrZOD9Zw7UhyOaD2Ov
/gO8pmyyaM8q+ltauTNijnd4DWxsFGZMBI+/+ZQh3BdX+/ZcFNdFz3pTopEvshR2
ht+80qEM/4CpbFzD8atmJ7HZ4qmIg1ruCKfwL4qmlfgsrdq3PkNRGbULe/hkPzF5
1c2O8Q79QIa6TJL7JS3zYR4kEn1OHjKDlGxYC6viVPD1Y2eo+9PPnCCM53WaX7PF
zXTWuZZheRyxDDM0pEkSNd6MJ+RrTC9zpIHEjvbBsFPvhM2kcEEYi+BMI1+XiPhz
CAG/zF7ftERWnM9wPODLBkjvOD38Tg==
=kimc
-----END PGP SIGNATURE-----

--uBiWE6k92EdcxiP3--


