Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499138032C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 07:11:56 +0200 (CEST)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhQ78-00056l-3o
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 01:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhQ5u-0004M6-Pm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 01:10:39 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhQ5t-0006aY-1I
 for qemu-devel@nongnu.org; Fri, 14 May 2021 01:10:38 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id l7so37418381ybf.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 22:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A9/P2iTXqNZpCQMbuzUp7l5r8XomzVG2EXsrkVpZLHE=;
 b=o7qarnFpkobMJ+7UhC/4hvZKpOKz66Z1G9+m16wlmiQtJDrPa4ksm5NZ/dVybuVCwu
 6i52K1A6JIjqM1hPxHJXcTTiNFc7hKbxGkUb+C0L5YuNZtjlaamN3Jiqu3qgyrXELq2v
 zIbzQf7tLdLyUzCU1cwEQtgVvXBsqlJoxm8qlUhSaZcq+3A9g0zBVAMEX658x4ephyrS
 1ELKXYogm9nqgh0ZEXqjj+ABAp7058dyTJl7+5pI0hfGEw4qRA/5668Q7TUwnnRphcnS
 fH5S1MtQ/Aj4BqCoXpvPfxosg0PO7gc88RQyY28ldBP70KhhCXz0EMJNPAMGGio8z0jO
 c+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A9/P2iTXqNZpCQMbuzUp7l5r8XomzVG2EXsrkVpZLHE=;
 b=raSs73elx3vba9ugAla/1kRxOnZOu1Err9eKmE1s3/8QqlIDtJHLw4BIv7in4XEXnb
 h1U+uQ7PF0iwt/3N6G/b2/KoH2Y823KvJ+Cz33cVTlmWvurrIulAGHgEt0dX6YMmRj6G
 NFkt3KlCLhRxcEu9n8iqXfDwgYLbKvONsNqye3RkxOQREZLpXjqmNW5FQs8MBzDE5s0e
 ZE0rqc9ocUfX1w+ZcJTkYbjbYKthFM/yN38LVfNKVr9peRvf7425rjlAa/ExL1vP4gc9
 dY+3ui0v+C/Gs2PXie34wTxe+aip3wb86iHRzZqNSXU07scu0J2D66uRP8KzZnFSY3sD
 DfRw==
X-Gm-Message-State: AOAM5330Eh8CilqxdGAWRGBEsYmjLCNk/hcha4iHTli2PFWVSmGgvmoy
 Cd80I+S6VbH1ycjemHXI3WTUgN+FFj/0NoW/tbc=
X-Google-Smtp-Source: ABdhPJzY939P33qedN1indN2weTNkv45Qr8Qr4k7OaYZcxwKJN+LNC9mpCIEnqkoxBojjGr2B142lFTIrjsbOIPbifk=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr28200320ybu.332.1620969034887; 
 Thu, 13 May 2021 22:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
 <859cd26a-feb2-ed62-98d5-764841a468cf@redhat.com>
In-Reply-To: <859cd26a-feb2-ed62-98d5-764841a468cf@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 13:10:23 +0800
Message-ID: <CAEUhbmUc++DiBFzTqbBSX3zacSO_2SQto36wwh8kn0zforFvSg@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] net: Pad short frames for network backends
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On Mon, Mar 22, 2021 at 3:10 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/17 =E4=B8=8B=E5=8D=882:26, Bin Meng =E5=86=99=E9=81=93:
> > The minimum Ethernet frame length is 60 bytes. For short frames with
> > smaller length like ARP packets (only 42 bytes), on a real world NIC
> > it can choose either padding its length to the minimum required 60
> > bytes, or sending it out directly to the wire. Such behavior can be
> > hardcoded or controled by a register bit. Similarly on the receive
> > path, NICs can choose either dropping such short frames directly or
> > handing them over to software to handle.
> >
> > On the other hand, for the network backends like SLiRP/TAP, they
> > don't expose a way to control the short frame behavior. As of today
> > they just send/receive data from/to the other end connected to them,
> > which means any sized packet is acceptable. So they can send and
> > receive short frames without any problem. It is observed that ARP
> > packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> > these ARP packets to the other end which might be a NIC model that
> > does not allow short frames to pass through.
> >
> > To provide better compatibility, for packets sent from QEMU network
> > backends like SLiRP/TAP, we change to pad short frames before sending
> > it out to the other end, if the other end does not forbid it via the
> > nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> > does not violate the spec. But with this change, the behavior of
> > dropping short frames from SLiRP/TAP interfaces in the NIC model
> > cannot be emulated because it always receives a packet that is spec
> > complaint. The capability of sending short frames from NIC models is
> > still supported and short frames can still pass through SLiRP/TAP.
> >
> > This series should be able to fix the issue as reported with some
> > NIC models before, that ARP requests get dropped, preventing the
> > guest from becoming visible on the network. It was workarounded in
> > these NIC models on the receive path, that when a short frame is
> > received, it is padded up to 60 bytes.
> >
> > Changes in v5:
> > - minor update on commit message
> > - update the eth_pad_short_frame() comment
> >
> > Changes in v4:
> > - change 'ethernet' to 'Ethernet'
> > - do not inline the helper
> > - check the padded buffer size to avoid buffer overflow
> > - squash slirp/tap commits into one
> >
> > Changes in v3:
> > - use 'without' instead of 'sans'
> > - add a helper to pad short frames
> > - add a comment to 'do_not_pad'
> > - use the pad_short_frame() helper
> >
> > Bin Meng (12):
> >    net: eth: Add a helper to pad a short Ethernet frame
> >    net: Add a 'do_not_pad" to NetClientState
> >    net: Pad short frames to minimum size before sending from SLiRP/TAP
> >    hw/net: virtio-net: Initialize nc->do_not_pad to true
> >    hw/net: e1000: Remove the logic of padding short frames in the recei=
ve
> >      path
> >    hw/net: vmxnet3: Remove the logic of padding short frames in the
> >      receive path
> >    hw/net: i82596: Remove the logic of padding short frames in the
> >      receive path
> >    hw/net: ne2000: Remove the logic of padding short frames in the
> >      receive path
> >    hw/net: pcnet: Remove the logic of padding short frames in the recei=
ve
> >      path
> >    hw/net: rtl8139: Remove the logic of padding short frames in the
> >      receive path
> >    hw/net: sungem: Remove the logic of padding short frames in the
> >      receive path
> >    hw/net: sunhme: Remove the logic of padding short frames in the
> >      receive path
> >
> >   hw/net/e1000.c      | 11 +----------
> >   hw/net/i82596.c     | 18 ------------------
> >   hw/net/ne2000.c     | 12 ------------
> >   hw/net/pcnet.c      |  9 ---------
> >   hw/net/rtl8139.c    | 12 ------------
> >   hw/net/sungem.c     | 14 --------------
> >   hw/net/sunhme.c     | 11 -----------
> >   hw/net/virtio-net.c |  4 ++++
> >   hw/net/vmxnet3.c    | 10 ----------
> >   include/net/eth.h   | 17 +++++++++++++++++
> >   include/net/net.h   |  1 +
> >   net/eth.c           | 17 +++++++++++++++++
> >   net/slirp.c         | 10 ++++++++++
> >   net/tap-win32.c     | 10 ++++++++++
> >   net/tap.c           | 10 ++++++++++
> >   15 files changed, 70 insertions(+), 96 deletions(-)
>
>
> I've queued patch 1-4 for 6.0 and the reset for 6.1.

It seems the reset has not been applied for 6.1?

Regards,
Bin

