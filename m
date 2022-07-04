Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB22565539
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:27:44 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LB1-0007IG-CT
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L8A-0004Jg-3f
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:24:46 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L86-0000gr-Pj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:24:44 -0400
Received: by mail-yb1-xb33.google.com with SMTP id l11so16560699ybu.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhM0rvZNV529ZiGJGTPrUnIriRxSauUrvAcB52E+ZJc=;
 b=VhYH/znUaA3ZFdORjMEeFkihDOK0epjj/m2R4CRK6OuvVkqxRDym3cCMD8jECzcZ/F
 19yKcScj+MhMY5fvR9LvYbwtfH78j2Uw19DdLd19D0At8WEXy3lHQMJk1WK+XseFq5sW
 u64eJW/qGpOknKlwivEvdNmVbdaW9/cLbdC8ss92CpQR2e9nd51y4CtveYUtiyUr9kPD
 jVeCrrFEvPjIsPl9SyJOcfMTnUlGtaUIhV4F3s6nhXqPjmuHptTNmJ4tLy83qqEjUmn7
 InJXNry/90Zq8Mm+jSj3PyYzewf1iuF5PdvhjSEPfgAJoj772UbrdsxvmmDyuU7j0Vim
 wtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhM0rvZNV529ZiGJGTPrUnIriRxSauUrvAcB52E+ZJc=;
 b=ZaVZjI9w3SJYW4E0stBzwYBXc5G3APeNwZDH1xvZtwmeT7UpN50vXh9f/KYsZwTQSk
 0tnwd/Ar/Iecook3ttpy+yml8+btlYwgYSnaBkIukjXbYV8pivDAMeyb+ds5NWGDmh2p
 5YsauGNjqCXka6Yy0uZjxEhB35FDcT4gibuogu3KgYy3qPdmyfpy6Pzf7h4wRJ+afwrd
 kuln03I2veZexA7WIGoCJBI0Yx337zm6NUqWsrZvfNddoISbQtRvtPbM8AcnpOq9Q9yZ
 mJ9lmohFKH+Fym1gGPbPYV21qvzrGLME0FOkC7OyuM2mRmmdScCRZQcM4Tfyq7z+ye+i
 BDjg==
X-Gm-Message-State: AJIora8OnKjO+BejSRXCb8iMXyOBKM20Z31IX1mZPKKfDK0UJf4Ut6eP
 GBQjNuDER1RFysFNpXTw370IuSKKuPKJmuzkA+SKKQ==
X-Google-Smtp-Source: AGRyM1suFKWu9CBSPHoPDYxuJSbqAQbcvRYR3z9OHGvKT0Py4UrvMhGpYE8YrDxoa7D2+CLGWwZCdDad9w6ejFV8aLU=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr4578489ybb.85.1656937481690; Mon, 04
 Jul 2022 05:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-46-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:24:31 +0100
Message-ID: <CAFEAcA-CZOkW5LrX9SD8v1orbwEO2tabrEG9nPgBRHbu1pzy_w@mail.gmail.com>
Subject: Re: [PATCH v4 45/45] linux-user/aarch64: Add SME related hwcap entries
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Tue, 28 Jun 2022 at 07:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

