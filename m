Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84012D46A6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:23:32 +0100 (CET)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2FX-0002P9-Dn
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn2DK-00015y-6K
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:21:14 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn2DI-0003I4-C0
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:21:13 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so2973234ejb.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 08:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bt93WnOP4SzNJQLQCpu/2tj414eFyql4+fCRs6BgwsM=;
 b=jn34NOcO0CQSnarpbQvuu4mtw1FDaY0pGMN6gjovdBYLkvePZMifnFW+ZeW4GlxsRc
 dWKpVdWmLmjx7a39xeyKn2MR0oKt0lAJfS3FLcj9Qu6PihatJK7bf2dzBQ9+rdtSSgFs
 AuwHJOmAXu6POQHPRvyW5j9LZi7OmfwyVS78C+lpFThvceQY1y7QoGDcseGbp1DjK7Z5
 jvAA8sm6fcI9B4trqa7zB1Xv1QQfeD02CUly/ja22UCUMRRmE0PAg4JOgvDzMlegclId
 g5HBBIp3Cg78xcECgJF5HlJcnsZNsxvR5Y4C9eboe6XAvmYSY0U0peYr0XVpplW4l7U5
 fK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bt93WnOP4SzNJQLQCpu/2tj414eFyql4+fCRs6BgwsM=;
 b=IV7PNQ6CbQR+VGsX6Jz9UyHRZqbnHOHi3mLHT3IwM0FsN+V1S/BtYc2Jmp0Ad8vLL1
 q7BPt0WFJuDfBcNIB0AHV8O2hySIVEezTfcehDGsGpUvzTeJA58hsCd92AfH/J2QMD0L
 cqF8JSjzRP7k2mmhaiNlCIhLqo5R36/kYwnffQlXa3sE2Y6wIEVyJPFnfQLJGiaOwUj0
 kwj2QN0yEoxp7OWf3rY00lEgJQA13Ke1P3dhcnOyp1u8WfCsXgG3flFYR3P9LuvmrHOO
 CS55RBAp1gFlyBlQXAFY6rKO1dO65kWi7sdx3xd5EPiFrEqB1lMK5VAfnnu6CvljfcIz
 9Cmg==
X-Gm-Message-State: AOAM533wqI8cbqjfBhz1cO2MqIwQyIrcAKzavlwFu5PmOHYNX/SZknYz
 Vh3stiCi6XXDcfWRytZZ7aWxOP4TSosjSt6I2JCzzw==
X-Google-Smtp-Source: ABdhPJxd6HFl3s32+f3FW2nj2rcUBUX5TgRRyt75PfZZz078vMu7+pwp+vh7BoeHcrIH5f8SS36mO0wgW7uP9NsWEkA=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr2649532ejd.382.1607530870836; 
 Wed, 09 Dec 2020 08:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20201208193307.646726-1-mst@redhat.com>
 <CAFEAcA_F7F_FHFmKvDbcrKE=5cr7-3KqBbTti1kA2N+xQPX=Kg@mail.gmail.com>
In-Reply-To: <CAFEAcA_F7F_FHFmKvDbcrKE=5cr7-3KqBbTti1kA2N+xQPX=Kg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 16:20:59 +0000
Message-ID: <CAFEAcA97wx5DdyJHy-SCs1G5vR_YpY9rOsem-M0Vn6A7revvaA@mail.gmail.com>
Subject: Re: [PULL 00/66] pc,pci,virtio: fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 at 14:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 8 Dec 2020 at 19:33, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
> >
> >   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 023e57b93a24f2e7901cf460a45cb5058fa23549:
> >
> >   hw/virtio-pci Added AER capability. (2020-12-08 13:48:58 -0500)
> >
> > ----------------------------------------------------------------
> > pc,pci,virtio: fixes, cleanups
> >
> > Lots of fixes, cleanups.
> > CPU hot-unplug improvements.
> > A new AER property for virtio devices, adding a dummy AER capability.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> Fails to compile on ppc64:

You can see the same failure also if you run it through the gitlab CI:
https://gitlab.com/qemu-project/qemu/-/jobs/900063570

-- PMM

