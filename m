Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05D2D9FB5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:57:51 +0100 (CET)
Received: from localhost ([::1]:58180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kot2c-0000jv-Iy
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kosts-0008Uz-VZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:48:57 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kostS-0000kA-71
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:48:48 -0500
Received: by mail-ej1-x643.google.com with SMTP id q22so6239294eja.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKewVq2z6cYEdM5vsq2vw8MjBg+S+NLgK8tAXlrRO6M=;
 b=A/em8j4XwleA0HjWaMGrQG2rQ4c2f00rygbi64Qezs23MJUP9VHxwrtGpPCfQh4NaJ
 ivy2Q0cvmmj1l45ZT+73aDetJrFrugcRMEqF5HMVVIQAFwlh2qpslsJ18mSC1f+r29Fe
 iXWNDwW1o6bfUMSDO/GOTQUWlzUlLnBNjAbNJFnK46WKyjPH0iDDAgl+hT2T0gSA1Moy
 F2C+Mh4sm44Rat2ik3HO7KW0Gk/z4mrDHFcANWc7uTxw2X1EjDcbySB8o9VvGJ6R0V5y
 WrhD0HQtZOcyhNo0TLvVysQvKWEmjb71jZyF+TFUpiRPYKpGmnYiwIDWb9mAc/hFvqJY
 HzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKewVq2z6cYEdM5vsq2vw8MjBg+S+NLgK8tAXlrRO6M=;
 b=izyoI8EyfGDwjQLllacJbcTmn71/L2x9+rklM52NJW7R32BAxxQ2PWBdUd8k2pfG/u
 AccOlNgBNh1eSE+Lo/7s7ByNt66G6r/KFqrgsl/y9DxIkACe/HmGxNtpzhjuSZe7W0xT
 oPHg3jFs6BqNXtEucqtM0fHfXdUEqR6u1ynVHZJZMY70eBbWq+sUblGQOoL+Gapwn7lZ
 l1JPt75r8v5VGfByUnNxX7ZkFBO0XBOqhlmDX141881OIYVNeCTUsi7GEHvYJXJGrDk0
 QrgQSzxcRwjr8RYbCTySbsAi+Fm3R9qVnVoi6MhO3WZaF1wm1ou30i5pWhZqmisgG7YW
 Onww==
X-Gm-Message-State: AOAM530zzkefWxhHxOsrK8iPhbgYGw59s7kudwq+t5BQQ/PLbtK05u4h
 tIa6tLXD9DJb8a/fwUvEPLT0IIb93Sk8iQAIW9sdUg==
X-Google-Smtp-Source: ABdhPJyno3h5Vj+qY19jujal6nYlM6krOePP8Ti0zgNIhNZbCJCzRTjjMqVnyo3fx9ylvBl2ABzGI9aIuMFAtvQrKxc=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr23624480ejf.407.1607971699565; 
 Mon, 14 Dec 2020 10:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-2-rebecca@nuviainc.com>
 <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
 <284b9f4e-55b7-81a3-f1c5-7f7b6d0c9784@nuviainc.com>
 <46d7b991-d305-bd2f-91f9-cdc2ee1e73ce@linaro.org>
 <CAFEAcA9NOez16SaKsegpURPtMJDByYQ2MaeUKjQAiKhm=O-7LA@mail.gmail.com>
 <8aacc648-c550-c5a9-eed1-5031cb95a5fd@nuviainc.com>
In-Reply-To: <8aacc648-c550-c5a9-eed1-5031cb95a5fd@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 18:48:08 +0000
Message-ID: <CAFEAcA8=Y=JsFLop6FJ2yhExrXMk_TQ+_a8wiH9jUD=HiHW6xA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 18:11, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> On 12/11/20 2:37 PM, Peter Maydell wrote:
> > On Fri, 11 Dec 2020 at 19:51, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> I'll let Peter weigh in, but I think it makes sense to move the SS bit
> >> somewhere else (e.g. env->pstate) and merge it into SPSR_ELx upon interrupt.
> >> While what we're doing here is convenient, it's not architectural, and it would
> >> be better to follow GetPSRFromPSTATE pseudocode.
> >
> > Yes, I think that's the best thing to do. We've been skating
> > by on CPSR and SPSR being the same thing and it's just
> > stopped working.
>
> Would you like me to work on this, or is it something the arm
> maintainers would fix?

You're the person that wants to add the change that
requires this refactoring, so if you could, I think the
best thing would be for you to do this bit of work
and send it as part of this patchseries.

thanks
-- PMM

