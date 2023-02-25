Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B0E6A2B85
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 20:42:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW0Qu-0004FG-5b; Sat, 25 Feb 2023 14:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0Qr-0004Aj-Tx
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:42:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0Qq-0000YZ-9a
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:42:09 -0500
Received: by mail-wr1-x434.google.com with SMTP id r7so2422841wrz.6
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FzodJ2mMEz5vv0JAPxR4DozMo1ivT2l+i6jBhhMSzEg=;
 b=eStJQBvMxEQSiav9phGftET1/Kh9ZSPMaUECT1Yoq8pKnEaCqvxp8XB0pJeA6pmpxO
 vSSyhmbS4GRX3fmaF5w6SWeHypRE5nQIS0zd1G00rtmaHv+Au9NWvUkUtYZT2b7fbauV
 x1ZGFQI1OSDvv23eNtTsUq9NiQIRJY3yA0bEvfPtiP6PIZk7jAeIWy0FW07vfXvTxUKM
 Pv79qFgh1ThOFmEdZ+TAozMIMHuSywzQIjY9mVsda/ds0aDyCm1iUTzLBLOfZgTZdNxl
 kEiidYqUXY1bK32UA+xq+ks5Y03qZY6jtuQLEhrbuGc/YuOXIQR79NJIG83B2bqsY7P6
 +9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FzodJ2mMEz5vv0JAPxR4DozMo1ivT2l+i6jBhhMSzEg=;
 b=bIYBaUgU8qohJU+mhhRbrTkvukOYAWhgl4mGTxKSdX02hEQzlT15BA98sEEH9NZrU2
 YdgHI5iGaiD4SaYhpKn50eEvx/Oudnwb+asnAZxa6k+VjI6cyjLYBPI3bc0kFRhJrZsw
 R8v3fgjWv0Qt98FOdrBoGD+2x/C9YP1hVSzI+LpqYP2tQ9fix2NOnz7N8Ld1sQmBqxTt
 nxrZqQ6fbRYooAHjLPPBIPEDG/i5OgVceeumn7bJ4c4OjgoLyZPRa7Mh0jG5vXWc5X22
 MdDGg5pSKluIIq9nBMCwyAfOPXm2o6KHMlL9kLR8fT841/SpD/806MzCmXArERGrUV5l
 j4GA==
X-Gm-Message-State: AO0yUKWQ+rm5DxZKBpAnxUQTH7giPQKblx07Eh3e5D54yhUvTA56sgoD
 HrJrorb7ZlhFEx2UuvUICsDwTQ==
X-Google-Smtp-Source: AK7set+G0VpPk/ctX7C15a6IaLObxktJ3Tvg8xsPSRPl6RYe8L4nuR3EHdFKrbZFcOfK5cT4QOZCNw==
X-Received: by 2002:adf:eccf:0:b0:2c7:e424:eeb8 with SMTP id
 s15-20020adfeccf000000b002c7e424eeb8mr4094608wro.57.1677354126469; 
 Sat, 25 Feb 2023 11:42:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003e1202744f2sm7109760wmb.31.2023.02.25.11.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 11:42:06 -0800 (PST)
Message-ID: <05c52a60-5352-9857-c0ef-ed6632997867@linaro.org>
Date: Sat, 25 Feb 2023 20:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu, nathan@kernel.org, Rob Landley <rob@landley.net>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

+Rob

On 23/2/23 17:19, Jiaxun Yang wrote:
> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
> 
> However CFGADDR as a ISD internal register is not controled by MByteSwap
> bit, it follows endian of all other ISD register, which means it ties to
> little endian.
> 
> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
> endian-swapping.
> 
> This should fix some recent reports about poweroff hang.
> 
> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   hw/pci-host/gt64120.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
> index f226d0342039..82c15edb4698 100644
> --- a/hw/pci-host/gt64120.c
> +++ b/hw/pci-host/gt64120.c
> @@ -321,9 +321,6 @@ static void gt64120_isd_mapping(GT64120State *s)
>   static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
>   {
>       /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
> -    static const MemoryRegionOps *pci_host_conf_ops[] = {
> -        &pci_host_conf_be_ops, &pci_host_conf_le_ops
> -    };
>       static const MemoryRegionOps *pci_host_data_ops[] = {
>           &pci_host_data_be_ops, &pci_host_data_le_ops
>       };
> @@ -339,15 +336,6 @@ static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
>        * - Table 16: 32-bit PCI Transaction Endianess
>        * - Table 158: PCI_0 Command, Offset: 0xc00
>        */
> -    if (memory_region_is_mapped(&phb->conf_mem)) {
> -        memory_region_del_subregion(&s->ISD_mem, &phb->conf_mem);
> -        object_unparent(OBJECT(&phb->conf_mem));
> -    }
> -    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
> -                          pci_host_conf_ops[s->regs[GT_PCI0_CMD] & 1],
> -                          s, "pci-conf-idx", 4);
> -    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
> -                                        &phb->conf_mem, 1);
>   
>       if (memory_region_is_mapped(&phb->data_mem)) {
>           memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
> @@ -1208,6 +1196,12 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
>                                   PCI_DEVFN(18, 0), TYPE_PCI_BUS);
>   
>       pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
> +    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
> +                          &pci_host_conf_le_ops,
> +                          s, "pci-conf-idx", 4);
> +    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
> +                                        &phb->conf_mem, 1);
> +
>   
>       /*
>        * The whole address space decoded by the GT-64120A doesn't generate


