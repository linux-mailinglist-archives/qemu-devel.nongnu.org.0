Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F860691EC2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQS4L-0005H3-EE; Fri, 10 Feb 2023 06:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQS4I-0005GU-9f
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:59:54 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQS4G-0003JJ-3R
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:59:54 -0500
Received: by mail-pj1-x102e.google.com with SMTP id bx22so4968526pjb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 03:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DDZ67SLNNPRsaZN9bHK+bGZcgO93TL52PIhwm17RW2E=;
 b=xisb4DHQ8zhCtHzS8smBAIbLfsMon7d/HU4BBpwyd6R/JRjNmzbViISsEeZsM7bhzc
 w2W9SrNFTiLZaYA3fmqyuf7O8FKn3UaK22J2gYYHVtkqCQ4XKR1LKAAQOOrSMLcfB4cj
 Sh+kCAyk71QDIenps73rvjjEq9WplK4tV8Nw0BrcosWcn2ovgIaKErh7zJGFtuJ2zKSz
 p8saOlNx+NrtvNM/pTp07hRQ35Z/EZEek4JLXUoAZrVHO3xs2PG9KTKD3s8lw0zgYN2p
 RrvyjzJpmWCAmME+a7oJlRz4OBcc+0iRTVtAgyaosgTCU+xHEAFTST9JZRCcbaJd92TN
 ddMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DDZ67SLNNPRsaZN9bHK+bGZcgO93TL52PIhwm17RW2E=;
 b=IKStU1PrxT3KM6nOAgdMqKFJRjMHD/7eFGb5prB2epMhkzEr3KoKekhay4OG3J27lk
 izQTmrozTk2H6b87RMjhgYnWqf4uKmvyXYf4+mZ3zEtoX9xmNsspijIllrvJWh3IMRYd
 A6UtZCJRiffUdoi54e93Q2zheEaCN9dxQH+Ioc6XLMJYy6IiveMEK0Nz/OvAw0G6GBGQ
 XaDG1f99iskGIvJ/PsrlXFwvaFeaqVlTZzGL2KemeLaRT2EHX/L2RRd3CWmAV91yGirE
 XSIr/h5weRoszPMzarcRfm+/ByEd3TH4Ueypaz83SV0Fsfu4EKiH9kXOBXX2D7rX2zD9
 9P2Q==
X-Gm-Message-State: AO0yUKUl9Z/cnInc97udDKP5qtNWmyFo/w0o59+f96j5JgqhsHlZeciJ
 +rjZuwDw646G8HtG9qrUf+WM+MQun+qZOG5LIa4Ejg==
X-Google-Smtp-Source: AK7set8fRmvkSOxiuSIc70AYnSeDPip/0j+padFClgN3AFwF2Ty0uoet7wsmjx4/0FSXbucqc8ocme+fY7ApWeO8SWM=
X-Received: by 2002:a17:90a:2c07:b0:233:48e0:95e1 with SMTP id
 m7-20020a17090a2c0700b0023348e095e1mr823313pjd.137.1676030389891; Fri, 10 Feb
 2023 03:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-15-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 11:59:38 +0000
Message-ID: <CAFEAcA8w4PHhEZ_Uepm62LFq56w46gmApmX13UdJj6TJmckQrg@mail.gmail.com>
Subject: Re: [PATCH 14/22] target/arm: Handle no-execute for Realm and Root
 regimes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While Root and Realm may read and write data from other spaces,
> neither may execute from other pa spaces.
>
> This happens for Stage1 EL3, EL2, EL2&0, but stage2 EL1&0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 66 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 58 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 849f5e89ca..6b6f8195eb 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -909,7 +909,7 @@ do_fault:
>   * @xn:      XN (execute-never) bits
>   * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
>   */
> -static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
> +static int get_S2prot_noexecute(int s2ap)
>  {
>      int prot = 0;
>
> @@ -919,6 +919,12 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
>      if (s2ap & 2) {
>          prot |= PAGE_WRITE;
>      }
> +    return prot;
> +}
> +
> +static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
> +{
> +    int prot = get_S2prot_noexecute(s2ap);
>
>      if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
>          switch (xn) {
> @@ -956,12 +962,14 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
>   * @mmu_idx: MMU index indicating required translation regime
>   * @is_aa64: TRUE if AArch64
>   * @ap:      The 2-bit simple AP (AP[2:1])
> - * @ns:      NS (non-secure) bit
>   * @xn:      XN (execute-never) bit
>   * @pxn:     PXN (privileged execute-never) bit
> + * @in_pa:   The original input pa space
> + * @out_pa:  The output pa space, modified by NSTable, NS, and NSE
>   */
>  static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
> -                      int ap, int ns, int xn, int pxn)
> +                      int ap, int xn, int pxn,
> +                      ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
>  {
>      bool is_user = regime_is_user(env, mmu_idx);
>      int prot_rw, user_rw;
> @@ -982,8 +990,39 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
>          }
>      }
>
> -    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
> -        return prot_rw;

Ah, this looks like it fixes the bug introduced in patch 12;
I guess some of this needs rearranging between patches.

> +    if (in_pa != out_pa) {
> +        switch (in_pa) {
> +        case ARMSS_Root:
> +            /*
> +             * R_ZWRVD: permission fault for insn fetched from non-Root,
> +             * I_WWBFB: SIF has no effect in EL3.
> +             */
> +            return prot_rw;
> +        case ARMSS_Realm:
> +            /*
> +             * R_PKTDS: permission fault for insn fetched from non-Realm,
> +             * for Realm EL2 or EL2&0.  The corresponding fault for EL1&0
> +             * happens during any stage2 translation.
> +             */
> +            switch (mmu_idx) {
> +            case ARMMMUIdx_E2:
> +            case ARMMMUIdx_E20_0:
> +            case ARMMMUIdx_E20_2:
> +            case ARMMMUIdx_E20_2_PAN:
> +                return prot_rw;
> +            default:
> +                break;
> +            }
> +            break;
> +        case ARMSS_Secure:
> +            if (env->cp15.scr_el3 & SCR_SIF) {
> +                return prot_rw;
> +            }
> +            break;
> +        default:
> +            /* Input NonSecure must have output NonSecure. */
> +            g_assert_not_reached();
> +        }
>      }
>
>      /* TODO have_wxn should be replaced with
> @@ -1556,12 +1595,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          /*
>           * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
>           * The bit remains ignored for other security states.
> +         * R_YMCSL: Executing an insn fetched from non-Realm causes
> +         * a stage2 permission fault.
>           */
>          if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
>              out_space = ARMSS_NonSecure;
> +            result->f.prot = get_S2prot_noexecute(ap);
> +        } else {
> +            xn = extract64(attrs, 53, 2);
> +            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>          }
> -        xn = extract64(attrs, 53, 2);
> -        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
>          int ns = extract32(attrs, 5, 1);
>          switch (out_space) {
> @@ -1613,7 +1656,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          }
>          xn = extract64(attrs, 54, 1);
>          pxn = extract64(attrs, 53, 1);
> -        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
> +
> +        /*
> +         * Note that we modified ptw->in_space earlier for NSTable,
> +         * and result->f.attrs was initialized by get_phys_addr, so
> +         * that retains a copy of the original security space.
> +         */
> +        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
> +                                    result->f.attrs.space, out_space);
>      }
>
>      if (!(result->f.prot & (1 << access_type))) {
> --
> 2.34.1

thanks
-- PMM

