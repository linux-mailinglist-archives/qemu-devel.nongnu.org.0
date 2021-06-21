Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CF3AEA91
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:55:40 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKOp-0004Bz-P4
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKNH-0003RA-Uf
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:54:04 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKNF-0002JJ-5a
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:54:03 -0400
Received: by mail-ed1-x536.google.com with SMTP id h2so5555952edt.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tCcEWcFp+23c8rasnS4x4M9qrZZLeUWhetNTyg/Wc2s=;
 b=b89MfyYW0e3R54ezQLZRHVNDpurZj943sa3L6Q6mKY1OBFznc+xumUWWB9impyFsFv
 ZgNYPrubmsfAGwJqp3bUbyl03gZTbTgesKZIwjVymC7WqmJL5kpLDlhsVXyqHaQspVEG
 DbdYYRz748oC4OitHOv5u/KViU3A0gSqdrtXr8U/bHrU33qDfoCkDSaxBlJHWfFEiNOd
 7dbhKDdNehdMQzPfsy/NRLdDy/R7Z1CTjIuB+l2jrZO1Fj0JA0nAEhTeDVN0vlDAksBO
 +akOx4ZNJolR5dkpuXPqI0tQzf4SuVeGkuxN3zQr//d2c6gTAIciyk5yFE6TDzq/NCVw
 oVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCcEWcFp+23c8rasnS4x4M9qrZZLeUWhetNTyg/Wc2s=;
 b=WN4Rgo7zS9IO8R+tj6gw6xNY08tJVyWJVv5tiGchu3jY67dJYX9jrh1xBX9QA7xlgi
 BMN72dp3CH7iDrigZMt+jFPiMjV1qKKtEvpwaUH58eXwQLT/5OhB/M9T9rYA43WdMiJ7
 tKl9m+fBypiLa8sB0IEduyg63tswv+7mxsiNoUzv4aZPFADP5pwwhKLlFq2Lnvd/4b2E
 Fn+Wb4qidXY0rKvKg19yn5M270izh/gBKbcBWIf58jsK0HaUZGOirJwOm+Te/9NkbvTj
 LYRJ36q+0+W4eyIH4Z6PNd1NxQNS50KkyLhSTdJy+fTz1YxpXPbcpRU5WyG6eburbo+j
 zwfg==
X-Gm-Message-State: AOAM531MJhEw4hfzeUJpr6Ex+NuGJgtb19o0/Fj7uFjIzTXIQdjJchnY
 5NCGtK2k/XwYVLkM8qhKOQJFUYHIyUqclz/2Yl+C9ve2xrDMAA==
X-Google-Smtp-Source: ABdhPJw5CUTXHXM7tAJH0KOqqvhgZkJuYuCJXTnBjbuMBvFaIS71OH/Y5HmOl7749TNUgLsozqUhJw8K4wMmrMPq1kU=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr20486845eds.36.1624283639823; 
 Mon, 21 Jun 2021 06:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-3-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:53:24 +0100
Message-ID: <CAFEAcA9GTFetvHwawjvkBfUM=aPgEX9zcLPRw3ZEzt-WO_A6yA@mail.gmail.com>
Subject: Re: [PATCH 02/28] tcg/i386: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Mon, 14 Jun 2021 at 09:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Retain the current rorw bswap16 expansion for the zero-in/zero-out case.
> Otherwise, perform a wider bswap plus a right-shift or extend.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

