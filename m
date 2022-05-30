Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299525373DB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 06:18:29 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvWrL-0001xg-Ok
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 00:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nvWpr-0001Hj-VT
 for qemu-devel@nongnu.org; Mon, 30 May 2022 00:16:56 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nvWpo-0003LX-5R
 for qemu-devel@nongnu.org; Mon, 30 May 2022 00:16:55 -0400
Received: from kwepemi500025.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LBMWR6tQgzbc8P;
 Mon, 30 May 2022 12:14:59 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi500025.china.huawei.com (7.221.188.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 12:16:36 +0800
Message-ID: <5dcfcf36-8907-f781-0990-edf255bc2425@huawei.com>
Date: Mon, 30 May 2022 12:16:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 resend 0/4] add generic vDPA device support
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20220514041107.1980-1-longpeng2@huawei.com>
In-Reply-To: <20220514041107.1980-1-longpeng2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500025.china.huawei.com (7.221.188.170)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>

Hi guys,

Ping...Any other comments?

在 2022/5/14 12:11, Longpeng(Mike) 写道:
> From: Longpeng <longpeng2@huawei.com>
>
> Hi guys,
>
> With the generic vDPA device, QEMU won't need to touch the device
> types any more, such like vfio.
>
> We can use the generic vDPA device as follow:
>    -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
>    Or
>    -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>    vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
>
> I've done some simple tests on Huawei's offloading card (net, 0.95).
>
> Changes v5 -> v6:
>    Patch 2:
>      - Turn to the original approach in the RFC to initialize the
>        virtio_pci_id_info array. [Michael]
> 	  https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huawei.com/
>    Patch 3:
>      - Fix logical error of exception handler around the post_init.
>        [Stefano]
>      - Fix some coding style warnings. [Stefano]
>    Patch 4:
>      - Fix some coding style warnings. [Stefano]
>
> Changes v4 -> v5:
>    Patch 3:
>      - remove vhostfd [Jason]
>      - support virtio-mmio [Jason]
>
> Changes v3 -> v4:
>    v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.html
>    - reorganize the series [Stefano]
>    - fix some typos [Stefano]
>    - fix logical error in vhost_vdpa_device_realize [Stefano]
>
> Changes v2 -> v3
>    Patch 4 & 5:
>      - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
>      - s/VQS_NUM/VQS_COUNT  [Stefano]
>      - check both vdpa_dev_fd and vdpa_dev [Stefano]
>    Patch 6:
>      - move all steps into vhost_vdpa_device_unrealize. [Stefano]
>
> Changes RFC -> v2
>    Patch 1:
>      - rename 'pdev_id' to 'trans_devid'  [Michael]
>      - only use transitional device id for the devices
>        listed in the spec  [Michael]
>      - use macros to make the id_info table clearer  [Longpeng]
>      - add some modern devices in the id_info table  [Longpeng]
>    Patch 2:
>      - remove the GET_VECTORS_NUM command  [Jason]
>    Patch 4:
>      - expose vdpa_dev_fd as a QOM preperty  [Stefan]
>      - introduce vhost_vdpa_device_get_u32 as a common
>        function to make the code clearer  [Stefan]
>      - fix the misleading description of 'dc->desc'  [Stefano]
>    Patch 5:
>      - check returned number of virtqueues  [Stefan]
>    Patch 6:
>      - init s->num_queues  [Stefano]
>      - free s->dev.vqs  [Stefano]
>
>
> Longpeng (Mike) (4):
>    linux-headers: Update headers to Linux 5.18-rc6
>    virtio: get class_id and pci device id by the virtio id
>    vdpa: add vdpa-dev support
>    vdpa: add vdpa-dev-pci support
>
>   hw/virtio/Kconfig            |   5 +
>   hw/virtio/meson.build        |   2 +
>   hw/virtio/vdpa-dev-pci.c     | 102 ++++++++++
>   hw/virtio/vdpa-dev.c         | 377 +++++++++++++++++++++++++++++++++++
>   hw/virtio/virtio-pci.c       |  88 ++++++++
>   hw/virtio/virtio-pci.h       |   5 +
>   include/hw/virtio/vdpa-dev.h |  43 ++++
>   linux-headers/linux/vhost.h  |   7 +
>   8 files changed, 629 insertions(+)
>   create mode 100644 hw/virtio/vdpa-dev-pci.c
>   create mode 100644 hw/virtio/vdpa-dev.c
>   create mode 100644 include/hw/virtio/vdpa-dev.h
>

