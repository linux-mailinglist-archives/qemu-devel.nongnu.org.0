Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477F5131E7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:59:05 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1rU-0001Dc-Fp
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1KE-00066e-N4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:24:42 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:42450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1KB-0006Pe-P8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:24:42 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ef5380669cso47428597b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TR3t1TfnbCor1eozYnYhmH/MDRiyI4xw33OeQAeNJdk=;
 b=UG5hvrhIo8pYKRQU/CY0pm4vVZDw2ltA1QYVLtKkJ93N3249CJ6Dbao6bPuwqXKfU9
 aINMUU/HRkNCLwTZVd44MEHmpVGPV6XwvR8a8H0aH8xwkozq3Etqe83TI8nQZ1+H9C3i
 khAMdwnShBHCvGsOekTpXY8V6l7gL0ujNstXPkMyoc7PwHT+kT/C/riZRf77eBcIEnVe
 u7UM23dUNYH4cuTWcuETimitgsQx8X6ZVCbEPYbfak1omUheHIZlndqya+k/sv61bqhg
 +fcZZB12xqqdVMuSrx4b6VXe7h7P7X2r3/MxlJI3V+hm6TzR54/OMTmrDWk4lbdPWaJ3
 Rkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR3t1TfnbCor1eozYnYhmH/MDRiyI4xw33OeQAeNJdk=;
 b=ij/3xWXN6scayNf5ncGtyyRoX1AIrbNCuo7CG+Dap3uVgmNwtBFo6Zb/XvPcDI2iec
 +wzqxbRitfrZdGx4j9iderhP1dPG2RtD/OlioFcms5K0Hl3ietfGXvbJHMO0MvLBdtMw
 +Ib4VKIV504vtX1JDJB0Mj0UjiYwWYVWKydSEeTggoklEw0YcN1FE/d/McQRtIXGESux
 zDFDQmhxIuak3V/XzpXYxvUyr4pXC0r1SCyjPI9MRT4aROn61KgS5Ys/KgCCDutdL+/Z
 D9YxKwsrtx9O3pMv59yj7YNj27N7HYSPTo3tmW6IIvYUsVwvG0D7xmAKwFRDe2ykCI55
 draQ==
X-Gm-Message-State: AOAM531wyjG8ZInQ/nRzz8qvNj9X7BUJH3OeJfBcB3QwUKq84INc6scW
 7Qly4e3W70tTXc/TgNfjyi0jQu+vyYnKi+G0Udl4IZ+uHZA=
X-Google-Smtp-Source: ABdhPJyOM8E2Byoxs7CmsEXu6VArlslY7XxxFtvxv5QHoOv3bBxqgGCJR9I4WjK0BiB3cM/1kk8VUcZVthuQbO2/wZY=
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr9298970ywe.455.1651141478805; Thu, 28
 Apr 2022 03:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-25-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:24:26 +0100
Message-ID: <CAFEAcA-gy+iuq+yiaRmqt8D0Rqyx7EFRWLi1u=PHDawN55JeCA@mail.gmail.com>
Subject: Re: [PATCH 24/47] target/arm: Use tcg_constant for gen_{msr,mrs}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

