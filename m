Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA194D13FC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:57:08 +0100 (CET)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWaZ-0004Qx-JR
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:57:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWYj-0003Pc-8d
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:55:13 -0500
Received: from [2607:f8b0:4864:20::b34] (port=39754
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWYe-0005oV-Tf
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:55:10 -0500
Received: by mail-yb1-xb34.google.com with SMTP id x200so36600737ybe.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rA/HBm0EBiNUSlYf/HzrVu+37Mc8WvcNL4oHRGYTn9Q=;
 b=WhvzEMnC4iAk+PuMYpaznFrI4zZ33WQae/7t7Cbl0izojKYfiZTWsEYsf8iON0arFa
 36GcpHUjRndD+kmduLR12oWLO2TpovHduuzhjYR+BKkoI3oBBwfGNq2ZmRaVAN36A8Pz
 8HiG8rgzF2ySf/++2tzt4+VJoPSALY8JpFQXM/SfImZKcRtLm4EAtdhpNlwUXLfxHA2b
 QVfgQwrGO3BSUs3sovXv8zFquvp3O8sJsLLXmQWyuSaK0bjCLBnUYNqpwmMeeofd3Ug+
 6hlo8rZ7mrtE418Jw8EeqBIfTOnyy7K7v7nO0lOCIfvq9PboO4Z8wwBgiX95geRM6tu0
 WVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rA/HBm0EBiNUSlYf/HzrVu+37Mc8WvcNL4oHRGYTn9Q=;
 b=wld2hFzy+Gxhs1/poakABOIAKpapx20+SVW+tmOnJYKSc1gpsXOcIa5OLE0soXpB54
 bkmmSzzG3vRcmMHleyqpiPR6yyOrSgHs2l8FYvZJzAoFgmta9wWDIYsPIJHMoLocpA3F
 CX+0zsBooAsksyv8sjDtn9b8QjD0O1YGr9Jo9ovMFTSnUnvda43jOEf3z4Ssb+gZnYF7
 QZBlw1jN+M1aCkEPkGbvfbRj20acPoJ+EyObef+W54ucrXQktkCNrxTF+DW1KcnAtdyh
 /xZX0Z7aqqxbZgBBE23NpKy+6YLLDgJOPzV4PZZM4LNdiYcq4/7oowahLtWoR0JvtT+a
 jqyA==
X-Gm-Message-State: AOAM533ja2JY5dz9/+PSMM6QxHJ0wCPfKktJzDnnnYtKBtPneFK/HVZh
 tAxBp6NojkcEXKQZZaRyhQW1I7gp+szaaM8MVeoYUg==
X-Google-Smtp-Source: ABdhPJyTBRg/bucmcSrhgOb6GC5rFy+c/ODQO/MuJfARl6DQdizAx1wm5MyI5qstoAwIqoyj7wuTbsjE5Q/CkYWeJhc=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11223476yby.193.1646733306970; Tue, 08
 Mar 2022 01:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-7-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:54:55 +0000
Message-ID: <CAFEAcA_gNvs4JOWvUyucvhnvHemPPzp5QEwk6k1koU_OxcM=rQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/33] target/nios2: Do not create TCGv for control
 registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need to reference them often, and when we do it
> is just as easy to load/store from cpu_env directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

