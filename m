Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E764DBAD6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 00:10:02 +0100 (CET)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUcmH-0001zL-Cn
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 19:10:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUckj-0001J2-AW
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 19:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUckg-0004Vc-Qx
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 19:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647472101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPWSlxSn8Fk1m2ZSGmbehJMGyoAlfwasn+EhRzg6RWg=;
 b=A8evZJqTTt2oKJb7rkLFVl7m8dZS4vSI7oRo1UCTF0pi6jyu0982u8mPejZdl5W1qGKNUT
 J5nzGeyhBJdGYMVx2bSaC7FvkiRub4+puMNgytDW7RXh1mO1AVaQPMcLM/L4+8IKH9uKno
 Q4XrG8M21MP/ay1qTnFE/tjh0K3i91E=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-zAimJDGMOiCi3gW-Ev1y8w-1; Wed, 16 Mar 2022 19:08:20 -0400
X-MC-Unique: zAimJDGMOiCi3gW-Ev1y8w-1
Received: by mail-il1-f197.google.com with SMTP id
 m17-20020a923f11000000b002c10e8f4c44so2096098ila.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 16:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=nPWSlxSn8Fk1m2ZSGmbehJMGyoAlfwasn+EhRzg6RWg=;
 b=drk0OuljJX0CFT5FMi2XIVsCJ2fEVn6fz3cbnYm1sxNR9UB5LoHKmxzLUIvpUSQx82
 tifLTmS3DGDGJKHt+usZskXsKNRsKY8v+9xakeUmOcD+SXdzm3Jv8T/B16bq2UvkL/Vi
 b3TOcLECDzQoh7SmGdYqoXMdMX+F4busNDHYF5fJHpkTyANzzjIJk1Xubjk947zu/S46
 P+1iLg0cyXIo91gSXby4rOB6hH66L/5AAe6lYZDSco+MNzGPvgj4SkKY7rRv5D2nGZ+p
 SkqcHhqRfwkXOIiL/IIVsCCVd/VUBhOX8fmrsgEfKxggphDHmCOKD0uXmvaVoDZg9T6m
 7/aA==
X-Gm-Message-State: AOAM5306YNUPU6Tg5UcLZqafH+gjePvhl04NzeMNjw8EZ1vrIcqcx/eM
 Kjt2+tl6/bbsdXYEPi1GLZZTTdzHSiB3zUw6sm7a2hfNKf8WNqGUnCS+dyr9RoHnudq2UGKw9HP
 rRO9XPZ9m82GZfAk=
X-Received: by 2002:a5d:8796:0:b0:645:bd36:3833 with SMTP id
 f22-20020a5d8796000000b00645bd363833mr969932ion.158.1647472100116; 
 Wed, 16 Mar 2022 16:08:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYebRN82eDjnqFWm2dv5vLEPjiK1/1Mfj2TPJIHUJDQ+stCw3VOa0KCBYOuWHXvkVhFXFZSA==
X-Received: by 2002:a5d:8796:0:b0:645:bd36:3833 with SMTP id
 f22-20020a5d8796000000b00645bd363833mr969920ion.158.1647472099848; 
 Wed, 16 Mar 2022 16:08:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i8-20020a056e020ec800b002c7724b83cbsm1781383ilk.55.2022.03.16.16.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:08:19 -0700 (PDT)
Date: Wed, 16 Mar 2022 17:08:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20220316170818.5b4f0032.alex.williamson@redhat.com>
In-Reply-To: <20220316202951.294860-1-eric.auger@redhat.com>
References: <20220316202951.294860-1-eric.auger@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 21:29:51 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This region could have been a RAM device
> region, easing the detection of such safe situation but this option
> was not well received. So let's add a helper function that uses the
> memory region name to recognize the region and detect the situation
> is safe wrt assignment. Other regions can be listed here if such kind
> of problem occurs again.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c     | 26 +++++++++++++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f51..b58a38f5c57 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -861,6 +861,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
>      g_free(vrdl);
>  }
>  
> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
> +{
> +    MemoryRegion *mr = section->mr;
> +
> +    if (strcmp(memory_region_name(mr), "tpm-crb-cmd") != 0) {
> +        return false;
> +    }

Hi Eric,

I was thinking more along the lines that we could use
memory_region_owner() to get the owning Object, then on
that we could maybe use INTERFACE_CHECK to look for TYPE_MEMORY_DEVICE,
then consider anything else optional.  (a) could something like that
work and (b) do all required mappings currently expose that interface?
Thanks,

Alex


> +
> +    /* this is a known safe misaligned region, just trace for debug purpose */
> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
> +                                       section->offset_within_address_space,
> +                                       section->offset_within_region,
> +                                       qemu_real_host_page_size);
> +    return true;
> +}
> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
> @@ -884,7 +900,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask) !=
>                   (section->offset_within_region & ~qemu_real_host_page_mask))) {
> -        error_report("%s received unaligned region", __func__);
> +        if (!vfio_known_safe_misalignment(section)) {
> +            error_report("%s received unaligned region %s iova=0x%"PRIx64
> +                         " offset_within_region=0x%"PRIx64
> +                         " qemu_real_host_page_mask=0x%"PRIxPTR,
> +                         __func__, memory_region_name(section->mr),
> +                         section->offset_within_address_space,
> +                         section->offset_within_region,
> +                         qemu_real_host_page_mask);
> +        }
>          return;
>      }
>  
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f4a65..6f38a2e6991 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
>  vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>  vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_mask=0x%"PRIxPTR ": cannot be mapped for DMA"
>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64


