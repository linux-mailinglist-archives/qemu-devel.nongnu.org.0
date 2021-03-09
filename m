Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108CE332B0D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:53:12 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJefX-00034M-1K
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJe8Z-00056O-TC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJe8Y-0003XI-0k
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615303144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P4WU2ckTkZtsYvmebjCxRzMTO7EPvIn+Sq5cgyaRGnU=;
 b=d5p5NHmfVo2OU0pJtyXFqr8+3H8NIy+oAKv0X0daI8jHRXmnFvXOEIH0ssA80M/VoKcAFZ
 C1e1jBPaUwkwaOH4lVOq5osxvCMeTesGPciOh2B1iIMNCWATY9MWALaDHhlTX7GwLYuEEY
 jbcXWP++tYVKnhFRPozqgI7NcZ83zHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-PIbrQM1hNJmoqIb5XAcUiA-1; Tue, 09 Mar 2021 10:19:02 -0500
X-MC-Unique: PIbrQM1hNJmoqIb5XAcUiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C737801503;
 Tue,  9 Mar 2021 15:19:01 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A276C18A9E;
 Tue,  9 Mar 2021 15:18:57 +0000 (UTC)
Date: Tue, 9 Mar 2021 15:18:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/4] vhost-user: Monitor slave channel in vhost_user_read()
Message-ID: <YEeR4H8n7SUYVVlW@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-4-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210308123141.26444-4-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VeJ5KJPmiS8qD6eF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VeJ5KJPmiS8qD6eF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 01:31:40PM +0100, Greg Kurz wrote:
> @@ -363,8 +367,30 @@ static int vhost_user_read(struct vhost_dev *dev, Vh=
ostUserMsg *msg)
>      qemu_chr_be_update_read_handlers(chr->chr, ctxt);
>      qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &=
data);
> =20
> +    if (u->slave_ioc) {
> +        /*
> +         * This guarantees that all pending events in the main context
> +         * for the slave channel are purged. They will be re-detected
> +         * and processed now by the nested loop.
> +         */
> +        g_source_destroy(u->slave_src);
> +        g_source_unref(u->slave_src);
> +        u->slave_src =3D NULL;
> +        slave_src =3D qio_channel_add_watch_source(u->slave_ioc, G_IO_IN=
,

Why does slave_ioc use G_IO_IN while chr uses G_IO_IN | G_IO_HUP?

--VeJ5KJPmiS8qD6eF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHkeAACgkQnKSrs4Gr
c8grZgf+Pxd6PJuzj7K3aTaKfPxzBTuVcs1uGaW7itJjyug2rBBUSusScuAQRwo/
Jl08xzCBhzP1fAjhUungg06ecPUtexjzxM/9qWUw/WxgAOOo70EbLz3TCBx4A5t9
8aFwVeO9FWbTxs5yUnSDJSLvXdeV1idHeJ6Q4e6PbEA2Gzj9JTqmiL1sJDv7jONo
CBgeadfQzNhUVmgqBLpzLZTleSVZIYlEzMieac3+94c18pa3A3eFKgNuIOXd2wHR
8YiNHBexou+pb0vXusTHTyDQtOFkjuMevUqp+UeSsncl1L88mccC3wufnLWaYHC8
Q26qCLwQWz7nOjKXB1kyqyA8nEGgWQ==
=ywKA
-----END PGP SIGNATURE-----

--VeJ5KJPmiS8qD6eF--


