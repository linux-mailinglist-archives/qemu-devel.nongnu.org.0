Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E53B9882
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 00:11:01 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4tg-0004W1-Vj
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 18:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lz4so-0003m7-IQ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:10:06 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lz4sj-0006Zv-Md
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:10:04 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so8169507oti.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZHzBSlKzYADpTSnfN+kFmUDBXkFUWP7gCZ75Ir+6PU=;
 b=Q/tDbDSv+uZnuDf3sTv6iIrYFEV2YVt1LD9WpxyYkp7ydA5iYEVCIUsMWCBiwtbUsp
 alZr7k0wLImQWiR/eFwfQ+SgsCt6NSMYhDUGcmhq60uvYRNd2PxVZZjCpRY2w2H3yYMt
 cq+sNI1q9HwsoFMnEtLgTu7qI8Rt12Aq/RYYB5Eol4V3Af1gawbT6klkaVe40Vj3sWWy
 He9tHR97cY+xP7yZ3xlfeBl2uzX3o3TKmW7i/dX2skSrQ/6GqnArEa3t5CC5X5lOE3iK
 OzKTfHSmWwpuIySLxKiMBzdRgWakCzLdEed5ZrttnPOwsYd5Lai2i0dAJCK2f3KR2pAR
 aWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZHzBSlKzYADpTSnfN+kFmUDBXkFUWP7gCZ75Ir+6PU=;
 b=X1yTguGDAa/cdBqSaYjWXC5QPJ6ClkU3oAYuI31G9juKLnrEeW3C4q588ZLy1jiqTl
 sDdDnkf+vAAvXdlCr41DAZCl/3YtwTEVLSX7o3E2VooUpAyp+O+kgPkz4tsnorLxHumL
 h2CKVX5itC0Puk9NmMErCWXjUXF1hba3OoEV2d5WB+QLJqH7lrxmMOb5A/4k6CWCmqOd
 B6uE2jLlSC6jUYOgXqNWjwHw+qplik0XqYHkKhR/pMHDrGew/wOjGBS4LIY5CkWNZdkO
 AAGtu2ZEdoe7oMPlXYsr4IB+T3+n/0oDFO44EDjXC5CZWgFlM71hFkjrdpR4Qrjc2mhv
 O5hw==
X-Gm-Message-State: AOAM533Ylc6uFOjVeuQCEDCUhN1qvzkkEWoBNzf6tG+IeYtDEccXsxiJ
 2gObM0OSPjFCYns3QY2lVByo1TyIqeCnEihBFgaR1w==
X-Google-Smtp-Source: ABdhPJxmb8i32QYsSAcg4MZqa6131/kRZ9vTRcx6n5IPW8jI5tN61QXn9xunU5Ey4obmOwRUUPU9k8Q3yamQ/rE4txg=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr1775568otr.279.1625177399841; 
 Thu, 01 Jul 2021 15:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
 <20210610094039.2ek3som6fxcgjtyw@steredhat>
 <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
 <CAP_N_Z9kFc3pnK0Uwqc-fvfaakAh5VMYBR+9SZkz3w658XRK1g@mail.gmail.com>
 <20210624143127.fqubmuvw634j44mi@steredhat>
 <CAP_N_Z87rs9vUhZr0r2UkYPwT6DC7w4SzagX3B2Gz8O5dz3GTQ@mail.gmail.com>
 <20210701065552.hrodbwbenflhiru7@steredhat>
In-Reply-To: <20210701065552.hrodbwbenflhiru7@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Thu, 1 Jul 2021 15:09:48 -0700
Message-ID: <CAP_N_Z_-D8sa=FeOtb5bGqoJrTzPKds6Q3+A7CVztm93PzAihQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC v1] virtio/vsock: add two more queues for
 datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=jiang.wang@bytedance.com; helo=mail-ot1-x32e.google.com
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

