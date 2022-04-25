Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69150E9D0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 21:56:56 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj4pL-0007E5-Mr
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 15:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nj4ny-0006Tt-HS
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:55:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nj4nu-0007wN-B0
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650916525;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmKpecro76Xro01UxU2zSjINsBj9OL2LONlNBXtVhw0=;
 b=i7OimxdxzLzP3yzA0LVEdQKNh69KyjpDIWEjbQXBM/kWnUStovzmJARwYAlNa3eSCJkHv9
 D9uzZgHtUIH1JvvwlCGCiY0Nu0KLFjOiWvU+8d3FaEn0i7LjdQETHzUyMmzt3qBiym3diH
 GMENUbf0WXnoz/hBKp8qMepdERz6w7Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-FoT7nJhxODuPjPeoxKJ69g-1; Mon, 25 Apr 2022 15:55:24 -0400
X-MC-Unique: FoT7nJhxODuPjPeoxKJ69g-1
Received: by mail-wr1-f71.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so2661173wra.5
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 12:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=xmKpecro76Xro01UxU2zSjINsBj9OL2LONlNBXtVhw0=;
 b=GmleGcMofXQf2HEUuq+CqmOeHvd+oidq/nFUHoTc5fBkOoZXI3iIgfari/tW2JmhFR
 unIYyyb5r9lYPbydIpWDTlITO1am2vOIfueO/fnFHQ6/AXW7g9HhGjf98+3t59FnGxG4
 y1QbS48x2nFIsfN0gJCm2D8jPMpq9oHpdn2dEBqwJtpg0ooCxWV2982rCBEVota1y5aq
 3QJuHk4jaySyZJ+sswUScsXg5tH7LMXdWHv/d1NLIRDUTQBKUcDzS/XUqSzk9UEosmMq
 H6LA/SNiqZNIYw5zvgpuaPBaa2zlx5mzDip/pi+Jmm18RlM6Tz/MrXcajYhbwL3K6dcS
 0YpQ==
X-Gm-Message-State: AOAM533Cfhe1CbgkozWhUlNOi8DuFplpZLa4l8pOCKHxtKOynJr0sXas
 fr5AN8KrSbpl+jLQBYdDf+/9Wnn818yQaAtJSg33vGMiWrR5rK9PRzLP7BvNOoW2pZytKPHcNm3
 /0FW2ZR/xRMvbfBA=
X-Received: by 2002:a5d:6a0a:0:b0:20a:c7dd:d2bb with SMTP id
 m10-20020a5d6a0a000000b0020ac7ddd2bbmr14640689wru.242.1650916522588; 
 Mon, 25 Apr 2022 12:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzS3GScJFYGnkqtQ5YSIIbXrYYZKzGsgOXxdw+vQNJe/L10jWm/Zdes7pTTQvY60aj8mUh0Q==
X-Received: by 2002:a5d:6a0a:0:b0:20a:c7dd:d2bb with SMTP id
 m10-20020a5d6a0a000000b0020ac7ddd2bbmr14640674wru.242.1650916522259; 
 Mon, 25 Apr 2022 12:55:22 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a0560001a8d00b0020aab7cefc4sm9753307wry.46.2022.04.25.12.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:55:21 -0700 (PDT)
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <BN9PR11MB5276085CDF750807005A775B8CF39@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d1c63ea2-7396-7020-7a45-88e3d1918fb1@redhat.com>
Date: Mon, 25 Apr 2022 21:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <BN9PR11MB5276085CDF750807005A775B8CF39@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

