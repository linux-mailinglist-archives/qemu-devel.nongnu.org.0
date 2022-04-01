Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E94EEE51
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:39:44 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHV9-0007bj-8E
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:39:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHRR-0002Kp-2j
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:35:53 -0400
Received: from [2607:f8b0:4864:20::b33] (port=33455
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHRO-0000kM-Gz
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:35:52 -0400
Received: by mail-yb1-xb33.google.com with SMTP id j2so5161054ybu.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITyy9MXaeEOsnJnDyxk/ZxSyG8YY0CsdmowKVaSIqWM=;
 b=JiNoNc4n4WgapQOJxCS5ypF2GBMG7EMqT4B2jzPyhkgc140/XQSkHpXZ9USPQS0SvH
 F+WVZ1WpK2ecfXKtZYhGtu8BjHxIj2KbUQthSPWupC6brwOBE1J3+hDGBD1wV+3O4dfO
 VOM5sDaPJQPCEWaXG7hLOtXw/y9JfbXekw1M0oJMIm0vJd+o1Hge5K1T73QdHyyWs2uj
 ffSODRDlIGM0BD9pQLfb4xW5IyiSux29GklMzD8KOprOIdlgfe++LQUJ/Rvv48pM9pGB
 8BteRhLEuF0dEEq7/1nAx8pFMhAS3tdraaWHcBcZo67r+LkUA/GhE7ZR5cMYmCxQ+oCz
 8/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITyy9MXaeEOsnJnDyxk/ZxSyG8YY0CsdmowKVaSIqWM=;
 b=N1qZkZxn+ksPQau3hyKL2gghy2B1i586ERyk/PQTPVc4GSryqlT2N7FSrZBt0e/cSz
 NQkP06LylEXbZ9N0nX6TrOpBroGPxNN0z5ZUhBdxoaxb5RHZj1Jhfaj4XZ9ZhfgK3YKw
 w7efVDx5lPGCYyHJss91WKnEi1hHlJFTU0ebZzRKZ1iG7kA9OfOeDqjypqpMgGoPaAOv
 AjRnRSeNatf/GarsBsAo9tqVY+DVrW6deBnfHR8VbxoaRCl7Nz17HzNbLVu3FKYRuWRr
 OnltW23UV2sTFSM8lsgDNYGz5ggZ3MjZ5Zaf2VCNJAq+rzoyt4DJId9v8Xl936H0pI+x
 dVcA==
X-Gm-Message-State: AOAM5306eWhh9L+T63a9AjBMO+KAVzXboVO5kquSWd0cKnDasbLw70gU
 HJJCAA8tPmEAgy3HceTPbukrvQWp9HfP4/GbySCxAA==
X-Google-Smtp-Source: ABdhPJxpNoJzAL1wue0YqB6owOeyjjaXBUcXErrQQYKFZ0Y3eTcjFx81Ci5r5POPRvrECdJOlCDL/wAnGUWacVfXmbo=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr5211374ybu.140.1648820147643; Fri, 01
 Apr 2022 06:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-4-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 14:35:36 +0100
Message-ID: <CAFEAcA_rMuWkobjBoFJdYQqc=qvyUPrq9_-W+TkrNdTf+iBgsw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/exynos4210.c           | 26 +++++++++++
>  hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
>  hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
>  include/hw/arm/exynos4210.h   | 11 ++---
>  include/hw/core/split-irq.h   |  5 +--
>  5 files changed, 126 insertions(+), 33 deletions(-)

Looking at this patch, I think it's ended up quite complicated
because the exynos4210 code as it stands today is doing
some rather odd things with interrupts. I'm going to have a
go at some refactoring patches which try to clean some of that
oddness up into code more like what we'd write today, which
should make getting rid of the use of qemu_split_irq() a bit easier.

thanks
-- PMM

