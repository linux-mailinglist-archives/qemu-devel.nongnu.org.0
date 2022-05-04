Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A2519CD2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:21:33 +0200 (CEST)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmC8S-0004ka-VX
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmBIK-0008Lx-BP
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmBIF-000477-MK
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651656452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KGGhR79RyuCRy0A12w7xeCl77jAdDd1cenfx9lsTxeM=;
 b=FsRMgZddJKFq7844yyDT6mibW+j3Ps90Gz6HoYTijQ/I6PpbxGW8CEgoxpsIpVYJ6rYHOf
 VNWa9tSMT06cSWAQKg7GCH8Uqt/FeIsAEpNx6HVE1FfrAq7BXQ/+XXOZyN0WXexHQ2HFLa
 T+qsxDOjNDp2TWCJayod3NbTDcL3fyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-O8oOPYV0OoC01TnybmPOuA-1; Wed, 04 May 2022 05:26:01 -0400
X-MC-Unique: O8oOPYV0OoC01TnybmPOuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C138C80D196;
 Wed,  4 May 2022 09:25:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56C5640CFD32;
 Wed,  4 May 2022 09:25:22 +0000 (UTC)
Date: Wed, 4 May 2022 10:25:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, peter.maydell@linaro.org
Subject: Re: [qemu-web PATCH] Add public key for tarball-signing to download
 page
Message-ID: <YnJGgbL5zAyBv+3j@stefanha-x1.localdomain>
References: <20220504002129.286001-1-michael.roth@amd.com>
 <4c9c3404-59b3-8806-76a6-ead94e7f2581@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0OWpyhF+pdlVAjYA"
Content-Disposition: inline
In-Reply-To: <4c9c3404-59b3-8806-76a6-ead94e7f2581@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--0OWpyhF+pdlVAjYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 08:31:24AM +0200, Thomas Huth wrote:
> On 04/05/2022 02.21, Michael Roth wrote:
> > We used to have public keys listed on the SecurityProcess page back
> > when it was still part of the wiki, but they are no longer available
> > there and some users have asked where to obtain them so they can verify
> > the tarball signatures.
> >=20
> > That was probably not a great place for them anyway, so address this by
> > adding the public signing key directly to the download page.
> >=20
> > Since a compromised tarball has a high likelyhood of coinciding with a
> > compromised host (in general at least), also include some information
> > so they can verify the correct signing key via stable tree git tags if
> > desired.
> >=20
> > Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Michael Roth <michael.roth@amd.com>
> > ---
> >   _download/source.html | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/_download/source.html b/_download/source.html
> > index 8671f4e..c0a55ac 100644
> > --- a/_download/source.html
> > +++ b/_download/source.html
> > @@ -23,6 +23,7 @@ make
> >   </pre>
> >   	{% endfor %}
> > +	<p>Source tarballs on this site are generated and signed by the packa=
ge maintainer using the public key <a href=3D"https://keys.openpgp.org/vks/=
v1/by-fingerprint/CEACC9E15534EBABB82D3FA03353C9CEF108B584">F108B584</a>.
>=20
> I'd maybe rather use 3353C9CEF108B584 instead of just F108B584 between the
> <a> and </a>, since short key IDs are a no-go nowadays.

Yes, AFAIK 32-bit key IDs are considered insecure and 64-bit should be
used.

Stefan

--0OWpyhF+pdlVAjYA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJyRoEACgkQnKSrs4Gr
c8gNXAf/cLtqjFfUxh4HGP5e+9BeQ0qkXXqxLKypqebrrSt23AcZxc9zPzRLFjcP
tDJs7N0GbPW5044BfYaA2ZkafNyYKteYZ8382Kda6g4y409KCDcVMoVzulzdqSiU
1C0syVw43NU/QQ5s9Z+C8vpu7nO5y4U/srZhIdWzb9hHrLvHViR9/+wRX8dmKSLB
JMJ3BQG6oryDPpLFLorlKyhTQ6g73mUVKPo02XtEVAQW3SykAA+Ls+rXhdqDNCSf
+59nlsB2XFdvSrXgWMjFg081TcxBUKlpGkbhZpseyEJVvz48TZkCNbZGe4QfgsM+
rcv1l0GN4hqWOPmhzGljPBvnbTqJtw==
=P6qA
-----END PGP SIGNATURE-----

--0OWpyhF+pdlVAjYA--


