Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0C3B2805
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:56:25 +0200 (CEST)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJHk-0001Tk-Qm
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lwJCQ-0004o5-T9
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:50:56 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lwJCK-00025n-Mh
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:50:52 -0400
Received: by mail-oi1-x236.google.com with SMTP id b2so3849169oiy.6
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3M2naWR5TZZxnwomMpHRdCjhbc1pWjhnPGrdwBlRJ3k=;
 b=NvhtvqsguyLKmbTlznEKWZMceVEKLeWOAMrKSnp+Njzyhe6uArib7K9SU1Mbw9uWDK
 bZGNbsTF6XA0eqSDwJZizlvBOUGGIhdOsLHB1mJfuO2GFGoF2wHECXlJ84UN4zdkGxCQ
 ZT759qPjNhFRfQsxWKcBF3OdSPp1D9NS7qfpuUbVV5ntC4BttwBolkTzNU8RmOLJGmXX
 fGHpH8oZxssvaUYGQfzzbfc32DzSKFAJsNXs2rPNubnq7m18I/gNCgKHSr3xyif+FbY8
 HOofVSRzEOEqxRyhTl17Rdeixsv4C+C3CReAh1kkxH4DnVJBvtr/CO3PL4kXIdLCwSDr
 8udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3M2naWR5TZZxnwomMpHRdCjhbc1pWjhnPGrdwBlRJ3k=;
 b=ne8WA1n/OV0JXBNuenIPUT2QRaCjOxQjsjmsyToict9xy7YV0x4SvZQoBaAskPU78W
 ui2SdydWtuZKcleQ+qGh4YAQ6SuIDvVLINh0Nm44QQUVGY7b6A+kJJ2kP9nuu3msIPN6
 jprDxiosganULaFg14biIHABXE61HeQGcQ1VdSNUIgXx4Q2XgbhqK5J7HB05AvFfsUuU
 uIZKIKeM+jtWTUSFw96ZRlPbrpS7mjy2OnRyi3sjVJicBQOiUPUeNYAN/n1c7iDCe6mk
 g5jGgTDWir4gBhU7QMuSt0dY1zuElMHaaOgp995y4HZdSHU8t3eSwv9BkHl1E979912Z
 hP9g==
X-Gm-Message-State: AOAM53049bgcH7LUPjB13P8WX6mAViXE4m+zPxd+RHHnABs84U0786xP
 IjJgZfaTGHNWNAUAELbvCoE8WkmLhT4gd7X3/8ya6A==
X-Google-Smtp-Source: ABdhPJxFpyCXacT37e16lUz+YaaW0PkYHvK2wGxCO9THD3g16TQn+wdB01J5N1vmxc2JOX7Ibs5u3hc2rlenZDUuFlo=
X-Received: by 2002:a05:6808:1285:: with SMTP id
 a5mr223565oiw.97.1624517443929; 
 Wed, 23 Jun 2021 23:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
 <20210610094039.2ek3som6fxcgjtyw@steredhat>
 <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
In-Reply-To: <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Wed, 23 Jun 2021 23:50:33 -0700
Message-ID: <CAP_N_Z9kFc3pnK0Uwqc-fvfaakAh5VMYBR+9SZkz3w658XRK1g@mail.gmail.com>
Subject: Re: Re: [RFC v1] virtio/vsock: add two more queues for datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=jiang.wang@bytedance.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: cong.wang@bytedance.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Yongji Xie <xieyongji@bytedance.com>,
 =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, fam.zheng@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefano,

I checked virtio_net_set_multiqueue(), which will help with following
changes in my patch:

#ifdef CONFIG_VHOST_VSOCK_DGRAM
vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
vhost_vsock_common_handle_output);
vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
vhost_vsock_common_handle_output);
#endif

But I think there is still an issue with the following lines, right?

#ifdef CONFIG_VHOST_VSOCK_DGRAM
struct vhost_virtqueue vhost_vqs[4];
#else
struct vhost_virtqueue vhost_vqs[2];
#endif

