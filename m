Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0931C482
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:08:42 +0100 (CET)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBnuz-0004XV-LP
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBntb-0003ng-Ci
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:07:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBntZ-0002y8-JJ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:07:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613434032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JjJTrFztBZHglYAGxt4bGpVEYDYka4G6la4QVQ6F1R4=;
 b=PRTgjuZagXvuaC/+2s2QgXIDHYasUIP5NetQ4rtPGzSuTVJcVGXBMklhINOdf+FCQUKmgD
 qJxRh7IWLZVTw679S1rRiym6lwe8fZqcJy9MY2oWWUXYYbhDILh0TI52KWCh2ptEdWRIGa
 f/4/+nk7N6COia/4gHnQWjMFf52oLrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-NsfE6t00M2-W0_o8B__f3g-1; Mon, 15 Feb 2021 19:07:07 -0500
X-MC-Unique: NsfE6t00M2-W0_o8B__f3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45172192AB79;
 Tue, 16 Feb 2021 00:07:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36BB8614ED;
 Tue, 16 Feb 2021 00:07:00 +0000 (UTC)
Date: Mon, 15 Feb 2021 19:06:58 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
Message-ID: <20210216000658.GB117147@localhost.localdomain>
References: <20210212151649.252440-1-mreitz@redhat.com>
 <20210212185814.GA2653579@localhost.localdomain>
 <16a72cc1-1c92-287d-d4ad-043b425d3414@redhat.com>
MIME-Version: 1.0
In-Reply-To: <16a72cc1-1c92-287d-d4ad-043b425d3414@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 09:42:24PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Cleber,
> >=20
> > Hi Max,
> >=20
> > This looks good to me, and I've also tested your kernel build and
> > works like a charm.
> >=20
> > As further work on top of this, it may be beneficial to have test
> > documentation in a predictable place.  The possibilities that come to
> > my mind:
> >=20
> >  * docs/devel/testing.rst
> >  * tests/acceptance/$test_file.py/data/README
> >=20
> > On a different topic, the "https://avocado-project.org/data/assets" has
> > enough bandwidth and can be used to hold this type asset.
>=20
> Can you define "this type asset" please?
>

Hi Phil,

Well, in this case I meant kernel/initrd builds, filesystem images, or
any other file that is used in such a test.  But, I guess anything
generated from purely free software, with instructions on how to
reproduce it would be OK.  The filesystem images there, for instance,
are generated by Avocado-VT unattended install tests.

Besides this server, there's another one that is being prepared,
provided by the fosshost that could be used for that sole purpose, and
be more closely attached to the QEMU project.

Anyway, just an idea...

Regards,
- Cleber.

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArDJ8ACgkQZX6NM6Xy
CfPtmw//Shy/GodJRPSlYvwuLLvK8RMjiocbaOTkj+r9kNcppVO60SDeJjCuA25D
u5v/aBzMOth70726PNqhbvHQdaPgJ0S8DgzRD1asR/nSQCTvSSKRAwvbQ4ED8m/R
2w+dNJ9E/8qh2QreEcwGqp7TZqzReO0PmTp0VfsghJxveNgJEV/v1XmBD6L+VxtV
3AHpWuLgH488iFP2jcvQJqCwDROItJiVcXfv5IlmIYu4aT12CKeM+jNFSI0jVOHk
cLI9t6idL2B4Tv+1iZ3amXzsoWAKZYnVHUbkFJYzz7kNgtwxXhbDWnOIOgTVHPqt
ohnaDUg4E6BtpeaVgx+NeNJCgNFwR4SZwBWmhq33BAlXV7s99/arg8M67CDBxybV
i+a7Sm1F46RMaezUK8cuR823RHyGn+K3SaM0Wk7euqIhnhKlVVTZa32aFYJ5xDfn
YBYR8HwEPYa9d4qQL2ctC/e2JUqWHJNvfBwPJAc9JudPqVRy5ik0il6y77rTpH7e
JA8XMjyz0YHWajFYdP35Nai/Byp8a5ednktKeUdYeuBK4A+XXGPD+eDLtOARC+gq
XDBqui0ekThhdEVQakRZbnFmGaG3cDEJn02WOQ0bxGgOvyYIH+Pxg+qrVVWgYmdR
vXzszWV7dJTXpI0vRdG8XVM9ZQvZwYlZYDetdO4VLt4aGOeLGlI=
=T3N3
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--