On Wed, Jun 30, 2021 at 11:55 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Jun 30, 2021 at 03:44:17PM -0700, Jiang Wang . wrote:
> >On Thu, Jun 24, 2021 at 7:31 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >>
> >> On Wed, Jun 23, 2021 at 11:50:33PM -0700, Jiang Wang . wrote:
> >> >Hi Stefano,
> >> >
> >> >I checked virtio_net_set_multiqueue(), which will help with following
> >> >changes in my patch:
> >> >
> >> >#ifdef CONFIG_VHOST_VSOCK_DGRAM
> >> >vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >vhost_vsock_common_handle_output);
> >> >vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >vhost_vsock_common_handle_output);
> >> >#endif
> >> >
> >> >But I think there is still an issue with the following lines, right?
> >>
> >> Yep, I think so.
> >>
> >> >
> >> >#ifdef CONFIG_VHOST_VSOCK_DGRAM
> >> >struct vhost_virtqueue vhost_vqs[4];
> >> >#else
> >> >struct vhost_virtqueue vhost_vqs[2];
> >> >#endif
> >> >
> >> >I think the problem with feature bits is that they are set and get after
> >> >vhost_vsock_common_realize() and after vhost_dev_init() in drivers/vhost/vsock.c
> >> >But those virtqueues need to be set up correctly beforehand.
> >>
> >> I think we can follow net and scsi vhost devices, so we can set a
> >> VHOST_VSOCK_VQ_MAX(5), allocates all the queues in any case and then use
> >> only the queues acked by the guest.
> >>
> >Thanks for the advice. I checked both net and scsi and scsi is more helpful.
>
> Yeah :-)
>
> >
> >> >
> >> >I tried to test with the host kernel allocating 4 vqs, but qemu only
> >> >allocated 2 vqs, and
> >> >guest kernel will not be able to send even the vsock stream packets. I
> >> >think the host
> >> >kernel and the qemu have to agree on the number of vhost_vqs. Do you agree?
> >> >Did I miss something?
> >>
> >> Mmm, I need to check, but for example vhost-net calls vhost_dev_init()
> >> with VHOST_NET_VQ_MAX, but then the guest can decide to use only one
> >> couple of TX and RX queues.
> >>
> >> I'm not sure about qemu point of view, but I expected that QEMU can set
> >> less queues then queues allocated by the kernel. `vhost_dev.nvqs` should
> >> be set with the amount of queue that QEMU can handle.
> >>
> >I checked that vhost_dev.nvqs is still the maximum number of queues (4 queues).
> >But I found a way to workaround it. More details in the following text.
> >
> >> >
> >> >Another idea to make the setting in runtime instead of compiling time
> >> >is to use
> >> >qemu cmd-line options, then qemu can allocate 2 or 4 queues depending
> >> >on
> >> >the cmd line. This will solve the issue when the host kernel is an old
> >> >one( no dgram
> >> >support) and the qemu is a new one.
> >>
> >> I don't think this is a good idea, at most we can add an ioctl that qemu
> >> can use to query the kernel about allocated queues, but I still need to
> >> understand better if we really we need this.
> >>
> >
> >Hmm. Both net and scsi use the qemu cmd line option to configure
> >number of queues. Qemu cmdline is a runtime setting and flexible.
> >I think qemu cmdline is better than ioctl. I also make the qemu cmd
> >line option default to only allocate two queues to be compatible with
> >old versions.
>
> Can we avoid both and allocate the maximum number of queue that QEMU can
> handle?
>
I did not find any way to do that. When the host kernel is new, QEMU
can handle 4 queues. When the host kernel is an old one, QEMU can
only handle 2 queues.

> I'm not sure that adding a parameter to QEMU is a good idea. If possible
> it should be automatic.
>

OK. I will keep that in mind and dig more to see if there is a way to
do that.

Thanks.

> >
> >> >
> >> >But there is still an issue when the host kernel is a new one, while
> >> >the qemu
> >> >is an old one.  I am not sure how to make the virtqueues numbers to
> >> >change in run-time
> >> >for the host kernel. In another email thread, you mentioned removing
> >> >kconfig
> >> >in the linux kernel, I believe that is related to this qemu patch,
> >> >right?
> >>
> >> It was related to both, I don't think we should build QEMU and Linux
> >> with or without dgram support.
> >>
> >> > If so,
> >> >any ideas that I can make the host kernel change the number of vqs
> >> >in
> >> >the run-time
> >> >or when starting up vsock? The only way I can think of is to use a
> >> >kernel module parameter
> >> >for the vsock_vhost module. Any other ideas? Thanks.
> >>
> >> I need to check better, but we should be able to do all at run time
> >> looking at the features field. As I said, both QEMU and kernel can
> >> allocate the maximum number of queues that they can handle, then
> >> enable
> >> only the queues allocated by the guest (e.g. during
> >> vhost_vsock_common_start()).
> >>
> >
> >Yes. I checked the code and found there is an implementation bug ( or
> >limitation) in drivers/vhost/vsock.c. In vhost_vsock_start(), if a
> >queue
> >failed to init, the code will clean up all previous successfully
> >allocated queues. That is why V1 code does not work when
> >host kernel is new,  but qemu and guest kernel is old. I made a change
> >there and it works now. I will clean up the patch a little bit and
> >send V2 soon.
>
> Great! I'll review the new version!
>
> Thanks,
> Stefano
>

