Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C95652833
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:05:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7jnl-0005T7-EW; Tue, 20 Dec 2022 16:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7jni-0005Sb-Cc
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:05:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7jng-0004Hl-Rl
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671570324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1mJK/JkAWe8QIwuULML8tJgjrILJ+kgJzCGgmhGGI4=;
 b=FtZWYc96RR4CkjJ7LeRv7gS+sSA+ZBxtZgP8MoNvgjY3hCuHxLIiF2yLaI1TFzNLb8cAf4
 pArtg4oEFJyAwwMqqt8CrH2ur7SUJRdsTYjiaIgYtm6yl9uhYZVqkadtBPKuljO+HNaxRg
 iCMokD2Fg6Z6gTf9iCklTAKppcF/YOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-7h62SR0-Nc2tkJ5KwXojBw-1; Tue, 20 Dec 2022 16:05:20 -0500
X-MC-Unique: 7h62SR0-Nc2tkJ5KwXojBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 983ED101A52E;
 Tue, 20 Dec 2022 21:05:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 014474014D1A;
 Tue, 20 Dec 2022 21:05:18 +0000 (UTC)
Date: Tue, 20 Dec 2022 16:05:17 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com
Subject: Re: [RFC v5 0/3] Add zoned storage emulation to virtio-blk driver
Message-ID: <Y6IjjRFUxtHHbh5K@fedora>
References: <20221219081644.11790-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="89T1HWTe3NxFOk29"
Content-Disposition: inline
In-Reply-To: <20221219081644.11790-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--89T1HWTe3NxFOk29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2022 at 04:16:41PM +0800, Sam Li wrote:
> Note: the virtio-blk headers isn't upstream in the kernel yet therefore
> marked as an RFC. More information can be found here:
> https://patchwork.kernel.org/project/linux-block/cover/20221030043545.974223-1-dmitry.fomichev@wdc.com/

The VIRTIO spec changes have been merged. The Linux virtio_blk guest
driver patches are in Michael Tsirkin's vhost tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/tree/drivers/block/virtio_blk.c?h=vhost

The "RFC" can be dropped as soon as Linus merges the changes. Almost
there!

--89T1HWTe3NxFOk29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOiI40ACgkQnKSrs4Gr
c8g6Ngf+MepxfD1vY65K4p9IJbPov19DxbaD03MLJ7/DksODUyx6lDO/KlEOEXJ3
5w3fPbswpipylx74mgeP6WRjkOv+oeR0OQVRvLyde6TCJe3bmolfauJBNezdPoZL
DbhKBK9CdipHWLVrAthCm+PW+ywU+2FE9NZ7gEtzzorMFn4kQVhISEivwFl6OMxV
YV4Yfn978txUhL1zlmf5GkkeYlhBVM64r1SF3/wtOGXANy2JmgmxSBY7C5Nv5pzC
QNxxAMH0onPaaHcAhzdS3Vfe2BQ+q23X3GzUtUGpD3oSpDXoDdcbmC3jeVsFEySy
hEQzVKpzU/6X3RYo97NGIDRYUlE04w==
=B4Du
-----END PGP SIGNATURE-----

--89T1HWTe3NxFOk29--


