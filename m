Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D219E6A1268
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJaP-0006Nh-12; Thu, 23 Feb 2023 16:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJaN-0006NW-Oy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:57:07 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJaL-0001lB-TV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:57:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 6so11632013wrb.11
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pu0z9FFEw6xQnUwap8AbNkyY5K71a70C16XpA4KRvwo=;
 b=q+131873QwtbC5ci3Sf5mYRbCLGlVNr6IQl6C8Vt0pMC+0RlvJKsIyAA+xMZguipwM
 3z4sidSa31rj9zU/OwcsJdwlPp0kZgA64omjM1S3Z9XTzvD8bH2wSvHagEVogWYm8IBa
 Rf5JD4EZqwiM5SZBt6Nu5wgom2SDPOcScos/cv6YC9O1i3gSufEL7KPvzOij6EXn6zzr
 AugAhSfwQp+RBAV/V4XFmTOrWLx/ERukE3Eeh46TmfTKQrJkEbb2KJ3F1gceNwj0rHiJ
 w5xfAUoMZswjq7FPARtSOC9N2V3Zsz4lQP2gHttQteJRJ2Uu4V3pKz3HOYqoXQh309VT
 YQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pu0z9FFEw6xQnUwap8AbNkyY5K71a70C16XpA4KRvwo=;
 b=6ED5C48MyEQugejQdzJunreIsF00HvvyMxBHc3mDk+4MRgTyaj/JfYUxU0ugC5ayTv
 X4evvwyr8Wq9kxjll9k8nBej0LdC1P9sKn5Rx3vLFevv3szh0EfR6q34ShkcwdAVQthl
 H9Z94T1NutDiXb2F2VGdCQQNQCb7MclwptdtQo8dKLU43Cx69ivmiebacuYPKMTll9pt
 +fBShL9s143BcoH4ZYpqJY7pmCKF8u7eyJrhp3ztkP6bpZg2yoU03QIPw7auHnTxpiZO
 CB+9Auvi8rtsfONon8zJLneAOhWdBI8LVV1bQ5xMwTpr7vyZbw8uzNqXv3M6MxzKmHW4
 ScVA==
X-Gm-Message-State: AO0yUKUZF+ApiDWFuJ2bgnV5QGbMoTVCkvDI2ZOH0pxVhfVyPBoWHCKV
 y2n6/nGsjLOFYDQ74nL02IQrLA==
X-Google-Smtp-Source: AK7set/5cU0kcO1UZPPkNgMJ550V4IKQ/BaU9ZOoWEouk/QBQSTYwgZk1tMvBPebNPUqaD5MdoMWqA==
X-Received: by 2002:adf:f3c6:0:b0:2c7:1483:cdfe with SMTP id
 g6-20020adff3c6000000b002c71483cdfemr2679689wrp.44.1677189424114; 
 Thu, 23 Feb 2023 13:57:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002be0b1e556esm12013223wrq.59.2023.02.23.13.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:57:03 -0800 (PST)
Message-ID: <4554c629-defd-d164-c57c-ceed7eb0914a@linaro.org>
Date: Thu, 23 Feb 2023 22:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu, nathan@kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Cool! This is what I had in mind but my brain couldn't context-switch
to open the GT64120 datasheet again. Thank you very much for the fix!

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


