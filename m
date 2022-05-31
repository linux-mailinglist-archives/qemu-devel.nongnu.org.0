Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECD53908B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:19:03 +0200 (CEST)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0py-0007h2-9Z
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0mQ-0004iu-7B
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:15:22 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:40741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0mO-0003rt-HI
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:15:21 -0400
Received: by mail-yb1-xb36.google.com with SMTP id w2so1854338ybi.7
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0JqNDM0y09jDN37H9dZQU9BKuW7rzMSlSwl7tUG0g/4=;
 b=TtVvADnWTMKIMcq04y3HWxdVw4CRrUqoeyjI+mu6e6bHh50wbr96ICE7ans0Dj9+SR
 lMpUJgkOw5YoVvwyGF8dUuB31hsW11hTVvUoG4TDUf4uOZihaLBh2Ic/n30kGF6JNSpE
 dba5GLywbxYKFojvtafri0j5093lvXjjePjfAZP6anncC0DG9PgcxqnHcVsuK3OuvRwO
 pYz0tXnr2GhUcsh3iMwUlao1o8MVdMcKNQ4aNfo6dolxnZI2TOHtGLHXvQ3DTrzWRA2+
 AQuOCyzOUao+jdVorVi986RU36+HcdNLFjzczv87KltkasZjB0kfjIVBhDKuUVjy2Pc4
 8+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0JqNDM0y09jDN37H9dZQU9BKuW7rzMSlSwl7tUG0g/4=;
 b=MIggcGHZ/o7lZhdiLBqdAXsyOCVhA81Rf0qOJ4asZnuxlt8teZvtof2hJPGUI3N4q6
 lmZdlTb1sO76KPBp44gVw8T1xMGHnKdpod1ZA71gBsUBQMK6V3UB4lctfKs+OrOyPugE
 KI9SqY3dRaPzVwlNsbIs2N4nQDLJbjliH9A/68K0oxXEboRBPpikRBWg1yPVbuyVY0J5
 y6cSUgzxF31fS40NF36eKw/AOBoDwpw60HOyoF4UXP6L5uMEQoXZ1N92BWt+d/iQ8MTN
 ggVBKhzRVuG2gHGxoee8Pivpn+9lrTmQgMneyg6b9HbluPhEdicMphwblAMpw3tTgWd+
 aoIg==
X-Gm-Message-State: AOAM533onGyOtG05EmGsun3FjQJIfTcfoT99FvPk7aKaEjwpOZwk9wBL
 f5Op3gnJmHHVxeYyhF73OO0uhddkrSclkRTVDFf1Jg==
X-Google-Smtp-Source: ABdhPJwnabjv5i4fU6s15YdJvDoeoucKBgMlnaOa31SMMlKCs/C6iN7XR9DX4ipq014Zo7GzFk1jPTMcoisyXjVEcBY=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr15217682ybr.193.1653999319416; 
 Tue, 31 May 2022 05:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-3-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:15:08 +0100
Message-ID: <CAFEAcA-O7wCcgOE8XMWF0HqDg95TaLnzEnxzGF4a8F84L9NE2g@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] linux-user/aarch64: Use SVE_LEN from hflags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Fri, 27 May 2022 at 19:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the digested vector length rather than the raw zcr_el[1] value.
>
> This fixes an incorrect return from do_prctl_set_vl where we didn't
> take into account the set of vector lengths supported by the cpu.
> It also prepares us for Streaming SVE mode, where the vector length
> comes from a different cpreg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
> index 3f5a5d3933..fcbb90e881 100644
> --- a/linux-user/aarch64/target_prctl.h
> +++ b/linux-user/aarch64/target_prctl.h
> @@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
>  {
>      ARMCPU *cpu = env_archcpu(env);
>      if (cpu_isar_feature(aa64_sve, cpu)) {
> -        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
> +        return (EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1) * 16;

I think env->hflags should be a private implementation detail
to target/arm and it's a bit odd to see linux-user fishing
around in it directly. Can we hide this behind a suitably
named function, please ?

thanks
-- PMM

