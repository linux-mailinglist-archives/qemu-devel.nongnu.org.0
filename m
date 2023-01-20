Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E5675B41
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIv9P-0008UM-3N; Fri, 20 Jan 2023 12:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIv9M-0008T9-GP
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:26:00 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIv9K-00066y-RQ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:26:00 -0500
Received: by mail-pf1-x429.google.com with SMTP id x4so4494915pfj.1
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYIVZZONCmeVCTgi9AV9HBSfCHYcC14ZLWDsCVXDEa4=;
 b=dwLuAeEi/oaMO0EtzyqVfJloXh96OhzVUDPKcF+bKQ/NNht3Oc1yR9H57eQTIk7iCW
 dm7DAOaNtYeppJs5e90pjOp1WA7yRAyKqZJhq3bMDIWUm8aqFllXUj/EPWj1uhQRwhEW
 NhkSRv81DVVwQ2DXSPKP0sU9FtLT6xfSJT7jdwqBmIbObkm9OsovW6E4YmDv/Mjl6U9/
 gtntygBBKrrU9FhlkdouhIApx+9FqzB9XA/A2ynYU+7SnQmw6ZSk48bZVES6kXyg64sm
 kJFWa7KCpoxLVRdWyCeiDkF9XWkTzzCemOsmTS3dIFzdu6fCT72bN+aGLkJZMTt44dhZ
 fxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYIVZZONCmeVCTgi9AV9HBSfCHYcC14ZLWDsCVXDEa4=;
 b=a4kF0ifQ/+zaHlF7OBwiV2vXCXAcF1FVnKoZa42kSbYEEXn3AfZsyI1paq1Uqp14fN
 GpLxmUrSaDA9JhyQOtmFSm9voWt+b3zDirYDs2VhzGirOLYxRf/cngS/EnkfRFJFsSm+
 dkSKN+y+mdpOKdRHYpTMiZurdblwxkle6cHv2tmXItTxX3W29bbgqEXUQbzOBYEREKKU
 JympwNIAGlqbZ2/u92bmSnhEvyj8k00DhrRinCEb5J77m66K/yvoHVdX48fq5rHHXU70
 GNxzbNSgJ1shAzPngERin33DYhr962+WM6DwCmyBuZ+BP7qdxbHEDFDqLjSSeVNJWkyx
 /pzw==
X-Gm-Message-State: AFqh2kpXj45UVc8T20BkUc9QIg2aeXcjkBLvvscu1KdN6mGVhXCqi0FJ
 4t2z+1rZJqYGiQ5G18vBVnEZL13cCpCy2Gh9KVayug==
X-Google-Smtp-Source: AMrXdXt+FbwUMPRBtt7xM+SvVCY2k5fEmbo0RwPDjWMUWQUE9LumufDALMk+xtXQcba9uyEhCxTNaNlMAsw5v/VgDHM=
X-Received: by 2002:a63:31c8:0:b0:4cd:418b:3d2d with SMTP id
 x191-20020a6331c8000000b004cd418b3d2dmr1377571pgx.221.1674235557084; Fri, 20
 Jan 2023 09:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-16-clg@kaod.org>
 <3820fe22-3c10-acee-b5fc-4aec11be7303@kaod.org>
In-Reply-To: <3820fe22-3c10-acee-b5fc-4aec11be7303@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 17:25:45 +0000
Message-ID: <CAFEAcA-OoC0vL6i48fXv5nWnGAodqDKu0zDO1wX9KH_-Jc-S3Q@mail.gmail.com>
Subject: Re: [PATCH 15/25] target/arm: Allow users to set the number of VFP
 registers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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

