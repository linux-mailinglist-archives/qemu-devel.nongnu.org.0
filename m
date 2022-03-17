Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5A4DC7BC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 14:39:36 +0100 (CET)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqLn-0001XG-1k
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 09:39:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUqKs-0000r5-20
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:38:38 -0400
Received: from [2607:f8b0:4864:20::112c] (port=42842
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUqKq-0000mQ-DD
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:38:37 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso58173447b3.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QzyGkWHBsC8iwqqYrL53qax56ZVFreNZRL50avlkUeQ=;
 b=lIZlxhzufJyYeq8RqX2xFHC2QBD7XrWF3yJ6k87liE8JXTO8KoEwooLRXdPysixozd
 xh6y8/UOhpgbscYDXPp23nuwR17nyRBdkbY52ttAIe7RGBvthBiaHw1m6M44HabZ3aCZ
 Jydcu7kV+QthJrq2F1tNGxjDL4CFvd44LHibircCo3nt6StybSkK6jrwVc7Mey5wuA2I
 0pKCvI6Pcg+JCaqlCQjAEi4MwpWrWy0iBZVSCUhsmzDLF0VJny7NIfQHKpbeFHx7b+j4
 d/TC6IUJ/NfkhHLAcDW+A8eSh5j5DrwvtnTGnOOzK55EFPo1CtFE/LpeWnNXn3MryyYk
 JoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzyGkWHBsC8iwqqYrL53qax56ZVFreNZRL50avlkUeQ=;
 b=pm/mbzDEu4h0lwA58skZlFSL79KVmEpF/WftmljvM4drGrFS3/DoPh1URcqGwNYifh
 JKhlqqibPFiHVlWyoj7JMCi3owjGXAJcBru6puTHHdkxNUBqB0UrcDm/27LpvyOOQE4w
 mLQ4+lCPA3Mo2DQD3zqWi3J06UyVfSilEDLzL6HDgjrWgi8ulsCinb5QyCIQFPZEZzpL
 cHKMU6V0OPloyQEpg9uUglzlg4MtsOfY24MjKAoZZiKee5+E0rcDpJgNJxgYFhpqgbxK
 gsIy0LSOKeA1xo34a9K8r9dXx+ovsgtP6xvlcltK+9sxnY9OxaMlnFQyVOCH/SI5hyvH
 jLmg==
X-Gm-Message-State: AOAM533woS6Wn/7rqJ1grtAOa32l0b2O4EVKQHpfhAIJ33Cg5K9wd+Js
 sd7gyZO2i9y4wJF3j4wY7MyXSDAlTw67VGJFgMt96w==
X-Google-Smtp-Source: ABdhPJzTTVF0LMtqB7IiiBj/1Ki11mTTE/puPEdQ2e7XpYv5/Ci060TUb2vcGBN10IwZfPPlArgHIW6gAXYe+zbxl8w=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr5679212ywf.347.1647524314829; Thu, 17
 Mar 2022 06:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-2-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 13:38:23 +0000
Message-ID: <CAFEAcA-WTAjYGnb0-cDLEa+XJYDLRV4cctQu=VHshXc48=ca5w@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 01/51] tcg: Fix indirect lowering vs
 TCG_OPF_COND_BRANCH
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Thu, 17 Mar 2022 at 05:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With TCG_OPF_COND_BRANCH, we extended the lifetimes of
> globals across extended basic blocks.  This means that
> the liveness computed in pass 1 does not kill globals
> in the same way as normal temps.
>
> Introduce TYPE_EBB to match this lifetime, so that we
> get correct register allocation for the temps that we
> introduce during the indirect lowering pass.
>
> Fixes: b4cb76e6208 ("tcg: Do not kill globals at conditional branches")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h |  2 ++
>  tcg/tcg.c         | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 73869fd9d0..27de13fae0 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -433,6 +433,8 @@ typedef enum TCGTempVal {
>  typedef enum TCGTempKind {
>      /* Temp is dead at the end of all basic blocks. */
>      TEMP_NORMAL,
> +    /* Temp is live across conditional branch, but dead otherwise. */
> +    TEMP_EBB,
>      /* Temp is saved across basic blocks but dead at the end of TBs. */
>      TEMP_LOCAL,
>      /* Temp is saved across both basic blocks and translation blocks. */

Maybe add an assert() in tcg_temp_free_internal() that ts->kind is
not TEMP_EBB ?  (This was about the only place in the file that
does different things based on ts->kind that you haven't added
TEMP_EBB handling for.)

> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 33a97eabdb..45030e88fd 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1674,6 +1674,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
>          case TEMP_GLOBAL:
>              break;
>          case TEMP_NORMAL:
> +        case TEMP_EBB:
>              val = TEMP_VAL_DEAD;
>              /* fall through */
>          case TEMP_LOCAL:
> @@ -1701,6 +1702,9 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
>      case TEMP_LOCAL:
>          snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
>          break;
> +    case TEMP_EBB:
> +        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
> +        break;
>      case TEMP_NORMAL:
>          snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
>          break;
> @@ -2378,6 +2382,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
>              state = TS_DEAD | TS_MEM;
>              break;
>          case TEMP_NORMAL:
> +        case TEMP_EBB:
>          case TEMP_CONST:
>              state = TS_DEAD;
>              break;
> @@ -2427,6 +2432,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
>          case TEMP_NORMAL:
>              s->temps[i].state = TS_DEAD;
>              break;
> +        case TEMP_EBB:
>          case TEMP_CONST:
>              continue;
>          default:

The comment on la_bb_sync() needs updating:

/*
 * liveness analysis: conditional branch: all temps are dead
 * unless explicitly live-across-conditional-branch, globals
 * and local temps should be synced.
 */


> @@ -2797,6 +2803,7 @@ static bool liveness_pass_2(TCGContext *s)
>              TCGTemp *dts = tcg_temp_alloc(s);
>              dts->type = its->type;
>              dts->base_type = its->base_type;
> +            dts->kind = TEMP_EBB;
>              its->state_ptr = dts;
>          } else {
>              its->state_ptr = NULL;
> @@ -3107,6 +3114,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
>          new_type = TEMP_VAL_MEM;
>          break;
>      case TEMP_NORMAL:
> +    case TEMP_EBB:
>          new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
>          break;
>      case TEMP_CONST:
> @@ -3353,6 +3361,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
>              temp_save(s, ts, allocated_regs);
>              break;
>          case TEMP_NORMAL:
> +        case TEMP_EBB:
>              /* The liveness analysis already ensures that temps are dead.
>                 Keep an tcg_debug_assert for safety. */
>              tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
> @@ -3390,6 +3399,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
>          case TEMP_NORMAL:
>              tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
>              break;
> +        case TEMP_EBB:
>          case TEMP_CONST:
>              break;
>          default:

Similarly, the comment above tcg_reg_alloc_cbranch() now should
say "all temporaries are dead unless explicitly
live-across-conditional-branch".

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(though review from somebody more familiar with the TCG internals
than me would still be useful I think)

thanks
-- PMM

