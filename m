Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A3699975
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgkT-0005si-F2; Thu, 16 Feb 2023 11:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pSgkR-0005sS-Ma
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:04:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pSgkP-0007Pu-Jh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676563476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8g2tf6ms247Cko0hk3yZynT+Qt46e0bZYF3Nur0Is0k=;
 b=e83JVsnmXumM+m/m6rQcskcP9mO+/2fSRts0oitemxYrB5Bu2mMEKXCbmvVWvBHxIZQ4+j
 4lHGRgx5+Jm9ZJwhCu92I2o0Q3ECDuY2rpCWPpCTeH/kfjFJvUauLXmD9wNuM7BOK4C9SY
 NTyX+iefLodefLQhWzIPoSvwqwA3f9Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-4cNy0-IYMXSTfQnpsIOxLQ-1; Thu, 16 Feb 2023 11:04:34 -0500
X-MC-Unique: 4cNy0-IYMXSTfQnpsIOxLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8040F2807D91
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 16:04:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3AC743FBE;
 Thu, 16 Feb 2023 16:04:25 +0000 (UTC)
Date: Thu, 16 Feb 2023 11:04:23 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 0/2] vhost: memslot handling improvements
Message-ID: <Y+5UB2+lrNf1pWOH@fedora>
References: <20230216114752.198627-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A8c4F8+q5NV+THdd"
Content-Disposition: inline
In-Reply-To: <20230216114752.198627-1-david@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--A8c4F8+q5NV+THdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 12:47:50PM +0100, David Hildenbrand wrote:
> Following up on my previous work to make virtio-mem consume multiple
> memslots dynamically [1] that requires precise accounting between used vs.
> reserved memslots, I realized that vhost makes this extra hard by
> filtering out some memory region sections (so they don't consume a
> memslot) in the vhost-user case, which messes up the whole memslot
> accounting.
>=20
> This series fixes what I found to be broken and prepares for more work on
> [1]. Further, it cleanes up the merge checks that I consider unnecessary.
>=20
> [1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com
>=20
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
> David Hildenbrand (2):
>   vhost: Defer filtering memory sections until building the vhost memory
>     structure
>   vhost: Remove vhost_backend_can_merge() callback
>=20
>  hw/virtio/vhost-user.c            | 14 -----
>  hw/virtio/vhost-vdpa.c            |  1 -
>  hw/virtio/vhost.c                 | 85 ++++++++++++++++++++-----------
>  include/hw/virtio/vhost-backend.h |  4 --
>  4 files changed, 56 insertions(+), 48 deletions(-)
>=20
> --=20
> 2.39.1
>=20

I'm not familiar enough with the memslot code to review this properly,
but overall it looks okay:

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--A8c4F8+q5NV+THdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPuVAcACgkQnKSrs4Gr
c8inOgf/WP0IzJVtcBOprRV4TEMPymUGrRUraOWnChwTCOIPiamqX/zzocPz0YoB
dqPgiLk4qE/7q6PnOOSRSCi1iMCxqVndMijgwnClkd5lvI7O3O7CXk/EBnWQsQqe
knBG9/JrqItnvcT5Ta2abZydYYCaPFVAtW0s1zS90C2JB88ka6beCg8LSQwGjQG5
nz1W2Qc0UX1rt+PeKW+FVsIN4J1O+lVI/3m+KyDpn+seR3m7mrOosviBjdTQbZ1p
Y7pCEJ8YSwaAjJBzyOlfmEp2I83iG2nSJm9P1TiFPtDzLrxUVHg6vJmWsBrJjEzP
bhxcbeoCwxmwwFQXaBxT9agBy7dUnw==
=EqxW
-----END PGP SIGNATURE-----

--A8c4F8+q5NV+THdd--


