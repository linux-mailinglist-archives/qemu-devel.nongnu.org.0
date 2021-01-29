Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F0B30908C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:25:24 +0100 (CET)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5d8l-0007Pv-KF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d7c-0006wf-ND
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:24:13 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d7a-0002pQ-8z
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:24:12 -0500
Received: by mail-ej1-x633.google.com with SMTP id g3so15309611ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sf5o/V7BbaCBfgKaUCr/N3AarHf3h42Q2/4j/ky4cJ0=;
 b=BcaGDMdIb1fCq2dT05GD6Dpu0ofTd/i2JSn/AA9Q3Q8+MtaLlsxETKO9WQwD1R++14
 QW/CexxxV/sotdH9Lu4KSJu+qA/0IoFpj/BdCj9U75RKLpKGK/wJ/0fTzLFY9LOPDWqd
 AOa3dEsadWP0Ve0+WQYlW71Te1t5WH/psQfMKnzR+aX/CHigCYz48zkhaXO0kRn4Ai1k
 LTPipfqX5XzBKIcBAafUmeyQLHXw93uFhyNznwepy/5bXbmwpenWaKPq84CBXnV6Sr6l
 duNvfCyYiJFp513IMriORz5tAG1hRby37h3kXxVKzZlJaTWNNjJTfHplk8RG/sdN9VqG
 xSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sf5o/V7BbaCBfgKaUCr/N3AarHf3h42Q2/4j/ky4cJ0=;
 b=L6gdPiyJV2XZXqH9DacMY2tZV6MKBVntINYBlplDpqZgN2pkLoID8pcz5EPjjpdykj
 kEbK3PT/nmOLagCqS5gB0xaCEqHPhTaRWAK4A332fsmbXJyDH11i+ZVYN8vKt5dxixcd
 CIY/zJYir9yyqRwRDLd2AYzlvdnENTIQjAvZMRSLfVGtLSYIDR8Jfp7KMnOmVLKouw+G
 3sGQBmytZwdNWraMsTHNSCB3kJeqSfbi9nlcos9yi9k6HwVKnGhoYLFY/teD9DPr5LxR
 mCRJY7I+pDfjoW+e4tklzjPXtTtN+yHpvW++uvP90RFDv53KD9DIqY4Ns/4zfDIKJqx+
 5OSg==
X-Gm-Message-State: AOAM532LVxRukGSx0bvLsWAQZZskDCrhJFsRV29TXsJKtrfwvr1AjGNP
 xv9AJLJl/HpoKPCO3dpc6UHiTXH/aLoDiWEX+Uq8+Q==
X-Google-Smtp-Source: ABdhPJxF+1ia5emyJfKVTJ5UHV+hImGs7q7v3Ixyvp/yADR725wbrLfB5A/8/vm7P6CQzpmRvl3dRBKyDzOXqlL4Xfg=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr6844302ejj.85.1611962647649; 
 Fri, 29 Jan 2021 15:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-6-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:23:56 +0000
Message-ID: <CAFEAcA_AEdxXijEAi7hc_Fc1VM76pEgQQa+kbQN_jMVoZpfBvA@mail.gmail.com>
Subject: Re: [PATCH v3 05/24] tcg/i386: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 20:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This eliminates the target-specific function target_parse_constraint
> and folds it into the single caller, process_op_defs.  Since this is
> done directly into the switch statement, duplicates are compilation
> errors rather than silently ignored at runtime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target-con-str.h | 33 +++++++++++++++++
>  tcg/i386/tcg-target.h         |  1 +
>  tcg/tcg.c                     | 33 ++++++++++++++---
>  tcg/i386/tcg-target.c.inc     | 69 -----------------------------------
>  4 files changed, 62 insertions(+), 74 deletions(-)
>  create mode 100644 tcg/i386/tcg-target-con-str.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

