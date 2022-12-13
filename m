Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00164B2EC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 11:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5267-0007ew-QX; Tue, 13 Dec 2022 05:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5266-0007eQ-4h
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:01:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5264-0001xF-Cl
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:01:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f18so15031795wrj.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 02:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SRxfmSbqPxBUr8pA7Eq1I2wk4udrZGOOBppj9aTP85o=;
 b=lPiGbFLgDcGenevRT0ki1pAcYOzZ9NlY2lmz8iIZMiarqqjwo8W2UavtOtbT3dhMj+
 U+GQEa6/AsbXCBax3KymqaQGaVatNQDKT3eTysI11ItCQRsSW44ucBp1yxnPCozV3pUE
 7AvxpJl7mcC1NcjMYtxjEszAfEGFogiGnZMdcOS4JB5PaUyvzRYb4LzZ0e0rGpo0uz80
 hMHckdmaN8juem3vm96f53QYzsAMa9Nw87OUC2UAx6yeQVXXgxf9ngDNGkQp6scHn2LD
 DRXEOzPsmO2/sUD6ElFCFL3Er14TXqf5o1Q9flKFsLFSjikK0e9A0a1vN1G6fkS6oH73
 SQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRxfmSbqPxBUr8pA7Eq1I2wk4udrZGOOBppj9aTP85o=;
 b=lB3JqnMnyNuCqhnivg6NcbM4988ngpW8u3X+GBF8iB/ApIH1bjdIlfJMUYNyT+GoGN
 pJM3mx1yNJ8fW/X197H5t80z80CCa464ks12q9ArIt11rc3avhAIbUBhP1rClZLR7v5z
 rfr2o/kgmbHArgbc6iss0XLXjq5h3BRSNIOJELB1FB06AsWqJ12mIR0JQ9yhdtOzbDmF
 w+D7RTg51HuZBylyXBTqGabc8VL0pn7/+RcfgFBXqazrXPHHLePthH/zrZTXRM7+6g0z
 euFB7J6U+6uJd0nTxBcNIJO76JRiMANqnRVStG12/bDCxIqldI0wpS/ClDyAUrlDDqed
 kQLw==
X-Gm-Message-State: ANoB5pnXhoPXRMXXavauU/ghRRHT/fdlhq7vh6F3n6Q+weaYIBxPFBw8
 hjGNx51Ucl6U/mBSTJ872x8ZIQ==
X-Google-Smtp-Source: AA0mqf6qCER7F4EOyvC5B7tfUZNySJ7hD39z0Uw5Dffn5YxWI7IboOdTndKuqIfE60xbkTaHILwN+A==
X-Received: by 2002:adf:ead2:0:b0:242:78b6:5ee4 with SMTP id
 o18-20020adfead2000000b0024278b65ee4mr13089592wrn.44.1670925670657; 
 Tue, 13 Dec 2022 02:01:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n8-20020a056000170800b00228dbf15072sm11529437wrc.62.2022.12.13.02.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 02:01:10 -0800 (PST)
Message-ID: <59a252ed-6cea-1966-97be-85e13a6e582f@linaro.org>
Date: Tue, 13 Dec 2022 11:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] hw: Include the VMWare devices only in the x86 targets
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221213095144.42355-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213095144.42355-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/12/22 10:51, Thomas Huth wrote:
> It seems a little bit weird that the para-virtualized x86 VMWare
> devices "vmware-svga" and "vmxnet3" also show up in non-x86 targets.
> They are likely pretty useless there (since the guest OSes likely
> do not have any drivers for those enabled), so let's change this and
> only enable those devices by default for the classical x86 targets.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   ...ate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} | 0
>   rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} (100%)
> 
> diff --git a/docs/interop/vnc-ledstate-Pseudo-encoding.txt b/docs/interop/vnc-ledstate-pseudo-encoding.rst
> similarity index 100%
> rename from docs/interop/vnc-ledstate-Pseudo-encoding.txt
> rename to docs/interop/vnc-ledstate-pseudo-encoding.rst

Unrelated change ;)

> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index a1b159becd..7b3da68d1c 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -55,7 +55,7 @@ config VGA_MMIO
>   
>   config VMWARE_VGA
>       bool
> -    default y if PCI_DEVICES
> +    default y if PCI_DEVICES && PC_PCI
>       depends on PCI
>       select VGA
>   
> diff --git a/hw/net/Kconfig b/hw/net/Kconfig
> index 6d795ec752..1cc1c5775e 100644
> --- a/hw/net/Kconfig
> +++ b/hw/net/Kconfig
> @@ -51,7 +51,7 @@ config RTL8139_PCI
>   
>   config VMXNET3_PCI
>       bool
> -    default y if PCI_DEVICES
> +    default y if PCI_DEVICES && PC_PCI
>       depends on PCI

I'm not sure what PC_PCI is for, it seems inherited from the
first Makefile conversion.

Are you sure you want to build this by default if the PC
machine is selected? An user could select it an non-X86 arch.

Maybe we want:

-       depends on PCI
+       depends on PCI && (I386 || X86_64)

?

