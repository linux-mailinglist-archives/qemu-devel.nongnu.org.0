Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58073387A5D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:47:06 +0200 (CEST)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj03t-0003KJ-Db
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lizzI-00019z-2n
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:42:20 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lizzF-0007Cz-4m
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:42:19 -0400
Received: by mail-ej1-x62a.google.com with SMTP id n2so14624340ejy.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdAVq9upZSGJVXJfJ8uFk6ZciszXNguo7RZtSEizOLs=;
 b=Ay0pdGdSO1TrKk8O1kCI1J5jlN0DnucpqO8T1uiGJzSJhYMToRzKuR+1QLXEL0oyPk
 LvnEISTWc1/f0wx0bfBPgrP8WjxKGZYp5hWbhNDYBlvsrNU0obo4XTQnq8mS/nk/fabI
 PSo4cqY6RvIHlnm82H/6pBHzuheiVWXvK3ABC+E+PFIbQ48iuMmIUKnz6Aj5VtoX95QD
 a3Y5DIBriylDmkuf8YZUC+dP8KLHJZi1inK5eb88j6/0ijLMWnFU8hbuy4jPYfaxu/Ob
 gA47SdblWr8o5J03NDcNn8ly9eQgu5joT4qV60EkSpemi62o06ydhQq+8H3hQ3J9yj+Z
 ZyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdAVq9upZSGJVXJfJ8uFk6ZciszXNguo7RZtSEizOLs=;
 b=GqkrJD53ZFvn4eRMseE/WBg/uaqDRbWfbtyw0GS3iGcvVWIyCrTojKx1GacjNlBVTM
 ki14xIKiFxQsx5vWFWTl8EPYTv1sPXntGUeLUsyPK2Y0/76gHV6Ub7QTkWjKi41IG8oG
 Kw4c1deM9nK0lke0TsGzfrA+FyYUphz5CUHvnNVIHIRiFimZuEYxVRME4aZ8ukliE5OT
 8PKBQkk7xokn7HAMI15M0K77cSoLTjx+49rpGKJ47HcOLIh7j6fDTr8zMB21Lrlwn4Ej
 IX2CTacqfxINLpNzozCFIkHmMsoskagtCGIn6z7Y/f64SOPleG6DpuUcZEU5ykaw4phb
 t6RQ==
X-Gm-Message-State: AOAM530cqXtthqiJgQnbHOY4xDZq51zRQ2lM36ggmWOtQEZaJV63Tgn1
 LoKZC9L5U6nieYaSX6di2vXgAlZCHNVcduxQ9urNSg==
X-Google-Smtp-Source: ABdhPJxFlTGg/nkit3jTclAV6EIMPB6sj7qrK9G1FAucP/a7/KbYF6DgFBeph7ic4U2lnSrrqhTjkbEaH+NuGlHzAss=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr6291696ejb.250.1621345335368; 
 Tue, 18 May 2021 06:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 14:41:58 +0100
Message-ID: <CAFEAcA9qrQSwN9yVqedQDQPPauYVrWzAKrcdM+jfroz8Mpj4XQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v3:
>  - review comments addressed
>
> Shashi Mallela (8):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   hw/arm/sbsa-ref: add ITS support in SBSA GIC
>   hw/arm/virt: add ITS support in virt GIC

This fails to build with clang, which has spotted a
missing set of brackets in two places:

../../hw/intc/arm_gicv3_redist.c:568:10: error: logical not is only
applied to the left hand side of this bitwise operator
[-Werror,-Wlogical-not-parentheses]
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^              ~
../../hw/intc/arm_gicv3_redist.c:568:10: note: add parentheses after
the '!' to evaluate the bitwise operator first
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
          (                                    )
../../hw/intc/arm_gicv3_redist.c:568:10: note: add parentheses around
left hand side expression to silence this warning
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
         (             )
../../hw/intc/arm_gicv3_redist.c:657:10: error: logical not is only
applied to the left hand side of this bitwise operator
[-Werror,-Wlogical-not-parentheses]
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^              ~
../../hw/intc/arm_gicv3_redist.c:657:10: note: add parentheses after
the '!' to evaluate the bitwise operator first
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
          (                                    )
../../hw/intc/arm_gicv3_redist.c:657:10: note: add parentheses around
left hand side expression to silence this warning
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
         (             )

thanks
-- PMM

