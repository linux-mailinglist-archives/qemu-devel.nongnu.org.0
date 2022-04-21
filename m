Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8A50A8B5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:03:33 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhc5T-0008I2-9B
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc34-0004i2-9q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:01:02 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:40668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc32-0000o3-Pq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:01:02 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i20so10394434ybj.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FroPWwbdNOP5GHiBQnbt1mH9wjnFtz+feBPL5PkEdbA=;
 b=Jsn8NNWroWcaKzMVx9E4BNSorsxMw999UyNABMu97YSlKZyrefgNW9FwSlN1rANe2C
 k4OiTV5skGS+//mW3mLCxy6dcGMrgzSm++Erb8coi5K+VZ7eGDGkDADeyNqapdjF5UsB
 57DXrqA8Nh4OY7tPveuli4Cso67rH2aEfw9HqeE/U+6AMYR1FFi+vx6FUCzdzJmrNt7y
 KJj4uJZGSFFkJ6oyTH0hYhxukQHmM/Ui5Ns2Vlijz02pr0EihEsI35nZ2BwE/lkFR5lY
 kr/lrjH7VwUPSZFv5YLTLAjyogghUhF0LjoxxRqeeX3Y1+YjPB9x3XMTrpg4lduoLHW+
 x5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FroPWwbdNOP5GHiBQnbt1mH9wjnFtz+feBPL5PkEdbA=;
 b=2ZJxegx5A7C0+1yqEB6iMhE7I8Dq1eukGtmB1PQG4eh2/u3+Mb9rtGN+nYFTy5n1c5
 sIdESNFV3kZOCf/ala4tO97TUluMuIXSxarsA0HxyubCBYLMAKPDDZPypbwO9mfLipJE
 l2Nsv10yjKtaI24k2l5FqNZAcALokddJ1hqT96iMZ63tWUk0ojfb2VUYsuc7HE7Zlb1S
 TUKJ2fh/Q9912VO4lURSbImEohd8XBNHju2OpgpwWbiKX7g6SF78YxNjbDVgseQ5m4QU
 8kkmYzRFWp6EI200MftKU4mpAkV9p0YVswps/80riK0v4PYs9MmkqH1i3jhHGYXX7FHU
 Txow==
X-Gm-Message-State: AOAM532zQFaGDXypvoaoKbYWLGYeVQaT7wBfosS+aF1lV0lHufyQ2iXt
 oEJ40MqGToaDLX156z3pLXW8T+ROyBhCaIa1/ATQqQ==
X-Google-Smtp-Source: ABdhPJzLS77W3rrtMYvk2LjJqDCkvQbDz9jeS1yk6GJa3PInoA9UouDyr9C9Cxvxnox+Rqxi7Zs3yBrCvZz+8hYLEq8=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1133289ybi.479.1650567659580; Thu, 21
 Apr 2022 12:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-18-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:00:48 +0100
Message-ID: <CAFEAcA8M2RqQZ-b5xC7tQu19rDzr9FH1xuC5fB3udg40-YdOWQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/60] target/arm: Use tcg_constant in translate.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Sun, 17 Apr 2022 at 19:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64,ptr} as appropriate throughout, which
> means we get to remove lots of tcg_temp_free_*.  Drop variables
> in many cases, passing the constant directly to another function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 250 ++++++++++++++---------------------------
>  1 file changed, 84 insertions(+), 166 deletions(-)

Again, break this one up a little bit, please.

thanks
-- PMM

