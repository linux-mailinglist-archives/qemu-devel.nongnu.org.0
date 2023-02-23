Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB66A0EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFbw-0004bh-II; Thu, 23 Feb 2023 12:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFbu-0004bR-6U
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:42:26 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFbr-0005D0-As
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:42:25 -0500
Received: by mail-pl1-x629.google.com with SMTP id s5so13841816plg.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 09:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ms+yJTs9dlVC6uXj7Ea6CaI/OoQaPsfrPHK2DOMEOO8=;
 b=YHRGTo/yK9py5SKy2NL99D0gxrxrwI6/4dlGC3ShPWlRqbGBqG+RSJMKIror4M2pdi
 gAQNpJpB5o2248yDxK4upw4Ekm7eWmKBCdWv7E3M3l5t789hNCaMvecbvxOSe4FB6M6Q
 Vkj67tE+TuVRZvXv7tO0gYY5xnj1ZqmCiEKVLxWGZGlYAPiTVnlSj28edKS6eX4GL66M
 PDZE/fza0vnidNp0xLnFIXZT0O0f5S/7rzJLpjm7Yqoafa1L8QwVfgnipya1kPs0Ux4J
 MsQH5c2zDxg0YUA1LvtOKJ/UZZJ9jivq7RjtiBMcvnItU5oZUlSBv96OulCikW7jRD+k
 S16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ms+yJTs9dlVC6uXj7Ea6CaI/OoQaPsfrPHK2DOMEOO8=;
 b=PSQcN4ihpAFmv4bsJAj3nbJAQfGPQ8TrIlpcfdxaBJBJkjS5q6ecrSmc3o5gEK7JPy
 ThV1HRyIe4f9azj58Og7eLiYqHMHUtvIT+7IRToP1FuPaIubOAYHlUshW+Dty5inUlOa
 exBJaRRJ2NewOAPMdBy0sxBcZAgsboKOEVTLy63Yi3qHIqrokHySF6XpZiGU5GxqpLZ4
 lSnznVSflxv+apUQxg0GDcmE1V+wci9mTYD96spMq5GdALQ9TPDXJT/TDokehjfsswYV
 VO2kQTRJfyE1shNxHB01sqprTY/ITQ7GoCZLp2d6U0T0P0BtY5XPuOHPkeEVvoeBiLby
 bamw==
X-Gm-Message-State: AO0yUKXpz5PHVvu0oqDPQKsOah4+mbBUESJnUixNOJCjUeOMJkqYYh4I
 dyUtmR7OsCvEKaTXtjZ1rW/FPrK6t3sh2FfZSOm+Jw==
X-Google-Smtp-Source: AK7set/mX7eLKwPhYXNHmOkxQMNBbcC8l0oW3y/4lz+pikkYDBLbxJZPJjEC+xz9E2UxOtYT1K4oTlan3azBpnj8OHI=
X-Received: by 2002:a17:90a:9a2:b0:237:5834:2808 with SMTP id
 31-20020a17090a09a200b0023758342808mr645429pjo.0.1677174139960; Thu, 23 Feb
 2023 09:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20230222232715.15034-1-richard.henderson@linaro.org>
 <20230222232715.15034-28-richard.henderson@linaro.org>
In-Reply-To: <20230222232715.15034-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:42:08 +0000
Message-ID: <CAFEAcA8PyBQUS8g-eYJX=z5=Ak+6e4zu32iBJ-bW0NoL3O5wYw@mail.gmail.com>
Subject: Re: [PATCH v2 27/28] tcg: Update docs/devel/tcg-ops.rst for temporary
 changes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Feb 2023 at 23:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rewrite the sections which talked about 'local temporaries'.
> Remove some assumptions which no longer hold.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/devel/tcg-ops.rst | 103 +++++++++++++++++++++--------------------
>  1 file changed, 54 insertions(+), 49 deletions(-)
>
> diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
> index 9adc0c9b6c..53b7b6c93b 100644
> --- a/docs/devel/tcg-ops.rst
> +++ b/docs/devel/tcg-ops.rst
> @@ -29,21 +29,42 @@ In this document, we use *guest* to specify what architecture we are
>  emulating; *target* always means the TCG target, the machine on which
>  we are running QEMU.
>
> -A TCG *function* corresponds to a QEMU Translated Block (TB).
> +A TCG *basic block* is a single entry, multiple exit region which
> +corresponds to a list of instructions terminated by a label, or
> +any branch instruction.
>
> -A TCG *temporary* is a variable only live in a basic block. Temporaries are allocated explicitly in each function.
> +A TCG *extended basic block* is a single entry, multiple exit region
> +which corresponds to a list of instructions terminated by a label or
> +an unconditional branch.  Specifically, an extended basic block is
> +a sequence of basic blocks connected by the fall-through paths of
> +zero or more conditional branch instructions.
>
> -A TCG *local temporary* is a variable only live in a function. Local temporaries are allocated explicitly in each function.
> +There is one TCG *fixed global* (``TEMP_FIXED``) variable, ``cpu_env``
> +which is live in all translation blocks, and holds a pointer to ``CPUArchState``.
> +This fixed global is held in a host cpu register at all times in all
> +translation blocks.
>
> -A TCG *global* is a variable which is live in all the functions
> -(equivalent of a C global variable). They are defined before the
> -functions defined. A TCG global can be a memory location (e.g. a QEMU
> -CPU register), a fixed host register (e.g. the QEMU CPU state pointer)
> -or a memory location which is stored in a register outside QEMU TBs
> -(not implemented yet).
> +A TCG *global* (``TEMP_GLOBAL``) is a variable which is live in all
> +translation blocks, and correspond to memory locations that are within

"corresponds to a memory location that is within"

> +``CPUArchState``.  These may be specified as an offset from ``cpu_env``,
> +in which case they are called *direct globals*, or may be specified as
> +an offset from a direct global, in which case they are called
> +*indirect globals*.  Even indirect globals should still reference memory
> +within ``CPUArchState``.  All TCG globals are defined during
> +``TCGCPUOps.initialize``, before any translation blocks are generated.

We could split out the definitions of the different kinds of
variable into their own subsection "TCG Variables"...

> @@ -57,11 +78,11 @@ Intermediate representation
>  Introduction
>  ------------
>
> -TCG instructions operate on variables which are temporaries, local
> -temporaries or globals. TCG instructions and variables are strongly
> -typed. Two types are supported: 32 bit integers and 64 bit
> -integers. Pointers are defined as an alias to 32 bit or 64 bit
> -integers depending on the TCG target word size.
> +TCG instructions operate on variables which are temporaries.

...and then we could say here "TCG instructions operate on
TCG variables", avoiding the slightly confusing "which are
temporaries" that suggests that globals and constants are
not included.

Alternatively we could perhaps explicitly list them here
"operate on variables (TEMP_FIXED, TEMP_GLOBAL, TEMP_CONST,
TEMP_BB, TEMP_EBB)".

> +TCG instructions and variables are strongly typed.
> +Two types are supported: 32 bit integers and 64 bit integers.
> +Pointers are defined as an alias to 32 bit or 64 bit integers
> +depending on the TCG target word size.
>
>  Each instruction has a fixed number of output variable operands, input
>  variable operands and always constant operands.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

