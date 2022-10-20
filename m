Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42738605689
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:59:36 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNeY-0008Rd-CI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:59:34 -0400
Received: from [::1] (port=52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNeY-0008EX-8P
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olNdC-0005ES-4v
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olNd9-0005gd-2T
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666241885;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/8AYN/esrhvHnz/e+lFd03MCFNJ6+dJcYUlGQgyye4=;
 b=I1oyAWiKdeZQSXam38aZoWT6tGuqI2QAtgrqVwiufQ79i9X9hxAOVoKsXhtBHQEp2HuYv0
 VfiVH11geh2CjYUEwr//xknND2VIMIoz1yBEsT9LFdFlZvXsoaq7DDhnu48p3dvBjbzRU5
 0nJWbDTK/NLdhTgrdv06TJr5lMbxeT4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-If-bZN2NNgin2UkhzrEWsQ-1; Thu, 20 Oct 2022 00:58:03 -0400
X-MC-Unique: If-bZN2NNgin2UkhzrEWsQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j13-20020a05620a288d00b006be7b2a758fso16288129qkp.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g/8AYN/esrhvHnz/e+lFd03MCFNJ6+dJcYUlGQgyye4=;
 b=7+0Ffdw6VD7rcWVERt4h8T+mmbtDzh88Ctb1s0DEdS3GDV+cDZ/vRXvxSjdGidYw1j
 Ma3uGdqj0nX2E3ZLZSrRhM0Qqx6OPcKJeYofoP6R5ca02EYoemvpPY2bz2yDhb15UBxf
 0aMU9A1jKzckJWW3QM/refH2r/eM8Vno3OtPBtBO5Otzd5eWZtheCXJ8wvQ9kpjbLjnv
 ylz28Jk9bpV/q3MebWd/rolRHqfSwD7Ldz7HCD336riVIfs8D95cWl3P9gSGrqKRDxGe
 W8wihqsFDW//f+ziMtkmlthMQ6o+VAcXj3anphylOyHM66WsOyEQ+eyGuxk2nL79z1uT
 h52w==
X-Gm-Message-State: ACrzQf3Byu8rzdofFXgDGKcYo/KYWG4zHnxh4Cg6lhqdjAjQ71JLIx9I
 XTEbg1NKQE7Usg6XvMIEcFGtJlkKvHcO4dPYxmf17C6eLqcJ9rny0XCTO/sQyxAPz3a4AKzHOwY
 DerdONnZq97KZNvg=
X-Received: by 2002:ac8:5b05:0:b0:399:9b82:77b4 with SMTP id
 m5-20020ac85b05000000b003999b8277b4mr9408740qtw.681.1666241883306; 
 Wed, 19 Oct 2022 21:58:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54AIuSutTjwaOwChxEGA9D1d9nGwxpUqK3wyryhY6zI10dUbW6NxNHTvBSPnG2P3aGVu+HgA==
X-Received: by 2002:ac8:5b05:0:b0:399:9b82:77b4 with SMTP id
 m5-20020ac85b05000000b003999b8277b4mr9408729qtw.681.1666241883072; 
 Wed, 19 Oct 2022 21:58:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05622a08c300b0039cc665d60fsm5362642qte.64.2022.10.19.21.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 21:58:01 -0700 (PDT)
Message-ID: <34a15560-66e5-ab3d-5dba-c1cde4fe6946@redhat.com>
Date: Thu, 20 Oct 2022 06:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-5-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221011231832.149839-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 10/12/22 01:18, Gavin Shan wrote:
> This introduces virt_get_high_memmap_enabled() helper, which returns
> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
> be used in the subsequent patches.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric
> ---
>  hw/arm/virt.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0bf3cb7057..ee98a8a3b6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1689,14 +1689,31 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> +static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
> +                                                 int index)
> +{
> +    bool *enabled_array[] = {
> +        &vms->highmem_redists,
> +        &vms->highmem_ecam,
> +        &vms->highmem_mmio,
> +    };
> +
> +    assert(ARRAY_SIZE(extended_memmap) - VIRT_LOWMEMMAP_LAST ==
> +           ARRAY_SIZE(enabled_array));
> +    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
> +
> +    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
> +}
> +
>  static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
>      hwaddr region_base, region_size;
> -    bool fits;
> +    bool *region_enabled, fits;
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> +        region_enabled = virt_get_high_memmap_enabled(vms, i);
>          region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> @@ -1714,18 +1731,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>              vms->highest_gpa = region_base + region_size - 1;
>          }
>  
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
> +        *region_enabled &= fits;
>          base = region_base + region_size;
>      }
>  }


