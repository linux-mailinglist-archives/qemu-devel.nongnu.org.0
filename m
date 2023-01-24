Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF167A293
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 20:23:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKOsQ-0006hq-47; Tue, 24 Jan 2023 14:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pKOsN-0006h7-LW; Tue, 24 Jan 2023 14:22:35 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pKOsL-0005OA-To; Tue, 24 Jan 2023 14:22:35 -0500
Received: by mail-oi1-x231.google.com with SMTP id r205so14253395oib.9;
 Tue, 24 Jan 2023 11:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E4c8k0meGo2kgdw+jclsDEyCryxyh4IEi3DzL22oLHs=;
 b=CQaOPotT9a9WnUAyCBgHGgsFgkflqrhTPBC0wK9zdNHyh0ubk0mhD03n1vWkOkgiDy
 7XVHG0S+gkcWSfP6JT4C310iW3YEe0XnNpHo8HqDU/rBogyUI0AMJtjLenUag8T5Nczs
 TB380xk6soXJ6e7Ml5hhzwTfAvlh4RJ6IkbI4wXzj1HebaFeHnSnWIiqbYEssPxzpYOR
 wi6e0nTG+9VL7dmALxo8+8QGy+n31Eju+qE08P1QsOOVtqVdR+qrcb3uPky0q1Nuq9Hu
 SMmTXrTuM02YHzPEY7Y/32gVnenundJvrShH55Q6z9YEr5MNJdS6/TjiW8OiGkrPRbfF
 LjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E4c8k0meGo2kgdw+jclsDEyCryxyh4IEi3DzL22oLHs=;
 b=LdXmSfANQE7IxE7xs1F7G6X4Zavrm9smM/8gU/Yr8HAJsq7JR2WAkTwHXvEiNSDrnE
 UghuFW+n6rvdmc3/lbEugovdBQOYGxAaNvziSaVvXcfR7ivgUD02FbVqUzPwA+/3wTyc
 lZctYJzPHi3wnGext6PXI5q5fe1SfxlB9UCZpMjJhUgi8DTXrtZ6qPU4lV5P9rojsQKh
 rDmUfW5A/AilrzK3H38JM23zfb/G3O0FrbVPFvslyUVlvjKDlQBL6G3EnFMtbVCfdGdC
 aRqLk62+1WxfMekvlcV8O8WdGLaP0xlMVVpgT++EJYiHGYXvA13pVeO/bJsL6i2F3QKg
 hPLQ==
X-Gm-Message-State: AFqh2kr1RzU/ShMzDKbI2kBA1r+9Zaqo+nIcPRqFzToOJs+fF9lAiaIf
 1NR96kF+jIr/Z6YEBbGWi78=
X-Google-Smtp-Source: AMrXdXvzebgZLB1V5qn4hv+2AOXyxIQXK6tlgOglgOWIT4SxBZXncc6mk37TSSwP/Jwx/Mt/rMooKA==
X-Received: by 2002:a05:6808:10cd:b0:35e:bb7f:81af with SMTP id
 s13-20020a05680810cd00b0035ebb7f81afmr34854670ois.7.1674588152050; 
 Tue, 24 Jan 2023 11:22:32 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 s25-20020a0568301e1900b006865f605ce3sm1262068otr.54.2023.01.24.11.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 11:22:31 -0800 (PST)
Message-ID: <569a41e4-f587-cd60-a2a0-5a47461f1000@gmail.com>
Date: Tue, 24 Jan 2023 16:22:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20230106113927.8603-1-shentey@gmail.com>
 <73252BC9-79B9-407A-9A15-3C69065531D3@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <73252BC9-79B9-407A-9A15-3C69065531D3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
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



On 1/21/23 17:56, Bernhard Beschow wrote:
> 
> 
> Am 6. Januar 2023 11:39:27 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> mv64361_pcihost_map_irq() is a reimplementation of
>> pci_swizzle_map_irq_fn(). Resolve this redundancy.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> Ping
> 
> Patch is reviewed. Who will queue it? Daniel?

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
> Best regards,
> Bernhard
> 
>> ---
>> Testing done:
>> * `qemu-system-ppc -machine pegasos2 \
>>                    -rtc base=localtime \
>>                    -device ati-vga,guest_hwcursor=true,romfile="" \
>>                    -cdrom morphos-3.17.iso \
>>                    -kernel morphos-3.17/boot.img`
>> ---
>> hw/pci-host/mv64361.c | 7 +------
>> 1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
>> index cc9c4d6d3b..70db142ec3 100644
>> --- a/hw/pci-host/mv64361.c
>> +++ b/hw/pci-host/mv64361.c
>> @@ -72,11 +72,6 @@ struct MV64361PCIState {
>>      uint64_t remap[5];
>> };
>>
>> -static int mv64361_pcihost_map_irq(PCIDevice *pci_dev, int n)
>> -{
>> -    return (n + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
>> -}
>> -
>> static void mv64361_pcihost_set_irq(void *opaque, int n, int level)
>> {
>>      MV64361PCIState *s = opaque;
>> @@ -97,7 +92,7 @@ static void mv64361_pcihost_realize(DeviceState *dev, Error **errp)
>>      g_free(name);
>>      name = g_strdup_printf("pci.%d", s->index);
>>      h->bus = pci_register_root_bus(dev, name, mv64361_pcihost_set_irq,
>> -                                   mv64361_pcihost_map_irq, dev,
>> +                                   pci_swizzle_map_irq_fn, dev,
>>                                     &s->mem, &s->io, 0, 4, TYPE_PCI_BUS);
>>      g_free(name);
>>      pci_create_simple(h->bus, 0, TYPE_MV64361_PCI_BRIDGE);
> 

