Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564AF2D8E01
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 15:37:41 +0100 (CET)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koSVE-00047b-Bx
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 09:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1koSSz-0002nt-Gw; Sun, 13 Dec 2020 09:35:18 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1koSSx-0003a1-Or; Sun, 13 Dec 2020 09:35:17 -0500
Received: by mail-lf1-x142.google.com with SMTP id x20so4091949lfe.12;
 Sun, 13 Dec 2020 06:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/PF/lE0iCgpUNgi98UKCAfkSOYCBApzqR+MVd4ylcm4=;
 b=YtTeU+esJ1mCmLn2fQhxdvZX5Ap9+4ShhULuhb8N7YV3GAItyLa1tguutLJCVQPInX
 40O6EpJ3o9EbJyGWVQ3LBHLS4DjlZKBtIPGJrFWbA0pFnYI+9z8Andz5ntBQ0B+vMv09
 3sN8EnUfrkGDaqrFmKYTvXDGFspRi1zNkw/QodJNwKzJ39JP3de/VXjDnMk2RxS/QjU6
 mBD8a3rZ7k7bbrS71lpa/G6O/bJdbp+vvjSuOcwwsiwh3VUJnhZKgcecmeMIixL/bkFs
 F2ZR7qUbkBLl6Y7B01Cf657osC+2aGYM4ltGAoHWvCl135A26iTspXSlcet0PPqd9NLs
 d/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/PF/lE0iCgpUNgi98UKCAfkSOYCBApzqR+MVd4ylcm4=;
 b=Dr3Of3la+uDmhPCG7ITYyS/WtnJi+CVwXXFKVDaXSk1sBGp3wOmFMYF4tP8zWN5GrZ
 KZTTRQ4huAdhczclqSMH/r5ll+lHctU/V7MNxS90S6COsmF0HF+mwm756BJDEKPGPaqy
 gaiqKOQWb0mCXSbAiLPbf5s7NSObuqTAE6UOgTfg8XO/aXUXkHTHlDggCdg7CX1CAluB
 Xpnyelb+1L6nfQNQzFK5wCAD+RgrvxmFt3YaeAUNsru9jIno03qYZ1pc8Axk4b6HcGzd
 XjWuBdrPeEP0CL63tTFFgDGDjuzZHRbOgHlKx9hgDL5mqL9J8UhLumzHejoro9fx2ACw
 VN1A==
X-Gm-Message-State: AOAM530Kznki9wU8gJJglNfT264PjSI+FVjk0DHoNLcaIzu1r+kZUQM2
 To832wKXgfbQ3sOqJzL/zAM=
X-Google-Smtp-Source: ABdhPJzAQaBBlA+wzE0uitzfi5kDZsq//KGxcou2hW346nkkfrrc2yZCEZeJuxyR1X0lc6jpnyX0Yg==
X-Received: by 2002:a05:6512:1090:: with SMTP id
 j16mr7688536lfg.543.1607870113601; 
 Sun, 13 Dec 2020 06:35:13 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id c16sm1718996lfb.236.2020.12.13.06.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 06:35:12 -0800 (PST)
Date: Sun, 13 Dec 2020 15:35:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/ppc: Remove unused ppcuic_init()
Message-ID: <20201213143512.GD477672@toto>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-9-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-9-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 12:15:37AM +0000, Peter Maydell wrote:
> Now we've converted all the callsites to directly create the QOM UIC
> device themselves, the ppcuic_init() function is unused and can be
> removed. The enum defining PPCUIC symbolic constants can be moved
> to the ppc-uic.h header where it more naturally belongs.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/ppc-uic.h |  7 +++++++
>  include/hw/ppc/ppc4xx.h   |  9 ---------
>  hw/ppc/ppc4xx_devs.c      | 38 --------------------------------------
>  3 files changed, 7 insertions(+), 47 deletions(-)
> 
> diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
> index e614e2ffd80..22dd5e5ac2c 100644
> --- a/include/hw/intc/ppc-uic.h
> +++ b/include/hw/intc/ppc-uic.h
> @@ -47,6 +47,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(PPCUIC, PPC_UIC)
>  
>  #define UIC_MAX_IRQ 32
>  
> +/* Symbolic constants for the sysbus IRQ outputs */
> +enum {
> +    PPCUIC_OUTPUT_INT = 0,
> +    PPCUIC_OUTPUT_CINT = 1,
> +    PPCUIC_OUTPUT_NB,
> +};
> +
>  struct PPCUIC {
>      /*< private >*/
>      SysBusDevice parent_obj;
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index cc19c8da5be..980f964b5a9 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -33,15 +33,6 @@ PowerPCCPU *ppc4xx_init(const char *cpu_model,
>                          clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
>                          uint32_t sysclk);
>  
> -/* PowerPC 4xx universal interrupt controller */
> -enum {
> -    PPCUIC_OUTPUT_INT = 0,
> -    PPCUIC_OUTPUT_CINT = 1,
> -    PPCUIC_OUTPUT_NB,
> -};
> -qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
> -                       uint32_t dcr_base, int has_ssr, int has_vr);
> -
>  void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>                          MemoryRegion ram_memories[],
>                          hwaddr ram_bases[], hwaddr ram_sizes[],
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index ffe4cf43e88..fe9d4f7155e 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -77,44 +77,6 @@ PowerPCCPU *ppc4xx_init(const char *cpu_type,
>      return cpu;
>  }
>  
> -/*****************************************************************************/
> -/* "Universal" Interrupt controller */
> -
> -qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
> -                       uint32_t dcr_base, int has_ssr, int has_vr)
> -{
> -    DeviceState *uicdev = qdev_new(TYPE_PPC_UIC);
> -    SysBusDevice *uicsbd = SYS_BUS_DEVICE(uicdev);
> -    qemu_irq *uic_irqs;
> -    int i;
> -
> -    qdev_prop_set_uint32(uicdev, "dcr-base", dcr_base);
> -    qdev_prop_set_bit(uicdev, "use-vectors", has_vr);
> -    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(env_cpu(env)),
> -                             &error_fatal);
> -    sysbus_realize_and_unref(uicsbd, &error_fatal);
> -
> -    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT, irqs[PPCUIC_OUTPUT_INT]);
> -    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT, irqs[PPCUIC_OUTPUT_CINT]);
> -
> -    /*
> -     * Return an allocated array of the UIC's input IRQ lines.
> -     * This is an ugly temporary API to retain compatibility with
> -     * the ppcuic_init() interface from the pre-QOM-conversion UIC.
> -     * None of the callers free this array, so it is leaked -- but
> -     * so was the array allocated by qemu_allocate_irqs() in the
> -     * old code.
> -     *
> -     * The callers should just instantiate the UIC and wire it up
> -     * themselves rather than passing qemu_irq* in and out of this function.
> -     */
> -    uic_irqs = g_new0(qemu_irq, UIC_MAX_IRQ);
> -    for (i = 0; i < UIC_MAX_IRQ; i++) {
> -        uic_irqs[i] = qdev_get_gpio_in(uicdev, i);
> -    }
> -    return uic_irqs;
> -}
> -
>  /*****************************************************************************/
>  /* SDRAM controller */
>  typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
> -- 
> 2.20.1
> 

