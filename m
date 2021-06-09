Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE93A19ED
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:37:49 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0H6-0002kv-VJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqzsa-0003WU-HX
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqzsX-00054g-3g
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623251543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=57QYpVx9yrIalSItQPcyYR5slGY0PGSymWdI+2vEKww=;
 b=NGrE5imBmL7KlVGsuyH4iX2XHnEz3Rf0On3KivSngKICnssRaCu/BWZCYzIRPoC9vuyIr3
 5DMiuB2S8o9Gp5FoN5E4DKLx/uYi0Ty+Z+ujsG/loXc+FXaSDPe6Ytxk3J/Z7ZC22f7Fr+
 tvnBUGasyZBZHjkqW+6UhDKuj3rdKRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-SXXqM9T3NsSUWpGECT8-2w-1; Wed, 09 Jun 2021 11:12:21 -0400
X-MC-Unique: SXXqM9T3NsSUWpGECT8-2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF78C8015A4
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:12:20 +0000 (UTC)
Received: from localhost (ovpn-115-220.ams2.redhat.com [10.36.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B61D5D6AD;
 Wed,  9 Jun 2021 15:12:14 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:11:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 12/13] meson: move virtio trace events to separate file
Message-ID: <YMDaNb4pwZNa9qfW@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <20210601132414.432430-13-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-13-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N6L283598wCasJhl"
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

--N6L283598wCasJhl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:24:13PM +0200, Gerd Hoffmann wrote:
> Move virtio-gpu trace events to separate trace-events-virtio file.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/trace-virtio.h      |  1 +
>  hw/display/virtio-gpu-base.c   |  2 +-
>  hw/display/virtio-gpu.c        |  2 +-
>  hw/display/meson.build         |  4 ++++
>  hw/display/trace-events        | 17 -----------------
>  hw/display/trace-events-virtio | 16 ++++++++++++++++
>  6 files changed, 23 insertions(+), 19 deletions(-)
>  create mode 100644 hw/display/trace-virtio.h
>  create mode 100644 hw/display/trace-events-virtio

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--N6L283598wCasJhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDA2jUACgkQnKSrs4Gr
c8glsAgApbKx2+/xRCWf6vBC02YWl79rVKY+DiJHRYbMdYHtQBr32wSsrEz7LuBE
dfybfUWBFpQRkzJiuvZcIzjCojY+bh+CqS65mIE301fEvh0Meb9+Q/DcbgIWsBoA
EprF/9G8DWLyHfixJrZV7UHhBljPzWYVWsvKd/Kn+NCyrJsV8HQ8haNvmbqwATV5
0Mp86UHKjgYg+ZK7EOGI+EvpojZSnGvwPP+jZPSauwkWgYAkyOaoQyepMSIZf2a3
gcmPaYRD8jWmYkzQuuBE+nH0jJGGf2c8NyyZzM4ACHlWNVwxhzIKuZYMZFZKho8s
/5WWhJythbzJM42v1eLV4EWXKEKRPw==
=Zk+R
-----END PGP SIGNATURE-----

--N6L283598wCasJhl--


