Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F173C5B95
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:55:13 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uWm-00009T-5y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2uVU-0007q7-0v
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 07:53:52 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2uVR-0005d8-L0
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 07:53:51 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ec55so2711897edb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CP9eI6IIr0ExUcroFz+ZiH6cwl8Lq3A/BRDrSSdVGqo=;
 b=cQS8Ty6l+Dw8M4W3EJ1IBYu4b6NXSOjfWRVzytRXiBsi+ylEw2ScFH+WeZitGEl//L
 nUKgeVSbcBpQkGYyzp/YSkgXFp99p9LRARYd9hZQYDtmNSBCRWzAyDK106iTy8KbTKqS
 +720mTFxKMHfNuuTqdKbT+3EvFwKqtsvk8uLYNu8MD90YQplrF3KP4tf/sHpPoInpKvR
 VuwQIsKygK11Ea8qCuTT+WT/C9fuiFpw7B8SHOAzU8mTi0NCBoozIUPucBRUSVJ5RGfw
 g2oA1P6CBra1nvYMRn2NdVb4F+nqDoAMfPFF44GPk6aGQkMxgIKdLuD3Y1HvHo24koGn
 V5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CP9eI6IIr0ExUcroFz+ZiH6cwl8Lq3A/BRDrSSdVGqo=;
 b=BiENSM4G4rF3AyKNnTAD/Rmr2mXTT1Ez66CeW4fJP5smSDZNz1iZkcqaTwDdK0+qYU
 ip0af4i3M5wdxFTT7ZfBIUw8RTn0AfBBVgy8vHby2o2acN74GEsJdT4noyQoK7A7DYTV
 jv78YklPFgcnc/UQPMA31ed8UZY7AHSbu9Q4qFN92WW7bbhAc5Dju2gHvelNSyzbQoqK
 qwO7L9obuNvIPt94nFDePdUZm+poKnSlYWilr7Htu5EgQouDv6G1QDcaPbkP4N/j8pPS
 lBhNNpLS1+k5/UH5B8fIYM71C76Dnchy9kBrax4Qchj425Qi6EfobOz95dWsFZkRbjYB
 +ffQ==
X-Gm-Message-State: AOAM530Wc8e8XX9NT80QIsV4euGwwgZGogCHIlQwmgfU4zEhcL/GmjmE
 P1nb5FUAnhdxEOnasdPoFGou11mTZfWDJ8gUQ0H4uA==
X-Google-Smtp-Source: ABdhPJxBBqyM2oKc47BTKjkFCLPticuxqbIGpe9vZ6bfc0nPRSkqYDSx+2SvpU4dbofiiisSc0zKQHEN3VNmCfmF0S8=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr32855294edp.251.1626090828238; 
 Mon, 12 Jul 2021 04:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 12:53:09 +0100
Message-ID: <CAFEAcA9Nx=TrQ_OZyxiNe161rhDa5HK0K-Dy3cq4MmtdbD-t5w@mail.gmail.com>
Subject: Re: [PATCH 00/41] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Sat, 10 Jul 2021 at 16:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210710
>
> for you to fetch changes up to ad1a706f386c2281adb0b09257d892735e405834:
>
>   cpu: Add breakpoint tracepoints (2021-07-09 21:31:11 -0700)
>
> ----------------------------------------------------------------
> Add translator_use_goto_tb.
> Cleanups in prep of breakpoint fixes.
> Misc fixes.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

