Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7384FBC5A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:44:12 +0200 (CEST)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtOs-0004sT-SH
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtHX-0007Tl-I6
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:36:36 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtHV-00063v-Rj
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:36:35 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id k36so5520796ybj.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJceF+Fjbu7tooPerwpQur+R/9RqC5tB95zFeSFsN9A=;
 b=XcJCMpCAp2MzkYHVZIZGlknYSpDjMIXxErGkpJN71EEOso/Ps1IBifYPc9ba+X6QMF
 E5dhw5rgcBNKUGtHQVQwJMwhZzmCJKc6vpi56tXp9VROW4vlxduVSFvgjMf/iKiCRmfH
 UUTdjuXv9C2ba1QlARx57gC4gvURiy4LGXeNt8FVD+7yTg8lHV24IX9LP7WfQeBKuGjf
 E1Z0jlYWtSqc5e67yfVuZ7ZRXrRlP/NF4folxH7S6brmaoJ0vcp2yWOV20EsVmae6Gua
 KO9PcMWAAvlTl1C9jjLI7io+KeKIXd9OamVu/vgXjzjY7cqhuLhBMniqA69ighr0sljH
 XaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJceF+Fjbu7tooPerwpQur+R/9RqC5tB95zFeSFsN9A=;
 b=V7tXjnHDMlFP0u7nECwI5nEZVS9l2rZnDGKaFnYBQxDvZAQYcfAl4aQopk8QXNQNLV
 hEIKVufi2tCBkBRddxVhuwxQCx52ymsuc64q7gxmOSjG29gsE32BqGfHLyXodbm8b5NI
 a86hWRFFb3BQNI7o6q3N5zuVXR5CP9EE8FBWAwKSTHBzV1/5rdP/kZ9AlG68wUEy8VU/
 4bfssT7aLgOME3Jd4dh0eII0c5H87nSR4lTqiH7O++fTajLEAgAmQGyL1+t3/WkjqZNd
 iNXjTZ6hqpygdb3TMF/hNGZIgIn5yQ+jQhz+rdYyCRZ+hs7TCL617Q+ukT0UkPGgV3v9
 J6Tg==
X-Gm-Message-State: AOAM533lN2gCWvSw0ps7YtW0bjAbl+pIHbUhQft/lxpo0Q5dEG1WfqET
 j5bh6pn1YN24JLdKm0sOXFJ9RD/dLIrNXunN/N9Qig==
X-Google-Smtp-Source: ABdhPJy2P8bgSVvsROds3hqefklx5InRI4I444if5kyork4xPN/YY5eUFBrFrfVikbGF+Lho+CA5EVyqZka436rNGdE=
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr9123385ybf.85.1649680592544; Mon, 11
 Apr 2022 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-5-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:36:21 +0100
Message-ID: <CAFEAcA_T7nP6iGNuAQ=zLZ1HZ35e=9D-MEWtrkhKW4=PgEs4tQ@mail.gmail.com>
Subject: Re: [PATCH 04/16] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We set this for qemu-system-aarch64, but failed to do so
> for the strictly 32-bit emulation.
>
> Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

