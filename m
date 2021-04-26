Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5E36B476
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:04:56 +0200 (CEST)
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1r4-0008M3-T5
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb1qG-0007wd-Qv
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb1qE-0004GP-4O
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619445840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7KR7qBEIdCf7hmpOGC5pQDqyW87RvKuhKPLDdhODn0M=;
 b=Ieq6Wl1mlyeGcXBsxX0zYmDWCsxBDdbgY4XloOzO6pN3zXp1sdKUcVJbaB5wBcrRNN308K
 kAsWCmCdy/WFwk/P/P3k7jj75rLdjbiVrBqeUtDlLHBFCAUOaFbQfP5Gioi7AEkhMEkHrQ
 0s2WelnacwVqmbz8RQnZt2Y1rLB8Nmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-A-XY97PLNWu2WXEYrHOo3g-1; Mon, 26 Apr 2021 10:03:58 -0400
X-MC-Unique: A-XY97PLNWu2WXEYrHOo3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7D6100A60E;
 Mon, 26 Apr 2021 14:03:57 +0000 (UTC)
Received: from localhost (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BABB16086F;
 Mon, 26 Apr 2021 14:03:56 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:03:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] scripts/tracetool: don't barf validating TCG types
Message-ID: <YIbIS/qDUwuLvNco@stefanha-x1.localdomain>
References: <20210406165307.5993-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210406165307.5993-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d2UVrPBxgRZnJ50K"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--d2UVrPBxgRZnJ50K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 05:53:07PM +0100, Alex Benn=E9e wrote:
> TCG types will be transformed into the appropriate host types later on
> in the tool. Try and work around this by detecting those cases and
> pressing on.
>=20
> [AJB: this seems a bit too hacky - but the problem is validate_type is
> buried a few layers deep. Maybe we should just drop TCGv from
> ALLOWED_TYPES and manually do if bit.startswith("TCGv_") in validate_type=
?]

Please include a line from a trace-events file that triggers the issue.
It's unclear to me what the problem is although I guess it's related to
TCGv_* types being rejected by validate_type. The
bit.startswith("TCGv_") change you mentioned sounds fine or a slightly
more general ALLOWED_TYPE_PREFIXES =3D ['TCGv_'].

> Fixes: 73ff061032 ("trace: only permit standard C types and fixed size in=
teger types")
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  scripts/tracetool/__init__.py | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.p=
y
> index 5bc94d95cf..ea078e34b4 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -87,10 +87,11 @@ def out(*lines, **kwargs):
>      "ssize_t",
>      "uintptr_t",
>      "ptrdiff_t",
> -    # Magic substitution is done by tracetool
> +    # Magic substitution is done by tracetool TCG_2_HOST

This makes it clearer that "TCG_2_HOST" is a code reference:

  # Magic substitution is done using tracetool.transform.TCG_2_HOST

--d2UVrPBxgRZnJ50K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCGyEsACgkQnKSrs4Gr
c8gZhwgAsYMC2lwsAWzFLCQFtus4RvgyGw9mAOWZhAeNXr+QAZlMuFydLEvp7qIq
TpQ+uN1FMrj2hNXPVn478uVCg/676AqxVGv2vX6139WhT26c4IAQVvfBtkoYGX9r
870x8S3ZkI9PGU4+L7E9OVUo5crviblqlbyJnmg6afzhcEmshh0JJJQCrYep0hgf
hHg4MsvF5V+qo6xGhjut6JJ9sNl2OAvadIjlOY3l/PcQqdz8tOeC/bvkSc67Bx3q
yv3y1QxMfYdg1WrpJa38YenmD9TNjuXM8fRQbjyZlCMsbPnuYLiMOB57yca8mDwt
LL/PFPPq7qIpXHYUZnA48UMT02B9lQ==
=Sl5+
-----END PGP SIGNATURE-----

--d2UVrPBxgRZnJ50K--


