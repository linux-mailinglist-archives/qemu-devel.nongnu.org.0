Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976260E84D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlcb-000587-S5; Wed, 26 Oct 2022 14:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcZ-00054f-8V
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcX-0006zB-Dw
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+Jia8aXAt7xo/gcEWdpLbcZEyf6YjlyTihSxHRirXI=;
 b=DekVo3fUr4VcOkQZBBvlWsxWM5wFYJAFIpRwrQNTkMjytakPDe3RMqmvOA7Se+r/ncohyy
 ThiBCq9d2ip6shNmehFUGIDlXtzKH61MbqEcQvfvJ3bRM5Lzo6wriYFyKlaTNF3Y8Bicxi
 haDCD8ADRiI6eKzntXVvqZ0p2IRS1os=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-jCb2AlxoOoqJmlyNjxJixA-1; Wed, 26 Oct 2022 14:59:16 -0400
X-MC-Unique: jCb2AlxoOoqJmlyNjxJixA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94522932488;
 Wed, 26 Oct 2022 18:59:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46B5E40C2140;
 Wed, 26 Oct 2022 18:59:15 +0000 (UTC)
Date: Wed, 26 Oct 2022 14:54:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PULL 00/16] aspeed queue
Message-ID: <Y1mCYGRrb+XKwupK@fedora>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KAFDhxCVB4aekimU"
Content-Disposition: inline
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--KAFDhxCVB4aekimU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--KAFDhxCVB4aekimU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZgmAACgkQnKSrs4Gr
c8gUVQf/VCqO7IgWoJ/O8zAj/aLBLTkmPLm1IM0vp1jed5dWraMa2IbrfB9e7u+y
ZzQw3p5QQj5YRbGmREz+jspWAbM+oc1WFxn4q7Svuc/c9crNeYr2EY987NB2b435
+HDO9oSzmWURcHmeCnCkQ/XFmps+ObNi5l9C9Rf1Ogw8R2ADNpNLGfZYhk9IJBMR
uY5UykPxJ1F5N+ceQAPNYaotH27glF+gYz9/9K7zZriwAov/3olE/W9SAEaN6vuZ
KBPdSKEbx8Dvm+NvXdxYRA4D3muPn3whCGC9vEiEhaHGb3QL7IYWNtVdNrCHoi4U
tCcrz5JokSbVwQabz3PZyYHhrjztUA==
=SJBT
-----END PGP SIGNATURE-----

--KAFDhxCVB4aekimU--


