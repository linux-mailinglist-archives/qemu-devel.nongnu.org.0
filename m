Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203635B8C8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 05:03:14 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVmr3-0000GN-9E
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 23:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVmo3-00082t-L9
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 23:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVmo0-0004Ww-5b
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 23:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618196402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZoCGsmai2+oDDRuOO1+to5d/z5EVTPDJECKkYXEZ4C0=;
 b=KCBxySuHYvT6tdW00tLBCmEd3STjnrB25COIdLAeukbXjIPkh5Tb6iL2k1KJh9VZVp+ID4
 O4k2A89YKdK/nTOe9gpeklY2sRzg35LQHxhbHuBvSSW/I+iVtm0ErCYT1NteWpwHXFW/cP
 YFLpPEN7vnQrktGicBuTqIeyv/iPvxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-shss4yLcOS-04CJPw1qPOQ-1; Sun, 11 Apr 2021 22:59:58 -0400
X-MC-Unique: shss4yLcOS-04CJPw1qPOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF63A87A826;
 Mon, 12 Apr 2021 02:59:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-37.rdu2.redhat.com
 [10.10.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD221A49B;
 Mon, 12 Apr 2021 02:59:45 +0000 (UTC)
Date: Sun, 11 Apr 2021 22:59:43 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 09/10] Acceptance Tests: add basic documentation on
 LinuxTest base class
Message-ID: <YHO3n4YQzAf8OV0L@localhost.localdomain>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-10-crosa@redhat.com>
 <39066db3-7815-fb8e-eace-f31f74392e8a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <39066db3-7815-fb8e-eace-f31f74392e8a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n0nw8gTNXWeBkGCJ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--n0nw8gTNXWeBkGCJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 03:14:58PM -0300, Wainer dos Santos Moschetta wrote=
:
> Hi,
>=20
> On 3/23/21 7:15 PM, Cleber Rosa wrote:
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >   docs/devel/testing.rst | 25 +++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> >=20
> > diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> > index 1da4c4e4c4..ed2a06db28 100644
> > --- a/docs/devel/testing.rst
> > +++ b/docs/devel/testing.rst
> > @@ -810,6 +810,31 @@ and hypothetical example follows:
> >   At test "tear down", ``avocado_qemu.Test`` handles all the QEMUMachin=
es
> >   shutdown.
> > +The ``avocado_qemu.LinuxTest`` base test class
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The ``avocado_qemu.LinuxTest`` is further specialization of the
> > +``avocado_qemu.Test`` class, so it contains all the characteristics of
> > +the later plus some extra features.
> > +
> > +First of all, this base class is intended for tests that need to
> > +interact with a fully booted and operational Linux guest.  The most
> > +basic example looks like this:
>=20
> I think it is worth mentioning currently it will boot a Fedora 31 cloud-i=
nit
> image.
>

Sure, makes sense.

Thanks!
- Cleber.

--n0nw8gTNXWeBkGCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBzt50ACgkQZX6NM6Xy
CfOSUQ/+OHdKAqaW/IqnU00EM8nA6+I+VtPGHml7BL+Q06zgaPOI+d7XihMpUWlh
rWy0VFCpw3vSra0GbPFjGXLAxGbZ378QL6hT9LY3hyUijqhFznt53oSyanPQ94y5
FcNv435XOKjPsYXmdu9Q0CDxUyFxHKSIwbo5cXEJt8p7uxdVQzguIis4Xy8HFL7A
m3SLv8G7+I4rEw10xBmO+5ic25X1XXaZh4X4YhhFmwlXdUS7B7DEuyrSM7GqOEpO
Yn7hboWLZbrmz4rOv3G+jmVQO4IGspEWt+ogpjdgCdTzstEuOPI7hn0c3Gv/Xp8m
GqjQ6T0EP+bet7Zj1ctuvHlfEpwYg+fH/2hjKCE0Qo7gG12pyn9T3E8krJzZgRJ6
HKXItncOOTOSUgDl2vEFo1CLxmlLoFMdZG5HZP/HDpixF2hrOxv2oaGCR9bsqB81
O8lq+oOERNP4LLF/M/Lhs2pJ/gQG7qRxgfrTQTdUgoX0/ygGNcMkFLKvUaKyDKpI
WufbDYHY0T4bBk1Xgls9I1lh+hDDzjtxx1mdRk2h7ZUzr7bYDQsQKBEuc7KdJC6I
L15Rbk+VF1VU40g7Ag29S68SkbgDkGhGNvvlspd3wHpJ4BiG1JZqpoA5PEqaRuwU
tXLlpvVtAV0w3VwM4vITGZiv1LDpAuk3A9oBKC76lokXRW/w0Pk=
=0FYP
-----END PGP SIGNATURE-----

--n0nw8gTNXWeBkGCJ--


