Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0356578A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:41:24 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MKI-0008IG-EO
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LlW-0001yZ-38
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:05:26 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LlR-0000HX-NP
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:05:25 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c89111f23so31272687b3.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XGmlFLlU2LAAWVA/Nr8RG/Te0V+qJbDjFOPQ71wys8=;
 b=jex8S+PnarQ0VM9QY2NtuR/BZVPQ9Tw5WetOeMiqnSvF/yLQqD7fBrCfgIrL0VTrJ5
 bHrMWBr3oMhxmhhOTvayYB2it0od/TPOvfJrV/4YIp9L0RsXQfPFU4MQ4TqMnbzZut55
 G98zKO3n3iluP6x9fznV6lASWtgZhlDsU4dbh5PRwVvVU0GZJkV2FgfyI5/+ookH0F6U
 IjjhuBQmMiUY1SsoSZFG8eg0c+cNaFX3yBGYuy5jBFT4R9NqjFbfI6wTKpyKNLGiB52V
 0tjRV3kSfpblRIJmDzFS3J698pnuAWizHdeelK040thqOPEQ91l2TBl3VpO4x+YnuZC6
 XDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XGmlFLlU2LAAWVA/Nr8RG/Te0V+qJbDjFOPQ71wys8=;
 b=yaGsZZxhKc9jIMLzlXojxT2OWMdY+VWa9Ggsp7YIpOWwvGnPYL5WncMOF8P9wBhaOs
 Sn9HMREew4MpFzxw/8LSqIvrFC0fmHkPgHGxnlC3nuVgyYvQOctEIfCMIRBy2RUEO5ar
 +V4qD5NQFcRMbmTuBb560Vq2NJp+C1hhpJmJr8lysU3DBFstjMu/N6heNURH5stCwiV4
 HX0RKT/AaIRVsIMaOTxtGzKqYaYxmzbBcAkHuNBk2zTGjR24opNQNneUdUDxwktAbrAO
 vfel4EUnEO4alQn+e/ox09hxT7IVK2U9fM9FDiAa1FoyWqcCb+2e19ir69+0luS6XhGa
 73Ig==
X-Gm-Message-State: AJIora8n/8JvceIehSUf42qpksIGx8RNHRL8He+aER1biRt1W+vj8lNH
 HsyubJUgQrOU6qLnTez/B1jPeahIyeT1m45NqwMsfNoU9t8=
X-Google-Smtp-Source: AGRyM1sB3i7RpGDTBSOTQPCAe4Zs/gPo5dvASt/OuNyrLjpYzB6gRu5PCkDaqmgyDsx10a94lIcnw5G/aCH2GUkvu14=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr11196923ywc.64.1656939920069; Mon, 04
 Jul 2022 06:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-41-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:05:09 +0100
Message-ID: <CAFEAcA_qFvXethRD6bF42SXY-n+0akZ_rhgNhj+EqmjwpwycuQ@mail.gmail.com>
Subject: Re: [PATCH v4 40/45] linux-user/aarch64: Implement SME signal handling
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 28 Jun 2022 at 05:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Set the SM bit in the SVE record on signal delivery, create the ZA record.
> Restore SM and ZA state according to the records present on return.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 162 +++++++++++++++++++++++++++++++++---
>  1 file changed, 151 insertions(+), 11 deletions(-)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 22d0b8b4ec..1ad125d3d9 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -104,6 +104,22 @@ struct target_sve_context {
>
>  #define TARGET_SVE_SIG_FLAG_SM  1
>
> +#define TARGET_ZA_MAGIC        0x54366345
> +
> +struct target_za_context {
> +    struct target_aarch64_ctx head;
> +    uint16_t vl;
> +    uint16_t reserved[3];
> +    /* The actual ZA data immediately follows. */
> +};
> +
> +#define TARGET_ZA_SIG_REGS_OFFSET \
> +    QEMU_ALIGN_UP(sizeof(struct target_za_context), TARGET_SVE_VQ_BYTES)
> +#define TARGET_ZA_SIG_ZAV_OFFSET(VQ, N) \
> +    (TARGET_ZA_SIG_REGS_OFFSET + (VQ) * TARGET_SVE_VQ_BYTES * (N))
> +#define TARGET_ZA_SIG_CONTEXT_SIZE(VQ) \
> +    TARGET_ZA_SIG_ZAV_OFFSET(VQ, VQ * TARGET_SVE_VQ_BYTES)
> +
>  struct target_rt_sigframe {
>      struct target_siginfo info;
>      struct target_ucontext uc;
> @@ -176,9 +192,9 @@ static void target_setup_end_record(struct target_aarch64_ctx *end)
>  }
>
>  static void target_setup_sve_record(struct target_sve_context *sve,
> -                                    CPUARMState *env, int vq, int size)
> +                                    CPUARMState *env, int size)
>  {
> -    int i, j;
> +    int i, j, vq = sme_vq(env);


Shouldn't this be sve_vq() ?

>
>      memset(sve, 0, sizeof(*sve));
>      __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
> @@ -207,6 +223,34 @@ static void target_setup_sve_record(struct target_sve_context *sve,
>      }
>  }
>
> +static void target_setup_za_record(struct target_za_context *za,
> +                                   CPUARMState *env, int size)
> +{
> +    int vq = sme_vq(env);
> +    int vl = vq * TARGET_SVE_VQ_BYTES;
> +    int i, j;
> +
> +    memset(za, 0, sizeof(*za));
> +    __put_user(TARGET_ZA_MAGIC, &za->head.magic);
> +    __put_user(size, &za->head.size);
> +    __put_user(vl, &za->vl);
> +
> +    if (size == TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
> +        return;
> +    }

I know we always set size in code we control, but it feels
a bit fragile to assume that if the size isn't the "for zero
data" case then it definitely has enough space to put all
the ZA data in it. Maybe we could assert() that the code
below isn't going to overrun size ?


> +
> +    /*
> +     * Note that ZA vectors are stored as a byte stream,
> +     * with each byte element at a subsequent address.
> +     */
> +    for (i = 0; i < vl; ++i) {
> +        uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
> +        for (j = 0; j < vq * 2; ++j) {
> +            __put_user_e(env->zarray[i].d[j], z + j, le);
> +        }
> +    }
> +}
> +
>  static void target_restore_general_frame(CPUARMState *env,
>                                           struct target_rt_sigframe *sf)
>  {
> @@ -252,16 +296,28 @@ static void target_restore_fpsimd_record(CPUARMState *env,
>
>  static bool target_restore_sve_record(CPUARMState *env,
>                                        struct target_sve_context *sve,
> -                                      int size)
> +                                      int size, int *svcr)
>  {
> -    int i, j, vl, vq;
> +    int i, j, vl, vq, flags;
> +    bool sm;
>
> +    /* ??? Kernel tests SVE && (!sm || SME); suggest (sm ? SME : SVE). */

This is fixed upstream (hasn't made it into Linus' git tree yet
but will at some point):
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=df07443f477a

so we might as well follow suit.

>      if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>          return false;
>      }
>
>      __get_user(vl, &sve->vl);
> -    vq = sve_vq(env);
> +    __get_user(flags, &sve->flags);
> +
> +    sm = flags & TARGET_SVE_SIG_FLAG_SM;
> +    if (sm) {
> +        if (!cpu_isar_feature(aa64_sme, env_archcpu(env))) {
> +            return false;
> +        }
> +        vq = sme_vq(env);
> +    } else {
> +        vq = sve_vq(env);
> +    }
>
>      /* Reject mismatched VL. */
>      if (vl != vq * TARGET_SVE_VQ_BYTES) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

