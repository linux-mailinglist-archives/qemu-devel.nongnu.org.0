Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292693CB896
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:48 +0200 (CEST)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Oc2-0000yB-Lb
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Oav-0000EZ-6M
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:13:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Oat-00043t-BZ
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:13:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id k27so13155733edk.9
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRxogtX0SWlgjRPc5VkIeL/2yY/AOeFI/wXu2A0YhLY=;
 b=g+uW62+X/4QU5nZdIfPF2vK2isJSFomkU0I3OrLZ1HyCHkqekWDXLDtN1npef/38Tv
 lVV6Fhjy5L9hHrVqxZZ64HlzH3usGXCwukmJa0x9seXspCrOb7DFbK6yr1uX/JYO4oE9
 enanlXGmyoURibWoi+p4prnUVxLacP5kosesEQYrMlUFUZlst7hdK5S2n1UhH1IaXcec
 exs0GiKYSRNN3mHK3MW6BMA2X4NU9AjcpfIdGCHusrBv39mhjNe3qaGhBNPutoF+yPeS
 LnvaypWUib5GTCjvmI+TCnbu81IsqLjujyTAlejZF+CGwsLexrIL0uFPM1Vy7Jc2E+Il
 eWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRxogtX0SWlgjRPc5VkIeL/2yY/AOeFI/wXu2A0YhLY=;
 b=beA1ayCTT7VwJxpTKq4MetOj64bwU64lPWW2N8x3/322VmuCq2pn5V4Z4teryutYhC
 s4yVOBtEYLu7vCc1NffZTcHxDYtqNlHjIbPqRIN2DCtETetaqiBJZJX954L0LTFh92Fv
 MoXzZ1txqIDtq2+hW975ZvrMm4s+MexSbiMnOYZLxrc0d1HxiZHmFFR+uxkEk3J9TSaD
 5e+i0eO3cxXWqrxWqL1o3b25sC53XaTBxvE/psDDgSfKOs9WEEtcFkjhfkEtpX4FC96J
 yHehq7nEYzO6Kx9wlx14OwuXHd9CEceRo7TTZMg8D3luWuk4w9Gsfy50v5QmMNJ+sHXj
 cw3w==
X-Gm-Message-State: AOAM53361ZGJxWKkX8/uNUe6XkugA64sillBmCqAEgLnjnStFzMCu+kA
 9hGXlnvq8eislBySjYb9HIgPW1A4wAA7rJepLw9jqQ==
X-Google-Smtp-Source: ABdhPJy4nzmRL1qJsXwFclws61CY6dauZnvuQnMLuSoeomS7zfWXGWF1QnQRrslO6Iy6id/UO3Mt5AKM5euVbSqc/S4=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr14872167edt.100.1626444813311; 
 Fri, 16 Jul 2021 07:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220946.212562-1-mst@redhat.com>
 <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
 <20210715172049-mutt-send-email-mst@kernel.org>
 <CAFEAcA8g+gJRX8CxhQ193PjcU8Ypsg1JDXou1RZaXmOyS5btPw@mail.gmail.com>
 <20210716043525-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210716043525-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 15:12:53 +0100
Message-ID: <CAFEAcA8hudZMeddSZ+R5JW97_T8R6tV31_i=Q=BwMbMegW-Rrg@mail.gmail.com>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 09:41, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 16, 2021 at 07:41:16AM +0100, Peter Maydell wrote:
> > On Thu, 15 Jul 2021 at 22:21, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Jul 14, 2021 at 09:31:21PM +0100, Peter Maydell wrote:
> > > > On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
> > > > >
> > > > >   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > > >
> > > > > for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
> > > > >
> > > > >   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12 -0400)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > pc,pci,virtio: lots of new features
> > > > >
> > > > > Lots of last minute stuff.
> > > > >
> > > > > vhost-user-rng.
> > > > > vhost-user-i2c.
> > > > > vhost-vsock SOCK_SEQPACKET support.
> > > > > IOMMU bypass.
> > > > > ACPI based pci hotplug.
> > > > >
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > This seems to produce a new meson warning:
> > > >
> > > > Configuring 50-qemu-gpu.json using configuration
> > > > Configuring 50-qemu-virtiofsd.json using configuration
> > > > Configuring 50-qemu-rng.json using configuration
> > > > ../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
> > > > 'libexecdir' in the input file
> > > > 'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
> > > > given configuration data.
> > > > Configuring 50-edk2-i386-secure.json using configuration
> > > > Configuring 50-edk2-x86_64-secure.json using configuration
> > > > Configuring 60-edk2-aarch64.json using configuration
> > > >
> > > > (the build then seems to go on to complete OK).
> > > >
> > > > -- PMM
> > >
> > >
> > > I sent an email about a fix. Do you prefer PULLv2 then?
> >
> > Same tag, right? I've put this back on my list, but I'm still
> > working through a backlog of other pullreqs before I get back
> > to this one.
> >
> > -- PMM
>
> Yes. If you merge it there's a trivial conflict.
>
> If you'd rather see it rebased here it is: for_upstream2

I tried the for_upstream2 tag, but it fails to compile on
some of the gitlab jobs:
https://gitlab.com/qemu-project/qemu/-/jobs/1430322920
https://gitlab.com/qemu-project/qemu/-/jobs/1430323102

/usr/bin/ld: tools/vhost-user-rng/vhost-user-rng.p/main.c.o: in
function `vu_rng_queue_set_started':
/builds/qemu-project/qemu/build/../tools/vhost-user-rng/main.c:198:
undefined reference to `vu_get_queue'

and various other missing symbols at link time.

thanks
-- PMM

