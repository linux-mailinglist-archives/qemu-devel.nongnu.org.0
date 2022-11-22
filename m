Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F035C633F14
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUNg-0006Wr-OC; Tue, 22 Nov 2022 09:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUNe-0006WS-HF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:36:10 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUNa-0000hO-CI
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:36:10 -0500
Received: by mail-pl1-x62e.google.com with SMTP id jn7so11962172plb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kBHePgLk3El3qrQVmrWeXQwqMi0oAiYOsTa3r/rg0XI=;
 b=qVkDdPJH09KoUOTXToVgDjdYYs0z63gmtxLzSEpJFjsSCqmUpVqaSJpkzSyfYxkBj+
 xhAiZvp+4KuEXOQFKPWeTyPg2ZozTO42pxThXuKqsXbYAzHQXllPZvwH+9m6y6CuruaE
 PQ8WJN3BhfHtNsRLwXm22hY3VmoSxiQDyXXlc+cVLqwYqMyyo/Ob47DMy30Y9HeHHDWx
 aRoefzL0BxJKfhCkvLQLqEf952Dt+uhlcD4ceK53PZUZa+6ZgpQ5OUBCzw/dTcKWQEqg
 b4Q5qh24PKOlCqTG/DqYxkLyi9cb1NO6hPskjksp4r4GlJ+42hwiXlvIutWb+Lhu+Q7s
 zQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kBHePgLk3El3qrQVmrWeXQwqMi0oAiYOsTa3r/rg0XI=;
 b=o2dc2LJUmwCFxnSpiiDe23bH3t49SIvhe9UoL/dEfesek2WpyMTRpeipVjVCeqskjj
 8X+4kKAfu57WwcTQCHiIhdu0O8WLg9cz0Do1VzWGkshoBnDC/oaby13chTUj4e2Engh1
 zxaBMuRiOOAcZM88LMjT2/urtXDq7SlaNf9zqPuc73eT7cWWp30fD9/HutVc0F3C2ymD
 CJLgHS+ivqAoV8Vh02f85rMQFpyqclyj31vtTXllVqQStGvRam9B7LQA3psGDDOuy91S
 xM0R6/xNvdGEcspf+7qgK6yI+R/uK0gNUvxVTD5/oN+TCr/59UpBOCky6OD43S8QV/T/
 uTTA==
X-Gm-Message-State: ANoB5pmtMDpY+0ID7IXT3hHiVTY5Lv1P4N2SaSHidkqzpNwpJnBv2eSk
 j8ysMo9a1NgyQWzVQuT4GKZDxZieUad4VOHYPJOI3w==
X-Google-Smtp-Source: AA0mqf4hQ2QIfXMKVWZC6WjhrbalFZQ/MUHaSsWFST5DuiBG40N28aZeduUTJOdSsT1QIOl/GCf4YW1Q2hyivf1HDRI=
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr25288656pjk.215.1669127761061; Tue, 22
 Nov 2022 06:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-8-richard.henderson@linaro.org>
In-Reply-To: <20221118094754.242910-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:35:49 +0000
Message-ID: <CAFEAcA_6PHdEPBFqyHC+z8Xz8FcJw1wgDu-R+ynm+Qv04WS1Xg@mail.gmail.com>
Subject: Re: [PATCH for-8.0 07/29] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Fri, 18 Nov 2022 at 09:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create ldst_atomicity.c.inc.
>
> Not required for user-only code loads, because we've ensured that
> the page is read-only before beginning to translate code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/**
> + * required_atomicity:
> + *
> + * Return the lg2 bytes of atomicity required by @memop for @p.
> + * If the operation must be split into two operations to be
> + * examined separately for atomicity, return -lg2.
> + */
> +static int required_atomicity(CPUArchState *env, uintptr_t p, MemOp memop)
> +{
> +    int atmax = memop & MO_ATMAX_MASK;
> +    int size = memop & MO_SIZE;
> +    unsigned tmp;
> +
> +    if (atmax == MO_ATMAX_SIZE) {
> +        atmax = size;
> +    } else {
> +        atmax >>= MO_ATMAX_SHIFT;
> +    }
> +
> +    switch (memop & MO_ATOM_MASK) {
> +    case MO_ATOM_IFALIGN:
> +        tmp = (1 << atmax) - 1;
> +        if (p & tmp) {
> +            return MO_8;
> +        }
> +        break;
> +    case MO_ATOM_NONE:
> +        return MO_8;
> +    case MO_ATOM_SUBALIGN:
> +        tmp = p & -p;
> +        if (tmp != 0 && tmp < atmax) {
> +            atmax = tmp;
> +        }
> +        break;
> +    case MO_ATOM_WITHIN16:
> +        tmp = p & 15;
> +        if (tmp + (1 << size) <= 16) {
> +            atmax = size;
> +        } else if (atmax < size && tmp + (1 << atmax) != 16) {
> +            /*
> +             * Paired load/store, where the pairs aren't aligned.
> +             * One of the two must still be handled atomically.
> +             */
> +            atmax = -atmax;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    /*
> +     * Here we have the architectural atomicity of the operation.
> +     * However, when executing in a serial context, we need no extra
> +     * host atomicity in order to avoid racing.  This reduction
> +     * avoids looping with cpu_loop_exit_atomic.
> +     */
> +    if (cpu_in_serial_context(env_cpu(env))) {

Is it OK to use cpu_in_serial_context() here ? Even if
there's no other vCPU executing in parallel, there might
be device model code doing a memory write in the iothread,
I think.

> +        return MO_8;
> +    }
> +    return atmax;
> +}

thanks
-- PMM

