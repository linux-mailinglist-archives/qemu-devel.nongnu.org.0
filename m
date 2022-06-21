Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7BD553B98
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:26:57 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kSe-0007yF-65
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kQe-0005xe-Co
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:24:52 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kQc-00065w-P6
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:24:52 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-317a66d62dfso82020717b3.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0a77wvI3e6hZO199wXBDEA8vqz4QenN5q9UW72KPUeo=;
 b=VW++E8BmNxK28FK4BkHERJQgtW/ChEiwFcccYvO2afxTcTNS4yOychceM1JsBufBx8
 6ijpFMVwTiHXzPn1KoH/Q/Y6itUhpKwZvpFBk6Njr4TY0NHdM/d8zIB9UIOzO3uf3tUa
 NyxEFsvcU+Z+J+YbOd4MuDvs5rCTV5WDuOQIrsAw8ZCjEHIURz0ttvzGddaPhjCLQVE9
 VFOUy2S3oku7/69Vl6iVnvtmPJRchAYxfdFeNrV7KPqrurtXf+VYzJGpCk91fmpM6Z37
 ipDVDrD6A4krWOeYckMjSehaPIdFcuDaFHMemNix0kIGIKX0/sj7yLWCA5Ii1FAs/CQ/
 qONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0a77wvI3e6hZO199wXBDEA8vqz4QenN5q9UW72KPUeo=;
 b=GurFrM7hLz1NF86pxOswys4CKNkhPknL02AX9QvEpz234bXnFAI3IPiipygnhNb+K6
 XxEThdo9laBl+49XNOJYnYPgT2BpPLRBFl6iTWzeypXmkUfCayLaSB1U1Bx4+qUzlXzC
 gr7/D71qcUwu6B0kA9wXWP0jODcSOCzwSk7N1vNUOBqY5EQuJdyCTyJCZtR/P2GVS8v6
 zXCu6breLJZfsQganEzXKenCOaZuyxq84j16rUtZYPh+RpKx03TtkZEEJGo3cy33z4M9
 TTfPmrOyD3rgmRlT44TSmnXfHH2rKjKL4M4x36I8swNEOM0KjfunoTkYVXu0DjoWJryD
 2m+Q==
X-Gm-Message-State: AJIora96qkP2S11ztnvj7d4XA8eP5CHcyJ8pTDvRAY5wCdl0zkWcZ9T2
 uQUCXG8IywlfalrRL23voVNl6Bb8ykKIv7Rg/3uAvQ==
X-Google-Smtp-Source: AGRyM1tlR/3NW6/yOoyvIAGMeU79rRPvjvtluz4ksFuKcOo5OFPRZxEVpPSkL9mM8penGRLsE0bkAp0iOeftwKo3qNQ=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr20045757ywd.64.1655843089405; Tue, 21
 Jun 2022 13:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-10-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 21:24:11 +0100
Message-ID: <CAFEAcA8wfQhBxV+2xHpCJz_KWOrd5m=cj52QdgMQ6L2rBr46TQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/51] target/arm: Add the SME ZA storage to CPUARMState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 20 Jun 2022 at 18:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place this late in the resettable section of the structure,
> to keep the most common element offsets from being > 64k.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +
> +    /*
> +     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
> +     * as we do with vfp.zregs[].  Because this is so large, keep this toward
> +     * the end of the reset area, to keep the offsets into the rest of the
> +     * structure smaller.
> +     */
> +    ARMVectorReg zarray[ARM_MAX_VQ * 16];

Suggested more detailed comment:

    /*
     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
     * as we do with vfp.zregs[]. This corresponds to the architectural ZA
     * array, where ZA[N] is in the least-significant bytes of env->zarray[N].
     * When SVL is less than the architectural maximum, the accessible
     * storage is restricted, such that if the SVL is X bytes the guest can
     * see only the bottom X elements of zarray[], and only the least
significant
     * X bytes of each element of the array. (In other words, the
observable part
     * is always square.)
     *
     * The ZA storage can also be considered as a set of square tiles
of elements
     * of different sizes. The mapping from tiles to the ZA array is
architecturally
     * defined, such that for tiles of elements of esz bytes, the Nth row (or
     * "horizontal slice") of tile T is in ZA[T + N * esz]. Note that this means
     * that each tile is not contiguous in the ZA storage because its rows are
     * striped through the ZA array.
     *
     * Because the ZA storage is so large, keep this toward the end of the reset
     * area, to keep the offsets into the rest of the structure smaller.
     */

Arguably para 2 is repeating architectural information, but I think it's
helpful as a brief summary (compare the comment earlier in this file about
mappings between S, D and Q views of the vector registers).

thanks
-- PMM

