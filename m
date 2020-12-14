Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368852DA1EC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:48:41 +0100 (CET)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouls-00031f-9S
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koudb-00021W-Hm
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:40:08 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koudY-0000CU-OQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:40:07 -0500
Received: by mail-ej1-x642.google.com with SMTP id q22so6712678eja.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgGnG5QZgY6wRzYKE+QbuDhlKfmXvkScK7HY1YMszH0=;
 b=eXeEJe9lYszI0FNOhyFXzhIG1+xj/FR/dAPoa1eTT5RTyLVwADBqfHZulkhxfD+AQg
 zbXI6VIvYytmyWEgOXLZvGFAmp09hJrMIBNpR+pw6YhEKyaVv8zlc5H6ojggSUZvhpvG
 Um+wAtMkZhTbtpzWjU89jC50gZFmEmI94hykUU5hDcizvbqXnw7u8ICLwPoH0vmuo9hC
 dwyFi09tKqeS+Kq15H7G6zXT5v04eQWK+3/3T/IUJsun4ZXpoquOwcbLtQ/DLo7BrBbW
 UvcfpplBuXXAd9DTMjmCyg23MK+XLAROx3Fsr8XsTkFAvaYXlTNOYj77jER8LXr9I7x6
 /cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgGnG5QZgY6wRzYKE+QbuDhlKfmXvkScK7HY1YMszH0=;
 b=sytX+2JvF4uKHWjYWQhBfffV1B20ZCIfQabscEwGhFPnq+Dx3l3nPtV9PFhsvgZb9S
 JommxO1UetWfR3Ndy/KOrr7YCq3VVQcifLwoZa0gw1miQikBSCxS7rJYnCvLh0uMAFmF
 rKphfR/fBbb2nuPLotuu2tOExxqV9Lc7cMLyHo7MzoY9QwZohmlEWARBat83jMG6VsKk
 4K+FtJeD+pUKOd7fT8rpMEaf/1XUoVuHhkgUmhdhsVMK/UqsMKwaA7kaXRBZJa1LFLiW
 MgWMy/kRTaN/BjfAU7KkkLB5742n7yccsApudmJoSu/p5qwW3FWRt3NCNQiPJTouon+i
 hu6g==
X-Gm-Message-State: AOAM532VElkKIAAvA5KaCDJAsLnnPxBhWcmeKMEbkRyuNiHGXh+Etnh7
 bU1ULYf9q4OGyW+XLVAPNctKB75Nx72c+dqybc4FWA==
X-Google-Smtp-Source: ABdhPJxaWYg1S/dzuNQedi0rvi0sc/eCrSnWf2kGV7FydE/UFwf98G2nQYAOFyK86yTjN8OKcY3wWtXKZEB/L2Z6h+0=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr23594930ejd.382.1607978403229; 
 Mon, 14 Dec 2020 12:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20201214202329.26765-1-rebecca@nuviainc.com>
 <20201214202329.26765-2-rebecca@nuviainc.com>
In-Reply-To: <20201214202329.26765-2-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 20:39:52 +0000
Message-ID: <CAFEAcA9M7ZC+9LMdqPLJwBgNgE3NCFwWB5awVo+TYG4WCZswrw@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: add FEAT_TLBIOS support
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 20:23, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> ARMv8.4 adds the mandatory FEAT_TLBIOS, which provides instructions
> for TLB invalidation of entries in the Outer Shareable domain.
>
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/helper.c | 30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7b8bcd69030f..28556eb48b44 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4870,6 +4870,10 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
>        .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
>        .writefn = tlbi_aa64_vmalle1is_write },
> +    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
> +      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_vmalle1is_write },

I think you need to arrange for these new TLBI operations
to only be registered when the CPU has the FEAT_TLBIOS.
Otherwise they won't UNDEF on older CPUs as they ought to.

That means they go in their own reginfo[] (you might need more
than one, haven't checked) that gets used only if a cpu_isar_feature
check passes; compare handling of eg the PAUTH regs:
    if (cpu_isar_feature(aa64_pauth, cpu)) {
        define_arm_cp_regs(cpu, pauth_reginfo);
    }

thanks
-- PMM

