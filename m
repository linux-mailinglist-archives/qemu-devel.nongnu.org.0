Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4695AA15B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:07:20 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrPD-0000sm-Od
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrND-00071H-Kn
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 17:05:16 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrNB-0002u4-U4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 17:05:15 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q63so207859pga.9
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=aS10r/1PMAAHSx0kNfJ5xkK/KfV42VlHdUYd4wsQfxQ=;
 b=O91wvNilBJ8BA9zJ3UUE6/dfCZim2sPhnSn3Ruxb68cHreDwL4eYnSHVv7qceitYDm
 KqYpuWvFvuj/2FASlMj9bzVkEeplDpDgc3G5Wou8v4xM/kz/fp6NNn6sflxFV9wj9+eX
 OB1zpwiIbAhoomqPfbYa3HCgMlbs4wTF9ystRBgWK+3B2AEEpnxxfTXHdRMwVCVQTsr/
 UVOhPYLeUBQpHu1PeOgIZmWmXdhK/hw1dDBiOhu7QqBOiA0/GvJR1vr/kD0yIITbFenl
 0kj3+huqxpUulueP5KTKeC21ATd4l4LGioPYedIbdg1kua6aJ7lFQ5/m2NDsuYERlIfq
 aEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=aS10r/1PMAAHSx0kNfJ5xkK/KfV42VlHdUYd4wsQfxQ=;
 b=dhYb5O8k6ig+eGThMhbn7UHO4/i5hcYgK51gpKN4bYSODdGZ34pI2M+8zIxQWjMGob
 /1JAl2J0DhETzF0XSlVmfqnQKwDnH14vHwqCISOPAmkQi/4Qiilpf/kK/NQp3PfX1KzB
 moVXmp8yLN/3eXOsK1qkqqicTLXfRut4NfXVLhNuTjKcB47C7gOTZDw8a/S1iPAF1Tvy
 3LeLUdrRMqlWfeVuVuedXR2AUWGom71E3SGpN+V8qHDYRWuDe3Mvk0ygaxKjqTZRs8za
 +p0f7RhUNWCMpKmO7RqKL93iayATPa54VV0F+HOjjLwRmN2qALawiCL6+K1+azqLOQNx
 m60w==
X-Gm-Message-State: ACgBeo3lf4x8qQOfs/Sws/bS8i++XPySnrJ8XK0pfPfkvJ7I45Du5g8C
 Pjy6It6wnGwsadVtvb/qQTA=
X-Google-Smtp-Source: AA6agR5ud4zAvO15/RcC2dUi2PA9yiSt2ej/P+n7wVLp5LzY8NBm8qU4c63wOEZbNwqmebW4WvX9ZA==
X-Received: by 2002:a63:1257:0:b0:42f:fbe8:3ac0 with SMTP id
 23-20020a631257000000b0042ffbe83ac0mr10832996pgs.412.1662066309853; 
 Thu, 01 Sep 2022 14:05:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709027e4700b0016d8d277c02sm24213pln.25.2022.09.01.14.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 14:05:09 -0700 (PDT)
Message-ID: <aa1b63b7-fe8f-1d19-2716-c76525d5bc7a@amsat.org>
Date: Thu, 1 Sep 2022 23:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 42/42] hw/i386/acpi-build: Resolve PIIX ISA bridge rather
 than ACPI controller
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-43-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-43-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/9/22 18:26, Bernhard Beschow wrote:
> Resolving the PIIX ISA bridge rather than the PIIX ACPI controller mirrors
> the ICH9 code one line below.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8af75b1e22..d7bb1ccb26 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -288,7 +288,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>   
>   static void acpi_get_misc_info(AcpiMiscInfo *info)
>   {
> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> +    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX_PCI_DEVICE);
>       Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
>       assert(!!piix != !!lpc);
>   

This looks correct to  me w.r.t the hardware, but my understanding is
some x86 machines allow abusing the PIIX ACPI PCI function, by plugging
it alone, without the rest of the south bridge... Then this patch would
regress such Frankenstein use :/

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

