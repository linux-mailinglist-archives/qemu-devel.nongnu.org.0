Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A135B86A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 04:11:42 +0200 (CEST)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVm3A-0006ji-Vs
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 22:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVm1d-00069L-JY
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 22:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVm1a-0002k4-0M
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 22:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618193400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sP/2No3W/V5St1B1YyvAbYeHaQrWSyHusQskUjbCsxQ=;
 b=gUdtVe/tNYwpz90kthSB3ZWcVeKBLkVmj0GYlX2DzzAkQotbNZBVYM4NwfxqWTBKVHLSEy
 S8Bd3kblSoMTz6LjIL5mTr5PUWs9XP7OfsnZW735uUqwLDn5zLVMr1/eS02VGQJ8ud09aZ
 Az3kT5pUVdNs55cOzWF2dA9wo+b/d7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-CRG4gsWBNhifAc5PMQ8T5w-1; Sun, 11 Apr 2021 22:09:58 -0400
X-MC-Unique: CRG4gsWBNhifAc5PMQ8T5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3DFC81746B;
 Mon, 12 Apr 2021 02:09:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-37.rdu2.redhat.com
 [10.10.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA7C95D6D5;
 Mon, 12 Apr 2021 02:09:43 +0000 (UTC)
Date: Sun, 11 Apr 2021 22:09:40 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 03/10] Python: add utility function for retrieving
 port redirection
Message-ID: <YHOr5MEYzj1D/CMt@localhost.localdomain>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-4-crosa@redhat.com>
 <285df9a6-479f-dd27-f079-3acc6bdd0ea5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <285df9a6-479f-dd27-f079-3acc6bdd0ea5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZlO9e2yaOBnfnCl+"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZlO9e2yaOBnfnCl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 02:10:19PM -0400, John Snow wrote:
> On 3/23/21 6:15 PM, Cleber Rosa wrote:
> > Slightly different versions for the same utility code are currently
> > present on different locations.  This unifies them all, giving
> > preference to the version from virtiofs_submounts.py, because of the
> > last tweaks added to it.
> >=20
> > While at it, this adds a "qemu.utils" module to host the utility
> > function and a test.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > ---
> >   python/qemu/utils.py                     | 35 +++++++++++++++++++++++=
+
> >   tests/acceptance/info_usernet.py         | 29 ++++++++++++++++++++
> >   tests/acceptance/linux_ssh_mips_malta.py | 16 +++++------
> >   tests/acceptance/virtiofs_submounts.py   | 21 ++++----------
> >   tests/vm/basevm.py                       |  7 ++---
> >   5 files changed, 78 insertions(+), 30 deletions(-)
> >   create mode 100644 python/qemu/utils.py
> >   create mode 100644 tests/acceptance/info_usernet.py
> >=20
> > diff --git a/python/qemu/utils.py b/python/qemu/utils.py
> > new file mode 100644
> > index 0000000000..89a246ab30
> > --- /dev/null
> > +++ b/python/qemu/utils.py
> > @@ -0,0 +1,35 @@
> > +"""
> > +QEMU utility library
> > +
> > +This offers miscellaneous utility functions, which may not be easily
> > +distinguishable or numerous to be in their own module.
> > +"""
> > +
> > +# Copyright (C) 2021 Red Hat Inc.
> > +#
> > +# Authors:
> > +#  Cleber Rosa <crosa@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2.  Se=
e
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +import re
> > +from typing import Optional
> > +
> > +
> > +def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optiona=
l[int]:
> > +    """
> > +    Returns the port given to the hostfwd parameter via info usernet
> > +
> > +    :param info_usernet_output: output generated by hmp command "info =
usernet"
> > +    :param info_usernet_output: str
> > +    :return: the port number allocated by the hostfwd option
> > +    :rtype: int
>=20
> I think, unless you know something I don't, that I would prefer to keep t=
ype
> information in the "live" annotations where they can be checked against r=
ot.
>=20

No, that's a good point.  No need to have type information defined twice.

> > +    """
> > +    for line in info_usernet_output.split('\r\n'):
> > +        regex =3D r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.'
> > +        match =3D re.search(regex, line)
> > +        if match is not None:
> > +            return int(match[1])
> > +    return None
>=20
> I wonder if more guest-specific code doesn't belong elsewhere, but I don'=
t
> have a strong counter-suggestion, so I would probably ACK this for now.
>

There are multiple users of this pattern, and they go beyond the
acceptance tests, so I think unifying them is a bit more important
then having a better location.  Also, like you, I can't think, of a
better place at this time.

> (Are you okay with the idea that we won't include the utils module in the
> PyPI upload? I think I would like to avoid shipping something like this
> outside of our castle walls, but agree that having it in the common code
> area somewhere for our own use is good.)
>

At this time I don't have a need for it in the PyPI upload, but I
wonder if this exception is justified.  I mean, what would be gained,
besides dealing with the exception itself, by not including it?

Thanks for the feedback!
- Cleber

--ZlO9e2yaOBnfnCl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBzq+EACgkQZX6NM6Xy
CfNt2Q//eUrEdFqQDut/uuxST1Fwg3LlqwDM1qzVCitSuVXVNcra1VWYGEjb+H+P
7jOpZwiYhiggyjo9T+h1aZJR/cW03+GQaOyi/gPp5t8ZMYHP3VcSyk8I10/eHdL6
n86m4Q7Iiy9/90rPl2pvNDct8s2aBhRwf5uG3GaR5AVzY9V1Kq5Xb8E9am0DOiqV
rIfU+VUej6nziky0baLczPqpmA2xrHjUq974KBoFh0qJRi4DZNxMDwCGUcQXwrZl
cnozSKm8H1vvVyFL4rTP192SsGCvbtttdGEnEEwsvZMq2nq/REzvWdSRQFhpj4Ku
iBhmYVRSvXMJ9TIU4bVCdrqzrUc43lNh23u8OdMHbhJVyB+vV11HSmadBXNWjP53
Bc6Nffyv26dYdoBeRRqr8ZX85eWLm4niEYh6iBGUpRkbIMg/L22rMQywm40ai/to
9cO091PFmvan93u59kZhu4cuOUa+re2imK/9hmpowe6F2VkOn58/1qbmC8nTcoUA
0HtNlSocPlNEck52eBaLLQqF6vfjQvcoQZ+gHl3B5TzL/u/D2c9c+25R+Wmv/kfq
PSNQBvkSwDSuxh0/v9cySgbHVgYk/rlrdv8BuHH+kI3ENyYV4u3Ia/v77CElnBom
yUOYKjkb8hEQ3Ex82FPQv1ePcLmcsoc6+DT3HhKbM8bNeCdXpMg=
=2YzM
-----END PGP SIGNATURE-----

--ZlO9e2yaOBnfnCl+--


