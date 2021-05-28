Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED503944E6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:17:09 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmeEW-0008CI-II
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmeCq-0007UI-F7
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:15:24 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmeCo-0002XH-Jv
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:15:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so2710780pjb.2
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IGiw3G1Vslb4aezE/9aDWjDjnJO920/5eAfwbZRKHc4=;
 b=qhFmSvrwth+g77rBZv1pPmtFJPVh8x0S5C7dwm4IiER8nnEmzwfF9MnZLDvHWGdZfU
 C/TeesiXwnxykEmaJxaUet/nywbZKJvVw2zxPf0nx782p03VAnejKXqDMdBs8EwbgP4s
 9xTAq1P6RTAM+5KuQRfOCqZMmdeiKxrbSFbwsF+YNP+hduKtAakwKkgULGyCbtHeNkLu
 7re/5+SSJ4TwHUM3RtLiW54rMcBAsOWm5Bvy+miqUuz6UR3N1WiU6eQn6FZn8hCyXQJy
 dX6dMR/Nh2NveOU3ds+0qyEPXsMSmJCxbP3erazEpmwJAaRFkR8tNsce2oqJM26Wun7R
 p3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IGiw3G1Vslb4aezE/9aDWjDjnJO920/5eAfwbZRKHc4=;
 b=X2/PrSHneTBW7IM/TKbV3Vx+rMpLHGgVGCmVlrciSakTvsSX6V4hGkxMPxfO18RgJ6
 8SFfq12iwzL4p9twT3IxK5tqaZA6/4QkEtoN/DAY6CrL9K2agkjaZLSaI5YCoEmPwUOV
 DpSE5U2BUlYeIHFLQMp0zKs4GJS8VTdhVjNZK37x2exrizfroL/+Q4tQVqFcQ/5Eky+z
 t6GgNjOJS07GYDKpQG8HJkQKvTaN9kTJadrqG2O+0TltLDptfJjQ4nDJOGV9YDU6tna6
 XQyTBzt2/ix3GD70D6r1swASGWlEisTOrnYfzEZEQ5Rabjbfble26YXzh59a/YP+WIsL
 Vc2w==
X-Gm-Message-State: AOAM532m18ANle1qfqWr6HTKqiZBmOslBlX8xeu0B6KrzBg557I79iud
 T9h424xLm9KCawFGmZv5c9RWcg==
X-Google-Smtp-Source: ABdhPJwPwTI6IjdfZu34381udOca6o+mCg0owubCldYn++dbuFAOs3czBL/Cp/Tt26xKKkJJBNhJpA==
X-Received: by 2002:a17:902:a40f:b029:fe:fee9:92fe with SMTP id
 p15-20020a170902a40fb02900fefee992femr7246098plq.26.1622214920713; 
 Fri, 28 May 2021 08:15:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i11sm1814207pjm.2.2021.05.28.08.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 08:15:20 -0700 (PDT)
Subject: Re: [PATCH] docs/devel: Explain in more detail the TB chaining
 mechanisms
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210528123029.143847-1-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5690d0be-1e3b-a9f7-060a-8d08d9cd6c35@linaro.org>
Date: Fri, 28 May 2021 08:15:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528123029.143847-1-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/21 5:30 AM, Luis Pires wrote:
> +In its simplest, less optimized form, this is done by exiting from the
> +current TB, going through the TB epilogue, and then back to the outer
> +execution loop. That’s where QEMU looks for the next TB to execute,
> +translating it from the guest architecture if it isn’t already available
> +in memory. Then QEMU proceeds to execute this next TB, starting at the
> +prologue and then moving on to the translated instructions.

It is important to mention that by exiting this way, we immediately re-evaluate 
cc->cpu_exec_interrupt().  It is mandatory to exit this way after any cpu state 
change that may unmask interrupts.

This is often referred to as "exit to the main loop" in the translators.  In my 
recent changes to the ppc translator, I introduced DISAS_EXIT* for the purpose.


