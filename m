Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70885EDE5F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:03:39 +0200 (CEST)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXey-0003cZ-UH
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odVtu-0003cU-7n
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odVtq-0003FC-TR
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664367050;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssHiT8auoEjKjLHr/WW4tRUwm7tu+pz8C/+F+yd1mBs=;
 b=J2XD1sLzDu11bmzFk8TRSyPo0HNxhk5YpwRVqvJ/4TutQmuQLlThG6D5ietf4a5WdgRGOc
 L/83I/OBbktbRnvzeFlYo9n13XderHcENFUTLvy5P4i51ggdWUhq6iAvLTaEhVdrMK+Bqr
 UcBXf+YYvIHrVP64iZCj2w9pzfKM5wU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-X29UE6JAPwyxBGdxrPPYBw-1; Wed, 28 Sep 2022 08:10:49 -0400
X-MC-Unique: X29UE6JAPwyxBGdxrPPYBw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p36-20020a05600c1da400b003b4faefa2b9so7023537wms.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=ssHiT8auoEjKjLHr/WW4tRUwm7tu+pz8C/+F+yd1mBs=;
 b=Vdk5TJiZsQCnNB9MNiZQb8b3oaq93p8WCNvcOKkDLbTieADTSl5jL4CynSfxYifSM0
 Osvt0x2vrpt5M7cUrhFZUf/mY0pubde/5ENOw+68IYPG7x8J+Wy4PUeW8dGf2noxMfAD
 ElDzctuu+/neZHe4fQqda/hVQOvBHcOEXPDgkMgwvZIVOI7TdA7bWuxhPRshfMfB5bp9
 ShJB40lZII/0yZZWEdQYQi2SFUexW6OjXVPTd/fp72WxWgHRrcyQfEQrgloe0fKEnT9/
 9rAKX51v2/mZyGolGlD4G8iyBzIXa5ylWQ7uvR2GEn+BBzTTJBhpQ55sicYQFBci4FW4
 lr2w==
X-Gm-Message-State: ACrzQf2SRcKvS4OdocKhI6ijcDzJLaPIhDniyKRlkmKmtymZ+ispuyUr
 MYDbkZhiQQ9obROKKOisbc4gP5GY9H6bLoTETG01d5U/L/c5TlyYnNWE13aJva72Qu573PTx4ok
 wJM2g9J/YOnXD2FM=
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr20355706wrv.96.1664367048166; 
 Wed, 28 Sep 2022 05:10:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fS/1sQ5lwFsmjHEYF+EjziaY+mXH3K2ROcBvgxBcT9sELwogh0wgA35N1qd4jFgvGsN/vzQ==
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr20355687wrv.96.1664367047934; 
 Wed, 28 Sep 2022 05:10:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m67-20020a1c2646000000b003a342933727sm1595104wmm.3.2022.09.28.05.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:10:47 -0700 (PDT)
Message-ID: <6e1b2667-b561-51ac-57af-123a393fc677@redhat.com>
Date: Wed, 28 Sep 2022 14:10:45 +0200
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
> This introduces variable 'region_base' for the base address of the
> specific high memory region. It's the preparatory work to optimize
> high memory region address assignment.
Why is it a preparatory work (same comment for previous patch, ie [2/5]
). Are those changes really needed? why?

Eric
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
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


