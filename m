Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35A4EF793
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 18:18:33 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJyq-0001QL-7F
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 12:18:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naJx9-0000bf-OW
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:16:50 -0400
Received: from [2607:f8b0:4864:20::1132] (port=35195
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naJx4-0000u5-CS
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:16:47 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ea1b9b3813so38755277b3.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CYBsodgyvCIUKqabMqIuWN4Bu7ng4vljHVHmfXx9dmM=;
 b=BVGYv5MJk4wASENFElbWFr7AKAFc2BuWwOs+OSIpxJtXFRrw7NwY45Bxhic1bsQk4B
 GQkhU8IPYj9h2D6603xcn4tw3YFqXolDxGN6ZMhKZ68ssrcCz68nJS5p3TFjJhe2Q4aH
 e8K0qu1isPZnMo0B9aWGc8Qt3cr7QiL2OrWLY1TJ5IFnPGu/dTecHvKEQQfdQpZE7+7Q
 HZGuECww3xJwYTc/cZayKRps9lI+quHqorBVQL5kQTO4iyfHrEvl7JSNIQqy6NKwhH94
 eqmD9xwLd/vCemgyArwxzjpAgCQkWWtVdcvmMiHo5QMO6JdSNbcxL/Xh6DIInpE8xlDD
 gFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CYBsodgyvCIUKqabMqIuWN4Bu7ng4vljHVHmfXx9dmM=;
 b=Sn/oVlBO+9X8xq23ypRpn/GLTavMvBydajyd2dQvi6AQW+PPDetb6leXbi9zHQ1A3L
 SQZFPWGDL8aTgi6+IUlx3ZPZQm2/ADpHQGDUVeStRPBInOKZxcUzwAg2okeDen2x4hT7
 O3JKSHjRGhZG+XTgTAWmaklcrfEzCY4Pb5iJjwHEQzrsLXif6r2Bb/GQ/zqC+chqN/X9
 pPF1NKV2M6aclAbWjKP5vte4g2JJywRgFRaXpF94yaaNpAwpqSSTxQfZMirjUJ0+QAEP
 wwFwHxeHzz7i+xbqUs4qzqgvh+CFz80m5wnYUpOiTarVKtSm4B/nskS7ZAUa50L0w46e
 xA9w==
X-Gm-Message-State: AOAM533U6IayMAGXERIBwpAJlX5zBMKZPQHu7+io9tqdmTgWjvrLJFna
 YTZ6tW22acqLPSoY9C6cfW2OjGe4o/EK8F320LOaKKMTnwFDgg==
X-Google-Smtp-Source: ABdhPJwMteIwWJEffOhX22ac8W/nxMGaeptkn7lTrZ7BtVta3eU6guOzbmIS8enwMjfmwWJu6nHRlyZxq3dR1mzGE4U=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr11230133ywf.469.1648829800224; Fri, 01
 Apr 2022 09:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 17:16:29 +0100
Message-ID: <CAFEAcA9uP+ZpetBCdGU=4mcVgXeHbUUiuEVV=WfdpM7+g5fvig@mail.gmail.com>
Subject: Re: [PULL 0/2] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 00:50, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit d5341e09135b871199073572f53bc11ae9b44897:
>
>   Merge tag 'pull-tcg-20220331' of https://gitlab.com/rth7680/qemu into staging (2022-03-31 18:36:08 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220401
>
> for you to fetch changes up to 8ff8ac63298611c8373b294ec936475b1a33f63f:
>
>   target/riscv: rvv: Add missing early exit condition for whole register load/store (2022-04-01 08:40:55 +1000)
>
> ----------------------------------------------------------------
> Sixth RISC-V PR for QEMU 7.0
>
> This is a last minute RISC-V PR for 7.0.
>
> It includes a fix to avoid leaking no translation TLB entries. This
> incorrectly cached uncachable baremetal entries. This would break Linux
> boot while single stepping. As the fix is pretty straight forward (flush
> the cache more often) it's being pulled in for 7.0.
>
> At the same time I have included a RISC-V vector extension fixup patch.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

