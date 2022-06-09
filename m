Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5B54511B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:43:48 +0200 (CEST)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKK3-0001mn-20
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJqu-0002AD-1C
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:13:42 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJqs-0006J1-8O
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:13:39 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-30c2f288f13so244280567b3.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AyICTKbmfFWPtVchwZ2x5SPndxhOMyGcxD9CcnVxnmE=;
 b=eaLOjCEybBW6jWcLR6qZjYg2TrJLZcgvhYjBhdJ3OIKrpkG4K3rh4sB59RSlqj3IcP
 evmT+/gQl5iMEzDA2vQrb5M0VDWSgcF8lEN+uqEw7WkPZjG83mz1lnyz2coFFni8xQ0L
 T4WwFMGG02i10pgJW/wkvFCF8incizJXe1kVM+3BSSzqjOvKtkhIBou7eDlPlYWKxUUI
 J7uIUae2M3QHDODodHYgotlsQr8nMVgj9va/s3FrA7wZl9K95Udgsos6MP3rTcYLp+Ik
 uYlinx0ovZjfDFbiLYv9CNL4w9S5g8ru2AjBDJfUoQ5WtGcfREgiXPR+nmDLsou6hiGW
 Bfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AyICTKbmfFWPtVchwZ2x5SPndxhOMyGcxD9CcnVxnmE=;
 b=JbNqgPPcl4xqAsSvlke3tyZOPcA57Mzg+YlQ05RZUsXhdxPeXHfdKlFd0vZu10Ps8N
 wmcnufFmLzjIoxvyjf25lpFIRW2yJkWoG4anrgmTmF9vjNh1c1CTFJibdRqTO6/rYzMk
 +hzGjy5Ekfcw7vvAERiZDIyO+y8/w1P35FNN4R0QHJvv98ECBJN42ryu/ImfR5hdFDP+
 zvjjUqzZQR3VqC4ZORuRw9QgTDEDqHJoVF8qdx/Tj/thY1FBSIC2h2Tsv8woVKebBalG
 Ai3zkzZkNDpWTpEdaqECTEO0tN01VV8okcK6Vgg6kg/D48gtXR5bc4oYL5LH1RI/h0KF
 9LJA==
X-Gm-Message-State: AOAM533B2OfUBtuZn+vwsxGWlMwdB5R4R1o//SnHLzJ0fupWF7uuzdfT
 jF+Hmw6dga2EYZfFZbVM4cfTO2G18oy51vlwf6tiuQ==
X-Google-Smtp-Source: ABdhPJzudn+nH7Ms2rwfNitILqDgqCaTT1nOeetvS6Z4Hjq6rg5nP3owcLETTFZBtpXSl4N5SezDifRFaWv5+zNNMyQ=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr42262598ywc.329.1654787616959; Thu, 09
 Jun 2022 08:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220605161056.293920-1-richard.henderson@linaro.org>
 <20220605161056.293920-3-richard.henderson@linaro.org>
In-Reply-To: <20220605161056.293920-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:13:26 +0100
Message-ID: <CAFEAcA-YtGEHj5vsnK31qUXDvc8WerVafPBYzEOA5NH5kyL1-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: SCR_EL3.RW is RAO/WI without AArch32
 EL[12]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Sun, 5 Jun 2022 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since DDI0487F.a, the RW bit is RAO/WI.  When specifically
> targeting such a cpu, e.g. cortex-a76, it is legitimate to
> ignore the bit within the secure monitor.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1062
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 5 +++++
>  target/arm/helper.c | 4 ++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c1865ad5da..a7c45d0d66 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3947,6 +3947,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
>  }
>
> +static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
> +}
> +
>  static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c262b00c3c..84232a6437 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1755,6 +1755,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          value |= SCR_FW | SCR_AW;      /* RES1 */
>          valid_mask &= ~SCR_NET;        /* RES0 */
>
> +        if (!cpu_isar_feature(aa64_aa32_el1, cpu) &&
> +            !cpu_isar_feature(aa64_aa32_el2, cpu)) {
> +            value |= SCR_RW;           /* RAO/WI*/
> +        }

True in principle, but we probably need to do something to handle
the reset case for AArch32 CPUs, where cpu_isar_feature() will
return false becaese id_aa64pfr0 is zero but the bit should
nonetheless be RES0.

thanks
-- PMM

