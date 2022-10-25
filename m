Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD260D803
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:38:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTRD-0007Z0-DI; Tue, 25 Oct 2022 19:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTRB-0007SQ-Gm
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:34:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTR9-0000g6-Nr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:34:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so16398752wrw.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OY1oOVqp4+iJeGPtQ5pH7kr5k9FkBwKzHJ1IBzEO2x8=;
 b=kdpzxzPfxg/jQts3lk3j21rc5e1nzP0Y383LzUAql1Mi53elB8UZyGtWrWpS5PzmBo
 Z6pCci7+lgYZb546nUzrLLeWHT9SWWdgdb3gfjV5ewFOAiM4YI33ogf/rodLeePFaU4a
 NaGnhu3PJNWjEW07TAdVA6inxvn+M4Ul2cI/Iu9zulNanasiIehB5LTsXc4i3w6Cdv9B
 cBBbHMT59dei7RbqS/VdsfXuY+C9+rYEDrb3N1LpQ1O23D5eb5B+p7ePU+S+rEJhDcI6
 dVwd8huBPuuIeR6mhDm14PmMA4pTatT7Oc243oA24D3dNfOkzEgXv5B71j+Zgqz+8mHJ
 /L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OY1oOVqp4+iJeGPtQ5pH7kr5k9FkBwKzHJ1IBzEO2x8=;
 b=SGT4ZsTVdhrsX2IeldYx9ro6lFR/B27g/UOIKGcNOa5dUytT5Kszyfb8/Pk++JUwfE
 AX6GRrNs2wOffuMsQ5eDHEY3EZYG9SrbQtGzUEHWHBkXoejlVgdlSLZGexxZTqdNb98j
 wL7f6onDNxj5PxthSh/ZYTmjRmkgWLtkjZ97yr2UmIp0ljH39Sysnvbn/mAm95phnAfh
 vOmLmv9ay9q5TJVtoX4O/RrPLIpnNpFnSCic5zATYH2I183osDYub0URwWgrbjLfO1Ci
 oux7E2VG/jsxzI7J8p23pNrXXZJrxjKg4fRu/5vjpHlI0jFLaU/86wDRMxIfDk8oaO8W
 r5iw==
X-Gm-Message-State: ACrzQf2vvJwSWZEVaDbqtPS4qpgfJRoeAcU8xW3mtIjXjVmM8PhTS2Oi
 Wkfi/WQgvin7+/jt1D9X2i0uaQ==
X-Google-Smtp-Source: AMsMyM77SQIHU/pvXLCwyy6e+gsytffp2OeB1Y/d8p3OTW19VbdQz3gQrTBgdjHYbABK8RqtDXSOUQ==
X-Received: by 2002:a05:6000:152:b0:236:57dc:7dd7 with SMTP id
 r18-20020a056000015200b0023657dc7dd7mr15110402wrx.660.1666740861898; 
 Tue, 25 Oct 2022 16:34:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r29-20020adfa15d000000b002365f326037sm4624211wrr.63.2022.10.25.16.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 16:34:17 -0700 (PDT)
Message-ID: <eeeac077-2e9b-20db-9bb1-692c663f9695@linaro.org>
Date: Wed, 26 Oct 2022 01:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 19/43] hw/isa/piix3: Allow board to provide PCI
 interrupt routes
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-20-shentey@gmail.com>
Content-Language: en-US
In-Reply-To: <20221022150508.26830-20-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
> PIIX3 initializes the PIRQx route control registers to the default
> values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
> April 1997 manual. PIIX4, however, initializes the routes according to
> the Malta™ User’s Manual, ch 6.6, which are IRQs 10 and 11. In order to
> allow the reset methods to be consolidated, allow board code to specify
> the routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c                | 12 ++++++++----
>   include/hw/southbridge/piix.h |  1 +
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index aa32f43e4a..c6a8f1f27d 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -168,10 +168,10 @@ static void piix3_reset(DeviceState *dev)
>       pci_conf[0x4c] = 0x4d;
>       pci_conf[0x4e] = 0x03;
>       pci_conf[0x4f] = 0x00;
> -    pci_conf[0x60] = 0x80;
> -    pci_conf[0x61] = 0x80;
> -    pci_conf[0x62] = 0x80;
> -    pci_conf[0x63] = 0x80;

These values are the correct reset ones however (also for PIIX4).

The problem is the Malta machine abuse of the PIIX4 model. IOW
this doesn't seem the correct approach, we should fix how Malta
use the PIIX4 (in the emulated tiny boot loader). I'll try to
write smth before reviewing the rest of this series, because
it might simplify your refactor.

> +    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
> +    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
> +    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
> +    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
>       pci_conf[0x69] = 0x02;
>       pci_conf[0x70] = 0x80;
>       pci_conf[0x76] = 0x0c;
> @@ -383,6 +383,10 @@ static void pci_piix3_init(Object *obj)
>   
>   static Property pci_piix3_props[] = {
>       DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
> +    DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
> +    DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
> +    DEFINE_PROP_UINT8("pirqc", PIIX3State, pci_irq_reset_mappings[2], 0x80),
> +    DEFINE_PROP_UINT8("pirqd", PIIX3State, pci_irq_reset_mappings[3], 0x80),
>       DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
>       DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
>       DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 1f22eb1444..df3e0084c5 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -54,6 +54,7 @@ struct PIIXState {
>   
>       /* This member isn't used. Just for save/load compatibility */
>       int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> +    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
>   
>       ISAPICState pic;
>       RTCState rtc;


