Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C438F133
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:10:52 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDAJ-0007gR-62
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llD8o-00065B-Qv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:09:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llD8l-0001Gx-VX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:09:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id x7so9492485wrt.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=anmppFVjRslCxG2GGX3KslCq5EGUFyC1dTsoeevsbyw=;
 b=XeXCwvfihEfOoMcj7+KhJ1Rj7qMwZ5DQi53KlIg/bZi+VjiRpfeQDBNumA9fCwW3vy
 npJ31GjGk66ZWUfEqxYYtedLxkzDBInqu+R1PNkZ009j+Gnll/cTPTiHP5VGvvkaNZa/
 fveFKv0+L+CO+bdQR156TcXD7zioRagzmV/hvqu9zSPjC/FlVGhRTK+hXuANVptpc3+k
 /x6JF9v0id25lTPs5LFjDb0wbWAy/o9EJKuY48wJAR308CYtnGPc5VM1t7Bands7Mlub
 m2HOZNZ05/z5vnL1YeVB8DFNDnZ+XgRW6hf1P5SnuTvdYhCjgo4XWALR6XIn74aJ7AQ/
 uwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=anmppFVjRslCxG2GGX3KslCq5EGUFyC1dTsoeevsbyw=;
 b=j2kKxJ1M/c3amtNXeaDuTGaO0EfmyZoXU7hNqiOl2c3VG0Btx1YtxajeLWtnEP0arM
 FFOgYG0gamKXWsPtg6gkF9ZNdT4fdFQd3yKICMa6rEEm3oBf9W34wwfdumXYHtjwDgAz
 HXilTzYby5yj2UPePv+An6E01iHIZX8Ek4T/HUal5NLibdDimtRs0WlMYYbVkDO/u6Yg
 sZvXsJ2LHfChKORBKM6GyGb5LkabPHnTjlsWAgGk8Qr+z4BFam6J4T0AOpZCfa4FzUlx
 QZ2KXhD9CCniAySxpycQSlGefgk5uGw72+qtV7YTNNmrj5tgYfjEyaBYDtNzXHDTq3cy
 i96g==
X-Gm-Message-State: AOAM532384x+C99FItbhPvaE1ItNXJl8DD9lme0G9Ye+Ici0jD8D0yVq
 SWyP5vNKU8m9pGXkTmTZh5ECAQ==
X-Google-Smtp-Source: ABdhPJwkSbQXb1MSQqu4E+aq6CnYwLjWxufPjtJtsx+uWsh5eO+E0egC6SW8IaHG+5QPYC+u0ujcfQ==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr22862691wrs.333.1621872553479; 
 Mon, 24 May 2021 09:09:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm8536885wmi.32.2021.05.24.09.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:09:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64F731FF7E;
 Mon, 24 May 2021 17:09:10 +0100 (BST)
References: <20210510150016.24910-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
Date: Mon, 24 May 2021 16:48:18 +0100
In-reply-to: <20210510150016.24910-1-peter.maydell@linaro.org>
Message-ID: <87fsyc3yhl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Chan Kim <ckim@etri.re.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In icc_eoir_write() we assume that we can identify the group of the
> IRQ being completed based purely on which register is being written
> to and the current CPU state, and that "CPU state matches group
> indicated by register" is the only necessary access check.
>
> This isn't correct: if the CPU is not in Secure state then EOIR1 will
> only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> prevent EOIR0 writes completing G0 IRQs when they should not.
>
> Rearrange the logic to first identify the group of the current
> highest priority interrupt and then look at whether we should
> complete it or ignore the access based on which register was accessed
> and the state of the CPU.  The resulting behavioural change is:
>  * EL3 can now complete G1NS interrupts
>  * G0 interrupt completion is now ignored if the GIC
>    and the CPU have the security extension enabled and
>    the CPU is not secure
>
> Reported-by: Chan Kim <ckim@etri.re.kr>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 43ef1d7a840..81f94c7f4ad 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, cons=
t ARMCPRegInfo *ri,
>      GICv3CPUState *cs =3D icc_cs_from_env(env);
>      int irq =3D value & 0xffffff;

Un-related but the docs do say that:

  This field has either 16 or 24 bits implemented. The number of
  implemented bits can be found in ICC_CTLR_EL1.IDbits and
  ICC_CTLR_EL3.IDbits. If only 16 bits are implemented, bits [23:16] of
  this register are RES0

>      int grp;
> +    bool is_eoir0 =3D ri->crm =3D=3D 8;
>=20=20
> -    if (icv_access(env, ri->crm =3D=3D 8 ? HCR_FMO : HCR_IMO)) {
> +    if (icv_access(env, is_eoir0 ? HCR_FMO : HCR_IMO)) {
>          icv_eoir_write(env, ri, value);
>          return;
>      }
>=20=20
> -    trace_gicv3_icc_eoir_write(ri->crm =3D=3D 8 ? 0 : 1,
> +    trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
>                                 gicv3_redist_affid(cs), value);
>=20=20
> -    if (ri->crm =3D=3D 8) {
> -        /* EOIR0 */
> -        grp =3D GICV3_G0;
> -    } else {
> -        /* EOIR1 */
> -        if (arm_is_secure(env)) {
> -            grp =3D GICV3_G1;
> -        } else {
> -            grp =3D GICV3_G1NS;
> -        }
> -    }
> -
>      if (irq >=3D cs->gic->num_irq) {
>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1020=
-1023]
> @@ -1340,8 +1329,35 @@ static void icc_eoir_write(CPUARMState *env, const=
 ARMCPRegInfo *ri,
>          return;
>      }
>=20=20
> -    if (icc_highest_active_group(cs) !=3D grp) {
> -        return;
> +    grp =3D icc_highest_active_group(cs);
> +    switch (grp) {
> +    case GICV3_G0:
> +        if (!is_eoir0) {
> +            return;
> +        }
> +        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS)
> +            && arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env))=
 {
> +            return;
> +        }
> +        break;
> +    case GICV3_G1:
> +        if (is_eoir0) {
> +            return;
> +        }
> +        if (!arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    case GICV3_G1NS:
> +        if (is_eoir0) {
> +            return;
> +        }
> +        if (!arm_is_el3_or_mon(env) && arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
>      }

From my reading of the spec it looks OK to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

