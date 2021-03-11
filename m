Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05E3373F3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:31:00 +0100 (CET)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKLP1-00080H-Mc
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLMW-0006kr-5N
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:28:24 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLMU-0005Rf-NV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:28:23 -0500
Received: by mail-ej1-x62d.google.com with SMTP id hs11so46234120ejc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFAx6S4F8S98ohuzRiWJ92WWRqyelRiY0Zjv42L4ywg=;
 b=LZJU9KGRWgTRuIuYNbAQvihVxkPaBYDdz1Y9jpyOd8Vd+gAB6n1MDFjqbT5dvg0SDR
 P6SThan9zKrjs4kYM+xYs4LxOIKZ7OKXi1LwkEd7bl8rd7HjrVwQ46rrp3AV2P3j0iBl
 6EaSRv9oeMt7/xTy1Qv9ltOxbRGFOJ67MN2Il7jN+pzbes9aObz0Q+Bs17mCg28WjCig
 HmcpWC1KyuI+Mbuabg79NpBolz+5XzDIG7gOJ5xFKqFM6h/OtdYA1ivVZr1zOZZ2i+PV
 6TXzfFFroQxpL06dIPh6TnF18Y6VatDgGXkcXTq+PY5C3HQjhBDfkVTJuYjGG96R7yUU
 dxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFAx6S4F8S98ohuzRiWJ92WWRqyelRiY0Zjv42L4ywg=;
 b=rWMWiPey0w5epIgsFtj2KF+0BGFHW2r4al0cCQkvMMYITVInOU6ZH6XPXu4pLhtjC8
 FLjlqerEfXQBV9GweSx+zw5ONAiXIA/2ZmHg9TdXNV4gldN6ASVgmO+BaDxrB9XBzHO5
 yyzZH90xhsEEshq7RBX+KB5pqb3zuEHP0KPKEF9xwm5lL7nOUMMaTvi+dVF4MODLuXqY
 Eudxmr1aNcnetRv7OWPgNKF9BR0WY/i514ukj69AUo4xmnXLpV6S2ecpCrmV6Ou7PUaS
 24DfS2dYtG0SCqFIhH/Jv0FO1DE/UIi79crsDrgBNznGXSqoLX/vrivga6QOmmnR2nNp
 c70w==
X-Gm-Message-State: AOAM5333dGf5IE2Px+KuGLYPnxv+9Y1B6bK2Ipj8tHsY5qAQVA0NxJft
 rQyrW+wG2CKGiNOv5B+ckEOcXRW2aVDSjbHnKWQxbA==
X-Google-Smtp-Source: ABdhPJwzOF5sLJPMU7Yr682caCwCSyyQmRMj1S5Rc2xsAxdbpWzpeSOtRlBELGgLFdZe1ekSWzasPJIRg3g0f1jl7iI=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr3061967ejb.407.1615469301343; 
 Thu, 11 Mar 2021 05:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20210309155305.11301-1-richard.henderson@linaro.org>
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:28:02 +0000
Message-ID: <CAFEAcA-pUd21VcKGfOdVAiJzeEEfYFwmmzqW4CP3Q56N6526Cg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] target/arm: sve1 fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 15:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Three of these have been hanging around on a queue for ages;
> the rest are new.  The WHILE and reduction bugs were found by
> RISU triggering an assertion on 384-bit (vq=3) vectors.
>



Applied to target-arm.next, thanks.

-- PMM

