Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869F4C4712
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:06:08 +0100 (CET)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbEU-0004PV-Pf
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNatZ-0008TF-3Y; Fri, 25 Feb 2022 08:44:29 -0500
Received: from [2607:f8b0:4864:20::22b] (port=33576
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNatO-0002h1-K9; Fri, 25 Feb 2022 08:44:22 -0500
Received: by mail-oi1-x22b.google.com with SMTP id x193so7518954oix.0;
 Fri, 25 Feb 2022 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gE6JWf+hLQ9SC/wqORkXgZnO+Itrl7d8yS0brZytmbE=;
 b=oD7H6ONysXNcALIe3iyxPwYSXA45ePgrHbfuoXIYgYtkNXz89MhTEA17+5Rp3uh92F
 c4JnN7Oznx5Hgak/xAoqwirIhY6/Nt+jukT5jAFw6ULOSd1MVkWg4fw8PbIGP5NQ+I2m
 W6X0G+Nga8N6eq1oI4oQA7Ibdxu04ZEjy1xi0QGU4tVD74Lsr9x6+YTdaGXYROnVLquh
 ybUYTiopIsHpipi3O2ow1rgE6GLx3F+XFu40Y65teBvWLlxfh4Wu2DTdARUZ2hXYfFSp
 i7T+5rf4KQQ9tnez7VsbXtaJRa/fTbHit5JiWJ3NRSXoSUiLwWk6zS9ezfeuX1dMPY22
 YOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gE6JWf+hLQ9SC/wqORkXgZnO+Itrl7d8yS0brZytmbE=;
 b=d/v3e6IoOr2F1AYh3QoCtbxoT/v2eZM8R8T2+fR3WjPuELd7SFbfHRX8VVX6q4GjCs
 Y2jRhuAUh2LRulhwO77pSkIcLV5meMYnT6CnW/27PWqp/uqtku7ABs44J7yNWOWygbth
 gDTlMy/TIbF/IqHLg9QFE0MTVn7O287vU/jTcSsazfnevXslcfV9qqkGAwqp2MzoGG31
 eYfDBrh3aq7L+zTu7A+d6kh1Fbz3ywHUZb49Q+VRM+yCmsdEvKIpTmVd8Si5h5hCYQnu
 fg7nNb6oZO+xOz1YL3wq6ejvNn4NtO12tZk4KZp209QURA9/keBwwz/d08yUWm3NnTLE
 E2mg==
X-Gm-Message-State: AOAM530lqD3I1efc+aqqxTzzs4z4JxedA3IP9tyLz38BiJSIvF0AXumn
 KMO5bsmjs9uYLjdE9kcR3jU=
X-Google-Smtp-Source: ABdhPJyovOBEnbURcxxmaAEJbn9G/EcSEnbv9/9T2o4NTKv3Uu8CCicjfwV8eCWrGmkdUBwxISgmSw==
X-Received: by 2002:a05:6808:180f:b0:2d6:5ab9:a60b with SMTP id
 bh15-20020a056808180f00b002d65ab9a60bmr1571421oib.147.1645796648552; 
 Fri, 25 Feb 2022 05:44:08 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a4ae6c8000000b0031c2e6dd492sm1053670oot.28.2022.02.25.05.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 05:44:08 -0800 (PST)
Message-ID: <77f65358-ecb4-f6d5-518b-fc8eeb344733@gmail.com>
Date: Fri, 25 Feb 2022 10:44:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 01/18] ppc/xive2: Introduce a XIVE2 core framework
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-2-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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
> The XIVE2 interrupt controller of the POWER10 processor as the same
> logic as on POWER9 but its SW interface has been largely reworked. The
> interrupt controller has a new register interface, different BARs,
> extra VSDs. These will be described when we add the device model for
> the baremetal machine.
> 
> The XIVE internal structures for the EAS, END, NVT have different
> layouts which is a problem for the current core XIVE framework. To
> avoid adding too much complexity in the XIVE models, a new XIVE2 core
> framework is introduced. It duplicates the models which are closely
> linked to the XIVE internal structures : Xive2Router and
> Xive2ENDSource and reuses the XiveSource, XivePresenter, XiveTCTX
> models, as they are more generic.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive2.h      |  78 +++++
>   include/hw/ppc/xive2_regs.h | 198 +++++++++++
>   hw/intc/xive2.c             | 666 ++++++++++++++++++++++++++++++++++++
>   hw/intc/meson.build         |   2 +-
>   4 files changed, 943 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/ppc/xive2.h
>   create mode 100644 include/hw/ppc/xive2_regs.h
>   create mode 100644 hw/intc/xive2.c
> 
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> new file mode 100644
> index 000000000000..a3cd02520475
> --- /dev/null
> +++ b/include/hw/ppc/xive2.h
> @@ -0,0 +1,78 @@
> +/*
> + * QEMU PowerPC XIVE2 interrupt controller model  (POWER10)
> + *
> + * Copyright (c) 2019-2021, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef PPC_XIVE2_H
> +#define PPC_XIVE2_H
> +
> +#include "hw/ppc/xive2_regs.h"
> +
> +/*
> + * XIVE2 Router (POWER10)
> + */
> +typedef struct Xive2Router {
> +    SysBusDevice    parent;
> +
> +    XiveFabric *xfb;
> +} Xive2Router;
> +
> +#define TYPE_XIVE2_ROUTER "xive2-router"
> +OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
> +
> +typedef struct Xive2RouterClass {
> +    SysBusDeviceClass parent;
> +
> +    /* XIVE table accessors */
> +    int (*get_eas)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                   Xive2Eas *eas);
> +    int (*get_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                   Xive2End *end);
> +    int (*write_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                     Xive2End *end, uint8_t word_number);
> +    int (*get_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                   Xive2Nvp *nvp);
> +    int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                     Xive2Nvp *nvp, uint8_t word_number);
> +    uint8_t (*get_block_id)(Xive2Router *xrtr);
> +} Xive2RouterClass;
> +
> +int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                        Xive2Eas *eas);
> +int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                        Xive2End *end);
> +int xive2_router_write_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                          Xive2End *end, uint8_t word_number);
> +int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                        Xive2Nvp *nvp);
> +int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                          Xive2Nvp *nvp, uint8_t word_number);
> +
> +void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
> +
> +/*
> + * XIVE2 END ESBs  (POWER10)
> + */
> +
> +#define TYPE_XIVE2_END_SOURCE "xive2-end-source"
> +OBJECT_DECLARE_SIMPLE_TYPE(Xive2EndSource, XIVE2_END_SOURCE)
> +
> +typedef struct Xive2EndSource {
> +    DeviceState parent;
> +
> +    uint32_t        nr_ends;
> +
> +    /* ESB memory region */
> +    uint32_t        esb_shift;
> +    MemoryRegion    esb_mmio;
> +
> +    Xive2Router     *xrtr;
> +} Xive2EndSource;
> +
> +
> +#endif /* PPC_XIVE2_H */
> diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
> new file mode 100644
> index 000000000000..f4827f4c6d54
> --- /dev/null
> +++ b/include/hw/ppc/xive2_regs.h
> @@ -0,0 +1,198 @@
> +/*
> + * QEMU PowerPC XIVE2 internal structure definitions (POWER10)
> + *
> + * Copyright (c) 2019-2021, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef PPC_XIVE2_REGS_H
> +#define PPC_XIVE2_REGS_H
> +
> +/*
> + * Thread Interrupt Management Area (TIMA)
> + *
> + * In Gen1 mode (P9 compat mode) word 2 is the same. However in Gen2
> + * mode (P10), the CAM line is slightly different as the VP space was
> + * increased.
> + */
> +#define   TM2_QW0W2_VU           PPC_BIT32(0)
> +#define   TM2_QW0W2_LOGIC_SERV   PPC_BITMASK32(4, 31)
> +#define   TM2_QW1W2_VO           PPC_BIT32(0)
> +#define   TM2_QW1W2_OS_CAM       PPC_BITMASK32(4, 31)
> +#define   TM2_QW2W2_VP           PPC_BIT32(0)
> +#define   TM2_QW2W2_POOL_CAM     PPC_BITMASK32(4, 31)
> +#define   TM2_QW3W2_VT           PPC_BIT32(0)
> +#define   TM2_QW3W2_LP           PPC_BIT32(6)
> +#define   TM2_QW3W2_LE           PPC_BIT32(7)
> +
> +/*
> + * Event Assignment Structure (EAS)
> + */
> +
> +typedef struct Xive2Eas {
> +        uint64_t       w;
> +#define EAS2_VALID                 PPC_BIT(0)
> +#define EAS2_END_BLOCK             PPC_BITMASK(4, 7) /* Destination EQ block# */
> +#define EAS2_END_INDEX             PPC_BITMASK(8, 31) /* Destination EQ index */
> +#define EAS2_MASKED                PPC_BIT(32) /* Masked                 */
> +#define EAS2_END_DATA              PPC_BITMASK(33, 63) /* written to the EQ */
> +} Xive2Eas;
> +
> +#define xive2_eas_is_valid(eas)   (be64_to_cpu((eas)->w) & EAS2_VALID)
> +#define xive2_eas_is_masked(eas)  (be64_to_cpu((eas)->w) & EAS2_MASKED)
> +
> +void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon);
> +
> +/*
> + * Event Notifification Descriptor (END)
> + */
> +
> +typedef struct Xive2End {
> +        uint32_t       w0;
> +#define END2_W0_VALID              PPC_BIT32(0) /* "v" bit */
> +#define END2_W0_ENQUEUE            PPC_BIT32(5) /* "q" bit */
> +#define END2_W0_UCOND_NOTIFY       PPC_BIT32(6) /* "n" bit */
> +#define END2_W0_SILENT_ESCALATE    PPC_BIT32(7) /* "s" bit */
> +#define END2_W0_BACKLOG            PPC_BIT32(8) /* "b" bit */
> +#define END2_W0_PRECL_ESC_CTL      PPC_BIT32(9) /* "p" bit */
> +#define END2_W0_UNCOND_ESCALATE    PPC_BIT32(10) /* "u" bit */
> +#define END2_W0_ESCALATE_CTL       PPC_BIT32(11) /* "e" bit */
> +#define END2_W0_ADAPTIVE_ESC       PPC_BIT32(12) /* "a" bit */
> +#define END2_W0_ESCALATE_END       PPC_BIT32(13) /* "N" bit */
> +#define END2_W0_FIRMWARE1          PPC_BIT32(16) /* Owned by FW */
> +#define END2_W0_FIRMWARE2          PPC_BIT32(17) /* Owned by FW */
> +#define END2_W0_AEC_SIZE           PPC_BITMASK32(18, 19)
> +#define END2_W0_AEG_SIZE           PPC_BITMASK32(20, 23)
> +#define END2_W0_EQ_VG_PREDICT      PPC_BITMASK32(24, 31) /* Owned by HW */
> +        uint32_t       w1;
> +#define END2_W1_ESn                PPC_BITMASK32(0, 1)
> +#define END2_W1_ESn_P              PPC_BIT32(0)
> +#define END2_W1_ESn_Q              PPC_BIT32(1)
> +#define END2_W1_ESe                PPC_BITMASK32(2, 3)
> +#define END2_W1_ESe_P              PPC_BIT32(2)
> +#define END2_W1_ESe_Q              PPC_BIT32(3)
> +#define END2_W1_GEN_FLIPPED        PPC_BIT32(8)
> +#define END2_W1_GENERATION         PPC_BIT32(9)
> +#define END2_W1_PAGE_OFF           PPC_BITMASK32(10, 31)
> +        uint32_t       w2;
> +#define END2_W2_RESERVED           PPC_BITMASK32(4, 7)
> +#define END2_W2_EQ_ADDR_HI         PPC_BITMASK32(8, 31)
> +        uint32_t       w3;
> +#define END2_W3_EQ_ADDR_LO         PPC_BITMASK32(0, 24)
> +#define END2_W3_QSIZE              PPC_BITMASK32(28, 31)
> +        uint32_t       w4;
> +#define END2_W4_END_BLOCK          PPC_BITMASK32(4, 7)
> +#define END2_W4_ESC_END_INDEX      PPC_BITMASK32(8, 31)
> +#define END2_W4_ESB_BLOCK          PPC_BITMASK32(0, 3)
> +#define END2_W4_ESC_ESB_INDEX      PPC_BITMASK32(4, 31)
> +        uint32_t       w5;
> +#define END2_W5_ESC_END_DATA       PPC_BITMASK32(1, 31)
> +        uint32_t       w6;
> +#define END2_W6_FORMAT_BIT         PPC_BIT32(0)
> +#define END2_W6_IGNORE             PPC_BIT32(1)
> +#define END2_W6_VP_BLOCK           PPC_BITMASK32(4, 7)
> +#define END2_W6_VP_OFFSET          PPC_BITMASK32(8, 31)
> +#define END2_W6_VP_OFFSET_GEN1     PPC_BITMASK32(13, 31)
> +        uint32_t       w7;
> +#define END2_W7_TOPO               PPC_BITMASK32(0, 3) /* Owned by HW */
> +#define END2_W7_F0_PRIORITY        PPC_BITMASK32(8, 15)
> +#define END2_W7_F1_LOG_SERVER_ID   PPC_BITMASK32(4, 31)
> +} Xive2End;
> +
> +#define xive2_end_is_valid(end)    (be32_to_cpu((end)->w0) & END2_W0_VALID)
> +#define xive2_end_is_enqueue(end)  (be32_to_cpu((end)->w0) & END2_W0_ENQUEUE)
> +#define xive2_end_is_notify(end)                \
> +    (be32_to_cpu((end)->w0) & END2_W0_UCOND_NOTIFY)
> +#define xive2_end_is_backlog(end)  (be32_to_cpu((end)->w0) & END2_W0_BACKLOG)
> +#define xive2_end_is_escalate(end)                      \
> +    (be32_to_cpu((end)->w0) & END2_W0_ESCALATE_CTL)
> +#define xive2_end_is_uncond_escalation(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_UNCOND_ESCALATE)
> +#define xive2_end_is_silent_escalation(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_SILENT_ESCALATE)
> +#define xive2_end_is_escalate_end(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_ESCALATE_END)
> +#define xive2_end_is_firmware1(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_FIRMWARE1)
> +#define xive2_end_is_firmware2(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_FIRMWARE2)
> +
> +static inline uint64_t xive2_end_qaddr(Xive2End *end)
> +{
> +    return ((uint64_t) be32_to_cpu(end->w2) & END2_W2_EQ_ADDR_HI) << 32 |
> +        (be32_to_cpu(end->w3) & END2_W3_EQ_ADDR_LO);
> +}
> +
> +void xive2_end_pic_print_info(Xive2End *end, uint32_t end_idx, Monitor *mon);
> +void xive2_end_queue_pic_print_info(Xive2End *end, uint32_t width,
> +                                    Monitor *mon);
> +void xive2_end_eas_pic_print_info(Xive2End *end, uint32_t end_idx,
> +                                   Monitor *mon);
> +
> +/*
> + * Notification Virtual Processor (NVP)
> + */
> +typedef struct Xive2Nvp {
> +        uint32_t       w0;
> +#define NVP2_W0_VALID              PPC_BIT32(0)
> +#define NVP2_W0_ESC_END            PPC_BIT32(25) /* 'N' bit 0:ESB  1:END */
> +        uint32_t       w1;
> +        uint32_t       w2;
> +#define NVP2_W2_IPB                PPC_BITMASK32(8, 15)
> +        uint32_t       w3;
> +        uint32_t       w4;
> +#define NVP2_W4_ESC_ESB_BLOCK      PPC_BITMASK32(0, 3)  /* N:0 */
> +#define NVP2_W4_ESC_ESB_INDEX      PPC_BITMASK32(4, 31) /* N:0 */
> +#define NVP2_W4_ESC_END_BLOCK      PPC_BITMASK32(4, 7)  /* N:1 */
> +#define NVP2_W4_ESC_END_INDEX      PPC_BITMASK32(8, 31) /* N:1 */
> +        uint32_t       w5;
> +#define NVP2_W5_PSIZE              PPC_BITMASK32(0, 1)
> +#define NVP2_W5_VP_END_BLOCK       PPC_BITMASK32(4, 7)
> +#define NVP2_W5_VP_END_INDEX       PPC_BITMASK32(8, 31)
> +        uint32_t       w6;
> +        uint32_t       w7;
> +} Xive2Nvp;
> +
> +#define xive2_nvp_is_valid(nvp)    (be32_to_cpu((nvp)->w0) & NVP2_W0_VALID)
> +
> +/*
> + * The VP number space in a block is defined by the END2_W6_VP_OFFSET
> + * field of the XIVE END. When running in Gen1 mode (P9 compat mode),
> + * the VP space is reduced to (1 << 19) VPs per block
> + */
> +#define XIVE2_NVP_SHIFT              24
> +#define XIVE2_NVP_COUNT              (1 << XIVE2_NVP_SHIFT)
> +
> +static inline uint32_t xive2_nvp_cam_line(uint8_t nvp_blk, uint32_t nvp_idx)
> +{
> +    return (nvp_blk << XIVE2_NVP_SHIFT) | nvp_idx;
> +}
> +
> +static inline uint32_t xive2_nvp_idx(uint32_t cam_line)
> +{
> +    return cam_line & ((1 << XIVE2_NVP_SHIFT) - 1);
> +}
> +
> +static inline uint32_t xive2_nvp_blk(uint32_t cam_line)
> +{
> +    return (cam_line >> XIVE2_NVP_SHIFT) & 0xf;
> +}
> +
> +/*
> + * Notification Virtual Group or Crowd (NVG/NVC)
> + */
> +typedef struct Xive2Nvgc {
> +        uint32_t        w0;
> +#define NVGC2_W0_VALID             PPC_BIT32(0)
> +        uint32_t        w1;
> +        uint32_t        w2;
> +        uint32_t        w3;
> +        uint32_t        w4;
> +        uint32_t        w5;
> +        uint32_t        w6;
> +        uint32_t        w7;
> +} Xive2Nvgc;
> +
> +#endif /* PPC_XIVE2_REGS_H */
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> new file mode 100644
> index 000000000000..e4aa614f3cc8
> --- /dev/null
> +++ b/hw/intc/xive2.c
> @@ -0,0 +1,666 @@
> +/*
> + * QEMU PowerPC XIVE2 interrupt controller model (POWER10)
> + *
> + * Copyright (c) 2019-2021, IBM Corporation..
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +#include "target/ppc/cpu.h"
> +#include "sysemu/cpus.h"
> +#include "sysemu/dma.h"
> +#include "hw/qdev-properties.h"
> +#include "monitor/monitor.h"
> +#include "hw/ppc/xive.h"
> +#include "hw/ppc/xive2.h"
> +#include "hw/ppc/xive2_regs.h"
> +
> +void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon)
> +{
> +    if (!xive2_eas_is_valid(eas)) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, "  %08x %s end:%02x/%04x data:%08x\n",
> +                   lisn, xive2_eas_is_masked(eas) ? "M" : " ",
> +                   (uint8_t)  xive_get_field64(EAS2_END_BLOCK, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_INDEX, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_DATA, eas->w));
> +}
> +
> +void xive2_end_queue_pic_print_info(Xive2End *end, uint32_t width,
> +                                    Monitor *mon)
> +{
> +    uint64_t qaddr_base = xive2_end_qaddr(end);
> +    uint32_t qsize = xive_get_field32(END2_W3_QSIZE, end->w3);
> +    uint32_t qindex = xive_get_field32(END2_W1_PAGE_OFF, end->w1);
> +    uint32_t qentries = 1 << (qsize + 10);
> +    int i;
> +
> +    /*
> +     * print out the [ (qindex - (width - 1)) .. (qindex + 1)] window
> +     */
> +    monitor_printf(mon, " [ ");
> +    qindex = (qindex - (width - 1)) & (qentries - 1);
> +    for (i = 0; i < width; i++) {
> +        uint64_t qaddr = qaddr_base + (qindex << 2);
> +        uint32_t qdata = -1;
> +
> +        if (dma_memory_read(&address_space_memory, qaddr, &qdata,
> +                            sizeof(qdata))) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to read EQ @0x%"
> +                          HWADDR_PRIx "\n", qaddr);
> +            return;
> +        }
> +        monitor_printf(mon, "%s%08x ", i == width - 1 ? "^" : "",
> +                       be32_to_cpu(qdata));
> +        qindex = (qindex + 1) & (qentries - 1);
> +    }
> +    monitor_printf(mon, "]");
> +}
> +
> +void xive2_end_pic_print_info(Xive2End *end, uint32_t end_idx, Monitor *mon)
> +{
> +    uint64_t qaddr_base = xive2_end_qaddr(end);
> +    uint32_t qindex = xive_get_field32(END2_W1_PAGE_OFF, end->w1);
> +    uint32_t qgen = xive_get_field32(END2_W1_GENERATION, end->w1);
> +    uint32_t qsize = xive_get_field32(END2_W3_QSIZE, end->w3);
> +    uint32_t qentries = 1 << (qsize + 10);
> +
> +    uint32_t nvp_blk = xive_get_field32(END2_W6_VP_BLOCK, end->w6);
> +    uint32_t nvp_idx = xive_get_field32(END2_W6_VP_OFFSET, end->w6);
> +    uint8_t priority = xive_get_field32(END2_W7_F0_PRIORITY, end->w7);
> +    uint8_t pq;
> +
> +    if (!xive2_end_is_valid(end)) {
> +        return;
> +    }
> +
> +    pq = xive_get_field32(END2_W1_ESn, end->w1);
> +
> +    monitor_printf(mon,
> +                   "  %08x %c%c %c%c%c%c%c%c%c%c%c%c prio:%d nvp:%02x/%04x",
> +                   end_idx,
> +                   pq & XIVE_ESB_VAL_P ? 'P' : '-',
> +                   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> +                   xive2_end_is_valid(end)    ? 'v' : '-',
> +                   xive2_end_is_enqueue(end)  ? 'q' : '-',
> +                   xive2_end_is_notify(end)   ? 'n' : '-',
> +                   xive2_end_is_backlog(end)  ? 'b' : '-',
> +                   xive2_end_is_escalate(end) ? 'e' : '-',
> +                   xive2_end_is_escalate_end(end) ? 'N' : '-',
> +                   xive2_end_is_uncond_escalation(end)   ? 'u' : '-',
> +                   xive2_end_is_silent_escalation(end)   ? 's' : '-',
> +                   xive2_end_is_firmware1(end)   ? 'f' : '-',
> +                   xive2_end_is_firmware2(end)   ? 'F' : '-',
> +                   priority, nvp_blk, nvp_idx);
> +
> +    if (qaddr_base) {
> +        monitor_printf(mon, " eq:@%08"PRIx64"% 6d/%5d ^%d",
> +                       qaddr_base, qindex, qentries, qgen);
> +        xive2_end_queue_pic_print_info(end, 6, mon);
> +    }
> +    monitor_printf(mon, "\n");
> +}
> +
> +void xive2_end_eas_pic_print_info(Xive2End *end, uint32_t end_idx,
> +                                  Monitor *mon)
> +{
> +    Xive2Eas *eas = (Xive2Eas *) &end->w4;
> +    uint8_t pq;
> +
> +    if (!xive2_end_is_escalate(end)) {
> +        return;
> +    }
> +
> +    pq = xive_get_field32(END2_W1_ESe, end->w1);
> +
> +    monitor_printf(mon, "  %08x %c%c %c%c end:%02x/%04x data:%08x\n",
> +                   end_idx,
> +                   pq & XIVE_ESB_VAL_P ? 'P' : '-',
> +                   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> +                   xive2_eas_is_valid(eas) ? 'v' : ' ',
> +                   xive2_eas_is_masked(eas) ? 'M' : ' ',
> +                   (uint8_t)  xive_get_field64(EAS2_END_BLOCK, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_INDEX, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_DATA, eas->w));
> +}
> +
> +static void xive2_end_enqueue(Xive2End *end, uint32_t data)
> +{
> +    uint64_t qaddr_base = xive2_end_qaddr(end);
> +    uint32_t qsize = xive_get_field32(END2_W3_QSIZE, end->w3);
> +    uint32_t qindex = xive_get_field32(END2_W1_PAGE_OFF, end->w1);
> +    uint32_t qgen = xive_get_field32(END2_W1_GENERATION, end->w1);
> +
> +    uint64_t qaddr = qaddr_base + (qindex << 2);
> +    uint32_t qdata = cpu_to_be32((qgen << 31) | (data & 0x7fffffff));
> +    uint32_t qentries = 1 << (qsize + 10);
> +
> +    if (dma_memory_write(&address_space_memory, qaddr, &qdata, sizeof(qdata))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to write END data @0x%"
> +                      HWADDR_PRIx "\n", qaddr);
> +        return;
> +    }
> +
> +    qindex = (qindex + 1) & (qentries - 1);
> +    if (qindex == 0) {
> +        qgen ^= 1;
> +        end->w1 = xive_set_field32(END2_W1_GENERATION, end->w1, qgen);
> +
> +        /* TODO(PowerNV): reset GF bit on a cache watch operation */
> +        end->w1 = xive_set_field32(END2_W1_GEN_FLIPPED, end->w1, qgen);
> +    }
> +    end->w1 = xive_set_field32(END2_W1_PAGE_OFF, end->w1, qindex);
> +}
> +/*
> + * XIVE Router (aka. Virtualization Controller or IVRE)
> + */
> +
> +int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                         Xive2Eas *eas)
> +{
> +    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
> +}
> +
> +int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                         Xive2End *end)
> +{
> +   Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->get_end(xrtr, end_blk, end_idx, end);
> +}
> +
> +int xive2_router_write_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                           Xive2End *end, uint8_t word_number)
> +{
> +   Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->write_end(xrtr, end_blk, end_idx, end, word_number);
> +}
> +
> +int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                         Xive2Nvp *nvp)
> +{
> +   Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->get_nvp(xrtr, nvp_blk, nvp_idx, nvp);
> +}
> +
> +int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                           Xive2Nvp *nvp, uint8_t word_number)
> +{
> +   Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->write_nvp(xrtr, nvp_blk, nvp_idx, nvp, word_number);
> +}
> +
> +static int xive2_router_get_block_id(Xive2Router *xrtr)
> +{
> +   Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->get_block_id(xrtr);
> +}
> +
> +static void xive2_router_realize(DeviceState *dev, Error **errp)
> +{
> +    Xive2Router *xrtr = XIVE2_ROUTER(dev);
> +
> +    assert(xrtr->xfb);
> +}
> +
> +/*
> + * Notification using the END ESe/ESn bit (Event State Buffer for
> + * escalation and notification). Profide futher coalescing in the
> + * Router.
> + */
> +static bool xive2_router_end_es_notify(Xive2Router *xrtr, uint8_t end_blk,
> +                                       uint32_t end_idx, Xive2End *end,
> +                                       uint32_t end_esmask)
> +{
> +    uint8_t pq = xive_get_field32(end_esmask, end->w1);
> +    bool notify = xive_esb_trigger(&pq);
> +
> +    if (pq != xive_get_field32(end_esmask, end->w1)) {
> +        end->w1 = xive_set_field32(end_esmask, end->w1, pq);
> +        xive2_router_write_end(xrtr, end_blk, end_idx, end, 1);
> +    }
> +
> +    /* ESe/n[Q]=1 : end of notification */
> +    return notify;
> +}
> +
> +/*
> + * An END trigger can come from an event trigger (IPI or HW) or from
> + * another chip. We don't model the PowerBus but the END trigger
> + * message has the same parameters than in the function below.
> + */
> +static void xive2_router_end_notify(Xive2Router *xrtr, uint8_t end_blk,
> +                                    uint32_t end_idx, uint32_t end_data)
> +{
> +    Xive2End end;
> +    uint8_t priority;
> +    uint8_t format;
> +    bool found;
> +    Xive2Nvp nvp;
> +    uint8_t nvp_blk;
> +    uint32_t nvp_idx;
> +
> +    /* END cache lookup */
> +    if (xive2_router_get_end(xrtr, end_blk, end_idx, &end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
> +                      end_idx);
> +        return;
> +    }
> +
> +    if (!xive2_end_is_valid(&end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
> +                      end_blk, end_idx);
> +        return;
> +    }
> +
> +    if (xive2_end_is_enqueue(&end)) {
> +        xive2_end_enqueue(&end, end_data);
> +        /* Enqueuing event data modifies the EQ toggle and index */
> +        xive2_router_write_end(xrtr, end_blk, end_idx, &end, 1);
> +    }
> +
> +    /*
> +     * When the END is silent, we skip the notification part.
> +     */
> +    if (xive2_end_is_silent_escalation(&end)) {
> +        goto do_escalation;
> +    }
> +
> +    /*
> +     * The W7 format depends on the F bit in W6. It defines the type
> +     * of the notification :
> +     *
> +     *   F=0 : single or multiple NVP notification
> +     *   F=1 : User level Event-Based Branch (EBB) notification, no
> +     *         priority
> +     */
> +    format = xive_get_field32(END2_W6_FORMAT_BIT, end.w6);
> +    priority = xive_get_field32(END2_W7_F0_PRIORITY, end.w7);
> +
> +    /* The END is masked */
> +    if (format == 0 && priority == 0xff) {
> +        return;
> +    }
> +
> +    /*
> +     * Check the END ESn (Event State Buffer for notification) for
> +     * even futher coalescing in the Router
> +     */
> +    if (!xive2_end_is_notify(&end)) {
> +        /* ESn[Q]=1 : end of notification */
> +        if (!xive2_router_end_es_notify(xrtr, end_blk, end_idx,
> +                                       &end, END2_W1_ESn)) {
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * Follows IVPE notification
> +     */
> +    nvp_blk = xive_get_field32(END2_W6_VP_BLOCK, end.w6);
> +    nvp_idx = xive_get_field32(END2_W6_VP_OFFSET, end.w6);
> +
> +    /* NVP cache lookup */
> +    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: no NVP %x/%x\n",
> +                      nvp_blk, nvp_idx);
> +        return;
> +    }
> +
> +    if (!xive2_nvp_is_valid(&nvp)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is invalid\n",
> +                      nvp_blk, nvp_idx);
> +        return;
> +    }
> +
> +    found = xive_presenter_notify(xrtr->xfb, format, nvp_blk, nvp_idx,
> +                          xive_get_field32(END2_W6_IGNORE, end.w7),
> +                          priority,
> +                          xive_get_field32(END2_W7_F1_LOG_SERVER_ID, end.w7));
> +
> +    /* TODO: Auto EOI. */
> +
> +    if (found) {
> +        return;
> +    }
> +
> +    /*
> +     * If no matching NVP is dispatched on a HW thread :
> +     * - specific VP: update the NVP structure if backlog is activated
> +     * - logical server : forward request to IVPE (not supported)
> +     */
> +    if (xive2_end_is_backlog(&end)) {
> +        uint8_t ipb;
> +
> +        if (format == 1) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "XIVE: END %x/%x invalid config: F1 & backlog\n",
> +                          end_blk, end_idx);
> +            return;
> +        }
> +
> +        /*
> +         * Record the IPB in the associated NVP structure for later
> +         * use. The presenter will resend the interrupt when the vCPU
> +         * is dispatched again on a HW thread.
> +         */
> +        ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2) |
> +            xive_priority_to_ipb(priority);
> +        nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, ipb);
> +        xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
> +
> +        /*
> +         * On HW, follows a "Broadcast Backlog" to IVPEs
> +         */
> +    }
> +
> +do_escalation:
> +    /*
> +     * If activated, escalate notification using the ESe PQ bits and
> +     * the EAS in w4-5
> +     */
> +    if (!xive2_end_is_escalate(&end)) {
> +        return;
> +    }
> +
> +    /*
> +     * Check the END ESe (Event State Buffer for escalation) for even
> +     * futher coalescing in the Router
> +     */
> +    if (!xive2_end_is_uncond_escalation(&end)) {
> +        /* ESe[Q]=1 : end of escalation notification */
> +        if (!xive2_router_end_es_notify(xrtr, end_blk, end_idx,
> +                                       &end, END2_W1_ESe)) {
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * The END trigger becomes an Escalation trigger
> +     */
> +    xive2_router_end_notify(xrtr,
> +                           xive_get_field32(END2_W4_END_BLOCK,     end.w4),
> +                           xive_get_field32(END2_W4_ESC_END_INDEX, end.w4),
> +                           xive_get_field32(END2_W5_ESC_END_DATA,  end.w5));
> +}
> +
> +void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
> +{
> +    Xive2Router *xrtr = XIVE2_ROUTER(xn);
> +    uint8_t eas_blk = XIVE_EAS_BLOCK(lisn);
> +    uint32_t eas_idx = XIVE_EAS_INDEX(lisn);
> +    Xive2Eas eas;
> +
> +    /* EAS cache lookup */
> +    if (xive2_router_get_eas(xrtr, eas_blk, eas_idx, &eas)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Unknown LISN %x\n", lisn);
> +        return;
> +    }
> +
> +    if (!xive2_eas_is_valid(&eas)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Invalid LISN %x\n", lisn);
> +        return;
> +    }
> +
> +    if (xive2_eas_is_masked(&eas)) {
> +        /* Notification completed */
> +        return;
> +    }
> +
> +    /*
> +     * The event trigger becomes an END trigger
> +     */
> +    xive2_router_end_notify(xrtr,
> +                             xive_get_field64(EAS2_END_BLOCK, eas.w),
> +                             xive_get_field64(EAS2_END_INDEX, eas.w),
> +                             xive_get_field64(EAS2_END_DATA,  eas.w));
> +}
> +
> +static Property xive2_router_properties[] = {
> +    DEFINE_PROP_LINK("xive-fabric", Xive2Router, xfb,
> +                     TYPE_XIVE_FABRIC, XiveFabric *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xive2_router_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    XiveNotifierClass *xnc = XIVE_NOTIFIER_CLASS(klass);
> +
> +    dc->desc    = "XIVE2 Router Engine";
> +    device_class_set_props(dc, xive2_router_properties);
> +    /* Parent is SysBusDeviceClass. No need to call its realize hook */
> +    dc->realize = xive2_router_realize;
> +    xnc->notify = xive2_router_notify;
> +}
> +
> +static const TypeInfo xive2_router_info = {
> +    .name          = TYPE_XIVE2_ROUTER,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .abstract      = true,
> +    .instance_size = sizeof(Xive2Router),
> +    .class_size    = sizeof(Xive2RouterClass),
> +    .class_init    = xive2_router_class_init,
> +    .interfaces    = (InterfaceInfo[]) {
> +        { TYPE_XIVE_NOTIFIER },
> +        { TYPE_XIVE_PRESENTER },
> +        { }
> +    }
> +};
> +
> +static inline bool addr_is_even(hwaddr addr, uint32_t shift)
> +{
> +    return !((addr >> shift) & 1);
> +}
> +
> +static uint64_t xive2_end_source_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    Xive2EndSource *xsrc = XIVE2_END_SOURCE(opaque);
> +    uint32_t offset = addr & 0xFFF;
> +    uint8_t end_blk;
> +    uint32_t end_idx;
> +    Xive2End end;
> +    uint32_t end_esmask;
> +    uint8_t pq;
> +    uint64_t ret;
> +
> +    /*
> +     * The block id should be deduced from the load address on the END
> +     * ESB MMIO but our model only supports a single block per XIVE chip.
> +     */
> +    end_blk = xive2_router_get_block_id(xsrc->xrtr);
> +    end_idx = addr >> (xsrc->esb_shift + 1);
> +
> +    if (xive2_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
> +                      end_idx);
> +        return -1;
> +    }
> +
> +    if (!xive2_end_is_valid(&end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
> +                      end_blk, end_idx);
> +        return -1;
> +    }
> +
> +    end_esmask = addr_is_even(addr, xsrc->esb_shift) ? END2_W1_ESn :
> +        END2_W1_ESe;
> +    pq = xive_get_field32(end_esmask, end.w1);
> +
> +    switch (offset) {
> +    case XIVE_ESB_LOAD_EOI ... XIVE_ESB_LOAD_EOI + 0x7FF:
> +        ret = xive_esb_eoi(&pq);
> +
> +        /* Forward the source event notification for routing ?? */
> +        break;
> +
> +    case XIVE_ESB_GET ... XIVE_ESB_GET + 0x3FF:
> +        ret = pq;
> +        break;
> +
> +    case XIVE_ESB_SET_PQ_00 ... XIVE_ESB_SET_PQ_00 + 0x0FF:
> +    case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
> +    case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
> +    case XIVE_ESB_SET_PQ_11 ... XIVE_ESB_SET_PQ_11 + 0x0FF:
> +        ret = xive_esb_set(&pq, (offset >> 8) & 0x3);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB load addr %d\n",
> +                      offset);
> +        return -1;
> +    }
> +
> +    if (pq != xive_get_field32(end_esmask, end.w1)) {
> +        end.w1 = xive_set_field32(end_esmask, end.w1, pq);
> +        xive2_router_write_end(xsrc->xrtr, end_blk, end_idx, &end, 1);
> +    }
> +
> +    return ret;
> +}
> +
> +static void xive2_end_source_write(void *opaque, hwaddr addr,
> +                                   uint64_t value, unsigned size)
> +{
> +    Xive2EndSource *xsrc = XIVE2_END_SOURCE(opaque);
> +    uint32_t offset = addr & 0xFFF;
> +    uint8_t end_blk;
> +    uint32_t end_idx;
> +    Xive2End end;
> +    uint32_t end_esmask;
> +    uint8_t pq;
> +    bool notify = false;
> +
> +    /*
> +     * The block id should be deduced from the load address on the END
> +     * ESB MMIO but our model only supports a single block per XIVE chip.
> +     */
> +    end_blk = xive2_router_get_block_id(xsrc->xrtr);
> +    end_idx = addr >> (xsrc->esb_shift + 1);
> +
> +    if (xive2_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
> +                      end_idx);
> +        return;
> +    }
> +
> +    if (!xive2_end_is_valid(&end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
> +                      end_blk, end_idx);
> +        return;
> +    }
> +
> +    end_esmask = addr_is_even(addr, xsrc->esb_shift) ? END2_W1_ESn :
> +        END2_W1_ESe;
> +    pq = xive_get_field32(end_esmask, end.w1);
> +
> +    switch (offset) {
> +    case 0 ... 0x3FF:
> +        notify = xive_esb_trigger(&pq);
> +        break;
> +
> +    case XIVE_ESB_STORE_EOI ... XIVE_ESB_STORE_EOI + 0x3FF:
> +        /* TODO: can we check StoreEOI availability from the router ? */
> +        notify = xive_esb_eoi(&pq);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB write addr %d\n",
> +                      offset);
> +        return;
> +    }
> +
> +    if (pq != xive_get_field32(end_esmask, end.w1)) {
> +        end.w1 = xive_set_field32(end_esmask, end.w1, pq);
> +        xive2_router_write_end(xsrc->xrtr, end_blk, end_idx, &end, 1);
> +    }
> +
> +    /* TODO: Forward the source event notification for routing */
> +    if (notify) {
> +        ;
> +    }
> +}
> +
> +static const MemoryRegionOps xive2_end_source_ops = {
> +    .read = xive2_end_source_read,
> +    .write = xive2_end_source_write,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +    .valid = {
> +        .min_access_size = 8,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 8,
> +        .max_access_size = 8,
> +    },
> +};
> +
> +static void xive2_end_source_realize(DeviceState *dev, Error **errp)
> +{
> +    Xive2EndSource *xsrc = XIVE2_END_SOURCE(dev);
> +
> +    assert(xsrc->xrtr);
> +
> +    if (!xsrc->nr_ends) {
> +        error_setg(errp, "Number of interrupt needs to be greater than 0");
> +        return;
> +    }
> +
> +    if (xsrc->esb_shift != XIVE_ESB_4K &&
> +        xsrc->esb_shift != XIVE_ESB_64K) {
> +        error_setg(errp, "Invalid ESB shift setting");
> +        return;
> +    }
> +
> +    /*
> +     * Each END is assigned an even/odd pair of MMIO pages, the even page
> +     * manages the ESn field while the odd page manages the ESe field.
> +     */
> +    memory_region_init_io(&xsrc->esb_mmio, OBJECT(xsrc),
> +                          &xive2_end_source_ops, xsrc, "xive.end",
> +                          (1ull << (xsrc->esb_shift + 1)) * xsrc->nr_ends);
> +}
> +
> +static Property xive2_end_source_properties[] = {
> +    DEFINE_PROP_UINT32("nr-ends", Xive2EndSource, nr_ends, 0),
> +    DEFINE_PROP_UINT32("shift", Xive2EndSource, esb_shift, XIVE_ESB_64K),
> +    DEFINE_PROP_LINK("xive", Xive2EndSource, xrtr, TYPE_XIVE2_ROUTER,
> +                     Xive2Router *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xive2_end_source_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc    = "XIVE END Source";
> +    device_class_set_props(dc, xive2_end_source_properties);
> +    dc->realize = xive2_end_source_realize;
> +}
> +
> +static const TypeInfo xive2_end_source_info = {
> +    .name          = TYPE_XIVE2_END_SOURCE,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(Xive2EndSource),
> +    .class_init    = xive2_end_source_class_init,
> +};
> +
> +static void xive2_register_types(void)
> +{
> +    type_register_static(&xive2_router_info);
> +    type_register_static(&xive2_end_source_info);
> +}
> +
> +type_init(xive2_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index c89d2ca180e9..87855de39b43 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -48,7 +48,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
>   specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>   specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
>   specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
> -specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> +specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c', 'xive2.c'))
>   specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>   		if_true: files('xics_kvm.c'))
>   specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xive.c'))

