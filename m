Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626365ECA5F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:01:57 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDxz-0005fl-GS
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1odDiZ-0004fk-Fp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:45:59 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:52838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1odDiX-0001vZ-A8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:45:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D02BB81C82;
 Tue, 27 Sep 2022 16:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDCEC433D7;
 Tue, 27 Sep 2022 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664297152;
 bh=mXLjU0NnaHtLCXzlZQdzs2AQEJ7WwomDsI5Ppifs1N8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDkUbYfhgQpMOR4xOAGIpvC3KUpRrpv2Cb0i6vSlbE8N8lYMndgpVozg6zSru4iQT
 5fvJ0rypXB8osEQeEebIHIV+HypX4bJsAFFTAiXS5Bwqwj9tlkhFvusvCLtXdfSAnf
 JlIE66fDvqqZFYTcGtZv6zPpIzgOsU7iyRNircn79t4QmfdHEnBfAy5/DvIyfbJsWp
 1KqFlnSk8gRyghRxvOeR8nTetbwUEktzTAr9X+lApS7bkEdz2kvMKuT7eSY8JxHzv/
 Mh3/juQbl2JONbdhK2WDET+DvrmQum38ZYeZPKW7X5LRYBhp43Ii6U+iDa0GIjsgl5
 CpaStx0/nHVTg==
Date: Tue, 27 Sep 2022 09:45:49 -0700
From: Ben Widawsky <bwidawsk@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linuxarm@huawei.com
Subject: Re: [PATCH] mem/cxl-type3: Add sn option to provide serial number
 for PCI ecap
Message-ID: <20220927164549.4rcc7ttrkc7tod7g@bwidawsk-mobl5>
References: <20220923161835.9805-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923161835.9805-1-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=bwidawsk@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22-09-23 17:18:35, Jonathan Cameron wrote:
> The Device Serial Number Extended Capability PCI r6.0 sec 7.9.3
> provides a standard way to provide a device serial number as
> an IEEE defined 64-bit extended unique identifier EUI-64.
> 
> CXL 2.0 section 8.1.12.2 Memory Device PCIe Capabilities and
> Extended Capabilities requires this to be used to uniquely
> identify CXL memory devices.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Ben Widawsky <bwidawsk@kernel.org>

> ---
> 
> This is the missing element to be able to use the Linux kernel
> support for PMEM region creation.  Without this you can create
> a region, but not remount it after reboot (as the label
> is not valid).
> 
>  hw/mem/cxl_type3.c          | 14 +++++++++++++-
>  include/hw/cxl/cxl_device.h |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 3bf2869573..e0c1535b73 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -14,6 +14,12 @@
>  #include "sysemu/hostmem.h"
>  #include "hw/cxl/cxl.h"
>  
> +/*
> + * Null value of all Fs suggested by IEEE RA guidelines for use of
> + * EU, OUI and CID
> + */
> +#define UI64_NULL ~(0ULL)
> +
>  static void build_dvsecs(CXLType3Dev *ct3d)
>  {
>      CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
> @@ -149,7 +155,12 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>      pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
>  
>      pcie_endpoint_cap_init(pci_dev, 0x80);
> -    cxl_cstate->dvsec_offset = 0x100;
> +    if (ct3d->sn != UI64_NULL) {
> +        pcie_dev_ser_num_init(pci_dev, 0x100, ct3d->sn);
> +        cxl_cstate->dvsec_offset = 0x100 + 0x0c;
> +    } else {
> +        cxl_cstate->dvsec_offset = 0x100;
> +    }

Perhaps just always make it 0x10c to keep it simple and debuggable?

>  
>      ct3d->cxl_cstate.pdev = pci_dev;
>      build_dvsecs(ct3d);
> @@ -275,6 +286,7 @@ static Property ct3_props[] = {
>                       HostMemoryBackend *),
>      DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
>                       HostMemoryBackend *),
> +    DEFINE_PROP_UINT64("sn", CXLType3Dev, sn, UI64_NULL),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 1e141b6621..e4d221cdb3 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -237,6 +237,7 @@ struct CXLType3Dev {
>      /* Properties */
>      HostMemoryBackend *hostmem;
>      HostMemoryBackend *lsa;
> +    uint64_t sn;
>  
>      /* State */
>      AddressSpace hostmem_as;
> -- 
> 2.32.0
> 

