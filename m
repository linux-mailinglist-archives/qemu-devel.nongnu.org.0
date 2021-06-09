Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C243A14A8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:40:33 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxVY-0004sf-2R
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqxUP-00040G-ED
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqxUO-0006CB-4F
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RXa+zWo8BUeFzR2DqaMV4St1a6XmZFs9eTiOISflQvk=;
 b=YOpa/q4kzUbs5SXCVxkFWm7E2WzJhGnHF+BaqnL1rp+sC+yOm1GviFooy3ZNKrRH44dVqG
 zFmy9Qe4R3gSlYVyRqjPZMc2kyU7+OHAxmjiZSDtE8dvZj2omxeqHw83hrI+MuI43ViiTN
 v1b5htP8xLYFU9CHw0Ysb1hYnXGQI6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-zNTyPi2YMQWskXYAXnWcwg-1; Wed, 09 Jun 2021 08:39:17 -0400
X-MC-Unique: zNTyPi2YMQWskXYAXnWcwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 830A71937FC1
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 12:39:16 +0000 (UTC)
Received: from localhost (ovpn-115-220.ams2.redhat.com [10.36.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15E3D5C1A3;
 Wed,  9 Jun 2021 12:39:09 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:39:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 01/13] qemu-trace-stap: changing SYSTEMTAP_TAPSET
 considered harmful.
Message-ID: <YMC2bL6ICVuUf+s1@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <20210601132414.432430-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-2-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PbzJhuzrtYhJTlaN"
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

--PbzJhuzrtYhJTlaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:24:02PM +0200, Gerd Hoffmann wrote:
> Setting SYSTEMTAP_TAPSET to some value other than
> /usr/share/systemtap/tapsets results in systemtap not finding the
> standard tapset library any more, which in turn breaks tracing because
> pid() and other standard systemtap functions are not available any more.
>=20
> So using SYSTEMTAP_TAPSET to point systemtap to the qemu probes will
> only work for the prefix=3D/usr installs because both qemu and system
> tapsets in the same directory then.  All other prefixes are broken.
>=20
> Fix that by using the "-I $tapsetdir" command line switch instead.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  scripts/qemu-trace-stap | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PbzJhuzrtYhJTlaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDAtmwACgkQnKSrs4Gr
c8hRcQgAyWTzAV9kdXRAW3UtuvkPhiIgMjnlxY6r9O+XfgOX4VRvWDcOfddKomlX
dWcChAyO7bsb8iqDbQ4B9/0o6TbZq6E1CS6+T026aWYC5955DE209kt80/XPdjul
5gxtc3JbDBW14kdx1JwRXcovFCaB4sQPCEK7LXNhEXi8PuyRQP658zO6D1lvMTkd
IxpzQTJHUUVJqef5zyCiwrweP+H/6HDwrIy5jFNPaf4rPNKzfrOCG9Wt4nm1PoF+
LzOIzlaKbj74arx1Qh+E0J1PpL5yRif1Z71BsitAJ95xnKDkm7Leb6Qt3sd6zejc
qEu/ZAqHk5FgezwDOoyQ5+KUC5U64g==
=9l4X
-----END PGP SIGNATURE-----

--PbzJhuzrtYhJTlaN--


