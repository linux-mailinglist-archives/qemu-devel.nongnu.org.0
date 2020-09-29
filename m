Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CFA27BB92
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 05:34:08 +0200 (CEST)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kN6P0-0005Qm-FK
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 23:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kN6LK-0002uK-4Z
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 23:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kN6LH-0001Fu-QA
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 23:30:17 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601350214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EyoiZErsCK5O0Fc1NDIeRgE7jkHzK7kKElq7DPgkNd0=;
 b=AViefR/UCehObPNiJPitC62q6bKOcKxBMDxWM2zlxhPFj8faz8YQJdnKkKesmUERnppn7t
 /AnEjqL7KR32pILAOKdlOgl7q2/jSPT8GlpERafi2os84dd9q+uXmf7TjJ4b2c0ZM5nfJb
 5xySbXNtTifCK+GV825zA+xdVzxi4E0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-9Mo8oRwjPQiGoh8ELeNzPQ-1; Mon, 28 Sep 2020 23:30:11 -0400
X-MC-Unique: 9Mo8oRwjPQiGoh8ELeNzPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D15E0802B47
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 03:30:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 399D97842B;
 Tue, 29 Sep 2020 03:30:02 +0000 (UTC)
Date: Mon, 28 Sep 2020 23:30:00 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 03/47] [DO-NOT-MERGE] docs/sphinx: change default role
 to "any"
Message-ID: <20200929033000.GD700868@localhost.localdomain>
References: <20200925002900.465855-1-jsnow@redhat.com>
 <20200925002900.465855-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200925002900.465855-4-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 23:30:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 08:28:16PM -0400, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/conf.py | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/docs/conf.py b/docs/conf.py
> index 0dbd90dc11..a68f616d5a 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -81,6 +81,9 @@
>  # The master toctree document.
>  master_doc =3D 'index'
> =20
> +# Interpret `this` to be a cross-reference to "anything".
> +default_role =3D 'any'
> +
>  # General information about the project.
>  project =3D u'QEMU'
>  copyright =3D u'2020, The QEMU Project Developers'
> --=20
> 2.26.2
>=20

After this I get:

  qemu/docs/cpu-hotplug.rst:81: WARNING: 'any' reference target not found: =
query-cpus-fast

So I missed it during the review of the first patch ("docs: replace
single backtick (`) with double-backtick (``)").

- Cleber.

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9yqjQACgkQZX6NM6Xy
CfPHhA//SexBftYJNE21PpgDtII0Qu4SW0rdrojaddJakWhxC67xNkE/h1dyQiA/
ETUc62iyb6brf+nw6GiBrELCoR68mZV+dE1K8AG8cVgz2/h0IHMrH5AetthKCic9
ddYgYU/qf9UhhELf/q4f03K7KQ/5PwBjaHPQm2avOMU9FjVO7oEiT0w4yS240sz7
ulc8J0EXXWF/Aybw+bhhjuOF+dQI+AA1Pon5detFoW9anEjB7LNLNxRYJcX/+Dh6
eijWZC7GqrgIzAIRsjBpgVWrpiFQz70VNTqQkOzKoawZPNnjbA+M2SbcPjV0OYAf
NMuKq4UOnAfgI/S8XVNaEBBy4XTXEs9QkZHO2AsV1gBS6I0pHBPHywakhH06KdwO
tvN9u8KMkIZLKbDIK3ZvC1mYCWJmOgo/xEjixbB1JbyLVLV4omw9yLhWTmEYN8Bk
xnYA04dFq8SULsDcOvzQO5krTFTSp/rwjNe2l0OuAibuXkPhf1GhbsTJ3rcxJylK
JzCTpcJ0Dj7R9ukMuiFwBUjrdedm3oOWUMTzSsxaXoOM5EKp5I0P3tcmmwFTwYpk
uVbk26FqN57qk9c0qEeJA0BVqOYTIh3nj1bGZKf+0QrzoA4nwiCr5gVUQLX/aPh0
coPLG0us+8K2NUQ9VI4ykaBmP2vSu4Q6VB4yXA89w0UBouIthC0=
=/MZ8
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--


