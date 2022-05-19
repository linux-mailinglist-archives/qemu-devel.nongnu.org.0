Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0352D1B2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:44:41 +0200 (CEST)
Received: from localhost ([::1]:58388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nreZx-0000K7-NV
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreVQ-0007Ax-76
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:39:48 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreVO-0003zW-J8
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:39:47 -0400
Received: by mail-yb1-xb30.google.com with SMTP id a3so8546640ybg.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kIL8cJLC1u3IodxyYOwUFAzG9Ml7ovL2qkWJ49AJ/Es=;
 b=dbyPAXJGz0m+N85JWyZObHLuS8Xg12s7H6sQT8VrGTTt7gzd8E5XBQ8dHyt9ThlI2F
 IxRtkUW/Zkv04qXx2eZg1Bt09C/dq66TzVIVynjFqkJJ7IiVMPD158L7Hd1xDP/KM1O+
 F1ZBR/NPEBVoNd+QKshxw8VYzYBejR/yqrn3Witrr65UIhgDDnYM3pJcN/MY0WGS3jCQ
 +wuM+8F+WUsqgY8ijXEGbkOK5jR3GHS2B64NToBM/gcy317nqIyMhlU05sYa+tRzzoVL
 qxtExhxVB7XFiI0s5IeE5dgOiSGk/ko1lEomWTJ7fJZbCFVc5O4SqOEeXYFlG7rHyqHG
 1jfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kIL8cJLC1u3IodxyYOwUFAzG9Ml7ovL2qkWJ49AJ/Es=;
 b=IOpaKpMbCIuJzY6yMTeq9ayyK5UIRJ/i76NEjGrdIPqBS/NQj8T8Q7sDSaccEPQj7v
 f5t/Ce9Cz7g21I97TlWm46D8Bcjpew4o+bqXaHuvk1lxGPDuT2R76Jqm4XC7ZlYR6uVq
 bhUafUUpZrqDMkYM9vYv8x/er6eWNa0vOyPlLfDY9fjFw0IibE+9iprmDxaq5met1/wD
 q0Yv16C2VwrG3zmg0KW1Nds+czAeNJ4pZaSiGtM2Uq8pkt8vTz8TfoQu2hUhcLwXLnvx
 cwFdJe+azP59QXgfxHXvk6/19fKbvLTzynrU8W/QaQKQJ50yWXOuTPMKTTTg6dHiMtHT
 SveA==
X-Gm-Message-State: AOAM531tnbnxlvgJen+jbiaKnBkOPlP1y+7M2i7XxUANDWDNxj1UrYxR
 n+IFOLDSPnvzlv4pTsERK4q0MvVWXKlvA7894Hrkqg==
X-Google-Smtp-Source: ABdhPJzVmEwEKZ7MG/VAG52tfx2D1Ed2iV+W+FyxImmO6DYV7XScX7FhywbjpMPEMngm720WW5Ri0iUjn5rA+UxwRXo=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr3830657ybu.140.1652960381470; Thu, 19
 May 2022 04:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-8-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 12:39:30 +0100
Message-ID: <CAFEAcA_sQzRhq3WNLR3CvmBtt_Wz7Oc=+chDOXrTSrYSj7t6Ag@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/arm: Add el_is_in_host
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 17 May 2022 at 07:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This (newish) ARM pseudocode function is easier to work with
> than open-coded tests for HCR_E2H etc.  Use of the function
> will be staged into the code base in parts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |  2 ++
>  target/arm/helper.c    | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> +/*
> + * Corresponds to ARM pseudocode function ELIsInHost().
> + */
> +bool el_is_in_host(CPUARMState *env, int el)
> +{
> +    uint64_t mask;
> +    /*
> +     * Since we only care about E2H and TGE, we can skip arm_hcr_el2_eff.
> +     * Perform the simplest bit tests first, and validate EL2 afterward.
> +     */
> +    if (el & 1) {
> +        return false; /* EL1 or EL3 */
> +    }
> +
> +    mask = el ? HCR_E2H : HCR_E2H | HCR_TGE;
> +    if ((env->cp15.hcr_el2 & mask) != mask) {
> +        return false;
> +    }
> +
> +    /* TGE and/or E2H set: double check those bits are currently legal. */
> +    return arm_is_el2_enabled(env) && arm_el_is_aa64(env, 2);
> +}

What about the HaveVirtHostExt() check ?

Otherwise, looks like it matches the pseudocode, but I'd
rather wait until we have some uses of the function before
I think too hard about it.

thanks
-- PMM

