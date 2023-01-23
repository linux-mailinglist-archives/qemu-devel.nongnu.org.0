Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C39D677799
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 10:46:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtNo-0003np-Mb; Mon, 23 Jan 2023 04:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJtNn-0003nh-E4
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:44:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJtNl-0002al-8E
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:44:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so10169573wmb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 01:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Eb7Mc53r5PP4aCCndo0bGrV/P36fpq6XLrv0U0ZBTA=;
 b=yI2oDFChgUsp1B+tQHyTq36Kz75xKeEGVJSpG+vAhKtgWmIbZ67pZ2qRIRqq7qDbiY
 +rJ9Dgvhm4YPgDzGA82zBRmsT6N39cJHNK4js3SfRTXJlnzldK2L7fPjh6mnIkCHMgOm
 xbo6iyjWWHo4fj1hOtwhzbUo9EYYm7mGwhSOspON/WgRfASmmSeTsNvO32nl8vyTsyzI
 OwaoMabcJur74a+kuewRMHJEHRM8ErlSLn4jkywf6eOwFFFGaxGxQ8/HDtzC3XWGEsP8
 Da9hDWVKquy1zGkKccD23r6hnusaz2zcgXMlz20teu2IHXqpdhN+YoPuDcvOauh/mqpT
 iuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Eb7Mc53r5PP4aCCndo0bGrV/P36fpq6XLrv0U0ZBTA=;
 b=b0zyHaIx9VFEsH+WXOrtOxnW4eafP16Au/mC8KeLLzBOG/jmJqjZSjzoi91hycCjYQ
 tR9rAYwS2B2frK5ZubPHykueHuT8cZym9RPPEwRJpZtuR4db4NcKbKnM4wg7CwAsoI5w
 pYDC0OjXGxWmYo4HpvDLnT5FutQMTB37VaeTkfRbUlMi/qjQynnEZPb5yQvvSXZy0nDX
 ynLOZZusUXUuJlLDjW0huf8WpG98QXV2M6A8LZqkbNtilKP90yHbec2CmL5JfMJ7RVC9
 Ot7r5PN5glHgOmojNpEMhtiQ871ATlK+CKdBMh5WuvXB/qp/OcsJWnbcnlBtfEflG9nj
 xFfA==
X-Gm-Message-State: AFqh2kpSJApuEBj3jRDG3x+Qn6AP5O0s4u/mYJITQ5WF4rTgZmy+6BH7
 efQvc6TgZcJ1sqlnhq/ZTVQLQg==
X-Google-Smtp-Source: AMrXdXsy3OZSKT4RDIatMhggLReSYbgBIaH1uq3yCwhfSYzx2ATRCaM64lqNccvBF/64yMOV4RrS2g==
X-Received: by 2002:a05:600c:33a8:b0:3d9:ed3b:5b3e with SMTP id
 o40-20020a05600c33a800b003d9ed3b5b3emr22329554wmp.19.1674467091615; 
 Mon, 23 Jan 2023 01:44:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bca49000000b003c65c9a36dfsm9982923wml.48.2023.01.23.01.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:44:51 -0800 (PST)
Message-ID: <d8106f3d-ee31-ca51-40ba-4329238851de@linaro.org>
Date: Mon, 23 Jan 2023 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 09/12] include/hw/ppc: Split pnv_chip.h off pnv.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230120070122.3982588-1-armbru@redhat.com>
 <20230120070122.3982588-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120070122.3982588-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

Hi Markus,

