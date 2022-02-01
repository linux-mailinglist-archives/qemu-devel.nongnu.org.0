Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8D4A5AD2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:03:37 +0100 (CET)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqwh-00016v-RL
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:03:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEqnC-0003oO-4t
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:53:46 -0500
Received: from [2a00:1450:4864:20::42d] (port=46763
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEqnA-0000cd-Ko
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:53:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so31067756wrb.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k6Cl6ImrsH6b7cKA4WeTFlf5W6zMFNdqKEpULazU7xU=;
 b=g0cNgzWWBco+8ZyR804Gtw8ulvXJ6UJDdPXrewLYTCHJhkNqSSiN3pAda3oWzhNgLP
 AjqTlJwD6GGbDUn+xChK8M4WHlhrI9V9GN9VR/brNFooH3kThwaQdB9mSgIEw8L55Qct
 wD0j489dL/DxgYoPktgYHjkEaOzZGXDT6vg7ZhI37cvPIsaas/lgPi+M3IAeVvX3+Vb3
 GOekL0W694vzDbyJWq8hhUHXt4H37a5xsVif/D2AsOFOt6qUbga/sQ5YhuDZm4GSoFMw
 rJeCZRpNjdHcBsHTRsCKX1nvF9DeZt8v6dRRqYXeQNUqV3j5aHVDB67Edy13CPxbm2kU
 nGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k6Cl6ImrsH6b7cKA4WeTFlf5W6zMFNdqKEpULazU7xU=;
 b=mSPPsR2ZdccZu8j9/ZSIgggc8Oycgi39BWIZVIikQSfIx1rIAXEMP9RFgA+u3yX72X
 ltyzQy7xcbV0/OFYtaz3HcDWl7xia8lu4Eck65vxaYI+7bVnFXviX8PLuTFBUpmBOt+B
 uW+3OXGBM77EgbVZDxQsSzJwRv3ZrwNCXR4dccYQkxgkXIfJLGgAbanClxshewEDTDVo
 R8RNC9FqHpK/I9kdbenyIaeUChYeJmuz0VxxaVj5Bx7cA6K8wmRcqHkxrU2h9Xmj5P0X
 4duI9fqnLkbxmNB6yEtqB8uY85sAOGHL8j+2J0xQbT5DvStCG/CqhvpUyhgfsoD1SPzA
 bYmg==
X-Gm-Message-State: AOAM530q/9TEyD93kIi/xXUpQoT9EC6FaSztQth+wT2xEsprKVtj44CC
 J0GeFRDSbbYT6HPuK9mXOGhbdVffY9I=
X-Google-Smtp-Source: ABdhPJxMXieB0x42LWGSjZRD6/VlcsgOqGJjoohqZUuyVHhbbGlRqKb36WULtvIH4F4n6dVhnFfLKQ==
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr20844096wry.94.1643712823177; 
 Tue, 01 Feb 2022 02:53:43 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r8sm14397429wrx.2.2022.02.01.02.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:53:42 -0800 (PST)
Message-ID: <9731494b-8536-14d4-cbdb-0674eec7ca94@amsat.org>
Date: Tue, 1 Feb 2022 11:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] memory: Make memory_region_readd_subregion() properly
 handle mapped aliases
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220201100940.47788-1-david@redhat.com>
In-Reply-To: <20220201100940.47788-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

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

Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  softmmu/memory.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 678dc62f06..76bb1677fe 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2626,8 +2626,7 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
>          memory_region_transaction_begin();
>          memory_region_ref(mr);
>          memory_region_del_subregion(container, mr);
> -        mr->container = container;
> -        memory_region_update_container_subregions(mr);
> +        memory_region_add_subregion_common(container, mr->addr, mr);
>          memory_region_unref(mr);
>          memory_region_transaction_commit();
>      }

