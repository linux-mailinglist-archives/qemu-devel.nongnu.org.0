Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD75EDE46
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:56:25 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXY0-000696-6u
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odVso-0002XY-Lp
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odVsj-0002tO-SI
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664366980;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUPsp/GtnBuzx1Cbt7xPllQbLMXUKK4JoAcxGxwXKs8=;
 b=EItFt/7Onwm1DZFMUfCtJ+hE+xjKz2xVTH83G4VsMmj0Yri+kuAfkF7RNw4Kzg4vI1OHJd
 hBGfqA1zVNNSvcC9/tbs4DbDamhO9Je3r/9tSk3Ju7cH7sPKyAjCcICJ11f83uArwn+zHr
 Y4aHLDfHXcC874Puyklex36xICUwPew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-iBOLwg6cN3KKeAufS2Uzsg-1; Wed, 28 Sep 2022 08:09:39 -0400
X-MC-Unique: iBOLwg6cN3KKeAufS2Uzsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 y15-20020a1c4b0f000000b003b47578405aso491085wma.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=YUPsp/GtnBuzx1Cbt7xPllQbLMXUKK4JoAcxGxwXKs8=;
 b=xbca8RVr2qbP36UjWY07QP6L9bnZY7x1YRLSEAcm2ZG4M+fzcb21QA5gSF14Af0LyZ
 rkDYis2mpNPHqy4tiybzZ4HTX8fI5PgXhVWwvsMyCCw/6rX/eH7AdOV1qQnaqS+abGsa
 n09l0g9paYvaOcdGG40Z7g8LU67gTPrSgVjg/a8h9B5uxylctT+rtrO6v8fuD36So8iN
 MVLc5s1Q+MM+8PaqgtbbG+ZWl2zopTuNeqeBsz3BpjBFJDcOV7ygECRDJCwzFOAFXRDR
 t77myywG1exTS2cFNHdPb9SoCC8k55KSFiN5vL8yYD+xKyRyv97rEGwwR66yjm7KOw+z
 N8pA==
X-Gm-Message-State: ACrzQf2cmwYKRZODhQnboTFj6X73LggEPzlZY6ElqN3RohP8Ut7JTw7c
 iGn6KWhhoqSik3+F1IdIb1GMUN/gEwCUZZzJ7oE+yc2cRmYwoB0mFL+p0VQixuvKmUdmB/T5mL2
 P4DHhKTO623H32go=
X-Received: by 2002:a05:600c:19d2:b0:3b4:a4cb:2416 with SMTP id
 u18-20020a05600c19d200b003b4a4cb2416mr6676464wmq.6.1664366978160; 
 Wed, 28 Sep 2022 05:09:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GQlGJu9dv+ewdy26fTa/w0A2vk3KxiP00ssHAfHAhkjgjdOXO9w/uDb6pAtwrCcf2pVHHAw==
X-Received: by 2002:a05:600c:19d2:b0:3b4:a4cb:2416 with SMTP id
 u18-20020a05600c19d200b003b4a4cb2416mr6676440wmq.6.1664366977842; 
 Wed, 28 Sep 2022 05:09:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a7bce90000000b003b492b30822sm1600114wmj.2.2022.09.28.05.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:09:37 -0700 (PDT)
Message-ID: <13f19e41-0feb-7cfc-11f8-46d0f3f326db@redhat.com>
Date: Wed, 28 Sep 2022 14:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/5] hw/arm/virt: Introduce virt_set_high_memmap()
 helper
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-2-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gavin,

On 9/22/22 01:13, Gavin Shan wrote:
> This introduces virt_set_high_memmap() helper. The logic of high
> memory region address assignment is moved to the helper. The intention
> is to make the subsequent optimization for high memory region address
> assignment easier.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 33 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0961e053e5..4dab528b82 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1689,6 +1689,46 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> +static void virt_set_high_memmap(VirtMachineState *vms,
> +                                 hwaddr base, int pa_bits)
> +{
> +    int i;
> +
> +    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> +        hwaddr size = extended_memmap[i].size;
> +        bool fits;
> +
> +        base = ROUND_UP(base, size);
> +        vms->memmap[i].base = base;
> +        vms->memmap[i].size = size;
> +
> +        /*
> +         * Check each device to see if they fit in the PA space,
> +         * moving highest_gpa as we go.
> +         *
> +         * For each device that doesn't fit, disable it.
> +         */
> +        fits = (base + size) <= BIT_ULL(pa_bits);
> +        if (fits) {
> +            vms->highest_gpa = base + size - 1;
> +        }
> +
> +        switch (i) {
> +        case VIRT_HIGH_GIC_REDIST2:
> +            vms->highmem_redists &= fits;
> +            break;
> +        case VIRT_HIGH_PCIE_ECAM:
> +            vms->highmem_ecam &= fits;
> +            break;
> +        case VIRT_HIGH_PCIE_MMIO:
> +            vms->highmem_mmio &= fits;
> +            break;
> +        }
> +
> +        base += size;
> +    }
> +}
> +
>  static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> @@ -1744,39 +1784,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      /* We know for sure that at least the memory fits in the PA space */
>      vms->highest_gpa = memtop - 1;
>  
> -    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> -        hwaddr size = extended_memmap[i].size;
> -        bool fits;
> -
> -        base = ROUND_UP(base, size);
> -        vms->memmap[i].base = base;
> -        vms->memmap[i].size = size;
> -
> -        /*
> -         * Check each device to see if they fit in the PA space,
> -         * moving highest_gpa as we go.
> -         *
> -         * For each device that doesn't fit, disable it.
> -         */
> -        fits = (base + size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = base + size - 1;
> -        }
> -
> -        switch (i) {
> -        case VIRT_HIGH_GIC_REDIST2:
> -            vms->highmem_redists &= fits;
> -            break;
> -        case VIRT_HIGH_PCIE_ECAM:
> -            vms->highmem_ecam &= fits;
> -            break;
> -        case VIRT_HIGH_PCIE_MMIO:
> -            vms->highmem_mmio &= fits;
> -            break;
> -        }
> -
> -        base += size;
> -    }
> +    virt_set_high_memmap(vms, base, pa_bits);
>  
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));


