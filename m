Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7C5F2ED6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:35:11 +0200 (CEST)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIn0-0007Xy-1P
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofIgx-0004GN-Kk
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:28:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofIgv-0001Lz-3L
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:28:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id s30so10232200eds.1
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iYWPdbX0XJJ/cmLOGry3A7D88+6pMlRTxl6D1mZ+wuM=;
 b=Z1JNLswhngiP6nCTJTZJlsudDnhQRdQ19+1Vq7GVMpnY0LQ+OB/FqO/FfsI02DuYoK
 t1gYzXCoomFKB/v967xGL1K3+dBedT7ZqT+Q7b8EO6afN9iV3LBRiVAbJeaR3rJM4gy9
 BI0bYmq3jmme+Ejg6+vfS9/OJO68u/ZhWF6Knd9pHkNofrPU6HYzHXCojLoeN7knthN5
 A88IApBY2RQleRwKqtBKBBI8G1wMpHmF0n/1oz8qsdo7DBghQXzFL9NV8BzxZ2AOVTxM
 I6je3BJpmC/le22ebHh0GJr5zDEYcFO24tRWUtmJzOpl9dwoRBJIfC9JI3ffaG8i9pS/
 zSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iYWPdbX0XJJ/cmLOGry3A7D88+6pMlRTxl6D1mZ+wuM=;
 b=DOrKk+fpRRjWKmAcm78mqrY2nRaZsptl96VfqlQMWFZVAmL3khKliM9RilkNusHokL
 rX62s6p5VG3tFg7iNO2A0uI4a8MgfvU2UhnyoGJlJ6X0TU/j3NRi+G7cyggUTGbKM9Zl
 mekO6CJD2pvKNx3LATBc8hCnaBxnWq77ddT36Gg0rTOg9LzSOPUj1Gnj09IvyGVk6WP/
 UTGN42HXYCl+gqmr/IXIYU6MAFtdEZxNpw2gbEJo2dxJ3SHBSHMhNutAPnvuv9RL2Fky
 dRSwLAVuXbSkZyz4YlRTu6GIZy23WIzhcXjtfD1adWK3kK0ROT877AdSjCg/UAhikNju
 RHLw==
X-Gm-Message-State: ACrzQf2yzJqBCmY8xWcJ3Fi+8USK0CWgZQF1AJ6oxRpG6RXKXKJUfPsJ
 iIZHNH8athfv72NKZ4BWRcASO7yVGW73J3RmNL6WYQ==
X-Google-Smtp-Source: AMsMyM5ggJdLpQeWx+LU8ieEAcTZPcbOva1qpZ2uk0YS259N5wcp/+HzmyQnqbi7skur2Bk0a6K6J6VkwnZ3PCogtnw=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr18152712ede.375.1664792931593; Mon, 03
 Oct 2022 03:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
 <20220930174853.2233633-2-peter.maydell@linaro.org>
 <3ebee616-2a99-10b5-0902-d41eccbec1f2@linaro.org>
In-Reply-To: <3ebee616-2a99-10b5-0902-d41eccbec1f2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Oct 2022 11:28:40 +0100
Message-ID: <CAFEAcA9SzEge=PUKJ4gW71gF14NS8aH3JwHwmpVeDXnd18XvFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Don't allow guest to use unimplemented
 granule sizes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Sept 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/30/22 10:48, Peter Maydell wrote:
> > @@ -10289,20 +10289,113 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
> >       }
> >   }
> >
> > +typedef enum GranuleSize {
> > +    /* Same order as TG0 encoding */
> > +    Gran4K,
> > +    Gran64K,
> > +    Gran16K,
> > +    GranInvalid,
> > +} GranuleSize;
>
> It might be worth using this in ARMVAParameters. Even if you don't do that now, it would
> be worth putting this typedef in internals.h.

I'd assumed you had a reason for using two bools rather than
an enum in ARMVAParameters, so I left that alone :-) But it would
make more sense to consistently use GranuleSize. (I guess for
putting it in internals.h it ought to be named ARMGranSize.)

Putting GranuleSize into ARMVAParameters brings us into the
area of enums in bitfields, where I'm not sure exactly what
the standard says or our supported compilers allow as an
impdef extension.
 GranuleSize gsize : 2;
seems to work, but is it portable? Or should I just put
 GranuleSize gsize;
and accept that that means the ARMVAParameters goes from
4 bytes to 8 bytes in size?

thanks
-- PMM

