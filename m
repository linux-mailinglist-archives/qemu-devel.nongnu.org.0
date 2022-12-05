Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF96437A3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2JZD-0001dM-CZ; Mon, 05 Dec 2022 17:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JZ9-0001cv-9i
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:03:59 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JZ7-0000or-Mz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:03:59 -0500
Received: by mail-wr1-x430.google.com with SMTP id w15so20916732wrl.9
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZaqC6r++0UjblJcLlBJgJ8vSJoYfa/viWYaUv9fdGVQ=;
 b=uHAQHc0oHUcHiBOJHR69lBltaDlmbtp2dkSllEX0RRjePpk6ZbOm0r8zXnKbdSA9Iq
 t0RfOrjHyCCFlCAEch7ocTCr1MTOpBLxv/yCIMK5NWo7E303J9/m1RJ9HXRMVnE+zjAF
 k9xNerjsWgum1yLW+NpMWFG5LC9Ne4KWHiW+3gf6AZQuG0rQYaUnWj1KETC1IQ8+NABT
 Iay032bUUzMJ6T4iq9sLvhimdGcFBqktRzWWwH2mlnvVvNTrXE0vqTF2RWfguv0/98O/
 ZQCWJFKgRW8gzCujqPwrPJEi+5o4rrHBdxhPGK6XkYFrbvaVcmeH6d8hT3DiVPwE7iwi
 CSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZaqC6r++0UjblJcLlBJgJ8vSJoYfa/viWYaUv9fdGVQ=;
 b=xKcjymoA6tRSmPp1ucfYf/I6vZKGKNat1K3vJIJBCT8T3lRtd/npvRk+6hXMcvV2I8
 spG3he9h8FFgGpztfHplXPVLXqW/F5SvBXk40BoVWdYqWhKSW112k7L4KtZBmbIQkCj+
 JIWEV42mkvevJFewEysp21ysi8OYZxhJNtBnTneCOz+erjasATFz74+6tkb8vfi5oO/I
 kpiyl34BpF3Pqj3/ISDBkzT9xhv234Owb9ltYaPCVCVUmq8Gzta4kRyMD83ELLAhAq0W
 U8ezTpixu9Ng3bW2gVKTPaelcqKcvqa8kQwspnmfv2O1zMa+6AtkJ5PM/TT/eceMqXlN
 LtyA==
X-Gm-Message-State: ANoB5plS6nKW2X5Wc3OBz9Cj2G9NRK72YrEOzUJUz9/9F/kuyzhzTgce
 1XsN4fpKdmZKT/ZDuLX8WGfwjg==
X-Google-Smtp-Source: AA0mqf5pEN8A2LSpPVsZRc/8Nu4R6GzA1OuC07mqEeU0NXv8rArpx2yjqlcEcdhpUcd1JjHJxw5RJQ==
X-Received: by 2002:a05:6000:78a:b0:242:7440:38f2 with SMTP id
 bu10-20020a056000078a00b00242744038f2mr619895wrb.401.1670277836108; 
 Mon, 05 Dec 2022 14:03:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p33-20020a05600c1da100b003d070e45574sm19781818wms.11.2022.12.05.14.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:03:55 -0800 (PST)
Message-ID: <aad78d2e-3410-687d-f086-a8e872eccdec@linaro.org>
Date: Mon, 5 Dec 2022 23:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 08/21] xen_platform: exclude vfio-pci from the PCI
 platform unplug
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-9-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Such that PCI passthrough devices work for Xen emulated guests.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 710039851a..ae0a21f5bf 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -109,12 +109,25 @@ static void log_writeb(PCIXenPlatformState *s, char val)
>   #define _UNPLUG_NVME_DISKS 3
>   #define UNPLUG_NVME_DISKS (1u << _UNPLUG_NVME_DISKS)
>   
> +static bool pci_device_is_passthrough(PCIDevice *d)
> +{
> +    if (!strcmp(d->name, "xen-pci-passthrough")) {

The 'QOM way' to do this check is:

        if (object_dynamic_cast(OBJECT(d), TYPE_XEN_PT_DEVICE)) {

> +        return true;
> +    }
> +
> +    if (xen_mode == XEN_EMULATE && !strcmp(d->name, "vfio-pci")) {

        if (xen_mode == XEN_EMULATE
            && object_dynamic_cast(OBJECT(d), TYPE_VFIO_PCI)) {

> +        return true;
> +    }
> +
> +    return false;
> +}

