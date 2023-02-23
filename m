Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC376A0D42
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDlH-0006LS-IZ; Thu, 23 Feb 2023 10:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDlF-0006Kk-3C
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:43:57 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDlD-0007yN-Nf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:43:56 -0500
Received: by mail-pl1-x630.google.com with SMTP id i3so2937479plg.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vN9wbXaS5AKRfx7O49+9tm8CSWhH7WZBdTXsOBDoOLA=;
 b=MfuOR1THyLa7p+KtzCci5uYxkVrmJCkXhYY9OI7GchxhxTtw7Y42+686NiYh6EzqBW
 1uTlJ2KM7/EE1CHVBgsvLFKKf2JkerH3J20L+5LqWeSPmFUlQFQS91PCYKHw0V/fBRmn
 l/dbrhFupNiCaxzHaBWIVcEYx40ogmVihAN3yXYepUyN/itkbGy2Fc+WKFWIprLU0y4a
 RNriV6Qe+9kABM8I4CBhO3pTJHEsohfcO1jogCrfh7BJFf/Lt02j/3qJ8zuaFQiwMOpo
 AEfi1Q4JpNBkfVpCTGeFJsCmAHLRwzWA7bH5+AeGji78zlgClZv0PZPfYtFep3eyykUy
 QiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vN9wbXaS5AKRfx7O49+9tm8CSWhH7WZBdTXsOBDoOLA=;
 b=v/V2otXMObL+pjRa2tSkFnMIxtn1oigWO5noVc9JUVtP5ZXRvlZ1sKMKFWTa0UUZEQ
 e/PM7rcoYRxx6pBoIPigfQmNLhcDuvo7WyBSk2qdkRnICFWMyThmCBmwJ/OeY9RUOfG1
 f2isaasgGtKwoissGN67lOdfP6sRwLW4n0NzJZvi5s4DaNdS0/G/I6W9clpOeZYsc3az
 VaCdaq0gNw5m6h12eAREEIxn4DJ51FGn0cs6p0jzrINZkBQ2ZJaaxnGzV2vgSs1q1Tiv
 CSww2BT2xOHqtN7rtIIzLNIEcks3sumRMYZR51dLrquDBZKam4hb9+CwbpJ61lH8VUcP
 18sA==
X-Gm-Message-State: AO0yUKVNOaeWflBcX+JpLoLK9TWHXwiUhzVB9DbeQc2qE/7zacsGTInh
 mZxFGDWqiXu5CpdN7ybFGSyLCqsM0Txu2IZlaFmSuw==
X-Google-Smtp-Source: AK7set9w3LlbT8v/ulc3qH6SV20vxy+e4KtP13mG1OnYuJBuWVZBpTfi6Pu/lnhl0cRJ4GV8cgIENvqKlOKDOiTkqBE=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1222650pjb.137.1677167034220; Thu, 23
 Feb 2023 07:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-8-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:43:43 +0000
Message-ID: <CAFEAcA8LWyeGB7FyKEXO=Ww7VZOxvEUbQtGCF=dFz4_iAkjp=A@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] target/arm: Add feature test for FEAT_LSE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 7bc97fece9..2108caf753 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4049,6 +4049,11 @@ static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
>  }
>
> +static inline bool isar_feature_aa64_lse2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, AT) != 0;
> +}
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

