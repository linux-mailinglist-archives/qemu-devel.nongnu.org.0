Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B45358472
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:17:52 +0200 (CEST)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUXf-0007Hv-2T
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUUWL-0006q0-5c
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:16:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUUWG-00070Q-0w
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:16:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id u17so3000505ejk.2
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 06:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dB/+sv82TjLDQhwtEkzVTNRwtEPw9GBTgQJ2PvHDfKM=;
 b=fCpP7AmoluZ1xgK/5dU8gfU0V6dMg2TLqFhJkXJPiD1vvpBY3qo+BdwgbS0V60fuBS
 4GKIIaXiICb1qNtEKCIZz0F8UzeU02R6+80EmkeOkwzzQzM/x0do/zg59OVM90UcH5NL
 oGbg41KAPKY6n2fumBE+g2/GuxJiSkGHkTC0ONE3gbRintBjB8Ry0mJAYjvx/uBxXEty
 4ecer0qeFnZi57k/4lzIGveRE/qQKWXuDCUIsW2cydxoZKDH+FEUGd+zmkYVTiht2nEb
 T79dxVHXZnnniPPp2dyT/WHCAFZWAsxyNmppTXjZeplrnwBiHz4+JXwermHfPhIKRxEl
 t5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dB/+sv82TjLDQhwtEkzVTNRwtEPw9GBTgQJ2PvHDfKM=;
 b=lYvkzG4jG91frSQ/wbNIQFJgaXQ8NSsC13heNqL1/n9QKIOUfDBO/z+YwD+Al0wLPv
 kPrlEc3bfOu90eDIORAj8y1hVAyI8bramjVYh0YskFJfS4ikpfst1ICnICoSKrHRbyWO
 dIeXLGH3bWVyjIwFYtJWAZj8GLXBtn6kVA58NaCplu/n2blV3cwJTO+HimwMdDw4hQWZ
 qoW7UmetIaV4UxSN3d2YErAcOZeiCeSnOgswzFoZHmaMgAGOh4s6sY9JlmdJDBNOrKeu
 Bz0LM1mmFPkoH495xturV4GhhmKc0YvEduyPMDInNj8/w7eJeVxFhckMH0O6pFqIRNzQ
 NJ9w==
X-Gm-Message-State: AOAM532qP1Ibl+TaemCBmy8lA+wP9dqWrQ954sFBAHsPA/Lx2xZ/VJn5
 sCoiAlqsj1E8ifUjoFJHJsI=
X-Google-Smtp-Source: ABdhPJzZRZY4hfugrY4Sdt7Su8fOiiVgORctk+Cf4k0tsT3ABY2ZSuucb/O04k7aP813zmATKbdAuw==
X-Received: by 2002:a17:906:4e82:: with SMTP id
 v2mr10621982eju.128.1617887781589; 
 Thu, 08 Apr 2021 06:16:21 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y6sm3737449ejw.83.2021.04.08.06.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 06:16:20 -0700 (PDT)
Subject: Re: [PATCH-for-6.0? v2] hw/isa/Kconfig: Add missing dependency VIA
 VT82C686 -> APM
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210316110353.3051738-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05578055-216d-1cf3-93cc-a2b358374ca2@amsat.org>
Date: Thu, 8 Apr 2021 15:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316110353.3051738-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch apparently got lost.

On 3/16/21 12:03 PM, Philippe Mathieu-Daudé wrote:
> TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
> requires APM to be selected.
> 
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Rebased on usb-20210315-pull-request
> Based-on: <20210315180240.1597240-1-kraxel@redhat.com>
> ---
>  hw/isa/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 2691eae2f0c..55e0003ce40 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -48,6 +48,7 @@ config VT82C686
>      select SERIAL_ISA
>      select FDC
>      select USB_UHCI
> +    select APM
>  
>  config SMC37C669
>      bool
> 

