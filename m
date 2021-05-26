Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FAA392359
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:44:35 +0200 (CEST)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3CU-0000SO-IP
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lm3A1-0006Uw-Cw
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:42:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lm39q-0001L3-Bw
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622072507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=omBsOeG1Q0QGicz39tyAGRUazlpP3sm95dsfqwKX0LQ=;
 b=QOJJwUeuWQvB8CHJrCbSUZ0jx2oygblKkv8K27g5WHoBgufMdYeOo7Zc84B12SZyjalyrK
 +Nl+XRJwFIyG9YPtmAjd8AOPmCU61EDYCiWEMO2FNp89lTDM96KKzv7cYWFasMRbnXM77s
 8/BhP0iHvXpy4O4GpfYmPYihmZfDo/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-Iiz1koKZM7SkIaTK3S1m_g-1; Wed, 26 May 2021 19:41:42 -0400
X-MC-Unique: Iiz1koKZM7SkIaTK3S1m_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9743A1005D4E
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 23:41:41 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E61659479;
 Wed, 26 May 2021 23:41:34 +0000 (UTC)
Date: Wed, 26 May 2021 19:41:23 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH 1/1] tests/acceptance: change armbian archive to a faster
 host
Message-ID: <20210526234123.GA1727861@amachine.somewhere>
References: <20210526205601.263444-1-willianr@redhat.com>
 <20210526205601.263444-2-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526205601.263444-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 05:56:01PM -0300, Willian Rampazzo wrote:
> The current host for the image
> Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> (archive.armbian.com) is extremely slow in the last couple of weeks,
> making the job running the test
> tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bio=
nic_20_08
> for the first time when the image is not yet on GitLab cache, time out
> while the image is being downloaded.
>=20
> This changes the host to one faster, so new users with an empty cache
> are not impacted.
>=20
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 276a53f146..51c23b822c 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):
>          # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>          # As we expand it to 2 GiB we are safe.
> =20
> -        image_url =3D ('https://archive.armbian.com/orangepipc/archive/'
> +        image_url =3D ('https://armbian.systemonachip.net/'
> +                     'archive/orangepipc/archive/'

Hi Willian,

I was pretty annoyed by my pipeline failures, that I came up with:

   https://gitlab.com/cleber.gnu/qemu/-/commit/917b3e376e682e9c35c6f7f597ff=
ca110c719e13

To prove that it was a GitLab <-> archive.arbian.com issue.  But I
wonder:

 1. how susceptible to the same situation is this other mirror?
 2. how trustworthy is this mirror, say, stability wise? Maybe
    people in the armbian community would have some info?

Depending on the feedback we get about, this can be a very valid
hotfix/workaround indeed.  But the core issues we need to look into
are:

 a. applying a timeout when fetching assets.  If the asset fails to be
    fetched within the timeout, the test simply gets canceled.

 b. evaluate the use of the multiple "locations" support that the
    avocado.utils.asset library has (and improve it if necessary).

Anyway, thanks for looking into this, and let's wait a bit for
feedback.

- Cleber.

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCu3KEACgkQZX6NM6Xy
CfO4wBAAq9l3MwLVTu6VyUsbqfyVVYSsbGXDrWtGfgqIRMO7sKUzJPE94Aglw2q1
K0qFSCm/t8b4k2ohcKyXMIlqQYuzHsM33PArHKCPLO+A7iDDGLJ5GZk0ppn80siC
+I7RgYLcTwqEPOue8kTZBBjBjDRq6NSQBO5UPmnwIIQvAmL0YEeH7XtqlnAmB+H3
J6XCho8TrHUrjutSJ+FjgKfJmzBmrgEPIKrwZVCAV38Bx3k14VilL/BLW1zLrmqy
xVPfkFNeAEpfNOEjUxXkv21BGV8terYYnbrtyTBlDK43T6K4lG8yRvXlpH2u6c+f
8NUjxBiLmDMNeV+gWHbHXg2hBMY0Jw/kZZaEZbJlRNpFLFrVoQi6Pv/S/hAf7sz/
c7KnVYJXs8LVpAhjNSj7hyepQ4sTHHKLxCoRXaYn6Vz3mcFMk9gfQJeCIKGVFiCT
DGn/rIHDQsgxY3G8pJnQiRFz86Op0OdHv0xw4m4TMtnghRsFq+G/AoK98aDWFf0k
Uy2zS+iuKOZzGdu3O59TijUtylO9jdBZXoW/3cpcq9MutvGoIdtbBOeHFl9yBpx1
g0yFSVU0qlwAiuHeAuBLRuyl54ECuIxzwU/HzkfUe3vv09PnWW18+a8goqNaFL7W
l52TSFVvRlnoIsBKH9YqcRASPTapg61knGZ8hrMbiERY8eA0sx0=
=V34z
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--


