Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6618402AD4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:34:05 +0200 (CEST)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcAm-0004tr-2J
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNc8i-0003Ua-E6
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNc8f-0002ub-Lr
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631025111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otYN92uAux7JIjQj2Upgp8u6P0PBc9rdyC2j963r2D4=;
 b=TrPXPgEMSKK7nYXbsq4tLm89aJjK18AlwFQNgWXKYeT/yy+2x6n/D2rxxcu6e30mYEVBu4
 5dE2Vw6bc0SCuTyqksBtF+HWeZH2pekkeKPqaRXljY7yP4NwKbBjLlmodsMgMS5tiwW3c/
 fIqKLZH+TXODBVCcXk90S1tpZCObfBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ZdDrEx9dPTetbt39s1rzTw-1; Tue, 07 Sep 2021 10:31:48 -0400
X-MC-Unique: ZdDrEx9dPTetbt39s1rzTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98D11006CAF;
 Tue,  7 Sep 2021 14:31:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8F5D196E6;
 Tue,  7 Sep 2021 14:31:42 +0000 (UTC)
Date: Tue, 7 Sep 2021 15:31:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 08/16] vfio-user: get region info
Message-ID: <YTd3zRAjg51tzzfd@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <d442105953151559982c8b1a753d847fb89da3ba.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <d442105953151559982c8b1a753d847fb89da3ba.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5f+LX0HCDRC4TrC"
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

--O5f+LX0HCDRC4TrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:41AM -0700, Elena Ufimtseva wrote:
> @@ -1514,6 +1515,16 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_typ=
e1_info *info,
>      return true;
>  }
> =20
> +static int vfio_get_region_info_remfd(VFIODevice *vbasedev, int index)
> +{
> +    struct vfio_region_info *info;
> +
> +    if (vbasedev->regions =3D=3D NULL || vbasedev->regions[index] =3D=3D=
 NULL) {
> +        vfio_get_region_info(vbasedev, index, &info);
> +    }

Maybe this will be called from other places in the future, but the
vfio_region_setup() caller below already invoked vfio_get_region_info()
so I'm not sure it's necessary to do this again?

Perhaps add an int *remfd argument to vfio_get_region_info(). That way
vfio_get_region_info_remfd() isn't necessary.

> @@ -2410,6 +2442,24 @@ int vfio_get_region_info(VFIODevice *vbasedev, int=
 index,
>                           struct vfio_region_info **info)
>  {
>      size_t argsz =3D sizeof(struct vfio_region_info);
> +    int fd =3D -1;
> +    int ret;
> +
> +    /* create region cache */
> +    if (vbasedev->regions =3D=3D NULL) {
> +        vbasedev->regions =3D g_new0(struct vfio_region_info *,
> +                                   vbasedev->num_regions);
> +        if (vbasedev->proxy !=3D NULL) {
> +            vbasedev->regfds =3D g_new0(int, vbasedev->num_regions);
> +        }
> +    }
> +    /* check cache */
> +    if (vbasedev->regions[index] !=3D NULL) {
> +        *info =3D g_malloc0(vbasedev->regions[index]->argsz);
> +        memcpy(*info, vbasedev->regions[index],
> +               vbasedev->regions[index]->argsz);
> +        return 0;
> +    }

Why is it necessary to introduce a cache? Is it to avoid passing the
same fd multiple times?

> =20
>      *info =3D g_malloc0(argsz);
> =20
> @@ -2417,7 +2467,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int=
 index,
>  retry:
>      (*info)->argsz =3D argsz;
> =20
> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
> +    if (vbasedev->proxy !=3D NULL) {
> +        VFIOUserFDs fds =3D { 0, 1, &fd};
> +
> +        ret =3D vfio_user_get_region_info(vbasedev, index, *info, &fds);
> +    } else {
> +        ret =3D ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info);
> +        if (ret < 0) {
> +            ret =3D -errno;
> +        }
> +    }
> +    if (ret !=3D 0) {
>          g_free(*info);
>          *info =3D NULL;
>          return -errno;
> @@ -2426,10 +2486,22 @@ retry:
>      if ((*info)->argsz > argsz) {
>          argsz =3D (*info)->argsz;
>          *info =3D g_realloc(*info, argsz);
> +        if (fd !=3D -1) {
> +            close(fd);
> +            fd =3D -1;
> +        }
> =20
>          goto retry;
>      }
> =20
> +    /* fill cache */
> +    vbasedev->regions[index] =3D g_malloc0(argsz);
> +    memcpy(vbasedev->regions[index], *info, argsz);
> +    *vbasedev->regions[index] =3D **info;

The previous line already copied the contents of *info. What is the
purpose of this assignment?

> +    if (vbasedev->regfds !=3D NULL) {
> +        vbasedev->regfds[index] =3D fd;
> +    }
> +
>      return 0;
>  }
> =20
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index b584b8e0f2..91b51f37df 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -734,3 +734,36 @@ int vfio_user_get_info(VFIODevice *vbasedev)
>      vbasedev->reset_works =3D !!(msg.flags & VFIO_DEVICE_FLAGS_RESET);
>      return 0;
>  }
> +
> +int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
> +                              struct vfio_region_info *info, VFIOUserFDs=
 *fds)
> +{
> +    g_autofree VFIOUserRegionInfo *msgp =3D NULL;
> +    int size;

Please use uint32_t size instead of int size to prevent possible
signedness issues:
- VFIOUserRegionInfo->argsz is uint32_t.
- sizeof(VFIOUserHdr) is size_t.
- The vfio_user_request_msg() size argument is uint32_t.

--O5f+LX0HCDRC4TrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3d80ACgkQnKSrs4Gr
c8hoAAf/VtOvxOQcqOnxLTb5SGoqK+CEWTDL5uMAIf+2ZkPOnxOujTV1QbfNufTq
0S3pcR+hIuAQrCs47W44kC1CoATzZf/8AiNaw3jvJMeSbypySHhuy0YOZ+GrAOVi
mTbSBgRiqoirLGdjlIaOFZyQqksbt/R24ObAntaQs5X99l3bqQJkNUwCq1dPOszn
g+0qMaNwWfTvBi2U7TOYqvCTmgoEeHuj/KPo37a6aL7fDJ353uMX0Yh4DDGUgAql
b3LmIYa92kvFO59+f3l09nVokNms8VmVOqjaxKf6LDj8rmXpOZ55atlepCMUVN8D
ngZBqjdIXCIBSCA5nydEWS5PO8oH/g==
=3kXI
-----END PGP SIGNATURE-----

--O5f+LX0HCDRC4TrC--


