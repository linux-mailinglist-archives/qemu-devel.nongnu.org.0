Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A352D240
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:16:25 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrf4V-0007in-Sc
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf0Q-0005RO-KH
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:11:53 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf09-0000u0-Ci
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:11:38 -0400
Received: by mail-yb1-xb29.google.com with SMTP id x2so8343043ybi.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PJk44vaDOdYSg0hvqd7sdJBslmCvhiUXLUx6bbRwdI=;
 b=qjpjAaW3vk7tXF0d1inspYtblHzxwpR+nzTsm2MQdSUShp7L4qkVJNLjx7+nUkUuMY
 LWFz9awbgNxCpibIHULFU3fGY+Na8QLm+8q7W4d3p56AFm230PYFaCY+dILXRcdq9uQ7
 H8VOuTm6YMjpttDdQnimgn4onRbtL8wVBcU0+o0oIcBoc36TCepLjBQY49Ql3illJXAD
 ot13STi8kk1h47sikpxCDs/nBijNwp/y3FAUkFwuz/QJWf1FvRcsB749Nq8DC7EOZ7JI
 bJ4V2JXwODiJUn1M4aoYDnlqxGD+hyEcQf5KCSZP75vDAMtYZAOaX6PkwuCUn+JegnRy
 SI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PJk44vaDOdYSg0hvqd7sdJBslmCvhiUXLUx6bbRwdI=;
 b=6npVI5KW5iXqcmWuzY+eIL7LvtC/LhLRPZnbXSLrQI/3pFcbwzFGTcXIfCPZT0mWTI
 FwjeG7uF04MKA5H+ggZWnfVm+bgNUjK0bDypEqnG34jWW72DDcDsusvP4vl6TftfHfj6
 9pk429nY+eiPWSXqgF6QtTKiqVR7FI1FDokhXE/rBQMctlBfxB1y4PoIKDhDSfAaw2tc
 kzWtfpHl+SPRg8bP4e+tLDOHXLCYdkJ9l0LLjtqIS0zbecAKrkVeNIMvN6vzxda07rVF
 FV4EFMWn1Cr4COx1wb1PBig3550xkTU1ywOUgLkJ8TnMzxjJaqvdrMzxYkTlmvRRYJnr
 MMGQ==
X-Gm-Message-State: AOAM5323BglU7R/bbuVdDRcTA3dju48xM7TIusqwu0WtCctZ3BMPbdqz
 QPam8rU2uW/0Yj+MeWfAJ0LFFGG9owPExDgqf9kKIw==
X-Google-Smtp-Source: ABdhPJzlLHZpRkxjSfVhGVeb5WoNUMqMLfOpaqdTyoU2XmccHBY7xkzp+tNFJBjvjOMAbh4x0qVElhw6rcMK3ck4EKw=
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr1612232ybt.288.1652962252382; Thu, 19
 May 2022 05:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-6-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 13:10:41 +0100
Message-ID: <CAFEAcA-9eTc7DFkCUD2ow=OrNEHD4W0CfxODMtPu=fhfzsOK3w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] target/arm: Use uint32_t instead of bitmap for sve
 vq's
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Tue, 17 May 2022 at 06:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The bitmap need only hold 15 bits; bitmap is over-complicated.
> We can simplify operations quite a bit with plain logical ops.
>
> The introduction of SVE_VQ_POW2_MAP eliminates the need for
> looping in order to search for powers of two.  Simply perform
> the logical ops and use count leading or trailing zeros as
> required to find the result.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>  static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
> @@ -576,7 +576,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
>      if (!cpu_isar_feature(aa64_sve, cpu)) {
>          value = false;
>      } else {
> -        value = test_bit(vq - 1, cpu->sve_vq_map);
> +        value = (cpu->sve_vq_map >> (vq - 1)) & 1;

Use extract32() here, since you use deposit32() in the _set_ function?

> @@ -998,12 +994,11 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
>
> -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    /* Suppport of A64FX's vector length are 128, 256 and 512bit only */

If we're going to tweak this comment text we might as well fix
all of the typo/grammar nits:

/* The A64FX supports only 128, 256 and 512 bit vector lengths */

>      aarch64_add_sve_properties(obj);
> -    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
> -    set_bit(0, cpu->sve_vq_supported); /* 128bit */
> -    set_bit(1, cpu->sve_vq_supported); /* 256bit */
> -    set_bit(3, cpu->sve_vq_supported); /* 512bit */
> +    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
> +                          | (1 << 1)  /* 256bit */
> +                          | (1 << 3); /* 512bit */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

