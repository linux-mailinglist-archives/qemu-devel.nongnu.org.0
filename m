Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C174569E8E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:27:52 +0200 (CEST)
Received: from localhost ([::1]:33988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Nnb-0002aB-7P
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9NmW-0001g6-NK
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:26:44 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9NmV-0005ZJ-5O
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:26:44 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i14so11782971yba.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FR96ywLjuc8gIbRvoUSmpk6lWdcfOKT9JZI41FTyfnc=;
 b=bq9eB13WHLj3XHxbOpykiV8Pzie8Y/MJh+o+iWq5VYkCtiaUltMT5lGmWIh5Xrxfrt
 hqixt7/+cFL0kSXcYOa4Y/f1SmU9SgRsJS8zVggiFZSk98kpqCKRMCNGjUhtt9pvJQ3A
 vvxLggGRHSKnNi9Je/YlVkYjzMG3qvyuH6nNY25uoP0+9mLEE5agi56fyh3I+1KEZ/eQ
 IyYOw/RXoVUNwtSJvzEpzrwFKgG5M5Dr93jtzXbGKz5wj7pS7qXApyFHdBBhaXRVTYzU
 oKuvvYziGM8k1wzgi/sX71Kw552xO6GnZqQ2561NvK0x1viSAW3cIZte4xa2lFqrtB3l
 YGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FR96ywLjuc8gIbRvoUSmpk6lWdcfOKT9JZI41FTyfnc=;
 b=t93rNkOKXyY1bn+ngO13CAK+HiTRCDU+jOqmkLcpcYHPaq5YELL9GcltXTseRrptL4
 ncak3zZVnXb5IkZ57Z2PV8GD5MhmKvy9KyUMaqW4jkKlSnF8nEq4aZC5ESgctsAR4CTB
 QCj+O4/oBwyU20dZfRfcBrEcZRwLit5mML/6H6Ivi3v/xLa7rvfO4Ps0upkd8sSQxpXq
 7YVTU4EvgatJvUTnc+lNEXR38gbTqed8lIt8eCFodIo5PjmqcCkScsAfI83V6fg7xOwm
 fu49IokPjVwwzI2w22LFoEF26SmBHNkZBINwz8TdljA2VmDOFUcG8ASMfnjj5stoHguQ
 D9kA==
X-Gm-Message-State: AJIora/yuG08MPWRZ8A5TttqYox6AjshaPUwqA1udd+GJJJ7BCNnn92b
 S/GASCc5SWHHF8XUJUujA2TTZJndFa4cMVdpbYkQQQ==
X-Google-Smtp-Source: AGRyM1tYUQvujtMchDIcuaZLxPCD9NaotgAWnjnDVmK6BW3fh9HsVAgzYwXYeqarHzSkexFCW5c4qqf0AO6zQ1odi+0=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr29176294ybf.67.1657186001400; Thu, 07
 Jul 2022 02:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-25-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:26:03 +0100
Message-ID: <CAFEAcA_sFow6=OEFr_49O_+621O_m3n=SGpZoPbnRjTQ_N-CXw@mail.gmail.com>
Subject: Re: [PATCH v5 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jul 2022 at 10:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +
> +void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 31;
> +    uint16_t *pn = vpn, *pm = vpm;
> +    float_status fpst = *(float_status *)vst;

This could use a comment mentioning that we take a copy of the float_status
because this operation does not update the cumulative fp exception status.

> +
> +    set_default_nan_mode(true, &fpst);
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            if (pa & 1) {
> +                void *vza_row = vza + tile_vslice_offset(row);
> +                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
> +
> +                for (col = 0; col < oprsz; ) {
> +                    uint16_t pb = pm[H2(col >> 4)];
> +                    do {
> +                        if (pb & 1) {
> +                            uint32_t *a = vza_row + col;
> +                            uint32_t *m = vzm + col;

All these accesses to uint32_t elements are missing some kind
of H macro somewhere, I think ?


> +                            *a = float32_muladd(n, *m, *a, 0, vst);
> +                        }
> +                        col += 4;
> +                        pb >>= 4;
> +                    } while (col & 15);
> +                }
> +            }
> +            row += 4;
> +            pa >>= 4;
> +        } while (row & 15);
> +    }
> +}

thanks
-- PMM

