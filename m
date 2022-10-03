Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264C5F2BD4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:30:47 +0200 (CEST)
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGqc-0002Lj-9M
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGnR-0006XU-0b
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:27:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGnN-0000JE-0R
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664785644;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSEkNJ8A/eCdOnaIdD9D7RxmytUes2xZjEhhn5NLrDE=;
 b=Sdhgy2g8JfPjQg5KMkBYg87fF/avaGsQikGGweINBriOpSaQ9CIHj2Xu3adHTyccA3dbHy
 kH7bTMacRwiqVBXeUWD9djwv/dVhPjvvsLFeKGa95geIjUmW3dna+IDJNXJLr5LPlW7ESg
 vZ34ybzHCffmOm0+ktaTPogWGa3rTm0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-328-dTHKdKMLOwyz12lXLL1Lyw-1; Mon, 03 Oct 2022 04:27:22 -0400
X-MC-Unique: dTHKdKMLOwyz12lXLL1Lyw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bl17-20020a05620a1a9100b006cdf19243acso8554091qkb.4
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=cSEkNJ8A/eCdOnaIdD9D7RxmytUes2xZjEhhn5NLrDE=;
 b=8K3aO7pdtety0ZKtc+VM6qiodRcK/yIhxN2OO78ylhDctCESy6lHwm41BPNpnan3n1
 5uEyplK0JpGl0A3yPwDZHUUiM6pxZGI3SQBwor1qh4gT9lJUOy7oWcKWjAihD1BPwJ4T
 e3I4rcA9yjOUguFyfKuW9IDqcJ4A0+innbvZAqvoSCS0XwGDNz4ljcdii+Hv1agwRT/2
 jhE1k10dpTAO/t9DGTZNufFjfNJD9ykzsIzpNnBEbI4FA8Vp/5K4oRnxHxaQ+TzsAGdM
 QOwSC7G9OPD+4WsIfa8u6iI0OyR6+jZjf3aKPAQECsfHEWEp2rE4BLddX1Bs5tmAboEL
 DA9g==
X-Gm-Message-State: ACrzQf0pHbJmn8jXbdwWCgLJQk3RwstdLKKzBoFlleCEvppPMooaNp5S
 hxJdeIBaSHOTCTPwZFR54yWI14sS5sS/c+yO7i9IilmzdALEN3ZlWrL45JU/qU6kEbK2prH0MQv
 RlDrlkPesbLQ9DLE=
X-Received: by 2002:a05:6214:411a:b0:4ac:9402:e7de with SMTP id
 kc26-20020a056214411a00b004ac9402e7demr15635485qvb.128.1664785642165; 
 Mon, 03 Oct 2022 01:27:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6E8baoroAEJugL1ZG5TMJHjt2Jz+LDGFcxXQXkfqpI0Jt4mTwEXErP57odo6DYtpb+4hLPGQ==
X-Received: by 2002:a05:6214:411a:b0:4ac:9402:e7de with SMTP id
 kc26-20020a056214411a00b004ac9402e7demr15635474qvb.128.1664785641927; 
 Mon, 03 Oct 2022 01:27:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05622a014600b00342f8143599sm9489160qtw.13.2022.10.03.01.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:27:21 -0700 (PDT)
Message-ID: <1dda9380-1c19-ee9e-ca4e-5095722e2c4e@redhat.com>
Date: Mon, 3 Oct 2022 10:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-4-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/22/22 01:13, Gavin Shan wrote:
> This introduces variable 'region_base' for the base address of the
> specific high memory region. It's the preparatory work to optimize
> high memory region address assignment.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 187b3ee0e2..b0b679d1f4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1692,15 +1692,15 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
> -    hwaddr region_size;
> +    hwaddr region_base, region_size;
>      bool fits;
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> +        region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        base = ROUND_UP(base, region_size);
> -        vms->memmap[i].base = base;
> +        vms->memmap[i].base = region_base;
>          vms->memmap[i].size = region_size;
>  
>          /*
> @@ -1709,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>           *
>           * For each device that doesn't fit, disable it.
>           */
> -        fits = (base + region_size) <= BIT_ULL(pa_bits);
> +        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>          if (fits) {
> -            vms->highest_gpa = base + region_size - 1;
> +            vms->highest_gpa = region_base + region_size - 1;
>          }
>  
>          switch (i) {
> @@ -1726,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>              break;
>          }
>  
> -        base += region_size;
> +        base = region_base + region_size;
>      }
>  }
>  


