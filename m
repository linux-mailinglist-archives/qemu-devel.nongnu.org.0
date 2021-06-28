Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295B3B658D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:29:32 +0200 (CEST)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtCV-0000dv-3I
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtBY-00083C-1G
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:28:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtBU-0000s7-IB
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:28:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id yy20so22889394ejb.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=banmgXamPvEn0CWgxehaLbvkVK6EV3lk68A9OwsJZM8=;
 b=GbXHRM6f4cSpcpjhDLtLDAmAoOtVRnEZwDcqlgyEJFnPNKKN/VhOXlWcPQ4jHskk16
 UpSMZJcMPPfMdCPvv7peyNCzDJPl23dqslcd0osw/5C9o3hfmYpYrdx7IRhSsxeh6RGn
 7Xw9sfD8LCQg9mgU+0Jc1OSC8JhEk3I6Rccfa5MOGfqH/p1QlTKxPjyyq/LVzgEsBk2C
 IyDSQBaUE9whOpNvZPkYkrC4q2V1KEFlTROsF+6loaICSCMo9pVntaZB08wqvwHhjIlZ
 cXrsqeJi/MvFt/6oIaeRO/2aC529vek71FMZB4XilshnabWBc50psXpLlgbvXUAYu36E
 sJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=banmgXamPvEn0CWgxehaLbvkVK6EV3lk68A9OwsJZM8=;
 b=eTGyCL7V+gHkac8OnfD2MaN2o3kXOuKGoG+5grH49qi6+iKFcOhqSGu1rry+TT5Fg6
 V9GdoePiBe/meHKIiTR/8Vf+K/aKeei8QC6yWcJpBDCzHvi8CP5njoxOtrXqXqHGSx7+
 lBDf9GyxBaRRmyMYBdpco1uK/UGFr9X/KNoFfT7rr0M3oPF4FXyq42Sjwf4XbEkUpOFy
 kNFwXL8yyHxUmY+F/039SskiDjnJuGNEVluRXlsrEELLtYMvhgUOTCkAddv0zF/gRO4O
 4Zl+15xBoW8nSU9xlKV5/LOugxqJhuxPDKol80YmueNvcXoCFExlYgo8uXy9n8t20I9J
 T5dQ==
X-Gm-Message-State: AOAM533L73NVCcIcYSHo5QIeg/frhN8bMnphhImv2lphcdCKBt0ejgrF
 NwuVcx5QWc5uMU8Y+3zkmNPly/8/klYSbdkBAa00Wg==
X-Google-Smtp-Source: ABdhPJzxU77d24EufJCR/QAgJZYSFtLu+0mliZTEzfVSYUz6lpTbBOvdHvHCyWOiBw675ZymN98WPiEqCcuOuyxgJ2M=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr24314181ejw.382.1624894107189; 
 Mon, 28 Jun 2021 08:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
 <20210620052543.1315091-5-richard.henderson@linaro.org>
In-Reply-To: <20210620052543.1315091-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:27:50 +0100
Message-ID: <CAFEAcA9tjMa3uXnamKp1naEPmiG0t=j=J1PVy3R2hY_=oKaxhQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/nios2: Add DisasContextBase to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 06:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Migrate the is_jmp, tb and singlestep_enabled fields
> from DisasContext into the base.

The commit message says we're only moving is_jmp, tb and
singlestep_enabled, but...

>  static bool use_goto_tb(DisasContext *dc, uint32_t dest)
>  {
> -    if (unlikely(dc->singlestep_enabled)) {
> +    if (unlikely(dc->base.singlestep_enabled)) {
>          return false;
>      }
>
>  #ifndef CONFIG_USER_ONLY
> -    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
> +    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);

...here we change one, but only one, of the uses of a PC related
variable too...

> @@ -812,11 +810,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>      int num_insns;
>
>      /* Initialize DC */
> -    dc->is_jmp  = DISAS_NEXT;
> +
> +    dc->base.tb = tb;
> +    dc->base.singlestep_enabled = cs->singlestep_enabled;
> +    dc->base.is_jmp = DISAS_NEXT;
> +    dc->base.pc_first = tb->pc;
> +    dc->base.pc_next = tb->pc;

...which AFAICT is the only reason we needed to set pc_first/pc_next
here, which lines are then deleted again in the next patch.

I guess we get to where we're trying to get to in the end.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

