Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F5530694
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:36:30 +0200 (CEST)
Received: from localhost ([::1]:54920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsuBZ-0008AG-Bs
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsu9o-00072I-Qs; Sun, 22 May 2022 18:34:40 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsu9k-0007bK-5k; Sun, 22 May 2022 18:34:40 -0400
Received: by mail-pf1-x430.google.com with SMTP id c14so12165826pfn.2;
 Sun, 22 May 2022 15:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vgD49tBgA1o3bdYP/piVah1ryCYVvRbRi6jN9OL4Q8o=;
 b=LPD5mnYqo+/q0Sxm76Q7TCOVB19WZ093jA85leGdYva3cHAVj0x1zfzPBoBHfdjPhE
 FtTFdzWr71i9zBI8yoXc/N/OBYqs5N+k8yOBA/LyffEShVnWfQsgxYcu5YmkMwt31VZO
 qsSGX7jWuBLk9llbGjtQumn+mVAmJOZANJ3/0BZbJgd9zcYrv/nDXVEUI0HO//LJpdqs
 ldcJWKuH0bL1Sr7vnEjC3lMvMhoCD8RNysY3JIXcewln5JxJA7x0wV7Iws36i5JNpkG+
 K/8yC3Rk0Kbm3zTYkqx/LqCfglRbw28uTz4wHjkvy3iimAMu7ayMIf1ixOSqT+k+Nwqm
 iPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vgD49tBgA1o3bdYP/piVah1ryCYVvRbRi6jN9OL4Q8o=;
 b=tF5mZmiL3pdg2lAmDJlQiGZrhmDIhWcAFeTlnydrTkc9BEC3CymzAIto5yjZF0r4JF
 AcW2RYAasjR4c0X1NCj3NUs8CtPK6Q6C4efiX47vEOfgyW4Wp3Dr6fhbjXWodoJ2P0NI
 rhqfsOWzLn7PCyl2QAkDb95vTkJcjpYD1RlQt/cAd4iujIUkfT8mxO4VOZWh58Z5tKR+
 HQRX9vZ1sgeBrxewiEjoEzS2TA9viSzbyJxnd3pG8yqR6y+a1q8qBc4otwUYa739Mefr
 C364RcrPirAg5iqTYYAezAn3cAsXSR2Vbd2tsIoBQrEMhC+/ln/i6pdonH0Qz9SFZzZf
 Yj0g==
X-Gm-Message-State: AOAM531xhY9YeuzrmW6PMrlKFYCLLk75FmyH894WjfAKDyZbSMamgJ/B
 UjEveb0P7f2avLMI2qV0kTU=
X-Google-Smtp-Source: ABdhPJwUTScuRPCB/wgJyp6Wl1Au0HBhFzRoiFqnKkOjiv27qQjBwoNCVebt6lX6IcZnomzA/gG7LA==
X-Received: by 2002:a05:6a00:16cb:b0:517:c8ff:6ff6 with SMTP id
 l11-20020a056a0016cb00b00517c8ff6ff6mr20903007pfc.46.1653258874443; 
 Sun, 22 May 2022 15:34:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170902d50400b0015e8d4eb1dcsm3593464plg.38.2022.05.22.15.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:34:34 -0700 (PDT)
Message-ID: <e08e95b6-8fb6-2695-1cc3-13c232f05a14@amsat.org>
Date: Mon, 23 May 2022 00:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 0/6] QOM'ify PIIX southbridge creation
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220513175445.89616-1-shentey@gmail.com>
 <3b381726-1bf3-06b3-c989-6b0ee564b90f@ilande.co.uk>
In-Reply-To: <3b381726-1bf3-06b3-c989-6b0ee564b90f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 21/5/22 10:48, Mark Cave-Ayland wrote:
> On 13/05/2022 18:54, Bernhard Beschow wrote:

>> Bernhard Beschow (6):
>>    include/hw: Move TYPE_PIIX4_PCI_DEVICE to southbridge/piix.h
>>    hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
>>    hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
>>    hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
>>    hw/isa/piix4: Factor out SM bus initialization from create() function
>>    hw/isa/piix{3,4}: Inline and remove create() functions

> I've just reviewed these, and other than a couple of minor issues these 
> look good to me and definitely help to improve the code.
> 
> One thing reading over this patches has made me realise is that there is 
> quite a model violation here in that the PIIX3 and PIIX4 devices (which 
> are the PCI-ISA bridges) are actually setting the PCI host bridge 
> IRQs(!). What should happen is that the PCI bus IRQs and routing should 
> be done in the PCI host bridge, and gpios used in the PCI-ISA bridges to 
> pass them up. But that's definitely something outside the scope of these 
> improvements.

Yes. Do you mind opening a GitLab issue?


