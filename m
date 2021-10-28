Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBD43E579
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:50:37 +0200 (CEST)
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7fm-0000SL-Pk
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg7dt-0007Lx-FT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg7dq-0002m2-60
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sPnVR873xSU73E8yoqrPsC5Z5NymsE0ow/3/7eKOZtA=;
 b=e0/XgkBbZHKcrlrvk/GGVUfLoYmtNnPkBZZ6TfVySYVS7waE02DEqWLGYt7PfKlYxWtmH3
 kwYDKW/pTExExGalJwrF+JnFE55aC2puH4vvaWN5Yn3EADH+zppqZr3wg6m4unYnpM6uuh
 3WTu4F1gGAMhHby2RZibGWM9gism+qY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-owKwX0xbM2Cai790wP4Haw-1; Thu, 28 Oct 2021 11:48:31 -0400
X-MC-Unique: owKwX0xbM2Cai790wP4Haw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81D8F19251A6;
 Thu, 28 Oct 2021 15:48:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 172635C1B4;
 Thu, 28 Oct 2021 15:48:27 +0000 (UTC)
Date: Thu, 28 Oct 2021 16:48:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v4 14/25] include/systemu/blockdev.h: global state API
Message-ID: <YXrGSjxvkDjza0pq@stefanha-x1.localdomain>
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-15-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025101735.2060852-15-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ktlXqkRdTUOx/Y+E"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ktlXqkRdTUOx/Y+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 06:17:24AM -0400, Emanuele Giuseppe Esposito wrote:
> blockdev functions run always under the BQL lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/sysemu/blockdev.h | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ktlXqkRdTUOx/Y+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF6xkoACgkQnKSrs4Gr
c8iRsgf9FPMXwHv17dmv8KqSGFVLwCaLe3kzwkzKzKVa5iyjc0X5Dw4TjY129W+F
KmJiZcez3kn5ZJYes47DS1lgDXGBSi1j7Rb2MuUaqeXtOnBRxq4+q29n5emHOYLZ
ZpWbo6RJY3rWrsTvAUTmNeO3U2jx1ZY+2Qkyo01wreaIZ+1LNfv5iH9bd+wZqAXY
hE7PlFLctNOpO9ILyt4MTaUDHVt42lJvLhcA6+oolXZeC0XoEunOzBrX6AvJti8i
R28cx3+jz2ImwzpXiezY3iFt/NuFMv0wMjUChrjNERI+DbFhJ/hmeFh9B1+qEGtq
Z9H/qgP+9yBV6+28krX9it9afoBKYg==
=B/Bu
-----END PGP SIGNATURE-----

--ktlXqkRdTUOx/Y+E--


