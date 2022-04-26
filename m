Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172CA50FC37
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:46:54 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJee-00050Q-TD
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njJcl-0003Th-F0
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njJch-0003Uq-PB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650973490;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pINpUza2yW3i1/LtapnVwHmIAIjwecqjk0Kj8K0Bres=;
 b=L+mt3NZNMVkWATeXVNIT5tXaeFjn8fNGDxpqanKSnLVLsqnPukvl7Y4BU/SAv/1eL1eygL
 u2zgPktghIxHG7JxKujlUwpme9YlwwGns2WwSabSn+OYJKHLX+I2jvyom1w77344gmpPPD
 1hQvQHrMuebGsoP1VLFmiuB7hoKsjE0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-e32re7TYM_i3uQ8tdu3TRw-1; Tue, 26 Apr 2022 07:44:49 -0400
X-MC-Unique: e32re7TYM_i3uQ8tdu3TRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso7905130wma.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 04:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pINpUza2yW3i1/LtapnVwHmIAIjwecqjk0Kj8K0Bres=;
 b=Xaah4ZOBkfClHZ3opd3LTalRN1ztkqU+W0dOlC+nYzqcEXjbCUZA0v+i2xHmbbPTne
 iXmJEpm2yJbS5JpC3k0i0fbgIGDbSTA3VKzlxiJ10Lt+az6hhNrB39/pMXxjWQAqxEfe
 Sx/KXjcYAcI3L9CJqUjwXOulXn538EHUtJavXGN5QaV3Xq4Y0gaLqPnZO+dhTa5ZdSqW
 4O+Zd4As/uHOWQIDdNe64JJpXq9M5IePXUC9Clh/h6vd1lAuvst47ItVdHymePYrkIG7
 eOXsGdS87WRazKudwJLAIupfZGtEU0+maIZSOoZ1Ldd6kiIq0k7ZPM9PlSoYjX2xh9/N
 EM3w==
X-Gm-Message-State: AOAM533U+FjKpdgPhIBhx1AsF8d+jg2OeqBvl2ZNMgK1Bhh8HqXDs7im
 Y2HWPrAS7RiiQoc9GrZ1Sjhb1i6Zu9k5NNuyqWA47cLnR40ASXlN9GEPgOSeIFERVDtgjNilbvS
 yig58PiE02bHFFZc=
X-Received: by 2002:a05:600c:2d93:b0:393:fbf7:5a58 with SMTP id
 i19-20020a05600c2d9300b00393fbf75a58mr634762wmg.101.1650973485290; 
 Tue, 26 Apr 2022 04:44:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb7okn8/fEZmEufRhvsiAQWIxugxvRL7RUwXysB9UTYFMGYvZsKTIeUlhVkcgCO2fK8gn5cA==
X-Received: by 2002:a05:600c:2d93:b0:393:fbf7:5a58 with SMTP id
 i19-20020a05600c2d9300b00393fbf75a58mr634725wmg.101.1650973485017; 
 Tue, 26 Apr 2022 04:44:45 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm12920958wmq.35.2022.04.26.04.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 04:44:44 -0700 (PDT)
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Yi Liu <yi.l.liu@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <4f920d463ebf414caa96419b625632d5@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
Date: Tue, 26 Apr 2022 13:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4f920d463ebf414caa96419b625632d5@huawei.com>
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
 "thuth@redhat.com" <thuth@redhat.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "yi.y.sun@intel.com" <yi.y.sun@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, Zhangfei Gao <zhangfei.gao@linaro.org>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shameer,

On 4/26/22 11:47 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Yi Liu [mailto:yi.l.liu@intel.com]
>> Sent: 14 April 2022 11:47
>> To: alex.williamson@redhat.com; cohuck@redhat.com;
>> qemu-devel@nongnu.org
>> Cc: david@gibson.dropbear.id.au; thuth@redhat.com; farman@linux.ibm.com;
>> mjrosato@linux.ibm.com; akrowiak@linux.ibm.com; pasic@linux.ibm.com;
>> jjherne@linux.ibm.com; jasowang@redhat.com; kvm@vger.kernel.org;
>> jgg@nvidia.com; nicolinc@nvidia.com; eric.auger@redhat.com;
>> eric.auger.pro@gmail.com; kevin.tian@intel.com; yi.l.liu@intel.com;
>> chao.p.peng@intel.com; yi.y.sun@intel.com; peterx@redhat.com
>> Subject: [RFC 00/18] vfio: Adopt iommufd
>>
>> With the introduction of iommufd[1], the linux kernel provides a generic
>> interface for userspace drivers to propagate their DMA mappings to kernel
>> for assigned devices. This series does the porting of the VFIO devices
>> onto the /dev/iommu uapi and let it coexist with the legacy implementation.
>> Other devices like vpda, vfio mdev and etc. are not considered yet.
>>
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
>>                     VFIO
>> AddressSpace/Memory
>>     +-------+  +----------+  +-----+  +-----+
>>     |  pci  |  | platform |  |  ap |  | ccw |
>>     +---+---+  +----+-----+  +--+--+  +--+--+     +----------------------+
>>         |           |           |        |        |   AddressSpace
>> |
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
>> ===========+============================+==========================
>> ======
>>  Kernel     |  device fd                 |
>>             +---------------+            | group/container fd
>>             | (BIND_IOMMUFD |            |
>> (SET_CONTAINER/SET_IOMMU)
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
>>
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
>> for a container. This base class is derived into the legacy VFIO container
>> and the new iommufd based container. The base class implements generic
>> code
>> such as code related to memory_listener and address space management
>> whereas
>> the derived class implements callbacks that depend on the kernel user space
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
>> - ccw and ap were only compile-tested
>> - limited device hotplug test
>> - vIOMMU test run for both legacy and iommufd backends (limited tests)
>>
>> This series was co-developed by Eric Auger and me based on the exploration
>> iommufd kernel[2], complete code of this series is available in[3]. As
>> iommufd kernel is in the early step (only iommufd generic interface is in
>> mailing list), so this series hasn't made the iommufd backend fully on par
>> with legacy backend w.r.t. features like p2p mappings, coherency tracking,
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
>>
>> 0005-vfio-common-Rename-VFIOGuestIOMMU-iommu-into-iommu_m.patch
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
>> [1]
>> https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com
>> /
>> [2] https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6
>> [3] https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv1
> Hi,
>
> I had a go with the above branches on our ARM64 platform trying to pass-through
> a VF dev, but Qemu reports an error as below,
>
> [    0.444728] hisi_sec2 0000:00:01.0: enabling device (0000 -> 0002)
> qemu-system-aarch64-iommufd: IOMMU_IOAS_MAP failed: Bad address
> qemu-system-aarch64-iommufd: vfio_container_dma_map(0xaaaafeb40ce0, 0x8000000000, 0x10000, 0xffffb40ef000) = -14 (Bad address)
>
> I think this happens for the dev BAR addr range. I haven't debugged the kernel
> yet to see where it actually reports that. 
Does it prevent your assigned device from working? I have such errors
too but this is a known issue. This is due to the fact P2P DMA is not
supported yet.

Thanks

Eric

>
> Maybe I am missing something. Please let me know.
>
> Thanks,
> Shameer
>


