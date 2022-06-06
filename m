Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D853E4DA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:48:16 +0200 (CEST)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyD5b-00059b-16
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCQ5-0006s1-TF
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:05:21 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCQ2-0007yK-AN
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:05:20 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-30ce6492a60so142109487b3.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fwc/xxhdclU4+nctShI1c44+1rZCvhoekq+8YBPYj74=;
 b=S41rEUClZYtaosCgY6/yX+PHpIfJh5Q4stLGC1LFOSUjnx1ODopmG/Y3rTPVC3JqfV
 CbK6jabNraSmwQMZHA7fhuuXHAuDabvEmROficmFKiaYkqF0Xvku4t1mv043cdeVlZdb
 crWM3hF/bChhUTdjSm+KbzBbU89fXm/vo9j024rNpqr3U8/IUAJG/ldrgLNvltIj4o1B
 0cC8w94skb06Z8bz2c5d87vCXNx75u+x0i0pYJzzAHtSlUDNziDIgfj+eKlranmErIaP
 nwZ26exB6vUQe+qzhfvthdX2YyXQgNjK0tG6aYzuSlPVihqL4IvBo+fFN3GWy5+yl6mt
 /l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwc/xxhdclU4+nctShI1c44+1rZCvhoekq+8YBPYj74=;
 b=dYM/0fTDSQRIGnxgTmEPtPI9UcnkQn+hUCJCQcG1arfF7+tlRP4S39lktZhlp47lMy
 yku1YQpKPLqAnIe5oxFV90wwoizapJGvCYQjY/tHqsgsEMM+T29kBTUjv5QMmwkopZnp
 wysICPezX/JgDJiBN4hkcynoWaTeGMCIeZHT+MrhR80MjDDhLxBl5lSrh+fiAEabVY7w
 XnKAUTvAKelcWMvUif02o1Hooq3OiPVzofwRI+hdG+WpURzaZomx34egX1ZaG4XM6dAH
 jxYequ9h4FGmj4fFzw5l8yIEWjHa/tVoyoAFzYvzWKNCePLDhsPQ/kKKI3bDWzvcqoHC
 qDuA==
X-Gm-Message-State: AOAM532C8K/9m0zHF8k5PP3+GctWQOCgqU5gd+6wLYLW8LGP/P0ahT+z
 e3bc/RwMkU1p+ZankCSCSWAseKJUx1lO7eNzGeyJnQ==
X-Google-Smtp-Source: ABdhPJxfCmMc26+Z09hsDYe2bobxxI23JT0SrJGy/jiwyRIi+1vGvKV12i3fX4eGqE+pqAX5ACyGJ7hUudU9njvCm/M=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr26007674ywb.10.1654520717219; Mon, 06
 Jun 2022 06:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-21-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:05:06 +0100
Message-ID: <CAFEAcA_HoMLWudYorTmJTgqGPv1mwi8jZ3GkhjQB3TorZCOrWg@mail.gmail.com>
Subject: Re: [PATCH 20/71] target/arm: Add ID_AA64SMFR0_EL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Jun 2022 at 23:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This register is allocated from the existing block of id registers,
> so it is already RES0 for cpus that do not implement SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -682,13 +682,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          ahcf->isar.id_aa64pfr0 = t;
>
>          /*
> -         * Before v5.1, KVM did not support SVE and did not expose
> -         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
> -         * not expose the register to "user" requests like this
> -         * unless the host supports SVE.
> +         * KVM began exposing the unallocated ID registers as RAZ in 4.15.
> +         * Using SVE supported is an easy way to tell if these registers
> +         * are exposed, since both of these depend on SVE anyway.
>           */

This slightly loses context described in the old comment, though the
old comment isn't quite correct either. Between kernel commits 73433762fcae
(part of the initial implementation of SVE support) and f81cb2c3ad41 (which
fixed this bug), the kernel did indeed not expose ID_AA64ZFR0_EL1 as RAZ if
SVE was not implemented. So there's a range of kernels that had this
bug and for which we need to guard the access to ID_AA64ZFR0_EL1.
This isn't the case for ID_AA64SMFR0_EL1, though, which all kernels
should handle correctly (ignoring the pre-4.15 case).

So I think:
 (1) we should read ID_AA64SMFR0_EL1 further up in the same code
block where we read all the other ID registers like id_aa64mmfr0 etc.

 (2) separately, we should update this comment to read something like:

/*
 * There is a range of kernels between kernel commit 73433762fcae
 * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
 * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
 * SVE support, so we only read it here, rather than together with all
 * the other ID registers earlier.
 */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

