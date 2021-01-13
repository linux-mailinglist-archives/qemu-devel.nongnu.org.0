Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1612F47FF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:50:15 +0100 (CET)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcn8-0000Sl-KN
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzclG-0007u3-0Y
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzclB-0002H0-9U
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610531290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SPyDPUW/YNyiw4zmMueDLYfCTvubqLOIHzInHShRblI=;
 b=LSF5jrWuQfuvhwlvLRaT064QQgXRJ8Zz/mRLE6RrhWED1gUckoiT52k1XIMBIHjpZCdYD4
 hzIvtFRaacLn8tNzIb/gS6Gmbd3A1SwF+sq0fnMgXb0a8nwut0Z//SGfcFnSp4J6OxU7fa
 sEEhW6v+fIVfZUiP33Jq9AvdVkEIuXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-y6ihBJ_jNV2pTwPvXBjitw-1; Wed, 13 Jan 2021 04:48:07 -0500
X-MC-Unique: y6ihBJ_jNV2pTwPvXBjitw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE9E5806666;
 Wed, 13 Jan 2021 09:48:06 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FD685C3E0;
 Wed, 13 Jan 2021 09:48:05 +0000 (UTC)
Date: Wed, 13 Jan 2021 09:48:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210113094804.GA250553@stefanha-x1.localdomain>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:44:03PM +0100, BALATON Zoltan wrote:
> On Tue, 12 Jan 2021, Stefan Hajnoczi wrote:
> > It is possible to repeat the --trace option to specify multiple
> > patterns. This may be preferrable to users who do not want to create a
> > file with a list of patterns.
> >=20
> > Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > docs/devel/tracing.rst | 9 +++++++--
> > 1 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> > index 4ebf8e38ea..8777c19d14 100644
> > --- a/docs/devel/tracing.rst
> > +++ b/docs/devel/tracing.rst
> > @@ -22,10 +22,15 @@ events::
> > This output comes from the "log" trace backend that is enabled by defau=
lt when
> > ``./configure --enable-trace-backends=3DBACKENDS`` was not explicitly s=
pecified.
> >=20
> > -More than one trace event pattern can be specified by providing a file
> > -instead::
> > +Multiple patterns can be specified by repeating the ``--trace`` option=
::
> > +
> > +    $ qemu --trace "kvm_*" --trace "virtio_*" ...
>=20
> QEMU options are single dash with double dash accepted for compatibility =
but
> help and other docs have single dash so these (and below) should be -trac=
e.
> (Also a bit less typing for otherwise already way too long command lines.=
)

Is this documented somewhere?

I was under the impression that '-' is legacy syntax and '--' is the
preferred syntax. There are examples of '--' on the QEMU man page.

Let's reach agreement, document it, and then make the documentation
consistent.

Stefan

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/+wdQACgkQnKSrs4Gr
c8hMgggAiGKtoBVkbN6tK2SmN5RCz6h7BV5XNHqrXsitmlpRWQ3Bcb6+pLmXe8en
gB7KDiPwqGfnvRCaBhtHBDUlRjYIlSEq7w7JaIL73YqH3NkAAz/nTxCWzL2runvP
2F6Yxie0q5x9r0yOLz9I7sWB228ftE/VOwjDgecWmgpPCt/FhGflmTvhvRVHn16/
thMyRPmEZvGFzWgIgGJTufQWiCUuof+FsvIXU7kldDz2hvEE/nUsJwI2/mXmLOW3
oTQKEO6qOGu2Nb4tip+9um9TEUL8T8Va0ucqwdzChyEeVwRI7w92iSCFVnIg5bc4
SQRMAWhwhaNFwggDap1ySSJZ+qrANw==
=8rMt
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--


