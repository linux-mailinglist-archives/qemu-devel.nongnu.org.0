Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE406A9BC4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8Hy-0005O2-5G; Fri, 03 Mar 2023 11:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Hv-0005ND-Gh
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:29:43 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Ht-0004CY-Vz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:29:43 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so2790916pjp.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677860980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BxM+qoAI6jHeQYROApWZ4nV5KeC70ZEEPJRigCG9ddc=;
 b=N/zcck4TADyZfzkpqPlzT9biV9DRPW7NKftB/bW64b0uoXMlMTXzcfzntW6BxWBFXs
 2zwDleM+NHsRuRD5yzhEJqMuAzw+k4g9fMr5Re/HCwtaVd5IPV7ofqC5dWc/6hGDMbwD
 Pi2kvfaB8KVCgcyahLEvG/njytgOOKqgO1vLahpW5TmAhJWToXNY7ouNq8NbmNu1v2dR
 C/+lda5/6DAMHf4JjVvgouh7n9iYj5dI7uXLflbCOzxA91SCdq5VMRuzjp9XR2Wg/Id+
 hZS14DpQ4/UjbVUuG0TFIeRI7q8wyekJl69HbDRSVsqjYl9dh/oF9SnQ9uin31/t/WaX
 cMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677860980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BxM+qoAI6jHeQYROApWZ4nV5KeC70ZEEPJRigCG9ddc=;
 b=JYHnkM6BfjQTjx4nKz3zsPiTAw9XDQTWa0Aa7G1NP83B8saa9qKlDVl6WmZcxVyZ0g
 dulqpzSULbNPQJ6STu6Trw5wCa6/CGkb/PrpHzvQ2FC8SnMneDr7PpLt8yZ2IcbBpVc8
 m4SN1E2OgRu1LQN5W6zfIHYS5N/SMXZOldjBzL6qlqqIM7I4XrLSCBnHPBp6qG6fcLvF
 O1JHcQgSZdmQm1Yombf0GPSUvw+meNE0b4/eVr2uezls657CJyhU2ewstS4VMlGnj7df
 /cdl/cQqER8s4g0L9c6WfC/+AI+KQchCnsP7WL8venE8vqXrBFxjTCAhkHUxL2Pk1iH3
 /a0w==
X-Gm-Message-State: AO0yUKU8j5TSP6VxUjGKpUabNEo26+/l/dTdUKc5UF6NGr6vNjCWJqkC
 D+PEeG9vocYFDfDYRsQB+q3X+1Y+BG2qdFihYK2EwQ==
X-Google-Smtp-Source: AK7set9DAvFxYJFASr3k2kmb98tBwWmfIqX7wWvvkpq2r/RLQY6cnuSDSu+9usCmaM4EHBSM+cxJgjBKx5mqxiC+jZM=
X-Received: by 2002:a17:903:2788:b0:19a:9580:7130 with SMTP id
 jw8-20020a170903278800b0019a95807130mr919669plb.13.1677860980342; Fri, 03 Mar
 2023 08:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-3-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:29:29 +0000
Message-ID: <CAFEAcA-fdqzfq2Ud2i5Tk5wO8FhPQnOpepYC0zeGzHPBFnWhWQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] accel/tcg: Retain prot flags from tlb_fill
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Thu, 23 Feb 2023 at 20:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While changes are made to prot within tlb_set_page_full, they are
> an implementation detail of softmmu.  Retain the original for any
> target use of probe_access_full.
>
> Fixes: 4047368938f6 ("accel/tcg: Introduce tlb_set_page_full")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index d7ca90e3b4..169adc0262 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1251,7 +1251,6 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>      desc->fulltlb[index] = *full;
>      desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
>      desc->fulltlb[index].phys_addr = paddr_page;
> -    desc->fulltlb[index].prot = prot;
>
>      /* Now calculate the new entry */
>      tn.addend = addend - vaddr_page;
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

