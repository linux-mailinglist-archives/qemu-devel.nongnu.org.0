Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8F355411
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:38:31 +0200 (CEST)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkyU-0007ge-7A
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTksV-0001kS-Vs
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:32:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTksK-0000E0-N5
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:32:19 -0400
Received: by mail-ed1-x52c.google.com with SMTP id p4so6078874edr.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIEM+oR/G8WhjwQNFPSiZlCcshqCEEB2TZr4JXxdWiA=;
 b=d4G9drGHa8lYkHiJml3KBsoxC88ZxUtBvqs9NqNePhlLGw+5uTRUgI6WxPE/pByx5M
 5i1JPFXM0nU4SOu8TJN2bTC8HEgZnS4U8jg5G4JQHLrMFrVE+4pP5sHfrgi9IcslanXg
 FqE/S9WnppI2JyhalDBpFvnVZNeFSTzgTlD7Um1UqS3yVTjf0z4s3aXiUqRXwCDB7lPP
 R0zOrLpCfS8znTnSKErwpuO+o4oC0hI3gaHF2X8XwOCvTh2eVLg6GTbmfcrffU3NrIZR
 MlGqgC93lI10p5CCUxQKz9fEXEDt/sKoLk5RmApxO/kiGBMy9og1wk1rw/LnPOG3HqdH
 5BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIEM+oR/G8WhjwQNFPSiZlCcshqCEEB2TZr4JXxdWiA=;
 b=TH1r34jLoknC695bkHNvzVie5gpTIBuK0CPfsweXueFBl8ld8+Vbq3h8rgI8jSKdAv
 zHlomwO+UG0Qmf+nGcaCAPPs8ETyigwYCzvA4We1iW6ABOOPDVMn3p9gkALeKPFKOAOi
 oRbT2T4SKKgV5JQO6g6gJm8mdvXh8K/jfkKgafbNWMRGLYMQRpgj0bPymMpZFsHh/zsj
 hYoSHhUy3mgTwO4qiRXc4T5BaZ/zqBXW7BX03vdC+DTVeeu2/wItytUN+TBELfC9RP28
 /G5RFgZ/3bv1gzuGRMWoZXexQqy/SKn2CCJ9Y9yy4Sfv/AYzV3pMWyDjur/08v8JJXQf
 6Jgg==
X-Gm-Message-State: AOAM532clyVK53KSw4tsScD1EvO6MsayQewS6K8IOcMexc65hpd2FNdW
 89fhRodp3HRJ1wzotgZFaXnHYwC6PYmcBj1Cuyow6Q==
X-Google-Smtp-Source: ABdhPJyG4MsXv3ySOh7cl+qTnWrHJD9w5a08kFWmngDgBuVSaUoF1U+tlRyO7lgwEhHA0LH3fwG3rdvJkEYwRo2wNuk=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr37421368edb.204.1617712326820; 
 Tue, 06 Apr 2021 05:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210402084731.93-1-yuzenghui@huawei.com>
 <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
 <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
 <24c077d2-0e0e-02bc-0f92-4086be7e8982@redhat.com>
In-Reply-To: <24c077d2-0e0e-02bc-0f92-4086be7e8982@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 12:31:28 +0000
Message-ID: <CAFEAcA-ehqeCw4kEFKXHefaT9_9GDO=xSG9cG_SOgedOpCoE5Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 13:23, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 4/6/21 12:44 PM, Peter Maydell wrote:
> > On Tue, 6 Apr 2021 at 11:10, Auger Eric <eric.auger@redhat.com> wrote:
> >>
> >> Hi Zenghui,
> >>
> >> On 4/2/21 10:47 AM, Zenghui Yu wrote:
> >>> The GSIV values in SMMUv3 IORT node are not correct as they don't match
> >>> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> >>> our emulated vSMMU.
> >>>
> >>> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> >>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> >> Acked-by: Eric Auger <eric.auger@redhat.com>
> >
> > Eric, when you send an acked-by tag do you mean to say that you've
> > reviewed the patch, or merely that you think it's basically the
> > right thing but you haven't actually looked at the details?
>
> I mean I have reviewed the patch carefully and I think it is good to go.
> I thought that as a maintainer for the arm smmu component I was supposed
> to send an A-b instead of an R-b.

The usual meaning I think is that "Acked-by" means "I'm the maintainer,
I've seen this going by, and I'm basically OK with this" (ie it's you
saying "I'm not NAKing it") -- so it's not as "strong" as a "Reviewed-by"
tag (which means "I've reviewed it").

thanks
-- PMM

