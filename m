Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C87321E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 16:48:13 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqIYu-0002B3-G4
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 10:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35711)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hqIYa-0001mc-9R
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hqIYZ-00072O-66
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:47:52 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hqIYY-000724-Sq
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:47:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id x4so47272352wrt.6
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6cb3RFDR24s/aUoCUvuMZrdU+hlLaHxAk6COncmKdSo=;
 b=ZDs6jPvBOVtUyzfR3TRFp+hlL0VtBXdefFz2mOqhXv3BlzDXJ7h4bnTioIaZrHDGok
 Wre9hnbv/7CoNXbsSfbo11CK/xxfQGczDPmfJ7dA1ZwRrDKXAarXrDgrECqqnTChbBbU
 Ajy8NqI2ZVJ62nSljQclZaeRHi2Hu42k35QzlJKf1TITjLkLItVbZIoTHLC7mnV734Sr
 eVyjo4XaetcAVyf+IdTyvR++geircNNp4ptVwDpq3sHVcyGnGr3lv8RiWjcyN2JOWxEC
 XkfP3NKaTBjfZlZWAbwKrSvVEFMDyJzKB9HIpSIJCOLVDSFIuetIlPOLlnn+I0OYL3Pp
 v5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6cb3RFDR24s/aUoCUvuMZrdU+hlLaHxAk6COncmKdSo=;
 b=elTx25Y4/i3nRxOoK3ObeAgwOPAgkCgA3SVOcfGdx8pK49stDp5armmR+2kuS2W3Os
 /JmFg5HuHzOI8hIWOtDnUsdnfbeoWkaFmzznApGoxnghltrYnUtlpOBgA+QqF6aFPMbR
 YJA2y1A2pljt6VVTeRhOghQq8jzYrGZQ2eqQ/9CVNAbtS1h0JVz+2S0sX1rmCnZbeh8D
 N45c41HdQAOhLEnJzhPLZg3G8wSvTgJDYmQomAuFmD6NHey31pRqjtW6qwJoWUMvmA95
 ycv/kC8I2ZdnW1/pUYOUTxCfBg7RmhaaGKhppOWolC3r7Z/HHCnKl2ShELAE4uuypBcC
 /Kew==
X-Gm-Message-State: APjAAAXdAvMrDde1S8Dc76cfR/Qnvd7KaIJhjVF/KDsOkE2rw/l9Ehd1
 1AtZC35tRKQOSJIKDl23RXJOiw==
X-Google-Smtp-Source: APXvYqxVRr/tf/w8DpTn1LZQOsrPe6R9JeWICQRyjTeD5owxO+pOha/H6D5I4nLivwKzXeLH0ylzmg==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr10731365wrl.134.1563979669371; 
 Wed, 24 Jul 2019 07:47:49 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id r11sm57686533wre.14.2019.07.24.07.47.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 07:47:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C4601FF87;
 Wed, 24 Jul 2019 15:47:48 +0100 (BST)
References: <20190719210326.15466-1-richard.henderson@linaro.org>
 <20190719210326.15466-11-richard.henderson@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190719210326.15466-11-richard.henderson@linaro.org>
Date: Wed, 24 Jul 2019 15:47:48 +0100
Message-ID: <874l3b1obv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH for-4.2 10/24] target/arm: Update
 CNTVCT_EL0 for VHE
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The virtual offset may be 0 depending on EL, E2H and TGE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 40 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index da2e0627b2..3124d682a2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2484,9 +2484,31 @@ static uint64_t gt_cnt_read(CPUARMState *env, cons=
t ARMCPRegInfo *ri)
>      return gt_get_countervalue(env);
>  }
>
> +static uint64_t gt_virt_cnt_offset(CPUARMState *env)
> +{
> +    uint64_t hcr;
> +
> +    switch (arm_current_el(env)) {
> +    case 2:
> +        hcr =3D arm_hcr_el2_eff(env);
> +        if (hcr & HCR_E2H) {
> +            return 0;
> +        }
> +        break;
> +    case 0:
> +        hcr =3D arm_hcr_el2_eff(env);
> +        if ((hcr & (HCR_E2H | HCR_TGE)) =3D=3D (HCR_E2H | HCR_TGE)) {
> +            return 0;
> +        }
> +        break;
> +    }
> +
> +    return env->cp15.cntvoff_el2;
> +}
> +
>  static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *r=
i)
>  {
> -    return gt_get_countervalue(env) - env->cp15.cntvoff_el2;
> +    return gt_get_countervalue(env) - gt_virt_cnt_offset(env);
>  }
>
>  static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -2501,7 +2523,13 @@ static void gt_cval_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
>  static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
>                               int timeridx)
>  {
> -    uint64_t offset =3D timeridx =3D=3D GTIMER_VIRT ? env->cp15.cntvoff_=
el2 : 0;
> +    uint64_t offset =3D 0;
> +
> +    switch (timeridx) {
> +    case GTIMER_VIRT:
> +        offset =3D gt_virt_cnt_offset(env);
> +        break;
> +    }
>
>      return (uint32_t)(env->cp15.c14_timer[timeridx].cval -
>                        (gt_get_countervalue(env) - offset));
> @@ -2511,7 +2539,13 @@ static void gt_tval_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
>                            int timeridx,
>                            uint64_t value)
>  {
> -    uint64_t offset =3D timeridx =3D=3D GTIMER_VIRT ? env->cp15.cntvoff_=
el2 : 0;
> +    uint64_t offset =3D 0;
> +
> +    switch (timeridx) {
> +    case GTIMER_VIRT:
> +        offset =3D gt_virt_cnt_offset(env);
> +        break;
> +    }
>
>      trace_arm_gt_tval_write(timeridx, value);
>      env->cp15.c14_timer[timeridx].cval =3D gt_get_countervalue(env) - of=
fset +


--
Alex Benn=C3=A9e

