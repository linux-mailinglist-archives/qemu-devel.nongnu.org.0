Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07053F63AA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:57:38 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZk1-0002Qt-Q5
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZj6-0001jc-46
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:56:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZj4-0000H5-7r
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:56:39 -0400
Received: by mail-ej1-x62c.google.com with SMTP id e21so29777009ejz.12
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5bUyq8zxbTaPyijso8rgI91HmEQJwJLBviTOSbjA9cQ=;
 b=MZx30FdqcvbF/icI9mXrtpoke89eGqfpoLQmqAAtPJo+gbvAFsCbM8mBx7tl0QKfKF
 RWTC14/4opEUacPuO4FmZxvuwj0nn7oRf7jh4iyxRxoLJfWayrVUe/CxRv1eErzJxiwJ
 HB94h4zaKKUNhDK4b6rhYZMQ8iYw1h5qfMnEFIB9Idg8CUNCSwQp2C76dxiCQOcxmWq4
 BIx2PPBqGxYTVw4xnVTtZVTN0Tk0s/hOmVKqdBFpZjaNqp892m5LHOM1+NlF83NH2K9A
 Efa7Em0jHEyqzAgYRQfQ/9ushPcgDkMwZp94XiBmQp6OvhZybuwr8Cf6P4cM+IVMJ2xF
 NHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5bUyq8zxbTaPyijso8rgI91HmEQJwJLBviTOSbjA9cQ=;
 b=ISGodq5Ds8ptu8Km68qcGcB98PE0vvOxWHP0RnVtWGDQzL2/J0sHfHly96ySZ6OmS3
 LlVFylRj8cfAdKyqXnhbqPggf5y1jTzLJZ4QvIj4Y/uVyXgbtLHlZ1Q66TmoSJSEVamG
 zUo0qmGWEJsjjRN+A9FnB5yPR6Mjvs8+v+molJUZwkJLg0rao7cIGTLKojK5QvuLl4ZK
 4l/7vgDvCVPtLfSxzm7EsYfOUJ25x1h+ppOLXEEgCSBs9LblsRrhRgY7ob+XTzDRaywu
 Jvs2ERRg78q4RHRfFn7r/e83I89niktjLVJuF5NBGwaEUGEYG9w/LLNEDq7uMJxSi0jZ
 J8xg==
X-Gm-Message-State: AOAM532qoU2iK+aZQaPEU11ptS0D6ZAuIIMDzQJ/iY3e9ZelPZKaKaVD
 h3Jc5UF7vHGqGw/EOSbv/JLVVG0l5uiX5MVonFQwvA==
X-Google-Smtp-Source: ABdhPJwc5zb1kFegBxKNGwJCCbWlh/maJRVEQZF+6mqtdr6DCZq7JmhP11R4Ek/eLqqw5tbJiDL4zmIuH6pOQNW/mcw=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr1107146ejc.4.1629824196235; 
 Tue, 24 Aug 2021 09:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-22-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:55:49 +0100
Message-ID: <CAFEAcA9FiqbvCh1xZWdknEJV=jnoxgZqz=ky-A7zXMM+Re74AQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/30] linux-user/microblaze: Fix SIGFPE si_codes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fix a typo for ESR_EC_DIVZERO, which is integral not floating-point.
> Fix the if ladder for decoding floating-point exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/microblaze/cpu_loop.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
> index 9e07e52573..4a75c853b2 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -81,15 +81,25 @@ void cpu_loop(CPUMBState *env)
>              env->iflags &= ~(IMM_FLAG | D_FLAG);
>              switch (env->esr & 31) {
>              case ESR_EC_DIVZERO:
> -                si_code = TARGET_FPE_FLTDIV;
> +                si_code = TARGET_FPE_INTDIV;
>                  break;
>              case ESR_EC_FPU:
> -                si_code = 0;
> -                if (env->fsr & FSR_IO) {
> +                /*
> +                 * Note that the kernel passes along fsr as si_code
> +                 * if there's no recognized bit set.  Possibly this
> +                 * implies that si_code is 0, but follow the structure.
> +                 */

In theory it should: the Microblaze processor reference guide
https://www.xilinx.com/support/documentation/sw_manuals/mb_ref_guide.pdf
defines only 5 bits in the FSR, all of which we look at here.
However our implementation provides two loopholes by which a
high bit might get set:
 * our implementation of MTS rfsr, rX doesn't prevent high bits
   being set by the guest
 * our implementation of gdbstub writes to fsr doesn't prevent
   high bits being set by the guest

I don't know whether the real h/w makes the reserved FSR high
bits RAZ/WI or not; the spec doesn't say either way.

> +                si_code = env->fsr;
> +                if (si_code & FSR_IO) {
>                      si_code = TARGET_FPE_FLTINV;
> -                }
> -                if (env->fsr & FSR_DZ) {
> +                } else if (si_code & FSR_OF) {
> +                    si_code = TARGET_FPE_FLTOVF;
> +                } else if (si_code & FSR_UF) {
> +                    si_code = TARGET_FPE_FLTUND;
> +                } else if (si_code & FSR_DZ) {
>                      si_code = TARGET_FPE_FLTDIV;
> +                } else if (si_code & FSR_DO) {
> +                    si_code = TARGET_FPE_FLTRES;
>                  }
>                  break;
>              default:

Side note: our implementation will never set FSR_DO; we don't
implement the denormal number handling the FPU does, where:
 * operations on input denormals return a QNaN and set FSR.DO
 * output denormals are flushed to + or - zero, setting FSR.UF


Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

