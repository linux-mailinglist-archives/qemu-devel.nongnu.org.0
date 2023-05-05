Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804926F829F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:08:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuDk-0001NL-DT; Fri, 05 May 2023 08:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDa-0001Ju-I7
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:24 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDV-0003oA-Ld
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:20 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so3251555a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288436; x=1685880436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
 b=rQvMIOcFBrOBuJx6oP+SZJaCsQyggA25KsA0qCqPq5AP5CnZoiiE/zbgvm1WYrtl56
 oQQvVp2TLFIsU0rH6Knd23hDc9+PNWwH8GX4kqAuqUeKW6F+FcMLF8AQFiYDo/Kj/vkC
 h2zoz/xnKDAFJZCRubUnEs5cyyZSRgcYcNfgZjJzR1y5btwyU93YFw1tUxvHUavwvNqW
 EZjEwWjqSDbbdmLGRw1iuFVCMyqYf9Vj89KkMJWtJN7QldR7VwLlAbLCIkYnb5ZXqLj+
 kl8xKkipSUA/v9xoPUR9UnZJKn52kWdjc1JtciiVa6L+3J74RQxJc4n5ALtBbR6iZWtz
 wyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288436; x=1685880436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
 b=hEKtKXmk+V5AbOrJruATw7jcvzs2LGTXSba4mRAFZdpseR6hKlWAbTY1JbDOezmRem
 QtqzQaVI5d3N1L4y6bGjQF/ApoJBWnDGHgrlP//OnJuVjbY3P9b+dGYPpE5QoFBNyl4g
 z2soWTFeNN1bPcSEszPwS413YfWxvix3l12qQoCc0QuN8Tm3Y7AhT8eX4L+y0i5k8+Cr
 kpEB9CMFb/joBq7ZmYFWCR5H4zhP8x6scdp7gjQSBX+4Rts0bcqaYMYZMSAhttDhccZL
 yznJxcra1E39U8vbKWzjv7Jy6B35B11H2/FaUrB0ai9njAiQwa0Swlb7jVrq+W951hk3
 qv/w==
X-Gm-Message-State: AC+VfDx0m1o2Kq9NoWfO148cuWjt4v1BsGsRg8wRRxRiye3lhq/Rm3eU
 OZUYW7A16eu5osL+NgGYNXA+uvyMwbfxBdOE3r0WYA==
X-Google-Smtp-Source: ACHHUZ6leE8ngd6GVRvFkRnZSmMHSoCWsUrMHMu8nLDcIipkZN7Hg6f7QvPmLk09KbbN8CaL9m8QtgbcVqtl6kDVKXQ=
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id
 h25-20020a50ed99000000b0050bd30cc595mr1213814edr.7.1683288436152; Fri, 05 May
 2023 05:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-24-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:04 +0100
Message-ID: <CAFEAcA-Dnct2C_DnYDOT6mTAYXpnY=jN99SWZvMTc3+_0iNDuA@mail.gmail.com>
Subject: Re: [PATCH v4 23/57] tcg/ppc: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
>  1 file changed, 44 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

