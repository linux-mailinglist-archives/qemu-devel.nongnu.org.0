Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E557F578134
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:48:19 +0200 (CEST)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPEZ-0007BJ-1g
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPBZ-0004qF-3W
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:45:14 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:39796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPBS-0004N5-QK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:45:11 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31e4c3b1977so1423817b3.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/HedIyWCAWaVet9/kjbLGjwZonFcp7lcVAE0T3lgkC4=;
 b=H5rU9RBgH2mY6eCgu0WKWXwztGTRNceMO5FommH7jnkIONSwPp/v+Kp3TCeFhC8BQ4
 AvGTjwRwnHX3WXimipPlBS0q0UB/8+2wS5QQO1TiPtU5Qfd6ZJgkz0Xxpe6Z417dyMTj
 60dAo7/gOOnicYSALMd6s3T6uQoM/yxBuBWXENkhpMIj2lGcriK1fMSmZf4nmqSRbqBA
 bF0A4BuzubyKU+JEKpqAUCrfZRUVmpLgGHf6VjbQny/pYXWrV1l4y6VCj8yUxUsmdTyp
 ienx6Zb0Y+bGi4NV5fCtJLo75Zv2e5smPBRAtOkppq/XoDLjVb7DgA4Aop+5KnRE5CYi
 wgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/HedIyWCAWaVet9/kjbLGjwZonFcp7lcVAE0T3lgkC4=;
 b=eO/OFYvSL6yQyB4RBFSzpJCaTtD95FQ4Ui1xhl0+mdLVIGUERBGIBCHuIjpvyK025a
 yrSP+Q/5PwBnv9NNpgj7wVGOYoFLK+oWRYKZf2zemjvhLhWy5j8fefbAfiU4d1bF/DzS
 I1PQUZg6itReUssthhyYGFtMUMyk2IOrqgjWzb76o2LYZD6SxN1XzaaIexW1A5wcqGQ8
 W76vEwTXvhKURRtf8r/u/ESwzlKabF1kwjjWr1PAS1E3Rs7Y77B1Q2vXIm3/aOw1Cz/L
 CcABKfMnjytn5EkHDlzNi9tvd74eL4ySvgcP6PvoFz5HmAq5MF3TlLXbBjroxX8XRfai
 aHDw==
X-Gm-Message-State: AJIora/vLd+sEFPA/TcswzKbkpHdemxFWYBJvCesJa5hg3RgeilqyAec
 41wf/R15B1+09JqCSFBFbekn9iRKZ89tydP1WAjGZ7gz3SU=
X-Google-Smtp-Source: AGRyM1vmPxU4P6SJiw8MWqb+MOLBuYoSgNbG+pnmyuIYb+gY5MwH5RxaAqB3DotGFWBn6My5/ByJ1SLkdTkrGMTKBSU=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr29659900ywc.64.1658144704958; Mon, 18
 Jul 2022 04:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-22-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:44:51 +0100
Message-ID: <CAFEAcA9AsAJvmD-E4gAFWsoSufN4r3o53hfj_7fLdop-dRGyvw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 21/29] aarch64: Use arch_init to configure sve
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Fri, 8 Jul 2022 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust some of the aarch64 code to look at the reginfo struct
> instead of looking at test_sve, so that we do not need to pass
> the --test-sve option in order to dump sve trace files.
>
> Diagnose EINVAL as either cpu or kernel does not support SVE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

