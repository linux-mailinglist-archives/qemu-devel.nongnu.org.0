Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBD45AF5BE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:21:33 +0200 (CEST)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVf4d-0003uD-1z
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders.roxell@linaro.org>)
 id 1oVf1j-0001v4-N9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:18:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anders.roxell@linaro.org>)
 id 1oVf1e-0004o8-40
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:18:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id y136so7559993pfb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=/YxiTg2Y6r3+thsfbPvWqS+5O+fxjOgLKEFsE1+gNSI=;
 b=uL+fQgVEDu4MRlQ0u8cbG281G+tvyc/X8iPKz7EGN421EBcTZbTf5dWXejAfWZEAYN
 1U3F6Sbj/RIp/P7LKzxfX+WV+aieO23eg1alUEeENM2xoOgCX+FsUuq84eBow49MWeFr
 ccA95NTnBRQ06/Kle+y8LReNsC610ZQvGVOj1MjH2Vt3c7zzMT9D81uj5sHL0PE1COwI
 1x+RS5p6UefNDdJuHl+3sirXM2guRLHTAYuyRtxPXhfZFd4s9pmLBtTgtl1RdhUttmPp
 8nkKxCu++QsPZQEi5vUrIiY2cjrk2v8kHpRbVgg8/WXc8d09eBrqAP50cKdwCuMbInsA
 9hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/YxiTg2Y6r3+thsfbPvWqS+5O+fxjOgLKEFsE1+gNSI=;
 b=QXDubrY6Pfj1wQ2o0w4QMWpO4e+ySC1JORhvi7CYFPnyjAcpk7ADjt5jEjy5zN3dac
 /eEOJsxu36nv/4XHuJO4kjSRBxLPpDPxQd6VCnj9YUYURvV7kHw0BXLbwZ1pksfWLoPu
 DnPHJzKChdnV560Fk0zOQzkoQrD/CCQBPMv/ojfFDH0T1V/szrXUivlf/JDAm7OPBIBl
 V0TuR3e7oSU62fsWpVmVycxNMo6W0YauTV+Y1tt1FS0QzFCWV2mDJqUR0V54YhTOwIlq
 Nq3g6d6pPq+xNwSerHKfhM1ng0C4BWe5eC0794I8GBFZXiGLZkbWpAog+YuacPNjm2DH
 qj3g==
X-Gm-Message-State: ACgBeo2xYpYyUap0SpTj86/Y54F/TJur1nYimbrgTX+UjscgGhnTLIG+
 5omQ2l4B1Prar3DtH6o7IjOLfHuEDoGw2fw+69JM6g==
X-Google-Smtp-Source: AA6agR6fMAF7Zguaa+BET1ao/WK9IgTzwkxBBX/Jo8KhPB9FsxFqblriqgvezh5xaBHHYmhVAKh5Zbuh5jUi9FnyRF8=
X-Received: by 2002:a63:e516:0:b0:434:9462:69cd with SMTP id
 r22-20020a63e516000000b00434946269cdmr268765pgh.503.1662495503821; Tue, 06
 Sep 2022 13:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220906172257.2776521-1-alex.bennee@linaro.org>
In-Reply-To: <20220906172257.2776521-1-alex.bennee@linaro.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 6 Sep 2022 22:18:12 +0200
Message-ID: <CADYN=9LQe1793vWY8agasHSLazFVkMkLPOLOApxDBdXpYtOGfw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Arnd Bergmann <arnd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=anders.roxell@linaro.org; helo=mail-pf1-x429.google.com
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

On Tue, 6 Sept 2022 at 19:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> QEMU doesn't model micro-architectural details which includes most
> chip errata. The ARM_ERRATA_798181 work around in the Linux
> kernel (see erratum_a15_798181_init) currently detects QEMU's
> cortex-a15 as broken and triggers additional expensive TLB flushes as
> a result.
>
> Change the MIDR to report what the latest silicon would (r4p0) as well
> as setting the IMPDEF revidr bit to indicate these flushes are not
> needed. This cuts about 5s from my Debian kernel boot with the latest
> 6.0rc1 kernel (29s->24s).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Arnd Bergmann <arnd@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

> ---
>  target/arm/cpu_tcg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 3099b38e32..59d5278868 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -588,7 +588,9 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
> -    cpu->midr =3D 0x412fc0f1;
> +    /* r4p0 cpu, not requiring expensive tlb flush errata */
> +    cpu->midr =3D 0x414fc0f0;
> +    cpu->revidr =3D 0x200;
>      cpu->reset_fpsid =3D 0x410430f0;
>      cpu->isar.mvfr0 =3D 0x10110222;
>      cpu->isar.mvfr1 =3D 0x11111111;
> --
> 2.34.1
>

