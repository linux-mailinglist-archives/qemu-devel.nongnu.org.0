Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA450FA3F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:23:21 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njILo-0006kZ-5r
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHs4-0006nH-D0
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:52:37 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHs2-0001P5-S3
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:52:36 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id s30so3966418ybi.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2i6eDO0N7OUmMC4LOGDYFXXi8Z0/QW5VMOuKPk7jPSQ=;
 b=okLKRlel02lpTProJHUSP2IwETxJMQEiTcUV8VhNSEMd3ckv7ZyO8v7fLyHnMwZ/TH
 BAhZrtAn8pUL1sB7hduFLX4xa0ZhvrTUkwJaqN4TBOcPg6y64M73N2yro0cQBIp+20ru
 mMYl2y66yFAjQpUjaaPbEz0G5iLliXHO0sS48SPv9tCD/ihp2Czw4sIDbyFm4ZCfMSiH
 WFmac56EhbGcBM8+AqbOqCNMha2Sn6cMM5MFX319+cKDxqe+OoCOYrShhT/Cpz+c8MeG
 DbqQMFRH8x34DZDBwZw/LcywkxdOHLXaH3e0DmVRdq3Qv9KYr+K2ycL/qgXh9on15TDQ
 QrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2i6eDO0N7OUmMC4LOGDYFXXi8Z0/QW5VMOuKPk7jPSQ=;
 b=Jl72HFCaRBPT0zTSHUk8M7J5TmUtDdSQnm38orUB3+Pyuk/kGCBgNGxbi99L81DjCF
 FHmT7Hd292L7ml2U98mvWWlQcsMopZSOzruqYKCjsYQJA9DfLtP0USCjcK0WvwxDJ9Gd
 /7OslbPYOGfG4lawEQaWz4LvG0KA1jS2iIxJ1+p6sk1uEQXo1elREa0PyQw2LB6YAffs
 fL41QsmFpf2P3ZN2IGHcFtdtT01ResTQEPEShdQ0Ez8yYVHmej2hrXLbADOiTpx/fF6K
 nvXdQFdaVt/EbnDetXTnJAl/VI/A9SysjGl9Ej5Eri+dXEsTZTSQWpWasoiIXfIXVfa0
 kEHg==
X-Gm-Message-State: AOAM531VBVvc/EcG/XbXEhQycfi8T6t7Qf/LbcsOe3V/H/t5qJtkOkKx
 lkfGCzflsHMW5zf3TFYqkVi8slH1CkjXDAAIvuYytQ==
X-Google-Smtp-Source: ABdhPJwP/W5LUDk3zVCEmcpSMhMip06IGN7BsEIsJkp2oDnasGZjkFsNIWgAUXg3I2g2Yf29lAMmzcU5O+Jx1rpqBuQ=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr19266887ybg.140.1650966753760; Tue, 26
 Apr 2022 02:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
 <20220422165238.1971496-47-richard.henderson@linaro.org>
In-Reply-To: <20220422165238.1971496-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:52:22 +0100
Message-ID: <CAFEAcA8aAh=dR81wAx_ohwmxdf-gGj-4Vb5L0gGisY1KGW5zyA@mail.gmail.com>
Subject: Re: [PATCH v8 46/68] target/nios2: Split out helpers for
 gen_r_math_logic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 18:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split the macro in two, one for reg/imm and one for reg/reg.
> Do as little work as possible within the macros; split out
> helper functions and pass in arguments instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 54 ++++++++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 18 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

