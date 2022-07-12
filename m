Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8457273A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:28:28 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMUd-0004vM-6M
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBMTE-0003Yv-V6
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:27:00 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBMTD-0004ZF-Df
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:27:00 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 t128-20020a4a5486000000b004287b14f5c6so1722634ooa.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=n2Q2xy3u/S2C5Y0o/1JOryVSWjZ7OSJr9nwFtnggnE8=;
 b=P0mP5LcqI9Fzne4H0X48yiKCpDjf9LKW07YSq/sZCvfFtAb+f4UA2/aoVT4d3rttj0
 tND9MMKcOPFlBd/pNDd3IEKZc4dnYA96G27ElPBx8IskZgCzKDTl9yzuPLe8rM1LWsR7
 Us9hqFfcd0cnlOdDtf9X7rhpikPW5v457aBDpIvqlmarf0Q44hIuHBzdmgKouMcGPD4J
 U9Mh9rsJd7JHTIRereh0mdhLTJy+tRUEBuzkhsoVQ4+3k+A9P2vNYocFKja0IeU4cB0n
 sAyVra0D4L7RGmUqvi41o9BSf09RdajBCRCjPUCv9mD44571Dk8oyNtAyXdfIXEBZWZq
 Dg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n2Q2xy3u/S2C5Y0o/1JOryVSWjZ7OSJr9nwFtnggnE8=;
 b=d65gnAsYNbH5+nqsuaUgQKHzT7oBmGcxGKJgoUb/GtqQCFxn3OUlXG5DBNyHj457bV
 /lqNCPTT42kI4eaFG/qr7aEQt+m4I1+czTDltydRcf6Ik3zC+lzXW4UK3/IYdjMB6Kvq
 7PtWc6hReSsBnxGGUjJI1AF5oBZmT7Z/l1ztwFVse0xNFIG1aIpkdeUHIOqas8UoN0bg
 OJ8O4G0t98LqXipt82N72HK8YfpA7p90BafRycf5kGKu8b3ZsW3x53z0gZTQEVyQLgRy
 lr8QenAFZni2a95aztgfisyEODmupHSO6NDAJxrUZkNKKFqx5mnbAWW7nQF4E1ijTwJA
 hxAg==
X-Gm-Message-State: AJIora/UbC2mnkhHAVypZb/m/G4Xqo4q698d4xgqA9Ob135sLh176r8s
 C5OKkJw3PaBNXA/WJG79kAx2sfwZ9CQ=
X-Google-Smtp-Source: AGRyM1uQENzRgmtksgEAVNyvWevReRSkz8uS6J8w6TWMEx5z1LDD2OeEWAvhKgxXFG6OzuSgJ+ygNQ==
X-Received: by 2002:a4a:944c:0:b0:41c:18de:d334 with SMTP id
 j12-20020a4a944c000000b0041c18ded334mr9193244ooi.4.1657657617833; 
 Tue, 12 Jul 2022 13:26:57 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 z11-20020a056871014b00b000e686d13883sm5070456oab.29.2022.07.12.13.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:26:57 -0700 (PDT)
Message-ID: <7310087f-443e-ebdb-f345-a18358a874e4@gmail.com>
Date: Tue, 12 Jul 2022 17:26:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/ppc: pass random seed to fdt
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
References: <20220712135114.289855-1-Jason@zx2c4.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712135114.289855-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
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

With current QEMU master, running a fedora 36 ppc64le guest with a
5.19.0-rc2-00054-g12ede8ffb103 kernel :

[root@fedora ~]# dmesg | grep -i rng
[    5.130623] random: crng init done
[root@fedora ~]#


After applying this patch:


[root@fedora ~]# dmesg | grep -i rng
[    0.000000] random: crng init done
[root@fedora ~]#



Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>




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

