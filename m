Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3B3D037F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:58:27 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wor-0006zj-PN
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wnt-0006If-Qq
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:57:25 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wnp-0006uv-K8
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:57:25 -0400
Received: by mail-ej1-x62b.google.com with SMTP id dp20so34362770ejc.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+uTjcR2i+t+HNf08ooRgJNIgYXGTPn0EMp9x41HQFY=;
 b=O8UYGL9ySeyvPA3NCR2Q3R2fndA1tEVOB3VregdXhzURFtytcVDjv+FYvYDosKjAew
 NKZEQ7nlZa69abjnD3xnquEZM/Jjo8IX/RIISi8pGVFS/U7EgDKywFfXgGKF3bzYnoi2
 md3++trAVaxDGd4FZKB1sYGimf8UcZN9GzdM9/XXn7xxJcDWx1dYsIwn5VvY0ijeSrHj
 2ctZ+Kf8caXYlSvIWX5hhNRgDprg6XDtBZORfRjFmEf41YV7bc4FZyiIe1PUcyfd4T62
 1wmkvFuKiXFNLJ2HIcPtXOQBhj3uZ6l/d4etqaLd1ajUWN4a/vu6+wo7Tq5qR6dXRGxu
 kqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+uTjcR2i+t+HNf08ooRgJNIgYXGTPn0EMp9x41HQFY=;
 b=i7pYI6nB83FhYiVXMnpZzTLlrtgmkHrk5M8cR989WktI0t1s0LSfCJ3it6Vfd7Vcta
 WdYKDcfqyYPdju1feo7guyWNJqN70mCTqors8dPRaNbz5Akvy9rWUSzJ9mjhP2HY3B5v
 WkVdXrDpq3a+T5UalyrgrbOmAepcI2aKbtaNvDrRHp84eSBjVtEs9pF0GrNFl2SgnDGB
 icMZDydtxn7N09PghEzro+n7/EOUYbEQYxZtoqLqa9CfgHDSh7HqdAoG4JqdPGz0T20L
 msCNQxkXgrUy/BuBw9OZvNgjd2vvwSCizuaVBSb1vw7+gbW8HJheOwpg6HyuJCc5QntR
 wHfg==
X-Gm-Message-State: AOAM5317y428fPfrO4af3CSeRSPzfhIdCZQA/ltdsEMuD4TtOgXIQw8N
 nbcFFXK8uRuIH1oxzAaLRk2e/x+iPAsqbF55KW+Bzg==
X-Google-Smtp-Source: ABdhPJybFZ2d+lCt57CGJ5dDIsFPG97oEbV04FHUgSCpkoAGqa6tR9AuSkFLnbCtK2A3eh4jpg+ZaixEq9FkjiI4RvQ=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr34301342ejb.382.1626814640012; 
 Tue, 20 Jul 2021 13:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-12-richard.henderson@linaro.org>
In-Reply-To: <20210720195439.626594-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 21:56:38 +0100
Message-ID: <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
Subject: Re: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 20:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will allow a breakpoint hack to move out of AVR's translator.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/cpu.c b/cpu.c
> index 83059537d7..91d9e38acb 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -267,8 +267,13 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>  int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
>                            CPUBreakpoint **breakpoint)
>  {
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>      CPUBreakpoint *bp;
>
> +    if (cc->gdb_adjust_breakpoint) {
> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
> +    }
> +
>      bp = g_malloc(sizeof(*bp));
>
>      bp->pc = pc;
> @@ -294,8 +299,13 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
>  /* Remove a specific breakpoint.  */
>  int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
>  {
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>      CPUBreakpoint *bp;
>
> +    if (cc->gdb_adjust_breakpoint) {
> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
> +    }
> +
>      QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>          if (bp->pc == pc && bp->flags == flags) {
>              cpu_breakpoint_remove_by_ref(cpu, bp);
> --

So previously for AVR we would have considered the bp at 0x100
and the one at 0x800100 as distinct (in the sense that the only way
the gdb remote protocol distinguishes breakpoints is by "what address",
and these have different addresses). After this change, they won't
be distinct, because if you set a bp at 0x100 and 0x800100 and then
try to remove the one at 0x100 we might remove the 0x800100 one,
because we're storing only the adjusted-address, not the one gdb used.

This might not matter in practice...

-- PMM

