Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AFD539119
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:50:40 +0200 (CEST)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1KZ-00017k-Ou
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0xe-0007bp-E5
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:26:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0xa-00062Q-E0
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:26:56 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id w2so1905476ybi.7
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3e+9d2MCIQTZs1M/2K9HNztVuPFmPUmK97lntkgoC7M=;
 b=tM7qBmz8l7jqOJ4akSzB0NoBuYo2168JOsJyU/C0dLJFPxVJUIvSkK1l7NRwwmYGAZ
 aMQOKTBbFEDatcPmPX6SGAEAUJYMv4UBmNUPbRCiAMuBzkFYW06A31UUhHdB6aJ4qi+a
 QjuPxZHtXK9Sm1KFDdtsR65wtX89QJNl23p2AMLLbiaB2k3QG8JoNy7ctX9SvPIZ8RuP
 Kpk1MfxWJZAHJ2OnEMrnt+VDvfj1gnlT0uDsSymGsjcqlCCYkfqqBRsU3pnJrlvvgWCD
 YiICd/441rd8QxZb5j07mBBdROBpiQTReIg7fS/LEZhC6B4KGqW10RqQXC8opaJxI46G
 UebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3e+9d2MCIQTZs1M/2K9HNztVuPFmPUmK97lntkgoC7M=;
 b=vr9k9csRn2rHcB4IO1ew2VN12ddIDE5etAEBhQ/R1XRJulyFeAiwKLbzoFQLvdHjzz
 diGRGjwsiUL++qmy3o6y36hnMVYfUN8ewfMcN5C3amg1ujBti6rME5MvfWNXC6OXTS4J
 NAX3u04pcGd5slnUoyxi13ABhF+naj6/rIgAWRpG1bPOSkftjlzWzyEr3PxAknFdwi0P
 8jkQNsl1HyBqrOZIcKyHWeC1sJ+EwHtID/xhHwBYVr2VasFOKyRRDJ17lmF2fw5afmNC
 xnW+tUZrjTa9STP1E1LxpPKzTT8Vf/j6JJZ7KUpoS7s6GtoB6FUfpM41vyF3mzuNlbMN
 GfJg==
X-Gm-Message-State: AOAM532RWmdQBro5G9VhX+EcC27l5lUT8m7pDeMe8THhRzCYNOoGU4vf
 VtZDPYFEob79zMhIDGBmbCOENYsI4gVxcCUJiz1ciA==
X-Google-Smtp-Source: ABdhPJwJOH516OCfJT/lDDky8T+VMML5BgRTEy3pmjQOl88Q4CXKXuOvciNiRXDuDi1N9g1JQCaLj7jRcevkIhQJX30=
X-Received: by 2002:a25:ab2a:0:b0:65c:bdcf:44be with SMTP id
 u39-20020a25ab2a000000b0065cbdcf44bemr12062179ybi.85.1654000012910; Tue, 31
 May 2022 05:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-11-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:26:42 +0100
Message-ID: <CAFEAcA_B-6NCNPYbzLMZjxT8onqbxd-JC5f5R2a-DL=LJ=p5+A@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] target/arm: Split out load/store primitives to
 sve_ldst_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 May 2022 at 19:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Begin creation of sve_ldst_internal.h by moving the primitives
> that access host and tlb memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

