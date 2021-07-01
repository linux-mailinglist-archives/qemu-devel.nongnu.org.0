Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B43B94BE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:38:37 +0200 (CEST)
Received: from localhost ([::1]:36900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyzi0-0001Mo-IG
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzgd-0008No-Ps
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:37:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzgc-0004I9-Ay
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:37:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u6so9031762wrs.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HwRBFPOzSwaqxGWuXpEnSjWphOYTYHUc10Um5Q8a5sI=;
 b=UIQ1iCsA1XuAuGFru60O9ZlBICjYvW/rVMCRUErz5XymrfQfXcLxWomvvw8V+GikcE
 q4tdJU31BZtWzJJRCQIdcllFudQWeYGOAwT0+aZOed7R2ZGrBPsUsOQkmZjL7LJ+QR1I
 ewxSTnIX0Y0Dq9KO4OfcHquRzxP3oG5Hx1brZI2Bv0aUcN+ROFqv/yZZdYgyJnGQMfHs
 yxv8jk33sEOAlOuQoXly1gCVSIQVoL6fZiBz0oEu+BBucwbzSTgtOej92mwv0YZISUNZ
 z7Z3BH7hCE8Dyf209tzw1bbklnT31VPWmGt2pKqJWLzMPPiqoOk5WGGqJeXqjRRLbPfr
 2NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HwRBFPOzSwaqxGWuXpEnSjWphOYTYHUc10Um5Q8a5sI=;
 b=eXMiKmwV4wUOp3UKTmVUYkjPEbdoGp4HDnhO8dUa7LDsj62ShWjAFfd4ENU36MLHdh
 Q1zoZnl3In+0Sfw+/6k52BXa+MxXx70+raU8+M1EzHkCRZuc/PmjXHtqmnk6XL61+2vG
 Z0ri/J7hGks941NvQKX9Z19wwMojzLorZVGYQzCJ3rlnUqi7126qU6M4rgW/Wpb5wAlf
 ltzJnlf+RhtgIG4yiVzhZni4Y/uiXtESueIRYN+Xw7acI9warZy52ZsDVDjwbx12J6/p
 orAZdDmFAzNUBr6jn9TsfDmYQr0JLCgkIOJLQNGtXnvOOeNCsLKmfP90BTV+jrqeUheS
 PRfQ==
X-Gm-Message-State: AOAM530WwwDG1468k3iOCEKT3nNlXZm3A4Cy7ef9UtXDKHQIXAb9dyFU
 JlsEwj1idEt5Cf8h7As6E2Y=
X-Google-Smtp-Source: ABdhPJwTJkMzGo4VESHqNOpH3DAXzGQpuIHFaXxj/2GCZG5ZwjW6OWqeNrKrxo8dx9k3MMneZttkTg==
X-Received: by 2002:adf:e107:: with SMTP id t7mr658527wrz.165.1625157429050;
 Thu, 01 Jul 2021 09:37:09 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id v15sm10245515wmj.39.2021.07.01.09.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 09:37:08 -0700 (PDT)
Subject: Re: [PATCH 06/17] tcg: Remove TCG_TARGET_HAS_goto_ptr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
 <20210701152537.3330420-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4adbc454-ae34-2aa8-795d-884361b1bbf5@amsat.org>
Date: Thu, 1 Jul 2021 18:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701152537.3330420-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 5:25 PM, Richard Henderson wrote:
> Since 6eea04347eb6, all tcg backends support goto_ptr.
> Remove the conditional, making support mandatory.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h    | 3 +--
>  tcg/aarch64/tcg-target.h | 1 -
>  tcg/arm/tcg-target.h     | 1 -
>  tcg/i386/tcg-target.h    | 1 -
>  tcg/mips/tcg-target.h    | 1 -
>  tcg/ppc/tcg-target.h     | 1 -
>  tcg/riscv/tcg-target.h   | 1 -
>  tcg/s390/tcg-target.h    | 1 -
>  tcg/sparc/tcg-target.h   | 1 -
>  tcg/tci/tcg-target.h     | 1 -
>  tcg/tcg-op.c             | 2 +-
>  tcg/tcg.c                | 8 ++------
>  12 files changed, 4 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

