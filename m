Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D223B5EF6E2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:48:29 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtts-0006Z2-Uf
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odryS-00065U-5c
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:45:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odryQ-0001bb-Lp
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:45:03 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dv25so2188668ejb.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=8SuG+DFph+UQuEzJIs4sdUk7OdEe2rwwYl9qbu1x0mg=;
 b=KcqISa9mhCyLnsHbPqakSD6eqLysrHya8quhFg+Vy4ArPHzyo26kiua4p92hA5Hnd5
 GD2gGf3pcEIcbB+FyLVPTC7ZLJINi/1/77NfCLY1L4yA3NeQXdHrDJ/3nuOXPhzcOE9c
 imXXBEGUHAsTSx6y/6gZSIRdN8guwGcE4ZvvxOvgbTqfbFH8qOtDSW3vfxD7ToO/dczd
 ievuymyM/OVX8ZNHOVpSBnFDG9VfSA4LuJal90jMIisNRr2Ry0OCW3M3dchwPsVOhflj
 yoLzQxq1kjp0JhOlZ3WtGiOd2C8cPacQcjqnAAitusxwEdO1uFBNObNduIOnNh3WFwC9
 X83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8SuG+DFph+UQuEzJIs4sdUk7OdEe2rwwYl9qbu1x0mg=;
 b=h4wxdeN/Ey27YNFwbqAjhuplBr62LUW/CEco46NSwjHAXAgBDdGd6kG6MeZxG96k4l
 lz1FRLtNC85GoljQoZXsZ1QxYmk43Dit6B2Xfgh2kH4hnDu9wCIKyHExcRrljPnoyqK2
 TtsGgZaEVAjmv3D+OVN2qp2DuG/3yWlMjFY07pZH36UXS5+L4cknTCkx5OdnlQzJ1z6s
 Xl9gIDUz72B2m+rV/oBZ8kkRYOHd5K8WGT2gpgJK/cp/hXhGws3C42hW4Q1c3/p1Mg+M
 A6Ssc/bXyYLONF1+mtGWyogoh0SKLySoINhXgVxbmXisALGQBCWdnVkmQHkVlR49yIBS
 JOdQ==
X-Gm-Message-State: ACrzQf0EHlZftriRG2O4vt8EpS+5gUyCIgRISvt5KIKdsn8ZE8ZKEhKo
 1/N8OUtwp4jJQMXHT/0sssQH4Q/FA01RL89CyMP60g==
X-Google-Smtp-Source: AMsMyM45c/ahmP6XuhxaD/ql2uY19WhX42qakphp/ZQQL7FHbICialyzn0paMBzsmsEf7BxzxSMOADwVc8frZr/eQZc=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr2537637ejc.36.1664451900905; Thu, 29
 Sep 2022 04:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
In-Reply-To: <20220928164719.655586-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 12:44:49 +0100
Message-ID: <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Sept 2022 at 17:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> As the Cortex A7 MPCore Technical reference says :
>
>   "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>   uses 16 double-precision registers. When the FPU is implemented with
>   NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>   This register bank is shared with NEON."
>
> Modify the mvfr0 register value of the cortex A7 to advertise only 16
> registers when NEON is not available, and not 32 registers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7ec3281da9aa..01dc74c32add 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          cpu->isar.id_isar6 =3D u;
>
>          if (!arm_feature(env, ARM_FEATURE_M)) {
> +            u =3D cpu->isar.mvfr0;
> +            u =3D FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
> +            cpu->isar.mvfr0 =3D u;
> +

Architecturally, Neon implies that you must have 32 dp registers,
but not having Neon does not imply that you must only have 16.
In particular, the Cortex-A15 always implements VFPv4-D32
whether Neon is enabled or not.

If you want to be able to turn off D32 and restrict to 16
registers, I think you need to add a separate property to
control that.

thanks
-- PMM

