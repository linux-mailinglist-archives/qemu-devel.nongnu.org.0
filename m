Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C976A0CD4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDT7-0004ky-UJ; Thu, 23 Feb 2023 10:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDT4-0004cb-Vx
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:25:11 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDT2-00020j-Tu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:25:10 -0500
Received: by mail-pg1-x536.google.com with SMTP id z10so5754744pgr.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zbAdwnMghSTWFEpuJewSk+X+0/bwV0RXTWu2NdcKuko=;
 b=avE4yRU/mLWkWihxLB5mBI9Y/V4VhzTnVMzq4dduz8IfsEKDF6esBLGekYg58tCd6m
 5rSDWWnmXp/zQ8mf5ALlgCoVHdVsPxsGVuoh+DVn3iU8X8tRhCIn3Cd+dFIn2o6FMJKL
 abCcSiLyKS2wnLAzyFtAs/oihHJI4+g7SIilEvCg9We2nazlZm3SuNvj1TsJqRsMSPjq
 /B92D1mH1BgK/cRNPoBi0P9ov59DTXeilEnbGfzaKeuhdo/f4Ow7sZ/oSmYEXEBCFwdv
 OEvZJZA2Q0uCbg6jWHueutQ0iL4MzSqzfzWAP5nm9sRgoBJGceAmHaTdgRmPLKTWmL6y
 gjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zbAdwnMghSTWFEpuJewSk+X+0/bwV0RXTWu2NdcKuko=;
 b=vaotsljkdEjjGj5mQxZCVMQSz9j1GRyK6snebm5K97Vb5962uuOI5qypLJMa5CQbjp
 oXPMZVHx9VWEdCGDdd6kCLH7QiuPvcQrwNfbDsMpdDOEcRSglriSh8SHkeXogDVGS/m1
 yiE/D1ctQB2u1XErJ3TFv0f3CnZRC+yo8Nn31c+S1ZSgbe3bRdAXJ3HT2uHLB/r0wN6g
 L5Nnf2LmxKUYuwRyLhrUYVmOK8jTy8WRwML2rc0gaJjE46Fr292v83aBiQhjq71oFIiU
 yVVIGPXdN5QoLTHOFetLjJiieodYYxAH4hxFLvicAcacqPOwgESr3B0Q5btYJc8Gu6A5
 oE+g==
X-Gm-Message-State: AO0yUKW0nfSqEaLUeSadgEbuqPy6Pn6FLA2NH/YhPfyInAclPnzEdEM+
 B8Plq6z1kZsuQOIXjsXnRqGnJN6mAAexGU9+hSohUQ==
X-Google-Smtp-Source: AK7set8W+YkqTqybMYJBGoWfpkr5S6DKm2Gbg6KPLDyEW0P5huB+ZbcS3Jf1DpB5cILPFDwa8u0vFiBWrhKrGwx9ySU=
X-Received: by 2002:a62:8387:0:b0:593:974c:cba7 with SMTP id
 h129-20020a628387000000b00593974ccba7mr1871546pfe.5.1677165907200; Thu, 23
 Feb 2023 07:25:07 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-5-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:24:56 +0000
Message-ID: <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG,
 STZ2G
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in that these two insns should have been using atomic
> 16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
> index a981de62d4..04974f9ebb 100644
> --- a/tests/tcg/aarch64/mte-7.c
> +++ b/tests/tcg/aarch64/mte-7.c
> @@ -19,8 +19,7 @@ int main(int ac, char **av)
>      p = (void *)((unsigned long)p | (1ul << 56));
>
>      /* Store tag in sequential granules. */
> -    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
> -    asm("stg %0, [%0]" : : "r"(p + 0x1000));
> +    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));

Why did we need to change the test program ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

