Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE97209E76
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:31:07 +0200 (CEST)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joR20-0001xQ-Qu
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR0o-0001L8-4d
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:29:50 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR0l-00084q-8k
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:29:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id 5so3052520oty.11
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JQ3cOtNgqcebFXDwXc7bOMstWQhxg9W2+HncHAN3F8=;
 b=ohaochvCRD1gzidk5DdsE6jiETSp4gFwyR7pgzyb8eu9jESZWo5TZbh4/4Q3KGTcc5
 cyBcKpXTLPmBf0vzl6DmuKL+yhhSm24nhzQYjHFS5axw0oDA0sEGWqcZ6ewr8edmxMah
 gmLrYuuzPSGOydc3mhDoVxu+eVQhKsD96MW8jXk0zZfGZ9mBFDEIyBkCytbNFqyjPaHh
 a3aD86bA1pcILw8MPrjQb1LH/f5pv6FW2jTleEYLP5vihyBcNvtMDCWihAEoU0yL6UaK
 Qo1RwH5vLxY238dCxpY1oHlyBhx8F+/gyXHyfTV1Yz7putUY7a6saQiGByqpUGqLy8wp
 mjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JQ3cOtNgqcebFXDwXc7bOMstWQhxg9W2+HncHAN3F8=;
 b=pqmJWjBK2dVgm5gAWhAxfOcYJcYUfz3LDcbOG43T2YrRqRrjyDHUaaMem5PFS7x0YL
 TlHaVJUr0eWTCMSpVNfjNdtGuEbtGSekOVzBWFwIc+6xc5VPlTVU1JGAK+BC+oZ6Rwej
 5sMANWrc1fW485ltcYNzNYjRUYj1Muf4yy+G3XEwHKerNSDI+EtMAQVRRubwVUIqEqoV
 PeA8PLr2O1+WhNXUmgmOpq3x+Ddh+KruxoafmoArvor+l+ZWUycfgJm0DUByXm37pT1N
 BKr5qGV1YojnYRtEnPm9rJMeJo7ASq7Mjxr09M2JT0sPjPdVeEYEx6ydWJruUpO+73AS
 YIsA==
X-Gm-Message-State: AOAM531ickrNaQ8P1jq9zr7UQJo+eMvd5ilngYKC0XOAG7viW9+I4t54
 yCo2si15s3RHw9CCeG4m6esfn5zj50sipuYjuXA8lg==
X-Google-Smtp-Source: ABdhPJymQDLlr5GsJqz+e/UUerM6JcNRLSGZMW5AuwGj0oUe58PcK4qztntzzi2xyXBaisP32wl6MWlOrEkMMr0rBa0=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr12662006oth.135.1593088186001; 
 Thu, 25 Jun 2020 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-33-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:29:35 +0100
Message-ID: <CAFEAcA9+-MoV23aFk_7fcWR29HUREbRt3qaDD59iPvSP2AMrew@mail.gmail.com>
Subject: Re: [PATCH v8 32/45] target/arm: Add arm_tlb_bti_gp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce an lvalue macro to wrap target_tlb_bit0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +/* Helper for the macros below, validating the argument type. */
> +static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
> +{
> +    return x;
> +}
> +
> +/*
> + * Lvalue macros for ARM TLB bits that we must cache in the TCG TLB.
> + * Using these should be a bit more self-documenting than using the
> + * generic target bits directly.
> + */
> +#define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)

It seems unlikely that we wouldn't get a compile failure if
we passed something other than a MemTxAttrs* to this macro,
given the specificity of the field name, but I guess it
gives us a less confusing compiler error ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

