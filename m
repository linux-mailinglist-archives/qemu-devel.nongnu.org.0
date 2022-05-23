Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856DE531127
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:42:18 +0200 (CEST)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8K9-0008T6-6g
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Gv-00078w-JE
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:38:57 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Gt-0000xA-RR
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:38:57 -0400
Received: by mail-yb1-xb31.google.com with SMTP id q135so25448087ybg.10
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+cAlghHtqbFF8bsElpa+5iZHyD0apXcrdgr73SHaN4=;
 b=oEp0tioixwXw84jLmP7w+V92PTDBZqz/q5y8l4aK5APUL2uq7mfg8pQRc8OJRDCJQQ
 hXjG0TuEsDcQCgE3lrYTg0PFqyK6uipNof6iL2KxOZIVD370lcggl8u2vtauZNwqkb+O
 J5z93Qar0qO+LU9gt68BDSVebLRezUNLndRc49I+yqjIQHc1GAzrje4ndpUAvCv202ya
 5KJk4tFIQ79I6SxcvoE/CoAYPQ7XuWQF90kMjeMikCadNMYjyKkQI7qM2Go9DaDreRJA
 ZySIfDiqrvoQgv4DQ1TFVf/4TQ+gUMvDhZbzzbswV+96uqNZFYph5XsCz/OYZSZniEdl
 IC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+cAlghHtqbFF8bsElpa+5iZHyD0apXcrdgr73SHaN4=;
 b=PayJGGJRtPvvOsRBPXUALkV2sEgBCMH+4IXyk4elXCZxPsJkqqPp1znN1Hq5OAa9ge
 Oc/+FW1QLlHvMjaRveXFOSqMMg56QnfLVkBREFyrcsQqKT32oHsfwBCx6pK2o9aEVkGp
 X9AhusjNWs2Hsk1SKDHchnPP0r70fcUMFVAN1KIt2ZteeIp8ORFp3fQec0dz2f96SV4j
 ITgKjf12x6yuoO9EVZ5EJKSl2V3JoCY8nX+XumHoBHo1Z8ymZZih1aw0v0TVynk4F6by
 GWVyuPMDnIkfMqYWvDnl6VIX3tFjtT/wU55u9/q0tDOYD68ipimm2DLnIW0EqIj81ZPl
 NKug==
X-Gm-Message-State: AOAM532xVpWeRofCXK8S9CzESuxtkCg5esjNk2abunliwdLZdnfPZTGt
 5q3EezQGaZGvyF9GwIN/2Nc9ZJx587OmnqtBKcR7BQ==
X-Google-Smtp-Source: ABdhPJys7ltMfYbHZaL7GL5e2zPzRr595pS4OmfBFEsVkwduUYoqOtgVvTh50new/IE5mBZ68GmIX9Doua4rLmqHwYs=
X-Received: by 2002:a05:6902:1021:b0:64f:51d0:f421 with SMTP id
 x1-20020a056902102100b0064f51d0f421mr17299310ybt.39.1653313134658; Mon, 23
 May 2022 06:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-38-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 14:38:43 +0100
Message-ID: <CAFEAcA9fi=NS_Si8DUbhJQtkAg1Zsy3G2evSctXjPF9NuVhGsA@mail.gmail.com>
Subject: Re: [PATCH v3 37/49] semihosting: Fix docs comment for
 qemu_semihosting_console_inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The implementation of qemu_semihosting_console_inc does not
> defer to gdbstub, but only reads from the fifo in console.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/semihosting/console.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 0238f540f4..4f6217bf10 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -41,11 +41,10 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>   * qemu_semihosting_console_inc:
>   * @env: CPUArchState
>   *
> - * Receive single character from debug console. This may be the remote
> - * gdb session if a softmmu guest is currently being debugged. As this
> - * call may block if no data is available we suspend the CPU and will
> - * re-execute the instruction when data is there. Therefore two
> - * conditions must be met:
> + * Receive single character from debug console.  As this call may block
> + * if no data is available we suspend the CPU and will re-execute the
> + * instruction when data is there. Therefore two conditions must be met:
> + *
>   *   - CPUState is synchronized before calling this function
>   *   - pc is only updated once the character is successfully returned
>   *

Most functions declared here do use the remote gdb connection,
so I think that like qemu_semihosting_log_out() (whose doc comment
includes a sentence "Unlike..." explaining this) we should
explain why this is an exception to that rule ("Unlike...")
rather than just silently not mentioning it. Having 'inc' not
be reading from the same place that 'outc' writes to is rather
unexpected, after all.

thanks
-- PMM

