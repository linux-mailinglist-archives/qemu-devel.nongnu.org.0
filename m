Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D44A3F1E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:17:47 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESok-0007RH-4q
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nESlO-0005Zy-8X
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nESlM-0005AJ-CM
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620455;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhckrskEPNv79M5fE5OkrbvLe7aU7O9I8G8Gpid0TgA=;
 b=XswgV8Gq50xhTXGne0dJ+FP375DO4DyxqRX2ro9jUNDUHgbExpRSwCDyT0JMV69ePp4adR
 6RG1ma93w93nGL2MdXYAO91vX5HtUhmLX1YMbiRbhLAijzOw8ZIk7IwcbDG/rXVA8tcjK/
 SLQdUtmYYWEYvG1tIFRZdB/OE770hlk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-Ofhlm_80PFOq4jDo9nEyCA-1; Mon, 31 Jan 2022 04:14:13 -0500
X-MC-Unique: Ofhlm_80PFOq4jDo9nEyCA-1
Received: by mail-wr1-f69.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so4555697wrd.22
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 01:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=FhckrskEPNv79M5fE5OkrbvLe7aU7O9I8G8Gpid0TgA=;
 b=zqpJWiv6tTk53bN/j8b6qj0gR2ocJEwrmgMd2UWIkL8a3ZbumPD70X6TC2SzEbNg2p
 vdV/Bn9fxNqmcQX/lQG891n2Fx2r4SiJG26OP7qhCiAyoAi5KF59zUSWBEdWsXEphTVf
 H6b8jjORtOHuiduzyOejbwJco46NdEq9BtfSNBKkkla/nzGK7UkjKWVkOcrl92GoqS5h
 CEi8GpaICSe52hmN/LleuB5B/Ot+BHFuzQ6AkPnNr4cV/v+ndlXm3P/DJprBF+Cs7U4K
 9fm1mzwA8k/2K0X+ZPOHPOR1Z+pwwdUVIDEJNvlxrJ8WYDaFzWh/Tu4eL80oju3D3wWe
 SN8A==
X-Gm-Message-State: AOAM532XRD7Xx8D5hLGjA8MG3BwV6p4A0CvcwYbfLvmCRwCLLquZRqjq
 QbtkYkTcuqSBJT1SVnBfZ3/93AFl2JzftnCPAcYvHj+l+mSuHb5zcRK15yN8yiqTbGKEUfeY84o
 zssAN0fmYvM6fBVY=
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr16808493wrz.512.1643620452497; 
 Mon, 31 Jan 2022 01:14:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxKNp6lstVNx7swOM/i92XbqozMBC5yYW9KOfcjFCvdo5j/jllMMefOA2weVK7TXORoe+pug==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr16808472wrz.512.1643620452235; 
 Mon, 31 Jan 2022 01:14:12 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id v5sm8218279wmh.19.2022.01.31.01.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 01:14:11 -0800 (PST)