On Fri, 20 Jan 2023 at 08:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/19/23 13:34, C=C3=A9dric Le Goater wrote:
> > Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
> > have 16 64-bit FPU registers and not 32 registers. Let users set the
> > number of VFP registers with a CPU property.
> >
> > The primary use case of this property is for the Cortex A7 of the
> > Aspeed AST2600 SoC.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >   target/arm/cpu.h        |  2 ++
> >   hw/arm/aspeed_ast2600.c |  2 ++
> >   target/arm/cpu.c        | 31 +++++++++++++++++++++++++++++++
> >   3 files changed, 35 insertions(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index bf2bce046d..5f2fefef4e 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -901,6 +901,8 @@ struct ArchCPU {
> >       bool has_pmu;
> >       /* CPU has VFP */
> >       bool has_vfp;
> > +    /* CPU has 32 VFP registers */
> > +    bool has_vfp_d32;
> >       /* CPU has Neon */
> >       bool has_neon;
> >       /* CPU has M-profile DSP extension */
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index cd75465c2b..37f43b4165 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -309,6 +309,8 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
> >                                   &error_abort);
> >           object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
> >                                   &error_abort);
> > +        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
> > +                                &error_abort);
> >           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> >                                    OBJECT(s->memory), &error_abort);
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 5f63316dbf..ad90de75fb 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1269,6 +1269,9 @@ static Property arm_cpu_cfgend_property =3D
> >   static Property arm_cpu_has_vfp_property =3D
> >               DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
> >
> > +static Property arm_cpu_has_vfp_d32_property =3D
> > +            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
> > +
> >   static Property arm_cpu_has_neon_property =3D
> >               DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
> >
> > @@ -1400,6 +1403,14 @@ void arm_cpu_post_init(Object *obj)
> >           }
> >       }
> >
> > +    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
> > +        cpu->has_vfp_d32 =3D true;
> > +        if (!kvm_enabled()) {
> > +            qdev_property_add_static(DEVICE(obj),
> > +                                     &arm_cpu_has_vfp_d32_property);
> > +        }
> > +    }
> > +
> >       if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
> >           cpu->has_neon =3D true;
> >           if (!kvm_enabled()) {
> > @@ -1661,6 +1672,26 @@ static void arm_cpu_realizefn(DeviceState *dev, =
Error **errp)
> >           return;
> >       }
> >
> > +    if (!cpu->has_vfp_d32 &&
> > +        arm_feature(env, ARM_FEATURE_V8) &&
> > +        !arm_feature(env, ARM_FEATURE_M)) {
> > +        error_setg(errp, "ARMv8A CPUs must have VFP32");

I wonder if we should instead not create the property for v8A CPUs?
That way there's no way for has_vfp_d32 to get set to false.
But checking after the fact is fine too. (One day we might move away
from the current setup where properties get set up per-object for
Arm CPUs and towards a "the class of the object determines the
properties it has" setup; the way we do it today is a bit odd for
historical reasons.)

> > +        return;
> > +    }
>
> The specs say that the permitted values of the SIMDReg bits [3:0]
> in Armv8-A are 0b0000 and 0b0010. In Armv8-M, the possible values
> of the field are b0001. All other values are reserved.
>
> This should be better :
>
>         if (arm_feature(env, ARM_FEATURE_V8)) {
>             if (arm_feature(env, ARM_FEATURE_M)) {
>                 if (cpu->has_vfp_d32) {

This is unreachable code, because we only set has_vfp_d32 to
true and set up the property if the CPU has the aa32_simd_r32
feature; and v8M CPUs will never have that feature, so
has_vfp_d32 must be false for them here.

(Put another way, we set up the property so we can only
"downgrade" from 32 to 16 dregs, so there is no need to
check whether a CPU that can't have 32 dregs still doesn't have
32 dregs.)

>                     error_setg(errp, "ARMv8-M CPUs do not support VFP-D32=
");
>                     return;
>                 }
>             } else if (!cpu->has_vfp_d32) {
>                 error_setg(errp, "ARMv8-A CPUs must have VFP-D32");
>                 return;
>             }
>         }
>
> ?

thanks
-- PMM

