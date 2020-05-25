Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C951D1E127C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 18:17:13 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdFmq-0001on-BX
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 12:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jdFlX-00017d-Vp
 for qemu-devel@nongnu.org; Mon, 25 May 2020 12:15:52 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jdFlU-00050b-DW
 for qemu-devel@nongnu.org; Mon, 25 May 2020 12:15:51 -0400
Received: by mail-qv1-xf44.google.com with SMTP id dh1so8185439qvb.13
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5caC1qoDQHmpMSdvWXR9hOq/bI0FBDMIPeurKroVVk=;
 b=j+nJi5Sf5wW1EgQn7lwu7GvwIXVivIMZNrmPUQzAIP1EmUA/onkJE9+NbGO4NtbfUL
 FMcwvZu8gZ7YWZfa7TbNNHv816EMXCkUc5YfwK3u5CngEcPihRQbcK1dxr1jIcXn3D06
 8MJSQ912dDBslL/9gt/OtRlGb1ulAmOXXKWNM1Hm+2l/YbGCtPJkEdQkIlzhOn7c0mpe
 hk6/H2PeyP+WUsrPuZuFwkcy1lVb7XnErZmdInGACvGmPUOufUzEZ8NQ7S26rMb4J64o
 5gwkLljoLS4NrblR8iZdpYPpU8AdeAWIWVei3ZTI96b1zdbKNleEAOzItRDZDGBR2N8q
 IT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5caC1qoDQHmpMSdvWXR9hOq/bI0FBDMIPeurKroVVk=;
 b=AWWb9Aa8QjSswelULR+mL/ixhkdWw+gBJc6q1n/nTY8FHt1RhFoHjwaNcfi3JtrK96
 U2uqKrmRE+v1dIqqlBkOdM3/YNBfeAj9+wHvu8EnbBIplEYe/eh2ThBAyQeLYmH6/FuT
 yQjtybWio4q9+ezvaz1MaUzZGbvjS/fe7LofQbsOyFU4V1ech/FjTTEJtmHFkKBdeLVt
 OmZuoDE/1nBBCSBYn1WopQkP04+dOTujq+mWn2mWdW/AGMi6geG0njjsIGt4fMFTkdyL
 RpiPOatAYi0rSAQWyiz4zJ/V92LNM5bzRwmKunNRGj5i6JPU5mCO7o2sPxIGkmfB4arI
 M2xQ==
X-Gm-Message-State: AOAM5333L3zfCSQA/5yuATwSxk7cqnUC6vexeFZ2bWpJQioQYjuiKk39
 bKMn9JroNgTMtgZcwdfNdn01xo7BSuPgRQVOPpk=
X-Google-Smtp-Source: ABdhPJzTUjtarvR+lqTtZ+Rql9/M62aP+i0uM6QPAPlhB68Hk5MDMM5mygWfYfouMPaRJshbsIFl3E6Yq2HGIQxmhuw=
X-Received: by 2002:a0c:8b99:: with SMTP id r25mr15465868qva.174.1590423346962; 
 Mon, 25 May 2020 09:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200508163218.22592-1-lulu@redhat.com>
 <20200508163218.22592-6-lulu@redhat.com>
 <20200521124032.GH251811@stefanha-x1.localdomain>
 <CACLfguUVO_zhZbrZ2bW--i5KrP+Yxe0EQwOCrtihSDqRADOKfA@mail.gmail.com>
In-Reply-To: <CACLfguUVO_zhZbrZ2bW--i5KrP+Yxe0EQwOCrtihSDqRADOKfA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 25 May 2020 17:15:35 +0100
Message-ID: <CAJSP0QWSk2kYoYKvtkAdeR8ohLX7rnqVem5o-5z1aAqv5axMKA@mail.gmail.com>
Subject: Re: [RFC v2 5/9] vhost-vdpa: implement vhost-vdpa backend
To: Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=stefanha@gmail.com; helo=mail-qv1-xf44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: rdunlap@infradead.org, Michael Tsirkin <mst@redhat.com>,
 mhabets@solarflare.com, qemu-devel <qemu-devel@nongnu.org>,
 rob.miller@broadcom.com, saugatm@xilinx.com,
 Markus Armbruster <armbru@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Eugenio Perez Martin <eperezma@redhat.com>, jgg@mellanox.com,
 Jason Wang <jasowang@redhat.com>, Shahaf Shuler <shahafs@mellanox.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, parav@mellanox.com, vmireyno@marvell.com,
 "Liang, Cunming" <cunming.liang@intel.com>, gdawar@xilinx.com,
 jiri@mellanox.com, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, Tiwei Bie <tiwei.bie@intel.com>,
 Ariel Adam <aadam@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 hanand@xilinx.com, "Zhu, Lingshan" <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 25, 2020 at 4:34 PM Cindy Lu <lulu@redhat.com> wrote:
> On Thu, May 21, 2020 at 8:40 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > On Sat, May 09, 2020 at 12:32:14AM +0800, Cindy Lu wrote:
> > > From: Tiwei Bie <tiwei.bie@intel.com>
> > >
> > > Currently we have 2 types of vhost backends in QEMU: vhost kernel and
> > > vhost-user. The above patch provides a generic device for vDPA purpose,
> > > this vDPA device exposes to user space a non-vendor-specific configuration
> > > interface for setting up a vhost HW accelerator, this patch set introduces
> > > a third vhost backend called vhost-vdpa based on the vDPA interface.
> > >
> > > Vhost-vdpa usage:
> > >
> > >   qemu-system-x86_64 -cpu host -enable-kvm \
> > >     ......
> > >   -netdev type=vhost-vdpa,vhostdev=/dev/vhost-vdpa-id,id=vhost-vdpa0 \
> > >   -device virtio-net-pci,netdev=vhost-vdpa0,page-per-vq=on \
> >
> > I haven't looked at vDPA in depth. What is different here compared to
> > the existing vhost-backend.c kernel backend?
> >
> > It seems to be making the same ioctls calls so I wonder if it makes
> > sense to share the vhost-backend.c kernel code?
> >
> > Stefan
> Hi Stefan,
> Sorry for the late reply and Thanks for these suggestions.
> I think the most difference between vhost kernel and vdpa is vdpa
> depends on a real hardware.
> The point is that vDPA devices work as a virtio device, but vhost-vdpa
> qemu must present a vhost-like device in qemu vhost layer.
> The ioctl  calls are similar  with vhost-backend.c now, but after more
> and more NIC support vdpa. The difference between vhost-backend.c and
> vpda will become more and more big. It will make the code complicated
> to share the  code with kernel code.

Okay, thanks.

Stefan

