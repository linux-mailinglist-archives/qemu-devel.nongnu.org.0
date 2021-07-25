Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391063D4E34
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 17:02:44 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7feM-00031p-Ot
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7fdA-00025W-G5
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 11:01:28 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7fd8-0008R1-KR
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 11:01:28 -0400
Received: by mail-ej1-x632.google.com with SMTP id gt31so11810148ejc.12
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 08:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csMDFnzfhH+mlXO72Dm/fjkts0OMWNcP5hVMRWlOg5E=;
 b=za8uwZ92hMhAx0Tn/Yt30VVvRZhtmr/f4yv/Kyk9Fwaeu67T/qalBKC5ze3+tbDThc
 qABvMVMyLfEgZCNnPeYPgpFQblV0OSb6pL/qrDCjiYojBjdCIZP9fQHu6drSIi1z+rhd
 2/xMzky8H/E2Di/zpABc4q86TQUNQmuaoqt/DEmroG9weXip2gMODfAJVpQVDaRuNePK
 XWSpHfLMaoEONtBLlytips3AyaOiEWrn9oCJEiWIjhjg2tnPjJwcByZn0268szCYvfyY
 bpq7ilRVuspZvkurMBU08J/p7VYm1nQ0bRonMHeubgGiN+AnoC4q6NJF9Z9AklMtuYcd
 1Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csMDFnzfhH+mlXO72Dm/fjkts0OMWNcP5hVMRWlOg5E=;
 b=MTUpSvQ7YeMfs7bWK6774TKdDgK8ECMS3RYdno2aJhkrwML4PgGjDMMB6XVu5IgZr2
 8Ml2Qxlx9Xnxxk8jgl/3n0EF/ESS4CHmKbyylGD3+tVreO1Bn/YoBEDds1NCfDpxWnLH
 yTAC4DZkNabF8tF+w5kR6WRrwRC9AlAH3fADRZqf8CbJ/EA9pAwORf9czxSOdJEyGawU
 /R5nk48plBGfv1a4tKMvBZN9+ZauAoNPs+zMXqEmk/RJ6iTfNnQbTFCVNKyIs57kqXFv
 6c72ytqe55nZYTssM9x9F89Cjx0VkiLHQ9+8Yu83l/FwnC3UG7wsIaFFd/VarjaMMmJz
 W4Og==
X-Gm-Message-State: AOAM5335XxFiEtmD+m8602fDZIJm2pUkRM90BZbkeQSC1SWcFgi0q/6q
 c1ceegYOwwOYu3UtbIBgujiWfQx17Xzpg37fwzyGyA==
X-Google-Smtp-Source: ABdhPJx5ToFVOyE/phF9BAa/NNv0MaaVxRVpB6BjzZ22WXKZ1yt7+CJXwyCnMqTwdBdlzLbBYI33rzLx4yDBwSWvsnA=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr16266390edt.100.1627225282305; 
 Sun, 25 Jul 2021 08:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210724134902.7785-1-peter.maydell@linaro.org>
 <CAFEAcA-r_WUVx+5dFrpRPGppzMon_pDBzytTp5QwVcnbVxCzSw@mail.gmail.com>
 <0750612a-5945-290c-d907-9f01e0baf336@linaro.org>
In-Reply-To: <0750612a-5945-290c-d907-9f01e0baf336@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jul 2021 16:00:40 +0100
Message-ID: <CAFEAcA_-NTkBF41aCmOMa5=obUNK66Ob3_Hm2ic=1OgTi=B4AA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Jul 2021 at 21:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/24/21 10:27 AM, Peter Maydell wrote:
> > On Sat, 24 Jul 2021 at 14:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> There is a slight difficulty here with testing this: icount
> >> doesn't seem to work for sparc Linux guests in master at the
> >> moment. For instance if you get the advent calendar image from
> >>    https://www.qemu-advent-calendar.org/2018/download/day11.tar.xz
> >> it will boot without icount with a command line like
> >>    qemu-system-sparc -display none -vga none -machine SS-20 -serial stdio -kernel /tmp/day11/zImage.elf
> >> But if you add '-icount auto' it will get as far as
> >> "bootconsole [earlyprom0] disabled" and then apparently hang.
> >> I'm not sure what's going on here :-(
> >> (I filed this as https://gitlab.com/qemu-project/qemu/-/issues/499)
> >
> > This turns out to be a recent regression, caused by commit 78ff82bb
> > ("accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS"). It's
> > an intermittent rather than a 100% reproducible hang.
>
> Ouch.  Ok, I'll have a look.

I did a bit more messing around with a repro case under rr,
and I think I now see why we end up hanging, although I'm not
100% sure what best to do to fix it:

 * We have a TB with 512 insns (tb->icount == 512)
 * We want to execute 511 insns (icount_decr == 511)
 * the code generated by gen_tb_start() does "subtract
   this TB's instruction count from icount_decr.u16.low, and
   if this is negative jump to the exitlabel". 511 - 512 == -1,
   so we exit the TB with status TB_EXIT_REQUESTED and without
   executing any guest insns
 * in cpu_loop_exit_tb() we look at insns_left, which is still 511,
   so we don't take the "early return because exit_request" path
 * we calculate a new insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget).
   icount_budget is 59267, so the new insns_left is still 511.
 * we set icount_decr.u16.low to insns_left (ie same value as before)
 * we set cpu->icount_extra to icount_budget - insns_left, which
   is 58756
 * because icount_extra is non-zero, we don't set cflags_next_tb
   to force us to find an exactly 511 insn TB
 * so we come out to the cpu_exec() main loop, and find again
   the same 512 insn TB we started with.
 * Nothing changed from the last time we tried to execute it so
   we just go round and round in circles never making any progress...

We don't get this failure mode if CF_COUNT_MASK is larger than
TCG_MAX_INSNS, because the calculation of insns_left will
produce a larger number than TCG_MAX_INSNS, unless we really
are running out of icount budget (in which case icount_extra
should be 0 and we will force execution of that smaller TB).

So the primary bug here is that cpu_loop_exec_tb() needs updating
to follow the new logic of "allow insns_left = TCG_MAX_INSNS and
indicate that with 0 in the CF_COUNT_MASK field".

Q: in cpu_loop_exec_tb() in this calculation:

    /*
     * If the next tb has more instructions than we have left to
     * execute we need to ensure we find/generate a TB with exactly
     * insns_left instructions in it.
     */
    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
        cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
    }

why are we testing "!cpu->icount_extra" ? The thing the comment
says we're looking for ("this TB has more insns than we have
left to execute") would be just "insns_left > 0 && insns_left < tb->icount".
And the code generated in gen_tb_start() will exit without doing anything
if insns_left < tb->icount (as described above), so we'll get into
an infinite loop pretty much any time we decide not to force execution
of a smaller TB. It's merely that we're much more likely to do so
with CF_COUNT_MASK==511, because we are accidentally very often trying
to execute 511 insns of a 512 insn TB when we could execute all 512.

thanks
-- PMM

