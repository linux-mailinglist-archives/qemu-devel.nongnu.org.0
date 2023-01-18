Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A08671A0F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6Iz-0002uE-KB; Wed, 18 Jan 2023 06:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI6Iw-0002th-S3
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:08:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI6Iu-0006PN-Vh
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:08:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id k16so3749224wms.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fQkDRqMiw9TekcpGLXiJArCesexAW6P4a+xxdsDWT+I=;
 b=LpQcPL9q86kuM7drdhaZXJqVJANt4t8mvGH70icUxjoYkOgrYuYp6u5HOrfflHENZS
 ZFiRShxd1YKDwQBlty2AMYs3hzCjJiLdq6tKWUTaaOXhcQM2Yruoi74ad+p+9qZmTBTV
 e9k7vsss0891XhrV9FkON4/hxrESmKMxjTfPo80cj7Oa/WUBey8hz7K8GT6fBrWF7h4N
 3ne+Wwz4vaLqNrHH/LA947VoUXJJam1eSBlelphpEE/4Vhe6AAtxoscbOhtR9IB9tBmb
 f2cS6a7w5zQlvGqnE4jxMFumzKfE95JGQ+M6yxVYuDOqqD/vhbXplC9DkKUqzy71+ZBI
 nCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQkDRqMiw9TekcpGLXiJArCesexAW6P4a+xxdsDWT+I=;
 b=pmLJCo9k8M0fJhRtSQoeJBgXfMfRgy0LWPaE55B9DECmTpVsm7ltl9QmB+TReesg6t
 5AKuNsWCW1k1tNEp1zuYyS4wakXv8k7zWtkXLsZbvn0GfQIOji+emrkEYBc/12mJ1FqE
 W2P46Byd3LoBH5JUfSBAaZ2lerCkcmDpo6j1XSOLFXSQfUlFC/PufR8ncLFGVufA5ax5
 qHUep5jR+W7XT5qayL+8ccDfOCNJpcyBHEcFf/RYmas2oKVD1EMPH5IpzoTgVzIfyDUm
 nVrsliarZ3efC/Du8N5H7uqe+PN8hKAGadEDkHbmT7MXgBbZ1AaV+cmzw0bke+hB9wda
 EAJA==
X-Gm-Message-State: AFqh2krjqTJFp6r11479e4GgJdM0ECu3hw1EOW2RSsjgIvrf8bO0a5/O
 AtfmL/MbTPdAwtS/8PKkp1cq3ZAA/9Wb0JMS
X-Google-Smtp-Source: AMrXdXvxOxj9heZ3R6tSXrrAml+0R4nYI41zBG6JzLTc1YLugoAeOwyHDq9jPe7MisH+jwFg4jw8BQ==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id
 y25-20020a1c4b19000000b003dafb5c8754mr2258857wma.2.1674040106795; 
 Wed, 18 Jan 2023 03:08:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d50d0000000b002755e301eeasm13223319wrt.100.2023.01.18.03.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 03:08:26 -0800 (PST)
Message-ID: <d54ecdc8-3076-355f-9b2b-7a2f12a2673c@linaro.org>
Date: Wed, 18 Jan 2023 12:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] hw/pci-host/gt64120: Fix PCI I/O config register
 endianness
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Klaus Jensen <its@irrelevant.dk>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Klaus Jensen <k.jensen@samsung.com>
References: <20230118095751.49728-1-philmd@linaro.org>
 <20230118095751.49728-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118095751.49728-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 18/1/23 10:57, Philippe Mathieu-Daudé wrote:
> The MByteSwap bit only affects the data register endianness,
> not the config register. Map the config register once in the
> gt64120_realize() handler, and only remap the data register
> when the mapping is updated.
> 
> Fixes: 145e2198d7 ("gt64xxx: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
> Reported-by: Klaus Jensen <its@irrelevant.dk>
> Tested-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/gt64120.c | 25 +++++++------------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
> index f226d03420..36ed01c615 100644
> --- a/hw/pci-host/gt64120.c
> +++ b/hw/pci-host/gt64120.c
> @@ -320,13 +320,6 @@ static void gt64120_isd_mapping(GT64120State *s)
>   
>   static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
>   {
> -    /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
> -    static const MemoryRegionOps *pci_host_conf_ops[] = {
> -        &pci_host_conf_be_ops, &pci_host_conf_le_ops
> -    };
> -    static const MemoryRegionOps *pci_host_data_ops[] = {
> -        &pci_host_data_be_ops, &pci_host_data_le_ops
> -    };
>       PCIHostState *phb = PCI_HOST_BRIDGE(s);
>   
>       memory_region_transaction_begin();
> @@ -339,22 +332,13 @@ static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
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
> -
>       if (memory_region_is_mapped(&phb->data_mem)) {
>           memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
>           object_unparent(OBJECT(&phb->data_mem));
>       }

Self-NACK since the config space reads are swapped:

   $ lspci -v
- 00:00.0 Host bridge: Marvell Technology Group Ltd. 
GT-64120/64120A/64121A System Controller (rev 10)
-     Subsystem: Red Hat, Inc Device 1100
-     Flags: medium devsel
-     Memory at <unassigned> (32-bit, prefetchable) [disabled]
-     Memory at 01000000 (32-bit, prefetchable) [disabled] [size=16M]
-     Memory at <ignored> (32-bit, non-prefetchable) [disabled]
-     Memory at <ignored> (32-bit, non-prefetchable) [disabled]
-     Memory at <ignored> (32-bit, non-prefetchable) [disabled]
-     I/O ports at <ignored> [disabled]
+ 00:00.0 Network and computing encryption device: Device 2046:ab11 (rev 06)
+     Subsystem: Device 0011:f41a
+     Flags: fast devsel
+     Memory at <ignored> (32-bit, non-prefetchable)
+     I/O ports at <ignored> [disabled]
+     Memory at 10040020 (64-bit, prefetchable) [size=16]
+     Memory at 10040030 (64-bit, non-prefetchable) [size=16]


