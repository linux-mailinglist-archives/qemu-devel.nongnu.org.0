Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64A2D8969
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:52:17 +0100 (CET)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koA08-0004m3-Iw
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9hx-00035B-Km
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:33:29 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:42640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9hu-0007JM-P1
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:33:29 -0500
Received: by mail-ej1-x641.google.com with SMTP id d17so16920803ejy.9
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ncTnv9PKyQ98tmmUfBf7adXzWtcZCPZoVk2JuSNNPTE=;
 b=fa6RR51j27JycsTfOfmDtsvvbUWHTSsrH+gLz8+J3FNbo4LowN8Ci5jOsra7a2meoU
 YfrSFDMPdzzzJg47huYKBsoV4txdBBYT/Pds4wV1XfHKjz+9FV2tjHCrpqYbBpNETAfC
 upwFkMZipYsLEaeHKkRk0t4fu8XF5IFeKw1qPTQ9FMuvhfBxU+lilaWEWkGeGPYFJW+A
 hNhOYDaqd8j9eh4vlVC3Ol7duA08SJYIuy6uhmgJP+dOuI/VaPw3AVjFomwGtbUbWb0D
 25GGu056iC3ICNoprcIafcLpmSg37nkPMJLCjtXYxkGncngGowfHwdh4yPxc1z3YcPqt
 ihbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncTnv9PKyQ98tmmUfBf7adXzWtcZCPZoVk2JuSNNPTE=;
 b=pYyS96UB+KGwTcdq92cESSWGbEbnM9LSX8pR10zJRkpjTMb//22OdLeUmoCZjyNIJ4
 3FZKFaekVsNznXZucSywOYOfQ2vi5eBPvIs+Z2sZgwT/b0rSh2Fu4UwPVCXCS37soMfy
 o5NkbGJKmvLlpcFBo6crVvjp2kjly/E85X3vj0G3dLgNWKxKd5l0TiBlsMujRSZNKyt4
 Yn9984surb5Ymx/h63rLd//oXsB+jSvkPVY5XVM2Bj8KA/Wm7y0jEYsNrPx7VMXnl1Yi
 tx+g4Zbx/bvkog37lqOL+lWVN9LNVSysxGi/dN3mgpj0zF8ub0NVBjaOPGZZmRbExEJk
 ckXw==
X-Gm-Message-State: AOAM5337+eMoVYPy1HL8xOpvRxAHoeA8QeWkPuGRs0w4OlxBbXEUDnzP
 I1P1nQuRGUwlgXe3dQENNHxfohnlrl4tIxUtjvoGmg==
X-Google-Smtp-Source: ABdhPJweXuKbo6OYvtj6/WA2fVtE7pHsumy40ciiZQ4TMNtT+TqPLWT4nlurhPo1gRE5sAx+89z9cFtbItt1ZJDxj+8=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr16455592eja.250.1607798005315; 
 Sat, 12 Dec 2020 10:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-3-peter.maydell@linaro.org>
 <b4550f1-bedb-dc65-70a0-f11083c5da4c@eik.bme.hu>
In-Reply-To: <b4550f1-bedb-dc65-70a0-f11083c5da4c@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 18:33:14 +0000
Message-ID: <CAFEAcA85GS=UHtGR=OoL0LZsLBcoV3W-wah=FbHTSG8Sy0gjsw@mail.gmail.com>
Subject: Re: [PATCH 2/8] ppc: Convert PPC UIC to a QOM device
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 at 18:27, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 12 Dec 2020, Peter Maydell wrote:
> > Currently the PPC UIC ("Universal Interrupt Controller") is implemented
> > as a non-QOM device in ppc4xx_devs.c. Convert it to a proper QOM device
> > in hw/intc.
> >
> > The ppcuic_init() function is retained for the moment with its current
> > interface; in subsequent commits this will be tidied up to avoid the
> > allocation of an irq array.
> >
> > This conversion adds VMState support.
> >
> > It leaves the LOG_UIC() macro as-is to maximise the extent to which
> > this is simply code-movement rather than a rewrite (in new code it
> > would be better to use tracepoints).
> >
> > The default property values for dcr-base and use-vectors are set to
> > match those use by most of our boards with a UIC.
>
> Would this be easier to review if it's split into two patches, first doing
> the conversion in place, then another just doing code moving? Maybe we
> could spot some problem that way easier?

That didn't really feel very feasible to me. You can see that
mostly it's code motion using the git diff --color-moved option
if you look at the commit.

thanks
-- PMM

