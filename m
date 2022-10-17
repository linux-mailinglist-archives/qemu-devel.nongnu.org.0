Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D23600D7B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:12:45 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO31-0001OM-PU
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okNs2-00008N-Mj
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:01:22 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okNs1-0000eu-13
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:01:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id pq16so10659094pjb.2
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ftTPedma5Zescrvcv9LmQxOPuaIh7IaZ7R0zDO2ts9Y=;
 b=ZIuxmmhgsdakdRb1UqX/jzHrwNTL0SAO1YMt0AGMT/DPeWELK4JdactIPkg3L9wzY8
 EXPb6tZfLsfA0ezHlcNPmQlaFDzyNUaTbWxywdnQqaq3xSKlAQ0x6i8+04k5zZfCSkcm
 AmhSQHgrL1aBYxsWMXXO4xyl5V2uUP06rFwaP37+e2o9dyuV9imeKIX3XWe6aNbMV+VR
 o9C0JlXq4a72u2JIfTQtO2LWkooVv79h7EBjvfyC2qlMY9UjOXiYI55XqDRomkOrqMPe
 I0bKzTmCphj3UDxw1//zpepFVl5o/I3CktpZjK/0dK+rB1CrwcWKbPh5it/0/BtIN+ui
 Agbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ftTPedma5Zescrvcv9LmQxOPuaIh7IaZ7R0zDO2ts9Y=;
 b=Dn/gOxqgBG00/gDhIxBMCV01NKL9NTlGFeJEuktocr2jPeYkzAFZNzFAxz0mz90MtM
 j1mwtMUidvxWzSbkJmieZSxI3VIhBd+Hct2Aho7OUgtgfceriUobKyw4sm6RCD6S8cmR
 4tSdM2fQ3G2U0P1yUpAV8kJqxlLqBh2oR9HNKRYwpkfPdgrSkul7xVkbefNZBNZI+OGk
 AU2fW1jhWAYXVksoiYw4FyUCBcP5LUnVHnQ2EmQ6eXDHrU6G2RbQmbNKhJ4UfB6pbtwM
 HSoCA6KQvcxQQVetVngqgVOKAe3Y7PR0mkMdN4TPizs0I88eiJbxMc+zG/Go8t+VRs+5
 qaOA==
X-Gm-Message-State: ACrzQf2YYx9oDtY1TQ/w1Sau5IPh8yTK+eFzksIVXfOXknWjX2t3DglJ
 IvS66eUIm6ciuAzB/UYo2ydnR0L179xpSyUJ0QBxsw==
X-Google-Smtp-Source: AMsMyM4CSjt7UJMs/PRzDA1Jxi2pn0Q9p2hlF2Vy7XdEgElTgeniYjt9YT+BNubUVdagEycjZqFrteGID51dlykKHHI=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr11456399plb.60.1666004479243; Mon, 17
 Oct 2022 04:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-24-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 12:01:07 +0100
Message-ID: <CAFEAcA8y=6okZaLFGu3BqXOZwV8ch9YFOf72y7fhMywXpobFQA@mail.gmail.com>
Subject: Re: [PATCH v4 23/24] target/arm: Implement FEAT_HAFDBS,
 dirty bit portion
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Oct 2022 at 04:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the atomic update for hardware management of the dirty bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c |  2 +-
>  target/arm/ptw.c   | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index fe1369fe96..0732796559 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
>      cpu->isar.id_aa64mmfr0 = t;
>
>      t = cpu->isar.id_aa64mmfr1;
> -    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
>      t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
>      t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
>      t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 82b6ab029e..0dbbb7d4d4 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1484,10 +1484,30 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      ap = extract32(attrs, 6, 2);
>
>      if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
> +        if (param.hd
> +            && extract64(attrs, 51, 1)  /* DBM */
> +            && access_type == MMU_DATA_STORE) {
> +            /*
> +             * Pre-emptively set S2AP[1], so that we compute EXEC properly.
> +             * C.f. AArch64.S2ApplyOutputPerms, which does the same thing.
> +             */
> +            ap |= 2;
> +            new_descriptor |= 1ull << 7;
> +        }
>          ns = mmu_idx == ARMMMUIdx_Stage2;
>          xn = extract64(attrs, 54, 2);
>          result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
> +        if (param.hd
> +            && extract64(attrs, 51, 1)  /* DBM */
> +            && access_type == MMU_DATA_STORE) {
> +            /*
> +             * Pre-emptively clear AP[2], so that we compute EXEC properly.
> +             * C.f. AArch64.S1ApplyOutputPerms, which does the same thing.
> +             */
> +            ap &= ~2;
> +            new_descriptor &= ~(1ull << 7);
> +        }

At this point in the code we've already merged the table
attributes into attrs. If the APTable[] bits forbid write permission
then HAFDBS isn't allowed to grant write permission. I think we
need to do this a bit further up, before we have merged the table
attributes in (so that the table attributes merge can force our
attribute bit back to 1 if the table attrs forbid writes).

(In the pseudocode the Permissions struct keeps track of the ap_table
and ap permissions settings separately and doesn't combine them until
AArch64.S1HasPermissionsFault().)

thanks
-- PMM

