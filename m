Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA842EF3A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:01:33 +0200 (CEST)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKxw-0005BC-JA
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1mbKr3-0004E8-4e; Fri, 15 Oct 2021 06:54:25 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1mbKqz-0004bq-D1; Fri, 15 Oct 2021 06:54:24 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HW3193vCVz9081;
 Fri, 15 Oct 2021 18:49:17 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 15 Oct 2021 18:54:08 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2308.008; Fri, 15 Oct 2021 11:54:06 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [RFC v9 16/29] vfio: Pass stage 1 MSI bindings to the host
Thread-Topic: [RFC v9 16/29] vfio: Pass stage 1 MSI bindings to the host
Thread-Index: AQHXLswAqaqwdwBKWUSFg2KVSgIkGavVARIA
Date: Fri, 15 Oct 2021 10:54:06 +0000
Message-ID: <9577e348dfce4ae4aec6c11edbd75ee7@huawei.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
 <20210411120912.15770-17-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-17-eric.auger@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.25.63]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>,
 "chenxiang \(M\)" <chenxiang66@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "zhangfei.gao@gmail.com" <zhangfei.gao@gmail.com>,
 yuzenghui <yuzenghui@huawei.com>, qubingbing <qubingbing@hisilicon.com>,
 zhukeqian <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: 11 April 2021 13:09
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> alex.williamson@redhat.com
> Cc: peter.maydell@linaro.org; jean-philippe@linaro.org; peterx@redhat.com=
;
> jacob.jun.pan@linux.intel.com; yi.l.liu@intel.com; Shameerali Kolothum Th=
odi
> <shameerali.kolothum.thodi@huawei.com>; tn@semihalf.com;
> nicoleotsuka@gmail.com; yuzenghui <yuzenghui@huawei.com>;
> zhangfei.gao@gmail.com; vivek.gautam@arm.com; jiangkunkun
> <jiangkunkun@huawei.com>; vdumpa@nvidia.com; chenxiang (M)
> <chenxiang66@hisilicon.com>; zhukeqian <zhukeqian1@huawei.com>
> Subject: [RFC v9 16/29] vfio: Pass stage 1 MSI bindings to the host
>=20
> We register the stage1 MSI bindings when enabling the vectors
> and we unregister them on msi disable.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v7 -> v8:
> - add unregistration on msix_diable
> - remove vfio_container_unbind_msis()
>=20
> v4 -> v5:
> - use VFIO_IOMMU_SET_MSI_BINDING
>=20
> v2 -> v3:
> - only register the notifier if the IOMMU translates MSIs
> - record the msi bindings in a container list and unregister on
>   container release
> ---
>  include/hw/vfio/vfio-common.h | 12 ++++++
>  hw/vfio/common.c              | 59 +++++++++++++++++++++++++++
>  hw/vfio/pci.c                 | 76
> ++++++++++++++++++++++++++++++++++-
>  hw/vfio/trace-events          |  2 +
>  4 files changed, 147 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
> index 6141162d7a..f30133b2a3 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -74,6 +74,14 @@ typedef struct VFIOAddressSpace {
>      QLIST_ENTRY(VFIOAddressSpace) list;
>  } VFIOAddressSpace;
>=20
> +typedef struct VFIOMSIBinding {
> +    int index;
> +    hwaddr iova;
> +    hwaddr gpa;
> +    hwaddr size;
> +    QLIST_ENTRY(VFIOMSIBinding) next;
> +} VFIOMSIBinding;
> +
>  struct VFIOGroup;
>=20
>  typedef struct VFIOContainer {
> @@ -91,6 +99,7 @@ typedef struct VFIOContainer {
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> +    QLIST_HEAD(, VFIOMSIBinding) msibinding_list;
>      QLIST_ENTRY(VFIOContainer) next;
>  } VFIOContainer;
>=20
> @@ -200,6 +209,9 @@ VFIOGroup *vfio_get_group(int groupid,
> AddressSpace *as, Error **errp);
>  void vfio_put_group(VFIOGroup *group);
>  int vfio_get_device(VFIOGroup *group, const char *name,
>                      VFIODevice *vbasedev, Error **errp);
> +int vfio_iommu_set_msi_binding(VFIOContainer *container, int n,
> +                               IOMMUTLBEntry *entry);
> +int vfio_iommu_unset_msi_binding(VFIOContainer *container, int n);
>=20
>  extern const MemoryRegionOps vfio_region_ops;
>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index e369d451e7..970a5a7be7 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -662,6 +662,65 @@ static void
> vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>      }
>  }
>=20
> +int vfio_iommu_set_msi_binding(VFIOContainer *container, int n,
> +                               IOMMUTLBEntry *iotlb)
> +{
> +    struct vfio_iommu_type1_set_msi_binding ustruct;
> +    VFIOMSIBinding *binding;
> +    int ret;
> +
> +    QLIST_FOREACH(binding, &container->msibinding_list, next) {
> +        if (binding->index =3D=3D n) {
> +            return 0;
> +        }
> +    }
> +
> +    ustruct.argsz =3D sizeof(struct vfio_iommu_type1_set_msi_binding);
> +    ustruct.iova =3D iotlb->iova;
> +    ustruct.flags =3D VFIO_IOMMU_BIND_MSI;
> +    ustruct.gpa =3D iotlb->translated_addr;
> +    ustruct.size =3D iotlb->addr_mask + 1;
> +    ret =3D ioctl(container->fd, VFIO_IOMMU_SET_MSI_BINDING , &ustruct);
> +    if (ret) {
> +        error_report("%s: failed to register the stage1 MSI binding (%m)=
",
> +                     __func__);
> +        return ret;
> +    }
> +    binding =3D  g_new0(VFIOMSIBinding, 1);
> +    binding->iova =3D ustruct.iova;
> +    binding->gpa =3D ustruct.gpa;
> +    binding->size =3D ustruct.size;
> +    binding->index =3D n;
> +
> +    QLIST_INSERT_HEAD(&container->msibinding_list, binding, next);
> +    return 0;
> +}
> +
> +int vfio_iommu_unset_msi_binding(VFIOContainer *container, int n)
> +{
> +    struct vfio_iommu_type1_set_msi_binding ustruct;
> +    VFIOMSIBinding *binding, *tmp;
> +    int ret;
> +
> +    ustruct.argsz =3D sizeof(struct vfio_iommu_type1_set_msi_binding);
> +    QLIST_FOREACH_SAFE(binding, &container->msibinding_list, next, tmp) =
{
> +        if (binding->index !=3D n) {
> +            continue;
> +        }
> +        ustruct.flags =3D VFIO_IOMMU_UNBIND_MSI;
> +        ustruct.iova =3D binding->iova;
> +        ret =3D ioctl(container->fd, VFIO_IOMMU_SET_MSI_BINDING ,
> &ustruct);
> +        if (ret) {
> +            error_report("Failed to unregister the stage1 MSI binding "
> +                         "for iova=3D0x%"PRIx64" (%m)", binding->iova);
> +        }
> +        QLIST_REMOVE(binding, next);
> +        g_free(binding);
> +        return ret;
> +    }
> +    return 0;
> +}
> +
>  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry
> *iotlb)
>  {
>      VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index cad7deec71..a49029dfa4 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -366,6 +366,65 @@ static void vfio_msi_interrupt(void *opaque)
>      notify(&vdev->pdev, nr);
>  }
>=20
> +static bool vfio_iommu_require_msi_binding(IOMMUMemoryRegion
> *iommu_mr)
> +{
> +    bool msi_translate =3D false, nested =3D false;
> +
> +    memory_region_iommu_get_attr(iommu_mr,
> IOMMU_ATTR_MSI_TRANSLATE,
> +                                 (void *)&msi_translate);
> +    memory_region_iommu_get_attr(iommu_mr,
> IOMMU_ATTR_VFIO_NESTED,
> +                                 (void *)&nested);
> +    if (!nested || !msi_translate) {
> +        return false;
> +    }
> +   return true;
> +}
> +
> +static int vfio_register_msi_binding(VFIOPCIDevice *vdev,
> +                                     int vector_n, bool set)
> +{
> +    VFIOContainer *container =3D vdev->vbasedev.group->container;
> +    PCIDevice *dev =3D &vdev->pdev;
> +    AddressSpace *as =3D pci_device_iommu_address_space(dev);
> +    IOMMUMemoryRegionClass *imrc;
> +    IOMMUMemoryRegion *iommu_mr;
> +    IOMMUTLBEntry entry;
> +    MSIMessage msg;
> +
> +    if (as =3D=3D &address_space_memory) {
> +        return 0;
> +    }
> +
> +    iommu_mr =3D IOMMU_MEMORY_REGION(as->root);
> +    if (!vfio_iommu_require_msi_binding(iommu_mr)) {
> +        return 0;
> +    }
> +
> +    /* MSI doorbell address is translated by an IOMMU */
> +
> +    if (!set) { /* unregister */
> +        trace_vfio_unregister_msi_binding(vdev->vbasedev.name,
> vector_n);
> +
> +        return vfio_iommu_unset_msi_binding(container, vector_n);
> +    }
> +
> +    msg =3D pci_get_msi_message(dev, vector_n);
> +    imrc =3D memory_region_get_iommu_class_nocheck(iommu_mr);
> +
> +    rcu_read_lock();
> +    entry =3D imrc->translate(iommu_mr, msg.address, IOMMU_WO, 0);
> +    rcu_read_unlock();
> +
> +    if (entry.perm =3D=3D IOMMU_NONE) {
> +        return -ENOENT;
> +    }
> +
> +    trace_vfio_register_msi_binding(vdev->vbasedev.name, vector_n,
> +                                    msg.address,
> entry.translated_addr);
> +
> +    return vfio_iommu_set_msi_binding(container, vector_n, &entry);
> +}
> +
>  static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>  {
>      struct vfio_irq_set *irq_set;
> @@ -383,7 +442,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev,
> bool msix)
>      fds =3D (int32_t *)&irq_set->data;
>=20
>      for (i =3D 0; i < vdev->nr_vectors; i++) {
> -        int fd =3D -1;
> +        int ret, fd =3D -1;
>=20
>          /*
>           * MSI vs MSI-X - The guest has direct access to MSI mask and
> pending
> @@ -392,6 +451,12 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev,
> bool msix)
>           * KVM signaling path only when configured and unmasked.
>           */
>          if (vdev->msi_vectors[i].use) {
> +            ret =3D vfio_register_msi_binding(vdev, i, true);

Just a heads up if you have plans to re-spin this series soon.

With the recent kernel commit 438553958ba1("PCI/MSI: Enable and mask
MSI-X early"), MSI-X is enabled early but vectors remained masked.=20

Looks like it creates a problem here when you try to call pci_get_msi_messa=
ge()
above as it returns msg.address as 0. Hence the S1 MSI bind fails for devic=
es with
MSI-X cap.=20

I have a temp fix here[2] for the issue where we effectively wait till MASK=
ALL is=20
cleared to enable MSI-X. Or else we need to delay this binding for MSI-X fo=
r a=20
later stage.

Please take a look and let me know. =20

Thanks,
Shameer
[1] https://lore.kernel.org/all/20210729222542.344136412@linutronix.de/
[2] https://github.com/Linaro/qemu/commit/568820e409417473eb6f16dfdf8e9075f=
5a5feaf
=20
=20
> +            if (ret) {
> +                error_report("%s failed to register S1 MSI binding "
> +                             "for vector %d(%d)", vdev->vbasedev.name,
> i, ret);
> +                goto out;
> +            }
>              if (vdev->msi_vectors[i].virq < 0 ||
>                  (msix && msix_is_masked(&vdev->pdev, i))) {
>                  fd =3D
> event_notifier_get_fd(&vdev->msi_vectors[i].interrupt);
> @@ -405,6 +470,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev,
> bool msix)
>=20
>      ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
>=20
> +out:
>      g_free(irq_set);
>=20
>      return ret;
> @@ -719,7 +785,8 @@ static void vfio_msi_disable_common(VFIOPCIDevice
> *vdev)
>=20
>  static void vfio_msix_disable(VFIOPCIDevice *vdev)
>  {
> -    int i;
> +    int ret, i;
> +
>=20
>      msix_unset_vector_notifiers(&vdev->pdev);
>=20
> @@ -731,6 +798,11 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
>          if (vdev->msi_vectors[i].use) {
>              vfio_msix_vector_release(&vdev->pdev, i);
>              msix_vector_unuse(&vdev->pdev, i);
> +            ret =3D vfio_register_msi_binding(vdev, i, false);
> +            if (ret) {
> +                error_report("%s: failed to unregister S1 MSI binding "
> +                             "for vector %d(%d)", vdev->vbasedev.name,
> i, ret);
> +            }
>          }
>      }
>=20
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 43696afc15..5c1b28d0d4 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -122,6 +122,8 @@ vfio_get_dev_region(const char *name, int index,
> uint32_t type, uint32_t subtype
>  vfio_dma_unmap_overflow_workaround(void) ""
>  vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64=
_t
> nb_granules, bool leaf) "nested IOTLB invalidate asid=3D%d, addr=3D0x%"PR=
Ix64"
> granule_size=3D0x%"PRIx64" nb_granules=3D0x%"PRIx64" leaf=3D%d"
>  vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=3D%d"
> +vfio_register_msi_binding(const char *name, int vector, uint64_t giova,
> uint64_t gdb) "%s: register vector %d gIOVA=3D0x%"PRIx64 "-> gDB=3D0x%"PR=
Ix64"
> stage 1 mapping"
> +vfio_unregister_msi_binding(const char *name, int vector) "%s: unregiste=
r
> vector %d stage 1 mapping"
>=20
>  # platform.c
>  vfio_platform_base_device_init(char *name, int groupid) "%s belongs to
> group #%d"
> --
> 2.26.3


