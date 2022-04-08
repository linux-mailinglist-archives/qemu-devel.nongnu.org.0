Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3EC4F9F05
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 23:15:05 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncvwd-0001c5-8B
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 17:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncvuv-0008De-1z; Fri, 08 Apr 2022 17:13:18 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncvut-0001xa-GR; Fri, 08 Apr 2022 17:13:16 -0400
Received: by mail-oi1-x231.google.com with SMTP id z8so10108302oix.3;
 Fri, 08 Apr 2022 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1BdPzZElQC9z5v1myUJ3gCo55H313+UAeS06U1sEJCs=;
 b=P7FurvtgjzIqSa3GHlSsYgm/9mejuwepJrn5+rhULAz3mF7JIwI62QfNXOPgoshBA9
 G1VplgEjtUFdlOsF7IRMamwyHoV0g2kETFcR9a613SUzznXe59hgnDYeWqNqQyh9G5B1
 xEp+dgWvlkYkA1kBwzck8c1QAdlrm8MFIjCqlwKrrPZ6eua5YXFAf88je3jXT000qcYo
 iebQdB4Iw6GQuVeFqfbBoRDC44J82fjPgWlwq4Feh4c4tLHqp9UT7ldQTjlADYehtPn3
 bK//igJ4y37gkS05QxUANWia9RLvD51bpaSSoVZaKzoGHuY0N/iH5sOsr+5yxo2uEEvK
 loxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1BdPzZElQC9z5v1myUJ3gCo55H313+UAeS06U1sEJCs=;
 b=djPEQzGHY/RrEMaACaQ6IRKSj5h2xOT3Dfo/MgXAXgIYIocg9RW6f/QumB/xYQsV6E
 xepTM61Hd9baeeTo0g4LOUZ2Csv8E+sk3Mn+iLpsWeOEMIg2NxsGnZJPGvhHUcHH1hBa
 u5o/6h3gKQg8eKlXrk+4hE3DS4hAHyXsGzTP2lRihul/NUS7bdncsU1tXcJo6lSLEUUQ
 f/8xtZtiAsahnx8MoZEx8RirCdytFvW1FkogkXH8Sk11SDzlu9FvYrVp9DeOsVEuSaf1
 45fH/beJ6RMMq8fP+0HarI3Vt96oQvH2ACJEbZXk7nP0K+M3eJA6bRP0jV6Oix0q1hVM
 okhQ==
X-Gm-Message-State: AOAM532ny9qpm9aBSYbjskL5VFS5AThK4ZPR/yOZq04yOQqbdzbptAoX
 Nu7y3FQ2c86PlZxxCWWGTkw=
X-Google-Smtp-Source: ABdhPJwHu1ql0fz1WGfbIeWngZDTmusGI6sD4+83lkD3dYI8CQkq1VS5jtJ3KxLLg9Qct/2uCGXwGg==
X-Received: by 2002:a05:6808:d4c:b0:2f8:d0d2:d06c with SMTP id
 w12-20020a0568080d4c00b002f8d0d2d06cmr782794oik.285.1649452392948; 
 Fri, 08 Apr 2022 14:13:12 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056871078700b000e29ff467dcsm612187oap.50.2022.04.08.14.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 14:13:12 -0700 (PDT)
Message-ID: <b9d7c268-c7bf-a383-5dfd-eba109ff8d38@gmail.com>
Date: Fri, 8 Apr 2022 18:13:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] ppc/pnv: Remove LSI on the PCIE host bridge
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220408131303.147840-1-fbarrat@linux.ibm.com>
 <20220408131303.147840-3-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220408131303.147840-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 4/8/22 10:13, Frederic Barrat wrote:
> The phb3/phb4/phb5 root ports inherit from the default PCIE root port
> implementation, which requests a LSI interrupt (#INTA). On real
> hardware (POWER8/POWER9/POWER10), there is no such LSI. This patch
> corrects it so that it matches the hardware.
> 
> As a consequence, the device tree previously generated was bogus, as
> the root bridge LSI was not properly mapped. On some
> implementation (powernv9), it was leading to inconsistent interrupt
> controller (xive) data. With this patch, it is now clean.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb3.c | 1 +
>   hw/pci-host/pnv_phb4.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 6e9aa9d6ac..6a884833a8 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1162,6 +1162,7 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>           error_propagate(errp, local_err);
>           return;
>       }
> +    pci_config_set_interrupt_pin(pci->config, 0);
>   }
>   
>   static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 11c97e27eb..dd81e940b7 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1772,6 +1772,7 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
>       pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
>       pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
>       pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
> +    pci_config_set_interrupt_pin(conf, 0);
>   }
>   
>   static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)

