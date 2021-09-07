Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96D4029C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:32:57 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbDc-0006GF-Tq
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNabf-0002q6-5a
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:53:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNabd-000273-Hp
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:53:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id z4so14269581wrr.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cDtvvJiDONxbktDTeL+URNXfqhs06YOh0Wb0vKpXuE=;
 b=gTVzdRInjX/dnmGg73hvgZhaP3j9eU6oGyZskECjKsUwR7c3DWRJE9mEnEnxleavw6
 1cn8lg6CTY985kb4nComyKckxvjXFL2WxeqpVzpe29I3msh8fQFx7BD6y6hHXpxHnVYP
 wurcE/GA+ZupuCLpbFfjp9K5p0+h4a2dk95VT8Ya28D7zV035oKH1QdeeGvQJExM2as9
 WJcvH4mcWpf0fRKBheCGBAbfzqCuJeLfy99mQLuXs5a5TXrjS81anxQFHF/+exdvxdTi
 XUxHswQ/eEzyuAPLVdWT9NGTGmeVqWSKVysXnViop5DaRa3cgdnz6M9o3BXUwKThjO5z
 p+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cDtvvJiDONxbktDTeL+URNXfqhs06YOh0Wb0vKpXuE=;
 b=dbQK2RNl3xDtYITXSO87Tnwdp4+GqjXdaiydooiD8etNrH4G/HLwlMKQs+sk+Fy4TV
 U0BaEB4u1l8+JQgjKF1HlteGwEc2JPpoLX5S5n82YdWsV/T8/SENxbvHSC8BxZNZRdUM
 6IJhVaCvWiP6oK3W767X9T1781Wk/9/Kvqnjmb3UXG+xKMVSKHcunuX1uvAoolqdQejp
 4/+w++fsG1ty9PUx0WovwAJB/1bWdPfjLzZ9fLcPqBKU+SQXblN8v0rmYDMJAjwfhHtk
 Jio4Alm1+y43reiJxHhZu9JDOlpiKtEtqhkIaZP34M8IrVtKv1O4wE84Fi4y4kLbFD9A
 hOIg==
X-Gm-Message-State: AOAM53049yVmG2qKvWglr4uIHII+tAOUQw//QRnkKGu2lJloetRD5mfe
 jIuCp6QCggMyyOOM+d36SHm46thkwQDPqMME04+yvQ==
X-Google-Smtp-Source: ABdhPJxrLmDLa+HjRoX8Rv60uwocrI+Qc6d7xcHSWB8bchkHtGLPk+nY6fi0MnnqybP7bULCaOkzltqGHJO4o0kGo9M=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr18038543wrr.376.1631019219992; 
 Tue, 07 Sep 2021 05:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210822144441.1290891-1-maz@kernel.org>
In-Reply-To: <20210822144441.1290891-1-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:52:51 +0100
Message-ID: <CAFEAcA_09YHF3LhxcLVoxd=yvO5g4dUsjkwDo5bdVNFNcaOXuQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Reduced-IPA space and highmem=off fixes
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 Android Kernel Team <kernel-team@android.com>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
>
> With the availability of a fruity range of arm64 systems, it becomes
> obvious that QEMU doesn't deal very well with limited IPA ranges when
> used as a front-end for KVM.
>
> This short series aims at making usable on such systems:
> - the first patch makes the creation of a scratch VM IPA-limit aware
> - the second one actually removes the highmem devices from the
> computed IPA range when highmem=off
> - the last one addresses an imprecision in the documentation for the
> highmem option
>
> This has been tested on an M1-based Mac-mini running Linux v5.14-rc6.
>
> Marc Zyngier (3):
>   hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE when creating
>     scratch VM
>   hw/arm/virt: Honor highmem setting when computing highest_gpa
>   docs/system/arm/virt: Fix documentation for the 'highmem' option

I've applied patch 1 to target-arm.next; thanks.

-- PMM

