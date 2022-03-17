Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4BA4DCA05
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:32:41 +0100 (CET)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs7E-0007Um-9z
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:32:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUs3Y-0002ya-Qm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:28:52 -0400
Received: from [2607:f8b0:4864:20::112a] (port=37534
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUs3T-000317-VY
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:28:52 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e5757b57caso62279997b3.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/v0wH19vZ5fdeQhFTGDYVBKTxOOOEQamwis02R3zks=;
 b=xea4gDhgEIrGwRaBNAIV59LCMG/e9lwRlhhSPUDnIzvj0pVHjEWAZJii2H5Hz/KjN0
 et66hZChiDcsZV8bYak2n6KMuDonoV/Que1JLk3CBHgeKZiK7T/tOJhfJhsxXnpzB8zJ
 YVhTKRPJgVBL9OkLHOmq40bTpZLr/lbKRVlIF/rTCl4o1xVSZU/FfEMWGMim/PfUI3lX
 iSnOgQInGQWKOkeQP3713jWOVOhOYcY1aeOJN+EPeMEX/2xACSQpV0PgpTFIeKhIcD1Y
 CWy7CjfH6agNjUvx0LMQImbpZ4mSc/HDqFvxwP4LVB92YTX7suRel84qeSGoNYYaRLMT
 ynnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/v0wH19vZ5fdeQhFTGDYVBKTxOOOEQamwis02R3zks=;
 b=IagWOgbHBbHuwwPxmB1cTDRdn8WIQ3oDvwTLh0YSICztW8GXOqqy8bv52yQK7xHhar
 Pm0OYFthXTKc0V0uvyDy/LX3jKEdf9rE/v7M1pIjP4NUbDZWWaL2C89DFscLP8/e55en
 6BfRL0ZZ0aZEhj84t4ruVT6MLOB95cwWHxkixDPCnJjxU+pWudqzPYTQcm1MWruHmhf0
 I0J1oT4vX57nAtlN7Q4kLNy9+hqjcWzVsQq7Ae2bRJkbyC++BGXkpE2LRh5L0qXc8muO
 O5kzaz51bpkZO0qncZ5GNzwe6cNyG9g29A8d7FaNPlyKoonMG+nBX3GadsL4X+CUtSXo
 iMVA==
X-Gm-Message-State: AOAM531Sx2L/tvTrdK21T2lJvRDSZEmvRjv9nRh8AKRIWtMbVxcbg0d/
 fAIPdLLOjaFQDpQJL0vGSP0gMXG5PHs0JMjsRSlXoYHcu1jfTg==
X-Google-Smtp-Source: ABdhPJzx4WtFFcDRCi5cRWDgvMKC/AggrNmD8rNApil4UfvYmXc2Sc86MeEll7lD+yw/5oLJ+nK3eE7Z0QUdwv9QKzY=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr6276027ywf.347.1647530926845; Thu, 17
 Mar 2022 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-25-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:28:35 +0000
Message-ID: <CAFEAcA_q3hPzRst2-FgL_W+06253P2uKjnoNQUfd3jhO+x-Maw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 24/51] target/nios2: Cleanup set of
 CR_EXCEPTION for do_interrupt
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The register is entirely read-only for software, and we do not
> implement ECC, so we need not deposit the cause into an existing
> value; just create a new value from scratch.
>
> Furthermore, exception.CAUSE is not written for break exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/helper.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/nios2/helper.c b/target/nios2/helper.c
> index 0392c0ea84..afbafd1fdc 100644
> --- a/target/nios2/helper.c
> +++ b/target/nios2/helper.c
> @@ -74,9 +74,10 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
>      new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
>
>      env->ctrl[CR_STATUS] = new_status;
> -    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
> -                                         CR_EXCEPTION, CAUSE,
> -                                         cs->exception_index);
> +    if (!is_break) {
> +        env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE,
> +                                             cs->exception_index);
> +    }
>      env->pc = exception_addr;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

