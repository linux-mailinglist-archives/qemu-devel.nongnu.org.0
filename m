Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D362598B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 22:54:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTBmH-00028r-Sp
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 16:54:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alifm@linux.ibm.com>) id 1hTBk3-00016Y-4C
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:52:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alifm@linux.ibm.com>) id 1hTBk1-0006tA-JS
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:52:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60972
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alifm@linux.ibm.com>) id 1hTBk1-0006sy-Cr
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:52:09 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4LKq6KT101022
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 16:52:07 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2smq5nk89n-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 16:52:07 -0400
Received: from localhost
	by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alifm@linux.ibm.com>;
	Tue, 21 May 2019 21:52:07 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
	by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 21 May 2019 21:52:03 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x4LKomDW32309522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 21 May 2019 20:50:48 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0466BAC05E;
	Tue, 21 May 2019 20:50:48 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0E58AC05B;
	Tue, 21 May 2019 20:50:47 +0000 (GMT)
Received: from [9.56.58.18] (unknown [9.56.58.18])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 21 May 2019 20:50:47 +0000 (GMT)
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>
References: <20190507154733.28604-1-cohuck@redhat.com>
	<20190507154733.28604-3-cohuck@redhat.com>
From: Farhan Ali <alifm@linux.ibm.com>
Date: Tue, 21 May 2019 16:50:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20190507154733.28604-3-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19052120-0052-0000-0000-000003C50231
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011138; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01206662; UDB=6.00633641;
	IPR=6.00987629; 
	MB=3.00026992; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-21 20:52:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052120-0053-0000-0000-000060FE0E9B
Message-Id: <ee44aca2-708b-9ced-b658-731cf6528129@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905210130
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH v4 2/2] vfio-ccw: support async command
 subregion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/07/2019 11:47 AM, Cornelia Huck wrote:
