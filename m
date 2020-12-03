Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2772CD6B2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:29:12 +0100 (CET)
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkofX-00012X-NA
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkod1-0000Kq-MY
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kkocx-0002v4-FZ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607001990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C52yRVYN2U8RBvGVsFDFB05MBK165HRvzmvFCM7qGsY=;
 b=T1eWRKd9Zmj63CrrJ8seyC08LtT0pi0wUwaFX55tLNQ1N04r64BQdxxd7klic8KgHeTyVV
 JCftMivqMB2NXJMd4ZOIpJGppMAaeah3zqPkQZ3xKfq1wDs1k/VRmGgp0yMRV04OzC6RD/
 imRbu5Onzx79fKNGdS447mR7AOZAeLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-FVEE0IilMd6KOAXM0ApyEA-1; Thu, 03 Dec 2020 08:26:28 -0500
X-MC-Unique: FVEE0IilMd6KOAXM0ApyEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 893241005E5E;
 Thu,  3 Dec 2020 13:26:26 +0000 (UTC)
Received: from localhost (ovpn-116-25.rdu2.redhat.com [10.10.116.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37FF26091A;
 Thu,  3 Dec 2020 13:26:18 +0000 (UTC)
Date: Thu, 3 Dec 2020 14:26:17 +0100
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 04/12] microvm: make number of virtio transports
 runtime changeable
Message-ID: <20201203132617.6p4kga5awiiazzpt@mhamilton>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-5-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-5-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="adk2tu5bsypwio2p"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--adk2tu5bsypwio2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:54:15AM +0100, Gerd Hoffmann wrote:
> This will allow to increase the number of transports in
> case we have enough irq lines available for them all.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/microvm.h | 2 +-
>  hw/i386/microvm.c         | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--adk2tu5bsypwio2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/I53gACgkQ9GknjS8M
AjXhjg/9FW3RJhlrz5pGnC61TL0WsBKbr+20q5uKo02r+vJELR3K32crrrr9adKF
BhJPatqlDY1tt3O0CkhR5qoyGzYJPmmr4mwmSfQNA7163dY7Jm26aaCsz6+kTaPK
DOwQGAObZeJuLCS4NcT+HFeiiusRl3nHBq53X0hcrTkg/A0f71q10N17+9K+qms8
Fe2Bj8XfPtmmqcUy3XpQTqU7l1melLYhG6xPIstI4MXrtkteEgQrCS1Oxtdex6qb
EmymPPlC72liGpGi3W2xsOEbsgMrC9p1loc5jnNCn2Y3kAI6C3E2nCai+iFPEhq3
guNQKZe7Nafro3JnZhom8N32pv7I56/1c8+Ss+OEUdi4n/FeiC2Q3RR8V5Y1fygw
txDKNU4S7NW0buo74mQyxUYariEsGp7FoanVDBmsIQBge7vs5UgEBZq3fEAF1fUS
XRzBeOZ3D5dAM7QyO/pBxUaLR9ssJfzivN1kbv2qaLUnk0Z7NHczc4VjdslVVkJd
5TvF3ozpAfm5WpphMo9BPenqgjTlczejyRxTHiZwbgEHLrc3mqmGMFLPKMKwzOxM
6XuuqUzTMf2qxqaXXYo/k4QPLxlP1XnKCu6jigmu1IZRQjumenImv6O71Av68CxS
zfOWJYKCfisyu1f1xJAQ+Y0mek5WdNlVN2eLvfvrCULObeqwzU8=
=v7jX
-----END PGP SIGNATURE-----

--adk2tu5bsypwio2p--


