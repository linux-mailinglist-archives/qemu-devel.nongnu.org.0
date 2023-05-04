Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC176F7179
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:49:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pud4K-0000Zl-3m; Thu, 04 May 2023 13:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pud46-0000Rf-HJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pud44-0002Jy-RF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683222503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l3ZcPZN4eiCe7IXv9c2X06udaJ+EUyclvOj/OgOY0xQ=;
 b=U1tVgSrUTaEhCLLwL/jBQ6rEjP6qxdC866F2jFfBFKMX7wllnEraedxS4PtsG3YZmo30Zc
 yMByFheCDnEfZ49LgINOClvSA8cOmRGcguM4gImjDGB/1bLhsgnzeqRH0iXVDMH5KgSCL2
 xFhSxBtdlSOrFD7AGZCE/Y9S54jPgXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-EO1oXrGROhm1U1bSzA9MeA-1; Thu, 04 May 2023 13:48:20 -0400
X-MC-Unique: EO1oXrGROhm1U1bSzA9MeA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0181228135AA;
 Thu,  4 May 2023 17:48:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B69E492C13;
 Thu,  4 May 2023 17:48:18 +0000 (UTC)
Date: Thu, 4 May 2023 13:48:17 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
Message-ID: <20230504174816.GA581920@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3YnFuDkKePUTc17q"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--3YnFuDkKePUTc17q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:27AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> I wanted to use simpletrace.py for an internal project, so I tried to upd=
ate
> and polish the code. Some of the commits resolve specific issues, while s=
ome
> are more subjective.

An internal project based on qemu.git or a completely separate codebase?

Sometimes I've wondered whether tracetool should be extracted from
qemu.git and moved into its own QEMU-independent place. That way other
C/C++ applications and libraries could use it easily.

Now that Alex Bennee removed the vcpu trace events that were specific to
QEMU, the tracing code is less tightly coupled to QEMU. There are
probably still a number of places that need to be cleaned up in order
for the tracing code to be independent of QEMU though.

If there is interest in doing this, I support the effort, although I'm
not sure how much time I have to actually do the work myself.

>=20
> I've tried to divide it into commits so we can discuss the
> individual changes, and I'm ready to pull things out, if it isn't needed.
>=20
> v2:
>  * Added myself as maintainer of simpletrace.py
>  * Improve docstring on `process`
>  * Changed call to `process` in scripts/analyse-locks-simpletrace.py to r=
eflect new argument types
>  * Replaced `iteritems()` with `items()` in scripts/analyse-locks-simplet=
race.py to support Python 3
>=20
> Mads Ynddal (12):
>   simpletrace: Improve parsing of sys.argv; fix files never closed.
>   simpletrace: Annotate magic constants from QEMU code
>   simpletrace: changed naming of edict and idtoname to improve
>     readability
>   simpletrace: update code for Python 3.11
>   simpletrace: Changed Analyzer class to become context-manager
>   simpletrace: Simplify construction of tracing methods
>   simpletrace: Improved error handling on struct unpack
>   simpletrace: define exception and add handling
>   simpletrace: Refactor to separate responsibilities
>   MAINTAINERS: add maintainer of simpletrace.py
>   scripts/analyse-locks-simpletrace.py: changed iteritems() to items()
>   scripts/analyse-locks-simpletrace.py: reflect changes to process in
>     simpletrace.py
>=20
>  MAINTAINERS                          |   8 +-
>  scripts/analyse-locks-simpletrace.py |   5 +-
>  scripts/simpletrace.py               | 307 ++++++++++++---------------
>  3 files changed, 150 insertions(+), 170 deletions(-)
>=20
> --=20
> 2.38.1
>=20

--3YnFuDkKePUTc17q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRT7+AACgkQnKSrs4Gr
c8hkCAf/YGkhB7A2RiHvNwLI4rBlSgzto2/Y6CvLR47tMXruNQAx0XvvsEX/H/CF
PwdQQSP8moxHaHoAlrrZb7sCg/XCb1Fyu9xUNpgunzq30tePJgPR50ipKi18uyhN
kS1gmzAlNoaj6uqe2TRsAfbKXC/JZt/VemLO44c5ZRyGfPtQ7daMMRoO7Axtqhym
LMb8sqFHhykoYKdN0gfM93lkweitzTF26uBlKQteThZo7CeadtTf62B7WLY0qN+d
YKCe2Z7Une/EACEg22UF+iEj9GwFPpMg0AzI1ZIRI715Ijc1zkl7fmQy3Im6kzF7
IMZv21/ncyKEU+VyxXdo4jjLBQ2GyQ==
=f3Wl
-----END PGP SIGNATURE-----

--3YnFuDkKePUTc17q--


