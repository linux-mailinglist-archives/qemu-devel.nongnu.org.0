Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D63A197C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:27:26 +0200 (CEST)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr073-0004Se-Cz
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqzsf-0003n5-Hs
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqzse-0005E7-0M
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623251551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0gYfjTlUFsGoLoQ2bNM9atNv0YCMJ7JpHa7CrZeKrY=;
 b=bj5biVVMILF0Ouu63PxE29rEv3MclPXJwhaacCEqLHtf6V46zKwF4RQyRUQX/Mxt3VgWeJ
 dJS9VKXrOBNDpieMDy4QwEKE9HVvwvhrj344wq1JtGczbQIrGkHxUiXIFxdnrKwA9lwmX3
 yk5rQkMXB8sjTHhi7M6JtUkHMjC8b64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-m36WOQAJOOu2z-Xf6PNEWw-1; Wed, 09 Jun 2021 11:12:29 -0400
X-MC-Unique: m36WOQAJOOu2z-Xf6PNEWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE32E80ED9B
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:12:28 +0000 (UTC)
Received: from localhost (ovpn-115-220.ams2.redhat.com [10.36.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5547E60853;
 Wed,  9 Jun 2021 15:12:22 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:12:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 13/13] meson: move virtio-gl trace events to separate
 file
Message-ID: <YMDaSmc2ggoiaflb@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <20210601132414.432430-14-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-14-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IyPf8m/yeVaPdrI7"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--IyPf8m/yeVaPdrI7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:24:14PM +0200, Gerd Hoffmann wrote:
> Move virtio-gpu-gl trace events to separate trace-events-virtio-gl file.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/trace-virtio-gl.h      |  1 +
>  hw/display/virtio-gpu-virgl.c     |  2 +-
>  hw/display/meson.build            |  4 ++++
>  hw/display/trace-events           | 19 -------------------
>  hw/display/trace-events-virtio-gl | 18 ++++++++++++++++++
>  5 files changed, 24 insertions(+), 20 deletions(-)
>  create mode 100644 hw/display/trace-virtio-gl.h
>  create mode 100644 hw/display/trace-events-virtio-gl

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--IyPf8m/yeVaPdrI7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDA2koACgkQnKSrs4Gr
c8jC9Qf7B5bOpmnBwGvo0/2fR+VbWB1aSIKx7GANRKvi02EDBtDvlTdkxt/BGbL3
7CnAnUnrPtnskD7l8/mGS+K7jAuDHlrziHl0nUbCKPPQDWMoMobX+cLH4oGwX92L
g+nPQ0QkpaskslRyjckft8IbVoKCUKnWp+LK6NJq7bA5s8DQw49b91flp3j8dGKx
DzvwqBi0BUnLqeg6nK7TQI7bc+SX/by3CmqmUTQVV9uhQ3Tqv3aAKUUMdkA19BrQ
IkpQ+uA/fKt61eApO949w0kzL7Y0hDsVwrVo4GEV5Ggm+WQeBfcIYWuMVYxypZdI
h6+hd43k7TP58gde7NBkdP9bUrEpSA==
=5f/s
-----END PGP SIGNATURE-----

--IyPf8m/yeVaPdrI7--


