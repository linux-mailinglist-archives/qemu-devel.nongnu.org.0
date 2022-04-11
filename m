Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199434FC278
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:34:41 +0200 (CEST)
Received: from localhost ([::1]:41494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwzw-0000B2-08
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwxa-0005HU-I3
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:32:14 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:40641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwxY-0000MG-Lm
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:32:14 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec05db3dfbso50836127b3.7
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3/jAYYZtiBI/rI+0cDYXasvphZnuGEXCWv5t7qJu6Y=;
 b=g7skYHTBjlIJBDVEjHFs/tnEfOOdMhL8+HopPq3PZ14YcfS7N9Ux/JQChnvGgibRCT
 7k+yPtss5rWZek1y5nwcRFsU/pAAPUWvGI9G7aBbBnzeM/kgPMJ8P6E30OzI5K7NXCql
 Ppm+KbgTBpvfOdAQt4WxujXLbpLKM3Xfy/JZerEo19a+JPij1+OzQ5BXopT9JkgzOnQX
 CsBPwOmE5vWNfK128ucPaH/78K7W3r4jPfu56hTPrVT3Jn2jT5cQ1/i5tv4RbBLBNT5i
 pP8Trr3Egt/vqZ0sh4ojmQJeLH4lRyWbU4Ivv1m9avRinbfnrIFvmi8lSzjaKHX8CNzB
 lBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3/jAYYZtiBI/rI+0cDYXasvphZnuGEXCWv5t7qJu6Y=;
 b=pl3OlYMSOTxlAcBtvNGr7srU7Y81oP4vHQ7buiy5ZvV64owowfoOjzzUjcsAz+wXjt
 ZBiI0bWUGInIEu9DNwfLHn6magFjHsjFmbXkG+2l1OuF3Crp/MVyaVFEzzMbVNtgZx03
 /2NODOQNFD7H4UZ4vzzd7/doDA5NQXNYjm5ewtaWziqI/2JiE+lqY+Aq8lcI1nniekXf
 bbatMJc6kVHwhrVm6M+rPVSbgMULDgztOW7It1aag650Cekal2Y6zXSTatBt95tW4yHW
 ntbMHMlKIGYc6rLvJgjgpb0DG1R4la+cBlO5VlSmqo121yV1z/hYbk9DOgoIGO2f4dxF
 jZdQ==
X-Gm-Message-State: AOAM530iq/4EkNWhHqDGY7a7sMfE2KfOLOQg2KhEEjpUAevqj8QvcAM/
 /nzIqH/+WJbazcWgVGTdoQtob2N3JIqbotQoL+k1vVHj9pE=
X-Google-Smtp-Source: ABdhPJxfVbayV4PyquUfVOnGTuxOyfu96HOt+qcggZESD3TUBejgF9IcQwI5StSLcVkXJxU1IUCQQnJo6BWO1/5wsis=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr4508948ywt.10.1649694730983; Mon, 11
 Apr 2022 09:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-14-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:32:00 +0100
Message-ID: <CAFEAcA_-cbZWF2KxZinSK=z88frNAmiJoj7u-kydtUgQiucFHg@mail.gmail.com>
Subject: Re: [PATCH 13/16] target/arm: Implement virtual SError exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Virtual SError exceptions are raised by setting HCR_EL2.VSE,
> and are routed to EL1 just like other virtual exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -10041,6 +10048,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>          mask = CPSR_A | CPSR_I | CPSR_F;
>          offset = 4;
>          break;
> +    case EXCP_VSERR:
> +        {
> +            /* Construct the SError syndrome from AET and ExT fields. */
> +            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
> +            env->exception.fsr = arm_fi_to_sfsc(&fi);
> +            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
> +            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
> +
> +            new_mode = ARM_CPU_MODE_ABT;
> +            addr = 0x10;
> +            mask = CPSR_A | CPSR_I;
> +            offset = 8;
> +        }
> +        break;
>      case EXCP_SMC:

Having looked at the following patch I came back to the AArch32 handling
of taking an SError in this patch...

(1) I think you need to look at TTBCR.EAE in the usual way to
decide whether to report the FSR in long-descriptor or
short-descriptor format
(2) maybe log the FSR value, the way we do for prefetch and
data aborts ?
(3) maybe mention that this is reported like a data abort but that
the DFAR has an unknown value ?

thanks
-- PMM

