Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C65599EE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:54:55 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ipr-0008Tx-0F
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4inR-0006tD-OH
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:52:26 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:39723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4inP-0004tp-JV
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:52:25 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3178acf2a92so23752037b3.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UNCLn/C/O19fDQ19Wqb4YIh37GCO1L8N6nznv7f0bc=;
 b=lDb9ByyP6jG2ZeAe/3VWfR/9fHTc4nkcNQNiw9+F7sEkVtXPYrn0t5BWVDLotSYU/S
 1aj++Brc72LbzmcNqqsWyNVGu49jEZzRQjrefx71UODrCo2f8TQSjtkvGyYhYnfvBpV0
 XqlH5dHuPiIUV6YG3PArZurGVlFKJNhHlFt0mvUv599uRXC/8jFhN84TF9U0C+de5QzH
 ElotFMbGjCi4pO1s900dZyAAbKis6yE6agpozKmfp1lw00nDTFvOKFVOmNwjE5tGbK2d
 JZGt2br5IcGVuhE/JJZGaKz7BqoaWNplzSQilUaLERplRuFnjQrHmjb/uh7Rpfk7ae8F
 d1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UNCLn/C/O19fDQ19Wqb4YIh37GCO1L8N6nznv7f0bc=;
 b=axR21kwt4mohQR85N+ipYrh4wD35t3kzy2OJx1fXF87H9D6ZkCxMU5o/hLVJAxeChF
 u0Sd+PPOTjq/vSDt9lCQoqVLR70bL8jNiYEVWQ2za22IKDT6AZf81B2hXsuecexm1tao
 9tQXJTNXl61UsENGfh5dKLFHF2ROlHm34IPrdpAeQe7ABNrkXbbEp29EomOLBT6dpVfi
 TK8zLBc47vTRHXWwlK6RpePwMGQkqyi7T0y7ZUf1YzqAzoZgM+UWZ1ntUUKl478P7Jf+
 WVuOvmp6zHvKDUT+nWDdECRZml76vumiEv2I0KUSR9HRWWtWdo4ER/FVyH9qdfCHM/82
 WTnw==
X-Gm-Message-State: AJIora+pjFOBYndl3izYCgCrqGRhJCrzLm5EaIj7v7rq3m8CWniwlSCp
 Wy+Bnp31E8iBBF5zF+Dmavi6Z/ngHyWVGgKc1iO+BAZbfE8=
X-Google-Smtp-Source: AGRyM1v7nbFH/OzvDt0YevZfEi6i9QcmNlpMdABmxdwg1bDlG0vsJs5+8AnSUPjPhLdgcp7eeknrkR8Mh5SH800dzFw=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr17329249ywd.347.1656075141832; Fri, 24
 Jun 2022 05:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-35-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:51:44 +0100
Message-ID: <CAFEAcA_dMOKdzt08KwLb=pJTyMFw8PQyPhC7Ni253GLVGvay2w@mail.gmail.com>
Subject: Re: [PATCH v3 34/51] target/arm: Implement PSEL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Jun 2022 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Would be helpful to note in the commit message that this is an
SVE instruction that operates using the SVE vector length but that
it is present only if SME is implemented.

> +static bool trans_PSEL(DisasContext *s, arg_psel *a)
> +{
> +    int vl = vec_full_reg_size(s);
> +    int pl = pred_gvec_reg_size(s);
> +    int elements = vl >> a->esz;
> +    TCGv_i64 tmp, didx, dbit;
> +    TCGv_ptr ptr;
> +
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +
> +    tmp = tcg_temp_new_i64();
> +    dbit = tcg_temp_new_i64();
> +    didx = tcg_temp_new_i64();
> +    ptr = tcg_temp_new_ptr();
> +
> +    /* Compute the predicate element. */
> +    tcg_gen_addi_i64(tmp, cpu_reg(s, a->rv), a->imm);
> +    if (is_power_of_2(elements)) {
> +        tcg_gen_andi_i64(tmp, tmp, elements - 1);
> +    } else {
> +        tcg_gen_remu_i64(tmp, tmp, tcg_constant_i64(elements));
> +    }
> +
> +    /* Extract the predicate byte and bit indices. */
> +    tcg_gen_shli_i64(tmp, tmp, a->esz);
> +    tcg_gen_andi_i64(dbit, tmp, 7);
> +    tcg_gen_shri_i64(didx, tmp, 3);
> +    if (HOST_BIG_ENDIAN) {
> +        tcg_gen_xori_i64(didx, didx, 7);
> +    }
> +
> +    /* Load the predicate word. */
> +    tcg_gen_trunc_i64_ptr(ptr, didx);
> +    tcg_gen_add_ptr(ptr, ptr, cpu_env);
> +    tcg_gen_ld8u_i64(tmp, ptr, pred_full_reg_offset(s, a->pm));
> +
> +    /* Extract the predicate bit and replicate to MO_64. */
> +    tcg_gen_shr_i64(tmp, tmp, dbit);
> +    tcg_gen_andi_i64(tmp, tmp, 1);
> +    tcg_gen_neg_i64(tmp, tmp);
> +
> +    /* Apply to either copy the source, or write zeros. */
> +    tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
> +                      pred_full_reg_offset(s, a->pn), tmp, pl, pl);
> +
> +    tcg_temp_free_i64(tmp);
> +    tcg_temp_free_i64(dbit);
> +    tcg_temp_free_i64(didx);
> +    tcg_temp_free_ptr(ptr);
> +    return true;
> +}

Suspect this would be clearer to read as a helper function, but
it's not that long as a series of TCG ops, I suppose.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

