Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2D2F5DC8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:38:12 +0100 (CET)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzz51-0004mY-5B
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzz0a-0002G9-AB
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzz0Y-0000GP-Fy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610616813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nt3BWecWWWTmQdgntxMqFEoI322d5ciIBephV3tjMaE=;
 b=NU0MWjpcMhzsnpEvG2A/GFgATMNu4y3Asn7KKjXxpv79py7jVLxqOAsYBYS1fJX8GUa68P
 ue3n7gNJwNG8ebLxJ53edUzdQ6tsIRWltuEMKWwOo4XnFq78CXm6nkZCoBqxlEgm7QbRk6
 B62QffZW1MEz9+D9l9RhcdpKgsX9OSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-xgj7iRugPd6c5rWchs3qmw-1; Thu, 14 Jan 2021 04:33:29 -0500
X-MC-Unique: xgj7iRugPd6c5rWchs3qmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE27190A7A1;
 Thu, 14 Jan 2021 09:33:28 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 404FC10016FF;
 Thu, 14 Jan 2021 09:33:28 +0000 (UTC)
Date: Thu, 14 Jan 2021 09:33:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [qemu-web PATCH] Use GitLab repo URLs instead of git.qemu.org URLs
Message-ID: <20210114093327.GA292902@stefanha-x1.localdomain>
References: <20210113173605.273811-1-stefanha@redhat.com>
 <87zh1clltb.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87zh1clltb.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--huq684BweRXVnRxX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 06:43:15PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > Switch to GitLab repo URLs to reduce qemu.org bandwidth.
> >
> > Note that there is still one git.qemu.org remaining in
> > _posts/2018-06-28-tcg-testing.md. The git object doesn't exist in GitLa=
b
> > and it's hard to use master since the link was to a Makefile that has
> > since changed significantly. Nevermind.
>=20
> That would be:
>=20
> modified   _posts/2018-06-28-tcg-testing.md
> @@ -133,5 +133,5 @@ results from a qemu-system emulation. Some architectu=
res have
>  semi-hosting support already for this while others report their test
>  status over a simple serial link which will need to be parsed and
>  handled in custom versions of the
> -[`run-%:`](https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtests/tcg/Mak=
efile;h=3Dbf064153900a438e4ad8e2d79eaaac8a27d66062;hb=3DHEAD#l95)
> +[`run-%:`](https://gitlab.com/qemu-project/qemu/-/blob/de44c044420d11394=
80fa50c2d5be19223391218/tests/tcg/Makefile#L95)=20
>  rule.

Nice, thank you. I sent a v2.

Stefan

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAD+cACgkQnKSrs4Gr
c8jqKgf+NDIX1pOJc33WypwPSEGyNPgu1WEiSJnU5TWJiSzA7SYOQHgsbtdIGYLQ
Jlp4/ACUJfXNtYWCtOm8HRXAU/NMvcM3EWvze8Z+KDSjZzWeH7RcCdPVdpDmaJWY
wF28WKaJyWQ7ti356nai41GqZ+i9HheuiMJK+QYVr/1qhIRYiYNfUVruYkUmzCod
mrpDUyWOvrwlnutN79H/ZcJ/WmYQI6JZ/p+4ZAsd/otbiSxKpXIwKmCmocYYd+mR
NUyC7ZzrSw6PMYqtdoovF7QH2vIBcFKcg9Rps9YWWPWhyiAWQYH4KhgnwTZ2HLJh
XwXFQOlDQ2QoEkstVThYomzN1UJ9Mg==
=zv/U
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


