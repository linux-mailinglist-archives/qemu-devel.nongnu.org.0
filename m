Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B067737A152
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:03:00 +0200 (CEST)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNM3-0001JZ-Im
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNKS-000093-HC
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:01:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNKP-0001ZS-Np
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:01:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id j10so1345281ejb.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uwaZq7zm68Awg9uZLD3YE0KuATvaTNmFcL1OLhJkZuY=;
 b=RfRyCtHjGcSGc0EoRhxOUAkZIW4bcu9mI3pujzoHwAdX+IDFYTk4Mgbw7CC+P0Ed/d
 pXkVJk7mj9zYgOg8OWWtwCVwvtZxgIByoW4vjTK36N0caS/YObCcgFQR6otmBoGSxC04
 1F7c8Gy4BaVC3mFZj7Zs8wJkwwe85XdFVU19hdbYLVqcfryE2tf8wU2FC51N8vN0dFOZ
 gRZ/9/R4l3RhNJ2MKpFv1PXFLFlweW3CDou/6La6c1SSgejjLR/iwGeh54Z1eaHpF7hE
 Uke2NfnG13NVclk1g16JjNNNVwcWi/wI4tqLFmeTifQUXgRflbyjFIbsXBMyuWW4h/yF
 ptPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwaZq7zm68Awg9uZLD3YE0KuATvaTNmFcL1OLhJkZuY=;
 b=il2dnOxCSwwghf6yHsX2V/FISj1x5m2k6LGTkzRcotQ9E6spKSDxrwIprDWSU0uCYJ
 XbT6A7BWiggCHLm3I//CIaov/FJkWcBc6jyeBsPt7gS5l2Z/upepFTUCCvybJV2NPXAy
 oGb75LQ0eIIi91bqVdVeROmaamNAu+dv0yEPiEQhzjKZaFZASluO9m/7/a2Ddb1mVYYl
 KkrU5cEcNbTVprraWqywOha1qS3JLHG6HhmL0YR/sS7QYvI/oJz0knLqFAiUXj7//4mz
 D13SjgsODMdKoGhJ/xfTFQxfDifYAcnb3oh+wIpOZnb7C8tpI19Cik2O3Gv2sNDe8C3z
 QAHw==
X-Gm-Message-State: AOAM531VLWYe0vPgYLzkXVLkpiEPBBs9KnZUPxWbMKf8E/cQJh2sgxbn
 egnYc5nVyFSZ2GShwuZF2aqJSbHSppYKewYFxxIJMQ==
X-Google-Smtp-Source: ABdhPJxm34dw8lLq5CnHkG02CkC1JIaOiKrylHnIMf75saf3Rbx0OAjhLOi2H5wWUlEE0HH/9D0/Zfh6QLlyGN204Ko=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr29923405ejb.382.1620720074426; 
 Tue, 11 May 2021 01:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-3-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:00:02 +0100
Message-ID: <CAFEAcA-9Xnh7QRRWtrXfk4jtcTAczX1kK4RjNtL9+DAVsfDY0g@mail.gmail.com>
Subject: Re: [PATCH v6 02/82] target/arm: Implement SVE2 Integer Multiply -
 Unpredicated
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 30 Apr 2021 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For MUL, we can rely on generic support.  For SMULH and UMULH,
> create some trivial helpers.  For PMUL, back in a21bb78e5817,
> we organized helper_gvec_pmul_b in preparation for this use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        | 10 ++++
>  target/arm/sve.decode      | 10 ++++
>  target/arm/translate-sve.c | 50 ++++++++++++++++++++
>  target/arm/vec_helper.c    | 96 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 166 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

