Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5F691EAB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRy3-0003PO-Ac; Fri, 10 Feb 2023 06:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQRxy-0003P5-PC
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:53:22 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQRxw-00020f-Rg
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:53:22 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 s89-20020a17090a2f6200b0023125ebb4b1so5275702pjd.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676029999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hPqb8suVsM7i1ekI7lM0jiH7JJSZYrPLQeYTwm8jU1U=;
 b=gBIxjoKKoldtEMy1huQdBeCPqkzrP/GgQNgLAu8hViYG3ylej2ZfJvvU8HomNOiElD
 XuDOD9DQ17RjQS3r98ta2bg5jx+/8Xv+WQiCwAUBOpqe4y8+Z+S8IJkO6qYIQUErEn/X
 7O+cjWD5Wfv+Xz6iW3VyAZFpk3gEnR48yHdi6pX0qARjsR7T8ln6gpNYIXfhX3j/mJar
 kNSF4LI/x3j/27AGBR4+JsTj77LO8z9swA6ykcmHy597AGRAMjCeYlzHx8ksvacmp110
 oalDFJjpLMvi3MVeAdEgw9xkxN11UpmzEPm5YWRSVAO+nP8PgBx+iZvu5nzTDY3m/aRB
 hF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676029999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hPqb8suVsM7i1ekI7lM0jiH7JJSZYrPLQeYTwm8jU1U=;
 b=vujYbGS0DP5suqNK7Tx1QquVDExwxroDWaJxZME6Enrv8U1oA3kigij8oMZiGV8X00
 UxSpAUJIQWew2mszu72ah9SRvS4+/k4Zl2jIjkcf4o9yVRykdLnDlgjmCz1Lf6EuYmZv
 AG+ofxR0qWWN+W6Ox1HviUV9/Je80dh5MBnbhPXq9ftwuJDmbLS0LJLSUOW8ij11C8m+
 r9gurqwsMzKEmM+RGqrW0kLE+gVrxMvwIioo/4stg+nHH+Gn0jXIFDtBwl573ReNZz5l
 IdVPwx33+cU6T0Lox/ceq0scfMR0JcgjvmrAgIr9Kj7iH7YsOz+Vxt+0VPMmddiAW1vo
 PePQ==
X-Gm-Message-State: AO0yUKWSIrv3zO5Q1eTlrWIyC7MFDSSEkYREidB/LQ9Sw0csLYG+fMm7
 3C2UUA2O/xX9U9NHCmxwe6FBGgNLgSNzDgT+Os8WuQ==
X-Google-Smtp-Source: AK7set/qlMu2TGq2hn5Whc08cmMeah3j3LCyEkfd0bF634bCYGqqb4xZgAmZi5tnVqSVzqzdKKGhWe6QbkkOATV8p9M=
X-Received: by 2002:a17:902:9a87:b0:199:5374:b831 with SMTP id
 w7-20020a1709029a8700b001995374b831mr2003773plp.11.1676029999244; Fri, 10 Feb
 2023 03:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-14-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 11:53:07 +0000
