Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3159B6CD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:44:42 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPucT-0003yS-2v
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuZ3-00076N-9s
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:41:09 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuZ1-0002zN-NU
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:41:08 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bf22so9346299pjb.4
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9txHS3EBkGS4mcY7mcVrZw4vOS0zvW5CARg2g30D57w=;
 b=hfxTZnjs5vKcGHFnGCrCJM0tJg7KfXTkk/moVKDO27aREw0gUv5exq0CQfEgUloFcl
 k1JWso18RcpnZiZEftEcRDertHZun9Poa6Pc0N/gF5MRlElT1TuWu14SiBNPyipWUGbL
 pw8xg2lzsXuxseVqvMIPN5A02o3iGcTR4OPZPCzZPfH5xHIa4ym1v87i42JiSNvyQ+GH
 N68iFSXlnS30XEKqXBVT6HDZ2FCy95twy2ohPFhd4mWUjPJ9DSVcZcvQ6d0l8fKfWN7q
 8FSHtISr6ffmJ8opj6MkbsTgL83BXXQnO1AG61+jYwTYeMKMpfQ5Xgpp5adWvBfRcT47
 RY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9txHS3EBkGS4mcY7mcVrZw4vOS0zvW5CARg2g30D57w=;
 b=pksjyRKc02fPUQi4qITo73mjitqyWUg//XxWQaD94sfH6IeysZ5+Ew8W1vV2DIaWEC
 138Q1uaXMfR6rfcUtndTdadwxHRwR5u/gaYie6f+AucmOyboiDYXO9BnzaKUThRSg8pk
 MR+ZF44xvBtXrsdGNr6sSznG3Ne7Zjdrfi3LOU0lzbRktYNcp5/dKdD586Pj933vBb9J
 cweFnC0uAnbHR+uSyV5hEeJkexhsn4NIey7OH0wtyP7dEJKA2NVPgbf+1fusMan20JIa
 33MCbQ3WWYnahghGqNrAi2t1/9nwcuXS9wLlSuonoH18156Q5CZo+8kESq1NDCXBkbkd
 Ya3Q==
X-Gm-Message-State: ACgBeo0j7p4dniCTXHSHcvpjSZ6dTwUrq2k+jH1r8DSiWX5R/o3O9pt0
 saveh/YpZGWaxBgNz59vGXD+VYWZGeSem1vRNyNueJoy+4Q=
X-Google-Smtp-Source: AA6agR7Epd29jCzWFwYoo/CWLwfnUoOSNdqvH9V9Ln4vPKu1vhDIN5Y7knIa4ihRpSRYtg0stPq7lHaUbCij118mJ0I=
X-Received: by 2002:a17:90b:281:b0:1fb:151b:b5cf with SMTP id
 az1-20020a17090b028100b001fb151bb5cfmr6049032pjb.166.1661125266308; Sun, 21
 Aug 2022 16:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-15-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-15-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:40:40 +1000
Message-ID: <CAKmqyKNTpm0XLMEEkMK=EARDhEQA+LhfXAKRoOwjpcyS9vrsCQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/21] accel/tcg: Raise PROT_EXEC exception early
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Aug 19, 2022 at 1:40 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We currently ignore PROT_EXEC on the initial lookup, and
> defer raising the exception until cpu_ld*_code().
> It makes more sense to raise the exception early.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/tcg/cpu-exec.c      | 2 +-
>  accel/tcg/translate-all.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 7887af6f45..7b8977a0a4 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -222,7 +222,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>      desc.cflags = cflags;
>      desc.trace_vcpu_dstate = *cpu->trace_dstate;
>      desc.pc = pc;
> -    phys_pc = get_page_addr_code(desc.env, pc);
> +    phys_pc = get_page_addr_code_hostp(desc.env, pc, false, NULL);
>      if (phys_pc == -1) {
>          return NULL;
>      }
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b83161a081..069ed67bac 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1396,7 +1396,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      assert_memory_lock();
>      qemu_thread_jit_write();
>
> -    phys_pc = get_page_addr_code(env, pc);
> +    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
>
>      if (phys_pc == -1) {
>          /* Generate a one-shot TB with 1 insn in it */
> --
> 2.34.1
>
>

