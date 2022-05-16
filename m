Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20391528A37
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:24:16 +0200 (CEST)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdW3-0007bo-5h
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqchM-0004sj-0g
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:31:52 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqchG-0007Gs-3y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:31:51 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i11so27593141ybq.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BhwFkIfQNAq5yHXxfV9Lh2OTcOD/RlLclh9meXl9u88=;
 b=XsovlgD/7D1sS6Kx6EmsFx3zjKNgyg4m3oASzGWo2kyIarbWiwcLcI7i0iaPADyhdW
 eQWJzS+xM8ugHeQ1bdvku6+dnisE2YFolbnWfcayqo2Qoar50HEmS5FHHgSv5L8pupqS
 heRE7fl6DYK51B8Eo7/1VZN8VuS+j0+EsycBXjurn+9/srXh8HuKD4dDr6BeAL6gYad2
 ox7pF4EZsHx7cN4kvPMT5aMxzL0VQLB7SrMx/+D7annSJi/NTYUmV2dpxyvReGEFPbg8
 3tVeC9kbJeHWFzFgOYCt30mJNMOmuKWynUMBb2I8d7Pn0srnPu/BiLiKV9mqZ2QhQfzL
 W6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhwFkIfQNAq5yHXxfV9Lh2OTcOD/RlLclh9meXl9u88=;
 b=4SLcQgZ+Zok3iyxCxQ1PqUHkz2YgwPke0aSZ0xQRbd/oZ4Mo/O4RUMBl3UnMQoKl3h
 IoEuxrCJHRyL9kWn06zyhVWmDkU403TNzKUZEabrs8bSiTOSPF4q3aq8roO594RfZGEb
 QfomEwqJLNVfi+ToSjuTW1mFO1Cn9tQ9NSnTZUC1A2RiNg4a2m9c+h9rHVaJflG9urTj
 vYcWCx+6IRBwv4ZWj8AhhtFttuSzGeTqBjwTq0a0yXyr3m3+40LP48fykqPLHrAuoBv9
 A54JkHUJATOSSOhsTNUF88eemEmMsCutA8Rx6TkOrvUJzWCfR7/uAVqz++OO4lfUBmTc
 iPEg==
X-Gm-Message-State: AOAM530TKKJsJPiNXW2YZC9lHj7nHt/r6t9QXHgEPCTqquQa17kWwJ3M
 Q4T0WAfW1+OxktuE9W5qmxAR7BUi5IaAzvTXMuSI+g==
X-Google-Smtp-Source: ABdhPJxiOC2AcQh+GBpHprfeawhjmCrUtKhfP8LP0o+PocIqMMS2e7kj0rubvHTHtX5t1pEUM6JnP4m2GhFrJrmbNUg=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr4537045ybu.140.1652715104938; Mon, 16
 May 2022 08:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-10-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:31:33 +0100
Message-ID: <CAFEAcA_c1FwZoAFx9S533W6RZPGrvUTN9_jL6rkK=9uxfXF4Sg@mail.gmail.com>
Subject: Re: [PATCH v2 09/74] semihosting: Return void from
 do_common_semihosting
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 3 May 2022 at 20:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the cleanup in the FIXME comment in common_semi_gdb_syscall.
> Do not modify guest registers until the syscall is complete,
> which in the gdbstub case is asynchronous.
>
> In the synchronous non-gdbstub case, use common_semi_set_ret
> to set the result.  Merge set_swi_errno into common_semi_cb.
> Rely on the latter for combined return value / errno setting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/common-semi.h     |   2 +-
>  linux-user/aarch64/cpu_loop.c |   2 +-
>  linux-user/arm/cpu_loop.c     |   2 +-
>  linux-user/riscv/cpu_loop.c   |   2 +-
>  semihosting/arm-compat-semi.c | 571 ++++++++++++++++------------------
>  target/arm/helper.c           |   4 +-
>  target/arm/m_helper.c         |   2 +-
>  target/riscv/cpu_helper.c     |   2 +-
>  8 files changed, 278 insertions(+), 309 deletions(-)

Oof, this is a big patch. I get that to some extent the
switch from "return the x0 value for callers to set" to
"leaf functions set x0, everything returns void" has to
be done as one patch. But for instance this bit:

> -static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
> -{
> -    if (code == (uint32_t)-1) {
> -#ifdef CONFIG_USER_ONLY
> -        TaskState *ts = cs->opaque;
> -
> -        ts->swi_errno = errno;
> -#else
> -        syscall_err = errno;
> -#endif
> -    }
> -    return code;
> -}
> -
>  static inline uint32_t get_swi_errno(CPUState *cs)
>  {
>  #ifdef CONFIG_USER_ONLY
> @@ -290,28 +276,29 @@ static target_ulong common_semi_syscall_len;
>
>  static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
> -    target_ulong reg0 = common_semi_arg(cs, 0);
> -
>      if (ret == (target_ulong)-1) {
> -        errno = err;
> -        set_swi_errno(cs, -1);
> -        reg0 = ret;
> +#ifdef CONFIG_USER_ONLY
> +        TaskState *ts = cs->opaque;
> +        ts->swi_errno = err;
> +#else
> +        syscall_err = err;
> +#endif
>      } else {
>          /* Fixup syscalls that use nonstardard return conventions.  */
> +        target_ulong reg0 = common_semi_arg(cs, 0);
>          switch (reg0) {
>          case TARGET_SYS_WRITE:
>          case TARGET_SYS_READ:
> -            reg0 = common_semi_syscall_len - ret;
> +            ret = common_semi_syscall_len - ret;
>              break;
>          case TARGET_SYS_SEEK:
> -            reg0 = 0;
> +            ret = 0;
>              break;
>          default:
> -            reg0 = ret;
>              break;
>          }
>      }
> -    common_semi_set_ret(cs, reg0);
> +    common_semi_set_ret(cs, ret);
>  }

seems like it's just inlining a function, renaming a variable,
moving the point where we initialize it around a little.
That could be its own patch, right?

thanks
-- PMM