> +In order to accelerate the most common cases where the TB for the new
> +simulated PC is already available, QEMU has mechanisms that allow
> +multiple TBs to be chained directly, without having to go back to the
> +outer execution loop as described above. These mechanisms are:
> +
> +``lookup_and_goto_ptr``
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +On platforms that support the ``lookup_and_goto_ptr`` mechanism, calling
> +``tcg_gen_lookup_and_goto_ptr()`` will emit TCG instructions that call
> +a helper function to look for the destination TB, based on
> +the CPU state information. If the destination TB is available, a
> +``goto_ptr`` TCG instruction is emitted to jump directly to its first
> +instruction, skipping the epilogue - execution loop - prologue path.
> +If the destination TB is not available, the ``goto_ptr`` instruction
> +jumps to the epilogue, effectively exiting from the current TB and
> +going back to the execution loop.

I'm one step shy of making TCG_TARGET_HAS_goto_ptr mandatory, and I don't think 
it's useful to focus on what the fallback mechanisms are.  In particular, 
lookup_and_goto_ptr will exit to the main loop with '-d nochain'.

The timeline is off here as well.  The goto_ptr tcg opcode is not conditionally 
emitted -- it is always emitted.  Better phrasing:

   ... will emit a call to ``helper_lookup_tb_ptr``.  This helper
   will look for an existing TB that matches the current CPU state.
   If the destination TB is available its code address is returned,
   otherwise the address of the JIT epilogue is returned.  The call
   to the helper is always followed by the tcg ``goto_ptr`` opcode,
   which branches to the returned address.  In this way, we either
   branch to the next TB or return to the main loop.


> +On platforms that do not support this mechanism, the
> +``tcg_gen_lookup_and_goto_ptr()`` function will just use
> +``tcg_gen_exit_tb()`` to exit from the current TB.

Just drop this bit.

> +``goto_tb + exit_tb``
> +^^^^^^^^^^^^^^^^^^^^^
> +
> +On platforms that support this mechanism, the translation code usually
> +implements branching by performing the following steps:

Again drop "on platforms that support", because they all do -- it's mandatory.

It's also very important to note when this cannot be used: the change in cpu 
state must be constant.  E.g. a direct branch not an indirect branch.  A 
surprising edge case here in the past has been a direct branch with a 
conditional delay slot nullification.

Moreover, even the direct branch cannot cross a page boundary, because memory 
mappings may change causing the code at the destination address to change.

> +
> +1. Call ``tcg_gen_goto_tb()`` passing a jump slot index (either 0 or 1)
> +   as a parameter
> +
> +2. Emit TCG instructions to update the CPU state information with the
> +   address of the next instruction to execute

More completely, update the CPU state with any information that has been 
assumed constant.  For most guests, this is just the PC.  But e.g. for hppa 
this is both iaoq.f (cip) and iaoq.b (nip).

It is very much up to the guest to determine the set of data that is present in 
cpu_get_tb_cpu_state, and what can be assumed across the break.

> +The first time this whole sequence is translated to target instructions
> +and executed, step 1 doesn’t do anything really useful, as it just jumps
> +to step 2.

Timing problem.  When the whole sequence is translated is immaterial.  You mean 
the first time this sequence is executed.  Drop the "doesn't do anything 
useful" phrase.


> Then the CPU state information gets updated and we exit from
> +the current TB. As a result, the behavior is very similar to the less
> +optimized form described earlier in this section.
> +
> +Next, the execution loop looks for the next TB to execute using the
> +current CPU state information (creating the TB if it wasn’t already
> +available) and, before starting to execute the new TB’s instructions,
> +tries to patch the previously executed TB by associating one of its jump

s/tries to patch/patches/.  There's no failure possible.

> +The most portable code patches TBs using indirect jumps. An indirect
> +jump makes it easier to make the jump target modification atomic. On some
> +host architectures (such as x86 and PowerPC), the ``JUMP`` opcode is

This detail should be elsewhere. This is an internal choice of the tcg backend, 
depending on the host architecture.


r~

