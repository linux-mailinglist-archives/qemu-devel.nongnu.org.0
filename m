Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31C2B033B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:59:25 +0100 (CET)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdAK4-0000Qq-W3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kdAJ2-0007wi-JK
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kdAJ0-0007nn-PO
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605178697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MW27wajRN5g2s1gZBx0wxEYNNhcRzUFxrZCRZslf4bY=;
 b=LkVjyEAEPvJ07ZccdCgzh9LB7Jh4ZzP0Pb8/gYxirvxvSkYX1tjotubeidKV3117zsFYwr
 ZmaTi2QDdf1Etz38XARyIWC6fdm6q/xDS8P7hNiYh8J2KIBp31Vdie5ArztKxq5ZjiFZ2L
 +CBSNQw34rUotszU0zMycyUjazEQcE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Wcwy4qjbN0qtExGjLj3Iyw-1; Thu, 12 Nov 2020 05:58:13 -0500
X-MC-Unique: Wcwy4qjbN0qtExGjLj3Iyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 196211891E87;
 Thu, 12 Nov 2020 10:58:12 +0000 (UTC)
Received: from localhost (ovpn-115-122.ams2.redhat.com [10.36.115.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A823D10013C0;
 Thu, 12 Nov 2020 10:58:08 +0000 (UTC)
Date: Thu, 12 Nov 2020 10:58:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] meson: move vhost_user_blk_server to meson.build
Message-ID: <20201112105807.GA1445788@stefanha-x1.localdomain>
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-2-stefanha@redhat.com>
 <ad4be626-c950-6131-adc3-369f9a405ad4@redhat.com>
 <d064bee7-7a46-761b-97e2-71df8fba6bab@redhat.com>
 <c23c7d03-4165-bf11-e730-ffcc53ebd718@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c23c7d03-4165-bf11-e730-ffcc53ebd718@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 12:54:38PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 11/11/20 12:44 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 11/11/20 10:41 AM, Philippe Mathieu-Daud=E9 wrote:
> >> On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
> >>> The --enable/disable-vhost-user-blk-server options were implemented i=
n
> >>> ./configure. There has been confusion about them and part of the prob=
lem
> >>> is that the shell syntax used for setting the default value is not ea=
sy
> >>> to read. Move the option over to meson where the conditions are easie=
r
> >>> to understand:
> >>>
> >>>   have_vhost_user_blk_server =3D (targetos =3D=3D 'linux')
> >>>
> >>>   if get_option('vhost_user_blk_server').enabled()
> >>>       if targetos !=3D 'linux'
> >>>           error('vhost_user_blk_server requires linux')
> >>>       endif
> >>>   elif get_option('vhost_user_blk_server').disabled() or not have_sys=
tem
> >>>       have_vhost_user_blk_server =3D false
> >>>   endif
> >>
> >> Something is odd:
> >>
> >> $ ../configure --disable-system --enable-vhost-user-blk-server
> >=20
> > I failed when pasting, this misses '--disable-tools' to make sense.
> >=20
> > We define in meson.build:
> >=20
> >   have_block =3D have_system or have_tools
> >=20
> > Maybe this is the one you want instead of have_system?
>=20
> This snippet seems to fix:
>=20
> -- >8 --
> --- a/meson.build
> +++ b/meson.build
> @@ -751,6 +751,10 @@
>=20
>  has_statx =3D cc.links(statx_test)
>=20
> +if 'CONFIG_VHOST_USER' in config_host and not (have_system or have_tools=
)
> +    error('vhost-user does not make sense without system or tools
> support enabled')
> +endif
> +
>  have_vhost_user_blk_server =3D (targetos =3D=3D 'linux' and
>      'CONFIG_VHOST_USER' in config_host)
>=20
> ---
>=20
> $ ../configure --disable-system --enable-vhost-user-blk-server
> ../source/qemu/meson.build:755:4: ERROR: Problem encountered: vhost-user
> does not make sense without system or tools support enabled
>=20
> I'll send a patch.

This patch was discussed in "[PATCH-for-5.2 v2 0/4] vhost-user: Fix
./configure confusion". We agreed to drop it for now because it breaks
Linux ./configure --disable-system --disable-tools.

This patch series is fine as it is.

Stefan

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+tFT8ACgkQnKSrs4Gr
c8ghPwf/dHtID5wuMQfCoya3OZFAPvK5csqkm+gyfJ6SYNs+jQCcoMArUbDD0ANI
vIgUTB2FXvJQxbYrHsoGSj+D+kyBPIkGIuKsY4+KOGoTYIh4iFyWUWbTjp830RTK
o19SfsklHz+935IA47Kfo1YFtLfMtMXnJF2T+taUl9Hsjflo2xVRZwH1mfqN61tn
6pgASshxKwcqtV8uLOaRsnqLOYB1Rrcj6fQUg5ZPFoUd+i0L8n6Pyfx79BGKS1iN
tnix4o4FGtVrEtruGbf0Ac0TY0Gzw+LI2peAPWKeP1jU7sP2KNYAv7LOePODTA6F
REKsxfAO+s+/Z7aUfKT/P+Nh1uuD5w==
=FfYM
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


