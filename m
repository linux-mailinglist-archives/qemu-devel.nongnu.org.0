Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B104C5F8D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:48:33 +0100 (CET)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSLA-0000rv-6m
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSDG-0007Mg-Am
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:40:22 -0500
Received: from [2607:f8b0:4864:20::636] (port=43583
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSDE-0003px-No
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:40:21 -0500
Received: by mail-pl1-x636.google.com with SMTP id u2so1596998ple.10
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=DfefBMnriFv2z79kK/Ix/wm6TiYfm96gSUh5gY7B6I4=;
 b=LUIPkpY4xN3S0aiorU+OtmKYQJCQPHqms1BvWuaX4TXDwhPBBUKO6fIS/1MtMMPdVt
 6flfGTcx+Xzo0zv3TJOfMQH+otGBBBG/w/63vVeNitenngp9lGM/bz3vVe58DpJX8N57
 /BqOifOfMKOCOQSoPB934IaNIcohWHT0hSu0oI/+w02XL0b3h3VdO2G17OP1vYTO9RgL
 cB9ybZdCmSmIb24KEA2vmrj07ephca8C6KfH5YHdFnIwff9+qjctYR4I9j/KDepE94Gq
 FZ0oJ2Vecw8P8QFYrVG6Kl2UUadhMIWqHw9DQy40o73O4iE4+i+sqtzqglTlxOkNhM79
 WYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DfefBMnriFv2z79kK/Ix/wm6TiYfm96gSUh5gY7B6I4=;
 b=rOTXiA1yHpl9/+faeRIgb8eu21+8G6i92sGvIZaLDXFWJoLRY/CktTHuEDNHf42NLq
 Er7gGHqoCtJDeXkYXW+u7GVki5eOJsmpzZ0ixg5Rb5Bh4Di3395SfVA2/OIq191WKwH/
 HtprjLdqPTNZht+mES0g9hPXxujAWMr59PnNbxchz6tYdZV9T/+ooXPVHWpDbG0KjZTe
 I39oEouT+LMHLMwRtCrcXQg6UXzyNKRfst6SwRpX0u7bUkDgBSRizgKp1grvi0cK10/I
 skNQxfDJ5xYPTwtr0L+yufGz49jqBmc2yEf3vPeIUg8QOW/rWyDVKMM0A7vtCOx3qlJq
 57NA==
X-Gm-Message-State: AOAM530nN/qQkUPh3F5u7v+4pkx5RdP5IURsvnsTFn79pNFad7O5d+n8
 wWtJ68WO+5Th4mMVAM5RUxw=
X-Google-Smtp-Source: ABdhPJylnuazDVZj2iK4boeojU/TXhUxQgIdAsgnBF4mie+ivrA5AKNot1+43BY8yzd2SvruOQvvUw==
X-Received: by 2002:a17:90a:4411:b0:1bc:99b0:acad with SMTP id
 s17-20020a17090a441100b001bc99b0acadmr13822702pjg.25.1646001617990; 
 Sun, 27 Feb 2022 14:40:17 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 z14-20020aa7888e000000b004e5c2c0b9dcsm10792579pfe.30.2022.02.27.14.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:40:17 -0800 (PST)
Message-ID: <086da51d-1ed3-2726-d3f1-b5984b33991d@gmail.com>
Date: Sun, 27 Feb 2022 23:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/22] isa: Resolve unneeded IRQ attributes from
 ISADevice
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22/2/22 20:34, Bernhard Beschow wrote:
> v2:
> The newly QOM'ified devices now report an error to the user in their realize
> functions if the configured IRQ number is greater than 15.
> 
> v1:
> The IRQ attributes of ISADevice are hardcoded to support up to two IRQs per
> device which creates an artificial limit. By not having the attributes in the
> first place, this limitation can be avoided altogether.
> 
> The IRQ attributes are mostly used for printing ('info qtree') and there is one
> user, hw/ppc/pnv, to use the attributes directly. As it turns out, the printing
> is redundant if the IRQ numbers are exposed as QOM properties and hw/ppc/pnv
> can be easily ported away.
> 
> The patch series is structured as follows: Patch 1-3 QOM'ify the last devices
> which rely on printing their IRQ numbers via the ISADevice attributes. Patch
> 4 and 5 remove the last users of the ISADevice attributes such that they can be
> removed in patch 6. The remainder of the patch series is cleanup.
> 
> Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq(). That is,
> the former function becomes redundant. All users are therefore converted to use
> isa_get_irq() directly. Finally, the last patch removes the now unused
> isa_init_irq().
> 
> 
> Bernhard Beschow (22):
>    hw/rtc/mc146818rtc: QOM'ify IRQ number
>    hw/rtc/m48t59-isa: QOM'ify IRQ number
>    hw/input/pckbd: QOM'ify IRQ numbers
>    hw/isa/isa-bus: Remove isabus_dev_print()
>    hw/ppc/pnv: Determine ns16550's IRQ number from QOM property
>    isa: Drop unused attributes from ISADevice
>    hw/audio/cs4231a: Disuse isa_init_irq()
>    hw/audio/gus: Disuse isa_init_irq()
>    hw/audio/sb16: Disuse isa_init_irq()
>    hw/block/fdc-isa: Disuse isa_init_irq()
>    hw/char/parallel: Disuse isa_init_irq()
>    hw/char/serial-isa: Disuse isa_init_irq()
>    hw/ide/isa: Disuse isa_init_irq()
>    hw/input/pckbd: Disuse isa_init_irq()
>    hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
>    hw/ipmi/isa_ipmi_kcs: Disuse isa_init_irq()
>    hw/isa/piix4: Disuse isa_init_irq()
>    hw/net/ne2000-isa: Disuse isa_init_irq()
>    hw/rtc/m48t59-isa: Disuse isa_init_irq()
>    hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
>    hw/isa/isa-bus: Disuse isa_init_irq()
>    isa: Remove unused isa_init_irq()

Series:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

