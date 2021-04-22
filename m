Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A5367F00
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:49:16 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWtX-0006w5-MR
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lZWrU-0005IS-ON
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:47:08 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lZWrS-0004kN-Rs
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:47:08 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v3so48490702ybi.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oig5xfvYOZQf9Np8uvXJ8UgA9R56IsbwHu7KbThGhEg=;
 b=p2wq+uW70TUPLJiMBjDuawfwJDl4shO2tNJ/q81mf3ZoD+TzefxfbBVoFU27GJuzjX
 9gQZ32AnZxJx97NHNZVk6B6N/mI6vuPZk44LVysnkwTqw3UXU6ETiZ3QEzccVA5+4bw3
 taHoJktLdAwUbxGGkBkdzU+vM/I2uYf+KHYQcNB/H3wzn+9fP1GLyxfGotX0QKCu53/2
 aaJD8hqPXrjGQNIZbYuaNFetLdTkXiNgKRGLylFWehYIKqD39cJWae3Tkz2L5llJ0yIL
 v3mHyRZp5VGoF8d3sYdsTgWcFKzwtRQv8qOIz7HR3Fc1ULUTF3jE4rlsujf40G8x4kgn
 8Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oig5xfvYOZQf9Np8uvXJ8UgA9R56IsbwHu7KbThGhEg=;
 b=dV9y5Hbu3a9vgOzD5NTGHZm8PO6yRON500IMHpUuZ2RfPAef+jhYDyFXcwwcA1l/rr
 ciozOPj3tZZELhG6L6BUDLL0pM4Ue3CjS0l3doEuC0XBH+fkIGsYNH0ErWhMeRSBeVfx
 PUA1Xxa93FjvLcDwpYSzgkKT6pffNYOJgHLIYtcZhGvA3+feGDEN1gXiSwnI16AHwr5W
 wAAH90ncUrzMfbtly+AziCv8L7ug4yI32zWHBYklpBHJGbqyVfJhG2aZkDaIh0H6jviH
 1R6R1oOn/uTyqlMfO59R0nMYvbV033A8HzuwqMEihy+HxLVuqRbCi6ZBrm6HidPtZeEl
 T6fw==
X-Gm-Message-State: AOAM532tBd296Xt8kCXa8llRx02tfu0kGcq5uQbjnCWArwkTb+AqBA2/
 UwqpEqL0npj/0KG1liew8UvddBt0nljCfMd7i5CabLOmWi6eqw==
X-Google-Smtp-Source: ABdhPJy3qeEJGlQnhxP0gmjLj0/OxSsdWT2S05YE5FWIRb7glBbza5mPll9uyyyYc59sZnN3SpfRWkYE9zuWSSVZtO4=
X-Received: by 2002:a25:420e:: with SMTP id p14mr3552919yba.294.1619088425226; 
 Thu, 22 Apr 2021 03:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210416153430.92187-1-ziqiaokong@gmail.com>
In-Reply-To: <20210416153430.92187-1-ziqiaokong@gmail.com>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Thu, 22 Apr 2021 18:46:54 +0800
Message-ID: <CAM0BWNDyi+hasiKyXjOjp=bTa__gMQ=GUx+h5ZKZS9BZG5ubRw@mail.gmail.com>
Subject: Re: [PATCH] Set the correct env->fpip for x86 float instructions
 [cleaned]
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for this patch. Patchew:
https://patchew.org/QEMU/20210416153430.92187-1-ziqiaokong@gmail.com/

Ziqiao.

On Fri, Apr 16, 2021 at 11:38 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
>
> Hello, everyone!
>
> Sorry that I forgot the Signed-off-by line and put the duplicate link just now. Please ignore my previous emails.
>
> This patch follows https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html and https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00307.html
>
> Sorry again for any inconvenience.
>
> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> ---
>  target/i386/tcg/fpu_helper.c | 4 ++--
>  target/i386/tcg/translate.c  | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index 60ed93520a..e8cbde4e1a 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -2395,7 +2395,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
>          cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
>          cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
>          cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> -        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> +        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
>          cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
>          cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
>          cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
> @@ -2404,7 +2404,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
>          cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
>          cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
>          cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
> -        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
> +        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
>          cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
>          cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
>          cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 880bc45561..cc4398f03b 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -6337,7 +6337,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto unknown_op;
>              }
>          }
> +        tcg_gen_movi_tl(s->tmp0, pc_start - s->cs_base);
> +        tcg_gen_st_tl(s->tmp0, cpu_env, offsetof(CPUX86State, fpip));
>          break;
> +
>          /************************/
>          /* string ops */
>
> --
> 2.25.1
>

