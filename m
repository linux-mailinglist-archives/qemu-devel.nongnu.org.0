Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D43323BD0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:17:54 +0100 (CET)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEt73-0006Ao-N9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEt4W-0005cg-Iy
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEt4U-00058V-1u
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614168912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ozahWW5Yf7X9XCz7yKnbIiAIfIkPK3AfEwrr8H+b5S8=;
 b=N7l7+yPRd5P7GRa/LzpMEV84ZWOJ/hSbz5YfHtIJFsXvj+6b/Z+ZhNaTq7t/JwOQxPyV6g
 slcOGUy2LkyXzHC99gLwQEODZVxH2F76QWhTr4JVzb97zGJxejNOPBKDicvmUopv9TKsLN
 t73wmshlf9jxwEy8L9+lW8Jv7k1Max4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-RVKEtZMyMSeALDp-ga9hnQ-1; Wed, 24 Feb 2021 07:15:07 -0500
X-MC-Unique: RVKEtZMyMSeALDp-ga9hnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABBC71966322;
 Wed, 24 Feb 2021 12:15:06 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5029660C62;
 Wed, 24 Feb 2021 12:15:06 +0000 (UTC)
Date: Wed, 24 Feb 2021 12:15:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
Message-ID: <YDZDSY3G9+KpgJsE@stefanha-x1.localdomain>
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
 <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
 <5a1c4191-b0e6-8dcf-d5db-7335b5f41628@redhat.com>
 <87lfbe51oy.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87lfbe51oy.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vn7f4/UAvkyuJzfl"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vn7f4/UAvkyuJzfl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 01:37:45PM +0000, Alex Benn=E9e wrote:
>=20
> Philippe Mathieu-Daud=E9 <philmd@redhat.com> writes:
>=20
> > On 2/23/21 12:29 PM, Philippe Mathieu-Daud=E9 wrote:
> >> On 2/23/21 12:07 PM, Peter Maydell wrote:
> >>> On Tue, 23 Feb 2021 at 10:02, Alex Benn=E9e <alex.bennee@linaro.org> =
wrote:
> >>>>
> >>>> There is no particular reason to keep this on it's own in the root o=
f
> >>>> the tree. Move it into the rest of the fine developer manual and fix=
up
> >>>> any links to it. The only tweak I've made is to fix the code-block
> >>>> annotations to mention the language C.
> >>>>
> >>>> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >>>> ---
> >>>> diff --git a/README.rst b/README.rst
> >>>> index ce39d89077..f5d41e59b1 100644
> >>>> --- a/README.rst
> >>>> +++ b/README.rst
> >>>> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to=
 use 'git
> >>>>  format-patch' and/or 'git send-email' to format & send the mail to =
the
> >>>>  qemu-devel@nongnu.org mailing list. All patches submitted must cont=
ain
> >>>>  a 'Signed-off-by' line from the author. Patches should follow the
> >>>> -guidelines set out in the CODING_STYLE.rst file.
> >>>> +guidelines set out in the `style section
> >>>> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
> >>>> +the Developers Guide.
> >>>
> >>> This is the first instance of a qemu.readthedocs.io URL in the
> >>> tree. Do we really want to have our references to our documentation
> >>> be to a third party website ?
> >>=20
> >> We can use https://www.qemu.org/docs/master/devel/style.html:
> >>=20
> >> $ curl https://www.qemu.org/docs/master/devel/style.html
> >> <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
> >> <html><head>
> >> <title>302 Found</title>
> >> </head><body>
> >> <h1>Found</h1>
> >> <p>The document has moved <a
> >> href=3D"https://qemu.readthedocs.io/en/latest/devel/style.html">here</=
a>.</p>
> >> </body></html>
>=20
> I think if we treat the qemu.org domain as being the canonical URL and
> then let it redirect where it wants.=20

Yes, let's treat qemu.org as the canonical domain so we have the ability
to change locations easily later.

> > Or even better since we have a job pushing to Gitlab pages
> > accessible on https://qemu-project.gitlab.io/qemu/:
> >
> > https://qemu-project.gitlab.io/qemu/devel/style.html
> >
> > Maybe the https://www.qemu.org/docs/ redirect should
> > go to gitlab page now?
>=20
> It could do either, I think the result is exactly the same.

Standarizing project infrastructure on GitLab CI seems good to me. That
way developers will be able to reuse their CI knowledge and won't have
to learn other systems (like readthedocs).

However, I don't see .gitlab-ci.yml directives that build the docs and
publish a static page yet. Is anyone volunteering to do this? (It can be
done as a separate step from this patch.)

Stefan

--vn7f4/UAvkyuJzfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2Q0kACgkQnKSrs4Gr
c8i+aAf9E+Lu0+JNy34mVZ55ztTJ95T4VynOjWcZSjhdiixNj2tN9mh8fv+8LpAA
T80/guFlCjubuNa+leI0+wyna/Kcdv92Wh2FOggpdPO0cpI1iFc4ACVG94h508xR
TyQSvYU7CfO7cMu8Rb+0DeCFHx1AK14E6M+nTt2LMMTqqHE1E2TtKxibEhTNyS69
0EbUEXC+oz7SZRMXPQxnWu7FUwO4GuQg5PdRAvnpZ8x/omSdmRCQ4qm39xnhg5mb
X0pLEqYSNiFRN5iDmkmDSzKXCvcgQlri9T8akVaNG1Tw3iO1Ck0yAtKgapD1pbJp
sBv6PUSFEjcLZsl6gGsdbiV4zz5wcQ==
=XoFY
-----END PGP SIGNATURE-----

--vn7f4/UAvkyuJzfl--


