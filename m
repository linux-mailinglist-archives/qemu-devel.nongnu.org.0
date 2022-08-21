Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132559B6C5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:33:34 +0200 (CEST)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuRg-0000uU-W0
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuPS-0007nK-E4
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:31:14 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuPQ-0001tm-SB
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:31:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id jl18so8475626plb.1
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ziOLp1gg0TQQgtpMKXs5FT327pBoaEcVDukx0JxPbkE=;
 b=jzHMcMBG66mB7K79wC5MwD5QId+7herJ8tSTHsNbHvxTU4sKcPndC+01nx096KC3XT
 s3y+uA1FJDKlS3COrqhxVDUKkh3QGSBnI4rVamUYJTJ0JxsWzcjD2mpiGxGjogEgHLIf
 RP32NiDx2Veuh6u1Bf64WH45LNFnzZAorSbG5Qw51UbIPrJTXHnZ+S9UxXgSf+hrdvnU
 75TyKCXPrmEzNR24gh/aZgta7Sq40EwFhvBJxV1lpWE+UxG72iAnjjQM+7y8WnoW3jCm
 h8n6RACi1EJYqM654g4v+s5aRPefu9MU79ta7ml/qtcf0LCowjnQrzsPCFdxV8IdO1SL
 xZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ziOLp1gg0TQQgtpMKXs5FT327pBoaEcVDukx0JxPbkE=;
 b=0c2wXiU6V1qpRO2iTWSjND+k4dy2Hzm1fav9j5cC/tiXvWVrdQuJlbzauX0vWN16jJ
 bOPXHZ6fw8DXBbbzNisiVKUe9fTBGLpGopFL0AecQ29ik7tlT9/ICdQExtMXpNyVKiLI
 KipDxhldYIBLiuZsx/lZrAq91B/bbHGp4X9MPmP91VUwpamMHc2o1CH+tDCw5KHM3uVm
 /QRt9FJ4gTGsAOsiQFpmsE1K9t1udBIGBBuL5jHVkvSCUzHXWjtctSJjDD5BEGZBOEE+
 2jZUWqWKcEtS1vUORmoKiQIoEuS9Za60lwoDGJ5pSexBxgaO/tkCXMVm1GfYbqfyI30c
 thxA==
X-Gm-Message-State: ACgBeo2RUW6G89+g2GbrfvcjrhgyO/z/9QYFg0HPOFyk2/QeCuisqCvL
 ybz86VjB/LPeAg0YXYxeSAgh/+BAokLsgf1UeJ0=
X-Google-Smtp-Source: AA6agR6w0RtyD6ltQRlQNOPr7fu5aSYZrPcrOx1Q7o17krVd1y4+2pGgQurc6qEP1InHHTjNRXLqnVgXiHNHu/G/ens=
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id
 b17-20020a170903229100b0016ecf555c72mr17867463plh.121.1661124671557; Sun, 21
 Aug 2022 16:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-10-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-10-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:30:45 +1000
Message-ID: <CAKmqyKMNBaB_5XH8YFC+cFHOwh0DETy-sRCq-uBoykBF+ZN0dg@mail.gmail.com>
Subject: Re: [PATCH v6 09/21] accel/tcg: Unlock mmap_lock after longjmp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
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

On Fri, Aug 19, 2022 at 1:29 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The mmap_lock is held around tb_gen_code.  While the comment
> is correct that the lock is dropped when tb_gen_code runs out
> of memory, the lock is *not* dropped when an exception is
> raised reading code for translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/tcg/cpu-exec.c  | 12 ++++++------
>  accel/tcg/user-exec.c |  3 ---
>  2 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index a565a3f8ec..d18081ca6f 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -462,13 +462,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
>          cpu_tb_exec(cpu, tb, &tb_exit);
>          cpu_exec_exit(cpu);
>      } else {
> -        /*
> -         * The mmap_lock is dropped by tb_gen_code if it runs out of
> -         * memory.
> -         */
>  #ifndef CONFIG_SOFTMMU
>          clear_helper_retaddr();
> -        tcg_debug_assert(!have_mmap_lock());
> +        if (have_mmap_lock()) {
> +            mmap_unlock();
> +        }
>  #endif
>          if (qemu_mutex_iothread_locked()) {
>              qemu_mutex_unlock_iothread();
> @@ -936,7 +934,9 @@ int cpu_exec(CPUState *cpu)
>
>  #ifndef CONFIG_SOFTMMU
>          clear_helper_retaddr();
> -        tcg_debug_assert(!have_mmap_lock());
> +        if (have_mmap_lock()) {
> +            mmap_unlock();
> +        }
>  #endif
>          if (qemu_mutex_iothread_locked()) {
>              qemu_mutex_unlock_iothread();
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index a20234fb02..58edd33896 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -80,10 +80,7 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
>           * (and if the translator doesn't handle page boundaries correctly
>           * there's little we can do about that here).  Therefore, do not
>           * trigger the unwinder.
> -         *
> -         * Like tb_gen_code, release the memory lock before cpu_loop_exit.
>           */
> -        mmap_unlock();
>          *pc = 0;
>          return MMU_INST_FETCH;
>      }
> --
> 2.34.1
>
>

