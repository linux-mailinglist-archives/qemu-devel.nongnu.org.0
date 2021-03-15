Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DE33B01C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:40:29 +0100 (CET)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkeC-0002Dw-04
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkbn-0008NF-Ko
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkbl-0006sV-TZ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615804677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xd0LYRsRL+iVtRzxvBDwYkFFChhAknFes4GXT+zKafA=;
 b=Uw7nQzDyDNSLtmpzNbl0ev70OKfaf8fJj5R3AYyqDNpqXdIIWU67YKgp6eZ4wVc2iVJ/fK
 6mV2pRrNHSp3/yo1bp15T29sdpQuVuJIK5ggkefTeUjHL1asOTno0zxgkeZlbpwbkFrrYD
 0XkY9SU8cmmHIJYc/9ghZhpcdiGE7PM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-7VPILmNGOH-bDxh9yGO6xw-1; Mon, 15 Mar 2021 06:37:54 -0400
X-MC-Unique: 7VPILmNGOH-bDxh9yGO6xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2CAC802B45;
 Mon, 15 Mar 2021 10:37:53 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78B3519D7C;
 Mon, 15 Mar 2021 10:37:47 +0000 (UTC)
Date: Mon, 15 Mar 2021 10:37:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 4/7] vhost-user: Convert slave channel to
 QIOChannelSocket
Message-ID: <YE84+q2TovYnEaOt@stefanha-x1.localdomain>
References: <20210312092212.782255-1-groug@kaod.org>
 <20210312092212.782255-5-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312092212.782255-5-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c85XUR3y/frWUTJ3"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--c85XUR3y/frWUTJ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 10:22:09AM +0100, Greg Kurz wrote:
> The slave channel is implemented with socketpair() : QEMU creates
> the pair, passes one of the socket to virtiofsd and monitors the
> other one with the main event loop using qemu_set_fd_handler().
>=20
> In order to fix a potential deadlock between QEMU and a vhost-user
> external process (e.g. virtiofsd with DAX), we want to be able to
> monitor and service the slave channel while handling vhost-user
> requests.
>=20
> Prepare ground for this by converting the slave channel to be a
> QIOChannelSocket. This will make monitoring of the slave channel
> as simple as calling qio_channel_add_watch_source(). Since the
> connection is already established between the two sockets, only
> incoming I/O (G_IO_IN) and disconnect (G_IO_HUP) need to be
> serviced.
>=20
> This also allows to get rid of the ancillary data parsing since
> QIOChannelSocket can do this for us. Note that the MSG_CTRUNC
> check is dropped on the way because QIOChannelSocket ignores this
> case. This isn't a problem since slave_read() provisions space for
> 8 file descriptors, but affected vhost-user slave protocol messages
> generally only convey one. If for some reason a buggy implementation
> passes more file descriptors, no need to break the connection, just
> like we don't break it if some other type of ancillary data is
> received : this isn't explicitely violating the protocol per-se so
> it seems better to ignore it.
>=20
> The current code errors out on short reads and writes. Use the
> qio_channel_*_all() variants to address this on the way.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - also monitor G_IO_HUP (Stefan)
>     - use the qio_channel_*_all() variants (Daniel)
>     - simplified thanks to previous refactoring
> ---
>  hw/virtio/vhost-user.c | 99 +++++++++++++++++-------------------------
>  1 file changed, 39 insertions(+), 60 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--c85XUR3y/frWUTJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPOPoACgkQnKSrs4Gr
c8ijcQf/Qu2ubAfZz5af2E39xRaithVNomVYwwHT/O5lLGZS2pP36o++umCZMgzY
v4w6pSC0qUUmf5/4CIWr5NfY7beh7GG/O/lXD/eYzZlJ4Y2DqRx7TBZi8ZZR/lzd
3YQi/gwcmnkDHYC1LQDhNyF+I12D15+1Fv52UwXTWN89Pz/4YUxGiZ8yiFcZsCWe
QFc2VGzFOn1Iq65GYqj93/YTMj3kmxrGurp/ED0hnkp0QL3ckR2XDxJGvbwO1fhs
eLcwr28MgsCxCIbX/JkrJkrFXW/YxOE/GWnR5DpzBfUgG5IQ1kywekJyFuD5IqqK
qjAbY7oZAouuyexs+6D21XLWsE8fjg==
=VFJP
-----END PGP SIGNATURE-----

--c85XUR3y/frWUTJ3--


