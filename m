Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B337403624
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:33:36 +0200 (CEST)
Received: from localhost ([::1]:40752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNt1T-00085c-7Q
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNsyK-0005es-DZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:30:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNsyG-0007tW-GY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631089815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRyn5ZuHPXreIow0fAr5lHKxG12j9lzK8hJD1vWmBaY=;
 b=Sp82MPubI/l8TzNY7fpFo1KRe2m9ddT3jPUagXMGaFJj7n/qpd70J8uAXMwjj4b3a2lgKl
 x49+5dUSza7jFi3ppdKuLLqLL+MxbryLk6gtkFTcIBZr8XnoeBcsL7s+WIMAQaDQBgjli7
 B0gj4n7iJY/pvbPFT49IIwElvKtGOH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-V7PI5-HDNjO9ptlnJqnP0w-1; Wed, 08 Sep 2021 04:30:11 -0400
X-MC-Unique: V7PI5-HDNjO9ptlnJqnP0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414569127A;
 Wed,  8 Sep 2021 08:30:10 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40F7F60C04;
 Wed,  8 Sep 2021 08:30:06 +0000 (UTC)
Date: Wed, 8 Sep 2021 09:30:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 12/16] vfio-user: proxy container connect/disconnect
Message-ID: <YTh0jWnnnHfSu7wZ@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <7f6595dcd88bfc0b459d3befd615a569635bae7d.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <7f6595dcd88bfc0b459d3befd615a569635bae7d.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fRMrFQoxgujTjQHs"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

--fRMrFQoxgujTjQHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:45AM -0700, Elena Ufimtseva wrote:
> From: John Johnson <john.g.johnson@oracle.com>
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/vfio/vfio-common.h |  3 ++
>  hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
>  hw/vfio/pci.c                 | 22 +++++++++
>  3 files changed, 109 insertions(+)

Alex: I'm not familiar enough with hw/vfio/ to review this in depth. You
might have suggestions on how to unify the vfio-user and vfio kernel
concepts of groups and containers.

>=20
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
> index bdd25a546c..688660c28d 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -91,6 +91,7 @@ typedef struct VFIOContainer {
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
>      unsigned int dma_max_mappings;
> +    VFIOProxy *proxy;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> @@ -217,6 +218,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *=
as, Error **errp);
>  void vfio_put_group(VFIOGroup *group);
>  int vfio_get_device(VFIOGroup *group, const char *name,
>                      VFIODevice *vbasedev, Error **errp);
> +void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace=
 *as);
> +void vfio_disconnect_proxy(VFIOGroup *group);
> =20
>  extern const MemoryRegionOps vfio_region_ops;
>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 9fe3e05dc6..57b9e111e6 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -2249,6 +2249,55 @@ put_space_exit:
>      return ret;
>  }
> =20
> +void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace=
 *as)
