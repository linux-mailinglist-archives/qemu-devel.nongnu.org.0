Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359964BE2D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5CQV-0004Cr-Ne; Tue, 13 Dec 2022 16:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p5CQP-0004Cc-5M
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:02:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p5CQN-0000gZ-AV
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670965369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=41WXJPcoYnyOTvrqQOR6/K4A9TT5KGgHptEpOTWy2E0=;
 b=IRdZPbAhVlvfLlbHNNAq/+iXiby2l8+Pj34X+8GP/RDL0I2oURCJKua306pxKxc1ZYywiJ
 FXti8v67qYIXoQsWnzEJHoO7Ts9so4Jq5v8IJwrrn1Z0nOOlVGZQdDXNQIlHvYnGipdVNH
 aHxST6pxNhLRkvJZmvDT2kFXK1ttlSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-yPxOwIHAOx-hFQym4lLGBw-1; Tue, 13 Dec 2022 16:02:47 -0500
X-MC-Unique: yPxOwIHAOx-hFQym4lLGBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DA4285A5A6;
 Tue, 13 Dec 2022 21:02:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03C382166B26;
 Tue, 13 Dec 2022 21:02:46 +0000 (UTC)
Date: Tue, 13 Dec 2022 16:02:43 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jon Maloy <jmaloy@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, pbonzini@redhat.com,
 jasowang@redhat.com, philmd@linaro.com, kraxel@redhat.com
Subject: Re: [PATCH v3 0/2] hw/usb: add configuration flags for emulated and
 passthru usb smartcard
Message-ID: <Y5joc7na7wFJtjt2@fedora>
References: <20221212220949.1278269-1-jmaloy@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M+B7yo+Ar6SO2ZE9"
Content-Disposition: inline
In-Reply-To: <20221212220949.1278269-1-jmaloy@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--M+B7yo+Ar6SO2ZE9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 05:09:47PM -0500, Jon Maloy wrote:
> We add three new configuration flags, LIBCACARD, USB_SMARTCARD_PASSTHRU
> and USB_SMARTCARD_EMULATED in order to improve configurability of these
> functionalities.
>=20
> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
>=20
> ---
> v2: Added a LIBACARD flag, plus reversed 'select' clauses, as suggested
>     by Paolo Bonzini and Marc-Andr=E9 Lureau.
>=20
> v3: Split in two commits, so that LIBCACARD is added separately, as sugge=
sted
>     by Philippe Mathieu-Daud=E9.
>=20
>=20
> Jon Maloy (2):
>   hw/usb: add configuration flags for emulated and passthru usb
>     smartcard
>   hw/usb: add configuration flag for Common Access Card library code
>=20
>  Kconfig.host       |  3 +++
>  hw/usb/Kconfig     | 14 ++++++++++++++
>  hw/usb/meson.build | 11 ++++-------
>  meson.build        |  1 +
>  4 files changed, 22 insertions(+), 7 deletions(-)
>=20
> --=20
> 2.35.3
>=20

I have CCed Gerd Hoffmann since he is the hw/usb/ maintainer.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--M+B7yo+Ar6SO2ZE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOY6HMACgkQnKSrs4Gr
c8iEsQf9GW3T33UEUXyAAip0QDTRZfoUUToqSagCWE6/FhNhuamAP0XLqcxYvyVJ
Y5FnHIVwumxFnww6mM95zrR+A2l86wXx49NbJvJDjZtyAPO4VClO8uY4f37qOrsf
yVjCgJeHnHxlI0b8IRMqOysqUb2VOmXdlP+QR3b+wwxdQROG0PhwtWSMgGFIZQg5
fJYKOzRElyk91M2kejO6ACgfqpRmklaN8UBWMQAX16MmGlXXhOMnG89zBCo4L8qa
+p12qkCTJYzXchgC9SqVuLnqfneWmuaaXwWz8cxzu2W+kgEvfFg7JvdQSO1dm9Ay
3naGQ4nxJIdcTebmwt/Aqc2MHOIbiQ==
=nTur
-----END PGP SIGNATURE-----

--M+B7yo+Ar6SO2ZE9--


