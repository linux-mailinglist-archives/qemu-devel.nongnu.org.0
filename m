Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762927ED85
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 17:41:15 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNeEE-0005Zn-HF
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 11:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNeBm-0003qr-Oi
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 11:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNeBj-00004s-N1
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 11:38:42 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601480318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3umxhrU/2FUwG3HdagnADTtZ7F6SDnjSihkWqnQMnBw=;
 b=Ngsd5rNnc84gEzsXp7ZUJ9qZh786K7LcsSJd4bp3HA4gHJ/q5SItm2Bm7m4Ov6poG1Z58E
 OIMZXh7Cl1qArHtheeLsocqKR7ZQ/3ZNYAExMHQHY3PU0OxZhCChIcn6R/iSbLnPsy54Ah
 tJJ5KUxK6B2rpWFhFFETzOoKUUXLoyE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-OdZAt_Y2PyuVhldH4GQh_Q-1; Wed, 30 Sep 2020 11:38:36 -0400
X-MC-Unique: OdZAt_Y2PyuVhldH4GQh_Q-1
Received: by mail-wm1-f70.google.com with SMTP id m19so768030wmg.6
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 08:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3umxhrU/2FUwG3HdagnADTtZ7F6SDnjSihkWqnQMnBw=;
 b=O7FXJEWdn1i35upscotghsFSJyAjsUBEovMHJ1Y9Zn1xqC4Pn2CTLpQZBxRYZiyzEw
 Tn2ptkIIMhVv64f/HkXqQE6hRNTQ1AAUj53Q3TJr+Q8q95F2I98FPfLofl6acNS+UK77
 gxkj1Ii/Lvn4upLuQCX0OsVZu9sTKEsbVgaLP7Hkzywo6i+Hf3q6SV854f9VwUfOKK+T
 cxPgaTjVZJT4rLeRrkTjPtqfXv7bekCGu7HamfPJbvVdowHsYWc2aUtoEj6LcEgRgHIp
 pMXuIy81U1QXAjxU2ikWW080/N8Bv08VgJKuUTiR3gwbOJg3flltMNqgvVMcedHmUJwE
 1RiQ==
X-Gm-Message-State: AOAM530xVGejU3Qo9rW9575oeM1RgnfU7aOMcfOuEHNVSca6tas81rfV
 F75O5axlrVD1Zl1rWB3+ecS8fX7yXC/rHCU1xnHp3VX0+3gcaL7EmJ5pqpE9DjMIgSkaLAYUWfq
 TdEIGEE0+EyIxqeI=
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr4144742wrw.198.1601480315592; 
 Wed, 30 Sep 2020 08:38:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQKdl9fE2RlUxAYU3QRBFZqEa3VaIQbMvclsSU94tyAIEVRqPOqwLcX9tTQcRchR4Eaimg4g==
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr4144728wrw.198.1601480315382; 
 Wed, 30 Sep 2020 08:38:35 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id x17sm3937042wrg.57.2020.09.30.08.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 08:38:34 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 04/28] hw/arm: Express dependencies of the
 highbank machines with Kconfig
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20190505135714.11277-1-thuth@redhat.com>
 <20190505135714.11277-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f2489790-8fcd-a9c3-4ec3-c8a72240f172@redhat.com>
Date: Wed, 30 Sep 2020 17:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20190505135714.11277-5-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 5/5/19 3:56 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the highbank machine (and the midway
> machine).
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  9 +--------
>  hw/arm/Kconfig                  | 11 +++++++++++
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2a11e76cc7..50a4be3cad 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=y
>  CONFIG_PCI_TESTDEV=y
>  
>  CONFIG_EXYNOS4=y
> +CONFIG_HIGHBANK=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -45,24 +46,17 @@ CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
>  CONFIG_ARM11MPCORE=y
> -CONFIG_A15MPCORE=y
>  
>  CONFIG_NETDUINO2=y
>  
> -CONFIG_ARM_TIMER=y
> -CONFIG_PL011=y
> -CONFIG_PL022=y
> -CONFIG_PL031=y
>  CONFIG_PL041=y
>  CONFIG_PL050=y
> -CONFIG_PL061=y
>  CONFIG_PL080=y
>  CONFIG_PL110=y
>  CONFIG_PL181=y
>  CONFIG_PL190=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
> -CONFIG_XGMAC=y
>  CONFIG_PXA2XX=y
>  CONFIG_BITBANG_I2C=y
>  CONFIG_FRAMEBUFFER=y
> @@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>  
>  CONFIG_STRONGARM=y
> -CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
>  
>  # for realview and versatilepb
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index acd07b2add..0ba377ac18 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -18,6 +18,17 @@ config EXYNOS4
>  
>  config HIGHBANK
>      bool
> +    select A9MPCORE
> +    select A15MPCORE
> +    select AHCI
> +    select ARM_TIMER # sp804
> +    select ARM_V7M

Hmm I missed that... This machine doesn't use a v7M core, right?

> +    select PL011 # UART
> +    select PL022 # Serial port
> +    select PL031 # RTC
> +    select PL061 # GPIO
> +    select PL310 # cache controller
> +    select XGMAC # ethernet
>  
>  config INTEGRATOR
>      bool
> 


