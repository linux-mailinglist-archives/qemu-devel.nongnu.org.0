Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A9426204
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 03:28:48 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYegp-0007KM-Dp
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 21:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mYefU-0005J6-BC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:27:24 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mYefS-0003KG-Ok
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:27:24 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HQVrB44VZz1DHf0;
 Fri,  8 Oct 2021 09:25:46 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:27:16 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:27:16 +0800
Subject: Re: [PATCH v2 0/2] vfio: Some fixes about vfio-pci MMIO RAM mapping
To: Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <59ccc25e-3a5e-8963-209e-a3c9e5dece92@huawei.com>
Date: Fri, 8 Oct 2021 09:27:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210914015326.1494-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wanghaibin.wang@huawei.com, tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping,

Hi all,

Will this patch be picked up soon, or is there any other advice?

Thanks,
Kunkun Jiang

On 2021/9/14 9:53, Kunkun Jiang wrote:
> This series include patches as below:
>
> Patch 1:
> - vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in live migration
>
> Patch 2:
> - Added a trace point to informe users when a MMIO RAM ection less than PAGE_SIZE
>
> History:
>
> v1 -> v2:
> - Add iterate sub-page BARs in vfio_pci_load_config and try to update them [Alex Williamson]
>
> Kunkun Jiang (2):
>    vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in live migration
>    vfio/common: Add trace point when a MMIO RAM section less than
>      PAGE_SIZE
>
>   hw/vfio/common.c |  7 +++++++
>   hw/vfio/pci.c    | 15 ++++++++++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
>


