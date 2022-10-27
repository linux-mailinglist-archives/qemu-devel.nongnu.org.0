Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB08610390
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:58:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9wN-0003Xe-4l; Thu, 27 Oct 2022 16:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9wK-0003Nq-Qn
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:57:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9wJ-0000Or-6S
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:57:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n14so1804782wmq.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r0mdIuZ2EDTi8BBXkIa6/gg9NW4EYQWsW32okvcu420=;
 b=i63IBY7n0m50N8gyQ5QZhPw+zQ9B+Vzcs7XBYtrK/4tHYaVxRiwWv7jbwEVVxkZv+a
 4obdGpH3WMHGzastM8BYmJMtpdlXNV5JxgQ5P02P139LCBzsRwwN50/ddCnWop+ASOht
 6Dfu8nDNPTVQIQocqrQGRnHGorSmu7fTgcvU3YQ9YrtwYQ81UgcVOFd++RBE2xBuyLIi
 yvEfpkt59FrAOY4jR7ThIJ2b5hMDTg+WmpjsnZqCPgxdvnzjH4dGtC266Y8Lsy0/hqJM
 qLjkcmCLF4jUiSgKQmtCMYAwTR4z3V6wmCmK5lZ8YtDXGbE/d+KizBbENVjl13pvqVw9
 FpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r0mdIuZ2EDTi8BBXkIa6/gg9NW4EYQWsW32okvcu420=;
 b=G96/CnggUpvag23UYJZy25QWxxdKU4xr6inqyPuSVWdl5zt/5byGzdS2pharrKqJHW
 4jl1opq46KPjHx5d+PAf5UQj3GqGvLmqOPD25q5KPU/c1Jt3Qvww0KWQouqJvXqHVRUh
 QDkJ+jMHOgMCRK3T2p+O42uKAh2+MaPAh4AkbtTBumPZzH76194LLnv229HSExobgs7U
 SZG4nixmAGO8A0MUn7z4ql9p0WkyYgsSFzafLVhtGWmm4K/afbyEg16NpFUokaJaF+vb
 KyfdtRtBL08WA3emPu31YzCFc5mu559pA8j6B60Ef1ZMKm23JBFsV/CjcOvnyVeEd62Q
 7smw==
X-Gm-Message-State: ACrzQf3cPqfEBPDpFMwR1HTS7maIJL1TRvXpgKs6+kN+PDTP7E+UoBzg
 mwL17sVx8Mle6y05fnYdytHEfw==
X-Google-Smtp-Source: AMsMyM4RuLXi6mDmLT1DAJ11B7EeN3U8khN8PTBKmXxckGtEBI1w+o05pkqXyOHDHIJ0HX3B4xNa8w==
X-Received: by 2002:a05:600c:4e52:b0:3ce:3f91:70b9 with SMTP id
 e18-20020a05600c4e5200b003ce3f9170b9mr6966089wmq.131.1666904241565; 
 Thu, 27 Oct 2022 13:57:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d6b83000000b00236644228besm1988339wrx.40.2022.10.27.13.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:57:20 -0700 (PDT)
Message-ID: <75f39fd2-05b7-483f-60c7-00cfd12a47e7@linaro.org>
Date: Thu, 27 Oct 2022 22:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v2 09/43] hw/usb/hcd-uhci: Introduce TYPE_ defines for
 device models
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c |  3 ++-
>   hw/i386/pc_q35.c  | 13 +++++++------
>   hw/isa/piix4.c    |  2 +-
>   hw/usb/hcd-uhci.c | 16 ++++++++--------
>   hw/usb/hcd-uhci.h |  9 +++++++++
>   5 files changed, 27 insertions(+), 16 deletions(-)

> diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
> index c85ab7868e..22f6e6fcfc 100644
> --- a/hw/usb/hcd-uhci.h
> +++ b/hw/usb/hcd-uhci.h
> @@ -91,4 +91,13 @@ typedef struct UHCIInfo {
>   void uhci_data_class_init(ObjectClass *klass, void *data);
>   void usb_uhci_common_realize(PCIDevice *dev, Error **errp);
>   
> +#define TYPE_PIIX3_USB_UHCI "piix3-usb-uhci"
> +#define TYPE_PIIX4_USB_UHCI "piix4-usb-uhci"
> +#define TYPE_ICH9_USB_UHCI1 "ich9-usb-uhci1"
> +#define TYPE_ICH9_USB_UHCI2 "ich9-usb-uhci2"
> +#define TYPE_ICH9_USB_UHCI3 "ich9-usb-uhci3"
> +#define TYPE_ICH9_USB_UHCI4 "ich9-usb-uhci4"
> +#define TYPE_ICH9_USB_UHCI5 "ich9-usb-uhci5"
> +#define TYPE_ICH9_USB_UHCI6 "ich9-usb-uhci6"

What about defining once:

   #define TYPE_ICH9_USB_UHCI(fn) "ich9-usb-uhci" #fn

?

