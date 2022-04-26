Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA350F9FA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:16:37 +0200 (CEST)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIFI-0006ud-B9
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1njHn0-0008EO-PD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:47:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1njHmw-0000Y8-Ob
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:47:21 -0400
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KncPk3w42z67XJ2;
 Tue, 26 Apr 2022 17:43:06 +0800 (CST)
Received: from lhreml721-chm.china.huawei.com (10.201.108.72) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 11:47:05 +0200
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml721-chm.china.huawei.com (10.201.108.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 10:47:05 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2375.024; Tue, 26 Apr 2022 10:47:05 +0100
To: Yi Liu <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>, "farman@linux.ibm.com"
 <farman@linux.ibm.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "pasic@linux.ibm.com"
 <pasic@linux.ibm.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>, "yi.y.sun@intel.com"
 <yi.y.sun@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, Zhangfei Gao
 <zhangfei.gao@linaro.org>
Subject: RE: [RFC 00/18] vfio: Adopt iommufd
Thread-Topic: [RFC 00/18] vfio: Adopt iommufd
Thread-Index: AQHYT+0OTGNprklv2E6ANQZpjBJsW60CAlLg
Date: Tue, 26 Apr 2022 09:47:05 +0000
Message-ID: <4f920d463ebf414caa96419b625632d5@huawei.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.178]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Yi Liu [mailto:yi.l.liu@intel.com]
> Sent: 14 April 2022 11:47
> To: alex.williamson@redhat.com; cohuck@redhat.com;
> qemu-devel@nongnu.org
> Cc: david@gibson.dropbear.id.au; thuth@redhat.com; farman@linux.ibm.com;
> mjrosato@linux.ibm.com; akrowiak@linux.ibm.com; pasic@linux.ibm.com;
> jjherne@linux.ibm.com; jasowang@redhat.com; kvm@vger.kernel.org;
> jgg@nvidia.com; nicolinc@nvidia.com; eric.auger@redhat.com;
> eric.auger.pro@gmail.com; kevin.tian@intel.com; yi.l.liu@intel.com;
> chao.p.peng@intel.com; yi.y.sun@intel.com; peterx@redhat.com
> Subject: [RFC 00/18] vfio: Adopt iommufd
>=20
> With the introduction of iommufd[1], the linux kernel provides a generic
> interface for userspace drivers to propagate their DMA mappings to kernel
> for assigned devices. This series does the porting of the VFIO devices
> onto the /dev/iommu uapi and let it coexist with the legacy implementatio=
n.
> Other devices like vpda, vfio mdev and etc. are not considered yet.
>=20
> For vfio devices, the new interface is tied with device fd and iommufd
> as the iommufd solution is device-centric. This is different from legacy
> vfio which is group-centric. To support both interfaces in QEMU, this
> series introduces the iommu backend concept in the form of different
> container classes. The existing vfio container is named legacy container
> (equivalent with legacy iommu backend in this series), while the new
> iommufd based container is named as iommufd container (may also be
> mentioned
> as iommufd backend in this series). The two backend types have their own
> way to setup secure context and dma management interface. Below diagram
> shows how it looks like with both BEs.
>=20
>                     VFIO
> AddressSpace/Memory
>     +-------+  +----------+  +-----+  +-----+
>     |  pci  |  | platform |  |  ap |  | ccw |
>     +---+---+  +----+-----+  +--+--+  +--+--+     +----------------------=
+
>         |           |           |        |        |   AddressSpace
> |
>         |           |           |        |        +------------+---------=
+
>     +---V-----------V-----------V--------V----+               /
>     |           VFIOAddressSpace              | <------------+
>     |                  |                      |  MemoryListener
>     |          VFIOContainer list             |
>     +-------+----------------------------+----+
>             |                            |
>             |                            |
>     +-------V------+            +--------V----------+
>     |   iommufd    |            |    vfio legacy    |
>     |  container   |            |     container     |
>     +-------+------+            +--------+----------+
>             |                            |
>             | /dev/iommu                 | /dev/vfio/vfio
>             | /dev/vfio/devices/vfioX    | /dev/vfio/$group_id
>  Userspace  |                            |
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
>  Kernel     |  device fd                 |
>             +---------------+            | group/container fd
>             | (BIND_IOMMUFD |            |
> (SET_CONTAINER/SET_IOMMU)
>             |  ATTACH_IOAS) |            | device fd
>             |               |            |
>             |       +-------V------------V-----------------+
>     iommufd |       |                vfio                  |
> (map/unmap  |       +---------+--------------------+-------+
>  ioas_copy) |                 |                    | map/unmap
>             |                 |                    |
>      +------V------+    +-----V------+      +------V--------+
>      | iommfd core |    |  device    |      |  vfio iommu   |
>      +-------------+    +------------+      +---------------+
>=20
> [Secure Context setup]
> - iommufd BE: uses device fd and iommufd to setup secure context
>               (bind_iommufd, attach_ioas)
> - vfio legacy BE: uses group fd and container fd to setup secure context
>                   (set_container, set_iommu)
> [Device access]
> - iommufd BE: device fd is opened through /dev/vfio/devices/vfioX
> - vfio legacy BE: device fd is retrieved from group fd ioctl
> [DMA Mapping flow]
> - VFIOAddressSpace receives MemoryRegion add/del via MemoryListener
> - VFIO populates DMA map/unmap via the container BEs
>   *) iommufd BE: uses iommufd
>   *) vfio legacy BE: uses container fd
>=20
> This series qomifies the VFIOContainer object which acts as a base class
> for a container. This base class is derived into the legacy VFIO containe=
r
> and the new iommufd based container. The base class implements generic
> code
> such as code related to memory_listener and address space management
> whereas
> the derived class implements callbacks that depend on the kernel user spa=
ce
> being used.
>=20
> The selection of the backend is made on a device basis using the new
> iommufd option (on/off/auto). By default the iommufd backend is selected
> if supported by the host and by QEMU (iommufd KConfig). This option is
> currently available only for the vfio-pci device. For other types of
> devices, it does not yet exist and the legacy BE is chosen by default.
>=20
> Test done:
> - PCI and Platform device were tested
> - ccw and ap were only compile-tested
> - limited device hotplug test
> - vIOMMU test run for both legacy and iommufd backends (limited tests)
>=20
> This series was co-developed by Eric Auger and me based on the exploratio=
n
> iommufd kernel[2], complete code of this series is available in[3]. As
> iommufd kernel is in the early step (only iommufd generic interface is in
> mailing list), so this series hasn't made the iommufd backend fully on pa=
r
> with legacy backend w.r.t. features like p2p mappings, coherency tracking=
,
> live migration, etc. This series hasn't supported PCI devices without FLR
> neither as the kernel doesn't support VFIO_DEVICE_PCI_HOT_RESET when
> userspace
> is using iommufd. The kernel needs to be updated to accept device fd list=
 for
