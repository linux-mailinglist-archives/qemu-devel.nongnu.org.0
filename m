Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBD49CB06
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:39:35 +0100 (CET)
Received: from localhost ([::1]:37478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiWL-0006P9-Gm
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCi97-0001Wi-71
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCi95-0002ol-MH
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643202931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L/B5Ph6pKN7AlfJd09WeXqzFtnU7oZ/B2bY4rCfPDIo=;
 b=LrLX8drudGx6wMpOTr0zNEA3G2IRSmBdfIvYZapRehAvLAZlZFlLEGksEYbyzx+djVX+Cu
 1Ivpv7V8HyjijN42W1T7xSaikgC6A9MtystvnY5rIIEpnar1VHRkw0MS+uQR+mHzkNydNc
 xsrKnI57pie6HLq7n+xNBZuO/fqR21U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-eIC0rQD0OV62lwrpA8otHA-1; Wed, 26 Jan 2022 08:15:25 -0500
X-MC-Unique: eIC0rQD0OV62lwrpA8otHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A0610B7464;
 Wed, 26 Jan 2022 13:15:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BAB96A8EC;
 Wed, 26 Jan 2022 13:15:14 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:15:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-7.0 0/4] hw/nvme: zoned random write area
Message-ID: <YfFJYXZwqOGN5fX8@stefanha-x1.localdomain>
References: <20211125073735.248403-1-its@irrelevant.dk>
 <YfENU6BVuYkGYhnb@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CUOpzwrkZW2Ii2T/"
Content-Disposition: inline
In-Reply-To: <YfENU6BVuYkGYhnb@apples>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CUOpzwrkZW2Ii2T/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 09:58:59AM +0100, Klaus Jensen wrote:
> On Nov 25 08:37, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > This series adds support for a zoned random write area as standardized
> > in TP 4076 ("Zoned Random Write Area").
> >=20
> > Klaus Jensen (4):
> >   hw/nvme: add struct for zone management send
> >   hw/nvme: add zone attribute get/set helpers
> >   hw/nvme: add ozcs enum
> >   hw/nvme: add support for zoned random write area
> >=20
> >  hw/nvme/ctrl.c       | 185 ++++++++++++++++++++++++++++++++++++-------
> >  hw/nvme/ns.c         |  61 +++++++++++++-
> >  hw/nvme/nvme.h       |  10 +++
> >  hw/nvme/trace-events |   1 +
> >  include/block/nvme.h |  43 +++++++++-
> >  5 files changed, 271 insertions(+), 29 deletions(-)
> >=20
> > --=20
> > 2.34.0
> >=20
>=20
> Bzzzzz ping :)

Hi Klaus,
Are you pinging Keith? It's not clear from the "To:" header and I want
to check that I'm not holding up your patches.

Thanks,
Stefan

--CUOpzwrkZW2Ii2T/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxSWEACgkQnKSrs4Gr
c8hvCAf9GWjrEVyKBU+m8kfIFK7aT+zaJIuPYWOzBrCxk32mmWpwa6RmcoLXnym3
hOWdjB9nJsJluTqN3u7sj8VtBb08TBxvffNqkUkLAAGqQuu22A5IbsLY53bSpzDE
+fUUFQ61+6lRLvkibIHnZhJaU4/EYPLG6XnvG/ML9qU2SFZvTCiNpE0Q4paLToX7
EeAWRgU1vfkAKI5LHrHHdu6pKgeNFHhHT+SN74m1OfkhJLfDx/tNOTlIaGADiYLN
7UHTeInGEoVzARSWsvYjU0Ix9gViPACW8w9L2stzxg/RR1WBmSLK3/KwivGtstYM
KI+NqQwuxM1960gfsuKLHSDFcSqltg==
=1EOi
-----END PGP SIGNATURE-----

--CUOpzwrkZW2Ii2T/--


