Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD236F83BF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:19:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvL1-0001Hw-8O; Fri, 05 May 2023 09:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvKz-0001Ga-TM
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:19:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvKx-0006Lj-RK
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:19:05 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2681818a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292742; x=1685884742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1iJg/In4kVZIJb5M1mlBGflolji94+DeBxWhy9kvlPs=;
 b=VIJPxRZIaTDhIhZpK1UEGjVGZ1ORFIv2QT1s8gBCZqq6kv7JorqY31UKHpU3PDD+iU
 Ekk3F3KE6G37rG6TVdOXgjMOlQXiZewbUHCEluTsBqsTVHIIerPn+tFY8ygJ3v2qJTzE
 2o9K705IByIJnBEarJQFWjkMR4dBEXNgcLAmoLZzgAYnKMsaRr95J3SEYbrft6bQ4h4k
 9TD8TzQGPFQiWwdY+r7/vhYoUbHR7C+rrJGz5U2MPZmiwpPkcv+k2kPtt5AUTFvmxteb
 z+/Q5vTfxtne/yHH/AozILSvMRN63DSCRZee3PP6PkQ2n+fLg6hJ3omtI0nuWJMgeqUr
 vxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292742; x=1685884742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1iJg/In4kVZIJb5M1mlBGflolji94+DeBxWhy9kvlPs=;
 b=dUK+rTVQnvAnvO00zFulIwWUngQEarqPmzUYgoOt+jwwkYUEkFb8cJm9ZWjbtVLOrS
 uD+AHmKIwzcw35O5fd0c4DuRb75PByly1yJL4SkXDatDOmZVCmbWD6OqDPrUl1DOdBrq
 9X5bRV+5xGRQar934q4R7Fv8u7OkBhgROE/rfbAJ0c6JsRt5BFqDvNk+eFpfFMJNyi4Q
 n7W1lnkXUHZNrUPlKqhIoN2Pno4HZXR01Ip38WOshOv7wkwRQ9EKW7AF4gIjWbSrI8UB
 fRNZIiAR12QF8z3dGpueZ7s6lk9bgeSknqxChr9lejeaq45+MmRj9RnGMGHJ4n0RzGxJ
 p+2g==
X-Gm-Message-State: AC+VfDx6cFElJJB3e96rjqes7SvR939R9ad7j95DLWfqufMo3lSVJyPW
 fpTyQ+VYGonhz+RA0jD/TtLHYTlcWV5qsGtu3wPggA==
X-Google-Smtp-Source: ACHHUZ4Hh8A/JZtXZdkV6mmIlmx75i4wZgNI7DDAwtKx3iKY0uTkZQkza3JJI7o1x+3GF75upUn1h5J/J3YTSG6OX4U=
X-Received: by 2002:a05:6402:31f4:b0:50b:c370:4967 with SMTP id
 dy20-20020a05640231f400b0050bc3704967mr1666027edb.19.1683292742207; Fri, 05
 May 2023 06:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-49-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:18:51 +0100
Message-ID: <CAFEAcA8G_AAmPuNhX9k3AqAFStJ7mnMftoEH6N08abRz8i-ZSQ@mail.gmail.com>
Subject: Re: [PATCH v4 48/57] tcg/ppc: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index f0a4118bbb..60375804cd 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -2034,7 +2034,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> +    MemOp a_bits, atom_a, atom_u;
> +
> +    /*
> +     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
> +     *
> +     * Before 3.0, "An access that is not atomic is performed as a set of
> +     * smaller disjoint atomic accesses. In general, the number and alignment
> +     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
> +     *
> +     * As of 3.0, "the non-atomic access is performed as described in
> +     * the corresponding list", which matches MO_ATOM_SUBALIGN.
> +     */
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
> +                                                  : MO_ATOM_IFALIGN,
> +                                    false);
>

Why doesn't this patch have changes to a HostAddress struct
like all the other archs ?

-- PMM

