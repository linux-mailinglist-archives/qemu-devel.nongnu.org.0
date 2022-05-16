Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97F5287CB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:59:34 +0200 (CEST)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcC5-0005mp-Ce
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbz9-0004QN-Qw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:14 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:45755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbvy-0006sv-Uk
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:43:13 -0400
Received: by mail-yb1-xb36.google.com with SMTP id e78so6318431ybc.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0lVIDgDsfsGaU+tuFbnbTUj996rtMCuGMX29Zla0yE=;
 b=PQ8bOfTjNpHA7EDwsO/IJDstNRi9tcY423kHtyNwWma0V//FTxjnU3MXDYyqdkSzv5
 7mjkZCHuAsb+O+gI8+m6s3NwQJ+8QbVoe5XPfGBOwDMbqhrsxCkzn4kipgjphif6FIMu
 eubtLHCWAXUVyfFnbq2XzemYiyhHUmVNZgiDYDidZ6NmZ5SMXdXGemvlKya96XWsI7NC
 LIx4CNkAk369cPEEIUpMQ4MH53BGuSiqn4bdZh6xE9iB6MvJDGQ1Q94xubHtIaGDnIgD
 ASvqJE3kRokVi5kjVQUvJVTW/tgU5rF7BJr/8B5kFz6tQ/9Xt/maruoCv0+Ju7CjoymF
 jhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0lVIDgDsfsGaU+tuFbnbTUj996rtMCuGMX29Zla0yE=;
 b=3hxBsyI+g+kq+OUzKvqYzas7UegPc7yXE5ERyHq0VXX+Q9X52oQ9XSqx5D8a4L1lkB
 lJj2th5Mvvdf3EB05fzUjaMZl7JYzqK20TzYfb9NlQOZ26xqe1BDU8pH6u69VENhBT3Y
 /TnMAc0vTd+dFdv0GONpPmiC8mGTFnfmlDJEyQ8H/dWBSI519jek6X0Hi2N1CG9XQSr4
 t2IQK5pWp6VqoZ75kYhAXaVeE3+DdduCwdPONYz1lgkDP2gYxR4enTwfIy4RWQGkyKIF
 EUtL2uh/cK8a6oVONWEhZ4eM7oh3k8Pkrp14+OlJkPHdLWlSE2avXsstXdHagDfroWjd
 xpPg==
X-Gm-Message-State: AOAM533ckAooZMiZbpECqW1brGFrOapvFOnmU+PXNoyWCQQ2rts4ywye
 wEK1R7QjivNwUgoVa5lVdZjGzhAvoH64GFqzaVAtIw==
X-Google-Smtp-Source: ABdhPJwQw6XgEwqYvwwEviQF1lScCJp6l/UjMnbFpAnIvVIBhJEf5ycQC7sNdruTKq2ps4tFf4qmTv2t8KRVCyHTKnU=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr18158340ybq.67.1652712148166; Mon, 16
 May 2022 07:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-3-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:42:17 +0100
Message-ID: <CAFEAcA9YSzKzDqZ3eC7DFOsj0DyZTao1qK2kA3nMya-Ne5jtbA@mail.gmail.com>
Subject: Re: [PATCH v2 02/74] semihosting: Return failure from
 softmmu-uaccess.h functions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, 3 May 2022 at 20:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were reporting unconditional success for these functions;
> pass on any failure from cpu_memory_rw_debug.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

