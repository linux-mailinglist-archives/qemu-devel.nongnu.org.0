Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0909574E93
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:04:35 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByWB-0003g0-2c
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oByTV-0006mN-F9; Thu, 14 Jul 2022 09:01:49 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oByTM-0003Wr-3A; Thu, 14 Jul 2022 09:01:48 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-fe023ab520so2276482fac.10; 
 Thu, 14 Jul 2022 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jyp40YJIJhdRUXlKFNCDyy5BtLn8ugHwZmN3PDoOyIA=;
 b=T25tHAWw9YU87fh5wjgYDz4zmuYzUvtluJwhgrAo/HomF4V4pD5HoUPTEle0ynOj4w
 G15AK6EchaLx2WQtjdCfv85yJfKJXurqdx436P4I4pAJibtsdDiOVQmnNxKRCtZVJ70T
 XGlNKad9TvEYQwfJshW3zYsjZhBd0ZIK8zLe/lzk5b4Bfz1jPmuvxXLgEGCHQr14ImDL
 I0aiZiJEecAoyyi0u1HYvZw8R34iJmemnwiW5hibvljwL/w0egiHIDZ/zObed6mkBQZn
 ssAlA8J6WmMZ+C3dqJ6AZLGWJTd5mhyys6FNujx6G+g4H4mev+1cGk3L1y/DZ6oO8Oy2
 V3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jyp40YJIJhdRUXlKFNCDyy5BtLn8ugHwZmN3PDoOyIA=;
 b=Kjwj2kN813HW/XBkPHS7K6+szLvNJrLnmY9CMn04yCKjx1Ka68+hwdV4G2JE7Y4r++
 giy3cWfDANrUB3ZYgG7oGyJ4Ue24qsONzfukcHiTf9sVQvxz2d/l3LMHqHcHjuNrBDtL
 T5XQm+WqcbzKMyRt0DnM2P7hKhBlcFrmbAVitSkaOCT5Iq8e5aJRrDxMgnEjEZ4y/opt
 +kz1RpGfudSDOwX8hZ8X3e+Ud+BjP6N6NrTxdpSXr/udD6/aCbGxDLxdEc336xXSCDnJ
 MEYH+PBoO93FbjyA2dUYt6orFftEWjV3UpYYaxgeGNPEuAInn3o2+MV2fqi9uwP6ZIW8
 bqzw==
X-Gm-Message-State: AJIora/GWe8MyWJs/JhUbNfLyHJF9bAird3Dh6fLcuuo3rdhT4osoxmU
 +4kmVrznOPN4ANoroFkda8mCxDCR+yc=
X-Google-Smtp-Source: AGRyM1s9PqhCc2J6bPFR7tggM2FmyXdQNo0ltuy9yIpR4TqbHH75dZY/NtqHFwQugxHIEowBfcxQqA==
X-Received: by 2002:a05:6870:6015:b0:fe:340e:e854 with SMTP id
 t21-20020a056870601500b000fe340ee854mr4598565oaa.52.1657803698107; 
 Thu, 14 Jul 2022 06:01:38 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 eo36-20020a056870eca400b00101f9e87b39sm802310oab.11.2022.07.14.06.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 06:01:37 -0700 (PDT)
Message-ID: <9ce1bd8d-0fcc-d5e4-c4bb-b0df0c1c7f2a@gmail.com>
Date: Thu, 14 Jul 2022 10:01:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/ppc: pass random seed to fdt
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20220712135114.289855-1-Jason@zx2c4.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712135114.289855-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 7/12/22 10:51, Jason A. Donenfeld wrote:
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This is confirmed to successfully initialize the
> RNG on Linux 5.19-rc6. The rng-seed node is part of the DT spec. Set
> this on the paravirt platforms, spapr and e500, just as is done on other
> architectures with paravirt hardware.
> 
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/ppc/e500.c  | 5 +++++
>   hw/ppc/spapr.c | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7f7f5b3452..2f86eb490e 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -17,6 +17,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/datadir.h"
>   #include "qemu/units.h"
> +#include "qemu/guest-random.h"
>   #include "qapi/error.h"
>   #include "e500.h"
>   #include "e500-ccsr.h"
> @@ -346,6 +347,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>           };
>       const char *dtb_file = machine->dtb;
>       const char *toplevel_compat = machine->dt_compatible;
> +    uint8_t rng_seed[32];
>   
>       if (dtb_file) {
>           char *filename;
> @@ -403,6 +405,9 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>       if (ret < 0)
>           fprintf(stderr, "couldn't set /chosen/bootargs\n");
>   
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
> +
>       if (kvm_enabled()) {
>           /* Read out host's frequencies */
>           clock_freq = kvmppc_get_clockfreq();
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9a5382d527..3a5112899e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -27,6 +27,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/datadir.h"
>   #include "qemu/memalign.h"
> +#include "qemu/guest-random.h"
>   #include "qapi/error.h"
>   #include "qapi/qapi-events-machine.h"
>   #include "qapi/qapi-events-qdev.h"
> @@ -1014,6 +1015,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
>   {
>       MachineState *machine = MACHINE(spapr);
>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
> +    uint8_t rng_seed[32];
>       int chosen;
>   
>       _FDT(chosen = fdt_add_subnode(fdt, 0, "chosen"));
> @@ -1091,6 +1093,9 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
>           spapr_dt_ov5_platform_support(spapr, fdt, chosen);
>       }
>   
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    _FDT(fdt_setprop(fdt, chosen, "rng-seed", rng_seed, sizeof(rng_seed)));
> +
>       _FDT(spapr_dt_ovec(fdt, chosen, spapr->ov5_cas, "ibm,architecture-vec-5"));
>   }
>   

