Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D1399D4B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:58:36 +0200 (CEST)
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojBU-0004nd-2k
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loizA-0006Qc-14
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loiz8-0005rh-3z
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622709949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u4AIvIxpeFffbyADpUmYqXGycuF+t0PX8piIUOL1xpA=;
 b=iPKJdM8AQ8pw7PSk9zLZsgLC+JDRbBKzIVET12FEmhtEs3Uk7oHBYWPORcSexousY7456n
 U8TYUllGFZMSpmylIh/420RxoN83nGmdSGKCDOBOBj69/ujB+Ec3eYZh7gR5PJbJ+Uu6CC
 kFDlE4DA2n7WSJyh/FUJJtrojDKRTRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-QQAPchtsOBGwdBBbyilpwQ-1; Thu, 03 Jun 2021 04:45:45 -0400
X-MC-Unique: QQAPchtsOBGwdBBbyilpwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6166107ACE8;
 Thu,  3 Jun 2021 08:45:44 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DD5C5D9C6;
 Thu,  3 Jun 2021 08:45:44 +0000 (UTC)
Date: Thu, 3 Jun 2021 09:45:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
Message-ID: <YLiWt21tQdFJo/4c@stefanha-x1.localdomain>
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603001129.1319515-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UntTS5plLYzbIiBd"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UntTS5plLYzbIiBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 08:11:28PM -0400, John Snow wrote:
> Based loosely on libvirt's template, written by Peter Krempa.
>=20
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab/issue_templates/bug.md | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 .gitlab/issue_templates/bug.md
>=20
> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug=
.md
> new file mode 100644
> index 00000000000..9445777252b
> --- /dev/null
> +++ b/.gitlab/issue_templates/bug.md
> @@ -0,0 +1,63 @@
> +<!--
> +This is the upstream QEMU issue tracker.
> +
> +Before submitting a bug, please attempt to reproduce your problem using
> +the latest development version of QEMU, built from source. See
> +https://www.qemu.org/download/#source for instructions on how to do
> +this.

It's likely that those unfamiliar with QEMU, especially non-developers,
won't be able to do this:

The wording requires the reader to figure out that "latest development
version of QEMU" is none of the big 6.0.0, 5.2.0, etc download links at
the top of the page but the small text "The latest development happens
on the master branch" sentence below the fold. Then they need to look
around the page to find out how to download the master branch and build
from source.

I suggest referring directly to the build instructions instead of
requiring the reader to make several connections in order to do what
we're (indirectly) asking:

  Before submitting a bug, please attempt to reproduce the problem with
  the latest qemu.git master built from source. See the "To download and
  build QEMU from git" section at https://www.qemu.org/download/#source
  for instructions.

--UntTS5plLYzbIiBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC4lrcACgkQnKSrs4Gr
c8hrfQf/YcRS0z8q8Y1zZZndG1ZZMjEQ462GkAnaLEhUdeAwA7KzjOHsJFaEXQG9
lKQg4H5b/IAUgojYyn90+Nn1yY3TDLBEWJNHW5SBaKduu/upAJ/7bq7JbSpfdF8O
Fuvcbk/YgNIzuOCHtMDkr3Syp/Cggi+GOT5QJTHRNURxucn5qbXMQkl6UxBAWbOY
/5XyvcabLeCLekpKXHwfNklr3Z4wkqqk6ejTbX6LEmaayI5mJzvF5SBXByVTTGvo
l4pe+O10X/viUPbvvr9BeS1tcxwZVp8Se+K6yarPF7zGBZXt88dhkDmRYdXNOfog
GHoiL1kWhMAEknmKOA5x40NgYbVmWQ==
=YhPn
-----END PGP SIGNATURE-----

--UntTS5plLYzbIiBd--


