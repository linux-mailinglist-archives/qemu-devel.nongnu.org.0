Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C160DE5B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:41:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncsz-0007LK-V5; Wed, 26 Oct 2022 05:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1oncsu-0006t2-3P
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:39:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1oncsr-0007eM-I5
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:39:39 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n12so14292932eja.11
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mI71J4ozVII3JoqEb4hQo2fLkx6NG7vUqJyuwXcKMg4=;
 b=1Pms/d/ytde22fwMfUBqOq1xMu6Y0RtmHVlVbRa61ktROqrQqvrXrZPaHbKHj4fYSU
 pe7p3CvpCbGxnrmFxjypc3cUklbYtRmAHc6JWe819I9knym9QkZjFY9/Ve1Ii0Po0PDr
 ROZ+NdvzFUCiUJQCBQbsqEoLtq+PzselGXrmoRTm4HQmYLKDmUK+KmM9q3qGl3OL4Psa
 s5QepcepLxitKtNNOPjzMlnuJm5wKZ6XmgyLkU1wDLK/kElgujH/8PKUqz5F6l/qzFRP
 vTisWdpJ93j4WJH0WEo921ECcwBzZUjhslJt7oJWkDzNGFxXyzUdGW855XQfknY5YQFa
 GWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mI71J4ozVII3JoqEb4hQo2fLkx6NG7vUqJyuwXcKMg4=;
 b=Zq4v5D2VK7IQwO4hoM7MnRNmqkoOBgawfSxte6pYuIPGmZAzveYpxv/fNFWDJyymCc
 Tai9FyA3wHGUsFztmWaNzqatPFkFd3iXtWzWH6buiprW1JCfKW59onHnGmWNFVq+ZkK+
 v99DV9KOV6AZmqboQiW+WT7fnzmTlbidhpCNCEnMhvGILbzCkjGpZq1PcLrdD+/jkDHc
 LYgT8nawutl1SpWHIE2nWG0fIspQxuzauoqlGY4xAk5mPiYEMdp/VGFEfCWzyhgdfNb1
 MNiViWD7IlnskhJBnz2tDu/rqRdrmBz9F9erFqXXtqT1GWbj0aVOuFZUHp99sp4iIR1t
 AmVg==
X-Gm-Message-State: ACrzQf1VUqitUsrhgMlB7MXV25dWrbwYviXKc6v9DKAqXMXpoyHkE7Fq
 68iPnG76NDyrmGIlgWOLWbO+rz8B+ZUcXn9sQz/N
X-Google-Smtp-Source: AMsMyM6Jyphtq+o/1PxhWOmqT++ashlvqTdBClACEWRIdgnvYiRbQaxv26o+UbVsHLqSmttSlPsrTY7RRtG5uA3mWdA=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr35765291ejc.619.1666777174965; Wed, 26
 Oct 2022 02:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4zRGASAv4YLoQpfRB-2cvaMij6YZo6t9E+69MZ+8Mong@mail.gmail.com>
In-Reply-To: <CAGxU2F4zRGASAv4YLoQpfRB-2cvaMij6YZo6t9E+69MZ+8Mong@mail.gmail.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 26 Oct 2022 17:39:23 +0800
Message-ID: <CACycT3vMVbm94OYtUgB9bS6_pU6FKh1Y6kWPyAxi4rvjUfQ3qg@mail.gmail.com>
Subject: Re: Issue with VDUSE (QSD vduse-blk export) and vhost-vdpa
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>, 
 qemu devel list <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefano,

On Wed, Oct 26, 2022 at 5:12 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi Xie,
> I was testing libblkio [1] with QSD vduse-blk export and had some
> issues.
>
> In a nutshell, QSD prints me the following messages when using
> vhost-vdpa to access the device:
>
>   Failed to get vq[0] iova mapping
>   Failed to update vring for vq[0]
>
> This happens only with vhost-vdpa, using virtio-vdpa instead the device
> works fine.
> I'm using Linux v6.0 and QEMU master (commit
> 214a8da23651f2472b296b3293e619fd58d9e212).
>
> I haven't had much time to investigate, I hope to do it next week, but
> maybe it's much faster for you.
>
> I saw that ioctl(VDUSE_IOTLB_GET_FD) in libvduse.c returns -1 (EPERM),
> so IIUC in the kernel vduse_dev_broken() was called, and the device is
> in a broken state.
>
>
> We will use libblkio in QEMU [2] to access vDPA devices via vhost-vdpa.
> But I'm doing these tests without QEMU for now, using an example inside
> the libblkio repo:
>
> # Build libblkio and examples
>     # Fedora/CentOS/RHEL
>     dnf install -y git meson rust cargo python3-docutils rustfmt
>     # Debian/Ubuntu
>     apt-get install -y git meson rustc cargo python3-docutils
>
>     git clone https://gitlab.com/libblkio/libblkio.git
>
>     cd libblkio
>     git checkout v1.1.0
>
>     meson setup build
>     meson compile -C build
>
>
> # On terminal 1
>     modprobe vduse
>     modprobe vhost-vdpa
>
>     qemu-img create -f qcow2 -o preallocation=full /path/to/test.qcow2 1g
>
>     qemu-storage-daemon \
>       --blockdev file,filename=/path/to/test.qcow2,cache.direct=on,aio=native,node-name=file \
>       --blockdev qcow2,file=file,node-name=qcow2 \
>       --object iothread,id=iothread0 \
>       --export vduse-blk,id=vduse0,name=vduse0,num-queues=1,node-name=qcow2,writable=on,iothread=iothread0
>
>
> # On terminal 2
>     vdpa dev add name vduse0 mgmtdev vduse
>
>     cd libblkio/build
>
>     # blkio-bench executes
>     ./examples/blkio-bench virtio-blk-vhost-vdpa \
>       path=/dev/vhost-vdpa-0 --runtime=5 --readwrite=randread
>
>     # after this step, QSD (running on terminal 1) prints the following messages:
>       Failed to get vq[0] iova mapping
>       Failed to update vring for vq[0]
>
> I don't know if I'm doing something wrong or in libblkio we have some
> issue, but using vdpa-sim-blk works correctly, so maybe there is
> something in vduse that is missing.
>
> Any help or suggestion is welcome :-)
>

I'd like to know whether bio-bench uses the shared memory
(tmpfs/hugetlbfs) as the vdpa memory region. This is what VDUSE needs.

Thanks,
Yongji

