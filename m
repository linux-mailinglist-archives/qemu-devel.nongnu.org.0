Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A5694D43
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRc17-0006L4-B6; Mon, 13 Feb 2023 11:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRc15-0006Jr-HF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:49:23 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRc13-0004ua-8Y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:49:23 -0500
Received: by mail-pl1-x635.google.com with SMTP id e17so5238727plg.12
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676306959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9oSxE1vrVPxPfrXG19eGEaiD7f9wQZsVVjsf5M3zrgg=;
 b=HEi9A8SljVcUTnQFEUq0rMe6tVvSLzR8BxxZqk056R9aAitm/obZWzgfNvVmq4x1EP
 8FBNq+XgZktArqivciPtN8nVm4afRnYZVKkFGYRvjLILhG5FIOUSKEBGixtb4pHmbo4G
 PP+hrUL7Yhj+dlHQfZO4D27NTeH5pwojfClb65JpgFWc0BwS58d87S5euHYtX5sNwB0h
 SXQRM/RtdbMvuh9u9olcJnqz0qwgYjLf3fwkG0NNIwX8NQpop483T34WbD8CpAUFq4b2
 gLxZVeEGpKTyBGTUCs2gIL+Rjjy+6YKTTHa4KEgwY9ynskNxmw7OJ0sYhMbJ9OC5yFhU
 JEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676306959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9oSxE1vrVPxPfrXG19eGEaiD7f9wQZsVVjsf5M3zrgg=;
 b=K3cz8eytfw6rSWw3GK5+hl3Dbv3wZM4k/aR9awDe7/yuVXb4BHOSTcvV13sFFASKLk
 OhMvuJJl2o7Hi5tq/sZDN+HtkrNjwZ4HIe7h5xH/IFmfmtjfeiMg01SRNh2PZ80sbnN4
 loCnqbdNlWIZmozObx+56ecsK/JBgZ6yYzPP/4VgN7nCGcdz44WrQOM05x5NyFMs+LpT
 Ex4Jv07i9HwI1w0WeNAs0ZpW4C8g2KqV8CdgnPR+CEvWf5gI4lBTDWjC0klWOyUxbUmG
 Ih0NHSkU6suFQXLXGLa4c3+xaBmRQlzTYoGMZfGvkEU1uttVADkFbTUboqtGcOrQ0dgl
 UIeg==
X-Gm-Message-State: AO0yUKWEqofl356x86rXdjyl/uLYIacu9rE0o5WKEFv0mGRSil4wA/nu
 x019DAiToliq6o/xH4e00A0vXRIrDzG8ktSlkjzFbA==
X-Google-Smtp-Source: AK7set9VkRN8veRSF8/3GGHS45PRmOGMBwlvFSXSCFUt/Kk2fv72qKQIoPKF2jngG9p8FAYV1If/sbPVOUwukv8Y07s=
X-Received: by 2002:a17:902:7884:b0:19a:721b:bce1 with SMTP id
 q4-20020a170902788400b0019a721bbce1mr2709678pll.23.1676306959430; Mon, 13 Feb
 2023 08:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-5-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-5-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:49:08 +0000
Message-ID: <CAFEAcA9ohkUpSbgwW=GdZBuMP4ArbnVa5hrOaxGzmXsRdAAVRg@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Implement v8.3 Pauth2
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index a83956652f..6ebf6df75c 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -349,7 +349,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>      if (test != 0 && test != -1) {
>          if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
>              pac = 0;
> -        } else {
> +        } else if (! cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {

I think we should write this set of conditions as:

     if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
         /* No action required */
     } else if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
         pac = 0;
     } else {
         /* Note that etc etc */
         pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
     }

I know this isn't the way round the pseudocode does it, but if we do
it this way it means we don't need to have the weird special case
where we do an == check instead of >= in the epac isar_feature test
function.

>              /*
>               * Note that our top_bit is one greater than the pseudocode's
>               * version, hence "- 2" here.
> @@ -362,6 +362,8 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>       * Preserve the determination between upper and lower at bit 55,
>       * and insert pointer authentication code.
>       */
> +    if (cpu_isar_feature(aa64_pauth2, env_archcpu(env)))
> +        pac ^= ptr;

All if statements need braces, even one-line ones.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

