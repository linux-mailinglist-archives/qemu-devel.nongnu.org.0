Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9BC6F80E4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:38:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pusom-0004q5-Go; Fri, 05 May 2023 06:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusok-0004oK-58
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:37:38 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusoh-0004uk-IN
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:37:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so2504969a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 03:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283054; x=1685875054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
 b=CnicNmACePipY/HbiiDXqJ8853Y5kSFJHKLX4nKx1qOAJOqFqg/lnT/seHgegVy1e5
 K12LgtMNLz0TVxtvBKOzPhEMesZ4I+O7/2x0fshrVcBBgTKuW+7QsKsEEcHEohpbao/3
 pA7a+2iBWNirE8rIhTDO6qJo6PgPjbKxbJCchEU4fyoxZh43pwXnJjjZ1dGfB6Z9ifHu
 oetUgFhCtYBg5Zv4yfCfJPzA4AKxbIjg7uK45LuR9uHrJyJs6jCN6HLJXqSj3hG4o/VP
 RTJE+xgeKjLPmdfUO4V8grddcg0fxGOYW7b3kstIwIO1TeJEbpyPXJRxNliAzjQaK64r
 5v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283054; x=1685875054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
 b=QYf8cEY9MuAQ5CdjiO51P5UFxQIEQ3xe0ssH2EQja4GLKRRmejGLpUM/n+1OIHfzHq
 eYBvJVqCWONQK/6yZN5Db5ihRSo3jLqRLTetD4IVXg6R4wgbkLTXYr/sUQHQvq5LIQzc
 nE3oQP2IJgE+wrNGAXsZuOSlvqERs3CMGww0dhWUl3EnIfACrFv4y+FY4DwNiIBeIltK
 HK4+b2LCdWrbTjqwJk5lImuMyBwdzJ48ISuf3JCM2nThl1eQH0uOt3KJj7U0YCo8Sjib
 eN2zeLlUnPu0Zd7+P8sP7Tx7nQhq+qGevCo4ikQEe8Aem/Zoe/6WDywfvKoQS0bKWNAc
 ltgw==
X-Gm-Message-State: AC+VfDyC40dgL1kMtDh8c7AHp32UEVa95dCrLofA3j/wUhvJKBNPDZqC
 5YRh9BFWsGvqsu3BA5x47V+uUpTW4FuXIaIBCVp+iA==
X-Google-Smtp-Source: ACHHUZ6XeKuoAmKBc+GF31yiQuuv1+CjRQuFSk6tIw3yJsHjUJ7d6oxI9P/tNiKi3y4FGYfAcsaosqGmzwkXLBjvO3Y=
X-Received: by 2002:aa7:dbc8:0:b0:50b:d305:3788 with SMTP id
 v8-20020aa7dbc8000000b0050bd3053788mr798666edt.11.1683283053934; Fri, 05 May
 2023 03:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-16-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:37:23 +0100
Message-ID: <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
Subject: Re: [PATCH v4 15/57] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hosts using Intel and AMD AVX cpus are quite common.
> Add fast paths through ldst_atomicity using this.
>
> Only enable with CONFIG_INT128; some older clang versions do not
> support __int128_t, and the inline assembly won't work on structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 16 deletions(-)

Inline x86 asm in a bit of generic code seems rather awkward.
Ideally the compiler should be doing this for us; failing
that can we at least abstract out the operations to a
set of functions that we can provide (or not provide)
implementations of?

-- PMM

