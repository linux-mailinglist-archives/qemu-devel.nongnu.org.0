Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F93B8A94
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 00:45:43 +0200 (CEST)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyixh-0002iY-ND
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 18:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lyiwe-00023e-AB
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 18:44:36 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lyiwZ-0007d6-CR
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 18:44:33 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 s10-20020a4aeaca0000b029024c2acf6eecso1061172ooh.9
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 15:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EhvSllsDz71TuYjLaHp2h611pahJw+ohibF/pq0MWuQ=;
 b=V5g0WXoJ14HKbI0H5rb0D/TOL8/Ml+HJYavLPTKcq0hesNuWm2XKIe4wJbl9vEX8kk
 LK1D/Outf6sPN9jgKZJRYNldoj4w6oDZOIyCOYFayJwWZQVBPBeZhvA4givOvH/WlM60
 rWxCE1nB0EILoaV3RUcBy+VBkdNgIHaUI23Op38YrI1EOgGZ57moH6tC/zATjTSZSomQ
 veToKWPmgMh1Qxr5bDQyidQLHmXEZT7YtzuxrWTZlaVDVDsk9FNAKnRhJG05nn8JspBo
 +Z9JPumntkUINMrXdX/RW5dTJf3xYPNK5MSxkAJVuByGdFPuJ/yEFbzss8C9Dy++Rebo
 8eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhvSllsDz71TuYjLaHp2h611pahJw+ohibF/pq0MWuQ=;
 b=S/YBrp+KQQ/pVWpw8KWCTVIZcWw2o6RmwNp3ik+jymP8M6L4uUGhlhHtm2dgoCVqeN
 KFAsuJp1qC38FZhe/IIW1GOfEFy8Ro2StsTvATXMqPDk1meC3p64Sq31NaMRvrmEkwhW
 bFo0+ReodsAHJPn0yBf/8BXbmurBZjGTdOnya/CbZ1GVItAbY+9qvLY3wl4HWvd9ZdUB
 L4keeZNyflbi+BdtzDwSwRP8kqCNDeHQeiZZmFHjsiBfT333H6POvsn4NT6jYBHJljky
 l5VWreiFZRFnV/Qbsi5aOhCAFcpikncD3yZHepjRuuyGMDDZI4SMieVdVxLvrPOFqtSH
 t6wQ==
X-Gm-Message-State: AOAM531VDJTufQe8MP/vmuHKLIgIMdTlV8CLMJ2rURrTaicRw90y/f50
 8/ZA93+9pMpqAoxsYIbFpD7f+GKeKt7Mhk4bo5+aZg==
X-Google-Smtp-Source: ABdhPJzZiqb/sxlAKz23pVcYZYpa/hMN5WvgQ90RUfh5t5T2gSjnUmcl5XIPhD0XxBYZGIuzsHbXEsewdJC+YuD7/0M=
X-Received: by 2002:a4a:9b0f:: with SMTP id a15mr10250844ook.4.1625093068108; 
 Wed, 30 Jun 2021 15:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
 <20210610094039.2ek3som6fxcgjtyw@steredhat>
 <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
 <CAP_N_Z9kFc3pnK0Uwqc-fvfaakAh5VMYBR+9SZkz3w658XRK1g@mail.gmail.com>
 <20210624143127.fqubmuvw634j44mi@steredhat>
In-Reply-To: <20210624143127.fqubmuvw634j44mi@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Wed, 30 Jun 2021 15:44:17 -0700
Message-ID: <CAP_N_Z87rs9vUhZr0r2UkYPwT6DC7w4SzagX3B2Gz8O5dz3GTQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC v1] virtio/vsock: add two more queues for
 datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=jiang.wang@bytedance.com; helo=mail-oo1-xc29.google.com
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

