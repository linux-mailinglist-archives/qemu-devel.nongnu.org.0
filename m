Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C33FF0B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:06:48 +0200 (CEST)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpEk-0000mh-Ty
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLp5p-0005eq-W3
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:57:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLp5n-0001TZ-GT
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:57:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z4so3731207wrr.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WI5BFgLtXLwKLKdZB6lk7nr77y2uMHPaDYq1vKezBXM=;
 b=rVLYBUm1kd1r0ODbcEnVk11WyDaIgBmfIUZoc7+LBTyoTSWvnc0umE3nMmtSy0l22R
 aJmv+qL/SaO74IK5kt9GsAxGq9Os/qnBqSDFN20EUhTHs3pprH6RrK0Vl9i8CjKxDLiI
 yxiK2CYpisgQuAHGQgGiYnOVvgzlFtu5cITFE3gj+dDAAyP4FWWkUdyWyUs7JEKrcHuk
 pam/ImP4fHbUwEe56TXWve08BmD9ClK1dY9HdwsVzTnRFcLC+U2OIHKuNUOBcUygRiDv
 IHyEqWUXhjO21LNf3+LySxH47X9IfTO8HERkIfKwIOYJ4axcDsF2pG0mHxYotQiEoQYL
 8rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WI5BFgLtXLwKLKdZB6lk7nr77y2uMHPaDYq1vKezBXM=;
 b=FwTbsef1ZJqypt6jl2iqrqklRxjSyYndy6c895NN8H6OkklPebjOXrtPeVvSN3Tbk7
 0Y2nfW4A+SkOgxkpq5nc3EjlL5n3uejl8nETC2HALadiJN+J6wOK30ZJ72S0gnTAnvwU
 m72Ker3/y5XcAW4SRL7GRNCTvG3OYGCzlOwQXquLlCG5TziPoloiYLOl/SuL2EMxu/W/
 4G91+4m2XIB6zSOduVAMnI8eEGGRpQP0xSAACb2vgnRF0hLQ2Y/i6DINHOTZkn/L00/8
 lWcLwWvZr2ozkcIlbnkwKUyd1H6koLSxXJYEUdwtN2oFbaIwBzXH2ZYgD1AJMDImWM8R
 5wKw==
X-Gm-Message-State: AOAM532ESanLiw/tLx89g8V8fSlc0oahVCBHP/PZwaO9a81cKtZbbthe
 o5/wypJATW3OT23/pfG+nGReEu3CKkbZS+Z2/rDxRw==
X-Google-Smtp-Source: ABdhPJx12pd+p+sLgV7xDcVE4KHX80x1CABpswRNYEJ+pMnKPJ+I9SXPoHNoCoEd1Fh3ztrOT/DabSxie3s8l2GA5wM=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr4593403wrg.386.1630598247115; 
 Thu, 02 Sep 2021 08:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210824122016.144364-1-wangyanan55@huawei.com>
In-Reply-To: <20210824122016.144364-1-wangyanan55@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 16:56:38 +0100
Message-ID: <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
>
> This new version is based on patch series [1] which introduces some
> fix and improvement for smp parsing.
>
> Description:
> Once the view of an accurate virtual cpu topology is provided to guest,
> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> e.g., the scheduling performance improvement. See Dario Faggioli's
> research and the related performance tests in [2] for reference.
>
> This patch series introduces cpu topology support for ARM platform.
> Both cpu-map in DT and ACPI PPTT table are introduced to store the
> topology information. And we only describe the topology information
> to 6.2 and newer virt machines, considering compatibility.
>
> patches not yet reviewed: #1 and #3.
>
> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> -friend-or-foe-dario-faggioli-suse


Hi; this series doesn't apply to current head-of-git. Is it
intended to be based on some other series ?

thanks
-- PMM

