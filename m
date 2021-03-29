Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8690934D5D3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:14:10 +0200 (CEST)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvSr-0001Ea-J7
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvM3-0004vE-OD
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvM0-0003vZ-GZ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617037623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ukgZQvSER+jzWAQDbYdtxFn+ox9pKDg/BlYGL+DV26M=;
 b=NXs7yvrj95DHbmTCPRMQ8Lx075zoGlLSxD+oZhnPVsWNr8qTGz0AtGRrwrXeqEHF5+xPXI
 gqhJVdLanM/eJxWIV9WwPqm+BacKrwgxgZJYe3xgjFjR/WTPcDM8MPV9LAyr9Rq9PjJarf
 I+eRNfa9tKfV7HdLrXQTe4y/5atim9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-WNjp8zsyOmqwePEzzDxiwg-1; Mon, 29 Mar 2021 13:07:01 -0400
X-MC-Unique: WNjp8zsyOmqwePEzzDxiwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3EB8802690;
 Mon, 29 Mar 2021 17:06:59 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEABA90A04;
 Mon, 29 Mar 2021 17:06:56 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:06:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 2/8] virtio: Introduce virtio_bus_set_host_notifiers()
Message-ID: <YGIJLyhbhKQ5yNfO@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="macCRpfgApiKaptK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--macCRpfgApiKaptK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:29PM +0100, Greg Kurz wrote:
> Multiqueue devices such as virtio-scsi or virtio-blk, all open-code the
> same pattern to setup/tear down host notifiers of the request virtqueues.
> Consolidate the pattern in a new virtio_bus_set_host_notifiers() API.
> Since virtio-scsi and virtio-blk both fallback to userspace if host
> notifiers can't be set, e.g. file descriptor exhaustion, go for a
> warning rather than an error. Also make it oneshot to avoid flooding
> the logs since the message would be very likely the same for all
> virtqueues.
>=20
> Devices will be converted to use virtio_bus_set_host_notifiers() in
> separate patches.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/virtio/virtio-bus.h |  3 +++
>  hw/virtio/virtio-bus.c         | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--macCRpfgApiKaptK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiCS8ACgkQnKSrs4Gr
c8iz7Qf9HWqC2WUAHJjgAcYZYgsl8x/Su+MQFXnYfHA+ULVvgYaBzj4dCOZTi+BA
PG6KpPJMWZlCQVdduDC9Uz2irCeNlhhfix5l3GHOuetuko3GQBNzpDp2PWdOqw6t
O2Y49ohUUFL9QhNbTflA4F848XMOdNPGTeSFi2/CD1p5Ngi3CbCnspk3xfWrfdGQ
dHOrYCl137jY0sFSSl2ps8WJ6t+kx5ChsnBaFAbwpNtThkGkJuxM2ZKL+sXSf+UZ
z0hZ7SPZuWNxfHQcmxZy56QvZUmUQmcCV4LRGI0hugcnWKWv/etyWiePsxeQ4i3u
jrIGGhWzNXx0qsSC8lsya1mIkUct2g==
=ZEhr
-----END PGP SIGNATURE-----

--macCRpfgApiKaptK--


