Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A594937FC7E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:25:30 +0200 (CEST)
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF5Q-0008Md-O8
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEh6-00036g-Rb
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEh3-0004IJ-LO
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620925212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=da21z97W2yOu3LuAOOkWR4w69Gk6um2JnFHxQyI3XsY=;
 b=iejnqKOqh5+AtNLi2yoHykI4geg0ukPfRr770kA3qaUS/eh+lz2YBJbpeqihjSkDQ3v3zG
 ruJAHIcdXKJt7fHF0gtVX/EfiNBB62ip4wR5uvNei2MOU9EnOnMD7Hz/daVXA0I74GYXxh
 5wZocPjEXRoO85P4G0Zyxmgtc25AiKc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-LmbMeV8jNuGDBlXH-V55Zg-1; Thu, 13 May 2021 13:00:10 -0400
X-MC-Unique: LmbMeV8jNuGDBlXH-V55Zg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gy20-20020a170906f254b02903cc7a4500bfso3380878ejb.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=da21z97W2yOu3LuAOOkWR4w69Gk6um2JnFHxQyI3XsY=;
 b=Rk1/REK7qnVoLzTNeK5XAAgXoOCl/W9eM4Xf81J3xmaJaRSUGRk7GEt7brlAMN7B0i
 nqxKIQAuaSsg8MZ9W8J/0BUIZETUDIGjaXNWEEVV3HiIMKKtoN1i4h75Ca3qOWMJDCJp
 nrNG50Zip3lPRKXGPjHNSAwX4EgyO7T5ckCMA+wdbd8jesPs10GZkiE6SxXluvLCvRM4
 VUbEEH3IwgHNZWYFA0MHW+CAMJHIAJ0+i70N4epvFDnhIv6zOsQ6g5k56MUowSEGuAGe
 /64qr8tqOUrOG1u6IlNeEHzSQuqR+r3+VWNWP8ZWNelBoiIQweuj173T7fv67rh7jtFK
 J4Dw==
X-Gm-Message-State: AOAM532M+3bTakwCNYVK9RGAqpxoR0+lk9Qq5jVGovHq6dizVo8f0qD1
 Z9q9iW6vUV9K9XiS29fToubb0qTke/PPyckMHVjOkZFCzyOe7IzxtLRIJsWk/sPebOjXElRWHig
 /H9itWx/7n2mwtjs=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr44043992ejb.407.1620925209077; 
 Thu, 13 May 2021 10:00:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv2s4KWc/DRkwbGYp+N2xq/QWvUIEwMl7TgvSIRGUPruHkgcYbHVvuYkWUtTGp7LVj9amZbw==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr44043959ejb.407.1620925208892; 
 Thu, 13 May 2021 10:00:08 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k11sm2122246ejc.94.2021.05.13.10.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:00:08 -0700 (PDT)
Subject: Re: [PATCH 09/10] default-configs/devices: Remove implicy SEMIHOSTING
 config
To: qemu-devel@nongnu.org
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-10-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fbc3fb94-f45b-135d-4f1c-a9f949abe308@redhat.com>
Date: Thu, 13 May 2021 19:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513163858.3928976-10-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc Alex.

On 5/13/21 6:38 PM, Philippe Mathieu-Daudé wrote:
> Cmmit 56b5170c87e ("semihosting: Move ARM semihosting code to
> shared directories"), added the ARM_COMPATIBLE_SEMIHOSTING symbol
> which selects SEMIHOSTING.
> 
> Since the ARM/RISC-V targets select ARM_COMPATIBLE_SEMIHOSTING,
> they don't need to select SEMIHOSTING manually. Simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  default-configs/devices/arm-softmmu.mak     | 1 -
>  default-configs/devices/riscv32-softmmu.mak | 1 -
>  default-configs/devices/riscv64-softmmu.mak | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c7..341d439de6f 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -41,6 +41,5 @@ CONFIG_MICROBIT=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> -CONFIG_SEMIHOSTING=y
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> index d847bd5692e..5c9ad2590ef 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> -CONFIG_SEMIHOSTING=y
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  
>  # Boards:
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index bc69301fa4a..8a92f0a2c74 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> -CONFIG_SEMIHOSTING=y
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  
>  # Boards:
> 


