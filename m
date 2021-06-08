Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E039F10E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:37:12 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXEV-0004dQ-Cr
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqXBL-0007UP-6A
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqXBG-0001jF-SK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623141230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rttaYRDTT6CH3SyEw3MdyY24bytUjVRG2YOgDVSrMbs=;
 b=FzMQfRkaMOJ55jK0QXVsxqu4zXh5l0kWXU0HVEosp97KLn4Q24SBa3lEIHFUBJ7+oaQFrT
 Hx19QJZcCHIK7vBf+0iTLbzpIt8obG//r9sBrF9N0nxe59CYwUCvj9MQk6YWWvLaj3qk00
 pLb1B5eG1w+tma91soz8ulP7ZbDn/AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-RqGj7cRCNx6QBup9cN9Mow-1; Tue, 08 Jun 2021 04:33:46 -0400
X-MC-Unique: RqGj7cRCNx6QBup9cN9Mow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E1A8049DD;
 Tue,  8 Jun 2021 08:33:45 +0000 (UTC)
Received: from localhost (ovpn-114-153.ams2.redhat.com [10.36.114.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A9F960C04;
 Tue,  8 Jun 2021 08:33:45 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:33:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 0/2] Gitlab: Add issue templates
Message-ID: <YL8raDhOVcAyQmNV@stefanha-x1.localdomain>
References: <20210607153155.1760158-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607153155.1760158-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5NvEtWvnCtvGsFoi"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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

--5NvEtWvnCtvGsFoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 11:31:53AM -0400, John Snow wrote:
> Add "Bug" and "Feature Request" templates to the Gitlab interface to
> help improve the quality of newly reported issues.
>=20
> To see what this looks like, I've temporarily allowed my Gitlab fork to
> diverge with these files merged.  See my fork's "new issue" page to see
> it in action: https://gitlab.com/jsnow/qemu/-/issues/new?issue
>=20
> (It's outdated a bit for V4, but you get the idea.)
>=20
> These patches do not add a "default" template, the user still has to
> select one from the list. I recommend that someone with permissions
> updates the default template:
>=20
> 1. https://gitlab.com/qemu-project/qemu/edit
> 2. ctrl+f "Default description template for issues"
> 3. Update the default to the (suggested) below:
>=20
> ```
> <!-- Select "Type: Issue" and choose one of the Description templates abo=
ve. -->
> ```
>=20
> We can use this cover letter to discuss/review the wording on that
> default template which exists outside of repository data.
>=20
> V4:
>  - Change the "build on master" to be more of a nudge than a mandate,
>    with improved instructions (stefanha, danpb)
>=20
> V3:
>  - Add pointer to https://www.qemu.org/download/#source
>  - Add pointer to https://www.qemu.org/contribute/security-process/
>  - Remove blurb covering tracing instructions.
>=20
> V2:
> - Updated both templates based on feedback from Peter, Daniel, and
>   Thomas.
>=20
> John Snow (2):
>   GitLab: Add "Bug" issue reporting template
>   GitLab: Add "Feature Request" issue template.
>=20
>  .gitlab/issue_templates/bug.md             | 64 ++++++++++++++++++++++
>  .gitlab/issue_templates/feature_request.md | 32 +++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 .gitlab/issue_templates/bug.md
>  create mode 100644 .gitlab/issue_templates/feature_request.md
>=20
> --=20
> 2.31.1
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--5NvEtWvnCtvGsFoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC/K2gACgkQnKSrs4Gr
c8hstgf+N+olNtjHWoUmdlvd/uUpBWebrJV0z9sb2mwSAsCigAd0gUp6mHIj45A2
ux3zRx/bGkZlXDkNSJfGvSqr1HRLRqfblvJ/VNcYVdLhgKyGUmr8nRtlHPpIMKKe
cHgw79iHlbl/1367vYw/Wc2Nwu5yBit2F5NU084Q+91669MVb2nHWKWoffgHm/Mg
Id9GOmeUIwxCOWa2dMpeZMbSfcwWKp6gP9tgl64kdxAHZOttzo9c/izsffUyW/Hn
8cy3k9oWxXeP9XB7JzlaxygGyHlr6vkOznxu+M89/gDJtzbVs7U2dxyRvD4aWiod
TwH1MHoDC6vjxaq3NiGyu5xvSYMS0A==
=XFth
-----END PGP SIGNATURE-----

--5NvEtWvnCtvGsFoi--


