Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39358669847
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:18:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJvx-0007db-Ju; Fri, 13 Jan 2023 08:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJvt-0007bl-Kw
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:17:21 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJvr-0007qi-SS
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:17:21 -0500
Received: by mail-pg1-x52a.google.com with SMTP id s67so14961751pgs.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O+x1ewfry7Yn4tG+ORJPQF7FxEIr7PRfmPrjUm2JgHw=;
 b=ZAKvONlvGkajF2EVCCBvD0PePWt/kyhrTUfz1WmgSJlbnD7N7FWkGICvGVRiESrc+4
 nXQ4JEVseQ959m31DknilRDk2h9Ox1YHxPTzgKVy2kD5gt8/7evSdXDmdv/iwBdBAGHg
 6eixCDtTPnvL27Sb+47hGH81FtfZ6ZVY1YCMf+uRkPbLhNrnjC3alV5nMXUPd819/wuA
 E517JzTztH6G3E1tP8c/WyAv+fgdPFpxgWAYyj1S/d+RMuRQTzbJrsVjxyR0elbmXdrm
 QGPuWOfVSbbhcN2iNIIp+vvZZJhosrBVOeJVSgz1RKBkKu7MRvkgYGJjWz6f+nSrpY+2
 PELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+x1ewfry7Yn4tG+ORJPQF7FxEIr7PRfmPrjUm2JgHw=;
 b=omnrKo9SSYD4F0dKq7AzqS7W8HRLL9OVYLwgwpyQP9k4pPnFTW4N0LzJgW94MvE16H
 dfSgZJcK9st10H50DxTCaHdHI45MKWt6KJ0IBAb4yWBAFM/qbdJwoISozID6duhG5IC0
 diEd5ZV8hmiuJlZY0VRNLxQ25IFRy5OYxuqUOnXS2ap/TAnL1bG4Xcx8okw43hJhMFK2
 13JfE4P+ghJkUa77ylCsfpTh+66SoWU4RVmu72xWUBFo1oO713lWRSJBYSDsyV2BuoIt
 DijomqZpN93tANPbDXrdTHr7dkqGGniYQC84cDIujEoAaf665EACqz2O/jaPST9xc+OE
 cyKQ==
X-Gm-Message-State: AFqh2kp0zDuLuuYGhCoMjvgD1K3kf0rgRE28y0fsaNOgS9hAD3j8Zk7g
 iEd1Q6XC1JYw1QAxqq2MvHyU1FYCw5NFa34A7ePChg==
X-Google-Smtp-Source: AMrXdXvysolgg6dhSvAR6Rk3vFwn4gSg+Qxi/8wpjuk4wEPTD8FqcIx3PKvmlhUR5q846ODB0X+mJoLwavuISq3Rj80=
X-Received: by 2002:aa7:9485:0:b0:582:bdaa:b575 with SMTP id
 z5-20020aa79485000000b00582bdaab575mr3310962pfk.51.1673615837536; Fri, 13 Jan
 2023 05:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
 <20230105221251.17896-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230105221251.17896-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:17:06 +0000
Message-ID: <CAFEAcA_z=rtYmaGWDWNib8tr_L==exWk5iBwkzsGMirRohFNog@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: provide RAZ/WI stubs for more DCC
 registers
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Thu, 5 Jan 2023 at 22:13, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Qemu doesn't implement Debug Communication Channel, however when running
> Microsoft Hyper-V in software-emulated ARM64 as a guest, it tries to
> access some of the DCM registers during an EL2 context switch.

I've occasionally thought about implementing the DCC as something
the QEMU user could connect to a QEMU chardev. But that would be
a lot of faff for no very obvious benefit, so making these registers
RAZ makes sense for now.

> Provide RAZ/WI stubs for OSDTRRX_EL1, OSDTRTX_EL1 and OSECCR_EL1
> registers in the same way the rest of DCM is currently done. Do
> account for access traps though with access_tda.

OSECCR_EL1 isn't part of DCC; it's a different bit of the external
debug interface.

> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  target/arm/debug_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index b244e146e2..2a7c3d7e38 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -673,6 +673,18 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .access = PL0_R, .accessfn = access_tda,
>        .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
> +      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
> +      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
> +      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },

A brief comment or two here would be nice.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