On 20/1/23 08:01, Markus Armbruster wrote:
> PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip are defined
> in pnv.h.  Many users of the header don't actually need them.  One
> instance is this inclusion loop: hw/ppc/pnv_homer.h includes
> hw/ppc/pnv.h for typedef PnvChip, and vice versa for struct PnvHomer.
> 
> Similar structs live in their own headers: PnvHomerClass and PnvHomer
> in pnv_homer.h, PnvLpcClass and PnvLpcController in pci_lpc.h,
> PnvPsiClass, PnvPsi, Pnv8Psi, Pnv9Psi, Pnv10Psi in pnv_psi.h, ...
> 
> Move PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip to new
> pnv_chip.h, and adjust include directives.  This breaks the inclusion
> loop mentioned above.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Message-Id: <20221222104628.659681-2-armbru@redhat.com>
> ---
>   include/hw/ppc/pnv.h       | 143 +-----------------------------------
>   include/hw/ppc/pnv_chip.h  | 147 +++++++++++++++++++++++++++++++++++++
>   hw/intc/pnv_xive.c         |   1 +
>   hw/intc/pnv_xive2.c        |   1 +
>   hw/pci-host/pnv_phb3.c     |   1 +
>   hw/pci-host/pnv_phb4_pec.c |   1 +
>   hw/ppc/pnv.c               |   3 +
>   hw/ppc/pnv_core.c          |   1 +
>   hw/ppc/pnv_homer.c         |   1 +
>   hw/ppc/pnv_lpc.c           |   1 +
>   hw/ppc/pnv_xscom.c         |   1 +
>   11 files changed, 160 insertions(+), 141 deletions(-)
>   create mode 100644 include/hw/ppc/pnv_chip.h
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 9ef7e2d0dc..ca49e4281d 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -20,158 +20,19 @@
>   #ifndef PPC_PNV_H
>   #define PPC_PNV_H
>   
> +#include "cpu.h"

Why is "cpu.h" required here? For pnv_chip_find_cpu()?

Isn't "target/ppc/cpu-qom.h" enough?

