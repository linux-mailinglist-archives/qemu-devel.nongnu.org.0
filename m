Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE226A1CD9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:16:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXun-0006G5-IP; Fri, 24 Feb 2023 08:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXuh-0006FU-19
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:15:03 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXuf-0001vA-41
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:15:02 -0500
Received: by mail-pg1-x535.google.com with SMTP id bn17so1885339pgb.10
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nTskzxdbRXMuApPPtFPWVNUXvgpe96eOCwx8YeHMGfM=;
 b=YgGwCry8I2RVfoUYtKCauBWNf+/qLmpxi1D8a/dkc9lmlXkFrS9ytoDm6CRJN4gLP4
 o2zYe3nrf+JsM5m5cbcuSA8t5WnSa9pbSBPUKJwBSg7cXf35IW0lsr5ENRMYiaqR30qM
 2HPss1Kt8IedQejLMDy44sekE/Sfr3EioyV5yepLANu33Qj96tvYHxyL9+8JXMF2xjv3
 povRqmV8A0zaRN6vP/l6Kz7ykXmBnNTjY06t5nOrWJGoBSuSW/huwMcWAb3Lf75sFUGD
 7ejrqJ+ZXmCuG5pQUfGPEDgJse4bNyGTztzN8xZq041ifAQb5od1rZ77J9GT/ykxTc6d
 5hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTskzxdbRXMuApPPtFPWVNUXvgpe96eOCwx8YeHMGfM=;
 b=ISB3wImbefjOc6Q2FPGY3Tuyow1D7HivKvsEoeIaLZD0X5Z6RQpm/QSvkGZHMGhw1x
 u6QDDdBPADpwDwaoA21dYtCnLwCu6BLeg6rDgMcrsgS5P1M3OkvaiCtr2v4beEqjYVjX
 VkDvAoiUJvo2rPj5jIOTfKfSBk0S48eFfNVJ1y6syvMZZ1tB/jNhsh06Qg7CNlk4WaJx
 ObzoOdLotVyIlOgEfVQB+ICd0ZFrxfvxaRTFIcJhHttjXNbwVYu6AA1Z6Z9678MfoFWf
 YLKrrjPDzMUu+amQEfx0494L0TUrpWvwr1ax0L4OucqhewciT8nHhog36NnHBZlDRD6P
 NZ6g==
X-Gm-Message-State: AO0yUKWvQ4MKh54sJAvedkQONszL8reueL2GJkUPBUxwrnpv3DTjUhge
 6u3vxK0L5tpBu0elMHPKTWokr0ott9cxKBwOWEddRA==
X-Google-Smtp-Source: AK7set8vLtAubYesz1Uth7pw8U8LmVrBWLV7fZAon5dA5onOvUja+PRPy5heTNg2MyLHhOgE4Cm2BYfnZXHcc3nGX8g=
X-Received: by 2002:aa7:8a0e:0:b0:592:41a:1054 with SMTP id
 m14-20020aa78a0e000000b00592041a1054mr3126292pfa.5.1677244499180; Fri, 24 Feb
 2023 05:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-2-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:14:48 +0000
Message-ID: <CAFEAcA_fMoJ_yrNZG9juARQLhujJWha5tTOkTWFgsApM3MCAFA@mail.gmail.com>
Subject: Re: [PATCH v3 01/25] target/arm: Handle m-profile in arm_is_secure
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

