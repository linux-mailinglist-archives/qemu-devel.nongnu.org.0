Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D944568EDE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:18:40 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o97jb-0007dL-0X
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97gT-0005RA-Mv
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:15:26 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97gR-0001UQ-F4
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:15:25 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id b85so14876492yba.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QiRp8xYTq1uMWZ3QebVTEqDd0ExmJAt2sYepQc/mh8=;
 b=jLMGmAht4ZUhHv4vbDTeiqgoDHWw2+xgQW08iBArgg4N1teGx+k/2jZCmabEEzBtiC
 BKoesisF7Hm4NGPMewJdqdTqoE1OpWbt0ccXwunUpkXCpGMQLeoYKLKRUVmy4UYHBa5i
 ChpkL5Cv2pkASVCVzbdAY49LashhshVVD8weP1K/q1RDxsH0zjXj7MjTx+D2xxUO9ptc
 Lsf89wNdT184X2U6NaxUr6R/BUQH9r4usdKZFg6ARwhvD4Fvr0wh45IIrUuW8Nj+aUFG
 mPhXsKrBRLdzQ9zgHqDALmJ43t5rJhY/zYdfihLtdhQq8qHsgGhM7iFjLxuzsSgNkoKh
 46wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QiRp8xYTq1uMWZ3QebVTEqDd0ExmJAt2sYepQc/mh8=;
 b=jX4afI/v+QK5yx1FBcAlnKlvyFGUXcRJCsu7S8NLFouhBiSEd7LdXuHVdADL7tHDhj
 Iczz5jnIs3DMSTTrxtlm1Ns2oqrsEESR0tyq0MW/GDo5KCt03XTH6v+UGO4O9E4yhIbW
 nHlSy0Iw9I36rgXLXYs3ebpFlT8GU5opi2XG7E9mOAV68j7kjw3i6F88UoE/ArUVGBDh
 vR6J4IxU32gTXyY2yEY+x5qH8SMJ7bw3GTyKhCXMpwh5+Q9LlgOz2QZXAezffxCEvaIB
 AETMuQFUmuLcRN4M6m4LxoeA1zh1G2ETYo4FboHdq72BacECtBPAfyT1WPi1BQKEmnPh
 DgNw==
X-Gm-Message-State: AJIora9eWLA7CIK35Lwx7CRZeGfrnm0h+TvOlUqpJrXJl9GLHYvQJRWV
 qAZ9RNsqVdbCMlap13UP7ymAMOtOAO1DnOiUMQKCgQ==
X-Google-Smtp-Source: AGRyM1sgFIAhVvsdDzTmEw/sp/MTQb8Lg0ab6MdUk5CVdfpGjw387CqDo3XV0hHW1hwdaRPzBiuW1pJSigQK2phgSx0=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr17958580ybb.85.1657124118497; Wed, 06
 Jul 2022 09:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-4-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:14:40 +0100
Message-ID: <CAFEAcA-i9dTtizSOEt5r3G-Mggu6YqYHsXCz=y+Ki1=kkWRNVg@mail.gmail.com>
Subject: Re: [PATCH v5 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Wed, 6 Jul 2022 at 09:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This new behaviour is in the ARM pseudocode function
> AArch64.CheckFPAdvSIMDEnabled, which applies to AArch32
> via AArch32.CheckAdvSIMDOrFPEnabled when the EL to which
> the trap would be delivered is in AArch64 mode.
>
> Given that ARMv9 drops support for AArch32 outside EL0, the trap EL
> detection ought to be trivially true, but the pseudocode still contains
> a number of conditions, and QEMU has not yet committed to dropping A32
> support for EL[12] when v9 features are present.
>
> Since the computation of SME_TRAP_NONSTREAMING is necessarily different
> for the two modes, we might as well preserve bits within TBFLAG_ANY and
> allocate separate bits within TBFLAG_A32 and TBFLAG_A64 instead.
>
> Note that DDI0616A.a has typos for bits [22:21] of LD1RO in the table
> of instructions illegal in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

