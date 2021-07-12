Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DC3C60D5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:51:32 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2z9W-00019a-W0
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z7u-00089q-8h
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z7q-0001wW-TU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VZdPLD9FIzmU2q/r+kajVd9dTK4N8WLSuKpSG4anLfw=;
 b=freojiGiEhgGsgfo3mttsIeN+/Nn6AhrHIbSGTl+1leMgde9FadwCzYg52lGVgiZecGp7t
 lMvxtEth6pKLVhhjQmMS1wa2jmTOdWIOelaPHcNoYXK8K5ZTmgqyA1f/7Q5j109acmxmM7
 eYIQxVXGqbubgvvFaQ7pyBsMpQQyD9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-wMOhiQAEP7aVDdOgbuwhFA-1; Mon, 12 Jul 2021 12:49:41 -0400
X-MC-Unique: wMOhiQAEP7aVDdOgbuwhFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0126C1084F55
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:49:41 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A358860C17;
 Mon, 12 Jul 2021 16:49:40 +0000 (UTC)
Date: Mon, 12 Jul 2021 17:49:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] trace, lttng: require .pc files
Message-ID: <YOxyod8xA1TAHEV2@stefanha-x1.localdomain>
References: <20210712155710.520889-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210712155710.520889-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5jEmBanwNLM6B/SN"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5jEmBanwNLM6B/SN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:57:10PM +0200, Paolo Bonzini wrote:
> The next version of lttng-libs will not require liburcu at run time anymo=
re.
> Therefore, it is expected that distros will not include the urcubp librar=
ies
> anymore when installing lttng-ust-devel.
>=20
> To avoid future problems, just require pkg-config to detect lttng-ust.
> The .pc files for lttng-ust correctly include liburcubp.a for static
> builds, and have always done since pkg-config files were added in 2011.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 18 ++----------------
>  meson.build       |  4 ----
>  trace/meson.build |  2 +-
>  3 files changed, 3 insertions(+), 21 deletions(-)

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--5jEmBanwNLM6B/SN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDscqEACgkQnKSrs4Gr
c8iy9gf/TnzW2HH72xIcry14xL1GeuczJaUK8YSljGfLQtaaURixZ+atLQkShpJg
jbPszYbZDfXsMJX16Ef5KA22taQC4iALzpj+F+iOZf8LbsHPdVUtaB9N0uSRER0D
1N6axCvuWknBdVCkPNf5YtybhVvUOmCjEo8lTVISIV3VQOvKXhr1OB7YpuL9lBmy
4C/4son7bMzL/n54AIg36wJtM6GRjPHsY70zvNEopuJvLOI38bEPYw9Vv3fM96T0
UZYlQSfCSn9J1VPvj1qwvii5QN4jU5yjLKum7Lahk3TepYiGl4015HkGML33mOQY
RHPxCqnWPTvNodFZIdSBdxLD1v19YA==
=CgZA
-----END PGP SIGNATURE-----

--5jEmBanwNLM6B/SN--


