Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF221466982
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:57:48 +0100 (CET)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqL5-0001dF-QG
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:57:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqDU-0007Kw-0X; Thu, 02 Dec 2021 12:49:56 -0500
Received: from [2607:f8b0:4864:20::f31] (port=34344
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqDK-0004YL-Fb; Thu, 02 Dec 2021 12:49:55 -0500
Received: by mail-qv1-xf31.google.com with SMTP id i13so240314qvm.1;
 Thu, 02 Dec 2021 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H8nMmALg+JnfQxfZq8ZSOGPpkiqGdKng0ABvZKIgq/g=;
 b=ZD9Wq/kTPI4NRx/mC9Te8t0WKDPemaXI1CtoMTkk9CS2J9F94GS1Qbeg+qNc6fcaLJ
 cCOzYwJvW479GtCOcEC4WmgQznCYDqDMTBCIqeomBUfDtr1P1njpqmgzBqkTZGxoZHEQ
 4CEr+0WO5oiziBvZtGDSQGv9Jvr/yFnmkSAQtQtO7hPaYnDyvUzEFHgd9LLF37Rm0VCX
 +/qWiL+dvWJX2bCX96zybb230CM7j+WNqCrEuBIGfOApvLnKN5PIP3yFO8j14QQ4RKoi
 em4iPGTy1536XV4ocgOplfhuGdjUcRGg1OW3IIHk+pXPbmhlQF5a7INNbwOp9hxMBAkf
 ubtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H8nMmALg+JnfQxfZq8ZSOGPpkiqGdKng0ABvZKIgq/g=;
 b=4kLkvVlFyd8ty+XmC4NUW48E0pWdphl0RkUnaZoJwa7T9fVeqnkPAJ/NrzzF5/RYmQ
 FNdeJHQfKpYQzP8zgOjC5OpOJXrqo2b7RruZYFlodajlpV8l3Q/Ag8wad3+RZC7K0GR/
 ePsCdwHpY3jYNe4EG3eIAV+FdKB+d9YbhSOARJTmUhAg0Olrs5gFDnJJ9OFk3goledec
 /AlM9gvYvF49KN6QHHTIFxvQOuE9tG8kaBLRwhZNV80nW3dyoEJ+tVzvl2qshnDCZ56R
 ULN+F1mzQud7pFKTh9likFc94tBWHgFD6l8/JBbFEEXYFYkIKYCqSzV49D5zjbJ6hxO6
 ki0g==
X-Gm-Message-State: AOAM532b00s0B1so2v7IGuQ3E36JK/o2YVK8thxV3sY6ItrSbw9uU+t7
 mIR3OuzpZShLPvVVJXKM9No=
X-Google-Smtp-Source: ABdhPJxBj9M+sGSBfR4LzYOgJUuWqOhvloUPcNkWKxygKLI2wEblPPM8RaT7kB709eet1tjYFVftdw==
X-Received: by 2002:a05:6214:c6f:: with SMTP id
 t15mr14414169qvj.6.1638467385360; 
 Thu, 02 Dec 2021 09:49:45 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id i14sm366512qko.9.2021.12.02.09.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:49:45 -0800 (PST)
Message-ID: <1192aade-4158-103f-abd8-5ce20153373b@gmail.com>
Date: Thu, 2 Dec 2021 14:49:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 14/14] ppc/pnv: Introduce support for user created PHB4
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-15-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-15-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> PHB4 devices and PCI devices can now be added to the powernv9 machine
> using:
> 
>    -device pnv-phb4-pec,chip-id=0,index=0
>    -device nec-usb-xhci,bus=pci.0,addr=0x0
> 
> In case of user created devices, a lookup on 'chip-id' is required to
> assign the owning chip.
> 
> To be noted, that the PEC PHB4 devices can add more than one PHB4
> devices:
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 9b081d543057..4ee92f11945c 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -394,6 +394,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       char name[64];
>       int i;
>   
> +    /* User created devices */
> +    if (!pec->chip) {
> +        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +
> +        pec->chip = pnv_get_chip(pnv, pec->chip_id);
> +        if (!pec->chip) {
> +            error_setg(errp, "invalid chip id: %d", pec->chip_id);
> +            return;
> +        }
> +    }
> +
>       if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
>           error_setg(errp, "invalid PEC index: %d", pec->index);
>           return;
> @@ -401,6 +412,12 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   
>       pec->num_stacks = pecc->num_stacks[pec->index];
>   
> +    /*
> +     * Reparent user created devices to the chip to build correctly
> +     * the device tree.
> +     */
> +    pnv_chip_parent_fixup(pec->chip, OBJECT(pec), pec->index);
> +
>       /* Create stacks */
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
> @@ -516,7 +533,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>   
>       dc->realize = pnv_pec_realize;
>       device_class_set_props(dc, pnv_pec_properties);
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   
>       pecc->xscom_nest_base = pnv_pec_xscom_nest_base;
>       pecc->xscom_pci_base  = pnv_pec_xscom_pci_base;
> 

