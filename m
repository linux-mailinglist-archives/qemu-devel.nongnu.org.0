Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821763B666A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:07:40 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtnP-0002h0-Ih
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtl3-00089g-A1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:05:13 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtkv-0007SF-LW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:05:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hq39so30820543ejc.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5JyT37DkFCdbfdkkdHrFB9940SWCQDKLgA8lOQ7Vwo8=;
 b=AlIYGH4Xu6aclAvTA9d1mHFQ7aWV1c9Ryn9pLH5GPwhj64Id+rcAa/HFZexuAgZ4wB
 HoLmMniZsK8b8NOTvkxnDT1JrOS1PqZ4Bk+E37dC8Mh5M0v4/9L3fGuIg/5FDov2aT4N
 K3kVSO/amjaapMsPJQMAoEcg5aKZUOI9/J1Ufiz1Cp289lIAu5Hps9BQYfvugUbIPh2F
 PtGl8EGIL64bYx34c2yYCHccvEQ71+8iv0XAsiiIVplKsiPtKAPyt6PAppDnW7WhI1sT
 2qNk4fpwkqQljhOfCV231UfEnAFguWacKgTVW0btP9cczUVEpq737E/UTDgDuoM/xudr
 IWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5JyT37DkFCdbfdkkdHrFB9940SWCQDKLgA8lOQ7Vwo8=;
 b=De6vWuW+Hlx4T3zFrNpwCwJHj68x5Te21hKBk2CpUfUSZooMWfsPrambkS83ToovhM
 Fj1Tmi3bVVSE2O7NhI09Bo1OdkrG3U1GZ7Z+6g7R0PB6uoGY3MCjbhthRdwKpO1dVcsP
 wqnSINMttQXNShiB3mGMtLkiryhS4BCVUW1PgllrC+0JNHqtxAvV/FJtSrM5m2WZzELz
 XYZCESdtZ3uENCW91X/TZ7UuQPlEGrEejhqvQW+O1PBvrD6fqEVeBatPs59GOdHyrUzK
 EGfuytZwcWL3uwb6YWwTDhvMXh5HY1LXFMrfkuAR9ohssK0vw0sKjCxbciy1ZYXWiko2
 0RJA==
X-Gm-Message-State: AOAM5310TkWM7+yJZ9T3dm0CBkkpO9yBQuKhQUa/pqzP8SIcP1jHhc11
 VwSKGhj9ttAmvj75UkdtYedTbxpamnd/saLsZCi7Nw==
X-Google-Smtp-Source: ABdhPJwGJhkmyvKlEfdjV4GhDJ8TdhlMcgJbsfMVp5QCg7WEOoDO6p631CKt+vn10+U6mq57hud/+Rl/hL6vn+iN45I=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr24449898ejw.382.1624896303900; 
 Mon, 28 Jun 2021 09:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-5-peter.maydell@linaro.org>
 <5a8318b3-ee48-927d-4a41-06b78c77ee7f@linaro.org>
In-Reply-To: <5a8318b3-ee48-927d-4a41-06b78c77ee7f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 17:04:27 +0100
Message-ID: <CAFEAcA-4YtJnG-A=zY7gBOM78hfsTEDGBvPB+H4foA7ufvMJdA@mail.gmail.com>
Subject: Re: [PATCH 04/18] target/arm: Use asimd_imm_const for A64 decode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Mon, 28 Jun 2021 at 16:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/21 6:58 AM, Peter Maydell wrote:
> > The A64 AdvSIMD modified-immediate grouping uses almost the same
> > constant encoding that A32 Neon does; reuse asimd_imm_const() (to
> > which we add the AArch64-specific case for cmode 15 op 1) instead of
> > reimplementing it all.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/translate.h     |  3 +-
> >   target/arm/translate-a64.c | 86 ++++----------------------------------
> >   target/arm/translate.c     | 17 +++++++-
> >   3 files changed, 24 insertions(+), 82 deletions(-)
>
> I'm a little surprised that the fp16 case didn't move as well

fp16 is distinguished by an extra bit of decode that isn't
passed to asimd_imm_const(), so it really is A64-specific.
I could have added an extra parameter, but this seemed better,
since it matches the pseudocode (which also desn't pass that
extra decode bit to AdvSIMDExpandImm(), but treats FMOV vec,imm
halfprec as a completely separate decode).

-- PMM

