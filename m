Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA96A34B4
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:28:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPUw-0005bJ-BO; Sun, 26 Feb 2023 17:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWPUq-0005ay-A8
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:27:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWPUo-0007Jx-7K
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:27:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j3so3146486wms.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cYHZwLWjuPzG80Zm00uSiAUyLCj0mFyGuAP+MXecKSk=;
 b=ffsvkswaXDCwf5wgEX1h+2N2SnBYMlxAtzB6QfC8UrifS78g5CCOOTKca0Q8ZPPTXZ
 WMdGdbUCqBnWGM9nVe63ppr7lVVQu/YY8Wp0A2+NFaZXDjZCtC0e8Ic0NBmGGg7GNspe
 tQnd3X4uMbijkkrtr5uSM4Y1aCAonPP0MtLvYmZZGTH2bCPzXUg5/DeWh4hU3JvSyBRp
 iBiD76nO+slixArs3uERpV95mWcNrWji3M7xcV04TH4ba1Uy0NJZoFYWckNcNyiHGuGb
 20fMDmlhZOzXs9dNnB9ema88TM2EzOLIzvpbtdkrnYhe8vTD/mY+3ne4X9CMwBVPKc5+
 WD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYHZwLWjuPzG80Zm00uSiAUyLCj0mFyGuAP+MXecKSk=;
 b=W3l7bySmT5oD+KXY/LMAQNszCznzuok6qjWEEulv/0XovLR4NsY2oG28fDE3N/S64/
 ohzKxKGjvej2Wze/mPfcN08lfUIHUVmuw2x8E0SNH8ZK4Go1INzmzkYPSxZ/V/83oKE8
 C4cW35iOBop1AtM2L10pu6N64ss+sOD0jMVjrLjZBHBr22/VaSvqf2vhrdoOJzihGZ1O
 PSeDksILbRZdMNguULopYiZwBB+XgsJNqNLufBlOGu9uFVF9CUCaR8wru7OPEXKVLUd2
 wmzlUj6XjWIUcoVBSgw/kE7UlctUznrow85haZDFgrP3Y/TytnVmnrdTllzJ0Yn1WZ1U
 mHNA==
X-Gm-Message-State: AO0yUKVl/IXPowf2BUu6ZaGEc72vWuP4G26FEkXGTly60F/ZqE3rHzce
 pLZmioECr9Cj+jlVn12s7JDHQQ==
X-Google-Smtp-Source: AK7set9T44EE5dEKBGVpNnCkmTtIZf+bWQOTixLk51wJUDlMlT2IV6f8bXgqK+eg3u8WzePsgACfHA==
X-Received: by 2002:a05:600c:3298:b0:3eb:2b88:867e with SMTP id
 t24-20020a05600c329800b003eb2b88867emr5997262wmp.10.1677450472312; 
 Sun, 26 Feb 2023 14:27:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a5d5149000000b002c54c92e125sm5402075wrt.46.2023.02.26.14.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 14:27:51 -0800 (PST)
Message-ID: <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
Date: Sun, 26 Feb 2023 23:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/2/23 19:11, BALATON Zoltan wrote:
> From: Bernhard Beschow <shentey@gmail.com>
> 
> The real VIA south bridges implement a PCI IRQ router which is configured
> by the BIOS or the OS. In order to respect these configurations, QEMU
> needs to implement it as well.
> 
> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> [balaton: declare gpio inputs instead of changing pci bus irqs so it can
>   be connected in board code; remove some empty lines]
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> ---
>   hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)

> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
> +{
> +    switch (irq_num) {
> +    case 0:
> +        return s->dev.config[0x55] >> 4;
> +    case 1:
> +        return s->dev.config[0x56] & 0xf;
> +    case 2:
> +        return s->dev.config[0x56] >> 4;
> +    case 3:
> +        return s->dev.config[0x57] >> 4;
> +    }
> +    return 0;
> +}
> +
> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
> +{
> +    ViaISAState *s = opaque;
> +    PCIBus *bus = pci_get_bus(&s->dev);
> +    int pic_irq;
> +
> +    /* now we change the pic irq level according to the via irq mappings */
> +    /* XXX: optimize */
> +    pic_irq = via_isa_get_pci_irq(s, irq_num);
> +    if (pic_irq < ISA_NUM_IRQS) {

the ISA IRQ is stored in 4-bit so will always be in range.

> +        int i, pic_level;
> +
> +        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
> +        pic_level = 0;
> +        for (i = 0; i < PCI_NUM_PINS; i++) {
> +            if (pic_irq == via_isa_get_pci_irq(s, i)) {
> +                pic_level |= pci_bus_get_irq_level(bus, i);
> +            }
> +        }
> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
> +    }
> +}



