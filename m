Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4940AAE9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:33:31 +0200 (CEST)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4oj-0008VC-C7
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ4mo-0007i1-Sv
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:31:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ4mn-00071R-6W
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:31:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso1500921wme.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=S6nH3QvRmIVZDKBpnpX4h9RgVBR7OCNn4jsKuoPq2Ek=;
 b=VIHROh2xzdPjRMDlMy2uP4AZpKIDqmRbC6PJ+HyWfpenT1J4Es/cMMoI5H+IvEzBpC
 Rz0HTHJuZonDL+cLu8hZRiZNm+T6yL6BzL3622KcfpRu/XhiBV8Yi8ObhnSbgwP0tr6Y
 1cl+9mUALEUCPbwTbJlJjCaAtJJoBfdRhvmDXeRWbsHsv+MeYCMvHAma1Vcm1xdhfMwh
 K+A/Dfj1C//MHTkohSVIcDZOqi+91pSYHScO7FH18bzRlcBPCixrJPabkk5Ghbc3THKF
 90/MW6BElzpS8YMfeZsAw9g4RVNsPYKF+3haltcjhoOgNaBc8moN5h+WyPx6iorFOTuJ
 O3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=S6nH3QvRmIVZDKBpnpX4h9RgVBR7OCNn4jsKuoPq2Ek=;
 b=gMGAXA8K7/1cOqSHHfaO+JAXugK3zVbRao06Jg5dVVDzMAEmNFmQ11rbJoPJk0599s
 XhP3GVGDYeYwgPfCviCGunDJ5pY6mkdawaqXLvkTjaAC+QHIEVIOguZCetEAll5JQgfh
 P5RjeEYsKrE0hThURF853/tzJ3nsrtto2ORS5rXaSJQXJxO3MqqaZojrnq8v3/6Z7kr8
 OBNScGa2TSNcUJ9NMZ3kqgtQvq2yiBJ/EY82uDFDE5R9dPV1crRpOA0ZIjhy7GmrDK9a
 1USqNjcpd9tZOOV5Fd7rFkUyTnA+YylwiAX4g3kqynXAwPZAdRoyuANfmI5JP8wNC1hn
 ZbIw==
X-Gm-Message-State: AOAM530+zefSwr1kwb1GGV9wonwNCNzhFcQvw76megBVFqIiWhLJVsy3
 7TyYB9J5kCQwFxZbefxTSxBThteeOdZH1pIymvobIG4LDY0=
X-Google-Smtp-Source: ABdhPJzM/i3Sd8CTMiNe2V6O+UXycxBq4k+n9d7N0au+1dnyUNhIAZmBti/GctPCYQ+Thl8o+Qwpwe+Dedm/L7F7/IU=
X-Received: by 2002:a1c:a505:: with SMTP id o5mr1079983wme.32.1631611887377;
 Tue, 14 Sep 2021 02:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210913200546.9338-1-peter.maydell@linaro.org>
In-Reply-To: <20210913200546.9338-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 10:30:36 +0100
Message-ID: <CAFEAcA8aiHo1NmOQs1K+TZg8A_wtKkLPbb3Oaw8eBy2USZyrvQ@mail.gmail.com>
Subject: Re: [PULL v4 00/23] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 21:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v3->v4: Windows headers define an INT type which clashed
> with an enum value name in arm_gicv3_its.c...
>
> The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210913-3
>
> for you to fetch changes up to 28e987a7e7edaa3ca7feeac65edca26145df8814:
>
>   hw/arm/mps2.c: Mark internal-only I2C buses as 'full' (2021-09-13 21:01:08 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * mark MPS2/MPS3 board-internal i2c buses as 'full' so that command
>    line user-created devices are not plugged into them
>  * Take an exception if PSTATE.IL is set
>  * Support an emulated ITS in the virt board
>  * Add support for kudo-bmc board
>  * Probe for KVM_CAP_ARM_VM_IPA_SIZE when creating scratch VM
>  * cadence_uart: Fix clock handling issues that prevented
>    u-boot from running
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

