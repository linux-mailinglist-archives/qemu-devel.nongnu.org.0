Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F84C2D2E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:35:50 +0100 (CET)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEHd-0007zf-9F
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNEF3-0006Wx-PF
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:33:09 -0500
Received: from [2607:f8b0:4864:20::1133] (port=39923
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNEF1-00013I-Rd
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:33:09 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2d07ae0b1bfso25191177b3.6
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2oR3jzkZF1FuTCdkP1d7JXrysRcu+SsDR6/8Luarz0U=;
 b=PrRPm7fAuyTg06LTBnrcrsqUBKoiRV8VM8NAOR3gG+5DLfT4rIBtve85Jdlaz1RUI7
 H7YLNvUNOtIO2SGXrudoaXRz+UtcS6ZqRHOKwdaDb5IkRzotRO6onju4RCEUwRfOdYc3
 tdPp0sM2d+bUQ8Sa0gc07Y7n/qEmq9ixqXbKjFUr99IeU4NIj+SFDsNXkyewEUI7aOTx
 P7VfiyCaQX8mAlFod22V06QQYEO1HhdL14Ld0Z9Ra+1ZqFSKImNGkxl3XaIjLGFKQ/di
 qclQE3sCzFXmMG2ZCmIg1ApN8agpz6FNPjUuVwhcQPfqQgqVCoC8TgczC98S57KmWEHN
 tJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2oR3jzkZF1FuTCdkP1d7JXrysRcu+SsDR6/8Luarz0U=;
 b=T8L5qb8Fmb0nH74I2ifnyWHY9zvyWVZAtp/mx/LzOhT2R+CTUoyNPENbpTSdwsKJLo
 lKQDEt+Z1ILZk+E8lFDA159HI+11S9FCYWxvO5sYfLvkZjlg9Mw/Zh9ZHkBT+qJPTAE7
 qLzOBpgPj+gRkEWoqAj9fthwBTrKhsach4jdUo8GSq37nQa5+Uv1KPQpt3i4syeO2JBA
 SMyyjKf24dMivRFcmioGSsijr0GRTAlquZwQlvedcv9anr+FgbF0KmQI82jTsilMAy8o
 U4xtGygnyA4TdzN5qyVfyVXYWyyKF/jlVhuRI999PHjKrb3ZKvu69OA2lp+x94uC6NpM
 nGrA==
X-Gm-Message-State: AOAM5337W6RH0Mk6VO5wFCntv1Mc24zxdnJ+SibOwmGGec6zmHtfQnXV
 Hbp+l8ThqUZIbUeUAn2j8Jd2Pqy/xa70KPfrd+I44A==
X-Google-Smtp-Source: ABdhPJzj25BHG1OICpDnpM7Yv2L1tx4Mu5t5LODw8XP0Rjc6ikAhwGBz3TomLS419MHY8bWMgXBzPg/5SnVSO/OaYic=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr2316666ywb.64.1645709584519; Thu, 24
 Feb 2022 05:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20220213035753.34577-1-akihiko.odaki@gmail.com>
 <CAFEAcA8_VgsR=Bcn1wxxaLotxQH3sumYMt1=3NxwHcdQFLPYqA@mail.gmail.com>
In-Reply-To: <CAFEAcA8_VgsR=Bcn1wxxaLotxQH3sumYMt1=3NxwHcdQFLPYqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 13:32:53 +0000
Message-ID: <CAFEAcA9vbaQ+3XHNDtN79b=Y36M8q5WH9yTxXOX-zt+wh5qQow@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 13:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > Support the latest PSCI on TCG and HVF. A 64-bit function called from
> > AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> > Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> > they do not implement mandatory functions.
>
> >  /* PSCI v0.2 return values used by TCG emulation of PSCI */
> >
> >  /* No Trusted OS migration to worry about when offlining CPUs */
> >  #define QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED        2
> >
> > -/* We implement version 0.2 only */
> > -#define QEMU_PSCI_0_2_RET_VERSION_0_2                       2
> > +#define QEMU_PSCI_VERSION_0_1                     0x00001
> > +#define QEMU_PSCI_VERSION_0_2                     0x00002
> > +#define QEMU_PSCI_VERSION_1_1                     0x10001
>
> Just noticed that there's a minor issue with this change -- it
> deletes the definition of QEMU_PSCI_0_2_RET_VERSION_0_2, but
> it is still used below:
>
> >
> >  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
> >  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
>
> here ^^  which means that this breaks compilation on Arm hosts.
>
> I'll squash in the fix:
>
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -98,8 +98,11 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES,
> PSCI_1_0_FN_PSCI_FEATURES);
>  #define QEMU_PSCI_VERSION_1_1                     0x10001
>
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
> -MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
> +/* We don't bother to check every possible version value */
> +MISMATCH_CHECK(QEMU_PSCI_VERSION_0_2,
>                 (PSCI_VERSION_MAJOR(0) | PSCI_VERSION_MINOR(2)));
> +MISMATCH_CHECK(QEMU_PSCI_VERSION_1_1,
> +               (PSCI_VERSION_MAJOR(1) | PSCI_VERSION_MINOR(1)));

Ha, turns out the existing check line was wrong : it ORs together
the major and minor, which only works if the major happens to be 0.
Actually working lines:

MISMATCH_CHECK(QEMU_PSCI_VERSION_0_2, PSCI_VERSION(0, 2));
MISMATCH_CHECK(QEMU_PSCI_VERSION_1_1, PSCI_VERSION(1, 1));

-- PMM

