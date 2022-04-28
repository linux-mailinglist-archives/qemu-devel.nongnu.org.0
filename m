Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B5513352
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:05:10 +0200 (CEST)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2tR-0002kg-P7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nk2qP-0007MQ-QV
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:02:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nk2qK-0000G8-JQ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:02:01 -0400
Received: by mail-pl1-x633.google.com with SMTP id b12so4166537plg.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oqgxivLYi5BUgSGj1DqJZXiNhi/GYiWLJcQntaRw7OQ=;
 b=X3qak8Gru9iT1tyK111h51BUpVgcEMSGBY8p8CnIhlwvJ/lOGMoXaLH9kdJ7ZjIjWg
 n17mNwUcoDJWmJ4xlpwcNozLMOqBbl+ZDbHnWCwfVaJCaSg2ECQWsWTUx2B4HKGyZeoQ
 xt97EfYtoQ2oRnyRKTOJCH7Icd4U/9nEhWImdq8MagvBAKV2Aj3w7vFbeHB8rVBkH5Js
 RPopTEkuYSFLicdq9nqhW3q+IJLr9OSsw3vLYntmkVuAYodo+BXi7ZxWm/F1wBmnOf4g
 mU8rH8yGDy34FRLmSTwT40ApG0uw9cINEzmnzIZfjnTOoMK6yTtu0GhGMXVzgMYnT6f2
 k0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oqgxivLYi5BUgSGj1DqJZXiNhi/GYiWLJcQntaRw7OQ=;
 b=lJIptFXGClnz2WMzRYbXka9CLChDOoP9cNCyCPhS/+4YGHgEA6nJeKLVkl8rgo67M/
 vU8w8LdALIKWHfhyMoGFFFSDPyq2TkLOIwOuP5x7GETgoIYduOEGgA+MmZRUTmjilEjz
 YUqbPrkWUApZ8323dMafI2NmTZYwwl8VOo8Qg+HvYrgg56+bxsnSUPjBOtH1qOvbbLEw
 N+swi7GYN+iV6i6dha3cuitg6OngjQ5Uvcr0zpX+fvd5GS+a9jVlU1Ldgr7KwG3/vIJ8
 ynBiXTM0FLrKsG6mxiKudQ5L6d1fcOLRnQc46HZG2/aPZp8KqkPQkhf92TyegbIHibhV
 QY7g==
X-Gm-Message-State: AOAM531BRv6hdQKDmQ/etBEhWZm4H0N2q70hsB99h6fE4nXcYbbha1cv
 Vtsu+hbvsWNR84t7GqcEwgk=
X-Google-Smtp-Source: ABdhPJzY83hafTI6yBJ6SxBjkxIyoijMdP45Z5bi/063RZb4CAQovSBVK2thtedJveQVIMNCx55N4A==
X-Received: by 2002:a17:902:e051:b0:15c:e5dd:c1c0 with SMTP id
 x17-20020a170902e05100b0015ce5ddc1c0mr26926343plx.1.1651147315044; 
 Thu, 28 Apr 2022 05:01:55 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090a290100b001d840f4eee0sm10605961pjd.20.2022.04.28.05.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:01:54 -0700 (PDT)
Date: Thu, 28 Apr 2022 21:01:52 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] hw/openrisc: page-align FDT address
Message-ID: <YmqCMNHhFCMqjjVF@antec>
References: <20220428103516.1149436-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428103516.1149436-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x633.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 12:35:16PM +0200, Jason A. Donenfeld wrote:
> The QEMU-provided FDT was only being recognized by the kernel when it
> was used in conjunction with -initrd. Without it, the magic bytes
> wouldn't be there and the kernel couldn't load it. This patch fixes the
> issue by page aligning the provided FDT.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/openrisc/openrisc_sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 8184caa60b..99b14940f4 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -356,7 +356,7 @@ static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
>      }
>  
>      /* We put fdt right after the kernel and/or initrd. */
> -    fdt_addr = ROUND_UP(load_start, 4);
> +    fdt_addr = TARGET_PAGE_ALIGN(load_start);
>  
>      ret = fdt_pack(fdt);
>      /* Should only fail if we've built a corrupted tree */
> -- 
> 2.35.1

This looks OK to me, just for clarity we currently are loading:
  - 0x100        - Kernel
  - page aligned - Initrd
  - word aligned - FDT

In the absense of the initrd we need to ensure the FDT is page aligned.

If someone else wants to pick this up to push to qemu if would help, I don't
have anything planned at the moment.

If not I will start a queue in a few days.

Acked-by: Stafford Horne <shorne@gmail.com>

