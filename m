Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA69552D26
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:37:02 +0200 (CEST)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ZNd-00071O-Mx
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o3ZLZ-0005WR-RN
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o3ZLW-0005SL-64
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655800489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4/NKdx4Jn5+aeFXNZGDiz07xT21Ef0fnieRcXglp9w=;
 b=EUBIOiGQ03fZVejJUKKhW8kZ7+7utkE5Y0bGbMFpAeO2ZHK6LKeJjQlgsXX17p5wHJ1hmA
 Ag9DYf+lUTnlsF1Dh7VQE/3M9pw8MFF8me1noriS3GXlmPKXYcF5k2elTfIHbdQ5fAoDqP
 SzWwQuBleqCQH5WarOCDgqVwMKNsNOs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-hSQcwH9zNwCembjXHoIw-A-1; Tue, 21 Jun 2022 04:34:47 -0400
X-MC-Unique: hSQcwH9zNwCembjXHoIw-A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b0039c60535405so4026725wms.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 01:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x4/NKdx4Jn5+aeFXNZGDiz07xT21Ef0fnieRcXglp9w=;
 b=CvWYNAbwKT6Z5UGlGL/HR+DVaQf+2uy8A39N/Dz3X0kg9bOgjZtzq8BLSikiXw+k4v
 zS48z4l/6HP/a8o6C2op1FnvFo8V84BK07bCTrIOurLNeedN2KMvTpHLC/mrHlwsnJdd
 JtQBLNoO2RUcY+AkmBkL4sZC5vgaKr/VbTncE14pNMK1+TXi90rgfqI/eycLHdR6+WTG
 ev3om9RgTYl65LxkYv6e85c6Y40XxRhkw863GlA0KD5oM8L2kCCaNCiiv2ntvqwm+v7y
 UEaKPsvZn5nKH9aWMVK3FJSJkWFK6YjAZjX72dIUukoSRgeKEGuK2Gnj13fvi7C3bXKc
 77MA==
X-Gm-Message-State: AJIora8f1fwd2m5pHNVr6g6s9JWa9ZxzhjVrckpWxz5R/52jx0ssG+3l
 qLUAOPNj+wHtVxyDh9DSvx5K12OC6NRZJydJuOq6fdcCu7JdUVaY59SpS7LLWCXtg3RRNSeN9OP
 lk6KAinhlzWbubYw=
X-Received: by 2002:a7b:cc87:0:b0:3a0:19f0:e275 with SMTP id
 p7-20020a7bcc87000000b003a019f0e275mr6891011wma.70.1655800486669; 
 Tue, 21 Jun 2022 01:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8q+lh6VfpvUizmj0lzxUZwSAwPfknIX4WAhllLyzEd9Dur98nFjOK2qOGXjUl4dEabVgCJw==
X-Received: by 2002:a7b:cc87:0:b0:3a0:19f0:e275 with SMTP id
 p7-20020a7bcc87000000b003a019f0e275mr6890976wma.70.1655800486358; 
 Tue, 21 Jun 2022 01:34:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:2500:cdb0:9b78:d423:43f?
 (p200300d82f042500cdb09b78d423043f.dip0.t-ipconnect.de.
 [2003:d8:2f04:2500:cdb0:9b78:d423:43f])
 by smtp.gmail.com with ESMTPSA id
 bn19-20020a056000061300b002103a7c5c91sm12965934wrb.43.2022.06.21.01.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 01:34:45 -0700 (PDT)
Message-ID: <05eab126-b789-ccdf-6d99-f80ffab0c00a@redhat.com>
Date: Tue, 21 Jun 2022 10:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220609135851.42193-1-alxndr@bu.edu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220609135851.42193-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 15:58, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/pci/pci.h   | 13 +++++++++++--
>  include/hw/qdev-core.h |  3 +++
>  softmmu/dma-helpers.c  | 12 ++++++++++++
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  5 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 44dacfa224..ab1ad0f7a8 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                       void *buf, dma_addr_t len,
>                                       DMADirection dir, MemTxAttrs attrs)
>  {
> -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> -                         dir, attrs);
> +    bool prior_engaged_state;
> +    MemTxResult result;
> +
> +    prior_engaged_state = dev->qdev.engaged_in_io;
> +
> +    dev->qdev.engaged_in_io = true;
> +    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> +                           dir, attrs);
> +    dev->qdev.engaged_in_io = prior_engaged_state;
> +
> +    return result;
>  }
>  
>  /**
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..6474dc51fa 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,9 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    int engaged_in_io;
>  };
>  
>  struct DeviceListener {
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..7a4f1fb9b3 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -288,8 +288,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
>      uint8_t *ptr = buf;
>      dma_addr_t xresidual;
>      int sg_cur_index;
> +    DeviceState *dev;
> +    bool prior_engaged_state;
>      MemTxResult res = MEMTX_OK;
>  
> +    dev = sg->dev;
> +    if (dev) {
> +        prior_engaged_state = dev->engaged_in_io;
> +        dev->engaged_in_io = true;
> +    }
> +
>      xresidual = sg->size;
>      sg_cur_index = 0;
>      len = MIN(len, xresidual);
> @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
>          xresidual -= xfer;
>      }
>  
> +    if (dev) {
> +        dev->engaged_in_io = prior_engaged_state;
> +    }
> +
>      if (residual) {
>          *residual = xresidual;
>      }
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..44a14bb4f5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      uint64_t access_mask;
>      unsigned access_size;
>      unsigned i;
> +    DeviceState *dev = NULL;
>      MemTxResult r = MEMTX_OK;
>  
>      if (!access_size_min) {
> @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
>  
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {

Would it make sense to define some helper function like
memory_region_is_XXX (I assume XXX -> DEVICE_IO), to make that code
easier to be consumed by humans?

Unfortunately I cannot really comment on the sanity of the approach,
because the underlying problem isn't completely clear to me (I think
other people on CC were involved in the discussions around DMA reentry
and failed attempts in the past). Having that said, that approach
doesn't look wrong to me.

-- 
Thanks,

David / dhildenb


