Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99E14229FE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:03:38 +0200 (CEST)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXl2f-0000Ge-VU
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXl0n-0007It-C3
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXl0l-00012N-07
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633442497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kOSayNaoNUdr3LWr+MadRIj7Iq9HFAa+9dknK6l73hs=;
 b=HjbKzHXSNJZalfwUK4rIUftA0TV+spH49vXEPvNBvSQDmQLRfR6GAg8UntUnXfwEzrt7db
 pZ8eF7He3LJX2G8ajyejopV7+b09Z3jb6xUTc+Ks988T147utYJT2SFF9yYdssTP6+sOi6
 0PsIjBtP+V4WTHHHw8s7nolv5LTewYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-mjQqD2-OMjyiq7xyF7Hflg-1; Tue, 05 Oct 2021 10:01:31 -0400
X-MC-Unique: mjQqD2-OMjyiq7xyF7Hflg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F5018D6A3B;
 Tue,  5 Oct 2021 14:01:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0F901F451;
 Tue,  5 Oct 2021 14:01:18 +0000 (UTC)
Date: Tue, 5 Oct 2021 15:01:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
Message-ID: <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain>
References: <20210922121054.1458051-1-kchamart@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922121054.1458051-1-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kYSo8ifICbXfHxXF"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kYSo8ifICbXfHxXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 02:10:51PM +0200, Kashyap Chamarthy wrote:
> As of writing this, qemu.org is down, so I've used a one-month old
> copy[1] of the wiki from 27Aug2021 to do the rST conversion.
>=20
> My main motivation was to convert SubmitAPatch (when Peter Maydell
> pointed out on IRC that it's still on the wiki).  But it links to a
> couple more small wiki pages; so I converted them too:
>=20
>   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches

What is the motivation for moving these pages from the wiki to qemu.git
(https://qemu-project.gitlab.io/qemu/devel/index.html)?

> [1] https://web.archive.org/web/20210827130706/https://wiki.qemu.org/Cont=
ribute/SubmitAPatch
>=20
> Kashyap Chamarthy (3):
>   docs: rSTify the "SpellCheck" wiki
>   docs: rSTify the "TrivialPatches" wiki
>   docs: rSTify the "SubmitAPatch" wiki
>=20
>  docs/devel/spell-check.rst        |  29 ++
>  docs/devel/submitting-a-patch.rst | 460 ++++++++++++++++++++++++++++++
>  docs/devel/trivial-patches.rst    |  53 ++++
>  3 files changed, 542 insertions(+)
>  create mode 100644 docs/devel/spell-check.rst
>  create mode 100644 docs/devel/submitting-a-patch.rst
>  create mode 100644 docs/devel/trivial-patches.rst
>=20
> --=20
> 2.31.1
>=20
>=20

--kYSo8ifICbXfHxXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcWq0ACgkQnKSrs4Gr
c8j43Af+OtgGrN/xPAjqWDckX5bsGnRDUmoRP+RJOymC/ggiPJsm//LCPHJHR1B9
ndFx+XEPjfsb9EZ5/e0b6TpJkpc0XpkEmWo3eu7EFJvGcDaPY77vmp995j1FW0iP
rrOsORL8CI+4CcxUDQGFTSqAGrySXOPUHhAIEVX/RFBtC4ywmiECWrXW+tjEi+eF
mHMlLbocKHATjAuz9953jY0LuBYcmmyo9YRk2xnOzL+RwoOfuCnT6Ye2N0ivFvCn
gzidcPdOZde7ZxQQMORK3pJCrdZ3EknX+c1+YXi3wRuSuFo7mz8qBB5kAs+VBiB/
h5akmezXb2VEgkvPQhBm8H117RNegw==
=TwZI
-----END PGP SIGNATURE-----

--kYSo8ifICbXfHxXF--


