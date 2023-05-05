Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A9D6F80C3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:30:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1push5-0000Qx-6y; Fri, 05 May 2023 06:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1push3-0000Pi-ID
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:29:41 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1push1-0002uI-72
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:29:41 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso2388875a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683282576; x=1685874576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
 b=bLmzlWrtk62D96W986phTUm7TZIFl+TN0MS0hDOlAYnfK13Vs5CUeMmDuSO10KCUwL
 QlpZYTLmBPSLpUdyBTx30Kld0tX2wWii0RyeJB38zU3EqInaORcLQzSftOWaWK7y8XHv
 ohehcl2w0EcN/mdRWCnuHCQpGqmfiEVF9oA6tOwbr+Dh53+vRszcyKTyb41ZMD9hgDt7
 Y2QL7/OxYVWLkJ/ClNL6j+IQ9igd2pxoplZWMgVx0WsryQpCGh3CeFLtn5k0qCXGOo61
 0iS9xFXaMfJsYK4b1n24QUWt+/JdjATkmUgJsYrBTw/Hbf54bQwg17020MwpMxQc/qDQ
 mdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683282576; x=1685874576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
 b=GsQNNQoIU9O7L8dL8Fy2jhvpcP3tVq0pF7LQRJbBKpWKfSNQkc0nk4kA42+6wz9vr1
 VSXpdlnttu1cUx/w/gPIbdG/1+b+zFxXaInqPfov8aSBXBj3ULBewcVXbt7uhw8J6o0p
 e5NpTPFOG+c8c6QWxdDfTEjJ34CjAKh5ne7BUG1yfeuHWM3xt1gpUANAPwushbxKfRPP
 5XfuMNnnnR7KM/picpmAKuLg62UFD6/PLnNWRPbOaPqNrWieok9qBNxPjswBmITt17a8
 CgeWKTLd1YAD3aD1h4818+1UEcG++3+zQs4ANkZJEBK/PAONjtISDeTiWvBgiMP0HtIK
 feCA==
X-Gm-Message-State: AC+VfDwbhx0mPmb32lVG5SL7c4stDYdIvFmc4etRt0I9p+E+IUWNFjot
 EzJkT6plHrsV0cb1amZOOlaanI0r2U+jrm1cK6V8JA==
X-Google-Smtp-Source: ACHHUZ6ah5RLuhts2HKf1GIwuI3tGNRWmrDyqKb19ilrTrAQCsVSBQNY9kkz86r8VJN/zKvHc93PW6HUeKeH6tOctYA=
X-Received: by 2002:a17:907:724a:b0:95f:3a55:1dfc with SMTP id
 ds10-20020a170907724a00b0095f3a551dfcmr900570ejc.35.1683282576591; Fri, 05
 May 2023 03:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-14-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:29:25 +0100
Message-ID: <CAFEAcA-Qt6SBE42p_qWbETzBtgkqLbkBkyqLQ=Q7nMbjFrcKDw@mail.gmail.com>
Subject: Re: [PATCH v4 13/57] meson: Detect atomic128 support with optimization
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 3 May 2023 at 08:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is an edge condition prior to gcc13 for which optimization
> is required to generate 16-byte atomic sequences.  Detect this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
>  meson.build                    | 52 ++++++++++++++++++++++------------
>  2 files changed, 61 insertions(+), 29 deletions(-)
>



> @@ -676,28 +695,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
>   *
>   * Atomically store 16 aligned bytes to @pv.
>   */
> -static inline void store_atomic16(void *pv, Int128 val)
> +static inline void ATTRIBUTE_ATOMIC128_OPT
> +store_atomic16(void *pv, Int128Alias val)
>  {
>  #if defined(CONFIG_ATOMIC128)
>      __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> -    Int128Alias new;
> -
> -    new.s = val;
> -    qatomic_set__nocheck(pu, new.u);
> +    qatomic_set__nocheck(pu, val.u);
>  #elif defined(CONFIG_CMPXCHG128)
>      __uint128_t *pu = __builtin_assume_aligned(pv, 16);
>      __uint128_t o;
> -    Int128Alias n;
>
>      /*
>       * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
>       * defer to libatomic, so we must use __sync_val_compare_and_swap_16
>       * and accept the sequential consistency that comes with it.
>       */
> -    n.s = val;
>      do {
>          o = *pu;
> -    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));
> +    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
>  #else
>      qemu_build_not_reached();
>  #endif

Should this change be in a different patch? It doesn't
seem related to the meson detection.



Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

