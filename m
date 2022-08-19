Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED259A2F4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:43:26 +0200 (CEST)
Received: from localhost ([::1]:52992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP61l-0007hW-NW
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oP5hP-0004Ry-TF; Fri, 19 Aug 2022 13:22:25 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oP5hN-0004ml-Vg; Fri, 19 Aug 2022 13:22:23 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so3466619otq.11; 
 Fri, 19 Aug 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xoXy7E5Z3SnvPWBrB+VQYbo9TIzj0+Bo+eYVIiqvD5c=;
 b=p9xf7BYwHtRmkZCmDzua6aw3qxMpIqk519zGdcKTDaQOswq+vU5NGZKhZ97wFeWNDP
 Y+CJO1EVmoXngHfSivtqrVZQ8JmsSDBA1LVwy3jHZM8Lfu+qLzYKJVYB1vMogL2MRRrx
 WsOXO8VBslDCrL/10gxoW/hi8kwf3VdQga1Fz8+0nVKHXJDHSnKuGnBpewOGClYALLtv
 uo8KIXrByyhzrl3JMaZbtSJppHXYJ902V3t53AIwBrqSMA32qSl3P6zD8UFsg4u3rfXB
 kXUnQAXMbMbYlKUmcx7LM7AlA6Cx7SdrzyIS2fOv0hMJpDP06ouuZa2k0XGEmu1Npyv8
 sg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xoXy7E5Z3SnvPWBrB+VQYbo9TIzj0+Bo+eYVIiqvD5c=;
 b=bR5mrlarWuWtFVnEja7aLCMLe7NUCr8dIqQyxWW1EYhu9Sc9ESbsowrFlrUlWS5BVL
 OZlMnMINRm+bfdGumfybrwM81GKuhP6I+Gbb3gda4ygAUU6FXdJ9040TUVrua6AeZp9G
 m18clha38cozG3zaMIrT9nbbW1UXMUhThSQFaxytw/xCgipJi75Xfprdk7bJreKJxi8H
 EHimykBAdctL7oxpbyCgSjK6GZCumi3lHE+rJf7m697hNfmBdIzfhjCLtJh2wetimqlt
 c/L6KCzmKpex87TyQ15X1pHkX1KPdEYeBBjS8lXc6VXNswSklSpLR0B4hNFM6nEdIuSU
 LaGQ==
X-Gm-Message-State: ACgBeo0FeVkTj8nyLstF+ERlE36LTaDE1bSkZI+1JP9Wj7J93/a29eMv
 dVHYnUs4wMhVW0qX0zdgdhE=
X-Google-Smtp-Source: AA6agR6RCbBkQetvBsr4cKkxuKoE0+TEMhHIvWBMoiVkbMKL7WRpxevzR7N8YsALTEIu375p/m482A==
X-Received: by 2002:a9d:c64:0:b0:636:df4c:e766 with SMTP id
 91-20020a9d0c64000000b00636df4ce766mr3411755otr.12.1660929738808; 
 Fri, 19 Aug 2022 10:22:18 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 kw37-20020a056870ac2500b0011c6b9abb67sm1392759oab.46.2022.08.19.10.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 10:22:18 -0700 (PDT)
Message-ID: <67d7080b-e854-d1f4-e1c6-db420f0df450@gmail.com>
Date: Fri, 19 Aug 2022 14:22:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/11] hw/ppc/pnv: Avoid dynamic stack allocation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-7-peter.maydell@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220819153931.3147384-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
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



On 8/19/22 12:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Feel free to take it via target-arm.next.



Thanks,


Daniel

> ---
>   hw/ppc/pnv.c               | 4 ++--
>   hw/ppc/spapr.c             | 8 ++++----
>   hw/ppc/spapr_pci_nvlink2.c | 2 +-
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d3f77c83672..dd4101e5b65 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -137,7 +137,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
>       int smt_threads = CPU_CORE(pc)->nr_threads;
>       CPUPPCState *env = &cpu->env;
>       PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
> -    uint32_t servers_prop[smt_threads];
> +    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
>       int i;
>       uint32_t segs[] = {cpu_to_be32(28), cpu_to_be32(40),
>                          0xffffffff, 0xffffffff};
> @@ -240,7 +240,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
>           servers_prop[i] = cpu_to_be32(pc->pir + i);
>       }
>       _FDT((fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
> -                       servers_prop, sizeof(servers_prop))));
> +                       servers_prop, sizeof(*servers_prop) * smt_threads)));
>   }
>   
>   static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dcf..28626efd479 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -177,8 +177,8 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
>                                     int smt_threads)
>   {
>       int i, ret = 0;
> -    uint32_t servers_prop[smt_threads];
> -    uint32_t gservers_prop[smt_threads * 2];
> +    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
> +    g_autofree uint32_t *gservers_prop = g_new(uint32_t, smt_threads * 2);
>       int index = spapr_get_vcpu_id(cpu);
>   
>       if (cpu->compat_pvr) {
> @@ -196,12 +196,12 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
>           gservers_prop[i*2 + 1] = 0;
>       }
>       ret = fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
> -                      servers_prop, sizeof(servers_prop));
> +                      servers_prop, sizeof(*servers_prop) * smt_threads);
>       if (ret < 0) {
>           return ret;
>       }
>       ret = fdt_setprop(fdt, offset, "ibm,ppc-interrupt-gserver#s",
> -                      gservers_prop, sizeof(gservers_prop));
> +                      gservers_prop, sizeof(*gservers_prop) * smt_threads * 2);
>   
>       return ret;
>   }
> diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
> index 63b476c8f72..2a8a11be1d6 100644
> --- a/hw/ppc/spapr_pci_nvlink2.c
> +++ b/hw/ppc/spapr_pci_nvlink2.c
> @@ -397,7 +397,7 @@ void spapr_phb_nvgpu_populate_pcidev_dt(PCIDevice *dev, void *fdt, int offset,
>               continue;
>           }
>           if (dev == nvslot->gpdev) {
> -            uint32_t npus[nvslot->linknum];
> +            g_autofree uint32_t *npus = g_new(uint32_t, nvslot->linknum);
>   
>               for (j = 0; j < nvslot->linknum; ++j) {
>                   PCIDevice *npdev = nvslot->links[j].npdev;