Message-ID: <CAFEAcA8JECH9dCjGhDM18bJTuTMEAsMQUOwLM-FZEgPJ7f+ijQ@mail.gmail.com>
Subject: Re: [PATCH 13/22] target/arm: Handle Block and Page bits for security
 space
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Tue, 24 Jan 2023 at 00:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With Realm security state, bit 55 of a block or page descriptor during
> the stage2 walk becomes the NS bit; during the stage1 walk the bit 5
> NS bit is RES0.  With Root security state, bit 11 of the block or page
> descriptor during the stage1 walk becomes the NSE bit.
>
> Rather than collecting an NS bit and applying it later, compute the
> output pa space from the input pa space and unconditionally assign.
> This means that we no longer need to adjust the output space earlier
> for the NSTable bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 74 +++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 60 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index ddafb1f329..849f5e89ca 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1250,11 +1250,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      int32_t stride;
>      int addrsize, inputsize, outputsize;
>      uint64_t tcr = regime_tcr(env, mmu_idx);
> -    int ap, ns, xn, pxn;
> +    int ap, xn, pxn;
>      uint32_t el = regime_el(env, mmu_idx);
>      uint64_t descaddrmask;
>      bool aarch64 = arm_el_is_aa64(env, el);
>      uint64_t descriptor, new_descriptor;
> +    ARMSecuritySpace out_space;
>
>      /* TODO: This code does not support shareability levels. */
>      if (aarch64) {
> @@ -1434,8 +1435,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          ptw->in_ptw_idx += 1;
>          ptw->in_secure = false;
>          ptw->in_space = ARMSS_NonSecure;
> -        result->f.attrs.secure = false;
> -        result->f.attrs.space = ARMSS_NonSecure;
>      }
>
>      if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
> @@ -1552,12 +1551,66 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      }
>
>      ap = extract32(attrs, 6, 2);
> +    out_space = ptw->in_space;
>      if (regime_is_stage2(mmu_idx)) {
> -        ns = mmu_idx == ARMMMUIdx_Stage2;
> +        /*
> +         * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
> +         * The bit remains ignored for other security states.
> +         */
> +        if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
> +            out_space = ARMSS_NonSecure;
> +        }
>          xn = extract64(attrs, 53, 2);
>          result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
> -        ns = extract32(attrs, 5, 1);
> +        int ns = extract32(attrs, 5, 1);
> +        switch (out_space) {
> +        case ARMSS_Root:
> +            /*
> +             * R_GVZML: Bit 11 becomes the NSE field in the EL3 regime.
> +             * R_XTYPW: NSE and NS together select the output pa space.
> +             */
> +            int nse = extract32(attrs, 11, 1);
> +            out_space = (nse << 1) | ns;
> +            if (out_space == ARMSS_Secure &&
> +                !cpu_isar_feature(aa64_sel2, cpu)) {
> +                out_space = ARMSS_NonSecure;
> +            }
> +            break;
> +        case ARMSS_Secure:
> +            if (ns) {
> +                out_space = ARMSS_NonSecure;
> +            }
> +            break;
> +        case ARMSS_Realm:
> +            switch (mmu_idx) {
> +            case ARMMMUIdx_Stage1_E0:
> +            case ARMMMUIdx_Stage1_E1:
> +            case ARMMMUIdx_Stage1_E1_PAN:
> +                /* I_CZPRF: For Realm EL1&0 stage1, NS bit is RES0. */
> +                break;
> +            case ARMMMUIdx_E2:
> +            case ARMMMUIdx_E20_0:
> +            case ARMMMUIdx_E20_2:
> +            case ARMMMUIdx_E20_2_PAN:
> +                /*
> +                 * R_LYKFZ, R_WGRZN: For Realm EL2 and EL2&1,
> +                 * NS changes the output to non-secure space.
> +                 */
> +                if (ns) {
> +                    out_space = ARMSS_NonSecure;
> +                }
> +                break;
> +            default:
> +                g_assert_not_reached();
> +            }
> +            break;
> +        case ARMSS_NonSecure:
> +            /* R_QRMFF: For NonSecure state, the NS bit is RES0. */
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
>          xn = extract64(attrs, 54, 1);
>          pxn = extract64(attrs, 53, 1);
>          result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);

Various of these cases say "NS is RES0", but the code is
still extracting it from the attrs bit 5 and passing it
to get_S1prot(), which relies on being passed 1 for any case
where the translation table indicates that the memory is
Non-secure, whether the NS bit in the final block or page descriptor
was 1 or not (it uses it to implement the SCR_EL3.SIF bit).
This used to happen automatically because we set tableattrs to
1 << 4 if the initial access was non-secure, and then that bit
would always end up in attrs bit 5 regardless of what the various
NSTable and NS bits in the descriptors were, but the refactoring
in the previous patch changes that and so we need to do something
else I think.

thanks
-- PMM

