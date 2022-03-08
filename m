Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB54D144D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:09:54 +0100 (CET)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWmw-0000NI-1k
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:09:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWlu-0007wV-OL
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:08:50 -0500
Received: from [2607:f8b0:4864:20::b35] (port=35766
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWlt-0007s4-1f
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:08:50 -0500
Received: by mail-yb1-xb35.google.com with SMTP id z30so23873627ybi.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nw8Zv08EJuN+srCD0thjmTosxm3yMUH2yGwIdoJXQJA=;
 b=MNvAdUc+LQOV8O/93B9V19qY2oU1kBQsArRTHS2QcthGWmfdJykY0t5IJ5tcvFW60q
 XoS48e+AIj5sy76LW7QX3/FJmkaDiXzxpLnGCzhrt9kDSLXCmYnuLNdMk3dlDbL8G0D4
 FV7A5gQKYVVq0qu144JxBtb4jTPMeuioKlgbn5LpsL5JMVYIKxQ2L92rMjAy7BQiMyFM
 i0nwC/T/WToScWG7RDcH18Rs3bcVeYO4xFL8UTyTaLNGIKf033QDJeaD3Fr0R+nzQjBE
 oIYj0M2P/qtxy2DjYfZ/chT4QwPTxLQsIKN6BUJNHJ9Xl3jfm1jIDbJfUkDkw7Xp6o5l
 HchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nw8Zv08EJuN+srCD0thjmTosxm3yMUH2yGwIdoJXQJA=;
 b=zCpzsa1AGh75xGaD19lWJUiEQeDbrQDP1Wsc7iIZBwMoNz9wT9iQeh+2tyaaPbHnV9
 0erf/ohG/N+fgnMyWyhoM+iclLM6DqXMGrH+FEI5zvCJ6kbsqy8yHBAE9hteigH+2y2O
 nF9D/liADbvsavwohvniLxm6dQUjweeE2p2H9QoBGDjQ+3Qp+Nbi2gasVDQIObEhEBp+
 8omydknQj2ixPMYMStZriHEgKc/DkLuAlnhL9ginUdhao8KruZ05Vt6Rni3qIM9ajACd
 HaH46dM1WW48CfZNk7J6dk9nh6r+N4VIv7M7XSFIbUkZuZmibRIqqIV0OFp1uxbvN5ee
 4tVw==
X-Gm-Message-State: AOAM532Pq4yaLch3dxHpusOhMcpBUTh3PUkUIAtd+jqd2/BC+3U5qXg8
 ByX53y3ryQsF3gqL7mrfIIFqUp7zAz08+XRqGb9jIQ==
X-Google-Smtp-Source: ABdhPJy4ox+JNySjrRZtEG0nt6/u70n98MrgFO9vJV0/QjXA+Ud+dEhAvcjFvYGsRr9/ajvzos9iC6RnAitqrtOYg+k=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr11774633ybc.288.1646734124214; Tue, 08
 Mar 2022 02:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-12-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:08:32 +0000
Message-ID: <CAFEAcA_f0PWGrxGBMSK-jr9MTCk7D1OM5XJ=zYy8eB1HyZitWQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/33] target/nios2: Use hw/registerfields.h for
 CR_STATUS fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add all fields; retain the helper macros for single bit fields.
> So far there are no uses of the multi-bit status fields.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 5bc0e353b4..26618baa70 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -23,6 +23,7 @@
>
>  #include "exec/cpu-defs.h"
>  #include "hw/core/cpu.h"
> +#include "hw/registerfields.h"
>  #include "qom/object.h"
>
>  typedef struct CPUNios2State CPUNios2State;
> @@ -80,15 +81,23 @@ struct Nios2CPUClass {
>
>  /* Control register aliases */
>  #define CR_STATUS        0
> -#define   CR_STATUS_PIE  (1 << 0)
> -#define   CR_STATUS_U    (1 << 1)
> -#define   CR_STATUS_EH   (1 << 2)
> -#define   CR_STATUS_IH   (1 << 3)
> -#define   CR_STATUS_IL   (63 << 4)
> -#define   CR_STATUS_CRS  (63 << 10)
> -#define   CR_STATUS_PRS  (63 << 16)
> -#define   CR_STATUS_NMI  (1 << 22)
> -#define   CR_STATUS_RSIE (1 << 23)
> +
> +FIELD(CR_STATUS, PIE, 0, 1)
> +FIELD(CR_STATUS, U, 1, 1)
> +FIELD(CR_STATUS, EH, 2, 1)
> +FIELD(CR_STATUS, IH, 3, 1)
> +FIELD(CR_STATUS, IL, 4, 6)
> +FIELD(CR_STATUS, CRS, 10, 6)
> +FIELD(CR_STATUS, PRS, 16, 6)
> +FIELD(CR_STATUS, NMI, 22, 1)
> +
> +#define CR_STATUS_PIE  (1u << R_CR_STATUS_PIE_SHIFT)
> +#define CR_STATUS_U    (1u << R_CR_STATUS_U_SHIFT)
> +#define CR_STATUS_EH   (1u << R_CR_STATUS_EH_SHIFT)
> +#define CR_STATUS_IH   (1u << R_CR_STATUS_IH_SHIFT)
> +#define CR_STATUS_NMI  (1u << R_CR_STATUS_NMI_SHIFT)
> +#define CR_STATUS_RSIE (1u << R_CR_STATUS_RSIE_SHIFT)

Since these are all 1 bit fields you can use
#define CR_STATUS_PIE R_CR_STATUS_PIE_MASK
etc rather than manually shifting by the shift count.

-- PMM

