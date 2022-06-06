Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428553E5A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:11:45 +0200 (CEST)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFKS-0002kX-0M
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF5U-0004I9-SY
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:56:17 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF5L-0005pz-G3
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:56:16 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ff7b90e635so147621907b3.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxtE6wlon+0JeGgXupZe83o5bZdHdd7Uqv+tTpGmI1I=;
 b=F6hJqikwKzcNKj5FB4oyxXPEG2laVNuO/LxoPtaX1MnDgNPI1MBRjuTiWPEMGXOdh3
 HCUTP4WLfIAz2blboVdKvSNgA1Ojm/LHrSbWqizvEsj+rsZtNhJKlqe5K7/4knOUSXQw
 UifWRQ13l9EFr/e3LO/lmF8YXZxogwg5rs3xBGOvVFt9n1bLYfmROxbkdeuZRryVmibh
 cQX+MNqymigYJjxlk5UCXOkoXx01GnHNkG8TrxQ1GiJmL+y/FZagnMzykuWG6BDBTwDF
 SwVvABq7jOuY3MdLQ1aXHL/ScLhRiCGbGTAGXEXeRnz9sO9eThASH0TUO9x1AhsFNGlU
 zdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxtE6wlon+0JeGgXupZe83o5bZdHdd7Uqv+tTpGmI1I=;
 b=gYVpIigcpgAhgwQ0NpHrfCct4xPp8439PmMvRmkuYmRP/2jriK9yBsm01giczjM66a
 KleBEt3oYesmpHRweyHscqx8wRmbAyJGn2I/nYhkuHQ3lKj09G28iBpLRKhzEo3XOOph
 3AosqxRSogkWZ9QEBLEARodGS54BPgtu/vdG3eR9yp0oTMu8ZeDAvXnhX8o+VnBKRmEK
 KmBiqXNP6HaUmdN+G+W/CZrNGtveybV+E+sBcNYRcdcJ3OfrD0zjtVte8MJ0HaorH2Xq
 iSf5uYYQkBPZQ1TQtz9Oa2jYomd97NMSQ6Mg9IgU7zkL9O3rayCl2tsrgP2gEBxhFC9Y
 jqhQ==
X-Gm-Message-State: AOAM531264sfV6POtFaXKRnBOSI+S9Xov5ITkRwPnj2P/pFtZZjZ3ycM
 rH194OUmPbrZXyTLfjSiWB/bzHKvZJN57qZw4mnD6g==
X-Google-Smtp-Source: ABdhPJxn1APD2mCVpr1knLM0HZdMrwRCTHHTRADaDFlE+WoSqJ7UaJeu1W5zqr0cnu5cVxzk5wpXuJNpWOmNOu9cbqQ=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr26222645ywb.64.1654530964779; Mon, 06
 Jun 2022 08:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-28-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 16:55:54 +0100
Message-ID: <CAFEAcA-Zt7pREK-AVDN0yemCawJceQo5PUhdr_8jG7WL8-+NOA@mail.gmail.com>
Subject: Re: [PATCH 27/71] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 2 Jun 2022 at 23:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement the streaming mode identification register, and the
> two streaming priority registers.  For QEMU, they are all RES0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4149570b95..f852fd7644 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6355,6 +6355,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>
> +static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                 bool isread)
> +{
> +    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
> +    if (arm_current_el(env) < 3
> +        && arm_feature(env, ARM_FEATURE_EL3)
> +        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>  {
> @@ -6412,6 +6424,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
>        .access = PL3_RW, .type = ARM_CP_SME,
>        .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
>        .writefn = smcr_write, .raw_writefn = raw_write },
> +    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
> +      .access = PL1_RW, .accessfn = access_aa64_tid1,

Shouldn't this be PL1_R, not _RW ?

> +      /*
> +       * IMPLEMENTOR = 0 (software)
> +       * REVISION    = 0 (implementation defined)
> +       * SMPS        = 0 (no streaming execution priority in QEMU)
> +       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
> +       */
> +      .type = ARM_CP_CONST, .resetvalue = 0, },
> +    /*
> +     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
> +     */
> +    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
> +      .access = PL1_RW, .accessfn = access_esm,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
> +      .access = PL2_RW, .accessfn = access_esm,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>  };
>  #endif /* TARGET_AARCH64 */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

