Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762C566EA8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:50:22 +0200 (CEST)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8i0S-0004oL-UE
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hyG-0003UF-88
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:48:06 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hyE-0003z9-K3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:48:03 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31c8a1e9e33so55264867b3.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1jdsHaorJ47REhue68WT3lR7jtxuvIdxETmaX7/WBI=;
 b=XsPhtamOcxpStr2A/iS+rBeB/TZoVStf6oec0mIrN/hoxJhZjlFAoyiRO66b3oECJ9
 ghkAKsIrXc3MrwG6FkmNPcx/I1N6qdLq8Tkql/2L46J8Aycq8veP0hCv5h8wnbIerxPw
 c/N9fEeyxXe2pgHDFmgitpnyEf/MbM2ak6Yg6JiizXBqQsTC8P55VjWzmo9ktraYgPm9
 xLfV6CCy0wkn6H4BM1M3tNq2ph9HTen8BD2S9O3R1hZAhqsTBcxcf9rm0bPkUm+KwbQB
 LRnDhG24OqHYEdLVYSTdsGJNOr5YTFI+fQK2pLjckCM7EX71q7aWR+8I/gDt7Lg2UJwZ
 d9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1jdsHaorJ47REhue68WT3lR7jtxuvIdxETmaX7/WBI=;
 b=tUzVbQqueNriivIy9VWJ66M5hkVq7NGuw9/756JwCbuL96M73PowdGxQwWeQ/4uMEM
 N6L1YwBnaA3mWxBeuoZ1qUXyKCMVbbvW2KiKV1+hyokXjHy0dawT4xfwFgHV8HmeEkaN
 PdQ+uRuvLnZM/d4ADkO81wofzLOysxv44gdAu8xpQDMTrMHd2kAC0jE6ozo8YDmFf4s4
 EPJEHET0tgwGUZdNP0ObVdS6VUVHOWn9LQVIQXJU9AeJ/2IjH01vbd71eeSTyPJKWlnu
 joDwVurYe+endIPj9pNkoBlgJH1RLrYT7AWhvHYgzV/pG9zSdVbms3zcr0F57ZQ+Mb7V
 4/8w==
X-Gm-Message-State: AJIora/hRE/6nAa52dJhf+z0M4KrrB82abTb4sAcXfn7FRoduFiNK9F8
 a4YG7dktyshikq82Y95hfYVMdiMLx8Ysr0YLEIMJNw==
X-Google-Smtp-Source: AGRyM1tsbt3qN/lPL1XIRo72njSwhLLrrQvhA4Ym5vf8fe0TaZnl+GwoWlLMAPf3LJ8ePgHhzuXlR5ji0qgBUsFXWGI=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr5967754ywp.347.1657025281257; Tue, 05
 Jul 2022 05:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-6-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 13:47:50 +0100
Message-ID: <CAFEAcA-N1odQdvRRjHP=BOG3Rr1WkfX8pDfEmfHDyrq7+9MOMA@mail.gmail.com>
Subject: Re: [PATCH 05/62] target/arm: Use PageEntryExtra for MTE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 3 Jul 2022 at 09:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Tagged pages are indicated by the page attributes, so we
> don't need to use a separate bit in MemTxAttrs.  Further,
> we store the PA, so we don't need to recover it by walking
> the tree of memory regions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Getting rid of the messing about with the iotlbentry and
the memory regions makes this PageEntryExtra work seem
worthwhile on its own, I think...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