I think the problem with feature bits is that they are set and get after
vhost_vsock_common_realize() and after vhost_dev_init() in drivers/vhost/vsock.c
But those virtqueues need to be set up correctly beforehand.

I tried to test with the host kernel allocating 4 vqs, but qemu only
allocated 2 vqs, and
guest kernel will not be able to send even the vsock stream packets. I
think the host
kernel and the qemu have to agree on the number of vhost_vqs. Do you agree?
Did I miss something?

Another idea to make the setting in runtime instead of compiling time is to use
qemu cmd-line options, then qemu can allocate 2 or 4 queues depending on
the cmd line. This will solve the issue when the host kernel is an old
one( no dgram
support) and the qemu is a new one.

But there is still an issue when the host kernel is a new one, while the qemu
is an old one.  I am not sure how to make the virtqueues numbers to
change in run-time
for the host kernel. In another email thread, you mentioned removing kconfig
in the linux kernel, I believe that is related to this qemu patch,
right?  If so,
any ideas that I can make the host kernel change the number of vqs in
the run-time
or when starting up vsock? The only way I can think of is to use a
kernel module parameter
for the vsock_vhost module. Any other ideas? Thanks.

btw, I searched Linux kernel code but did not find any examples.

Regards,

Jiang

On Thu, Jun 10, 2021 at 10:29 AM Jiang Wang . <jiang.wang@bytedance.com> wrote:
>
> On Thu, Jun 10, 2021 at 2:40 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Thu, Jun 10, 2021 at 12:14:24AM +0000, Jiang Wang wrote:
> > >Datagram sockets are connectionless and unreliable.
> > >The sender does not know the capacity of the receiver
> > >and may send more packets than the receiver can handle.
> > >
> > >Add two more dedicate virtqueues for datagram sockets,
> > >so that it will not unfairly steal resources from
> > >stream and future connection-oriented sockets.
> > >
> > >The virtio spec patch is here:
> > >https://www.spinics.net/lists/linux-virtualization/msg50027.html
> > >
> > >Here is the link for the linux kernel git repo with patches
> > >to support dgram sockets:
> > >https://github.com/Jiang1155/linux/tree/vsock-dgram-v1
> > >
> > >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> > >---
> > > configure                                     | 13 +++++++++++++
> > > hw/virtio/vhost-vsock-common.c                | 11 ++++++++++-
> > > hw/virtio/vhost-vsock.c                       |  8 +++++---
> > > include/hw/virtio/vhost-vsock-common.h        | 10 +++++++++-
> > > include/standard-headers/linux/virtio_vsock.h |  3 +++
> > > meson.build                                   |  1 +
> > > 6 files changed, 41 insertions(+), 5 deletions(-)
> > >
> > >diff --git a/configure b/configure
> > >index 9f016b06b5..6455b283a5 100755
> > >--- a/configure
> > >+++ b/configure
> > >@@ -343,6 +343,7 @@ vhost_net="$default_feature"
> > > vhost_crypto="$default_feature"
> > > vhost_scsi="$default_feature"
> > > vhost_vsock="$default_feature"
> > >+vhost_vsock_dgram="no"
> > > vhost_user="no"
> > > vhost_user_blk_server="auto"
> > > vhost_user_fs="$default_feature"
> > >@@ -1272,6 +1273,10 @@ for opt do
> > >   ;;
> > >   --enable-vhost-vsock) vhost_vsock="yes"
> > >   ;;
> > >+  --disable-vhost-vsock-dgram) vhost_vsock_dgram="no"
> > >+  ;;
> > >+  --enable-vhost-vsock-dgram) vhost_vsock_dgram="yes"
> > >+  ;;
> >
> > I don't think we should add a configuration option to enable/disable the
> > dgram support at build time.
> >
> > I think we should do it at runtime looking at the features negiotated.
> >
> > Take a look at virtio_net_set_multiqueue().
>
> Got it. Will check. Thanks.
>
> > Thanks,
> > Stefano
> >

