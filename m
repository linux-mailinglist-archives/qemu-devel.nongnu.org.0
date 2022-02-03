Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599404A890E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:49:45 +0100 (CET)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfIm-0003Bw-E0
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:49:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFfG5-0000Ou-NB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:46:58 -0500
Received: from [2a00:1450:4864:20::435] (port=35429
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFfG3-0005jM-Rt
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:46:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id j25so5483752wrb.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=IixX6o29BYZaBtvpwlQWbrJhi0PVxfPGBxOB9B310z0=;
 b=aUslcYj+W/Kr1nyAIStGL9hATe/vdqsoYumd2fd6INU/X3nhkxRd03yQQ8ocAQdEAk
 TwbQ93/d/aTX8Wx2FR4+j6Tm2xcSMqB6fWO5q5bWfFmzfnRo/w03QsKDnkYXd388MI1T
 Y6aKWoUxUgHrmpx2ld2jxl+u4K9T1FCV3ytpc+r2CiYp/Vm8gL87lTUJuv7C2EVPJbSy
 HyIQA2f3M171aGjGvFPo1QNruLu27pteazh+LKUh3hcoYfbdBUr9BHtzAZHWWFrgww8H
 xLLH3OXu+BtPbm/4GKy9HRjCGiaXCQk5IW6b8kMXMv80SAT/eyMJEeWt1oetK0tUSnX9
 XZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=IixX6o29BYZaBtvpwlQWbrJhi0PVxfPGBxOB9B310z0=;
 b=26ZxFvko6sRieDse/ClC7/Nw+y7QAJkmqbHumE9uwXCTDd68afZqIZablSpQVLCuT5
 U1WR7ISB+sFeNDe7UWPm/9gEX/SsrCt/WdQx9bg6jB2cz0QbUUmRRLCfxOhm/v1SmtN7
 10QWGsXpkJY1Ynk5MbwoBLdnkdcY0h8FJlhtfXwMGr19yW1y0CRVmnqUSzCn7D53YQsW
 6/Co8IL83jf9gIQLzmUb/Efn0kBj3JvRixze1gWdqzM7kzu6KsAaPfwDnyk402+/lu17
 tBS8KpfeZsdgIQGO+/Mut7iO0A+8wwxeXVmN8e/HT0lLRm/jHhf2UOBWOPZD5ka9Ej8L
 s0Lw==
X-Gm-Message-State: AOAM533BSn1WqtaBLjch7Y6jCsjRrW/semfyeGryj0ecWjGm9NxKvkdP
 DzBDLsrrUWk9odT5wRnlzkpJVzOV3l0spHCmNLtGnX5lZHo=
X-Google-Smtp-Source: ABdhPJwae5dYBNyUe/mmkOqwBWUt/ns//Kk+kae1Myanml21zEpgfGxoUBfisPz5ObhFVMv3Dqyrug6hSKu4R+kCGNw=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr29220690wrq.295.1643906793050; 
 Thu, 03 Feb 2022 08:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <20191101085140.5205-10-peter.maydell@linaro.org>
In-Reply-To: <20191101085140.5205-10-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 16:46:21 +0000
Message-ID: <CAFEAcA8pS6_SYWMFJ0=EyHVQ9V1MTiM_OCjkvqb5znqJ91w_qw@mail.gmail.com>
Subject: Re: [PULL 09/11] target/arm/kvm: host cpu: Add support for sve<N>
 properties
To: qemu-devel@nongnu.org, Andrew Jones <drjones@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Fri, 1 Nov 2019 at 08:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Andrew Jones <drjones@redhat.com>
>
> Allow cpu 'host' to enable SVE when it's available, unless the
> user chooses to disable it with the added 'sve=off' cpu property.
> Also give the user the ability to select vector lengths with the
> sve<N> properties. We don't adopt 'max' cpu's other sve property,
> sve-max-vq, because that property is difficult to use with KVM.
> That property assumes all vector lengths in the range from 1 up
> to and including the specified maximum length are supported, but
> there may be optional lengths not supported by the host in that
> range. With KVM one must be more specific when enabling vector
> lengths.

Hi; I've been looking at the '-cpu max' vs '-cpu host' code
as part of trying to sort out the 'hvf' accelerator doing
oddly different things with them. I noticed an oddity
introduced in this patch. In the commit message you say that
we deliberately leave the 'sve-max-vq' property out of the
new aarch64_add_sve_properties(), because it is difficult to
use with KVM. But in the code for handling '-cpu max' in
aarch64_max_initfn():

> @@ -602,17 +617,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
>  static void aarch64_max_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> -    uint32_t vq;
> -    uint64_t t;
>
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -        if (kvm_arm_sve_supported(CPU(cpu))) {
> -            t = cpu->isar.id_aa64pfr0;
> -            t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> -            cpu->isar.id_aa64pfr0 = t;
> -        }

because this 'if' doesn't exit the function early...

>      } else {
> +        uint64_t t;
>          uint32_t u;
>          aarch64_a57_initfn(obj);
>
> @@ -712,17 +721,9 @@ static void aarch64_max_initfn(Object *obj)
>  #endif
>      }

...all this code at the tail of the function runs for both KVM
and TCG, and it still sets the sve-max-vq property, even for
using '-cpu max' with KVM.

> -    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> -                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
> +    aarch64_add_sve_properties(obj);
>      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                          cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> -
> -    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
> -        char name[8];
> -        sprintf(name, "sve%d", vq * 128);
> -        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
> -                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
> -    }
>  }

Was this intentional?

I'd like to fix up the weird divergence between -cpu host and
-cpu max, either by moving sve-max-vq into aarch64_add_sve_properties()
so it's present on both, or by changing the aarch64_max_initfn() so
it only adds the property when using TCG.

(I think also this code may get the '-cpu max,aarch64=off' case wrong,
as it doesn't guard the calls to add the sve and pauth properties
with the "if aarch64" feature check.)

thanks
-- PMM

