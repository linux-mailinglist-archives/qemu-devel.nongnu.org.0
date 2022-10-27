Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D460FF52
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:32:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6i2-0007R6-7r; Thu, 27 Oct 2022 13:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1oo6ht-00066j-I2; Thu, 27 Oct 2022 13:30:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1oo6he-0000Vz-0l; Thu, 27 Oct 2022 13:30:17 -0400
Received: by mail-ej1-x632.google.com with SMTP id n12so6614538eja.11;
 Thu, 27 Oct 2022 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HJO2tKtQ7C9PRCed4J1puz67aPPWiZbJVdU6xmlhOQ4=;
 b=ZsBDTLLOEnzDpHQOwtv4xVaZGSgC8G713gWw05yvoj688VDP4G5z+/Tf17DddlR54y
 0387i8TgWHZDCyvy2e+15HN0oPRtEBZjMIYcIBzGq22mtz2mlHX5ixJBvhV0jdZg7gFT
 Z7Nrsq18S97H9pmjqMKhV+p9sJQYZL+4K60ABB++OI21CF6BiuwiN9T11jLrmCakEJJO
 KFkfHXCdNMutMEBoZs2dS1VWsN0U4Zk27arBZaO3bNuHQI6vUk//iw6lrN+fe5OQj1ml
 OQSikuVOlaCmZwWJciVHU8u26pesemVvaeEWEQSZu3telq7EZ50HOzGgYYM0SiN9Q3JS
 /nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJO2tKtQ7C9PRCed4J1puz67aPPWiZbJVdU6xmlhOQ4=;
 b=54Sulr3MJY0RrecwxLvmWxxJID++NVo0eQnMTI1udTiancdsNU9oTxNmA7AjIsDZBm
 iKHCnqsSJfEnGXGn2O1HXL3NhzlXM3B5dhk7GAz1jdFQ4AQl//hOWMMkQkkVMQ79GqTd
 glTzlQSl+OIpTy9X6IMvBPc5Vb8CJrcv9/MPhmqoDGI2ugQCDQJdvQ1VPSvg62VNE/5j
 o5ssMcsN8Pyf48cItiYT0ALBbRzbQaKkw+raCDiwMi59xb4p1NMct+Fm7I9WFtnVE/JF
 a/i7c5afwUtRoaecFNl1ldyC7OILyWSdXnyQxkij/pOImazJUzM5Rrmwd23hyHiD1413
 /h8A==
X-Gm-Message-State: ACrzQf1m9E3bbBCLJznplQq104XKy1WdKm4M6cTWWFjadlYPCrP/E2xH
 D9f1atq5E90nSeY8Xewc4pNgdRSx5NGcjss6hUo=
X-Google-Smtp-Source: AMsMyM61Wm48EhptcHvWnPLi2PdqKHCI6e9geSNokXRlGLIGFqiXkLcn8FMgSRzbrZQ/72Ba6NUlZlUookoDORnoR9Q=
X-Received: by 2002:a17:906:6a09:b0:78d:ed9c:d880 with SMTP id
 qw9-20020a1709066a0900b0078ded9cd880mr41646827ejc.424.1666891799237; Thu, 27
 Oct 2022 10:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220527181907.189259-1-richard.henderson@linaro.org>
 <20220527181907.189259-58-richard.henderson@linaro.org>
In-Reply-To: <20220527181907.189259-58-richard.henderson@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Thu, 27 Oct 2022 20:29:47 +0300
Message-ID: <CA+4MfE+XFOXgskehNoXYkVXx81ffvNAXTwgxuQaQk1utQvfyow@mail.gmail.com>
Subject: Re: [PATCH 057/114] target/arm: Move sve zip high_ofs into simd_data
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 27 May 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is in line with how we treat uzp, and will
> eliminate the special case code during translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Sorry, a bit late, but I believe this change broke the implementation
of the ZIP2 SVE instructions:

>  target/arm/sve_helper.c    |  6 ++++--
>  target/arm/translate-sve.c | 12 ++++++------
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index e0f9aa9983..3bdcd4ce9d 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -3382,6 +3382,7 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
>  void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
>  {                                                                    \
>      intptr_t oprsz = simd_oprsz(desc);                               \
> +    intptr_t odd_ofs = simd_data(desc);                              \
>      intptr_t i, oprsz_2 = oprsz / 2;                                 \
>      ARMVectorReg tmp_n, tmp_m;                                       \
>      /* We produce output faster than we consume input.               \
> @@ -3393,8 +3394,9 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
>          vm = memcpy(&tmp_m, vm, oprsz_2);                            \
>      }                                                                \

Unlike the for loop below, we are not taking the odd_ofs into account
in the 2 memcpys above. As an optimization these memcpys only copy
half of the vector, so when the instruction is using the same vector
register for 2 of the operands, and odd_ofs is not 0, we end up
reading the upper bytes of tmp_n/tmp_m, which are uninitialized
garbage. (Which is ironically a good thing in this case, since
non-deterministic incorrect behaviour was easier to find than
deterministic wrong results)

>      for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
> -        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
> -        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
> +        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
> +        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) =                    \
> +            *(TYPE *)(vm + odd_ofs + H(i));                          \
>      }                                                                \
>      if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
>          memset(vd + oprsz - 16, 0, 16);                              \
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 1e6bcedb9d..c2ced3e2bb 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -2298,9 +2298,9 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
>          unsigned vsz = vec_full_reg_size(s);
>          unsigned high_ofs = high ? vsz / 2 : 0;
>          tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
> -                           vec_full_reg_offset(s, a->rn) + high_ofs,
> -                           vec_full_reg_offset(s, a->rm) + high_ofs,
> -                           vsz, vsz, 0, fns[a->esz]);
> +                           vec_full_reg_offset(s, a->rn),
> +                           vec_full_reg_offset(s, a->rm),
> +                           vsz, vsz, high_ofs, fns[a->esz]);
>      }
>      return true;
>  }
> @@ -2324,9 +2324,9 @@ static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
>          unsigned vsz = vec_full_reg_size(s);
>          unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
>          tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
> -                           vec_full_reg_offset(s, a->rn) + high_ofs,
> -                           vec_full_reg_offset(s, a->rm) + high_ofs,
> -                           vsz, vsz, 0, gen_helper_sve2_zip_q);
> +                           vec_full_reg_offset(s, a->rn),
> +                           vec_full_reg_offset(s, a->rm),
> +                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
>      }
>      return true;
>  }
> --
> 2.34.1
>
>

Best Regards, Idan Horowitz

