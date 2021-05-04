Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD441372D19
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:37:48 +0200 (CEST)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldx7L-0001kF-Oz
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwtu-0006vi-Rr
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwto-0007uF-T4
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620141827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoFajwK2+KaSGN1q6DQ9vQXxDLX/1/ewFCWTb30+7S0=;
 b=RJdaMY7kOx3q5WOHpexaTM5IoFnKMUltidDWafH3UuHsfx48zyoPD3KzDis8mtyqru0Lrj
 E7g2NNVUoMOP9ofq3DC6SDwSM9+ood0F6gsT26z8NaB8h4h45BmF7QnwsqwNg1j82V3mkf
 MvJ+0aGGDRqffCxMdvvtOg41Pi/5Etk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-jFSz1yfzNbqZjmXsSlC2uA-1; Tue, 04 May 2021 11:23:45 -0400
X-MC-Unique: jFSz1yfzNbqZjmXsSlC2uA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 063F0A40C0;
 Tue,  4 May 2021 15:23:44 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3266270132;
 Tue,  4 May 2021 15:23:40 +0000 (UTC)
Date: Tue, 4 May 2021 16:23:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 03/26] DAX: vhost-user: Rework slave return values
Message-ID: <YJFm+hocgArYnWAB@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-4-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5/zrdj0q8vqjEIcX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5/zrdj0q8vqjEIcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:37PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> All the current slave handlers on the qemu side generate an 'int'
> return value that's squashed down to a bool (!!ret) and stuffed into
> a uint64_t (field of a union) to be returned.
>=20
> Move the uint64_t type back up through the individual handlers so
> that we can make one actually return a full uint64_t.
>=20
> Note that the definition in the interop spec says most of these
> cases are defined as returning 0 on success and non-0 for failure,
> so it's OK to change from a bool to another non-0.
>=20
> Vivek:
> This is needed because upcoming patches in series will add new functions
> which want to return full error code. Existing functions continue to
> return true/false so, it should not lead to change of behavior for
> existing users.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/virtio/vhost-backend.c         |  6 +++---
>  hw/virtio/vhost-user.c            | 31 ++++++++++++++++---------------
>  include/hw/virtio/vhost-backend.h |  2 +-
>  3 files changed, 20 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 31b33bde37..1686c94767 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -401,8 +401,8 @@ int vhost_backend_invalidate_device_iotlb(struct vhos=
t_dev *dev,
>      return -ENODEV;
>  }
> =20
> -int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> -                                          struct vhost_iotlb_msg *imsg)
> +uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> +                                        struct vhost_iotlb_msg *imsg)
>  {
>      int ret =3D 0;

This patch is messy. We want uint64_t but these functions use int ret
internally. The actual return values are true/false instead of int 0 and
1.

Please use uint64_t everywhere: return 0 for success and 1 for failure
instead of bool literals and change the type of the local ret variables
to uint64_t.

--5/zrdj0q8vqjEIcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRZvoACgkQnKSrs4Gr
c8hSxwgAhIRRgCfofoK5LR7BpWo9nxPvctmSjfFwzQ34/YadBAUgEFJ0CgFf1kpe
1FT84oUOenqvSsYsoQPityAnwchQ/VyKu1LskP3TEOiUQmFuAW1cnfrNiIal1Oie
hPnRXDWDSD/6tBKdfsOORbqU62yjS9YR4HUH6gJ38tKcRyPmV+Pb/PShsZDIYOI/
XFL7ckZyATsbY4N4SOdczrEa/m+Xo0BIqbI5s6dhJCa4yzwEmFNgYsVTYpC+3J6f
DMnShVLA1/q36hasc2SdZMQpt48VUgzGLQdptuasy7ttvJAXWk6oNraQPz39cP41
65pRj7W5dcr4w9omMEkVrRFnbhLFGw==
=l5IW
-----END PGP SIGNATURE-----

--5/zrdj0q8vqjEIcX--


