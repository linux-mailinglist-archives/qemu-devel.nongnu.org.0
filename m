Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6057753E4F6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:07:36 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDOI-00063H-Cz
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nyCGs-0004Ij-3g
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:55:50 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nyCGm-0006iz-QU
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:55:46 -0400
Received: by mail-ej1-x630.google.com with SMTP id y19so28778510ejq.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i2/euUzs3oFLtdPIBS8OnmvUgXJ7HkWnRRpg/Xz3kkk=;
 b=KSVQZIXYetXyVrw2b29sQp31U1CnmpbAsgJnO1Ps9QEDKcFTY4smAdUyifPXD8Ez1o
 +VtRipOkvEPDo2pQQB/LlW/n8xCPPMx3uXv497dIvIrWe4lN8uDQppXYMxeqoEkMDWP6
 qfkE3zhR7KSOVuElO94jorxy0ZLHJtEGByamsf+DGiNL0j09fGbL+34cFbDo+wIiFlL0
 lHMkdxRSraUrGOHpDelEvKZSN4LsdeSnolzQtSav5ltgUkMx+BSombNETBBiYUjPkUkk
 RWm6vWruvY0dsLOkLHVJZgcnSQApYW1R8hvMgAdF/UXxDMQbYH9qPHpUPk6VbEc3r5lF
 dOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2/euUzs3oFLtdPIBS8OnmvUgXJ7HkWnRRpg/Xz3kkk=;
 b=qtukpJuftfgd/EShG+iCE6egeG4GskhcchHxau6bbkLeZObj+vLUBdSu7VTJ7T9xz2
 kBW84o7rvAdTcJTlwo8kaDRnWfB8Q4XhIZ2xdlS5hxZoJQPQvuiYvOCLVomaxmXORjNW
 SCuH2pcwLu1zVStJ5wB4vuI57RdwMLpKjuefLlfu6QQ/NNz5H+ZGGad30RkXzx4lhJAj
 Phmo2jKL2xlKFFipK2vm1uqn8X8suBrdVyh7/lZZrrM0u8m2SYUFH3qFdWCoEclvy8w1
 YbOVmUKlGhSI3XEfMfK4BYUCVHhkxcHZMk2jwP//gQ66lilPOlIuTZJOW9SJhqPBYu9F
 1W0Q==
X-Gm-Message-State: AOAM5302PePa0yMLsX3K1rNr1GnVpd5DYDylLHiK1RuuTn4qKyDxazIx
 JF1tmFiS5BxqFAD/wNJK4LM0zzxLMCmoEEMqNdMy
X-Google-Smtp-Source: ABdhPJyGnhHuUsNyA751jR7pNktfFQKbYgyqAoGwJOgtXObhz6aBgLLUgpx3aciIkw7VVuHJGn8mCe02qpTlUqyuFtg=
X-Received: by 2002:a17:907:6e25:b0:711:c6ce:b7bc with SMTP id
 sd37-20020a1709076e2500b00711c6ceb7bcmr7095410ejc.752.1654520142640; Mon, 06
 Jun 2022 05:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084611.91-1-xieyongji@bytedance.com>
 <20220523084611.91-6-xieyongji@bytedance.com>
 <0fec2667-88ce-7388-086f-2dfc7d6bf9d7@redhat.com>
In-Reply-To: <0fec2667-88ce-7388-086f-2dfc7d6bf9d7@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 6 Jun 2022 20:56:39 +0800
Message-ID: <CACycT3sthK-3d1=2AfoZnO8tMRcXU0vTiXWNe+p2f4HCF9G6Fw@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 mreitz@redhat.com, mlureau@redhat.com, jsnow@redhat.com, 
 Eric Blake <eblake@redhat.com>, Coiby.Xu@gmail.com, hreitz@redhat.com, 
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 3, 2022 at 7:25 PM Maxime Coquelin
<maxime.coquelin@redhat.com> wrote:
>
> Hi Yongji,
>
> On 5/23/22 10:46, Xie Yongji wrote:
> > VDUSE [1] is a linux framework that makes it possible to implement
> > software-emulated vDPA devices in userspace. This adds a library
> > as a subproject to help implementing VDUSE backends in QEMU.
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >   MAINTAINERS                                 |    5 +
> >   meson.build                                 |   15 +
> >   meson_options.txt                           |    2 +
> >   scripts/meson-buildoptions.sh               |    3 +
> >   subprojects/libvduse/include/atomic.h       |    1 +
> >   subprojects/libvduse/include/compiler.h     |    1 +
> >   subprojects/libvduse/libvduse.c             | 1167 +++++++++++++++++++
> >   subprojects/libvduse/libvduse.h             |  235 ++++
> >   subprojects/libvduse/linux-headers/linux    |    1 +
> >   subprojects/libvduse/meson.build            |   10 +
> >   subprojects/libvduse/standard-headers/linux |    1 +
> >   11 files changed, 1441 insertions(+)
> >   create mode 120000 subprojects/libvduse/include/atomic.h
> >   create mode 120000 subprojects/libvduse/include/compiler.h
> >   create mode 100644 subprojects/libvduse/libvduse.c
> >   create mode 100644 subprojects/libvduse/libvduse.h
> >   create mode 120000 subprojects/libvduse/linux-headers/linux
> >   create mode 100644 subprojects/libvduse/meson.build
> >   create mode 120000 subprojects/libvduse/standard-headers/linux
> >
>
> ...
>
> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
> > new file mode 100644
> > index 0000000000..fa4822b9a9
> > --- /dev/null
> > +++ b/subprojects/libvduse/libvduse.c
> > @@ -0,0 +1,1167 @@
>
> ...
>
> > +
> > +int vduse_dev_destroy(VduseDev *dev)
> > +{
> > +    int ret = 0;
> > +
> > +    free(dev->vqs);
> > +    if (dev->fd > 0) {
>
> if (dev->fd >= 0) {
>

OK.

> > +        close(dev->fd);
> > +        dev->fd = -1;
> > +    }
> > +    if (dev->ctrl_fd > 0) {
>
> if (dev->ctrl_fd >= 0) {
>

Thanks for the review. I will fix them.

Thanks,
Yongji

