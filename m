Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CA305EA5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:51:17 +0100 (CET)
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mA8-0007R2-OE
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4m7I-0004Ew-UR
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:48:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4m7H-00014U-9i
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611758898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oEoXV4hRew9dMIF6XHwgGTo1Gh1gpHiSNF5xn2Yfcg0=;
 b=I/xPSl3svUhl6/p/8brX2OXArHV2s319XMWMHg0YTWDofZlEXTuJpO6cvJwFU8G28UX/EV
 6LUrH37HBOFsmkaIfpACVGJSvja7iBud+iZ8gjNOaJxFVU6wOiF9tPS3KtcX6nPIUKCSyX
 e7dNqTAJHIJqXrpuQp0G0O+sGaXNB0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-1-tFsY3bN22_DNXZTdv0NQ-1; Wed, 27 Jan 2021 09:48:14 -0500
X-MC-Unique: 1-tFsY3bN22_DNXZTdv0NQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8885E8066EF
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:48:12 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 144FE27C48;
 Wed, 27 Jan 2021 14:48:08 +0000 (UTC)
Date: Wed, 27 Jan 2021 14:48:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/8] meson: add trace_events_config[]
Message-ID: <20210127144808.GD310142@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-2-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:21PM +0100, Gerd Hoffmann wrote:
> It's an array of dicts, where each dict holds the configuration for one
> trace-events file.  For now just fill it from trace_events_subdirs.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build       |  1 +
>  trace/meson.build | 21 ++++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARfSgACgkQnKSrs4Gr
c8grWQf/X8VMZVp/GPomcByEXtE3BYzv7htgMq85HLorW2a8UPEOz4wBIJvRP394
uPE1QnK2BS/Ne6bk38O6c9XgqwLQMyeem6foI0lsA7qdhSYfT2/+bUoBX+d4l2CO
A2loxQ6GtZNeoxpldkNdDqh+YxSXbRpsyYW8qtj0bMgjLzxgEnyMExQaKoZLUgmA
4aBd3lkl293rMn+TGFPlD6ss0uN74J6O3J9x6IiS3TrkEJvU2uwylUO1uFenuqbw
OfjPQV5Bbzip/NRGS4j5UG1NLWV7KHzF/opruJ9sd8UbHvyz0JJXqvqJe4K8xvbs
d/ZWC3FaKzIjX2tv4MJus66SnEuHvw==
=cVB/
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--


