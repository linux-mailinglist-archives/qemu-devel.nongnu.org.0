Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53B5FB63B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:01:52 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiGlT-0003Ev-IU
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiGbR-0003iW-Ea
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:51:34 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiGbO-0005Yl-4S
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:51:27 -0400
Received: by mail-pj1-x1029.google.com with SMTP id b15so12713291pje.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lz0/Lo4+fsY5rZHBa89zwNXemdFwSrwJKnayi2yK5Mk=;
 b=nyEk9eCpGLMaZEnz+ORkRq2yGblv8m6Mf1v6spsTNcaskQuz8lb0twZle+7h5aY6zA
 oDvceM46W0rxalLZnB6S0yUpsCibWENCu8HlJ0bDG28wA3A9COIejytRZoBwVxFMy87B
 Os8vXXuAHD3YdqCpJY3Fhk9PTCd8tazCtfOO1O4YVujSKu8ctGx2LH47BZy/vN0LS77M
 GU/9xDvm3gpZFTpQ5WuF/JkilDnOp7LA+yQLq4mdiRapsJIh+1R5aqcv0zsaH7Aq8ehX
 +HFE2n6UvNizzbH6eYGjkMPE7FsJjSqwyY0UZBW8u/jkG+IwCTyUGsD+sUP0zEZGOuxD
 +vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lz0/Lo4+fsY5rZHBa89zwNXemdFwSrwJKnayi2yK5Mk=;
 b=gSQAZvIqHtfyhEk1TCxa6g7Il4ExuARlyyD4GntN0qWTMYkCc6q9O9hEP/AkI8b1GL
 vX0DTp9VwZBcvOl8qQe+djKh9jue2h54ywMfUJLwMVFP582ECysx1XXjnPgS1tYOd7Q/
 /xyL1srx60140lXZOljo73vbWcl0cZcqG5D71sUhAPGWdq2KsNZskPpwRIAdm9r/ob+o
 EIm8QVGiJNB0TfZ42jykU1J4UbwdV4kQVrJ75Gr+N60ztQijeaFSTD7frNT7kCL6C1Gh
 LNliQqKz1CP1rKJm4VcNlN7AQGNM/oEZfnem8pjpup5kNPWHq2rId+72ZLjId6Emc3QT
 ARSw==
X-Gm-Message-State: ACrzQf3zG20ql3piouNBRQAETjWdCcJTGzplyKtDmoBI1XXFWIp+afGl
 ePvKVkBIMQSHMkoTM1NmXoh+tU6asRANvl4EToEK7A==
X-Google-Smtp-Source: AMsMyM5wGtGCLE/fdz0veCyq6xQIYG/FLR6YcW7BpDUtJKdeuyLW1uV/HVCL/fkGf9BZk4vQXmZCtXcBmMEb5q2g/2k=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr27494480pjb.19.1665499884352; Tue, 11
 Oct 2022 07:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-9-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2022 15:51:12 +0100
Message-ID: <CAFEAcA_0ZbNpZKyWdQWhh80dc+Y2R08UH9RWWzBOVOsDdWPi1g@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Sept 2022 at 23:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index fd35db8c8c..050da9e740 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -276,11 +276,16 @@ static target_long jmp_diff(DisasContext *s, target=
_long diff)
>      return diff + (s->thumb ? 4 : 8);
>  }
>
> +static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long =
diff)
> +{
> +    tcg_gen_movi_i32(var, s->pc_curr + diff);
> +}
> +
>  /* Set a variable to the value of a CPU register.  */
>  void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
>  {
>      if (reg =3D=3D 15) {
> -        tcg_gen_movi_i32(var, read_pc(s));
> +        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
>      } else {
>          tcg_gen_mov_i32(var, cpu_R[reg]);
>      }
> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, in=
t ofs)
>      TCGv_i32 tmp =3D tcg_temp_new_i32();
>
>      if (reg =3D=3D 15) {
> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
> +        /* This difference computes a page offset so ok for TARGET_TB_PC=
REL. */
> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);

We could rephrase this one also to not do the "pc_curr - pc_curr" thing,
the way we did for BLX in patch 6, right ?

thanks
-- PMM

