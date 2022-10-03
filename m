Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1EF5F2BCE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:29:54 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGpl-0001sd-4a
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGn2-00060L-C0
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGn0-0000An-WA
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664785621;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzS24VJwGHSGhDR2ORh8VoWzNume/0Xvv2pouMr/xbA=;
 b=ItzneqocJEVl9T+gQVyqEZf1lRi/yCfru4KUcyyUrAWucCD+OrKt8PsLuwZ3MHLJMdcEEf
 T8s3YvKE49K0jkXNVyOl2drEkQ44LpgyDnQTTSUR3tMRr60WU6HgNZ2HKESRhXjbcb17i1
 QnV+7qrFSrDoQH1UcQs6y097P1cGxXE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-3hsb4vbAOdmXLHR4yH79SQ-1; Mon, 03 Oct 2022 04:26:59 -0400
X-MC-Unique: 3hsb4vbAOdmXLHR4yH79SQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 g6-20020ac84b66000000b0035cf832dec9so6794975qts.6
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=JzS24VJwGHSGhDR2ORh8VoWzNume/0Xvv2pouMr/xbA=;
 b=v+wPY/Rs6NFycUP8+OJgBVVrTXPXCJZVROUvcNl795PUZCi4Q1K7rI60DPBkIcCOB9
 6fT9ddtZX7S9eXDmPNlPVmLuoFY24cfcDnAJkLjPBGxGjwNykCJg6FjIkweE+ml2Pqpp
 UjavZrA6f4vZcIW1sFE0AGmt2z1p2EkFxxbgb7k4Hy1+SjJyNGIFF+S52xnskSB2IULx
 DwbDG0vWLmMudfM9M9v5hqQBNZ13DRqI9lly/yRWdDeHzYXi3vuuF8UgEZym8crwgcHW
 Xli8wCq+TCGoScuiF6+CWiufj+5JJuWGTBpPSaYXXeQ0rEEv0WIcrrpP6Vb/lBI296Ex
 aQ2A==
X-Gm-Message-State: ACrzQf3FenYavd/3UEz9NRJDgpeZVsrZz6TO3pro5q3V7P00CC0Iyo9k
 a0O+NIg3N+sYb9VrUk4GsIMQtmiGy4B/OIlYVf0wUtV3+xDhpTsbOGtxoM3C/7GRVkBS/L9HFb/
 WDQCu2BwHK+bV1e8=
X-Received: by 2002:a05:622a:15c4:b0:35b:b493:f8fb with SMTP id
 d4-20020a05622a15c400b0035bb493f8fbmr15244379qty.300.1664785619149; 
 Mon, 03 Oct 2022 01:26:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5PuqtsEPhCAhU8RaGRmVEqcpHpprx4NTrx/5Q2fQEDiocmTrei1+a3Xk2qCUCJZBV0VeHMvQ==
X-Received: by 2002:a05:622a:15c4:b0:35b:b493:f8fb with SMTP id
 d4-20020a05622a15c400b0035bb493f8fbmr15244367qty.300.1664785618954; 
 Mon, 03 Oct 2022 01:26:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a05620a0d9600b006bb82221013sm32228qkl.0.2022.10.03.01.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:26:58 -0700 (PDT)
Message-ID: <2299b4da-83d8-834c-2134-10abe36d7f7d@redhat.com>
Date: Mon, 3 Oct 2022 10:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/5] hw/arm/virt: Rename variable size to region_size
 in virt_set_high_memmap()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-3-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> This renames variable 'size' to 'region_size' in virt_set_high_memmap().
> Its counterpart ('region_base') will be introduced in next patch.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4dab528b82..187b3ee0e2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1692,15 +1692,16 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
> +    hwaddr region_size;
> +    bool fits;
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> -        hwaddr size = extended_memmap[i].size;
> -        bool fits;
> +        region_size = extended_memmap[i].size;
>  
> -        base = ROUND_UP(base, size);
> +        base = ROUND_UP(base, region_size);
>          vms->memmap[i].base = base;
> -        vms->memmap[i].size = size;
> +        vms->memmap[i].size = region_size;
>  
>          /*
>           * Check each device to see if they fit in the PA space,
> @@ -1708,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>           *
>           * For each device that doesn't fit, disable it.
>           */
> -        fits = (base + size) <= BIT_ULL(pa_bits);
> +        fits = (base + region_size) <= BIT_ULL(pa_bits);
>          if (fits) {
> -            vms->highest_gpa = base + size - 1;
> +            vms->highest_gpa = base + region_size - 1;
>          }
>  
>          switch (i) {
> @@ -1725,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>              break;
>          }
>  
> -        base += size;
> +        base += region_size;
>      }
>  }
>  


