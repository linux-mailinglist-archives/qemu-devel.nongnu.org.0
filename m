Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7760639F3A0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:34:11 +0200 (CEST)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZ3i-0001pT-0J
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ2A-0000uP-2e
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:32:34 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ28-00018l-1q
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:32:33 -0400
Received: by mail-ej1-x629.google.com with SMTP id k25so26301489eja.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHZxgBHr1Q7qnCvusFw/MCK4t+4kQgjqrniHPvUDYQc=;
 b=OOoGNbgP1R8MM5bWhQDJaJr9icuF5WcTUG4aBwVyOHNlZz4MP+0bbZBoztJHmObkRa
 q5RSW04wnuu12C9Fv5WY91jnATvzKELhctRXnr2NGfUIxtygSLmHgzawxD4YOqq41WVA
 h0CNcaYfcU1ZsuOllnqwn1UhkkVk030LpIMskPEUUz2/fJlCLzZKXLPwYDxokbnZDp+E
 G2yXTyNiWIoZfQeuYz7F5x5RpBlGPnoaITsa5GPzI1OAhXtUSYZTzWnd8gOZ4Mc6fkef
 7Rxl1PDh1VvXHE/mimMYMDBeyahLnh12s3EL6kksV5+c0Pa5w+6vCPEi1/2IC5QOOPMP
 f7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHZxgBHr1Q7qnCvusFw/MCK4t+4kQgjqrniHPvUDYQc=;
 b=eGvLqQb7bv9RTWSFDZEsJiN/26+Qqm5kQXyLpyh4z2eYwUQ5MrVOd6Dz3RX4dW12WB
 2DXacZ0lRVa3zVSyy1XrVEdbUV8/5ebbX9cmA6euE7J6AXO2da231fo5on/K/oUvKfyz
 jKRLkWH1X3iKx76or7ckza8HJcmZ57QpbWSa5fqQu3Xf7Dkla9rUd0fnrPOHIItcnU/D
 Xt5xAQ3b1Jjg+hRkdT7JTuH4yCbp3JHHLhqhCGNbydVYwX24t9QNjyYT0rPG74RPYlSt
 8cO2aj0hDWQ1l7YrvfVGcIjeQPqkT+lUhV5n3b7oReHpeAjxfC813mX7ZDB05HGytT3F
 JGIw==
X-Gm-Message-State: AOAM533BmBlIcI489jDnxi7cLRhwgDyEOKKGfcriGAtcTMvfNwnh/Pu6
 1rWbwaWRn5AJKFVzPFaPlDoiDmlQ9aZXW3Cq2kFHsA==
X-Google-Smtp-Source: ABdhPJzDoy8x17YEHdlgLNcpGoD71Qj8oPFkm9yy37vXhcItijQUjElw/BFjpeHpeP1I9uI1TSNqXIYMTCR+0NAKSaA=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr22782600ejb.482.1623148349833; 
 Tue, 08 Jun 2021 03:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-3-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-3-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:31:56 +0100
Message-ID: <CAFEAcA-+x4Tt9XZVPqk8ojT6C2jYXsoCkAkR00vbL-X3ykXdNg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] hw/intc: GICv3 ITS register definitions added
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Defined descriptors for ITS device table,collection table and ITS
> command queue entities.Implemented register read/write functions,
> extract ITS table parameters and command queue parameters,extended
> gicv3 common to capture qemu address space(which host the ITS table
> platform memories required for subsequent ITS processing) and
> initialize the same in ITS device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

> @@ -41,7 +192,73 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>                                uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_CTLR:
> +        s->ctlr |= (value & ~(s->ctlr));
> +
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            extract_table_params(s);
> +            extract_cmdq_params(s);
> +            s->creadr = 0;
> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> +            s->creadr = 0;
> +        }
> +        break;
> +    case GITS_CBASER + 4:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = deposit64(s->cwriter, 0, 32,
> +                               (value & ~R_GITS_CWRITER_RETRY_MASK));
> +        break;
> +    case GITS_CWRITER + 4:
> +        s->cwriter = deposit64(s->cwriter, 32, 32,
> +                               (value & ~R_GITS_CWRITER_RETRY_MASK));

The RETRY bit is at the bottom of the 64-bit register, so you
don't want to mask with it when we're writing the top 32 bits
(otherwise you incorrectly clear bit 33 of the full 64-bit register).

> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +
> +            if (offset & 7) {
> +                s->baser[index] = deposit64(s->baser[index], 32, 32,
> +                                            (value & ~GITS_BASER_VAL_MASK));
> +            } else {
> +                s->baser[index] = deposit64(s->baser[index], 0, 32,
> +                                            (value & ~GITS_BASER_VAL_MASK));
> +            }

This has two problems:
(1) same as above, you're masking a 32-bit half-value with a MASK
constant that's for the full 64-bit value
(2) here (unlike with CWRITER) we don't want to clear the non-writeable
bits but leave them alone.

Something like this should work:

               if (offset & 7) {
                   value <<= 32;
                   value &= ~GITS_BASER_VAL_MASK;
                   s->baser[index] &= GITS_BASER_VAL_MASK |
MAKE_64BIT_MASK(0, 32);
                   s->baser[index] |= value;
                } else {
                   value &= ~GITS_BASER_VAL_MASK;
                   s->baser[index] &= GITS_BASER_VAL_MASK |
MAKE_64BIT_MASK(32, 32);
                   s->baser[index] |= value;
                }

> +        }
> +        break;
> +    case GITS_IIDR:
> +    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }

> @@ -57,7 +322,42 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);

This will allow the guest to write a 1 to a writeable bit,
but will not allow it to write a 0 again...
     s->baser[index] &= GITS_BASER_VAL_MASK;
     s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);

Why VAL_MASK, by the way? The mask is defining the set of read-only bits,
so RO_MASK seems like a clearer name.

> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = value;
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> +        break;
> +    case GITS_CREADR:
> +    case GITS_TYPER:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }

Otherwise:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM

