Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CEE4C47E4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:50:24 +0100 (CET)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbvL-00074X-3z
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNbKI-00056Y-0O; Fri, 25 Feb 2022 09:12:06 -0500
Received: from [2607:f8b0:4864:20::32d] (port=35651
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNbKD-0000xZ-OL; Fri, 25 Feb 2022 09:12:05 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so3694173otn.2; 
 Fri, 25 Feb 2022 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bVYqaHk5KELrcWqSPkCg5uIkgs5z3xGwOD9sgTLh9KM=;
 b=UtPktWbIHoabOFF3fFZiXF2qyJX6ns5u7RVV2oYBGwcm2BmuiocxXs3r82DKQ2oJU9
 +l57nYNDxkDWNyLx4LsJEN0Q5nKMZcfuSLrjgAfog/mAcqiS8Ej/29VkRo7aavDiIlcF
 aj1CxbiXGywClNZn8iX28R2+CxAX5jMYvfLcsqxXTcM7mtkfRo8bsLeBxKuEGp6jUptt
 SPs8ppYVE/6A1IOsLQWsCGC64Wmm2ko+rCWRaFMImAEQzDsFCk+PipU+nvl2xTtP19yl
 sOVGREdFpjT9zH8bi9ZJM/J8lzN/0d9ktrRe5azQ/kpKTHMGHlVT6HjhCrW+cUXvNhsj
 4iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bVYqaHk5KELrcWqSPkCg5uIkgs5z3xGwOD9sgTLh9KM=;
 b=dLT5Ogg3K/0z/iYkododslHjUbUShYrx9EEtUb+IlBXCaRZAVDIxlSxFSKOe1N7Zfo
 F83Z3cIIOZHhRG5GSdGs4fg3DBlUln35p5fsbnt9XG9WWNL+nerlHlgYbTIjkXysdagR
 NYLUSA+aKw0NSy30S6CrCa03MTzLgvvmfU7uoQohJCRcW2SW9ulRhfK92CHr77gu6POV
 p32DobD6IIHPXeFWjGA+SK56XP4wENBbmSdAkBcqFagyjhpjVSNpgBRcRDfpkToAxl/l
 qtJrTeAdAeokDgIhbEwwI1WHOJCUz8m84Jqj8/SJ6AVUmKS0oGaa9SSXiM4ePEZJxcux
 Ot0A==
X-Gm-Message-State: AOAM530wT1hXAPgiNjlSw4KyaZFISdqS/YnA5DFOXv3IVQ4ayXPDVIuW
 szK5G7r48ddc+hfW3F6u1sg=
X-Google-Smtp-Source: ABdhPJwKeWAC/8qCMVJwFHIRCnKhYweP9jBvRG3p/ssYAklItN9MvVqryc7RbJ4JiiADAgOUrFgNYw==
X-Received: by 2002:a05:6830:118e:b0:5af:a7b:a03f with SMTP id
 u14-20020a056830118e00b005af0a7ba03fmr2730643otq.123.1645798320253; 
 Fri, 25 Feb 2022 06:12:00 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a4a91dd000000b002df9015e234sm1096393ooh.41.2022.02.25.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 06:11:59 -0800 (PST)
Message-ID: <5c2a720b-b792-0871-0bc4-d0a99448d81c@gmail.com>
Date: Fri, 25 Feb 2022 11:11:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 08/18] ppc/psi: Add support for StoreEOI and 64k ESB
 pages (POWER10)
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-9-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-9-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/26/21 08:53, Cédric Le Goater wrote:
> POWER10 adds support for StoreEOI operation and 64K ESB pages on PSIHB
> to be consistent with the other interrupt sources of the system.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/pnv.c     |  6 ++++++
>   hw/ppc/pnv_psi.c | 30 ++++++++++++++++++++++++------
>   2 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d510d2e1d917..96c908c753cb 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1526,6 +1526,9 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
>       /* Processor Service Interface (PSI) Host Bridge */
>       object_property_set_int(OBJECT(&chip9->psi), "bar", PNV9_PSIHB_BASE(chip),
>                               &error_fatal);
> +    /* This is the only device with 4k ESB pages */
> +    object_property_set_int(OBJECT(&chip9->psi), "shift", XIVE_ESB_4K,
> +                            &error_fatal);
>       if (!qdev_realize(DEVICE(&chip9->psi), NULL, errp)) {
>           return;
>       }
> @@ -1768,6 +1771,9 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>       /* Processor Service Interface (PSI) Host Bridge */
>       object_property_set_int(OBJECT(&chip10->psi), "bar",
>                               PNV10_PSIHB_BASE(chip), &error_fatal);
> +    /* PSI can now be configured to use 64k ESB pages on POWER10 */
> +    object_property_set_int(OBJECT(&chip10->psi), "shift", XIVE_ESB_64K,
> +                            &error_fatal);
>       if (!qdev_realize(DEVICE(&chip10->psi), NULL, errp)) {
>           return;
>       }
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index cd9a2c5952a6..737486046d5a 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -601,7 +601,6 @@ static const TypeInfo pnv_psi_power8_info = {
>   #define   PSIHB9_IRQ_METHOD             PPC_BIT(0)
>   #define   PSIHB9_IRQ_RESET              PPC_BIT(1)
>   #define PSIHB9_ESB_CI_BASE              0x60
> -#define   PSIHB9_ESB_CI_64K             PPC_BIT(1)
>   #define   PSIHB9_ESB_CI_ADDR_MASK       PPC_BITMASK(8, 47)
>   #define   PSIHB9_ESB_CI_VALID           PPC_BIT(63)
>   #define PSIHB9_ESB_NOTIF_ADDR           0x68
> @@ -646,6 +645,14 @@ static const TypeInfo pnv_psi_power8_info = {
>   #define   PSIHB9_IRQ_STAT_DIO           PPC_BIT(12)
>   #define   PSIHB9_IRQ_STAT_PSU           PPC_BIT(13)
>   
> +/* P10 register extensions */
> +
> +#define PSIHB10_CR                       PSIHB9_CR
> +#define    PSIHB10_CR_STORE_EOI          PPC_BIT(12)
> +
> +#define PSIHB10_ESB_CI_BASE              PSIHB9_ESB_CI_BASE
> +#define   PSIHB10_ESB_CI_64K             PPC_BIT(1)
> +
>   static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
>   {
>       PnvPsi *psi = PNV_PSI(xf);
> @@ -704,6 +711,13 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr addr,
>   
>       switch (addr) {
>       case PSIHB9_CR:
> +        if (val & PSIHB10_CR_STORE_EOI) {
> +            psi9->source.esb_flags |= XIVE_SRC_STORE_EOI;
> +        } else {
> +            psi9->source.esb_flags &= ~XIVE_SRC_STORE_EOI;
> +        }
> +        break;
> +
>       case PSIHB9_SEMR:
>           /* FSP stuff */
>           break;
> @@ -715,15 +729,20 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr addr,
>           break;
>   
>       case PSIHB9_ESB_CI_BASE:
> +        if (val & PSIHB10_ESB_CI_64K) {
> +            psi9->source.esb_shift = XIVE_ESB_64K;
> +        } else {
> +            psi9->source.esb_shift = XIVE_ESB_4K;
> +        }
>           if (!(val & PSIHB9_ESB_CI_VALID)) {
>               if (psi->regs[reg] & PSIHB9_ESB_CI_VALID) {
>                   memory_region_del_subregion(sysmem, &psi9->source.esb_mmio);
>               }
>           } else {
>               if (!(psi->regs[reg] & PSIHB9_ESB_CI_VALID)) {
> -                memory_region_add_subregion(sysmem,
> -                                        val & ~PSIHB9_ESB_CI_VALID,
> -                                        &psi9->source.esb_mmio);
> +                hwaddr addr = val & ~(PSIHB9_ESB_CI_VALID | PSIHB10_ESB_CI_64K);
> +                memory_region_add_subregion(sysmem, addr,
> +                                            &psi9->source.esb_mmio);
>               }
>           }
>           psi->regs[reg] = val;
> @@ -831,6 +850,7 @@ static void pnv_psi_power9_instance_init(Object *obj)
>       Pnv9Psi *psi = PNV9_PSI(obj);
>   
>       object_initialize_child(obj, "source", &psi->source, TYPE_XIVE_SOURCE);
> +    object_property_add_alias(obj, "shift", OBJECT(&psi->source), "shift");
>   }
>   
>   static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
> @@ -839,8 +859,6 @@ static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
>       XiveSource *xsrc = &PNV9_PSI(psi)->source;
>       int i;
>   
> -    /* This is the only device with 4k ESB pages */
> -    object_property_set_int(OBJECT(xsrc), "shift", XIVE_ESB_4K, &error_fatal);
>       object_property_set_int(OBJECT(xsrc), "nr-irqs", PSIHB9_NUM_IRQS,
>                               &error_fatal);
>       object_property_set_link(OBJECT(xsrc), "xive", OBJECT(psi), &error_abort);

