Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94385BEF01
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:11:03 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakWE-0002Sr-Gm
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafnA-0006d7-Ok
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:08:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafn7-0006CH-Th
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:08:12 -0400
Received: by mail-ed1-x534.google.com with SMTP id q21so4530344edc.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mL5JaRZf14+0JVykLx8PArlnLI9Rt0Qy6L206SVTixc=;
 b=YASw0h826NxE5pSYqt+1r18Pxo69fthuAZoZoTR6vOxqbJn6cCyUg7WBrBTlIDDFSs
 FDDGsKuyFr4pDmA4B5bMzC8zwKKug1xo59F3+6JPvTNsAop8QGeyZbcrFtWwFKWrRhmc
 MFBsNiNAnL5t84Du6vZEKsD+dgBh08G+iUZRV7y4lAcjSpr5vfL4ZRSmOMQI6NlAPkMt
 kJVDYstKmO+rSSiNRJXo0gIrp9yNwXKjfPBVaMlg4BITroJFZvbt6wBBuo1px0NacaLl
 Nn1riUt90RdzTpWmSQQk7mOdid9/1JnLl4mMQsDvwaNOpTM6tPrPwWn/8syOvl1nqIEq
 0sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mL5JaRZf14+0JVykLx8PArlnLI9Rt0Qy6L206SVTixc=;
 b=2CjRCR/Ef1QDLda3cxNJ3pPFrvaTbSpCMYzWLtDmhTZuN9NJrd36AXMhDshMmHBtLy
 TWaSYp0NKjt1uGc9dDzjRn48C6yQCaV8qpPLWipSnTumzQIJ2LFJvJ9xeHmYFEzWYR7B
 gmtUwkMZDxjwSUsN03FpRE6iTHFgJ72GlHJ/QZcABACkCyH+hSCBnim1wpG853sqH49n
 jnOfqx4NaMyitC9a5qg5tuwRvQQ1IF0LmPZuO8Mm6vnQEgWV3dJYLGo3K6xVjWkDPhTt
 WwW+7KVnWypEbkRPtJxlzQREnb+H3dwp+1zPNfGgx7zsGCqPyGohfvpY9DACABxrGEy/
 zWNg==
X-Gm-Message-State: ACrzQf3woDZOccqU8vHet0RdmBqRgqe13L+Rh2kWrC8YJP+bMvMeow45
 GQOtc9S3TC5jLaArLJIEngxuzQttpEt2a09CAWMAUw==
X-Google-Smtp-Source: AMsMyM73PTWBad5ASDeipKa9Zmuq6NzNIHFQGRAdcoPl1qY1NeWLm98N+gsFR79Q+fzH+5I6XZfAeSBmg3U7752gl3o=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20472012edq.140.1663690085872; Tue, 20
 Sep 2022 09:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-34-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:07:53 +0100
Message-ID: <CAFEAcA_oeoyQfrjSdUENfUa9MXzp87dOKJ2mgotC86=QqhOUUw@mail.gmail.com>
Subject: Re: [PATCH v2 33/66] target/arm: Pass HCR to attribute subroutines.
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Mon, 22 Aug 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These subroutines did not need ENV for anything except
> retrieving the effective value of HCR anyway.
>
> We have computed the effective value of HCR in the callers,
> and this will be especially important for interpreting HCR
> in a non-current security state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

