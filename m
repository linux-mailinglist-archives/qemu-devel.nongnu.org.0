Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162ED4F7B89
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:25:07 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOO2-0001mR-5T
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncOHn-0003ye-E8
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:18:39 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:44308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncOHl-0005hW-1F
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:18:38 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2eafabbc80aso54331027b3.11
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IeQVS8/r1FhHEydeDK3swF9VA5lPgRxYD3aJrbL1YYA=;
 b=TVsBPeBzTQ7lofIoZik116nD1y19HfsKnhXbYnfPWnUdj0g/cHAs74IGGc7SvW7dmC
 3DHUc8+XC5s3X1ybQa6D9ymAbdduDrtVw0mSmi45nXgnck90fZwwoVfeD1XQoZ68D1C9
 /+O3tQGrvsr7uf/fQpIiTX4VWqHnasXTBCDLY4iy9uW7RYhrGF3B9eQH4SLCPfu38GCq
 L+dBoH3ivkJR1OLHbrNxRQuAPzaLcTJxfojgEpYmJ+c4xa98qlCmhvL+TdM3KjQI4BdI
 sPz1dthUccyqFja5uXW0RsStgmZY6eTlwtsxZJZNIFw81Kaz2lbKvzUCTtbH+CpOgwFL
 t+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IeQVS8/r1FhHEydeDK3swF9VA5lPgRxYD3aJrbL1YYA=;
 b=Mqb/HbJJWmce3znTY1hqYiZ+7HEyZA2fo7dVjPIImL1NBSf8VYhhbRidQQfyngDMMq
 kSghXgr8jTGnpaEi+oJBhQMvS1zVrxBH6y+buKi7L+pspp92rUCbJ1pLqJwZNy9yALfy
 NO6owo97g1ZcGWQpLQ/Zfew0IvmCOhDrxcwA/KAqcBv9hvfMFJC8BWaS22sbk2YqL/UO
 rg9NtgIpcDvtbQSrKIwULpSe+d53lHA6T1TFfQcaT8iUsXz4IplvoZQp/xz3C91bYrpO
 4rs+RPqle+6QEY2GJT6jFvfP/pEhiOKJO55ceZLo4DW/v7NOPH1xZidhDklLojtpqoUD
 0GNA==
X-Gm-Message-State: AOAM533zB2p/0GbTvhxEGIvSwqKYbnYTkgBI6RwGnh+Mhoma07olQ/d1
 v3mfyoIrEWatPfWpndNGS2/PlwLK6UT18Wuw1rUKIg==
X-Google-Smtp-Source: ABdhPJwUlCqH+TWyjxhbPfDjBDr4eAMzdUmW4U7AaRcBgnGHV4TmDguG6yyoPCiEObrpgVy99Y4bXbc9Ihb3fkwP60g=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr10658006ywv.10.1649323115941; Thu, 07
 Apr 2022 02:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220406211137.38840-1-mst@redhat.com>
In-Reply-To: <20220406211137.38840-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 10:18:24 +0100
Message-ID: <CAFEAcA8ndeUiV_pph78H-LoSFWJ7DzvzXnLr-uQBD0D-V9PJQA@mail.gmail.com>
Subject: Re: [PULL 0/3] virtio,pc: bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 22:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 128e050d41794e61e5849c6c507160da5556ea61:
>
>   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-07 17:43:14 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to f556b9a0cd20d41493afd403fb7f016c8fb01eb3:
>
>   virtio-iommu: use-after-free fix (2022-04-06 17:11:03 -0400)
>
> ----------------------------------------------------------------
> virtio,pc: bugfixes
>
> Several fixes all over the place
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

RC3 has gone. We're not taking any more changes unless they
are absolutely release-critical, which means that you need
to be clearly describing in the pull request cover letter
what the changes are and why they are release critical.

thanks
-- PMM

