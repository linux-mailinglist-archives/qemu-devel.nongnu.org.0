Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F652518B0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 14:38:52 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAYDz-0008O4-Gt
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 08:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYD8-0007fy-HW
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 08:37:58 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:44527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYD6-000749-Cw
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 08:37:58 -0400
Received: by mail-ej1-x643.google.com with SMTP id bo3so16292398ejb.11
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYEs0SeKjvZ6gq7eyQ0Q6adsfDtSQvq1sxT/mG0sLzw=;
 b=X+DaCrsqja5m9fWQnE4MNpa1HveQpJ9hpUJSeWohnwCHfDtM+Q+Jb7nXUBO5FMawTR
 LaPxtOg6geE6Ow4cgO1TlsxrXE9ylAVZ9GvcVFrnWupr1280brdjKdtlSEAnapJagUCt
 v8CBa9oriWC+BGH9+Aw9TNrFu4oFmlgcMUDb8EmwxYMl7kfzxWQ6omqMKkGhFnyhW+EU
 TlPxDaheHuFqfDkwfY8RTDi8idARjCiPB2l4AlUE2GjfyRpxG2TRz695dMcLdEijcB8K
 UHHTwD4NXtAphhp0D4qBLivlUjaJMWfw/c/3+bAfsaeOOisTd2aI3Vs6sZ4FKxgE995o
 8/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYEs0SeKjvZ6gq7eyQ0Q6adsfDtSQvq1sxT/mG0sLzw=;
 b=PenIFrcxZioPRhPgsQwapnTUaaiPf/2GzwJhk/OcLaQjIQ9iYHTUNCnN1UpTkjzOHt
 ABVh8dcBfUJ1ps9HIF3eT5NDIdh/U9k+R//R9S1VjHnsOkMXW8eBfXsGuQia6fvC+2IL
 cjJhzrPQ2ZERl88eqGFpXFOBPWcUJRqeOMR31khz3t84lOiilmFHWO5QtojpWsAeB2Dj
 7q36qMdHUB3G1dtmfXFrTqXTe75HJK1SSnswHT/kZlqgTWKqXj3PTMkE2AkPJtgpIq6i
 LFYrfEkm4bNm5sgglH2uOweRFF5IBDYuPqTBB2Std1qPTHnxsRBQQRZb2paSz63Byiza
 EAzA==
X-Gm-Message-State: AOAM531hI+Oq5RTuy4gKl/eCdCEnRaIGpWOj/Ssxqncg5i3OFqxgYJN1
 MsKa84iE/uQ12cWFbjiR+vGnVT8GUAmQbsdxvyPHzw==
X-Google-Smtp-Source: ABdhPJwTOCVcymmwr7UFsaiwkiwkN8WdxU7n+QajkSjWT8+0nhNR/CybIlny3nLIkfZrV6rEvtQVCGANpMDGSCGkfFQ=
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr9998004ejb.407.1598359075171; 
 Tue, 25 Aug 2020 05:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-4-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-4-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 13:37:44 +0100
Message-ID: <CAFEAcA9mbQmGRNqJC7FmV8gBi3XOuMmYRVhWmczZPTuTW9tfVw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] target/arm/translate-a64:Remove dead assignment
 in handle_scalar_simd_shli()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Pan Nengyuan <pannengyuan@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Aug 2020 at 12:26, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> target/arm/translate-a64.c:8635:14: warning: Value stored to 'tcg_rn' during its
>  initialization is never read
>     TCGv_i64 tcg_rn = new_tmp_a64(s);
>              ^~~~~~   ~~~~~~~~~~~~~~
> target/arm/translate-a64.c:8636:14: warning: Value stored to 'tcg_rd' during its
>  initialization is never read
>     TCGv_i64 tcg_rd = new_tmp_a64(s);
>              ^~~~~~   ~~~~~~~~~~~~~~
>
> There is a memory leak for the variable new_tmp_a64 "s".

There is not, because TCG temps allocated via new_tmp_a64()
are all freed via free_tmp_a64() at the end of disas_a64_insn().

> We should delete the assignment.

But yes, the assignments are unused and should be deleted.

If you fix the commit message, then
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