> A vfio-ccw device may provide an async command subregion for
> issuing halt/clear subchannel requests. If it is present, use
> it for sending halt/clear request to the device; if not, fall
> back to emulation (as done today).
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/s390x/css.c              |  27 +++++++--
>   hw/vfio/ccw.c               | 110 +++++++++++++++++++++++++++++++++++-
>   include/hw/s390x/s390-ccw.h |   3 +
>   3 files changed, 134 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 8fc9e35ba5d3..5b21a74b5c29 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -22,6 +22,7 @@
>   #include "trace.h"
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/s390x/s390-virtio-ccw.h"
> +#include "hw/s390x/s390-ccw.h"
>   
>   typedef struct CrwContainer {
>       CRW crw;
> @@ -1191,6 +1192,26 @@ static void sch_handle_start_func_virtual(SubchDev *sch)
>   
>   }
>   
> +static void sch_handle_halt_func_passthrough(SubchDev *sch)
> +{
> +    int ret;
> +
> +    ret = vfio_ccw_handle_halt(sch);
> +    if (ret == -ENOSYS) {
> +        sch_handle_halt_func(sch);
> +    }
> +}
> +
> +static void sch_handle_clear_func_passthrough(SubchDev *sch)
> +{
> +    int ret;
> +
> +    ret = vfio_ccw_handle_clear(sch);
> +    if (ret == -ENOSYS) {
> +        sch_handle_clear_func(sch);
> +    }
> +}
> +
>   static IOInstEnding sch_handle_start_func_passthrough(SubchDev *sch)
>   {
>       SCHIB *schib = &sch->curr_status;
> @@ -1230,11 +1251,9 @@ IOInstEnding do_subchannel_work_passthrough(SubchDev *sch)
>       SCHIB *schib = &sch->curr_status;
>   
>       if (schib->scsw.ctrl & SCSW_FCTL_CLEAR_FUNC) {
> -        /* TODO: Clear handling */
> -        sch_handle_clear_func(sch);
> +        sch_handle_clear_func_passthrough(sch);
>       } else if (schib->scsw.ctrl & SCSW_FCTL_HALT_FUNC) {
> -        /* TODO: Halt handling */
> -        sch_handle_halt_func(sch);
> +        sch_handle_halt_func_passthrough(sch);
>       } else if (schib->scsw.ctrl & SCSW_FCTL_START_FUNC) {
>           return sch_handle_start_func_passthrough(sch);
>       }
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 31dd3a2a87b6..175a17b1772a 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -2,9 +2,12 @@
>    * vfio based subchannel assignment support
>    *
>    * Copyright 2017 IBM Corp.
> + * Copyright 2019 Red Hat, Inc.
> + *
>    * Author(s): Dong Jia Shi <bjsdjshi@linux.vnet.ibm.com>
>    *            Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>    *            Pierre Morel <pmorel@linux.vnet.ibm.com>
> + *            Cornelia Huck <cohuck@redhat.com>
>    *
>    * This work is licensed under the terms of the GNU GPL, version 2 or (at
>    * your option) any later version. See the COPYING file in the top-level
> @@ -32,6 +35,9 @@ struct VFIOCCWDevice {
>       uint64_t io_region_size;
>       uint64_t io_region_offset;
>       struct ccw_io_region *io_region;
> +    uint64_t async_cmd_region_size;
> +    uint64_t async_cmd_region_offset;
> +    struct ccw_cmd_region *async_cmd_region;
>       EventNotifier io_notifier;
>       bool force_orb_pfch;
>       bool warned_orb_pfch;
> @@ -114,6 +120,87 @@ again:
>       }
>   }
>   
> +int vfio_ccw_handle_clear(SubchDev *sch)
> +{
> +    S390CCWDevice *cdev = sch->driver_data;
> +    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
> +    struct ccw_cmd_region *region = vcdev->async_cmd_region;
> +    int ret;
> +
> +    if (!vcdev->async_cmd_region) {
> +        /* Async command region not available, fall back to emulation */
> +        return -ENOSYS;
> +    }
> +
> +    memset(region, 0, sizeof(*region));
> +    region->command = VFIO_CCW_ASYNC_CMD_CSCH;
> +
> +again:
> +    ret = pwrite(vcdev->vdev.fd, region,
> +                 vcdev->async_cmd_region_size, vcdev->async_cmd_region_offset);
> +    if (ret != vcdev->async_cmd_region_size) {
> +        if (errno == EAGAIN) {
> +            goto again;
> +        }
> +        error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
> +        ret = -errno;
> +    } else {
> +        ret = region->ret_code;
> +    }
> +    switch (ret) {
> +    case 0:
> +    case -ENODEV:
> +    case -EACCES:
> +        return 0;
> +    case -EFAULT:
> +    default:
> +        sch_gen_unit_exception(sch);
> +        css_inject_io_interrupt(sch);
> +        return 0;
> +    }
> +}
> +
> +int vfio_ccw_handle_halt(SubchDev *sch)
> +{
> +    S390CCWDevice *cdev = sch->driver_data;
> +    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
> +    struct ccw_cmd_region *region = vcdev->async_cmd_region;
> +    int ret;
> +
> +    if (!vcdev->async_cmd_region) {
> +        /* Async command region not available, fall back to emulation */
> +        return -ENOSYS;
> +    }
> +
> +    memset(region, 0, sizeof(*region));
> +    region->command = VFIO_CCW_ASYNC_CMD_HSCH;
> +
> +again:
> +    ret = pwrite(vcdev->vdev.fd, region,
> +                 vcdev->async_cmd_region_size, vcdev->async_cmd_region_offset);
> +    if (ret != vcdev->async_cmd_region_size) {
> +        if (errno == EAGAIN) {
> +            goto again;
> +        }
> +        error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
> +        ret = -errno;
> +    } else {
> +        ret = region->ret_code;
> +    }
> +    switch (ret) {
> +    case 0:
> +    case -EBUSY:
> +    case -ENODEV:
> +    case -EACCES:
> +        return 0;
> +    case -EFAULT:
> +    default:
> +        sch_gen_unit_exception(sch);
> +        css_inject_io_interrupt(sch);
> +        return 0;
> +    }
> +}
> +
>   static void vfio_ccw_reset(DeviceState *dev)
>   {
>       CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
> @@ -287,9 +374,13 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
>           return;
>       }
>   
> +    /*
> +     * We always expect at least the I/O region to be present. We also
> +     * may have a variable number of regions governed by capabilities.
> +     */
>       if (vdev->num_regions < VFIO_CCW_CONFIG_REGION_INDEX + 1) {
> -        error_setg(errp, "vfio: Unexpected number of the I/O region %u",
> -                   vdev->num_regions);
> +        error_setg(errp, "vfio: too few regions (%u), expected at least %u",
> +                   vdev->num_regions, VFIO_CCW_CONFIG_REGION_INDEX + 1);
>           return;
>       }
>   
> @@ -309,11 +400,26 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
>       vcdev->io_region_offset = info->offset;
>       vcdev->io_region = g_malloc0(info->size);
>   
> +    /* check for the optional async command region */
> +    ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
> +                                   VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD, &info);
> +    if (!ret) {
> +        vcdev->async_cmd_region_size = info->size;
> +        if (sizeof(*vcdev->async_cmd_region) != vcdev->async_cmd_region_size) {
> +            error_setg(errp, "vfio: Unexpected size of the async cmd region");
> +            g_free(info);
> +            return;
> +        }
> +        vcdev->async_cmd_region_offset = info->offset;
> +        vcdev->async_cmd_region = g_malloc0(info->size);
> +    }
> +
>       g_free(info);
>   }
>   
>   static void vfio_ccw_put_region(VFIOCCWDevice *vcdev)
>   {
> +    g_free(vcdev->async_cmd_region);
>       g_free(vcdev->io_region);
>   }
>   
> diff --git a/include/hw/s390x/s390-ccw.h b/include/hw/s390x/s390-ccw.h
> index 901d805d79a3..e9c7e1db5761 100644
> --- a/include/hw/s390x/s390-ccw.h
> +++ b/include/hw/s390x/s390-ccw.h
> @@ -37,4 +37,7 @@ typedef struct S390CCWDeviceClass {
>       IOInstEnding (*handle_request) (SubchDev *sch);
>   } S390CCWDeviceClass;
>   
> +int vfio_ccw_handle_clear(SubchDev *sch);
> +int vfio_ccw_handle_halt(SubchDev *sch);
> +

We are not making clear and halt functions part of the 
S390CCWDeviceClass, is there are reason for doing this?
Currently we handle ssch through the handle_request function, it just 
looks a little inconsistent.

Thanks
Farhan


>   #endif
> 