> reset when userspace is using iommufd. Related work is in progress by
> Jason[4].
>=20
> TODOs:
> - Add DMA alias check for iommufd BE (group level)
> - Make pci.c to be BE agnostic. Needs kernel change as well to fix the
>   VFIO_DEVICE_PCI_HOT_RESET gap
> - Cleanup the VFIODevice fields as it's used in both BEs
> - Add locks
> - Replace list with g_tree
> - More tests
>=20
> Patch Overview:
>=20
> - Preparation:
>   0001-scripts-update-linux-headers-Add-iommufd.h.patch
>   0002-linux-headers-Import-latest-vfio.h-and-iommufd.h.patch
>   0003-hw-vfio-pci-fix-vfio_pci_hot_reset_result-trace-poin.patch
>   0004-vfio-pci-Use-vbasedev-local-variable-in-vfio_realize.patch
>=20
> 0005-vfio-common-Rename-VFIOGuestIOMMU-iommu-into-iommu_m.patch
>   0006-vfio-common-Split-common.c-into-common.c-container.c.patch
>=20
> - Introduce container object and covert existing vfio to use it:
>   0007-vfio-Add-base-object-for-VFIOContainer.patch
>   0008-vfio-container-Introduce-vfio_attach-detach_device.patch
>   0009-vfio-platform-Use-vfio_-attach-detach-_device.patch
>   0010-vfio-ap-Use-vfio_-attach-detach-_device.patch
>   0011-vfio-ccw-Use-vfio_-attach-detach-_device.patch
>   0012-vfio-container-obj-Introduce-attach-detach-_device-c.patch
>   0013-vfio-container-obj-Introduce-VFIOContainer-reset-cal.patch
>=20
> - Introduce iommufd based container:
>   0014-hw-iommufd-Creation.patch
>   0015-vfio-iommufd-Implement-iommufd-backend.patch
>   0016-vfio-iommufd-Add-IOAS_COPY_DMA-support.patch
>=20
> - Add backend selection for vfio-pci:
>   0017-vfio-as-Allow-the-selection-of-a-given-iommu-backend.patch
>   0018-vfio-pci-Add-an-iommufd-option.patch
>=20
> [1]
> https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com
> /
> [2] https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6
> [3] https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv1

Hi,

I had a go with the above branches on our ARM64 platform trying to pass-thr=
ough
a VF dev, but Qemu reports an error as below,

[    0.444728] hisi_sec2 0000:00:01.0: enabling device (0000 -> 0002)
qemu-system-aarch64-iommufd: IOMMU_IOAS_MAP failed: Bad address
qemu-system-aarch64-iommufd: vfio_container_dma_map(0xaaaafeb40ce0, 0x80000=
00000, 0x10000, 0xffffb40ef000) =3D -14 (Bad address)

I think this happens for the dev BAR addr range. I haven't debugged the ker=
nel
yet to see where it actually reports that.=20

Maybe I am missing something. Please let me know.

Thanks,
Shameer


