Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E914B136
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 09:59:12 +0100 (CET)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwMiF-0003NO-JS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 03:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iwMhU-0002yx-IA
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 03:58:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iwMhT-0001dk-2N
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 03:58:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33337
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iwMhS-0001cv-VK
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 03:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580201902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8WCmC+dPCZF4iHALUmhMlbgRSu/RdakcvsV7KuWmSs=;
 b=Nl7g049dBYGLAXcsqCepqbXz81VRtpC7Y8eXucNvyKecTdQQbP+kL7gjYpM2CsQ6Rg9en/
 b2Z83aA3gVYJxkFuLfU+Z79F1kDUC8y3XaayrwJd0jMH0HCBjdts80cFWnT2vKQpEOhCc6
 V+HtllaVVRTN400a/JfWmvtbDMgQ/D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-g1UZvYwmOveYMl666xH50g-1; Tue, 28 Jan 2020 03:58:18 -0500
X-MC-Unique: g1UZvYwmOveYMl666xH50g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 751CA800D48;
 Tue, 28 Jan 2020 08:58:17 +0000 (UTC)
Received: from localhost (unknown [10.33.36.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E7B8887E;
 Tue, 28 Jan 2020 08:58:16 +0000 (UTC)
Date: Tue, 28 Jan 2020 09:58:15 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Subject: Re: [PATCH 3/4] Introduce the NVMM impl
Message-ID: <20200128085815.axafwl6hkpixdzwj@dritchie>
References: <20200107125401.18126-1-n54@gmx.com>
 <20200107125401.18126-4-n54@gmx.com>
MIME-Version: 1.0
In-Reply-To: <20200107125401.18126-4-n54@gmx.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6tohhdrqx5og56bd"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Maxime Villard <max@m00nbsd.net>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6tohhdrqx5og56bd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 01:54:00PM +0100, Kamil Rytarowski wrote:
> From: Maxime Villard <max@m00nbsd.net>
>=20
> Implements the NetBSD Virtual Machine Monitor (NVMM) target. Which
> acts as a hypervisor accelerator for QEMU on the NetBSD platform. This en=
ables
> QEMU much greater speed over the emulated x86_64 path's that are taken on
> NetBSD today.
>=20
> Signed-off-by: Maxime Villard <max@m00nbsd.net>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  target/i386/Makefile.objs |    1 +
>  target/i386/nvmm-all.c    | 1222 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 1223 insertions(+)
>  create mode 100644 target/i386/nvmm-all.c

Reviewed-by: Sergio Lopez <slp@redhat.com>

--6tohhdrqx5og56bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl4v96YACgkQ9GknjS8M
AjWfpg//ZFBD3B8GIBB5CQuhNmCJ/yP3ropJ74pezSF95rPjXBJMcGNIuZrJ1iez
yYjOTYkpYtgqfJFWwL+xIvkJoD8A4wVCs4S/VBRLhoyZJToSrOgNayjLZ0mx5Ubd
N4K/apYgGR6uv8Oan9G2/7+5bHrXrSeEsMfYJMSAuHuDQsj9SvsKoYRIba6dd0Il
zFSSN3L2ouvtwifatwDpaVZq/fZspSkg9rsCndqF67CyZPEogNDg6+A1Yz3c+TMI
ib/X/Vz98wLAmGLdsqZ3r91CHg4wTbZGT01nymwjCVp4sAQ8c3IfZhnYJL5jqzsE
hvypSJDSSOiSI2IpZArs8em+Q8fz3spA81YkUf40UGs2RDw0fOUO+FqD5Zf0iAKS
xzW+N8cj2Mv6NGqeSny5M1spBFqzob6vc0mxdLmZQluL+dchDI/8ZAzsFMYRgsui
7ByXiUzt3R8yGe3e5t3g2i1Wnmw/caPsk7DSPD46ru3USUNmtJRLPUq/QFyB5EBT
d/uDb81wd9WPD1lVFO9k1OwQbHZbGHJrwkDa1FoLDUxfkNEtqnm3WWx667HV/TbX
eBXCmheDHz+6C1sapNTJDf+gPl2nk3WeF1MQsM+r9XoAXFRa6mpTlWEZBC6dn0bv
mv0zMLyeqDmRdbsN7/IaRlCUsJdy95gwxqEUNLYx+pGpDQ5X0gY=
=gZJG
-----END PGP SIGNATURE-----

--6tohhdrqx5og56bd--