Subject: Re: [PATCH v2 2/4] virtio-iommu: Default to bypass during boot
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <728c6b3f-c0ff-b924-e810-c686d82d789c@redhat.com>
Date: Mon, 31 Jan 2022 10:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220127142940.671333-3-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 3:29 PM, Jean-Philippe Brucker wrote:
> Currently the virtio-iommu device must be programmed before it allows
> DMA from any PCI device. This can make the VM entirely unusable when a
> virtio-iommu driver isn't present, for example in a bootloader that
> loads the OS from storage.
>
> Similarly to the other vIOMMU implementations, default to DMA bypassing
> the IOMMU during boot. Add a "boot-bypass" property, defaulting to true,
> that lets users change this behavior.
>
> Replace the VIRTIO_IOMMU_F_BYPASS feature, which didn't support bypass
> before feature negotiation, with VIRTIO_IOMMU_F_BYPASS_CONFIG.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/virtio/virtio-iommu.h |  1 +
>  hw/virtio/virtio-iommu.c         | 51 +++++++++++++++++++++++++++++---
>  hw/virtio/trace-events           |  4 ++-
>  3 files changed, 51 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index e2339e5b72..84391f8448 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -58,6 +58,7 @@ struct VirtIOIOMMU {
>      GTree *domains;
>      QemuMutex mutex;
>      GTree *endpoints;
> +    bool boot_bypass;
>  };
>  
>  #endif
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index aa9c16a17b..ec02029bb6 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/virtio.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/reset.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "trace.h"
> @@ -728,8 +729,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          .perm = IOMMU_NONE,
>      };
>  
> -    bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
> -                                             VIRTIO_IOMMU_F_BYPASS);
> +    bypass_allowed = s->config.bypass;
>  
>      sid = virtio_iommu_get_bdf(sdev);
>  
> @@ -831,13 +831,37 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      out_config->domain_range.start = cpu_to_le32(dev_config->domain_range.start);
>      out_config->domain_range.end = cpu_to_le32(dev_config->domain_range.end);
>      out_config->probe_size = cpu_to_le32(dev_config->probe_size);
> +    out_config->bypass = dev_config->bypass;
>  
>      trace_virtio_iommu_get_config(dev_config->page_size_mask,
>                                    dev_config->input_range.start,
>                                    dev_config->input_range.end,
>                                    dev_config->domain_range.start,
>                                    dev_config->domain_range.end,
> -                                  dev_config->probe_size);
> +                                  dev_config->probe_size,
> +                                  dev_config->bypass);
> +}
> +
> +static void virtio_iommu_set_config(VirtIODevice *vdev,
> +                                    const uint8_t *config_data)
> +{
> +    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
> +    struct virtio_iommu_config *dev_config = &dev->config;
> +    const struct virtio_iommu_config *in_config = (void *)config_data;
> +
> +    if (in_config->bypass != dev_config->bypass) {
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
> +            virtio_error(vdev, "cannot set config.bypass");
> +            return;
> +        } else if (in_config->bypass != 0 && in_config->bypass != 1) {
> +            virtio_error(vdev, "invalid config.bypass value '%u'",
> +                         in_config->bypass);
> +            return;
> +        }
> +        dev_config->bypass = in_config->bypass;
> +    }
> +
> +    trace_virtio_iommu_set_config(in_config->bypass);
>  }
>  
>  static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
> @@ -963,6 +987,19 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>      return 0;
>  }
>  
> +static void virtio_iommu_system_reset(void *opaque)
> +{
> +    VirtIOIOMMU *s = opaque;
> +
> +    trace_virtio_iommu_system_reset();
> +
> +    /*
> +     * config.bypass is sticky across device reset, but should be restored on
> +     * system reset
> +     */
> +    s->config.bypass = s->boot_bypass;
> +}
> +
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> @@ -988,9 +1025,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
> -    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
>  
>      qemu_mutex_init(&s->mutex);
>  
> @@ -1001,6 +1038,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      } else {
>          error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
>      }
> +
> +    qemu_register_reset(virtio_iommu_system_reset, s);
>  }
>  
>  static void virtio_iommu_device_unrealize(DeviceState *dev)
> @@ -1008,6 +1047,8 @@ static void virtio_iommu_device_unrealize(DeviceState *dev)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>  
> +    qemu_unregister_reset(virtio_iommu_system_reset, s);
> +
>      g_hash_table_destroy(s->as_by_busptr);
>      if (s->domains) {
>          g_tree_destroy(s->domains);
> @@ -1164,6 +1205,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
>  
>  static Property virtio_iommu_properties[] = {
>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -1180,6 +1222,7 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
>      vdc->unrealize = virtio_iommu_device_unrealize;
>      vdc->reset = virtio_iommu_device_reset;
>      vdc->get_config = virtio_iommu_get_config;
> +    vdc->set_config = virtio_iommu_set_config;
>      vdc->get_features = virtio_iommu_get_features;
>      vdc->set_status = virtio_iommu_set_status;
>      vdc->vmsd = &vmstate_virtio_iommu_device;
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index f7ad6be5fb..a5102eac9e 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -89,9 +89,11 @@ virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
>  
>  # virtio-iommu.c
>  virtio_iommu_device_reset(void) "reset!"
> +virtio_iommu_system_reset(void) "system reset!"
>  virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
>  virtio_iommu_device_status(uint8_t status) "driver status = %d"
> -virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x"
> +virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x bypass=0x%x"
> +virtio_iommu_set_config(uint8_t bypass) "bypass=0x%x"
>  virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"


