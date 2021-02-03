Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFC30DCE3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:35:50 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JG1-0000Zx-Je
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7JCa-00069L-Ds
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:32:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7JCX-0003ep-Bk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygAQl1mKK8jInDMMDg/u94WfLfhPxKlzzOPKrr6qBVw=;
 b=V4jRF00yQG03V8DYe5IpRaqPmNCXieEWUja1HTUa7mvADr9qztHgNcGpr0S6B4P4UAj6Eu
 tzVJK9OnO7Ip8Q3WLHfKkG3TU5sjwMxavKyipsN0hbrVZ/p4QzrGS2pmxPwMSWbsq0neRq
 O2+Y1jbQUGeHht3IY4A6BB8qTTg9kPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-ZejDRt44Mu2imNgwahrFYw-1; Wed, 03 Feb 2021 09:32:08 -0500
X-MC-Unique: ZejDRt44Mu2imNgwahrFYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05FC1801964;
 Wed,  3 Feb 2021 14:32:07 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E1BB5B4AE;
 Wed,  3 Feb 2021 14:31:57 +0000 (UTC)
Date: Wed, 3 Feb 2021 14:31:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 06/12] scripts/tracetool: Replace the word 'whitelist'
Message-ID: <20210203143156.GB74271@stefanha-x1.localdomain>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-7-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 09:58:18PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
>=20
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.m=
d
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  scripts/tracetool/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAas9wACgkQnKSrs4Gr
c8h6YwgAvNaD4zw1Wih6rCkEsnUEALgIFhFvPc8crga3zLMGR7aaLv9j54aEMFLw
L2N6m2dnOoVesaXE5+D+wEWPTm5CCRr4PgeYKM3k5areaaQKkNNQ+QRjcs0KMrxj
5dgpFEWLKvM/svv39LP1w0z6nYVTmXA9KCr/imJkyazavtpbJxAO3HJpbTsuqkkO
06eZRI/hpRweZUDA9+yl38qxscuoITgv4mry3RgSmNMjWrkRr/f3OIHQG5bg+9qC
TQrhJb1A9QylgBjAsZaxSENeeqTNOpfPKGjrDJyDliTa9IRLZmYcwxZp5WRXKvZL
HcvWy5GpjCu1H6wskVN/P4nO72z7TA==
=VhhC
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--


