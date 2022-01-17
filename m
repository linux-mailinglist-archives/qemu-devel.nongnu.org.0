Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64750490B49
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:21:13 +0100 (CET)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tol-0002Wi-GY
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:21:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9TMb-0002RY-HC
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9TMX-0000h0-W8
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642431120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYAtZcjyuoX0DjZkPIZLJjV+OOG9FhqW9aqSYkAjkg4=;
 b=RGVYzdM3J3sMaH0ktt57oa3QHl5XOHyUIw1FPO6RaVoh6ivChrzPozDsa+VQW35HRSAMVB
 C9lc71b86ywFYVpJMGzbUwNR1mUBCURIFN2C7+Jj8BWm3o8To6rx7uKkYlDbD465x1uJ+g
 7bxSknTsD1r/R6LZsXsXdmDcJ5xxKz0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-15VY3qKYNa2CYnBs7lqXfA-1; Mon, 17 Jan 2022 09:51:59 -0500
X-MC-Unique: 15VY3qKYNa2CYnBs7lqXfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n25-20020a05600c3b9900b00348b83fbd0dso48376wms.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JYAtZcjyuoX0DjZkPIZLJjV+OOG9FhqW9aqSYkAjkg4=;
 b=saZl4TXvNGn4TaRhyRamqDIHDQh0UsV/3mK4WCx6kH+4apRZPDz3650CYY3/fgBWuc
 Gwo4RSfBQeiNeSGOLIagY4F7d+Qu99YlzhWFsd7meYx/GnDXL6CoAt/WHoV6ZKnLiXuu
 PsZJaopuzyP/l4k9rf7bOt7WpwqXPylfWmuxqXi8WWVPYWZEcadbFrTQyFGmKQ3MFQ4G
 zUL3hFXjhFd/8lZMkzbNcXHgC1N/xWHmC32j3N+4JNDbecqfN+G/CqJVy2B2kE/F+blS
 QhqFblkp7FReNC5Lu1p9QO6V5FBysCk39i7xIFDSc1+/ZEig/lzLsxM08fAFtWGyrEL2
 EWfQ==
X-Gm-Message-State: AOAM533SZ/O4OnIrhun27wWMsIwNRkB23Yas3DmVU9z1DagjzYdFfZt2
 2FQ6fIjxuubnxna34uOmuZBrsQpdgQL86OsM54gPXkxlrFlZmO7XdBGbM2j8i1Kv1AUj7Ipkyhz
 qpTz6+dwcXPSY+qU=
X-Received: by 2002:a05:6000:101:: with SMTP id
 o1mr20002490wrx.173.1642431118293; 
 Mon, 17 Jan 2022 06:51:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyayeNL3WusA1PdWvtbjUbFmtFwRg6j5ZoTNy/AM2OabqsS9JtSXb1LfP0FA4rQJR+v0S+8WQ==
X-Received: by 2002:a05:6000:101:: with SMTP id
 o1mr20002471wrx.173.1642431118056; 
 Mon, 17 Jan 2022 06:51:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id g13sm4945512wmq.22.2022.01.17.06.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:51:57 -0800 (PST)
Message-ID: <27a1db36-5664-6c90-ec39-aa6da5c23c31@redhat.com>
Date: Mon, 17 Jan 2022 15:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/9] s390x/pci: enable for load/store intepretation
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <20220114203849.243657-5-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220114203849.243657-5-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/2022 21.38, Matthew Rosato wrote:
> Use the associated vfio feature ioctl to enable interpretation for devices
> when requested.  As part of this process, we must use the host function
> handle rather than a QEMU-generated one -- this is provided as part of the
> ioctl payload.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c          | 70 +++++++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-inst.c         | 63 +++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-vfio.c         | 52 ++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-bus.h  |  1 +
>   include/hw/s390x/s390-pci-vfio.h | 15 +++++++
>   5 files changed, 199 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 01b58ebc70..a39ccfee05 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -971,12 +971,58 @@ static void s390_pci_update_subordinate(PCIDevice *dev, uint32_t nr)
>       }
>   }
>   
> +static int s390_pci_interp_plug(S390pciState *s, S390PCIBusDevice *pbdev)
> +{
> +    uint32_t idx;
> +    int rc;
> +
> +    rc = s390_pci_probe_interp(pbdev);
> +    if (rc) {
> +        return rc;
> +    }
> +
> +    rc = s390_pci_update_passthrough_fh(pbdev);
> +    if (rc) {
> +        return rc;
> +    }
> +
> +    /*
> +     * The host device is already in an enabled state, but we always present
> +     * the initial device state to the guest as disabled (ZPCI_FS_DISABLED).
> +     * Therefore, mask off the enable bit from the passthrough handle until
> +     * the guest issues a CLP SET PCI FN later to enable the device.
> +     */
> +    pbdev->fh &= ~FH_MASK_ENABLE;
> +
> +    /* Next, see if the idx is already in-use */
> +    idx = pbdev->fh & FH_MASK_INDEX;
> +    if (pbdev->idx != idx) {
> +        if (s390_pci_find_dev_by_idx(s, idx)) {
> +            return -EINVAL;
> +        }
> +        /*
> +         * Update the idx entry with the passed through idx
> +         * If the relinquished idx is lower than next_idx, use it
> +         * to replace next_idx
> +         */
> +        g_hash_table_remove(s->zpci_table, &pbdev->idx);
> +        if (idx < s->next_idx) {
> +            s->next_idx = idx;
> +        }
> +        pbdev->idx = idx;
> +        g_hash_table_insert(s->zpci_table, &pbdev->idx, pbdev);
> +    }
> +
> +    return 0;
> +}
> +
>   static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                 Error **errp)
>   {
>       S390pciState *s = S390_PCI_HOST_BRIDGE(hotplug_dev);
>       PCIDevice *pdev = NULL;
>       S390PCIBusDevice *pbdev = NULL;
> +    int rc;
>   
>       if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
>           PCIBridge *pb = PCI_BRIDGE(dev);
> @@ -1022,12 +1068,33 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>           set_pbdev_info(pbdev);
>   
>           if (object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
> -            pbdev->fh |= FH_SHM_VFIO;
> +            /*
> +             * By default, interpretation is always requested; if the available
> +             * facilities indicate it is not available, fallback to the
> +             * intercept model.
> +             */
> +            if (pbdev->interp && !s390_has_feat(S390_FEAT_ZPCI_INTERP)) {
> +                    DPRINTF("zPCI interpretation facilities missing.\n");
> +                    pbdev->interp = false;
> +                }

Wrong indentation in the above three lines.

> +            if (pbdev->interp) {
> +                rc = s390_pci_interp_plug(s, pbdev);
> +                if (rc) {
> +                    error_setg(errp, "zpci interp plug failed: %d", rc);

The error message is a little bit scarce for something that might be 
presented to the user - maybe write at least "interpretation" instead of 
"interp" ?

> +                    return;
> +                }
> +            }
>               pbdev->iommu->dma_limit = s390_pci_start_dma_count(s, pbdev);
>               /* Fill in CLP information passed via the vfio region */
>               s390_pci_get_clp_info(pbdev);
> +            if (!pbdev->interp) {
> +                /* Do vfio passthrough but intercept for I/O */
> +                pbdev->fh |= FH_SHM_VFIO;
> +            }
>           } else {
>               pbdev->fh |= FH_SHM_EMUL;
> +            /* Always intercept emulated devices */
> +            pbdev->interp = false;
>           }

  Thomas


