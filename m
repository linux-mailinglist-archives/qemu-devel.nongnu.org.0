Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF245FD4F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 08:52:57 +0100 (CET)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqsW0-0003ac-6B
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 02:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqsTk-0002aO-IZ
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:50:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqsTi-0004RX-4Q
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637999432;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0b3UeNvMCqIBRkOJXrz12zbTCMKb0bYedR2Od9qu/E=;
 b=LV7A2dvzV8YFd8b1fRxpKylvLz1K3TXpG91CeG69uHoONwkFG73c44qydxw+hI0NBySBLz
 nouvjIVHwXHZBHzcHaAhXIJUhuS6bZWAlq94HyMByV4bACx8VaoL/sPEo5yIsto26wuj9H
 qXoKGxCZ15IzVtmXpT4nxKyJePHKDJI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-BjUfq54BM0S_utDxs-1wxw-1; Sat, 27 Nov 2021 02:50:31 -0500
X-MC-Unique: BjUfq54BM0S_utDxs-1wxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso8262775wme.8
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 23:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=r0b3UeNvMCqIBRkOJXrz12zbTCMKb0bYedR2Od9qu/E=;
 b=r+fHNsSPuIe6tGcOY8TO4t22x/apHuDOF2FA5X3zZfMB1WBVpTIUvIjhFFkPfuKxRM
 mk5QB5DEu3fYsYFC2dqpZJIw1pY9lEMyAYiHFoqzXtLRskC7rrFFa8dsnX0xcxHaK6L/
 v/JA+EUoBOErnKhrKD9XfMME8cIPrQ9aaycAfgjf6sFSRQvxu2nTrmktyV64v+01qzCe
 dO40WA47qok7DEd3yomJ1Ny0zBzyujX5yvHluyM0Z6694EeF3SlI+51A1aNiw+e5lFPm
 QMuRNuow4PRVjHL8BHVYWIsEBx/a5dQxqRXXBYpZ6Z40ceUrGjFXOZPCTLsvrdaOyZ97
 KjFw==
X-Gm-Message-State: AOAM533vtsgz4w11El0as0RO0eEifObeOn6SG/P6eUSs+aPA9Pgigjqv
 rxeXOleb1UGfPbYtRtt+D76qlqthM+CgvzUArAwFZnDmLGlzOnd0xw0RkDgGB9bzuxPu3JxOqDj
 55riQ4Mj+5WioTHw=
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr20502675wmq.180.1637999429957; 
 Fri, 26 Nov 2021 23:50:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE+ihXawLRztxBIznus4jvTzpQwRuhm0VkS+gSqbLyHWQR9mjJaaUg8q0RUK0v/XqzPMWapA==
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr20502641wmq.180.1637999429587; 
 Fri, 26 Nov 2021 23:50:29 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o1sm7654513wrn.63.2021.11.26.23.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 23:50:28 -0800 (PST)
Subject: Re: [PATCH v6 1/4] virtio-iommu: Remove set_config callback
To: eric.auger.pro@gmail.com, thuth@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org, peter.maydell@linaro.org
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-2-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <638d96d9-a580-ab29-5fc1-48909a524c2a@redhat.com>
Date: Sat, 27 Nov 2021 08:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211127072910.1261824-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.09, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On 11/27/21 8:29 AM, Eric Auger wrote:
> The spec says "the driver must not write to device configuration
> fields". So remove the set_config() callback which anyway did
> not do anything.
Forgot to mention that with the advent of  VIRTIO_IOMMU_F_BYPASS_CONFIG
feature and bypass field in struct virtio_iommu_config coming, this will
change soon. Only the bypass field will be settable. But this is not yet
available in the imported linux header.

Thanks

Eric

>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/trace-events   |  1 -
>  hw/virtio/virtio-iommu.c | 14 --------------
>  2 files changed, 15 deletions(-)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 650e521e351..54bd7da00c8 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -92,7 +92,6 @@ virtio_iommu_device_reset(void) "reset!"
>  virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
>  virtio_iommu_device_status(uint8_t status) "driver status = %d"
>  virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
> -virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
>  virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1b23e8e18c7..645c0aa3997 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -832,19 +832,6 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
>  }
>  
> -static void virtio_iommu_set_config(VirtIODevice *vdev,
> -                                      const uint8_t *config_data)
> -{
> -    struct virtio_iommu_config config;
> -
> -    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
> -    trace_virtio_iommu_set_config(config.page_size_mask,
> -                                  config.input_range.start,
> -                                  config.input_range.end,
> -                                  config.domain_range.end,
> -                                  config.probe_size);
> -}
> -
>  static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
>                                            Error **errp)
>  {
> @@ -1185,7 +1172,6 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
>      vdc->unrealize = virtio_iommu_device_unrealize;
>      vdc->reset = virtio_iommu_device_reset;
>      vdc->get_config = virtio_iommu_get_config;
> -    vdc->set_config = virtio_iommu_set_config;
>      vdc->get_features = virtio_iommu_get_features;
>      vdc->set_status = virtio_iommu_set_status;
>      vdc->vmsd = &vmstate_virtio_iommu_device;