> +{
> +    VFIOAddressSpace *space;
> +    VFIOContainer *container;
> +
> +    if (QLIST_EMPTY(&vfio_group_list)) {
> +        qemu_register_reset(vfio_reset_handler, NULL);
> +    }
> +
> +    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
> +
> +    /*
> +     * try to mirror vfio_connect_container()
> +     * as much as possible
> +     */
> +
> +    space =3D vfio_get_address_space(as);
> +
> +    container =3D g_malloc0(sizeof(*container));
> +    container->space =3D space;
> +    container->fd =3D -1;
> +    QLIST_INIT(&container->giommu_list);
> +    QLIST_INIT(&container->hostwin_list);
> +    container->proxy =3D proxy;
> +
> +    /*
> +     * The proxy uses a SW IOMMU in lieu of the HW one
> +     * used in the ioctl() version.  Use TYPE1 with the
> +     * target's page size for maximum capatibility
> +     */
> +    container->iommu_type =3D VFIO_TYPE1_IOMMU;
> +    vfio_host_win_add(container, 0, (hwaddr)-1, TARGET_PAGE_SIZE);
> +    container->pgsizes =3D TARGET_PAGE_SIZE;
> +
> +    container->dirty_pages_supported =3D true;
> +    container->max_dirty_bitmap_size =3D VFIO_USER_DEF_MAX_XFER;
> +    container->dirty_pgsizes =3D TARGET_PAGE_SIZE;
> +
> +    QLIST_INIT(&container->group_list);
> +    QLIST_INSERT_HEAD(&space->containers, container, next);
> +
> +    group->container =3D container;
> +    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
> +
> +    container->listener =3D vfio_memory_listener;
> +    memory_listener_register(&container->listener, container->space->as)=
;
> +    container->initialized =3D true;
> +}
> +
>  static void vfio_disconnect_container(VFIOGroup *group)
>  {
>      VFIOContainer *container =3D group->container;
> @@ -2291,6 +2340,41 @@ static void vfio_disconnect_container(VFIOGroup *g=
roup)
>      }
>  }
> =20
> +void vfio_disconnect_proxy(VFIOGroup *group)
> +{
> +    VFIOContainer *container =3D group->container;
> +    VFIOAddressSpace *space =3D container->space;
> +    VFIOGuestIOMMU *giommu, *tmp;
> +
> +    /*
> +     * try to mirror vfio_disconnect_container()
> +     * as much as possible, knowing each device
> +     * is in one group and one container
> +     */
> +
> +    QLIST_REMOVE(group, container_next);
> +    group->container =3D NULL;
> +
> +    /*
> +     * Explicitly release the listener first before unset container,
> +     * since unset may destroy the backend container if it's the last
> +     * group.
> +     */
> +    memory_listener_unregister(&container->listener);
> +
> +    QLIST_REMOVE(container, next);
> +
> +    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp=
) {
> +        memory_region_unregister_iommu_notifier(
> +            MEMORY_REGION(giommu->iommu), &giommu->n);
> +        QLIST_REMOVE(giommu, giommu_next);
> +        g_free(giommu);
> +    }
> +
> +    g_free(container);
> +    vfio_put_address_space(space);
> +}
> +
>  VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>  {
>      VFIOGroup *group;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 282de6a30b..2c9fcb2fa9 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3442,6 +3442,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, =
Error **errp)
>      VFIODevice *vbasedev =3D &vdev->vbasedev;
>      SocketAddress addr;
>      VFIOProxy *proxy;
> +    VFIOGroup *group =3D NULL;
>      int ret;
>      Error *err =3D NULL;
> =20
> @@ -3484,6 +3485,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
>      vbasedev->no_mmap =3D false;
>      vbasedev->ops =3D &vfio_user_pci_ops;
> =20
> +    /*
> +     * each device gets its own group and container
> +     * make them unrelated to any host IOMMU groupings
> +     */
> +    group =3D g_malloc0(sizeof(*group));
> +    group->fd =3D -1;
> +    group->groupid =3D -1;
> +    QLIST_INIT(&group->device_list);
> +    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
> +    vbasedev->group =3D group;
> +
> +    vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev=
));
> +
>      ret =3D vfio_user_get_info(&vdev->vbasedev);
>      if (ret) {
>          error_setg_errno(errp, -ret, "get info failure");
> @@ -3587,6 +3601,9 @@ out_teardown:
>      vfio_teardown_msi(vdev);
>      vfio_bars_exit(vdev);
>  error:
> +    if (group !=3D NULL) {
> +        vfio_disconnect_proxy(group);
> +    }
>      vfio_user_disconnect(proxy);
>      error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>  }
> @@ -3595,6 +3612,11 @@ static void vfio_user_instance_finalize(Object *ob=
j)
>  {
>      VFIOPCIDevice *vdev =3D VFIO_PCI_BASE(obj);
>      VFIODevice *vbasedev =3D &vdev->vbasedev;
> +    VFIOGroup *group =3D vbasedev->group;
> +
> +    vfio_disconnect_proxy(group);
> +    g_free(group);
> +    vbasedev->group =3D NULL;

Can vfio_put_group() be used instead? I'm worried that the cleanup code
will be duplicated or become inconsistent if it's not shared.

Also, vfio_instance_finalize() calls vfio_put_group() after
vfio_put_device(). Does this code intentionally take advantage of the if
(!vbasedev->group) early return in vfio_put_base_device()? This is
non-obvious. I recommend unifying the device and group cleanup instead
of special-casing it here (this is fragile!).

> =20
>      vfio_put_device(vdev);
> =20
> --=20
> 2.25.1
>=20

--fRMrFQoxgujTjQHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4dI0ACgkQnKSrs4Gr
c8gVUgf+P8rNgFSshdOqSxii2A3grS38mUGnm4wj/2KYuKIXDJ5w13gj/Ac8Ywny
XN2B0QijJQg0lu1X7I7DmkhkEPKI/+DY1wm8shobKqUnAZ7/TzCIP6xVMsnhA56C
putOdXj+fiITfHaPhmAe5HVzJXx7XsyxZVGULvpzpgPuIq16SexJ3o9hAmgNvXtE
8J/8UegbkBpReHBv1zrhHHQkE/XpKE9S3NJS2WZfOOCFH90iMlRt0NTajPXE8JyZ
N3XwI2GNjEOFASDu9MsJG8FIdN4yxaT82FHDnHsToA4GWjeVyKxwpuNDIP1ODBtV
MYS3RTzbzvfQ3bCpBDxatahMbARFEA==
=sp1k
-----END PGP SIGNATURE-----

--fRMrFQoxgujTjQHs--


