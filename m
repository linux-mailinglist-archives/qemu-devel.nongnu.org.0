Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C105751C3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:26:44 +0200 (CEST)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0jj-0007v5-9Y
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Zf-0004DB-Ak
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:16:35 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:45757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Zd-0002DG-Rz
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:16:19 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31bf3656517so20099767b3.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9uENqGPoLV3zr727windj+zhJUDmWPHZHoqYcsEvmIo=;
 b=GeTRvgebZ+WfxnBhXnq7LSLRG6O1KUvmO1GPzKeTC+A/ZpDHwGSBvtdmXoWYp4+JfO
 z6kbyJTIzgjP7pl4CZQulvlPYU6913XESBxOvQx1m88Xa+o/xPKvXy0/WwAxPtH2K75p
 K4JDFLEqMdCWnV2iy4nV/wf4BLh0zbw4qhIZzAN4KGuz0f0Av4AtDyWCAi2V7JPcynZS
 D9fSpKhlESoBRFbj4U5IMrd4nis11Q2B04HQfKMSqdAuEesTg7PHKbmtCIwf8pbKrOS1
 U+z6JRvPN3iGQBB928W5O1JaRXd5FnZXBN+n8+Si50jKM8wuPnUTMG0Axh7PE2j9SbM+
 hs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9uENqGPoLV3zr727windj+zhJUDmWPHZHoqYcsEvmIo=;
 b=q5s9dIaq1h5q9Appr6d90nv9LJsLBP1q8GZPul6MPYHmbZhSJfgxnueph+STW0CWiS
 qCdeWsWGdroZoPYoszfcyFe/jDMaBkXviDqyLLVVUH0Q/RHygK2GlvnI7SLPlwXW094F
 ycy6wTf+/w5krycCpb1RTRh2/xSoVgcZkvQ3yDFsDWSkGr8EGZ6Q1we7TsO8XbT8G3hU
 8zvL2H6fiRLKWjUm0gvRah9TLJIX7sD8oh1PpVWAFgqM4SVVodQlsq9Srd/yNGZhSy69
 3VJDTIM6sGUYYXAkyzoPtY58d1ZVrqKtkhJ0rU5mckod+KSzLNDi33E1u51chzmVMtrE
 wHDA==
X-Gm-Message-State: AJIora+MQ/aa8PMalIsFDFna1a+p0wfw6iANTskDefg15V8G/xHMcYkf
 Gz0oSBcgJHeBMPpuULaQB1SgBQ4feM8S5FMIR5X2PA==
X-Google-Smtp-Source: AGRyM1uyZq+DSR2xbZAunrgn0ieaBsJoROo4qgdXpCMJ8N7wes7cUk3C6h+sNHYSGuf0GudCmjU6H+Ab+NMeJqkekhs=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr10332123ywb.257.1657811776697; Thu, 14
 Jul 2022 08:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-4-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-4-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:15:38 +0100
Message-ID: <CAFEAcA9UpPOAfQDS1n3k75SYWPSMgUC=ZCBsVd8vmRoEFj4B7A@mail.gmail.com>
Subject: Re: [PATCH 03/11] target/arm: Add v8R MIDR register
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 15:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> This register is used by the ARM Cortex-R52.
>
> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> ---
>  target/arm/helper.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6457e6301c..bdf1df37d5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8201,6 +8201,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .accessfn =3D access_aa64_tid1,
>                .type =3D ARM_CP_CONST, .resetvalue =3D cpu->revidr },
>          };
> +        ARMCPRegInfo id_v8r_midr_cp_reginfo[] =3D {
> +            { .name =3D "MIDR",
> +              .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D=
 CP_ANY,
> +              .access =3D PL1_R, .resetvalue =3D cpu->midr,
> +              .writefn =3D arm_cp_write_ignore, .raw_writefn =3D raw_wri=
te,
> +              .readfn =3D midr_read,
> +              .fieldoffset =3D offsetof(CPUARMState, cp15.c0_cpuid),
> +              .type =3D ARM_CP_OVERRIDE },

Why do we need this specially for v8R ? The v8R Supplement lists
MIDR and REVIDR as "unchanged" between v8A and v8R, so the
existing id_v8_midr_cp_reginfo[] should be fine.

thanks
-- PMM

