Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374003648C1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:08:52 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXOF-00087G-99
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXLB-0004Wp-EW
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXL7-0004jb-En
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h8so1474533edb.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htfy3zuaRIRYvd+1WLz7TqkKq5Lj15GMTXVKjcjCNiA=;
 b=nzHVY81Sre870loX7bjTx+CPfQmog/WzVgAoGRGgNAILXA2DOfcWIPSLQxA++2uldP
 8Y1UtZX1g81g7OMF7Jj1ivnTeobELnZtQOtIQ+odH6k6mfbibfeVw/H+OxYf7GuDXgwv
 Mt5XKBhiNo+CZQNQ9T0joqozKeEIQj1W/mQchm1D852WzmEf8lLfDPjkVBh3ZHbB3zTO
 mjj8pfJv78DSQtXF2y6ublJDQuUw2P+vS0zuhML1EmuWo7qVisylbaM0/8j3isuLH7re
 RPbVx424rVGk+aYkVaySmBwpfUOoceT87cVZ8VBCzceGlqEKYwi0rnaQ1LAk/RtkQYxp
 CC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htfy3zuaRIRYvd+1WLz7TqkKq5Lj15GMTXVKjcjCNiA=;
 b=LgijpNxjHusEUGiibeEhf37UFBDsdXwTBKI9wh4ziV7W3qsyzEM42z7TcQl1Lx0Fjv
 JU8nOojGr5hAGPuyyCBsLksSJBgyUVzH1leP8a41nLApqWT8OKU3NBdcdD91xe+f4jqt
 frF+tvj4OdI6H0x8X2yC49Nk1bC/BJcf78Gbp8P/Tq/Q/++bz6mO1ihunxL/3vwi+O7G
 YjXPY9mIlo6nXjVgEXGTp9bbphJZwIrN9eDbZ+cqQswVZAHZnhCJZvnfi8iE5DjE0OCm
 WjOh5rvKKNB80KFeJVmgCLLjBZPgSEJjzscEf1B1K7qDOBZGx+tlngubwqvEFGsjHyKL
 aL7Q==
X-Gm-Message-State: AOAM530d2JJbxWPShWCiwkFRrttSaYxn8MNId1Ez9o0OwNl1jh+AR8kt
 NMDogaZIToW/EzBb0VqNNrJZPY8QgSvKTVICBoCnfg==
X-Google-Smtp-Source: ABdhPJxPV5WW1TDB7DS06xT4M0DFeblWPcRFomSghsKFKsZlexkkHApERzem0Uq29g0d74T/1I9Lfq0oLVyHjLUHzNI=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr26421771edu.100.1618851933835; 
 Mon, 19 Apr 2021 10:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-5-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:04:42 +0100
Message-ID: <CAFEAcA9hGnqB2Ztsk=kUQ5djZONRO541+XvnmUCK8FA+BCCVng@mail.gmail.com>
Subject: Re: [PATCH v4 04/30] target/arm: Add wrapper macros for accessing
 tbflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Fri, 16 Apr 2021 at 20:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're about to split tbflags into two parts.  These macros
> will ensure that the correct part is used with the correct
> set of bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 22 +++++++++-
>  target/arm/helper-a64.c    |  2 +-
>  target/arm/helper.c        | 85 +++++++++++++++++---------------------
>  target/arm/translate-a64.c | 36 ++++++++--------
>  target/arm/translate.c     | 48 ++++++++++-----------
>  5 files changed, 101 insertions(+), 92 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

