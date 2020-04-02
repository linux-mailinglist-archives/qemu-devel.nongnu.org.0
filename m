Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B119BE69
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 11:10:12 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJvrX-00073P-4K
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 05:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jJvqj-0006WN-8k
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jJvqh-0008NR-IS
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:09:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jJvqh-0008MQ-Dw
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585818558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=48qyajI1G6fl6MvDfItRLm65eFoTKtsaCVM0sbbmr8g=;
 b=APEuNyHWDfpCzOIxxGeem/hhrv9uo7ISGLyIskuzjHULLa/VV6FDdl2MVBp0aLrTNtv2o8
 3Mw9rY2BH9N3zqh6IuNXidTOcrt0Uy8KQq+y+GLf2jVuJH99/3/NGU4lP2tjXfxRoLa7kn
 NB/Fgntv5PvvQiT1Cx/sq5SOpJzEOT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-aBWwFaOTOUucxSuyMcGeFg-1; Thu, 02 Apr 2020 05:09:14 -0400
X-MC-Unique: aBWwFaOTOUucxSuyMcGeFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E027F1137850;
 Thu,  2 Apr 2020 09:09:12 +0000 (UTC)
Received: from localhost (ovpn-113-134.ams2.redhat.com [10.36.113.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DED29A24F;
 Thu,  2 Apr 2020 09:09:12 +0000 (UTC)
Date: Thu, 2 Apr 2020 10:09:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] hw/core: properly terminate loading .hex on EOF record
Message-ID: <20200402090911.GC28280@stefanha-x1.localdomain>
References: <20200401193849.14017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200401193849.14017-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2020 at 08:38:49PM +0100, Alex Benn=E9e wrote:
> The https://makecode.microbit.org/#editor generates slightly weird
> .hex files which work fine on a real microbit but causes QEMU to
> choke. The reason is extraneous data after the EOF record which causes
> the loader to attempt to write a bigger file than it should to the
> "rom". According to the HEX file spec an EOF really should be the last
> thing we process so lets do that.
>=20
> Reported-by: Ursula Benn=E9e <alex.bennee@linaro.org>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  hw/core/loader.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6Fq7cACgkQnKSrs4Gr
c8hpXwgAqQBmAgV3acCuOf7284US/UnaS1hW3ipvLHyNN57wKHrCd04XpDT0faEM
dVsihxphHfTwEj8bUn7kfLCUY3mgmBfLSaJl/hATZj/ccS+qoi1A5ZrayDnPOWSi
X0CQYh0r7lNO+ABKPlAqD7/nE9gbvUvJDtdi2bmt/8RJqaZm02AZw6C+ZFbzZ1Mu
Et/Udb9Vi6c5YH/QcTDZ5dujHhD9TBaM2fSHFfTwxeNh+hjStcd0PqmfH7N3qqDB
l68jZuU88FYfo2j4K6aVws5Er0Pyef9Eqe2gcsTJxrUDnbvAPWsFThT0bTbLU4qU
aEaVuj1h8wuwBZeElW3L3UDHAyOvhQ==
=jyxZ
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--


