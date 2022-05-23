Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BD530E8D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 13:14:38 +0200 (CEST)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt61F-0004E5-Fp
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 07:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5mM-0001hm-IK
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:59:14 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5mH-0004Sz-G0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:59:14 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2fee010f509so143121967b3.11
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ixtvlZAOecweODTacxGQolihYXuP5TsvlJj3SalHQY=;
 b=lQS2ie2L8Sesdzf1NiMdy4JaKUAKUjCl5BSZjsmgyGE+0ZvBnvySJ1m9jhtxBcWMBI
 KgUhYJpVSDcvIVIePQigswNcGKRBVCT4AiJG1MaLpjPFFz6h41Yx5fPogbgDYIQQfEsj
 Rj3JwtRPIGXRib/CcomSm3x9OnuYw4rX/cRnpvuvkh8BIHZcT8aApfHRx/71JriZiqIM
 CD0lhZvyu8ArpNyyqOn9PVDCqXwdxmjTW/+MEL3nXGIIiWPqYe9psV+kv21O/8hAmEzF
 cpl5/5MpL1s6t3/isatgFftzMUrxoVWCkXwOYQmIhsMy5eGPxQZ3/Q/dRKAyHa4u92KT
 Z+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ixtvlZAOecweODTacxGQolihYXuP5TsvlJj3SalHQY=;
 b=hPQ5Q+JScfZPjVtn5qtg6iGM1+6PEER+rw/NjGz2U2caGm0Ap3Mr7r/jczZGcSfm3F
 DXDUi99s/AOxGoPXT4io9uN6MhLSDm7Dw/rypiD2OXU9OX9iplpPAaETAtkh1JpqvngB
 oxaaJIE9NRy4oUJaVQP+LydfnFOCp8VIVGZgQ5Cs64b2cGNgNcTMoneHNQ4xoz8sUN42
 iVag9Mmj0ZAN8+K2O1RLK/26hfLkMi9zZy3j8qCjwfl8bwYcHj/2AfQv/KXxMteEJ/p/
 LbTJcaiYys4yA0d+RYxt828+KziWGLPuw1Qsm28qyqDW4WfIBA/olr/J8pYFoUPv/oWk
 QbtA==
X-Gm-Message-State: AOAM532Z+UuNpy3iv8QXj5fwU2fETxL3ae07kcQT2j8O1IkejslG353D
 PloEA95QXp9lDC8fJbREykWVb1ZgrSa+/eZPnJsKcg==
X-Google-Smtp-Source: ABdhPJwa4FO7G5PTqro1jMM9ah7RgNo3F7yP/EJAqgObcPUWScRqp4UUjVlhFWTxao8ClWA0Bx2QlaW/fMhfonQxVwM=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr23221295ywb.257.1653303548346; Mon, 23
 May 2022 03:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-9-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 11:58:57 +0100
Message-ID: <CAFEAcA8oja0sCwyCZgmCMW-y7fXTGhYrOvZAyz4LHtPH9CKzLw@mail.gmail.com>
Subject: Re: [PATCH v3 08/49] semihosting: Inline set_swi_errno into
 common_semi_cb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
> Do not store 'err' into errno only to read it back immediately.
> Use 'ret' for the return value, not 'reg0'.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index c6bfd4d1ba..b00ed2c6d1 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -290,28 +290,29 @@ static target_ulong common_semi_syscall_len;
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

This should be "ret = ", right? (Otherwise I think this fails to
compile. I assume that some later patch has this fix in it.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

