Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D85BEE5D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:20:16 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajj4-0005gw-NZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafZX-0000ru-8T
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:54:10 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafZU-000409-Mu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:54:05 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w28so4494224edi.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tfgzVpi59/Pjl+qu/qGpphLrh0ra1DV1WK2Hg+B0QS4=;
 b=FTjMIfmtpVj2U79uzdfze/cwhTOtJE27oundOeH2CtXMfeVIhu2fnaJeiUfzM46wWp
 bG+GEq8wuovhDYAOVG7p0XHKHr8wvr1xWxUQBt8bpS7SDZl2MCSnALsCbnSPyQYllWOm
 eVPEuTSkD0785j9+3FkF7oi0g+PhmjXLpcvdpL8GKhJJdj1FxeMEWkrEKJPVmOcCGvN6
 lrduG9mOB05g1Rgbrh4r25WJVPvGm8n1aMMOEFdYZwVVGUglXEPzBmUDMooj6eJvkueb
 TFlRq71JmpLU4CEbkT6MYGvLUy01vWMYPod25GpWxXn2fg4gMsAu4kGyeAz+V+Z7dTjZ
 3VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tfgzVpi59/Pjl+qu/qGpphLrh0ra1DV1WK2Hg+B0QS4=;
 b=31Aoda0YX5fXPvHWZyjArG/7MlUlao/CuN2G0H0m5VnJ6VyW+7XCuN2+Io1HOxcp+x
 7gxfBsa02LmGMU7leEw/GsUQEw20E2HWGUv83ieFhkPAV0eUb9JM1LC6ozH4KYkiL8bv
 eJM1k6e1rzHkh8VRMzRh5BcqpnrmUrZCSvqeRhkr9vyOwbJBs8Mjz3M8id49doJYgaWM
 0eYOsglPHaNIumjP1760rkKfeR5UNZ9TQ9/KxIRKUXVvOe/zc1/2wDHG7zE65s8VCYgR
 uz04GLjV0wUavIncL92zsmtXfl8xSLAD4dDzBP9g+w6Rqajz2St2MFVmbEjAZIC7CDTb
 HQIg==
X-Gm-Message-State: ACrzQf01Z3DlUxAJ+yN0addC6l0WT/bKaFVqm/9HpstNEqy4MNCsSjum
 dd+sPBF0DZsjDRDsH9jkTxf8eW0yEbXPAFmSFwZcvg==
X-Google-Smtp-Source: AMsMyM4pYvKpMLEUhfciyRnNwRqbUbXnBOyTjX5V3cs5N+nMuz0iYJcbnWr72A9+c3IV0fOuwrlOTq9QVXFzcOPqBcE=
X-Received: by 2002:a05:6402:516f:b0:44e:9151:d54b with SMTP id
 d15-20020a056402516f00b0044e9151d54bmr20614791ede.241.1663689243111; Tue, 20
 Sep 2022 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-31-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:53:50 +0100
Message-ID: <CAFEAcA-K1an18+tD_4yvsob3tCbAytBrxgsJSbTuHpD=BrhJ4Q@mail.gmail.com>
Subject: Re: [PATCH v2 30/66] target/arm: Hoist read of *is_secure in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename the argument to is_secure_ptr, and introduce a
> local variable is_secure with the value.  We only write
> back to the pointer toward the end of the function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