On 4/18/22 10:49 AM, Tian, Kevin wrote:
>> From: Liu, Yi L <yi.l.liu@intel.com>
>> Sent: Thursday, April 14, 2022 6:47 PM
>>
>> With the introduction of iommufd[1], the linux kernel provides a generic
>> interface for userspace drivers to propagate their DMA mappings to kernel
>> for assigned devices. This series does the porting of the VFIO devices
>> onto the /dev/iommu uapi and let it coexist with the legacy implementation.
>> Other devices like vpda, vfio mdev and etc. are not considered yet.
> vfio mdev has no special support in Qemu. Just that it's not supported
> by iommufd yet thus can only be operated in legacy container interface at
> this point. Later once it's supported by the kernel suppose no additional
> enabling work is required for mdev in Qemu.
>
>> For vfio devices, the new interface is tied with device fd and iommufd
>> as the iommufd solution is device-centric. This is different from legacy
>> vfio which is group-centric. To support both interfaces in QEMU, this
>> series introduces the iommu backend concept in the form of different
>> container classes. The existing vfio container is named legacy container
>> (equivalent with legacy iommu backend in this series), while the new
>> iommufd based container is named as iommufd container (may also be
>> mentioned
>> as iommufd backend in this series). The two backend types have their own
>> way to setup secure context and dma management interface. Below diagram
>> shows how it looks like with both BEs.
>>
>>                     VFIO                           AddressSpace/Memory
>>     +-------+  +----------+  +-----+  +-----+
>>     |  pci  |  | platform |  |  ap |  | ccw |
>>     +---+---+  +----+-----+  +--+--+  +--+--+     +----------------------+
>>         |           |           |        |        |   AddressSpace       |
>>         |           |           |        |        +------------+---------+
>>     +---V-----------V-----------V--------V----+               /
>>     |           VFIOAddressSpace              | <------------+
>>     |                  |                      |  MemoryListener
>>     |          VFIOContainer list             |
>>     +-------+----------------------------+----+
>>             |                            |
>>             |                            |
>>     +-------V------+            +--------V----------+
>>     |   iommufd    |            |    vfio legacy    |
>>     |  container   |            |     container     |
>>     +-------+------+            +--------+----------+
>>             |                            |
>>             | /dev/iommu                 | /dev/vfio/vfio
>>             | /dev/vfio/devices/vfioX    | /dev/vfio/$group_id
>>  Userspace  |                            |
>>
>> ===========+============================+=======================
>> =========
>>  Kernel     |  device fd                 |
>>             +---------------+            | group/container fd
>>             | (BIND_IOMMUFD |            | (SET_CONTAINER/SET_IOMMU)
>>             |  ATTACH_IOAS) |            | device fd
>>             |               |            |
>>             |       +-------V------------V-----------------+
>>     iommufd |       |                vfio                  |
>> (map/unmap  |       +---------+--------------------+-------+
>>  ioas_copy) |                 |                    | map/unmap
>>             |                 |                    |
>>      +------V------+    +-----V------+      +------V--------+
>>      | iommfd core |    |  device    |      |  vfio iommu   |
>>      +-------------+    +------------+      +---------------+
> last row: s/iommfd/iommufd/
>
> overall this sounds a reasonable abstraction. Later when vdpa starts
> supporting iommufd probably the iommufd BE will become even
> smaller with more logic shareable between vfio and vdpa.
>
>> [Secure Context setup]
>> - iommufd BE: uses device fd and iommufd to setup secure context
>>               (bind_iommufd, attach_ioas)
>> - vfio legacy BE: uses group fd and container fd to setup secure context
>>                   (set_container, set_iommu)
>> [Device access]
>> - iommufd BE: device fd is opened through /dev/vfio/devices/vfioX
>> - vfio legacy BE: device fd is retrieved from group fd ioctl
>> [DMA Mapping flow]
>> - VFIOAddressSpace receives MemoryRegion add/del via MemoryListener
>> - VFIO populates DMA map/unmap via the container BEs
>>   *) iommufd BE: uses iommufd
>>   *) vfio legacy BE: uses container fd
>>
>> This series qomifies the VFIOContainer object which acts as a base class
> what does 'qomify' mean? I didn't find this word from dictionary...
sorry this is pure QEMU terminology. This stands for "QEMU Object Model"
additional info at:
https://qemu.readthedocs.io/en/latest/devel/qom.html

