Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C578E8F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:00:00 +0200 (CEST)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs783-0003kA-5u
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 10:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37337)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hs76g-00037l-Ni
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hs76f-000482-RP
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:58:34 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hs76f-00046h-Kw
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:58:33 -0400
Received: by mail-wr1-x443.google.com with SMTP id x4so9049069wrt.6
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ikutog3/szr3RMqowT2g+qNbsyWnISYtND6etPKFdfg=;
 b=XdvOnHVobDGvq5Oc327Th+yVB3przSMfFmI1oL7799UyBk5O1gL4fuEc21PKnmXtll
 NCd10PFV2NQkKmuxm6ReNCl0JSoTb49SXTOJRIwXvFy/x6HVaLBT+gss3ih+MMdbTb46
 FvxHWAJvbI+u6fKmSRHgzSRYjXisB0vAuDGhEIhCHNr26FwYtyC2Cx45YLyaZgnv1jZt
 UzsW48958jwkU2f+ToiydzHHDbxaBJgKf9USXEII0UUjvCj79iMtQ/15B6x8TsWLbKjm
 hJcYPZvm5f9gYviegMcw985G2FCv4oeQATZeoZYhGK1usKdlqEEs/UZDmWSJLN5+12QY
 8l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ikutog3/szr3RMqowT2g+qNbsyWnISYtND6etPKFdfg=;
 b=TqeOq2O6sRCOq15r3xBZEeD3fR77sIyv4u183PgH9zUQezhVhZzMsp6hyFjTT3jFv0
 daiPhONosbofultzLJ45yT0ms7uUXA83Ttw9RIDoLFkxkfLxZS6SRjNWIAXl9N2fNEci
 Dk+jBomR9eXRQQdKerAd4Fk8FqFGUeB7C64ay5g3Ie6ETAkBVn7hnqTl4IN5l+oOabCQ
 g+hyBxTcyuC/2l/Mzq8v4F8eEP8sNZyTl4bk7agVqOsBGTlJP0+z4Nvm/BVMnGLdcTRI
 4Dzbx2tqGqKz3N30vLytXIYV7GgxDl+blheEzf+Wo7UC8hs97fBYSyf+vFeEcFDMR3bP
 oW3A==
X-Gm-Message-State: APjAAAWTJ4AFJvNF8Me9FQ1KTLo6LT5kYatbXuZgSWYOIXWhP6ovdSEP
 e/7LEJpu1HVyU2QI1jgjSrU=
X-Google-Smtp-Source: APXvYqxvd36UjU2TSrgw9ZCJp4a1IS6BrCBAJa6f/av6/ydrQZ9hKqNEmaofmLWO4Is+cogo2a4mLQ==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr7914955wrk.98.1564412312367;
 Mon, 29 Jul 2019 07:58:32 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id t140sm55720345wmt.0.2019.07.29.07.58.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:58:31 -0700 (PDT)
Date: Mon, 29 Jul 2019 15:58:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190729145830.GE6771@stefanha-x1.localdomain>
References: <20190725084341.8287-1-berrange@redhat.com>
 <20190725084341.8287-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <20190725084341.8287-4-berrange@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH v2 3/3] crypto: use auto cleanup for many
 stack variables
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 09:43:41AM +0100, Daniel P. Berrang=E9 wrote:
> Simplify cleanup paths by using glib's auto cleanup macros for stack
> variables, allowing several goto jumps / labels to be eliminated.
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> ---
>  crypto/afsplit.c      | 28 +++++-----------
>  crypto/block-luks.c   | 74 +++++++++++++------------------------------
>  crypto/block.c        | 15 +++------
>  crypto/pbkdf.c        |  5 +--
>  crypto/secret.c       | 38 ++++++++++------------
>  crypto/tlscredsanon.c | 16 ++++------
>  crypto/tlscredspsk.c  |  5 ++-
>  crypto/tlscredsx509.c | 16 +++-------
>  8 files changed, 65 insertions(+), 132 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0/CZUACgkQnKSrs4Gr
c8hAFQf2PgxyT9qIGLhgUViBUv6lejAoofEuEbDn/UXNvhCsHv3xdmkpmJTJuXDY
Y7XlvZO6uTxQ++UKSnmKMiig9wplmFzWh1UBLtETulVMQOfKVHacnfFpyLNmsT2f
phuUi37FlSwxasjhCKuc/TLIMNYzCqgcl5iL0jt3fSfNCDl+G1GMPUAV7yHgR//2
xYYEOVrirU0JRQNYotxBeqb+BQc2GYn0JmJYTYaCqt95JaVSHUbStHMUAkzubDzr
N8zODe0EmR2xI51LAy1Qt5aty0ZwGJ/ynKC3TMPzrwWvW1rg/NeXgD+SU/PSngnL
m1qjh7t1Eadp4XdnGEhFoJxzDMRd
=F+9p
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--

