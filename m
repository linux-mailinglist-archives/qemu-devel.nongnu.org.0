Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D53A14BF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:44:22 +0200 (CEST)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxZF-0001Pw-CS
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqxXm-0000R5-7b
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:42:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqxXk-0000CC-8T
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i8qUtTfrHQBLAAasY75UBvQq7CQroZ+cDIYrdrSVH24=;
 b=BCgRJugPI4SFZHFlMpOACWIi5zs0dEA6a4k7APVSjZ55JMsts3sNXr8oJNhV17x60KwBh4
 ytHqhE1A7nJdauA/7LSkrXru1qwZ/I10P/rhPMs4McDc6y9tpnP9FZzxYz6O4jG1fORvRf
 yTHu8nGmWpa5W9/dalfnr8Zhukk4Nj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-gItH1LJGM_m1dbdeSqz3Iw-1; Wed, 09 Jun 2021 08:42:38 -0400
X-MC-Unique: gItH1LJGM_m1dbdeSqz3Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C8EF1850600
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 12:42:37 +0000 (UTC)
Received: from localhost (ovpn-115-220.ams2.redhat.com [10.36.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E8119C46;
 Wed,  9 Jun 2021 12:42:30 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:42:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 07/13] meson: move up hw subdir (specifically before
 trace subdir)
Message-ID: <YMC3NRPh68UuEZPe@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <20210601132414.432430-8-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-8-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tdOiAOUKaoiP6fwK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tdOiAOUKaoiP6fwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:24:08PM +0200, Gerd Hoffmann wrote:
> Needed so trace/meson.build can see trace_events_config[]
> changes done in hw/*/meson.build.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tdOiAOUKaoiP6fwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDAtzQACgkQnKSrs4Gr
c8jiIQgAl4H87z97YhfY7Qm9Kf8FHAzshnfSwO/UHvrrz48Dqpj7T7d87O8ViHXp
oFfOYeyT3HhKwHg4NtodqYFhBFSqvZOSoPy3vo7KWyDcYkEYHsYfY7eWYUB0rUsC
pLXynHFUitZrgNJveFRr2BXUQYzxRu+bdWLy9aECmBJPL84pZK5F/dH92CY6Kku5
xRRv6rzjvM83HjqqcYqiz47tV3rC9TFKQ7VBgx1BGdJaRAppI/oj1fyBIP4dhJH/
WBwXkVDRjmpXhvAWDV7P1Z17Wc26nUzFLSTJtLStEnFhvRkhqxw6fADxK2hYdKNA
pmJDPpOm4Vz/I6ctjeuxhUyRN4i6uQ==
=w6kh
-----END PGP SIGNATURE-----

--tdOiAOUKaoiP6fwK--


