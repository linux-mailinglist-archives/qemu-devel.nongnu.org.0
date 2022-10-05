Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B425F56BE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 16:52:40 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5lF-0002EZ-9x
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 10:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1og5BJ-00017q-MS
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:16:00 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1og5BG-0006xO-QO
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:15:29 -0400
Received: by mail-ej1-x62f.google.com with SMTP id z23so19012313ejw.12
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dtjn7CZWhhh0QYbxJQV5Gx7SHvrrb+/CR/4o20A8Zmg=;
 b=BVMJWyl621a1WLdt71d/Nygc6W7GZzyQti3RYQ2xCP9bopNy7xwjtwEdeyiSdhlQZd
 N+xmZTKtzGHWMQyw4f1lKi0QjR2Q/jyiyIAPr+9vETz1BWHfZu6vH1fdCfYIGdtq03wu
 N7WDYHJDfphXcW+tRh0qbDexwCl0t5bHHKz7avl5tvMmYKUZDriRs7XmSJStBU6mPRp7
 nk16461+VMBESYftgItpbsTGoNNP5vBWNgL2qJP3UBAAeMVp9AkfHYD8hjEfcXCfOMut
 w1/x3AiaSV7mJx2A70mNyX6hpozJ9+e3v2RSt90Rg9g0V5yhlxFlP/KAqxuwNp8zTSqa
 Nt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtjn7CZWhhh0QYbxJQV5Gx7SHvrrb+/CR/4o20A8Zmg=;
 b=zlbh4n8tHSpfs8X4IiIYI8F2lawe2Q8m54QH7xb41WhV/wNwbFUGMaepCgyxHBoFEL
 lORPuARTVDMvA8SLi8mnh2erF3iS0xFKWR/dMoweXAG8o3b7UUWCiZRMy6HPvMt+lcaM
 CxgNAjFsjw7v2JoEuuvp+nB0/NManUNMmTTRVQJr/cffoN6umGKSL4VJxA8TABXIeBhl
 ZRCRIR78GCPdR0J4uKlKbJqYtFhaDN5lj12eAmf0FCeSdNAgWQ5+me3apJO/ObVNT6J6
 wSwY6eq8zepTzivDIvlYdAeruRBbPs6JVAr0Bex9zvOzcsQmIrFX8lvuJ1m33XiEZ9E4
 owsA==
X-Gm-Message-State: ACrzQf2QPfLqCAswxtEq0YNAmT5wb05AW5MwylkC63s5+i8AimtjwdIR
 tROtYOtRkhhonxYxSFDvm5B71ItfzwlnCMfHuJdPMQ==
X-Google-Smtp-Source: AMsMyM6PleMClrBlnsLH4HtgkAqDeO8qv6+1omAWuTaoKirjP4H9n4P557XnmTV9WL8xsMNiwaDohllvhcFpFpF3d+g=
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr24537760ejc.659.1664979323225; Wed, 05
 Oct 2022 07:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-7-richard.henderson@linaro.org>
 <CAFEAcA-hH=kqGfPQ3d6wJfo-ti_UvdMAs6pZx6A79QO5Mi-Q=w@mail.gmail.com>
 <c91da352-f27a-d81d-59e9-43fabd604e8f@linaro.org>
In-Reply-To: <c91da352-f27a-d81d-59e9-43fabd604e8f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Oct 2022 15:15:12 +0100
Message-ID: <CAFEAcA_zKX1RVjHfTnxHOUogVX_JxpnWOPW-yYDCuAvk7J3YEw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] target/arm: Change gen_jmp* to work on
 displacements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Oct 2022 at 21:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/4/22 08:58, Peter Maydell wrote:
> > On Fri, 30 Sept 2022 at 23:10, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/translate.c | 37 +++++++++++++++++++++----------------
> >>   1 file changed, 21 insertions(+), 16 deletions(-)
> >
> >> @@ -8368,7 +8372,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
> >>       }
> >>       tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
> >>       store_cpu_field_constant(!s->thumb, thumb);
> >> -    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
> >> +    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
> >> +    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
> >
> > Could we just calculate the offset of the jump target instead?
> > read_pc() returns s->pc_curr + a constant, so the s->pc_curr cancels
> > out anyway:
> >
> >    (read_pc(s) & ~3) - s->pc_curr + a->imm
> > ==
> >      (pc_curr + (s->thumb ? 4 : 8) & ~3) - pc_curr + imm
> > ==  pc_curr - pc_curr_low_bits - pc_curr + 4-or-8 + imm
> > ==  imm + 4-or-8 - low_bits_of_pc
> >
> > That's then more obviously not dependent on the absolute value
> > of the PC.
>
> Yes, this works:
>
> -    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
>
> +    /* This jump is computed from an aligned PC: subtract off the low bits. */
>
> +    gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));

Cool, that looks a lot clearer. With that change,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

