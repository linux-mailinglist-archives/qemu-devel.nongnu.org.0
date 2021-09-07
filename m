Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2F402AF3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:42:57 +0200 (CEST)
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcJL-00089v-Q6
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNcIM-0007Tx-5c
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNcIJ-0002tZ-Bk
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631025709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fsi1FRzr6oLGFBGNaAVV+o4kB4ulTPOJoMyAHFtDTMM=;
 b=MPuSPpz5Hk/o5NXV6oySy46EzHNK8FbBDBd5Vpt5MfuZgEax0jiFg5CUEi9TStGLA9yv58
 FIwt78Zt5hdrhsQ65wkRDaXnB4jonC/4ouRRAu63+B4/75udQLZzjDBAl5B50UENNkVO0I
 eSO+2rOvtyj3k3/0s3vkRMt9+84HOKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-kZsOuZHCOh6TqjfWkGl3ZA-1; Tue, 07 Sep 2021 10:41:48 -0400
X-MC-Unique: kZsOuZHCOh6TqjfWkGl3ZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FA510054F6;
 Tue,  7 Sep 2021 14:41:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE9010013D7;
 Tue,  7 Sep 2021 14:41:42 +0000 (UTC)
Date: Tue, 7 Sep 2021 15:41:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 09/16] vfio-user: region read/write
Message-ID: <YTd6JYvksCTqM99k@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+/BlHZL71J3n5AGr"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+/BlHZL71J3n5AGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:42AM -0700, Elena Ufimtseva wrote:
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 7d667b0533..a8b1ea9358 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -215,6 +215,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          uint32_t dword;
>          uint64_t qword;
>      } buf;
> +    int ret;
> =20
>      switch (size) {
>      case 1:
> @@ -234,7 +235,12 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          break;
>      }
> =20
> -    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) !=3D =
size) {
> +    if (vbasedev->proxy !=3D NULL) {
> +        ret =3D vfio_user_region_write(vbasedev, region->nr, addr, size,=
 &data);
> +    } else {
> +        ret =3D pwrite(vbasedev->fd, &buf, size, region->fd_offset + add=
r);
> +    }

The vfio-user spec says everything is little-endian. Why does
vfio_user_region_write() take the host-endian uint64_t data value
instead of the little-endian buf value?

> +    if (ret !=3D size) {
>          error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
>                       ",%d) failed: %m",
>                       __func__, vbasedev->name, region->nr,
> @@ -266,8 +272,14 @@ uint64_t vfio_region_read(void *opaque,
>          uint64_t qword;
>      } buf;
>      uint64_t data =3D 0;
> +    int ret;
> =20
> -    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) !=3D s=
ize) {
> +    if (vbasedev->proxy !=3D NULL) {
> +        ret =3D vfio_user_region_read(vbasedev, region->nr, addr, size, =
&buf);
> +    } else {
> +        ret =3D pread(vbasedev->fd, &buf, size, region->fd_offset + addr=
);
> +    }
> +    if (ret !=3D size) {
>          error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
>                       __func__, vbasedev->name, region->nr,
>                       addr, size);
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 91b51f37df..83235b2411 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -767,3 +767,46 @@ int vfio_user_get_region_info(VFIODevice *vbasedev, =
int index,
>      memcpy(info, &msgp->argsz, info->argsz);
>      return 0;
>  }
> +
> +int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t=
 offset,
> +                                 uint32_t count, void *data)
> +{
> +    g_autofree VFIOUserRegionRW *msgp =3D NULL;
> +    int size =3D sizeof(*msgp) + count;
> +
> +    msgp =3D g_malloc0(size);
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msg=
p), 0);
> +    msgp->offset =3D offset;
> +    msgp->region =3D index;
> +    msgp->count =3D count;
> +
> +    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, size, 0);
> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +        return -msgp->hdr.error_reply;
> +    } else if (msgp->count > count) {
> +        return -E2BIG;
> +    } else {
> +        memcpy(data, &msgp->data, msgp->count);
> +    }
> +
> +    return msgp->count;
> +}
> +
> +int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
> +                           uint64_t offset, uint32_t count, void *data)
> +{
> +    g_autofree VFIOUserRegionRW *msgp =3D NULL;
> +    int size =3D sizeof(*msgp) + count;
> +
> +    msgp =3D g_malloc0(size);
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size,
> +                          VFIO_USER_NO_REPLY);
> +    msgp->offset =3D offset;
> +    msgp->region =3D index;
> +    msgp->count =3D count;
> +    memcpy(&msgp->data, data, count);
> +
> +    vfio_user_send(vbasedev->proxy, &msgp->hdr, NULL);

Are VFIO region writes posted writes (VFIO_USER_NO_REPLY)? This can be a
problem if the device driver performs a write to the region followed by
another access (e.g. to an mmap region) and expected the write to
complete before the second access takes place.

--+/BlHZL71J3n5AGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3eiUACgkQnKSrs4Gr
c8iMJwf/YKlleIjxs2NiyhxbGFLz7dsneEs9n2Z2JCRPaCgYbmfsA1JjdRULalEw
jCsF67Gd3sG0+48hBiueHeXkABSNvgttJYfm5nWGKPH1E92fSgTEw26Firqvkhvl
WnImAZjEoAvqJwYNtHMvNN6X9PigNDxexCl+N3qVPQhDaeQNNMa+b9MlDsq52slS
zGTtpGl3MdOkU5TlKRahqdXH1RuDKV3Q9Oz09XjzIa4e40s5FpMjbqDwplDid0k3
nsCm+p6ffgz92lNQPQw0FcWd3j/XmMiNW0yhPiBtWvik8AepeuvrO2tvNwR6ECEd
BpnE6hPvBG5znZQHXsYsmc2N4Qb3og==
=Q7Ks
-----END PGP SIGNATURE-----

--+/BlHZL71J3n5AGr--