Eric
>
>> for a container. This base class is derived into the legacy VFIO container
>> and the new iommufd based container. The base class implements generic
>> code
>> such as code related to memory_listener and address space management
>> whereas
>> the derived class implements callbacks that depend on the kernel user space
> 'the kernel user space'?
>
>> being used.
>>
>> The selection of the backend is made on a device basis using the new
>> iommufd option (on/off/auto). By default the iommufd backend is selected
>> if supported by the host and by QEMU (iommufd KConfig). This option is
>> currently available only for the vfio-pci device. For other types of
>> devices, it does not yet exist and the legacy BE is chosen by default.
>>
>> Test done:
>> - PCI and Platform device were tested
> In this case PCI uses iommufd while platform device uses legacy?
>
>> - ccw and ap were only compile-tested
>> - limited device hotplug test
>> - vIOMMU test run for both legacy and iommufd backends (limited tests)
>>
>> This series was co-developed by Eric Auger and me based on the exploration
>> iommufd kernel[2], complete code of this series is available in[3]. As
>> iommufd kernel is in the early step (only iommufd generic interface is in
>> mailing list), so this series hasn't made the iommufd backend fully on par
>> with legacy backend w.r.t. features like p2p mappings, coherency tracking,
> what does 'coherency tracking' mean here? if related to iommu enforce
> snoop it is fully handled by the kernel so far. I didn't find any use of
> VFIO_DMA_CC_IOMMU in current Qemu.
>
>> live migration, etc. This series hasn't supported PCI devices without FLR
>> neither as the kernel doesn't support VFIO_DEVICE_PCI_HOT_RESET when
>> userspace
>> is using iommufd. The kernel needs to be updated to accept device fd list for
>> reset when userspace is using iommufd. Related work is in progress by
>> Jason[4].
>>
>> TODOs:
>> - Add DMA alias check for iommufd BE (group level)
>> - Make pci.c to be BE agnostic. Needs kernel change as well to fix the
>>   VFIO_DEVICE_PCI_HOT_RESET gap
>> - Cleanup the VFIODevice fields as it's used in both BEs
>> - Add locks
>> - Replace list with g_tree
>> - More tests
>>
>> Patch Overview:
>>
>> - Preparation:
>>   0001-scripts-update-linux-headers-Add-iommufd.h.patch
>>   0002-linux-headers-Import-latest-vfio.h-and-iommufd.h.patch
>>   0003-hw-vfio-pci-fix-vfio_pci_hot_reset_result-trace-poin.patch
>>   0004-vfio-pci-Use-vbasedev-local-variable-in-vfio_realize.patch
>>   0005-vfio-common-Rename-VFIOGuestIOMMU-iommu-into-
>> iommu_m.patch
> 3-5 are pure cleanups which could be sent out separately 
>
>>   0006-vfio-common-Split-common.c-into-common.c-container.c.patch
>>
>> - Introduce container object and covert existing vfio to use it:
>>   0007-vfio-Add-base-object-for-VFIOContainer.patch
>>   0008-vfio-container-Introduce-vfio_attach-detach_device.patch
>>   0009-vfio-platform-Use-vfio_-attach-detach-_device.patch
>>   0010-vfio-ap-Use-vfio_-attach-detach-_device.patch
>>   0011-vfio-ccw-Use-vfio_-attach-detach-_device.patch
>>   0012-vfio-container-obj-Introduce-attach-detach-_device-c.patch
>>   0013-vfio-container-obj-Introduce-VFIOContainer-reset-cal.patch
>>
>> - Introduce iommufd based container:
>>   0014-hw-iommufd-Creation.patch
>>   0015-vfio-iommufd-Implement-iommufd-backend.patch
>>   0016-vfio-iommufd-Add-IOAS_COPY_DMA-support.patch
>>
>> - Add backend selection for vfio-pci:
>>   0017-vfio-as-Allow-the-selection-of-a-given-iommu-backend.patch
>>   0018-vfio-pci-Add-an-iommufd-option.patch
>>
>> [1] https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-
>> iommufd_jgg@nvidia.com/
>> [2] https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6
>> [3] https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv1
>> [4] https://lore.kernel.org/kvm/0-v1-a8faf768d202+125dd-
>> vfio_mdev_no_group_jgg@nvidia.com/
> Following is probably more relevant to [4]:
>
> https://lore.kernel.org/all/10-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com/
>
> Thanks
> Kevin
>


