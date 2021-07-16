Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96A3CB462
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:33:57 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4JIC-0000eJ-QH
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4JHJ-00082D-Ac
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:33:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4JHF-0007va-RU
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:33:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id l1so11843062edr.11
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BaN6Pg4jjCRiD6xfsS8Dp/x6pwe7CI/AwxlmE99e77Q=;
 b=Pf8zSlwHL1hWY2cy5rA8H0Gv/ZiDhfRRmM/wsCCythm2yVfvs0Zpi95X6yNWIyuaP0
 LCMtknpKsJZmPYhAIWHsmVYVM+O6s8dfdxvF09STw2ERfWSjRntd2cB45YR8jY6UB/gy
 236BlZlwwYsdxicEtNAeRe5Dcd4Kp9og0996isJICvF5slkM4KNB4OyqGWZAzFGXROsH
 PXqu7bfo38bPDPQI/8ggATAdIfNAej9Ogya7kPf5xEpfOyu4NpxpyEGfX6gL/AplV64I
 G7JLbenCBEY6JuSQt260pNaFuz0Vg1rTWVnaUTT8hI5enTE1jtGxLP3xpHZXO/2VCC7Q
 o4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BaN6Pg4jjCRiD6xfsS8Dp/x6pwe7CI/AwxlmE99e77Q=;
 b=ViOIefvYb8xWEZQ1Sc/jXnzRaLfoI0xZMftioUER4EO5eYA9PJNqtKO/wMk23rkwIz
 KHTGi+GtYDH2dUDiMPfnrkQax2OWF4CVKUpB6Mpna3F6haqI6e0kmVWkkdu312HBjMVn
 gf/6IIy7hNcWqdveBTWbbdfFUX8ytzaoUntIXwmxWtRNfHSrhtmgv+jLwVNFHn67hvEG
 7v0/OENPwu7U4fchBEuYJ60fmDPC//XkQZP11M5ViCdTaQ5lNPbN4gPzXcWIGQr6W68x
 OLdV6P4Nuiz19nHysHlVwL1EoCc2o/zsvNXl5QxFcEscK/bhXdBCceTqIk9UHuLtMAZA
 05dg==
X-Gm-Message-State: AOAM530QtZ9pCyya+hvAdd8sRCvZsF6IRIow3BftHkDpxB2xg5/rRWco
 cqtgAzExm7bbxhkcpmaJexHKUiy8V90aUDZCjUSV1A==
X-Google-Smtp-Source: ABdhPJzaH6u+NiexdkMeKc1qtg+uzIV4WYLWdcr3dfDwhnFxZ2l6ISJKZA5MIOn+nZSfL5UXZh05Mqj4tsQbhvpXNp4=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr13242739edq.146.1626424375856; 
 Fri, 16 Jul 2021 01:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <SY4PR01MB6798FDE7B97E478254D6B955F6139@SY4PR01MB6798.ausprd01.prod.outlook.com>
In-Reply-To: <SY4PR01MB6798FDE7B97E478254D6B955F6139@SY4PR01MB6798.ausprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 09:32:15 +0100
Message-ID: <CAFEAcA97bUkyHL+=LuToYgG-HWgppfbBc=BqO=BdboSWfF=Kcg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Fix GICv3 redistributor security
 checking
To: Tianrui Wei <tianrui-wei@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Shlomo Pongratz <shlomo.pongratz@huawei.com>,
 Jonathan Balkind <jbalkind@ucsb.edu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Shannon Zhao <shannon.zhao@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 20:46, Tianrui Wei <tianrui-wei@outlook.com> wrote:
>
> For redistributor to send sgi, we must test NSACR bits in secure mode.
> However, current implementation inverts the security check, wrongly
> skipping this it when the CPU is in secure state, and only carrying out
> the check when the CPU is not secure or security is not implemented.
> This patch corrects this problem by correcting the inversion of CPU
> secure state checking. It has been tested to work with Linux version 5.11
> in both aarch64 and arm version of qemu.
>
> According to =E2=80=9CArm Generic Interrupt Controller Architecture
> Specification GIC architecture version 3 and version 4,=E2=80=9D p. 930, =
2008.
> Chapter 12, page 530, when there is only one security state implemented,
> GICD.CTLR.DS is always 0, thus checking NSACR in non-secure state. When
> cpu is in secure state, ns =3D 0, thus the NSACR check is never performed=
.
>
> Signed-off-by: Tianrui Wei <tianrui-wei@outlook.com>
> Signed-off-by: Jonathan Balkind <jbalkind@ucsb.edu>
> Tested-by: Tianrui Wei <tianrui-wei@outlook.com>
> ---
>  hw/intc/arm_gicv3_redist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 53da703ed8..84cfcfd18f 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -564,7 +564,7 @@ void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp=
, int irq, bool ns)
>          return;
>      }
>
> -    if (ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +    if (!ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
>          /* If security is enabled we must test the NSACR bits */
>          int nsaccess =3D gicr_ns_access(cs, irq);

So, before this change:
 * if the access to ICC_SGI[01]R_EL1 attempting to kick off this SGI
   is done in Secure state, we allow it
 * if the GIC has security disabled (GICD_CTLR.DS is 1), we allow it
 * if the access is from NonSecure and the GIC does not have security
   disabled, we check the NSACR bits to see if we should allow it

With this change, we check the NSACR bits for accesses from Secure
state, and we don't check them for accesses from NonSecure.
This doesn't seem to me to match what the spec requires: in version
IHI0069G of the GICv3 spec, section 12.1.10, the tables show that
only accesses from NonSecure are subject to NSACR checks. (This makes
intuitive sense: the GICR_NSACR is the NonSecure Access Control
Register and it is controls NonSecure accesses, not Secure accesses.)

What bug are you trying to fix with this patch ?

thanks
-- PMM

