Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8E661823
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 19:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEaPO-0002aA-9Y; Sun, 08 Jan 2023 13:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEaPL-0002Zj-91
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 13:28:36 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEaPJ-00037A-OD
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 13:28:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso7424092wms.5
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JSf56kuZbXFuU0TDUuaby7DeG6DcdwVQyAWljuI7f1E=;
 b=WvNRLQ0paetMs5iOKngIQ7P8LXGJ60vjWVLd1jjAWio70U3NT/Wp3sow7ZNBNg/hid
 BASMF5BAM6SvPMIVYoTwiG1YWAZX8LleQRRN9UtlI56T2qbC4fATlHBml8GSomir10Sb
 oAlKWmUbOuagP0jAxivmEkf0MLUApYawAxXysXhQlWLzm7KRQWyI98reigxwJCOldSOq
 Cy8CNyXAp/UfQ8A9aK9cAjnqqdZOGYrr2EqmPd2ATveDK36fOxyB5P3T6K4YxDZB7bBF
 vBrhDzgkem+oZsFQVq1rxancqX+jnWNfMASgDNfGSOEh/VQj6JSkpiCnmXq77tyNLwHg
 mx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSf56kuZbXFuU0TDUuaby7DeG6DcdwVQyAWljuI7f1E=;
 b=7YQTFY6yZ2E/xvEUlsy5ehuoH2msz1fL/pOyL4GWfpVH4Xmx9NgYhlAB6QWq5ByKzn
 V5wKg2wx4gHrFOoMuDEkIsv5x3th29Mg2eKIkOSN2Aqcmimncg5KeGQuxjaYm0Qd7cMh
 9TRR4rfosRRRGSzgSvXhrdAybDPF40viW4PqsBenkb4mEBs0FCIbrwIw0OjAoATY/rsS
 fY7egfuG2r/4hZSkfdqljtbyxSBmrmuoq5k9y+WjTq4zfMVBukC+j97N7K5eaC7U7Ekk
 jtnZIcQb7fJWoqKhc6dpP8Z/MD3gSEFhJzjp5m9Ce3ex8XPqfRvKLozRakvV83Kurvcb
 6tyg==
X-Gm-Message-State: AFqh2kq+MX2w0a5tgy5X5Yun/zV7wRHhGS8PqT+wE376kMrwwCK3Beb0
 JJRd7Gn9NeXgclYOlm6EwUceXA==
X-Google-Smtp-Source: AMrXdXtTFvVPweb7ETUBfgQOCMc0C0sQElAZC2fSAq2AfRM48Uf/NHudd8P+GAJGALxVY+/By97mHA==
X-Received: by 2002:a05:600c:250:b0:3d2:2043:9cbf with SMTP id
 16-20020a05600c025000b003d220439cbfmr43567119wmj.10.1673202510686; 
 Sun, 08 Jan 2023 10:28:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003d9b89a39b2sm9650222wms.10.2023.01.08.10.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 10:28:30 -0800 (PST)
Message-ID: <7f47fd16-8e87-32d0-9ae5-4b288930c24f@linaro.org>
Date: Sun, 8 Jan 2023 19:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 00/31] Consolidate PIIX south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <dcbda1fc-3380-a96b-78c7-b3b35dee5ac4@ilande.co.uk>
 <50FFD7E4-A40C-4428-ACD2-F7C93C687572@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <50FFD7E4-A40C-4428-ACD2-F7C93C687572@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 8/1/23 16:12, Bernhard Beschow wrote:
> Am 7. Januar 2023 23:57:32 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> On 05/01/2023 14:31, Bernhard Beschow wrote:

>>> Bernhard Beschow (28):
>>>     hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>     hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>     hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>>>       created
>>>     hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>>       south bridge
>>>     hw/i386/pc: Create RTC controllers in south bridges
>>>     hw/i386/pc: No need for rtc_state to be an out-parameter
>>>     hw/isa/piix3: Create USB controller in host device
>>>     hw/isa/piix3: Create power management controller in host device
>>>     hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>     hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>>>     hw/isa/piix3: Create ISA PIC in host device
>>>     hw/isa/piix3: Create IDE controller in host device
>>>     hw/isa/piix3: Wire up ACPI interrupt internally
>>>     hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>     hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>     hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>     hw/isa/piix3: Drop the "3" from PIIX base class
>>>     hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>     hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>     hw/isa/piix4: Use ISA PIC device
>>>     hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>     hw/isa/piix4: Rename reset control operations to match PIIX3
>>>     hw/isa/piix3: Merge hw/isa/piix4.c
>>>     hw/isa/piix: Harmonize names of reset control memory regions
>>>     hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>     hw/isa/piix: Rename functions to be shared for interrupt triggering
>>>     hw/isa/piix: Consolidate IRQ triggering
>>>     hw/isa/piix: Share PIIX3's base class with PIIX4

>> Phil - over to you!

Thanks for the review Mark!

> Shall I respin? I could integrate my PCI series into this one in order to avoid the outdated MIPS patches while still delivering a working series. Yes/No?

If you don't mind, that is certainly easier for me :)


