Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA35190C1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:54:25 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0TQ-0007ek-9p
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nlz2i-00060t-GO
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:22:44 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nlz2g-0005Bi-Lh
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:22:44 -0400
Received: by mail-pf1-x434.google.com with SMTP id z16so15637734pfh.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JkBff3qImxQuWQ850aH9hM77ZaTQE/H3vVf/5bIoIx4=;
 b=lKWz0KMCxNH3FOPMfTEPkldV8Iy4Y0SNNJUAdhqylHZK42/3Vy4tIEoztSTFbzayV6
 S4yQbf3sfk+cAy+sme45mLmZYjC7//xFwn6KStLjJwSmTqfsUG6Ri+YxCPSRMmU93aJm
 uCyZr2M+0YO+mYKEj6UUA7ianQlHf3f5f5NDo8xehmKQGwBDwSLhDJWyNmX9nKBj4N50
 ao+dQIKEtQmzByJ+rVhWgGOdcJuRhs6bzmjMkmDSSy6kwV/6MW2ojxVKW5uior3xSqj8
 dtnddepsECSkn0cw0JK7WDJ4n5WLL5+0sW95+kQkSjDtxWW+LAcJtgazjHEMWeFze7vj
 YMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkBff3qImxQuWQ850aH9hM77ZaTQE/H3vVf/5bIoIx4=;
 b=gWcPe3D9jQ32+BdNMVQDo5vLg7HbqU9+V/XsS0iJgdYUL9Gm6vdQ4rgFMqtxcByVai
 vEKSUPr4lGgs9KhQATpHfD0bSVqJ6ieiGbWwMjIAjksm+xtSbS4o3Rvv23IjIvDEfYuT
 sWfRiOfugar2qTFg482wQmKEhQLyvlIdZxzOE59BDEbmJ5dU3matludToh4iUl5Y9Rh6
 N94EDJtCDlBzyacZl4B96ZP2bLu+yBe1cyGKgI19Rb1t+CVGTfHWGeWXOj7K5d38eHoX
 fEtNiZsQcZd9VpvwnpHkydRNrlwfs1TShU5fMgbYpWMlmzMs6RaGeMUyl9zFuGpwXalI
 XUdg==
X-Gm-Message-State: AOAM5310h9eGNz0aZabwDRHZXDgGSuGx4lJLxFroKcIQLgFl8DVyonfW
 S16I3FEM7+dPIVr/cQTIRhc=
X-Google-Smtp-Source: ABdhPJwWx9UEPzbcCMg0rWVf1zzDeNXV3oFkZ2zknz9cCCz1nZM97TGCUVts6iHt+zgFqVuwVm4iAw==
X-Received: by 2002:a05:6a00:1a0a:b0:4fc:d6c5:f3f1 with SMTP id
 g10-20020a056a001a0a00b004fcd6c5f3f1mr17582526pfv.45.1651609361083; 
 Tue, 03 May 2022 13:22:41 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170902c7ca00b0015e8d4eb246sm6686691pla.144.2022.05.03.13.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:22:40 -0700 (PDT)
Date: Wed, 4 May 2022 05:22:38 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, openrisc@lists.librecores.org,
 richard.henderson@linaro.org
Subject: Re: [PATCH v2] hw/openrisc: use right OMPIC size variable
Message-ID: <YnGPDumfp1+6DUQG@antec>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <20220503094533.402157-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503094533.402157-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, May 03, 2022 at 11:45:33AM +0200, Jason A. Donenfeld wrote:
> This appears to be a copy and paste error. The UART size was used
> instead of the much smaller OMPIC size. But actually that smaller OMPIC
> size is wrong too and doesn't allow the IPI to work in Linux. So set it
> to the old value.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/openrisc/openrisc_sim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 99b14940f4..3218db6656 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -78,7 +78,7 @@ static const struct MemmapEntry {
>      [OR1KSIM_DRAM] =      { 0x00000000,          0 },
>      [OR1KSIM_UART] =      { 0x90000000,      0x100 },
>      [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
> -    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
> +    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },

Right, I missed this as part of my series.  OMPIC will allocate 2 32-bit
registers per CPU.  I documented this here:

  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-ompic.c

I think what we will want here is something like:

[OR1KSIM_OMPIC] =     { 0x98000000, 8 * OR1KSIM_CPUS_MAX },

>  };
>  
>  static struct openrisc_boot_info {
> @@ -410,7 +410,7 @@ static void openrisc_sim_init(MachineState *machine)
>  
>      if (smp_cpus > 1) {
>          openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
> -                                or1ksim_memmap[OR1KSIM_UART].size,
> +                                or1ksim_memmap[OR1KSIM_OMPIC].size,
>                                  smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
>      }
>  
> -- 
> 2.35.1
> 