On Thu, Jun 24, 2021 at 7:31 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Jun 23, 2021 at 11:50:33PM -0700, Jiang Wang . wrote:
> >Hi Stefano,
> >
> >I checked virtio_net_set_multiqueue(), which will help with following
> >changes in my patch:
> >
> >#ifdef CONFIG_VHOST_VSOCK_DGRAM
> >vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >vhost_vsock_common_handle_output);
> >vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >vhost_vsock_common_handle_output);
> >#endif
> >
> >But I think there is still an issue with the following lines, right?
>
> Yep, I think so.
>
> >
> >#ifdef CONFIG_VHOST_VSOCK_DGRAM
> >struct vhost_virtqueue vhost_vqs[4];
> >#else
> >struct vhost_virtqueue vhost_vqs[2];
> >#endif
> >
> >I think the problem with feature bits is that they are set and get after
> >vhost_vsock_common_realize() and after vhost_dev_init() in drivers/vhost/vsock.c
> >But those virtqueues need to be set up correctly beforehand.
>
> I think we can follow net and scsi vhost devices, so we can set a
> VHOST_VSOCK_VQ_MAX(5), allocates all the queues in any case and then use
> only the queues acked by the guest.
>
Thanks for the advice. I checked both net and scsi and scsi is more helpful.

> >
> >I tried to test with the host kernel allocating 4 vqs, but qemu only
> >allocated 2 vqs, and
> >guest kernel will not be able to send even the vsock stream packets. I
> >think the host
> >kernel and the qemu have to agree on the number of vhost_vqs. Do you agree?
> >Did I miss something?
>
> Mmm, I need to check, but for example vhost-net calls vhost_dev_init()
> with VHOST_NET_VQ_MAX, but then the guest can decide to use only one
> couple of TX and RX queues.
>
> I'm not sure about qemu point of view, but I expected that QEMU can set
> less queues then queues allocated by the kernel. `vhost_dev.nvqs` should
> be set with the amount of queue that QEMU can handle.
>
I checked that vhost_dev.nvqs is still the maximum number of queues (4 queues).
But I found a way to workaround it. More details in the following text.

> >
> >Another idea to make the setting in runtime instead of compiling time
> >is to use
> >qemu cmd-line options, then qemu can allocate 2 or 4 queues depending
> >on
> >the cmd line. This will solve the issue when the host kernel is an old
> >one( no dgram
> >support) and the qemu is a new one.
>
> I don't think this is a good idea, at most we can add an ioctl that qemu
> can use to query the kernel about allocated queues, but I still need to
> understand better if we really we need this.
>

Hmm. Both net and scsi use the qemu cmd line option to configure
number of queues. Qemu cmdline is a runtime setting and flexible.
I think qemu cmdline is better than ioctl. I also make the qemu cmd
line option default to only allocate two queues to be compatible with
old versions.

> >
> >But there is still an issue when the host kernel is a new one, while
> >the qemu
> >is an old one.  I am not sure how to make the virtqueues numbers to
> >change in run-time
> >for the host kernel. In another email thread, you mentioned removing kconfig
> >in the linux kernel, I believe that is related to this qemu patch,
> >right?
>
> It was related to both, I don't think we should build QEMU and Linux
> with or without dgram support.
>
> > If so,
> >any ideas that I can make the host kernel change the number of vqs in
> >the run-time
> >or when starting up vsock? The only way I can think of is to use a
> >kernel module parameter
> >for the vsock_vhost module. Any other ideas? Thanks.
>
> I need to check better, but we should be able to do all at run time
> looking at the features field. As I said, both QEMU and kernel can
> allocate the maximum number of queues that they can handle, then enable
> only the queues allocated by the guest (e.g. during
> vhost_vsock_common_start()).
>

Yes. I checked the code and found there is an implementation bug ( or
limitation) in drivers/vhost/vsock.c. In vhost_vsock_start(), if a queue
failed to init, the code will clean up all previous successfully
allocated queues. That is why V1 code does not work when
host kernel is new,  but qemu and guest kernel is old. I made a change
there and it works now. I will clean up the patch a little bit and
send V2 soon.


> >
> >btw, I searched Linux kernel code but did not find any examples.
> >
>
> I'm a bit busy this week, I'll try to write some PoC next week if you
> can't find a working solution. (without any #ifdef :-)
>
> Thanks,
> Stefano
>

