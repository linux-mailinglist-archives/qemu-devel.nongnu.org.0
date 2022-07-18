Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76F577F50
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:06:04 +0200 (CEST)
Received: from localhost ([::1]:35178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNdb-0005mH-RX
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNbN-0003Mj-Pc
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:03:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNbL-0005Im-T8
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:03:45 -0400
Received: by mail-wm1-x334.google.com with SMTP id a11so677630wmq.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NO8SnhXBfSPU6jejj9SWuNula3OagSdbuVn2CeVVLDI=;
 b=NvjIdr4lXRAUM4dHm+yOjUEhyJ3VRdJTzd+TvI3U2YhcsmJ98UfgJqPVr+fvlzasEP
 h61pPNDtSNqwIeswK/pahD6R0tEF5dpkU41WL76udrel7XNd5eDxXCUcUnQKESw+ba5l
 3Z6519tnVDTiK0A9zGPiGq/iFxNXiq1K51N7ltMs9AAAm8LtGsVNE1rt6ui7zkSGjx3A
 IcWgDUqh3nbSh5DvXimn5Ax1dJP/qi0JyetAVCDZhXyPkzYXnXM7s2eI+++bZxhJ8xOB
 WfmjWFoWIRd/quzahL1DcCgXsXVw2NoABpFUQVfGg8ty2fAWxL07NSfDLJL1EcKUdxsP
 1KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NO8SnhXBfSPU6jejj9SWuNula3OagSdbuVn2CeVVLDI=;
 b=qpUl2fWiE/f6D6gSA5YVgg5WTTdKDX3/2VCLB0ToZrhORDX7zjzpgP0Wt4vkQ7VKre
 xeGxlocPuvN0uHlFeRVZDm+WdJ7NEL2ukFn+GLjbjnLZ7AWN593bh7BMsTbbAFov/4fm
 ty+OAG/ylYxcbmpnQ/zRVPPMkyVbHUpjFSaCvZ/5799lUZ0Edk/t9ywisdRq98LdNiai
 1ztBpDp5bC3Xzk0/yYhCwNPXBv7PNx0vnNJTk71+AyqG9KQPoQ7FuXCrDOjWlEcXDnXA
 MxkuACQAi03Z4vF8jHBbXnU/3uRK9hMVBwNqids8G21IQouEM6rGTQ6PEseB0Yg0xgtM
 ZqjA==
X-Gm-Message-State: AJIora9zoR1UStHyEXYkgjGsonC4Cga9eFgz133hR5f1HY80UNrA0Xq3
 BKyWQx3XjPNPXrE8hOB0ben6ynC5mcR1KQZh
X-Google-Smtp-Source: AGRyM1uxejjOAD8wyYUnrBNrwMtIgG5w06BEIL+iB3ETDtZyzR/GSgUUt4Uk++F+JBzSoDmi3hY2Gw==
X-Received: by 2002:a1c:c912:0:b0:3a3:20d5:8351 with SMTP id
 f18-20020a1cc912000000b003a320d58351mr55577wmb.126.1658138621945; 
 Mon, 18 Jul 2022 03:03:41 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a033177655sm20844791wmp.29.2022.07.18.03.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:03:41 -0700 (PDT)
Message-ID: <61b2a3f2-c930-779e-8897-b706fe234108@sifive.com>
Date: Mon, 18 Jul 2022 11:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] pci: designware: add 64-bit viewport limit
Content-Language: en-GB
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
 <20220713165449.37433-2-ben.dooks@sifive.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20220713165449.37433-2-ben.dooks@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ben.dooks@sifive.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 13/07/2022 17:54, Ben Dooks wrote:
> Versions 4 and above add support for 64-bit viewport
> limit. Add support for the DESIGNWARE_PCIE_ATU_UPPER_LIMIT
> regiser where supported.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Whoops, just noticed this was my old ct address.

> ---
>   hw/pci-host/designware.c         | 22 +++++++++++++++++-----
>   include/hw/pci-host/designware.h |  2 +-
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index bde3a343a2..296f1b9760 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -54,6 +54,7 @@
>   #define DESIGNWARE_PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
>   #define DESIGNWARE_PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
>   #define DESIGNWARE_PCIE_ATU_UPPER_TARGET           0x91C
> +#define DESIGNWARE_PCIE_ATU_UPPER_LIMIT            0x924
>   
>   #define DESIGNWARE_PCIE_IRQ_MSI                    3
>   
> @@ -196,6 +197,10 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
>           val = viewport->target >> 32;
>           break;
>   
> +    case DESIGNWARE_PCIE_ATU_UPPER_LIMIT:
> +        val = viewport->limit >> 32;
> +        break;
> +
>       case DESIGNWARE_PCIE_ATU_LIMIT:
>           val = viewport->limit;
>           break;
> @@ -269,7 +274,7 @@ static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
>   {
>       const uint64_t target = viewport->target;
>       const uint64_t base   = viewport->base;
> -    const uint64_t size   = (uint64_t)viewport->limit - base + 1;
> +    const uint64_t size   = viewport->limit - base + 1;
>       const bool enabled    = viewport->cr[1] & DESIGNWARE_PCIE_ATU_ENABLE;
>   
>       MemoryRegion *current, *other;
> @@ -363,14 +368,21 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>           viewport->target |= val;
>           break;
>   
> +    case DESIGNWARE_PCIE_ATU_UPPER_LIMIT:
> +        viewport->limit &= 0x00000000FFFFFFFFUL;
> +        viewport->limit |= (uint64_t)val << 32;
> +        break;
> +
>       case DESIGNWARE_PCIE_ATU_LIMIT:
> -        viewport->limit = val;
> +        viewport->limit = 0xFFFFFFFF00000000ULL;
> +        viewport->limit |= val;
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_CR1:
>           viewport->cr[0] = val;
>           break;
>       case DESIGNWARE_PCIE_ATU_CR2:
> +        //printf("CR2: value %08x\n", val);
>           viewport->cr[1] = val;
>           designware_pcie_update_viewport(root, viewport);
>           break;
> @@ -429,7 +441,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>           viewport->inbound = true;
>           viewport->base    = 0x0000000000000000ULL;
>           viewport->target  = 0x0000000000000000ULL;
> -        viewport->limit   = UINT32_MAX;
> +        viewport->limit   = UINT64_MAX-1;
>           viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
>   
>           source      = &host->pci.address_space_root;
> @@ -453,7 +465,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>           viewport->inbound = false;
>           viewport->base    = 0x0000000000000000ULL;
>           viewport->target  = 0x0000000000000000ULL;
> -        viewport->limit   = UINT32_MAX;
> +        viewport->limit   = UINT64_MAX-1;
>           viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
>   
>           destination = &host->pci.memory;
> @@ -560,7 +572,7 @@ static const VMStateDescription vmstate_designware_pcie_viewport = {
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT64(base, DesignwarePCIEViewport),
>           VMSTATE_UINT64(target, DesignwarePCIEViewport),
> -        VMSTATE_UINT32(limit, DesignwarePCIEViewport),
> +        VMSTATE_UINT64(limit, DesignwarePCIEViewport),
>           VMSTATE_UINT32_ARRAY(cr, DesignwarePCIEViewport, 2),
>           VMSTATE_END_OF_LIST()
>       }
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index 6d9b51ae67..bd4dd49aec 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -44,7 +44,7 @@ typedef struct DesignwarePCIEViewport {
>   
>       uint64_t base;
>       uint64_t target;
> -    uint32_t limit;
> +    uint64_t limit;
>       uint32_t cr[2];
>   
>       bool inbound;


