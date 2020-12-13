Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013642D8DFD
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 15:34:31 +0100 (CET)
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koSSD-0001F8-9z
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 09:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1koSQd-0000h9-Nb; Sun, 13 Dec 2020 09:32:55 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1koSQc-0002sO-5N; Sun, 13 Dec 2020 09:32:51 -0500
Received: by mail-lf1-x143.google.com with SMTP id u18so23611018lfd.9;
 Sun, 13 Dec 2020 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2MAQxAjtEKjjxuKwXg7rbNGhZHCMEy5JQlXXl2MX4UE=;
 b=WeGkyzSux7PNYoyAU+4D8FneVmsMDOKC7kUbW4OJi8A2UuI4HkWul8qoAEBgGc6EiJ
 KRiEeHsQ5gc1kgYxDePFwHx1DbwrngGfBziMlPDZ8dJroOSrPVCb4hJHWVhXLcEaHEZx
 meJ/IEmzp2obWnXzCzZzcUs02zVOxNC70dJZ6DtcCg9g3VrCCsQm41wpcDvPwL/5xyK4
 vdNj5eSd2Rnhwm0KEKZ3W9jpZ2B8qzmpO7ejyPanXaKGdbMk/m8BMJEtY6ai0oQnRbhN
 X7bSyeKyMUSDjgeMdadGlGkJO2Yc+5AxVfWPuk8R6Xg2LkkBPx35DL0W246RkzvuZ49G
 ToUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2MAQxAjtEKjjxuKwXg7rbNGhZHCMEy5JQlXXl2MX4UE=;
 b=VYICpFaLpMD4ZuLA7MCUHq6EXCPcLCzipJACWqzCbf5Wu1VhlzgCLHjCy64aZRDsCL
 9wa+F1p5Xqnx7gXHa6GwH0miMhE9y8Ghj46gqZ6uQN+8rBkhGA2tToPIhYUB1i1t5Jqu
 5w1EJP7N98ow+CtNeRoJNHatOllCiRB9cv5OBP321m76cTzvZ3gk6tnu+njM1uR+UTuK
 93JI6P1Oz0hSFIywcKzYgB9pJqVFDkT05soeFmiCpTe9piQTZcKkfWzc5Y2K+p8ocQnF
 KR2rdWTBGno3d+lRnTDQz28YUL73XMu40FHUEAZLG7gutIRfoHz6qjzV8SI/WB7GIs0P
 1lvA==
X-Gm-Message-State: AOAM531JMMK8djk3sauyev+0FAhOop6H9RRuc2uy3B1EGp4kCIP6K1YL
 ZZZxVRpo4R6mTZ3yFGlb/9Q=
X-Google-Smtp-Source: ABdhPJyzefoftPiE840rDZ+EVBWzMK3j+y1+mBenum9v3ItWpDo+LYPqg2dFykf6bORkbYtAplD1qw==
X-Received: by 2002:a2e:918f:: with SMTP id f15mr966247ljg.82.1607869967791;
 Sun, 13 Dec 2020 06:32:47 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id d6sm1432865lfl.175.2020.12.13.06.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 06:32:46 -0800 (PST)
Date: Sun, 13 Dec 2020 15:32:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/8] hw/ppc/virtex_ml507: Drop use of ppcuic_init()
Message-ID: <20201213143246.GA477672@toto>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
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

On Sat, Dec 12, 2020 at 12:15:32AM +0000, Peter Maydell wrote:
> Switch the virtex_ml507 board to directly creating and
> configuring the UIC, rather than doing it via the old
> ppcuic_init() helper function.
> 
> This fixes a trivial Coverity-detected memory leak where
> we were leaking the array of IRQs returned by ppcuic_init().
> 
> Fixes: Coverity CID 1421992
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  hw/ppc/virtex_ml507.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 7f1bca928c1..34767b11cad 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -43,6 +43,7 @@
>  #include "qemu/option.h"
>  #include "exec/address-spaces.h"
>  
> +#include "hw/intc/ppc-uic.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
>  #include "hw/qdev-properties.h"
> @@ -95,7 +96,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>  {
>      PowerPCCPU *cpu;
>      CPUPPCState *env;
> -    qemu_irq *irqs;
> +    DeviceState *uicdev;
> +    SysBusDevice *uicsbd;
>  
>      cpu = POWERPC_CPU(cpu_create(cpu_type));
>      env = &cpu->env;
> @@ -105,10 +107,19 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>      ppc_dcr_init(env, NULL, NULL);
>  
>      /* interrupt controller */
> -    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
> -    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
> -    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
> -    ppcuic_init(env, irqs, 0x0C0, 0, 1);
> +    uicdev = qdev_new(TYPE_PPC_UIC);
> +    uicsbd = SYS_BUS_DEVICE(uicdev);
> +
> +    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> +                             &error_fatal);
> +    sysbus_realize_and_unref(uicsbd, &error_fatal);
> +
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +
> +    /* This board doesn't wire anything up to the inputs of the UIC. */
>      return cpu;
>  }
>  
> -- 
> 2.20.1
> 

