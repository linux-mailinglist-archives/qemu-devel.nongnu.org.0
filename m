Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138B64380C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Jtu-0001BL-9Y; Mon, 05 Dec 2022 17:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Jts-0001Ay-CG
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:25:24 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Jtq-0004Hx-Ny
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:25:24 -0500
Received: by mail-wr1-x431.google.com with SMTP id m14so20976243wrh.7
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zwRqybbCJkV+H5YJsgc03UtA6EEtA7DrAM6rk315Slg=;
 b=SoW7SwwJpzcN1uMMYbk+7v4ZqSATwlfntNMK6XLYhd6Eee9RS9A/OaUqVVYKIHPrIY
 Z7x7Ic5ujqU6CJs1xfxCxavSz3HmwqaRnRXVieKSG11LX6NyQNMbdUogjGx29AyLzuU9
 PrDBNyvW7h6HnfnB3bMMx6J85AhDoffPxDTHae2/Lc7TjNKvx0ZvNAjVMKhebUKrkVNA
 SfXiSuwY8rwre/6qtaUvO8ZqxDZ2eUoxSYL4GsDROSoMqdS6pQjlDe2kjeyR38kiXjc+
 6LRRur/wsIN5FPMllFvIBeB0p1wCS3JnKh5OKo6wRKOzOfYWgNu0lLKogz6S/ky5D8dC
 S0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zwRqybbCJkV+H5YJsgc03UtA6EEtA7DrAM6rk315Slg=;
 b=uhgvEBvgO7oPWDWAB3fBRSL2j3r6B+hrxBiVEmMgsIjtluaLkA+PcJct6NXRnLwkh5
 50csNIXHfO2mAfzOlnwCLen6qhL/hO5FMxuZmJm/AuKDmftn2iZlKDgetj3dZPpwaa5E
 LSM2qCcyUe3soZS+/IOXf3KOTT0tQEZoesd5AE53CTprA9V0NsZjhsChplee8iJ4dwr3
 jLPr6WsEBv2oy5qC8AdV7nAOj4zgC/YQxW7Rd2IzH+zdX1UE0DDlRKyKNOFsUz10AXvT
 hegYpS+AxQ3LJ5sNSVmGSs+aLUeJXVyS3kjwCAN9R7ThyaPc9k8V2nXIfVYi6moVQ5As
 DPPw==
X-Gm-Message-State: ANoB5pmIkpFEHqyhsuZH9z7hMI9wzhW0FxeNTpDMknvewl+TU3LWxh9m
 UuMjDUj5VOv55if3JRX1Y3b/NQ==
X-Google-Smtp-Source: AA0mqf4lvDzFqyH7CaJZUhqfsfJqaJbVwG5tZn4yC6RY4vJdK5DjWcp/Zf02eGrgvgIK9exHknIAiA==
X-Received: by 2002:adf:d234:0:b0:241:fe0e:b99c with SMTP id
 k20-20020adfd234000000b00241fe0eb99cmr33716113wrh.456.1670279121020; 
 Mon, 05 Dec 2022 14:25:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b002422b462975sm14579897wrv.34.2022.12.05.14.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:25:20 -0800 (PST)
Message-ID: <691190cd-7c0e-5f30-f5e6-ccf0a84cf3bb@linaro.org>
Date: Mon, 5 Dec 2022 23:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 18/21] kvm/ioapic: mark gsi-2 used in ioapic routing
 init
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-19-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 5/12/22 18:31, David Woodhouse wrote:
> From: Ankur Arora <ankur.a.arora@oracle.com>
> 
> GSI-2/IOAPIC pin-2 is treated specially while initing
> IRQ routing: PIC does not use it at all while the IOAPIC
> maps virq=0 to pin-2 and does not use GSI-2.
> (all other GSIs are identity mapped to pins.)
> 
> This results in any later code which allocates a virq
> to be assigned GSI-2. This virq is in-turn used to
> remap interrupts to HYPERVISOR_CALLBACK_VECTOR (0xf3)
> to deliver to the guest.
> 
> Ordinarily this would be okay, but if the event delivery is
> via direct injection via KVM_REQ_EVENT (without going
> through the LAPIC) we see vmentry failure.
> 
> This works fine for any other values of GSI.
> 
> As a workaround, mark GSI-2 used.
> 
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/kvm/kvm-all.c  | 5 +++++
>   hw/i386/kvm/ioapic.c | 1 +
>   include/sysemu/kvm.h | 1 +
>   3 files changed, 7 insertions(+)


> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index ee7c8ef68b..5fab0d35c9 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -43,6 +43,7 @@ void kvm_pc_setup_irq_routing(bool pci_enabled)
>               }
>           }
>       }

Workarounds usually deserve some comment in the code.

> +    kvm_irqchip_set_gsi(s, 2);
>       kvm_irqchip_commit_routes(s);
>   }

