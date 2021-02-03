Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C884930D7D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:43:53 +0100 (CET)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FdY-0007Ys-Su
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <otubo@redhat.com>) id 1l7Fc0-00073B-RA
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <otubo@redhat.com>) id 1l7Fby-0006Pr-4Y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612348931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6DEYCHSFU1I0/eXO2HEPuRqcE1zkeiuQOJ9kAYtxOYc=;
 b=Djhj9l2SScBfxYFZdncZECzH0DP87+DqtRjpGACIKAKTwQAkjsbLp/vfyteMNb4SBF5+aS
 retKESkCozjmGBIeo0V0ijL2TVt9kGwZFwCW7fxQZ3osGFjSn8dmvJ1TW1pRgdBf9PQsWE
 Zc2x8Bq+lHtGRhMIgGexD3lu7akJcaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-9aWgbiehOouYuvThdv0_iQ-1; Wed, 03 Feb 2021 05:42:08 -0500
X-MC-Unique: 9aWgbiehOouYuvThdv0_iQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B2CC803624;
 Wed,  3 Feb 2021 10:42:07 +0000 (UTC)
Received: from genji (ovpn-113-181.ams2.redhat.com [10.36.113.181])
 by smtp.corp.redhat.com (Postfix) with SMTP id 1F80D60BFA;
 Wed,  3 Feb 2021 10:41:54 +0000 (UTC)
Date: Wed, 3 Feb 2021 11:41:54 +0100
From: Eduardo Otubo <otubo@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 08/12] seccomp: Replace the word 'blacklist'
Message-ID: <20210203104154.GA5503@genji>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-9-philmd@redhat.com>
 <20210203101555.GI300990@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203101555.GI300990@redhat.com>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=otubo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=otubo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/02/2021 - 10:15:55, Daniel P. Berrange wrote:
> On Tue, Feb 02, 2021 at 09:58:20PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Follow the inclusive terminology from the "Conscious Language in your
> > Open Source Projects" guidelines [*] and replace the word "blacklist"
> > appropriately.
> >=20
> > [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq=
.md
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  softmmu/qemu-seccomp.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Acked-by: Eduardo Otubo <otubo@redhat.com>

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE1n4bUJN0hrQHI9ur3zLnwPD/+aIFAmAaffEACgkQ3zLnwPD/
+aJnIgf/ToUQYfZo6xWK3DdR3bpjdvle1Ik9g0uNL7ssq9N69hA6XrQY+vKPL47P
JUan1dKBhtDgYzIl4V/DDovoMziczAfRzHk0vZHAq/LzomJJhSTWbIe/drw62eF2
co7jWmmcReHdo3aznFOINizeNIUNPl8E01ai0YAOs6ikRGxKEG57rIheV28bJKWT
J07HB9c784bylAOhLQVAfSwj2YKx2XkHrETX/47HUz7nXo4DLuIhX/CsHRI6rpzy
INYo3uApVyTTDIBg7lI/hnlwNvg1TfePtO6Jans4awIzpGL/nQI0bUjVzwxT1G8q
GZZ50V+BO6vcnykQ1vtEYmcVKuLaIw==
=6fJG
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


