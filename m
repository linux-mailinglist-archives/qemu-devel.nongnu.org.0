Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805159113D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 15:15:14 +0200 (CEST)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMUVM-0004rE-Mi
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 09:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMUS3-0001J4-HA
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:11:47 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMUS1-0001Ub-V4
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:11:47 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o15so1390688yba.10
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=P1C4VQhdPfJuLu+mTH4UUJebfVuHTWmuwkDsQh4A60M=;
 b=M1VSulPm9vUlNYQUzBzcDeJc3XJSI8iz3q7nDuBIJo8pNECM/qyvpgRolGTij02YZG
 An0Lvm55mTfwg3r8HI6oj4R9vFcs9mI7wjtAO8v/5MPrhuQaZjYhljNTO6HuNGhtv2SF
 m84/hU5FfU80UpUhW9XtWpSS4yg7OeNydcChP01027LNZbVLXGrPAqikKV3n1gMmpzvA
 1j9lRyKBusVVGIW6+HPC0cmUyRivQ643F9Sv4AheWsDwE6ij9/8VT0p/LFCHxBJBPtgJ
 FW+cV2aorARWTVQcoHh8gMiAcNdl5YWMSxLqsB6p78miatB/Y6v0PWt8jzQup0vxAKW9
 L7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=P1C4VQhdPfJuLu+mTH4UUJebfVuHTWmuwkDsQh4A60M=;
 b=c61IA4XawFgFLWo+aG3kZVDTE+US9SVzs7HjbA6iv4KGbm9evqzUz7W1+HaPjqFkJ2
 aAtlQTrhT4VxmVJV1qlcWZOyoCgLyMRXiC0ROm0XNOHvxayeyLdOwxfIzVNWfMEdG0Gi
 /TcI65dBRJUQDI3fNvnkofH9/GkYfBXW6FEbDjuWl4hJf9R6EevO700PFpRl2vVyoYX6
 3xS1bu+ChccaWsxTZiJRQUJ12gAoRWKzofSJadO8AfPklY7qiCJFNFSyVFgh8EmSexuR
 M64oKEgsvZQZD5KkpsQG/B5HhqzMCyILNrzhs9M8rggkhZeBB4iNZFzlog1HELP0ufXb
 353A==
X-Gm-Message-State: ACgBeo0hrDvmeqxVH7zbIMaVabJnxYZKXU4/JOZfw+YuA4jKe36GUyf7
 3gnNSPcQphrKcVTu27aOxo7enOhuQfTYlWe3QMwcPQ==
X-Google-Smtp-Source: AA6agR6dby302jQKjkCBqpPhHBIZfTRlAC1is3dx/oxtIMezWe2D7wA/pJKaIVjbSflwfYs/zg5XdYsqlg1EIfNuhSM=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr3255998ybq.140.1660309904748; Fri, 12
 Aug 2022 06:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
 <20220718115433.802-4-quic_trohmel@quicinc.com>
In-Reply-To: <20220718115433.802-4-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 14:11:33 +0100
Message-ID: <CAFEAcA8KF_LxH5F9RxJGmWLQmxi5hxdnTUZMwGaR6=QFrJqFkw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] target/arm: Make RVBAR available for all ARMv8 CPUs
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org, Tobias Roehmel <tobias.roehmel@rwth-aachen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

(I've added your rwth-aachen.de address because the quicinc
one seems to be bouncing :-( )

On Mon, 18 Jul 2022 at 12:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>

Having looked a bit more carefully at the architecture
manual, I think this is not complete. In particular
you don't actually define the AArch32 RVBAR register
(which needs to exist with permissions permitting only
EL2 access if EL2 is the highest EL, and with permissions
for EL1 access if EL1 is the highest EL, in the same way
the AArch64 RVBAR_EL2 and RVBAR_EL1 work (ie by adding
AArch32 alias registers where we define RVBAR_EL2 and
RVBAR_EL1).

(AArch32 has no equivalent of RVBAR_EL3; MVBAR is kind
of the same thing, but it's not required that it has the
actual reset address in it on reset. So we can ignore that
as we're architecturally compliant for A-profile, and for
the R52 we don't care about EL3.).

The commit message here could also usefully be expanded
to explain what we're doing and why it's the right thing.

> ---
>  target/arm/cpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1b5d535788..9007768418 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -258,6 +258,10 @@ static void arm_cpu_reset(DeviceState *dev)
>          env->cp15.cpacr_el1 =3D FIELD_DP64(env->cp15.cpacr_el1,
>                                           CPACR, CP11, 3);
>  #endif
> +        if (arm_feature(env, ARM_FEATURE_V8)) {
> +            env->cp15.rvbar =3D cpu->rvbar_prop;
> +            env->regs[15] =3D cpu->rvbar_prop;
> +        }
>      }
>
>  #if defined(CONFIG_USER_ONLY)
> @@ -1273,7 +1277,7 @@ void arm_cpu_post_init(Object *obj)
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_prop=
erty);
>      }
>
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +    if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
>          object_property_add_uint64_ptr(obj, "rvbar",
>                                         &cpu->rvbar_prop,
>                                         OBJ_PROP_FLAG_READWRITE);

thanks
-- PMM

