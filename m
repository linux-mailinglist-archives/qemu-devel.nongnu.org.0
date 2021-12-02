Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB23466945
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:39:35 +0100 (CET)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msq3R-0003G0-Ro
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspz1-0007jA-1M; Thu, 02 Dec 2021 12:34:59 -0500
Received: from [2607:f8b0:4864:20::82a] (port=42586
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspyx-0004xu-LK; Thu, 02 Dec 2021 12:34:58 -0500
Received: by mail-qt1-x82a.google.com with SMTP id z9so463888qtj.9;
 Thu, 02 Dec 2021 09:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G24gP7XQuC6M8aC6N1geimOFNAiPqJ/ptBYX7ZRUBsk=;
 b=l0jKF8ImsAGQ0b5bfQ6lgQJtBsTQ7L22SHZoNkGt+o76kR404/VbTxIhrTA2Fu62kD
 ueuwEF6WJ/VaboFRwLb5SOHRbeviFJ5KumRqealuZGOjn0PaaR6VDVWQY7J7WiMb20No
 dblupevtrCfgHvC3WoME+/tDi1VttFMlBppw+Qf5sW5z+FrgAemowjX1j70SJ0jk8xd+
 WgiYlyqXT21U/MM/80uWOjgdRuBA3De2g6V8OYi8t8fzdSxH8SCo9VMa/hk1xW1N/iYP
 mj67sLPC8k4mnBnFJ/+XxjLGpod27M++YqoerqFjkw88ZvznFs+VghdiQDYXR8LeVgXI
 tQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G24gP7XQuC6M8aC6N1geimOFNAiPqJ/ptBYX7ZRUBsk=;
 b=ZQZ9ndojCXufYliM15F6/WO9sdc071noByPWxQ2uThUkSdUiG79g4N0IEd7GsjZDrg
 0Y44rQoFwBlOxZFPuMBn8+hyO4VfJgyfkZpmBoS1D04dnaEnTPMGVhGHRJbxgSkBujtz
 LIANouoC4LM838sVEE3xvMEf6kQUjILA8rziBotY+Ga0MKkv7bJS5kAjN23Z/q8OQdHF
 m/b5X/Rhmjy+B5K2nqPsVIC+R0IC6tZ+r0DVIg5d+CVVvc0VAkZxJOeC5uH07SOUMPfH
 zzTMpexrkXPd5S/QoBaVWEAUtmCkM3vJW2+yQz73nN2N1TBRiu2OLw/ZfSmoBQbMdgHr
 yApw==
X-Gm-Message-State: AOAM530vfxaU+r3ubdk4ngoTHcNAFmNmlx04d1giAfSrf+kEFGxDfN9o
 tL6Vk0maujDsC7i9bTziPVTgPbHVuAQ=
X-Google-Smtp-Source: ABdhPJxtsrQkYwbKnceDiHz9lmvKP+ehKZrH2JkgotqOktVR3Wcr0eDxoPcbqKyATDLPclMA/LsQ9w==
X-Received: by 2002:ac8:610b:: with SMTP id a11mr15060236qtm.182.1638466493554; 
 Thu, 02 Dec 2021 09:34:53 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id h3sm366118qko.78.2021.12.02.09.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:34:53 -0800 (PST)
Message-ID: <74b438b4-3800-7266-18ba-6b9ab9a9add4@gmail.com>
Date: Thu, 2 Dec 2021 14:34:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/14] ppc/pnv: Introduce a num_pecs class attribute for
 PHB4 PEC devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-8-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82a.google.com
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
> POWER9 processor comes with 3 PHB4 PECs (PCI Express Controller) and
> each PEC can have several PHBs :
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> A num_pecs class attribute represents better the logic units of the
> POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
> This will ease adding support for user created devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/pnv.h |  2 ++
>   hw/ppc/pnv.c         | 20 +++++++++-----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 247379ef1f88..f2c238062f4a 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -53,6 +53,7 @@ struct PnvChip {
>       PnvCore      **cores;
>   
>       uint32_t     num_phbs;
> +    uint32_t     num_pecs;
>   
>       MemoryRegion xscom_mmio;
>       MemoryRegion xscom;
> @@ -136,6 +137,7 @@ struct PnvChipClass {
>       uint64_t     chip_cfam_id;
>       uint64_t     cores_mask;
>       uint32_t     num_phbs;
> +    uint32_t     num_pecs;
>   
>       DeviceRealize parent_realize;
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 45d8ecbf2bf7..185464a1d443 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -658,7 +658,7 @@ static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
>       pnv_xive_pic_print_info(&chip9->xive, mon);
>       pnv_psi_pic_print_info(&chip9->psi, mon);
>   
> -    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
> +    for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
>           for (j = 0; j < pec->num_stacks; j++) {
>               pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
> @@ -1330,15 +1330,14 @@ static void pnv_chip_power9_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER);
>   
> -    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
> +    if (defaults_enabled()) {
> +        chip->num_pecs = pcc->num_pecs;
> +    }
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
>           object_initialize_child(obj, "pec[*]", &chip9->pecs[i],
>                                   TYPE_PNV_PHB4_PEC);
>       }
> -
> -    /*
> -     * Number of PHBs is the chip default
> -     */
> -    chip->num_phbs = pcc->num_phbs;
>   }
>   
>   static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
> @@ -1374,7 +1373,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>       int i, j;
>       int phb_id = 0;
>   
> -    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
> +    for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
>           PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>           uint32_t pec_nest_base;
> @@ -1402,8 +1401,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
>   
> -        for (j = 0; j < pec->num_stacks && phb_id < chip->num_phbs;
> -             j++, phb_id++) {
> +        for (j = 0; j < pec->num_stacks; j++, phb_id++) {
>               PnvPhb4PecStack *stack = &pec->stacks[j];
>               Object *obj = OBJECT(&stack->phb);
>   
> @@ -1559,7 +1557,7 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
>       k->xscom_core_base = pnv_chip_power9_xscom_core_base;
>       k->xscom_pcba = pnv_chip_power9_xscom_pcba;
>       dc->desc = "PowerNV Chip POWER9";
> -    k->num_phbs = 6;
> +    k->num_pecs = PNV9_CHIP_MAX_PEC;
>   
>       device_class_set_parent_realize(dc, pnv_chip_power9_realize,
>                                       &k->parent_realize);
> 

