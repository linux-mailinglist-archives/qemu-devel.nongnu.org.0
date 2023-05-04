Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4E6F7172
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:47:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucq2-0002nf-D7; Thu, 04 May 2023 13:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaJp-0001M1-HV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:52:29 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaJn-0007Z1-VK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:52:29 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so1065361a12.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683211946; x=1685803946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
 b=EeyyITikCWVvyGsXCeHqpo6ZKAwjha76TE5ohfZGJT1wv8BmibvlhZUednv1B/Fb4s
 g2Y3830rB1c7b9xqAs3WKh/jfxhRXvsGPW1yWKlos7oeK8+u7w/JiiAO0NQVn5bDOktu
 XxNrnFbQr8j0wHWrTM4QbqtgR1bdak7xUhiY2LmVdd8l+rMMkbvXrrmz92N+ulvgr5oO
 TSNBnh93EEfQB5y8nkmRakD7Se5HgI5Bsp69Fx7dVANutlSHHNK+cRwhF02gC7GxKvBX
 Iv5aFXyuGYOt6unM5O7AhbxJmaiH5eKXMiF8Lo1VLjT0sRKsgieURqNNVCbtWXKhzJRH
 3y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683211946; x=1685803946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
 b=O1FlqRb2DbsqPZ2ISXNSEfmWDI92hQJFdoiaiN6RIl7QS+ErifK+z+J0FfcBFEEzq1
 c7saMpW/PoUXjMk0ULWkotnGHMsD2T+sq7n+DTC1AZfxyUjbjS3LrBizTOrL+bp5A1gU
 bVnZ8rfSLXb9f5FKGPx9VMJ4TyEyGYVFbUzF8CQWzC8k561gU8DKWSlBN16arFGuEjru
 5nHSnHRj8Mc+CQRVaJuR/VFBd4O36agjCTgfZZYGDSrM6zFKW4v3ijTYHoEVujY+Xvc3
 25sFv+C/ZcIgw7PPGuEjnj2NM3PRNzU1fgwNdxxqPSv7EC9j13V7oZNYDHLdvZytOmCM
 eQSg==
X-Gm-Message-State: AC+VfDzlQtntxui8spzyLQBnJ9KM+PiZvkd4dASwcxyyxvrsTYyY47Pf
 yrnbNWiSyXs7csSbhlJ8klZqD9laEDNEE8d5RjeCjg==
X-Google-Smtp-Source: ACHHUZ4ctO8tcI2bcUG03yRTCTfOpKiGeoxdPptrjnNleozGXeclD/XYlWu4X2kNshXZAvMkh6fNhSZkQed89QTtdsw=
X-Received: by 2002:a50:ec82:0:b0:50c:1e2:4a42 with SMTP id
 e2-20020a50ec82000000b0050c01e24a42mr1720198edr.15.1683211946558; Thu, 04 May
 2023 07:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
 <20230425193146.2106111-3-richard.henderson@linaro.org>
In-Reply-To: <20230425193146.2106111-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 15:52:15 +0100
Message-ID: <CAFEAcA8YaS1HRypydW25tTtB5D0XdO-m9y1OHxVCDOcpWtWgQg@mail.gmail.com>
Subject: Re: [PATCH v3 02/57] accel/tcg: Add cpu_in_serial_context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name, 
 jiaxun.yang@flygoat.com, philmd@linaro.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Apr 2023 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like cpu_in_exclusive_context, but also true if
> there is no other cpu against which we could race.
>
> Use it in tb_flush as a direct replacement.
> Use it in cpu_loop_exit_atomic to ensure that there
> is no loop against cpu_exec_step_atomic.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h        | 5 +++++
>  accel/tcg/cpu-exec-common.c | 3 +++
>  accel/tcg/tb-maint.c        | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 96f198b28b..8250ecbf74 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -64,6 +64,11 @@ static inline target_ulong log_pc(CPUState *cpu, const=
 TranslationBlock *tb)
>      }
>  }
>
> +static inline bool cpu_in_serial_context(CPUState *cs)
> +{
> +    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(c=
s);
> +}

Can we have a doc comment that defines the semantics, please?
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

