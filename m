Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840404C4AE3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:35:44 +0100 (CET)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdZH-0002PA-KV
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:35:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdSu-0007Jd-8q; Fri, 25 Feb 2022 11:29:08 -0500
Received: from [2607:f8b0:4864:20::c31] (port=41803
 helo=mail-oo1-xc31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdSs-0002h0-3B; Fri, 25 Feb 2022 11:29:07 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so6852360oob.8; 
 Fri, 25 Feb 2022 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HhnQQvG0hFVLooNAaYiw0FdTxhefJ2zMUU1zUanTSaM=;
 b=YoAuWHgK2oW13gJs0CfPsc6hKIRJP8eExVjVviIY3hlOPNRQ9c0HG7UjBJBTfmUylU
 dJL5z4W2SjLZlD5p6i1GMVNyH6Jw2xmJOl5Fi9+RfsSF2u6yyqpNm0xYlFiSoYoERhpB
 wzPi8+V5hFnRszFCu5hYNgtZlB+zxoP8UKN0QcIgBGnZWHX6e5B21c7rQ6bQwLVsRFaO
 co45VOoOlbO0SiwfeffeA/tZSQwWmfa2QkEeqojE2Zwg2fNSaM9oc/e2zYPncV+v0Yot
 Q54dfZFGC0jB+fFtrVhxo0F7Kart49cGP3WOkcPdjX53oZUPGoNEhFZmQMiREAwUHzPS
 h9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HhnQQvG0hFVLooNAaYiw0FdTxhefJ2zMUU1zUanTSaM=;
 b=CO+ENQlQnC03y0f0rs9apPMDgussPIohI+FOB4qSbueatOg7VqvA3WIka6YReivMyF
 GkkiJjassRlxi9lIlCP3XvM0RRJutcJxJkaucrj2mFqypllN8bwiY5A8oZlaSaRXiRMY
 nzfttTIZS4J6MjhtyVvPmOtjqI6Sjq+LrkL0F7OlRUGZQ3VOC8dkRqV37PAksRlzFpbm
 tI+D3MG0D5rAsg+O3/PpyJ8uZ/EXYw2CLW+xV6556l1nwtFod3IXmIRAXR/gDMWktcbI
 FxRoV4aFa2tD7zjdAijyS0o6+W00r/ATD2cdmof1G8Gc+odOaMDMILm89cdJIdiLdp3y
 Bw3A==
X-Gm-Message-State: AOAM531ECj+WJFdvOMNsgyt8d93dGGahLvfcMeYWgm3GMLieh+kHh31J
 0sURZJNFzF8p/Pj4gFVg7Sw=
X-Google-Smtp-Source: ABdhPJyl9sRWER64uVA6scFPdHE9YGMg6Kv0s1e0QjzXt+Jazl/JVkj0BR/qoI57/bMXcDzmyZOVAw==
X-Received: by 2002:a05:6870:d291:b0:d6:8c27:ea16 with SMTP id
 d17-20020a056870d29100b000d68c27ea16mr1577767oae.205.1645806544915; 
 Fri, 25 Feb 2022 08:29:04 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 i28-20020a056808055c00b002d51e377248sm1470292oig.33.2022.02.25.08.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:29:04 -0800 (PST)
Message-ID: <7fb82ebc-3dc2-cad0-71b3-724f3f556647@gmail.com>
Date: Fri, 25 Feb 2022 13:29:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 16/18] xive2: Add a get_config() handler for the router
 configuration
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-17-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-17-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
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
> Add GEN1 config even if we don't use it yet in the core framework.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive2.h |  8 ++++++++
>   hw/intc/pnv_xive2.c    | 13 +++++++++++++
>   hw/intc/xive2.c        |  7 +++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index cf6211a0ecb9..b08600cbd5ee 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -25,6 +25,12 @@ typedef struct Xive2Router {
>   #define TYPE_XIVE2_ROUTER "xive2-router"
>   OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
>   
> +/*
> + * Configuration flags
> + */
> +
> +#define XIVE2_GEN1_TIMA_OS      0x00000001
> +
>   typedef struct Xive2RouterClass {
>       SysBusDeviceClass parent;
>   
> @@ -44,6 +50,7 @@ typedef struct Xive2RouterClass {
>       int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>                        Xive2Nvp *nvp, uint8_t word_number);
>       uint8_t (*get_block_id)(Xive2Router *xrtr);
> +    uint32_t (*get_config)(Xive2Router *xrtr);
>   } Xive2RouterClass;
>   
>   int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> @@ -56,6 +63,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>                           Xive2Nvp *nvp);
>   int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>                             Xive2Nvp *nvp, uint8_t word_number);
> +uint32_t xive2_router_get_config(Xive2Router *xrtr);
>   
>   void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
>   
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index b364ee3b306b..2b7d6ccbd097 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -425,6 +425,18 @@ static int pnv_xive2_get_eas(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
>       return pnv_xive2_vst_read(xive, VST_EAS, blk, idx, eas);
>   }
>   
> +static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
> +{
> +    PnvXive2 *xive = PNV_XIVE2(xrtr);
> +    uint32_t cfg = 0;
> +
> +    if (xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS) {
> +        cfg |= XIVE2_GEN1_TIMA_OS;
> +    }
> +
> +    return cfg;
> +}
> +
>   static bool pnv_xive2_is_cpu_enabled(PnvXive2 *xive, PowerPCCPU *cpu)
>   {
>       int pir = ppc_cpu_pir(cpu);
> @@ -1949,6 +1961,7 @@ static void pnv_xive2_class_init(ObjectClass *klass, void *data)
>       xrc->write_end = pnv_xive2_write_end;
>       xrc->get_nvp   = pnv_xive2_get_nvp;
>       xrc->write_nvp = pnv_xive2_write_nvp;
> +    xrc->get_config  = pnv_xive2_get_config;
>       xrc->get_block_id = pnv_xive2_get_block_id;
>   
>       xnc->notify    = pnv_xive2_notify;
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index e31037e1f030..71086c7fbd01 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -20,6 +20,13 @@
>   #include "hw/ppc/xive2.h"
>   #include "hw/ppc/xive2_regs.h"
>   
> +uint32_t xive2_router_get_config(Xive2Router *xrtr)
> +{
> +    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->get_config(xrtr);
> +}
> +
>   void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon)
>   {
>       if (!xive2_eas_is_valid(eas)) {

