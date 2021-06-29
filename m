Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739353B7354
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:38:30 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDwa-0000K7-Q6
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDux-0007AZ-QG
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:36:47 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDuw-0002SV-0S
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:36:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id o5so11380913ejy.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tKGD3Go6x/1to6gDwysVGeFKBWd0xXzMfiPSrKYc6g0=;
 b=J41YGTlIRlaX5uZ5nz294JbkmGa6N2s4bJDzfaGGKkjXlRjU8cVc5iwY8DC47rtqKh
 xYIo1AC6DyQwmC8CbmyMjwnch9UIqLWhzWv/gZs+t0m+zjRr9A0JXvNZ/AmSlwto9h8b
 zViZkZJAgtYdpzWya5bxzxAEiCwhbVMSRW1AFCh6RW6cHvQpwduu5oWZglRCBbnU+5Mq
 ud8v1jNYM8Hf1ZGyFZpSe07RAGSDaJcpsgorAmh9bWYjfMgj5GKQJY1y/oWQv2Dt1ttW
 2K3PmsIhLnmMfoXgaMjYLSqS9THP2NLFYQRmSJOXgNrb3YwoEZg/C2m1p6UopWba1kCA
 6rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tKGD3Go6x/1to6gDwysVGeFKBWd0xXzMfiPSrKYc6g0=;
 b=nOWuWrOOmjH9z2jXh2K6Jx/5hIJb3Oi+TYQEauraz09Aud2j6sPZy+/y7pPdH7X+SJ
 s/6XWUGNOSZA8Fw2MiwDR2FFTQGCvKI64I20dymgMS0RqMfMn3z3u/99M6aIH9oay3HX
 3v29PlMUA5KPEdqADc7hhWtNWWysKxyGiyPfn1XyiK+k+i/e3v52LQG9uZghUuBQ5KRd
 l5jxZkXLOlT6YKT+/VqSmEXSH0WrzdvDq0EinNFB4JnQuUxBL/BV6Q7cXJ77hGLhhuwR
 6wXW0svPM9zYAB3IDMiZrtdsSSK45LxytEB4mRRgHk4iibV4mJq8asbrIwXj19CxI9uj
 65+A==
X-Gm-Message-State: AOAM531KVBS31hPP/+85cryR8T8o1iBkBzusYeJA9qZbKfoLIDEtqGo7
 MAJytgd5Xnfts8yYmJA5yP5vZhDqSeUXMFofwodA9w==
X-Google-Smtp-Source: ABdhPJwpQyz2r4HuHvkwSZJVFM7xNfiCo3EHCJyFezu7HoAcmXLkV53WI0WMlKg89e7LGOAGU7/ofLyMOBjANXID3Pg=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr30347544ejc.482.1624973804056; 
 Tue, 29 Jun 2021 06:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-3-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:36:06 +0100
Message-ID: <CAFEAcA8pbG0kp_un++SzGfyVZw0FOMVU7zdyBCa7YKsCMeAZuQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] linux-user/aarch64: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the rt signal trampoline.
> Use it when the guest does not use SA_RESTORER.
>
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h |  2 ++
>  linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
>  2 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/targ=
et_signal.h
> index 18013e1b23..7580d99403 100644
> --- a/linux-user/aarch64/target_signal.h
> +++ b/linux-user/aarch64/target_signal.h
> @@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
>  #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
>
>  #define TARGET_ARCH_HAS_SETUP_FRAME
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +
>  #endif /* AARCH64_TARGET_SIGNAL_H */
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 662bcd1c4e..65b84eb04e 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -108,7 +108,6 @@ struct target_rt_sigframe {
>  struct target_rt_frame_record {
>      uint64_t fp;
>      uint64_t lr;
> -    uint32_t tramp[2];
>  };
>
>  static void target_setup_general_frame(struct target_rt_sigframe *sf,
> @@ -495,15 +494,7 @@ static void target_setup_frame(int usig, struct targ=
et_sigaction *ka,


A little way up from here there's a comment:

    /* Reserve space for the return code.  On a real system this would
     * be within the VDSO.  So, despite the name this is not a "real"
     * record within the frame.
     */
    fr_ofs =3D layout.total_size;
    layout.total_size +=3D sizeof(struct target_rt_frame_record);

That now needs updating, because we're no longer putting the return
code in that target_rt_frame_record.

I think the 'struct target_rt_frame_record' now does correspond
to the kernel's 'struct frame_record', right?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