>   #include "hw/boards.h"
>   #include "hw/sysbus.h"
>   #include "hw/ipmi/ipmi.h"
> -#include "hw/ppc/pnv_lpc.h"
>   #include "hw/ppc/pnv_pnor.h"
> -#include "hw/ppc/pnv_psi.h"
> -#include "hw/ppc/pnv_occ.h"
> -#include "hw/ppc/pnv_sbe.h"
> -#include "hw/ppc/pnv_homer.h"
> -#include "hw/ppc/pnv_xive.h"
> -#include "hw/ppc/pnv_core.h"
> -#include "hw/pci-host/pnv_phb3.h"
> -#include "hw/pci-host/pnv_phb4.h"
>   #include "hw/pci-host/pnv_phb.h"
> -#include "qom/object.h"
>   
>   #define TYPE_PNV_CHIP "pnv-chip"
> -OBJECT_DECLARE_TYPE(PnvChip, PnvChipClass,
> -                    PNV_CHIP)
>   
> -struct PnvChip {
> -    /*< private >*/
> -    SysBusDevice parent_obj;
> -
> -    /*< public >*/
> -    uint32_t     chip_id;
> -    uint64_t     ram_start;
> -    uint64_t     ram_size;
> -
> -    uint32_t     nr_cores;
> -    uint32_t     nr_threads;
> -    uint64_t     cores_mask;
> -    PnvCore      **cores;
> -
> -    uint32_t     num_pecs;
> -
> -    MemoryRegion xscom_mmio;
> -    MemoryRegion xscom;
> -    AddressSpace xscom_as;
> -
> -    MemoryRegion *fw_mr;
> -    gchar        *dt_isa_nodename;
> -};
> -
> -#define TYPE_PNV8_CHIP "pnv8-chip"
> +typedef struct PnvChip PnvChip;
>   typedef struct Pnv8Chip Pnv8Chip;
> -DECLARE_INSTANCE_CHECKER(Pnv8Chip, PNV8_CHIP,
> -                         TYPE_PNV8_CHIP)
> -
> -struct Pnv8Chip {
> -    /*< private >*/
> -    PnvChip      parent_obj;
> -
> -    /*< public >*/
> -    MemoryRegion icp_mmio;
> -
> -    PnvLpcController lpc;
> -    Pnv8Psi      psi;
> -    PnvOCC       occ;
> -    PnvHomer     homer;
> -
> -#define PNV8_CHIP_PHB3_MAX 4
> -    /*
> -     * The array is used to allow quick access to the phbs by
> -     * pnv_ics_get_child() and pnv_ics_resend_child().
> -     */
> -    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
> -    uint32_t     num_phbs;
> -
> -    XICSFabric    *xics;
> -};
> -
> -#define TYPE_PNV9_CHIP "pnv9-chip"
>   typedef struct Pnv9Chip Pnv9Chip;
> -DECLARE_INSTANCE_CHECKER(Pnv9Chip, PNV9_CHIP,
> -                         TYPE_PNV9_CHIP)
> -
> -struct Pnv9Chip {
> -    /*< private >*/
> -    PnvChip      parent_obj;
> -
> -    /*< public >*/
> -    PnvXive      xive;
> -    Pnv9Psi      psi;
> -    PnvLpcController lpc;
> -    PnvOCC       occ;
> -    PnvSBE       sbe;
> -    PnvHomer     homer;
> -
> -    uint32_t     nr_quads;
> -    PnvQuad      *quads;
> -
> -#define PNV9_CHIP_MAX_PEC 3
> -    PnvPhb4PecState pecs[PNV9_CHIP_MAX_PEC];
> -};
> -
> -/*
> - * A SMT8 fused core is a pair of SMT4 cores.
> - */
> -#define PNV9_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> -#define PNV9_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
> -
> -#define TYPE_PNV10_CHIP "pnv10-chip"
>   typedef struct Pnv10Chip Pnv10Chip;
> -DECLARE_INSTANCE_CHECKER(Pnv10Chip, PNV10_CHIP,
> -                         TYPE_PNV10_CHIP)
> -
> -struct Pnv10Chip {
> -    /*< private >*/
> -    PnvChip      parent_obj;
> -
> -    /*< public >*/
> -    PnvXive2     xive;
> -    Pnv9Psi      psi;
> -    PnvLpcController lpc;
> -    PnvOCC       occ;
> -    PnvSBE       sbe;
> -    PnvHomer     homer;
> -
> -    uint32_t     nr_quads;
> -    PnvQuad      *quads;
> -
> -#define PNV10_CHIP_MAX_PEC 2
> -    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
> -};
> -
> -#define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> -#define PNV10_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
> -
> -struct PnvChipClass {
> -    /*< private >*/
> -    SysBusDeviceClass parent_class;
> -
> -    /*< public >*/
> -    uint64_t     chip_cfam_id;
> -    uint64_t     cores_mask;
> -    uint32_t     num_pecs;
> -    uint32_t     num_phbs;
> -
> -    DeviceRealize parent_realize;
> -
> -    uint32_t (*core_pir)(PnvChip *chip, uint32_t core_id);
> -    void (*intc_create)(PnvChip *chip, PowerPCCPU *cpu, Error **errp);
> -    void (*intc_reset)(PnvChip *chip, PowerPCCPU *cpu);
> -    void (*intc_destroy)(PnvChip *chip, PowerPCCPU *cpu);
> -    void (*intc_print_info)(PnvChip *chip, PowerPCCPU *cpu, Monitor *mon);
> -    ISABus *(*isa_create)(PnvChip *chip, Error **errp);
> -    void (*dt_populate)(PnvChip *chip, void *fdt);
> -    void (*pic_print_info)(PnvChip *chip, Monitor *mon);
> -    uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
> -    uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
> -};
>   
>   #define PNV_CHIP_TYPE_SUFFIX "-" TYPE_PNV_CHIP
>   #define PNV_CHIP_TYPE_NAME(cpu_model) cpu_model PNV_CHIP_TYPE_SUFFIX
> diff --git a/include/hw/ppc/pnv_chip.h b/include/hw/ppc/pnv_chip.h
> new file mode 100644
> index 0000000000..53e1d921d7
> --- /dev/null
> +++ b/include/hw/ppc/pnv_chip.h
> @@ -0,0 +1,147 @@
> +#ifndef PPC_PNV_CHIP_H
> +#define PPC_PNV_CHIP_H
> +
> +#include "hw/pci-host/pnv_phb4.h"
> +#include "hw/ppc/pnv_core.h"
> +#include "hw/ppc/pnv_homer.h"
> +#include "hw/ppc/pnv_lpc.h"
> +#include "hw/ppc/pnv_occ.h"
> +#include "hw/ppc/pnv_psi.h"
> +#include "hw/ppc/pnv_sbe.h"
> +#include "hw/ppc/pnv_xive.h"
> +#include "hw/sysbus.h"
> +
> +OBJECT_DECLARE_TYPE(PnvChip, PnvChipClass,
> +                    PNV_CHIP)
> +
> +struct PnvChip {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    uint32_t     chip_id;
> +    uint64_t     ram_start;
> +    uint64_t     ram_size;
> +
> +    uint32_t     nr_cores;
> +    uint32_t     nr_threads;
> +    uint64_t     cores_mask;
> +    PnvCore      **cores;
> +
> +    uint32_t     num_pecs;
> +
> +    MemoryRegion xscom_mmio;
> +    MemoryRegion xscom;
> +    AddressSpace xscom_as;
> +
> +    MemoryRegion *fw_mr;
> +    gchar        *dt_isa_nodename;
> +};
> +
> +#define TYPE_PNV8_CHIP "pnv8-chip"
> +DECLARE_INSTANCE_CHECKER(Pnv8Chip, PNV8_CHIP,
> +                         TYPE_PNV8_CHIP)
> +
> +struct Pnv8Chip {
> +    /*< private >*/
> +    PnvChip      parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion icp_mmio;
> +
> +    PnvLpcController lpc;
> +    Pnv8Psi      psi;
> +    PnvOCC       occ;
> +    PnvHomer     homer;
> +
> +#define PNV8_CHIP_PHB3_MAX 4
> +    /*
> +     * The array is used to allow quick access to the phbs by
> +     * pnv_ics_get_child() and pnv_ics_resend_child().
> +     */
> +    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
> +    uint32_t     num_phbs;
> +
> +    XICSFabric    *xics;
> +};
> +
> +#define TYPE_PNV9_CHIP "pnv9-chip"
> +DECLARE_INSTANCE_CHECKER(Pnv9Chip, PNV9_CHIP,
> +                         TYPE_PNV9_CHIP)
> +
> +struct Pnv9Chip {
> +    /*< private >*/
> +    PnvChip      parent_obj;
> +
> +    /*< public >*/
> +    PnvXive      xive;
> +    Pnv9Psi      psi;
> +    PnvLpcController lpc;
> +    PnvOCC       occ;
> +    PnvSBE       sbe;
> +    PnvHomer     homer;
> +
> +    uint32_t     nr_quads;
> +    PnvQuad      *quads;
> +
> +#define PNV9_CHIP_MAX_PEC 3
> +    PnvPhb4PecState pecs[PNV9_CHIP_MAX_PEC];
> +};
> +
> +/*
> + * A SMT8 fused core is a pair of SMT4 cores.
> + */
> +#define PNV9_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> +#define PNV9_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
> +
> +#define TYPE_PNV10_CHIP "pnv10-chip"
> +DECLARE_INSTANCE_CHECKER(Pnv10Chip, PNV10_CHIP,
> +                         TYPE_PNV10_CHIP)
> +
> +struct Pnv10Chip {
> +    /*< private >*/
> +    PnvChip      parent_obj;
> +
> +    /*< public >*/
> +    PnvXive2     xive;
> +    Pnv9Psi      psi;
> +    PnvLpcController lpc;
> +    PnvOCC       occ;
> +    PnvSBE       sbe;
> +    PnvHomer     homer;
> +
> +    uint32_t     nr_quads;
> +    PnvQuad      *quads;
> +
> +#define PNV10_CHIP_MAX_PEC 2
> +    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
> +};
> +
> +#define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> +#define PNV10_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
> +
> +struct PnvChipClass {
> +    /*< private >*/
> +    SysBusDeviceClass parent_class;
> +
> +    /*< public >*/
> +    uint64_t     chip_cfam_id;
> +    uint64_t     cores_mask;
> +    uint32_t     num_pecs;
> +    uint32_t     num_phbs;
> +
> +    DeviceRealize parent_realize;
> +
> +    uint32_t (*core_pir)(PnvChip *chip, uint32_t core_id);
> +    void (*intc_create)(PnvChip *chip, PowerPCCPU *cpu, Error **errp);
> +    void (*intc_reset)(PnvChip *chip, PowerPCCPU *cpu);
> +    void (*intc_destroy)(PnvChip *chip, PowerPCCPU *cpu);
> +    void (*intc_print_info)(PnvChip *chip, PowerPCCPU *cpu, Monitor *mon);
> +    ISABus *(*isa_create)(PnvChip *chip, Error **errp);
> +    void (*dt_populate)(PnvChip *chip, void *fdt);
> +    void (*pic_print_info)(PnvChip *chip, Monitor *mon);
> +    uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
> +    uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
> +};
> +
> +#endif

