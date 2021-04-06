Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44869355125
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:48:52 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTjGN-0002tm-3I
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjF7-0002Cs-CK
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:47:33 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjDA-0005Xg-SG
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:47:33 -0400
Received: by mail-ej1-x631.google.com with SMTP id e14so21115212ejz.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xm/cYBfM8ESdINptLqyLGyCFvo8j2vi3o7UkvefvkxI=;
 b=ZEKwHGR9UwoxozKS8cMjnjGiYsaIPzBlN5a3E9O+pCR1uHLiJkLvK6HIP90vwo62I+
 5QBJ6LgYbJvL93PLFYvDwJYSEXfito1J/Srs6D82EEle4Xfj0qXjag3pa6TZnhphU4TV
 esMMapZunfAWqRRSFJBIiwn90sNW595b0qEAGVY7lbgCqRcPO+PzpaaxtxGe9arHUAln
 pG0alGa1vbmMvoQ2gg9Mv9+HTKeeE4KruD9CmODVyfhtlpfyNlubmNQB/M5nr+G2zQsI
 tAtnhxwVLKHNaIoSZ0YAAbKeZqVuYQLrkc8JNVttgUSbeHA2It0PauTRsaq5tGUoN/HM
 vfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xm/cYBfM8ESdINptLqyLGyCFvo8j2vi3o7UkvefvkxI=;
 b=ngEKATkPO5QHUtBvP3tsd3VzSdb+3OgMgl8U0z6fy9fUDzJIMeYwNsTS0ShDlu7kfD
 aVEkqFOsFcFy3NYOPb4fakII0sV99ZXykm3hrbjGYkxUBBsjRywYRIbiXB6Ufa1Fp9NT
 S61/Sxd5DkRmxAl0yaHY4TZqN5J0EAhKK49aRqfWgkgq/IyRwA1bSR5lrYAkWOXtHwJN
 IpugTo0aV4pzBP5Cr+v3LLrAqJQrtmXkEzSBkQKAXXNh8jbAU0B4xpRPf2LXGepra9GX
 GCZcwYJ0AroxBmq7jyOkscOERKFPOikjTGGXbV48FV0Stzey0f5bqMRPTzT7s5qxpeob
 jamQ==
X-Gm-Message-State: AOAM5339Pa0GjJbhPV2fmQ8dUt7wWosRd5dBwZWWKQXN8dWCWdNPlZRR
 9/s01/LoHalAbNE/fQHewvI7FuELeq2KBfK7Cbiuog==
X-Google-Smtp-Source: ABdhPJzVd1lydwKDWigH9NevChY49dx9kYeBy1IaXDNT3PPl+LXWWf1OkNqT6Lm37IWm2YvNsJzy9C6ZRN5en/Jyluc=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr32590052ejz.382.1617705931183; 
 Tue, 06 Apr 2021 03:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210402084731.93-1-yuzenghui@huawei.com>
 <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
In-Reply-To: <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 10:44:52 +0000
Message-ID: <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Tue, 6 Apr 2021 at 11:10, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Zenghui,
>
> On 4/2/21 10:47 AM, Zenghui Yu wrote:
> > The GSIV values in SMMUv3 IORT node are not correct as they don't match
> > the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> > our emulated vSMMU.
> >
> > Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> Acked-by: Eric Auger <eric.auger@redhat.com>

Eric, when you send an acked-by tag do you mean to say that you've
reviewed the patch, or merely that you think it's basically the
right thing but you haven't actually looked at the details?

(I ask because if the former I can just put this in target-arm.next,
but if the latter then I need to dig out the SMMU spec and review
the patch myself :-))

thanks
-- PMM

