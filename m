Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE558C9CE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:54:59 +0200 (CEST)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3De-0000rP-KY
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3Bb-00056c-Oz
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3BZ-00038J-VR
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659966769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WgLPlxxklWvfNvOGDiPgBoupAcKOxgCnw0Rzkk9unfI=;
 b=NtDYlyEftTaVqwxP8JVmfuStuZ9bG8Aj7Kdm7G5NnhSg8MNtkLxVtTdirudUahExLx0Ttq
 wddoFCRrqkYKor8zsB5+mZUEKzooSmuaOa/w2yM0zGzTMbB9Y1c2HluK+ytaZrjG1ElvhP
 YW7gNPMffoT4WJfKiukWC/AVt9RFOlc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-DJHz0dHKMEyzNYfeSBMoxA-1; Mon, 08 Aug 2022 09:52:46 -0400
X-MC-Unique: DJHz0dHKMEyzNYfeSBMoxA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 828948026BA;
 Mon,  8 Aug 2022 13:52:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 027E8492C3B;
 Mon,  8 Aug 2022 13:52:44 +0000 (UTC)
Date: Sat, 6 Aug 2022 08:29:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hare@suse.de,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v6 2/8] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
Message-ID: <Yu5eprPN7WrJFvuy@fedora>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XkNWhwW8RPjtKge3"
Content-Disposition: inline
In-Reply-To: <20220805075751.77499-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XkNWhwW8RPjtKge3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 03:57:45PM +0800, Sam Li wrote:
> Use sysfs attribute files to get the long value of zoned device
> information.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/file-posix.c | 37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..a40eab64a2 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1210,29 +1210,27 @@ static int hdev_get_max_hw_transfer(int fd, struc=
t stat *st)
>  #endif
>  }
> =20
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.
> + */
> +static long get_sysfs_long_val(int fd, struct stat *st,
> +                               const char *attribute) {

Is the fd argument used or can it be removed?

Other than that:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--XkNWhwW8RPjtKge3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLuXqYACgkQnKSrs4Gr
c8jaBwf/frNQCYCOY/kKaI9nuVeSm+EjlOm5rLwoE2XMyiO4cHC1RkClSMXXA/kk
2I11YWusM0RQur4ufW6g91QsDedtR1KIEdbnRsBAwBk+QcgCT1hekJwUu4q3nj9c
U/HkuZ1FXue+j+sph4qBGo9/aTV5CfQ3Qize0c2MRY9Ed93m2xx4n/g+2dLjNI4I
k3Lf/fV4EkB653He7D+eM8Sko9+DBb+3ehcRjuaUKxdwCmvxnxYMHWvyY+Qq1Olt
tYstyPZo2Sl13/srVf2/NA28AsmSTa4gAPoBEO/VQmKxRIGMiyXTazRCK/LFB2VY
XK63xETTcxnhTX0v4Ky+11dU79c8bQ==
=dXJz
-----END PGP SIGNATURE-----

--XkNWhwW8RPjtKge3--


