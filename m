Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F82ED3DD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:03:58 +0100 (CET)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXlV-0001IR-6E
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXkI-0000aU-UT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:02:42 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXkG-0007OF-Cp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:02:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id qw4so10292659ejb.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QpTqdLWtIvPKAiK2Ykk3FpvmzTk+Xay+EHGBl3cmab0=;
 b=tSJxIK764+DKGtx/Z1lq2i+zye3TMPQyfdqdYSZ9Qo7yjeoARJqFh4Q2wUgB90JSTm
 qJEVSzv8GftAQvoF24/9+LMd3oJr8L+6nPR6rBEF8Z+4eUZYJSF2kGXyQAa+vu1W6Hoe
 XBIX3u2WmxwB6oROQacdss1IZ9iMiu2Tx6Vih2C0P+IUudJ/k0VWD6U8mdrePCX3qOV4
 +imHFPE6DKT6oNaDGOVKqXURlVRb6FvqtcVQAFpMZO55P7uQ5iKRxtylX9B3AY7mTHvD
 zT/SXf41zgW9YZQg+5OGYpjqpK0gSpsVKtRW+Y0TzVub7SdDLj3boLNHpFEM9/LU0d7Q
 qFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QpTqdLWtIvPKAiK2Ykk3FpvmzTk+Xay+EHGBl3cmab0=;
 b=ZB4lnaxrhpKCAMtHkth42a6UoxUWwirs9Z0T3Ay7Sw1uCyl7blK0Fqh8Vc+XFHwu72
 VNOZeueUnb4eMS7uvhSTMZvkppJw1r8LTsKbbPQpy2+1zWxfNehFSSzG7C7pE7jKeWyB
 rrRKlL7tgZCYQRTN2MiC2fpn7BA5vZ9L1e4cGWm4OtQWpWHCff70AELZIlpULnITVlxT
 pptsb/WuaaKbMy0DJP2uJzWbV92lZ89/zF+Cp2K1Y1kCaNpDO4ajbW2+lwLiyhSxrGlD
 a6hAPHB2DQ+W+ZZEJff52i5SucGkqWI23WlwwtQ9E7UNTn7r9p0vc+5mmy3bAvIY26SU
 kN5w==
X-Gm-Message-State: AOAM53110abyC8j9rWWK0nH+9na79OYLBwwNJmFsPsxM92mrgM2sYu+y
 cGoQCk8KYQaOyWAQSZzVJkXVFoF+2dsKcHRfWmYATw==
X-Google-Smtp-Source: ABdhPJxVxZCYtRbpg7yzOhubRw9C02wj3nK+xU7gUl1SU9onzeGH7+2Qty+wdvPpGPA/ZUljm0GIZo6cdslRZmG7jiU=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr7069419ejb.56.1610035358781; 
 Thu, 07 Jan 2021 08:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-7-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:02:27 +0000
Message-ID: <CAFEAcA8aP6PT8Ziw+JWpt+WwZjeP1CJCK9XJ30=UKyChBwJzgw@mail.gmail.com>
Subject: Re: [PATCH v2 06/24] target/arm: Adjust gen_aa32_{ld,
 st}_i64 for align+endianness
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust the interface to match what has been done to the
> TCGv_i32 load/store functions.
>
> This is less obvious, because at present the only user of
> these functions, trans_VLDST_multiple, also wants to manipulate
> the endianness to speed up loading multiple bytes.  Thus we
> retain an "internal" interface which is identical to the
> current gen_aa32_{ld,st}_i64 interface.
>
> The "new" interface will gain users as we remove the legacy
> interfaces, gen_aa32_ld64 and gen_aa32_st64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

