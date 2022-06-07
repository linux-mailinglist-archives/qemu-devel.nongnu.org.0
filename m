Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F753FB0B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:18:13 +0200 (CEST)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWHs-0001Pn-Bn
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVo1-0006dH-37
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:47:21 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVnz-0001vv-91
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:47:20 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id r1so1634444ybd.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sQ1y+POZFERm2M8RDVYbpWuJXGCmk4JLi4ssYqpuC7I=;
 b=ExFpT5kMwHLrlCWZwkYNqXWXSDNkzJA3o2IfAR2Zban92q8ddLpHFBpiW5d26RW+Ap
 jy1IDrER6zg4g6p3KvcMFCkp7nVMK8ilAXQ04tQzwzUPHyR/2ZzSVXem/K3IgVoXrR8Q
 stBuNALtFmyUzaE5Yu/RThXq53PGtOn2oWhjdIBraRs+ouP9UqEbaGV/W5pW7GdLOC1N
 186BUQ4L0g3MlzcD2a7/G2OLh1NN5C2U+QenAkYiovMUR5TGiXirNj9y7B4UB+SEoJot
 Q0dvx0mtGB/YVAEL2UsYORk9vXwzNjBT9Vv09ovBy1T9fHzbxRHDmbQSd9db1PHunSsR
 0UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sQ1y+POZFERm2M8RDVYbpWuJXGCmk4JLi4ssYqpuC7I=;
 b=vrde2KVvwSwr2KK3J+YBv7TuvPw6dl5I4LCtp+Y8oqinWdrngKBLfBzgE9ExzOS3OY
 YXoKZBpNke/C1zX9+oaKuus0s8vIhrUnnuaysnz+LFB+EAYNJYFvkqOGLGPOzIVNKpqS
 jwvuRfspV+qZ971vVbW86rnYRrOyMpA/P2cn3r9oULoHH/0JUNdPveCzOMx7sIW3trgH
 YgDsyWaQY6XQR+mlTqUU2aXxPh3oIdw9LcrXjz5Q5ggZfyrRTW+CG2OAgDK9WLdP95nk
 ImDmzjx04J79RAH/lpGimB5Im09aajYErxqV0bxTmqz45iPUAucQVzPY+Jn5dnMp9KTH
 FY6w==
X-Gm-Message-State: AOAM533RSX/EOApw4qVQZyjaaO/orNlxxf/24iZoxWTmcUebuHi0KjnY
 2yb+hpcGx7ERVJAFrHJeWWC4ansOXKDoHb6Zd4dVDQ==
X-Google-Smtp-Source: ABdhPJyazqMp57MINQllDOotu4xOtiiWF5jOBBbsh2qUqEQMUW9RGDHElCgJv2sqWKr4WR14yT9CbDG6Wdrix1CVkpA=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr27877345ybb.140.1654595237514; Tue, 07
 Jun 2022 02:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-38-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 10:47:07 +0100
Message-ID: <CAFEAcA-JFvMM3yY=q=nBbrs_Y47056NLgtQTqdYqTKmgLZfWYA@mail.gmail.com>
Subject: Re: [PATCH 37/71] target/arm: Add cpu properties for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Thu, 2 Jun 2022 at 23:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the properties for SVE.  The main difference is
> that any arbitrary set of powers of 2 may be supported,
> and not the stricter constraints that apply to SVE.
>
> Include a property to control FEAT_SME_FA64, as failing
> to restrict the runtime to the proper subset of insns
> could be a major point for bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -589,10 +589,13 @@ static void cpu_arm_get_vq(Object *obj, Visitor *v, const char *name,
>      ARMCPU *cpu = ARM_CPU(obj);
>      ARMVQMap *vq_map = opaque;
>      uint32_t vq = atoi(&name[3]) / 128;
> +    bool sve = vq_map == &cpu->sve_vq;
>      bool value;
>
> -    /* All vector lengths are disabled when SVE is off. */
> -    if (!cpu_isar_feature(aa64_sve, cpu)) {
> +    /* All vector lengths are disabled when feature is off. */
> +    if (sve
> +        ? !cpu_isar_feature(aa64_sve, cpu)
> +        : !cpu_isar_feature(aa64_sme, cpu)) {
>          value = false;
>      } else {
>          value = extract32(vq_map->map, vq - 1, 1);

I was wondering what you were going to do about this bit; the
comparison against &cpu->sve_vq feels a bit awkward but I guess
it's the simplest thing.

> +void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    uint32_t vq_map = cpu->sme_vq.map;
> +    uint32_t vq_init = cpu->sme_vq.init;
> +    uint32_t vq_supported = cpu->sme_vq.supported;
> +    uint32_t vq;
> +
> +    if (vq_map == 0) {
> +        if (!cpu_isar_feature(aa64_sme, cpu)) {
> +            cpu->isar.id_aa64smfr0 = 0;
> +            return;
> +        }
> +
> +        /* TODO: KVM will require limitations via SMCR_EL2. */
> +        vq_map = vq_supported & ~vq_init;

Do we currently forbid setting these properties entirely for KVM
(or just not provide them) ?

> +static void aarch64_add_sme_properties(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint32_t vq;
> +
> +    object_property_add_bool(obj, "sme", cpu_arm_get_sme, cpu_arm_set_sme);
> +    object_property_add_bool(obj, "sme_fa64", cpu_arm_get_sme_fa64,
> +                             cpu_arm_set_sme_fa64);
> +
> +    for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
> +        char name[8];
> +        sprintf(name, "sme%d", vq * 128);
> +        object_property_add(obj, name, "bool", cpu_arm_get_vq,
> +                            cpu_arm_set_vq, NULL, &cpu->sme_vq);
> +    }
> +
> +#ifdef CONFIG_USER_ONLY
> +    /* Mirror linux /proc/sys/abi/sme_default_vector_length. */
> +    object_property_add(obj, "sme-default-vector-length", "int32",
> +                        cpu_arm_get_default_vec_len,
> +                        cpu_arm_set_default_vec_len, NULL,
> +                        &cpu->sme_default_vq);
> +#endif
> +}

These new properties should be documented in
docs/system/arm/cpu-features.rst, similar to the SVE ones.

thanks
-- PMM

