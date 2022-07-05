Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8E5672D0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kdP-0007ez-Qd
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8kc1-0006T8-K4
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:37:17 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8kby-0007eo-P3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:37:17 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id 64so13200048ybt.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B23Hv/JJ5V7B28rPjE1KNfCck5kfKEAAvzTIBAcZf58=;
 b=iNfJ7S3cL3ZiCB7LBQnEV1qNkdXw1wyxT2kEpu8f2i0tgYoQphsJxa6CvNYCVEPEOp
 Q68cDQlanL6e8JRCAq6H4abbM1UQeUUK5w2OqNCOxaf7FZWHIMxYY2NXfUUl/6L28Y12
 KJjSeeNOIfnaOXcvPZpnClhzODei6gr5Rcs6/9Q6MGA02Xrnlb5xZxQzpWz5+tNf3T/V
 NCljJniDdxpCpOPg950os6WQf6h8KYNILkrli4zHGFCY2LdHkkJYLQGz4Eeph7f7Vinq
 NxXnasvquq7lKNIf4PBVZPNnztHDOQwKPqySqFJXs4d2R5PzU04DZyP2dT6Gxs3+9lrh
 WnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B23Hv/JJ5V7B28rPjE1KNfCck5kfKEAAvzTIBAcZf58=;
 b=jCAzE3ScSz+mX1PTs/XaLibTq8tXamDaW5vETj1rRtMEaEsKR9wKwLRf/twfB/lPW5
 UqtpGemNqNa9lsH4L5ObwOHzEzSzt7cQCej3kXRtlDxpKtTDkffQoO6TFFW97FrWi5eb
 FoSDg3tpWI61m5s8UTlP769tCvda3akKMpUVJ8XbggdxQNM/mNZJodsAdGwai0mjks/H
 K3pLEWrfBF+3Nu05Go3bGB7itxp8S+dIcffTu0s62e4Mbt3o9D1n6xvafUvcE7l0X3WL
 oh6JsMUBylLbrWteZLMSDwHidQh1CDZdxefmYJk8cDn2SIL2L15m+F8lubH8Yk67Frc6
 oNBA==
X-Gm-Message-State: AJIora+SYnpwyVJitGWXJNGtnAYdzPTrjkqnUXR452O3QYV1u6ixFBmM
 oZmH8bkgneWk0S/uvdh/KJ3KhAC8ov5LT8L7h2SZgw==
X-Google-Smtp-Source: AGRyM1uQ8VJLqbmHgc8WFX25zYMyoDqaOWArw9hNa5g1EoKqP1VLqPNvjLMg0L6yHZiDoAsxgzCzgDf0/GIo+8bR0fM=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr11845773ybb.85.1657035433664; Tue, 05
 Jul 2022 08:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
In-Reply-To: <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 16:36:35 +0100
Message-ID: <CAFEAcA_5QBpjRH_VGFDG8bYFDduRJ9eew98WpeXXpceuhK6s4Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Sat, 2 Jul 2022 at 15:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 01:11, Peter Maydell wrote:
> > +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> > +{
> > +    /*
> > +     * We can't just OR together the aa32 and aa64 checks, because
> > +     * if there is no AArch64 support the aa64 function will default
> > +     * to returning true for a zero id_aa64dfr0.
> > +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> > +     * the AArch64 ID register values in id", because it's always the
> > +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> > +     */
> > +    if (id->id_aa64pfr0) {
> > +        return isar_feature_aa64_doublelock(id);
> > +    }
> > +    return isar_feature_aa32_doublelock(id);
> > +}
>
> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.
> It's probably easier to drop this function...
>
> > +static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > +                        uint64_t value)
> > +{
> > +    /*
> > +     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
> > +     * implemented this is RAZ/WI.
> > +     */
> > +    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
>
> ... and use
>
>      if (arm_feature(env, ARM_FEATURE_AARCH64)
>          ? cpu_isar_feature(aa64_doublelock, cpu)
>          : cpu_isar_feature(aa32_doublelock, cpu)) {
>
> since it's just used once.

If I squash in this change:

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 069dfe1d308..1f4f3e0485c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4218,22 +4218,6 @@ static inline bool isar_feature_any_ras(const
ARMISARegisters *id)
     return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
 }

-static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
-{
-    /*
-     * We can't just OR together the aa32 and aa64 checks, because
-     * if there is no AArch64 support the aa64 function will default
-     * to returning true for a zero id_aa64dfr0.
-     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
-     * the AArch64 ID register values in id", because it's always the
-     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
-     */
-    if (id->id_aa64pfr0) {
-        return isar_feature_aa64_doublelock(id);
-    }
-    return isar_feature_aa32_doublelock(id);
-}
-
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 62bd8f85383..d09fccb0a4f 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -617,11 +617,14 @@ static void oslar_write(CPUARMState *env, const
ARMCPRegInfo *ri,
 static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     /*
      * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
      * implemented this is RAZ/WI.
      */
-    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
+    if(arm_feature(env, ARM_FEATURE_AARCH64)
+       ? cpu_isar_feature(aa64_doublelock, cpu)
+       : cpu_isar_feature(aa32_doublelock, cpu)) {
         env->cp15.osdlr_el1 = value & 1;
     }
 }




can I have a reviewed-by? Would save me doing a respin.

thanks
-- PMM

