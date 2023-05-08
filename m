Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAED6FB372
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:08:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2Td-0001Io-1K; Mon, 08 May 2023 11:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pw2TW-0001Gj-4t
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pw2TU-0007nJ-8B
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcuIanG6aRtRhR+JXh7OYsx45cth4373Yx5k5oIMd7Y=;
 b=V0LQu0zW7GYMLgIPFQQILYtuXTGHED1P3g/jM+0gMQ1eTKR+lav9uQJlK2os9nonEQWUfL
 KAzN0z/jH40MswxD+KhEIORp7UNs5xXGv6vNpSsDXAJkpeTtHqbBU6QKl4qNGUn1nDNly+
 dVP4y4l4l+4vvqg4pPQftqOm/xtNo/o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-1g1cmG4VPMSPBer3mIt0TQ-1; Mon, 08 May 2023 11:08:24 -0400
X-MC-Unique: 1g1cmG4VPMSPBer3mIt0TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C25373814966;
 Mon,  8 May 2023 15:08:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25A482166B40;
 Mon,  8 May 2023 15:08:22 +0000 (UTC)
Date: Mon, 8 May 2023 11:08:21 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <m.ynddal@samsung.com>
Cc: Mads Ynddal <mads@ynddal.dk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 01/12] simpletrace: Improve parsing of sys.argv; fix
 files never closed.
Message-ID: <20230508150821.GD581920@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-2-mads@ynddal.dk>
 <CGME20230504180335eucas1p21ffccd4ab7097deb326e3053c10cef01@eucas1p2.samsung.com>
 <20230504180326.GB581920@fedora>
 <0713AFC1-299C-47A2-8746-49AD8C70185D@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jN9ApXIAh+NsCBrI"
Content-Disposition: inline
In-Reply-To: <0713AFC1-299C-47A2-8746-49AD8C70185D@samsung.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--jN9ApXIAh+NsCBrI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 01:18:40PM +0000, Mads Ynddal wrote:
> > simpletrace.py is both a command-line tool and a Python module. The
> > Python module has a public API that people's scripts may rely on. Let's
> > avoid breaking API changes unless necessary so that existing scripts
> > that import simpletrace continue to work.
> >=20
> > It's not very clear what is a public API in simpletrace.py, the file
> > should really have __all__ =3D ['Analyzer', 'process', 'run'].
> > Nevertheless, Analyzer's doc comments mention process() and the
> > process() function itself also has doc comments, so it's a public API.
> >=20
> > Please drop this change to avoid breaking the public API.
>=20
> I agree, I'll revert the changes. I can add an `__all__` too.
>=20
> I'd like to avoid having the same `open`, `read_trace_header` and `read_e=
vents`
> multiple places. Would it be acceptable to let `process` be more of a stu=
b and
> move the logic to an internal `_process` function maybe?

Yes, as long as the existing public API doesn't change that would be
fine.

Stefan

--jN9ApXIAh+NsCBrI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRZEGUACgkQnKSrs4Gr
c8gRlgf9GzQBlloaITscLMGeo/02oJt3srL3IQeXFeO8ozn0bee4khknuoADNTvi
ThSAh0h6c44iuDrNFxHdWIrJX8CJKaPhzcxzYLC65a5R/fTEoVQGkINoVmpmR4Qs
ADsaVMr+nPiVndV2EBzPZnjRy0WroezzA9YuBtWbp1EQKyKkScMqUuH5NamrmnZq
aBb6GrwIwROtL55N5+CFQkX5ZRyIu9h26He/H6rPSjqPiL4gqvgxG1XCH/pO8Svk
SGICDwq0iq7qHcuIkLKD79yOy4QTAq0bxIzIkccOYtZXGyomc1TDmS6mYLQ1qnK1
aoZh/H+m0yA4M2lxkYrn8uozyQAKEw==
=zWAy
-----END PGP SIGNATURE-----

--jN9ApXIAh+NsCBrI--


