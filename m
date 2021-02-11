Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB973187EF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:19:48 +0100 (CET)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA94d-0006Zu-6S
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA8xU-0001xJ-Ta
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA8xO-0005eD-Op
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613038337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K8z99wPdzH+CjZKBLLXKqTYVHDCqWpzcL6e8fjIyvCA=;
 b=R5Yb3B6BllbLcBU3vLJdZdvC+bR86mwbaenM2rT1H+51fOQ8hWviIl2irWsmOZG94mvUV5
 ZDbWLZJMOdEdNoZkUoOSFq6+drI+YnKXiCFYmWrMNsRuuaN/SS9zmCAlLVPt4Q3Wzv+SIw
 Gn3L9L8pJ3XgvFVQcrDch3iQf4bqUNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-SOGqzLjaOXqANsAJe_DGnw-1; Thu, 11 Feb 2021 05:12:14 -0500
X-MC-Unique: SOGqzLjaOXqANsAJe_DGnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C60F107ACF9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:12:14 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5466D1001E73;
 Thu, 11 Feb 2021 10:12:04 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:12:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 03/24] DAX: libvhost-user: Allow popping a queue element
 with bad pointers
Message-ID: <20210211101203.GD247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-4-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:03PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Allow a daemon implemented with libvhost-user to accept an
> element with pointers to memory that aren't in the mapping table.
> The daemon might have some special way to deal with some special
> cases of this.
>=20
> The default behaviour doesn't change.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  block/export/vhost-user-blk-server.c      |  2 +-
>  contrib/vhost-user-blk/vhost-user-blk.c   |  3 +-
>  contrib/vhost-user-gpu/vhost-user-gpu.c   |  5 ++-
>  contrib/vhost-user-input/main.c           |  4 +-
>  contrib/vhost-user-scsi/vhost-user-scsi.c |  2 +-
>  subprojects/libvhost-user/libvhost-user.c | 51 ++++++++++++++++++-----
>  subprojects/libvhost-user/libvhost-user.h |  8 +++-
>  tests/vhost-user-bridge.c                 |  4 +-
>  tools/virtiofsd/fuse_virtio.c             |  3 +-
>  9 files changed, 60 insertions(+), 22 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlAvMACgkQnKSrs4Gr
c8ilsQf8CSqsiNBkY6EsYDPIyLsiF1zWKe6HBkpeVe4EH6SLuof7IGHKbXhWAH2m
Ro/wB4i2YLydIJAkNcibQb9MpC/N92trxjefaWiCIDZlv23xy74o10neWVuFz/cl
02cHnaORj0I62338RCdeHoowNP47Wr1D1e2tOpcIRIdtFxglrqdxeGxUz4QHP4J5
2zGYlhltqb/ABJ6dCIYDB9CliEL2j3Dkg7LvToW9Iu3yRa2PnTmmd1YpgN0XTeME
uXuxQCt3GHQ9nfVae5lUFPnOy/3EmNED5j/zI4Xf9/GKWnNH7yT+mYQIuGeBgguO
DQPz4KEZb9B+CqzgFVGBp6jfJRgXpQ==
=5yjg
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--


