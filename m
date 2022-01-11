Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40348AFDE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:48:50 +0100 (CET)
Received: from localhost ([::1]:47584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IS9-0003bq-7X
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Hg0-0001iE-7V
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:59:04 -0500
Received: from [2a00:1450:4864:20::42c] (port=36708
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Hfx-0007TR-Tn
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:59:03 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r28so4754065wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0S24GbNlH/zMOK0Dq8vzMLE3BUZEfsOBAPd3kCGXLI=;
 b=xJIUuFglseW+loQm20MX0XfMvDv5bNtf6k5I/FwW4t8tvtjIN9Ko5fHkO0aHRyxbqj
 V8eOPXN3uoDJv4Mr69nuTUZOekiSNDrksGA8izGa1Qmqhspbi8mc7jRR1ELddP4+sLty
 PygolyxT5VLR0E0ie+2KsEomPgM68WLk5+H2U054Qfg9Ro6N4oHMkwJmjaf1RNwlI5aL
 FfthQ+9l2w6nKq7Ha8/C5KclTC2Tfud/iK2vNpT/4E1GelkhHoahcbL6V3kFrv6MytyR
 tnc7nYZ2f3fba9+Y2ix6C8g3MuvvBrUcH9n3WmFHLP+YBsWhtWVpCuSyvXYdx2ZrdglE
 yC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0S24GbNlH/zMOK0Dq8vzMLE3BUZEfsOBAPd3kCGXLI=;
 b=ODaLt1ECxmMsXlrNQo5LQEk0G5oga68hlZPvrY3qDSect4svmGRt1h/ueeW7lYhvqH
 4YAudyx86+TGVc6OtOxUkHag3j656ZPeTpDOlZ3FGyv8oPeyM5GAAeB51i0sjtK/64oI
 lcRCsJr/WVtT26cwzB+2PNoSc98s2LKXukfagKNuFxpltu8893zE+pI1CE8ybD7sm6O1
 Ewbh2Ne7SpGk8KArfTNSK3zJ4TA42rSEKS3yCfkDinQRtgKuRrLJ6Aq6gafKRhWXLTCt
 rYlCvuREW+i6Mm2glLnrQUGzaaS3NJr3QFg/WeOZHa9wS250J3DiMHyj8sa8SjMYPbx5
 oslw==
X-Gm-Message-State: AOAM532KoW3gDg6WU90XTuldzxhOmBCpJ9J89wffhd6y5eReCP9T1WUQ
 cuYSAtCzt0KnRMhZjFrQ/RZn/7+/v6unAuumdNwUrQ==
X-Google-Smtp-Source: ABdhPJxSa/pjNGlZajE5AGDkqsOOzhaiVdqBzYlyttImUrEV5HxX+Ns0FRy1giAxhN66dwG5IAen+GYN7Aw3khMJMMA=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr4051250wrv.521.1641909540226; 
 Tue, 11 Jan 2022 05:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20220107150154.2490308-1-maz@kernel.org>
 <a3d32f18-dbbb-e462-82ce-722f424707f9@linaro.org>
 <c9a3552aa067ba691055841b5e3fb7b7@kernel.org>
In-Reply-To: <c9a3552aa067ba691055841b5e3fb7b7@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 13:58:49 +0000
Message-ID: <CAFEAcA8L5pH41cQ6srk9-JbMKNjdhCD7YpWcw4P06t83Jp11vw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/virt: KVM: Enable PAuth when supported by the
 host
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 13:42, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-01-07 20:23, Richard Henderson wrote:
> > On 1/7/22 7:01 AM, Marc Zyngier wrote:
> >> @@ -1380,17 +1380,10 @@ void arm_cpu_finalize_features(ARMCPU *cpu,
> >> Error **errp)
> >>               return;
> >>           }
> >>   -        /*
> >> -         * KVM does not support modifications to this feature.
> >> -         * We have not registered the cpu properties when KVM
> >> -         * is in use, so the user will not be able to set them.
> >> -         */
> >> -        if (!kvm_enabled()) {
> >> -            arm_cpu_pauth_finalize(cpu, &local_err);
> >> -            if (local_err != NULL) {
> >> +        arm_cpu_pauth_finalize(cpu, &local_err);
> >> +        if (local_err != NULL) {
> >>                   error_propagate(errp, local_err);
> >>                   return;
> >> -            }
> >>           }
> >
> > Indentation is still off -- error + return should be out-dented one
> > level.
> >
>
> Duh. Clearly, my brain can't spot these. Apologies for the extra noise.
>
> > Otherwise,
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Thanks. I'll repost a version shortly, unless someone shouts.

Don't worry about it -- I've applied this to target-arm.next and
fixed the indent there.

-- PMM

