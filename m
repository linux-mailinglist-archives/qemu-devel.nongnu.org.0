Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1F6944E4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRXOw-0004hY-GP; Mon, 13 Feb 2023 06:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRXOu-0004dT-Ez
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:53:40 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRXOs-0005RA-Tq
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:53:40 -0500
Received: by mail-pl1-x633.google.com with SMTP id z1so13224956plg.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 03:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VOMnHnZV05OyCaYg6SIuHfWB0UqvI5cp8FxIA8KHZxU=;
 b=kHwWuGr8Mx2CU5vbfYgdalvaCEziMyBlanw2dSHtKFNH9WQ2//QlygOQGI85r+ounH
 C9KY4Em6dohEsyWn61j2eOGOpt2OPb8Lz+p6MW2XIJcyGnxXsWG1nZNXKq52DCXXTvgn
 BzyKj75VzAs629hCksIZiAk9UZZz51zTZQUkiH5NXxUIx/S3yRIhLZlOf40wyCo0J5YR
 gPHPV5uhrg+2t9rZeMtLx+oOzog7CJRTQV1crC72baCpJgBhlmd13wM4/cL7tFo/Nqct
 oiuFIzevoWUXOYWPnicf4EEvDB+tlWY8uTVpXcZOpNSO9bcaSxYGo2baIHwpzjCRyeR0
 OJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VOMnHnZV05OyCaYg6SIuHfWB0UqvI5cp8FxIA8KHZxU=;
 b=cf7Rof0jSCqEYf0kYFNeWnSMWzVCQpnIv1YYSa46aub86yVNMi9w6T6N4MpsTCgbXS
 jKrdBzcXzzNnfksJ3++4mHWWNorv/NUf/GWZgfiCwy5DBcYMChNgJT1k56PdyHk8IZzU
 wR8Igdw6GBlvPR5tRQfb9/5Rk/iz6bH4WsT5Vd16BXhFBZy/vTB/nESIvVkw707mjmGJ
 MBqk3+mTgurlpEQMQ1mVqgnaRukvHPpLhV4Q0NZloHNhO7Umw1e4hGCKbIs0mB/u2+2b
 e5p9X2dhbJXIvvYwjoVFpJ4UZ0O1usbu7XL1BfJVqnDBkiqnH0HRhxL+maysKbK0ho4t
 ds4Q==
X-Gm-Message-State: AO0yUKXLvzEu7T2HYvkD75mMw0FSmXKYjNrqUkVSEN/lytHJEkaTWH+2
 MK2L0PzORsW9doHJF7wly9gIbj51A7wfsNvihR/uLg==
X-Google-Smtp-Source: AK7set/dxy3IV9azT8RoogHKIgnqP83c8vLrYcnQzU2eZtyAq5FTKdUPUlOY9mO0d3FVP/Ue4BwcyDvlqVFLZqZmjPg=
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr3349984pjn.89.1676289217626; Mon, 13 Feb
 2023 03:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-4-fcagnin@quarkslab.com>
In-Reply-To: <20230114161302.94595-4-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 11:53:26 +0000
Message-ID: <CAFEAcA8F4hScdDbaGNJtuu+1LwV+QkLCfcN2zUqOveNKjufoGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hvf: handle singlestepping over instructions which
 trigger a VM exit
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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

On Sat, 14 Jan 2023 at 16:13, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index c63e8da6a5..87c531508e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1807,6 +1807,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>          pc += 4;
>          r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
>          assert_hvf_ok(r);
> +
> +        if (cpu->singlestep_enabled) {
> +            ret = EXCP_DEBUG;
> +        }
>      }
>
>      return ret;

I think this is probably best folded into patch 2 rather than
being a separate patch.

thanks
-- PMM

