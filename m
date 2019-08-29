Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386BA1A89
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 14:55:24 +0200 (CEST)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3JxT-0005BA-GD
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 08:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuval.shaia@oracle.com>) id 1i3Jw8-0004jg-OH
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 08:54:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuval.shaia@oracle.com>) id 1i3Jw6-0007TW-U3
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 08:54:00 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:47872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
 id 1i3Jw6-0007Rp-KC
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 08:53:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TCoRCB023037;
 Thu, 29 Aug 2019 12:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=bwyCfowvtMT6RzDjvUbq633WnOqs7QHUt+qHPPTnCTc=;
 b=TBbQj5txF84PfTKFtq14r7/WGXI7BuCQaaLz4S144QSiI8qvV/pTiLzhzAF/ZUcd8IeG
 Cm2N51KKQb4BGkX0bZYDUMRGjbeZ6tAuAo9xtkZ/hnScw0sP3rtewVxgAIUZSsqeJgyT
 XRzj/gDK0wbsvnxvZkInzHJpUZG7wfPaYuF3/D907OWXrk5eSMpNRrcUzhUP7yE23GbG
 vXxpgEcPaeKzhvyui/qJuMeu8+K5TC/Q1JqRPDm2sVJwULqg+EW5t/KxgB0efnnkRmdo
 nepVmpcj8S4fH9tFF7S8Ne375p8gVatjYNyZiaLzAUfm2w9swDpjCYI5PeG6AwmZ75Zh FQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2upf2eg0pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 12:53:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TCrXtC008077;
 Thu, 29 Aug 2019 12:53:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2upc8unp2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 12:53:54 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7TCrIM3022396;
 Thu, 29 Aug 2019 12:53:19 GMT
Received: from lap1 (/10.175.46.168) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 05:53:17 -0700
Date: Thu, 29 Aug 2019 15:53:14 +0300
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
Message-ID: <20190829125313.GB9911@lap1>
References: <20190828142328.24561-1-skrtbhtngr@gmail.com>
 <20190828142328.24561-3-skrtbhtngr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828142328.24561-3-skrtbhtngr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290141
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: Re: [Qemu-devel] [PATCH v1 2/2] hw/pvrdma: add live migration
 support
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 28, 2019 at 07:53:28PM +0530, Sukrit Bhatnagar wrote:
> vmstate_pvrdma describes the PCI and MSIX states as well as the dma
> address for dsr and the gid table of device.
> vmstate_pvrdma_gids describes each gid in the gid table.
> 
> pvrdma_post_save() does the job of unregistering gid entries from the
> backend device in the source host.
> 
> pvrdma_post_load() maps to dsr using the loaded dma address, registers
> each loaded gid into the backend device, and finally calls load_dsr()
> to perform other mappings and ring init operations.

I think it worth to mention that the dma address is kept in driver/device
shared memory (dsr->dma) which is migrated as part of memory migration and
it is out of the scope of this change and so we do not need to save/load
the dma address during migration.

Also you should specifically comment that this migration-support does not
includes QP migration. This means that support for life migration *during*
traffic is not yet supported.

> 
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Yuval Shaia <yuval.shaia@oracle.com>
> Signed-off-by: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
> ---
>  hw/rdma/vmw/pvrdma_main.c | 77 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 6c90db96f9..6f8b56dea3 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -28,6 +28,7 @@
>  #include "sysemu/sysemu.h"
>  #include "monitor/monitor.h"
>  #include "hw/rdma/rdma.h"
> +#include "migration/register.h"
>  
>  #include "../rdma_rm.h"
>  #include "../rdma_backend.h"
> @@ -593,6 +594,81 @@ static void pvrdma_shutdown_notifier(Notifier *n, void *opaque)
>      pvrdma_fini(pci_dev);
>  }
>  
> +static int pvrdma_post_save(void *opaque)
> +{
> +    int i, rc;
> +    PVRDMADev *dev = opaque;
> +
> +    for (i = 0; i < MAX_GIDS; i++) {
> +

Empty line is redundant here.

> +        if (!dev->rdma_dev_res.port.gid_tbl[i].gid.global.interface_id) {
> +            continue;
> +        }
> +        rc = rdma_backend_del_gid(&dev->backend_dev,
> +                                   dev->backend_eth_device_name,
> +                                   &dev->rdma_dev_res.port.gid_tbl[i].gid);
> +        if (rc) {
> +            return -EINVAL;

Some error report will help here i guess.

> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int pvrdma_post_load(void *opaque, int version_id)
> +{
> +    int i, rc;
> +    PVRDMADev *dev = opaque;
> +    PCIDevice *pci_dev = PCI_DEVICE(dev);
> +    DSRInfo *dsr_info = &dev->dsr_info;
> +
> +    dsr_info->dsr = rdma_pci_dma_map(pci_dev, dsr_info->dma,
> +                                sizeof(struct pvrdma_device_shared_region));
> +    if (!dsr_info->dsr) {
> +        rdma_error_report("Failed to map to DSR");
> +        return -ENOMEM;
> +    }
> +
> +    for (i = 0; i < MAX_GIDS; i++) {
> +

Empty line is redundant here.

> +        if (!dev->rdma_dev_res.port.gid_tbl[i].gid.global.interface_id) {
> +            continue;
> +        }
> +
> +        rc = rdma_backend_add_gid(&dev->backend_dev,
> +                                  dev->backend_eth_device_name,
> +                                  &dev->rdma_dev_res.port.gid_tbl[i].gid);
> +        if (rc) {
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return load_dsr(dev);
> +}
> +
> +static const VMStateDescription vmstate_pvrdma_gids = {
> +    .name = "pvrdma-gids",
> +    .fields = (VMStateField[]) {
> +            VMSTATE_UINT8_ARRAY_V(gid.raw, RdmaRmGid, 16, 0),
> +            VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_pvrdma = {
> +    .name = PVRDMA_HW_NAME,
> +    .post_save = pvrdma_post_save,
> +    .post_load = pvrdma_post_load,
> +    .fields = (VMStateField[]) {
> +            VMSTATE_PCI_DEVICE(parent_obj, PVRDMADev),
> +            VMSTATE_MSIX(parent_obj, PVRDMADev),
> +            VMSTATE_UINT64(dsr_info.dma, PVRDMADev),
> +            VMSTATE_STRUCT_ARRAY(rdma_dev_res.port.gid_tbl, PVRDMADev,
> +                                 MAX_PORT_GIDS, 0, vmstate_pvrdma_gids,
> +                                 RdmaRmGid),
> +            VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void pvrdma_realize(PCIDevice *pdev, Error **errp)
>  {
>      int rc = 0;
> @@ -688,6 +764,7 @@ static void pvrdma_class_init(ObjectClass *klass, void *data)
>  
>      dc->desc = "RDMA Device";
>      dc->props = pvrdma_dev_properties;
> +    dc->vmsd = &vmstate_pvrdma;
>      set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
>  
>      ir->print_statistics = pvrdma_print_statistics;
> -- 
> 2.21.0
> 
> 

