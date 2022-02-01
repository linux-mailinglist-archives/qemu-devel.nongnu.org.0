Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A64A5AA5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:53:47 +0100 (CET)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqnC-0002kJ-Pz
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqlA-00014q-6I
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:51:40 -0500
Received: from [2a00:1450:4864:20::62a] (port=38771
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEql8-0000Mn-LO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:51:39 -0500
Received: by mail-ej1-x62a.google.com with SMTP id k25so52490630ejp.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=glivnDmi/6TRzXdd2N7YHzXBGEhAdB+zJEpatDGdYfE=;
 b=dpeA50XEf5XpPsR/PtEGQI3SUBxoZSG4lNPumsPeTgyM6WwV7KdA01UmH25SfdOzTj
 AA9mpvn79XGrHn+6hIeLJWNopRo+QcPbP8zdi9oN55sR5nEwQXqoVfEXb1rfNLe2dV4D
 g/IcyyXkVVy8iAYmmXGqk9xh1tQFXGKSq2TiHJgwo+e0knI+zLNPsEfaF0tLEGkFx1O0
 SseGAQ/yxLfQ3fTKJ2sNoljj/6azh6DYd6ZFxHfBNzB46wwRQlyIenEH0eolNEOWBYDa
 BzBtf5oTPvf2l5HG772j8JUEMrs5gRZ8o1OS3w6EeCJ89Gxzq0jCd2/+mgFyHP3iiUx+
 0uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=glivnDmi/6TRzXdd2N7YHzXBGEhAdB+zJEpatDGdYfE=;
 b=udC63213CA31BV0AkY2RS4LUXWj8h/+gczLhnf3JAICPsTuLIWE92rRm8g0YxiRQcE
 uEMjz6jV9RtmwWRoHWOrzBYerXwrHLMRJvuGYjwiIQD3u2xm1B/4AU451rCFHgu/oPAw
 oh3kye6AqS7+41NJdIDpK4GwsRMarGXPIPngmCDuyUe7gxlVW1t63Ms+9/x9uhI2Qfui
 BCMWZ+UBlVZc3l5dvZpnz+PcExi0LzYT/Kg9Lz2x+kfr1KmwhLb/sUO0D7W0s5xmiVhR
 iqv6I6wgZVoRKvxro13k28kMZcPfUFydBXNcsKWigwxpQsqL27X3Emz7hZn92hEp5dV8
 wCyA==
X-Gm-Message-State: AOAM532gOwCFdRlHvjbzxt5yx3CS89GueUM8VKibaWFATewbigY0Uk/1
 o1YOOInEPAY60ZVVwYTvIz0=
X-Google-Smtp-Source: ABdhPJxbdfXvafra6OMG4doULpJNPXqEvNgoAyFvdSdDJbE1XXAWD2WDobsftD0GSBkuL+XA9hSkSQ==
X-Received: by 2002:a17:907:1c1a:: with SMTP id
 nc26mr20713633ejc.655.1643712697260; 
 Tue, 01 Feb 2022 02:51:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 rv9sm14249380ejb.216.2022.02.01.02.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:51:36 -0800 (PST)
Message-ID: <18ed54d6-c4e2-404a-f68b-002a67546445@redhat.com>
Date: Tue, 1 Feb 2022 11:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] memory: Make memory_region_readd_subregion() properly
 handle mapped aliases
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220201100940.47788-1-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220201100940.47788-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 11:09, David Hildenbrand wrote:
> memory_region_readd_subregion() wants to readd a region by first
> removing it and then readding it. For readding, it doesn't use one of
> the memory_region_add_*() variants, which is why fail to re-increment the
> mr->mapped_via_alias counters, resulting in the
> assert(alias->mapped_via_alias >= 0) in memory_region_del_subregion()
> triggering the next time we call memory_region_readd_subregion().
> 
> Fix it by using memory_region_add_subregion_common() for readding the
> region.
> 
> Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Fixes: 5ead62185d23 ("memory: Make memory_region_is_mapped() succeed when mapped via an alias")
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   softmmu/memory.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 678dc62f06..76bb1677fe 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2626,8 +2626,7 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
>           memory_region_transaction_begin();
>           memory_region_ref(mr);
>           memory_region_del_subregion(container, mr);
> -        mr->container = container;
> -        memory_region_update_container_subregions(mr);
> +        memory_region_add_subregion_common(container, mr->addr, mr);
>           memory_region_unref(mr);
>           memory_region_transaction_commit();
>       }

Queued, thanks.

Paolo

