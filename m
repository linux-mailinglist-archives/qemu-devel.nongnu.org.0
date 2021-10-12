Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BF42A148
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:40:01 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEGN-0007Ix-VT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maDng-0003m2-Lg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maDnd-0002H3-RI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634029817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slWNj4rdiP2FfVo1MQK2/I8FGxzLON0GbUV+xUfKMGE=;
 b=McXgD3A8z2ae6kwdUMODlocxV3ctop0LkaL1V80lCuNRo0zcjKQ3jYqCAGNFpLASXRzVjE
 DBkI/Y04S8L8h73k9GXdtWOEzm2D3tlM6imLCvasHRaDW6wETA0KH1iPGphFnxkTL6rpaD
 1HUERO2P6f5eM7OhHiCi1yjLPUEUB0c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-W4E8l2zkOuC2WeVg8L4_9Q-1; Tue, 12 Oct 2021 05:10:13 -0400
X-MC-Unique: W4E8l2zkOuC2WeVg8L4_9Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 m10-20020ad4448a000000b003833687f674so11561473qvt.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 02:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=slWNj4rdiP2FfVo1MQK2/I8FGxzLON0GbUV+xUfKMGE=;
 b=vqaaCZ04rLZ5NYyHlAxhfj0lhCcH/7/9E1OCeMWoabOL8ix+JHlqGugKMk+RvpMryM
 1mSRlgjzQXbLnfZqYRie4pUW3U1obQB5fHKqVq3Fhfp64mAafX/tz1aRVvOf2JgJkgrD
 MJSzyRI9YxdLqE7p8V3qVmRpaUJLorAGeM3I8UphD62Kx7JDaYYjCDYQpa1h4qpNcKJn
 nMqNvS27POliCkq3xSE8j+3dmu+dg2N5yy60H72xMX5suhLJcL7N1QGEae8ntog223Sg
 jymuhYzcYI0kSB43NHa7f4GRMGqASZ79MddCqi4punfErUIPkpZv9rh1srlCF5RZOJK4
 /k9w==
X-Gm-Message-State: AOAM533prdf3StT3susDzbiIBKDnaamSi2Po5PBX87K+WPg7k9CRiSO1
 jTBH0mLilEMcrFuUghqNFlmkuGW3AHlpK4LVUr8OMSkGqoUeZBmGYktHwu8TXzi8ubLa2I7joVw
 PYWEoA4TJI/UUn5ocNjwz+TPT+gXoob8=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr18683317qko.316.1634029813447; 
 Tue, 12 Oct 2021 02:10:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyiXNLdXqo+a0KU+89LdwqFrXn046GMI7ZJAe8oj0n1NP0c3qTclJQm+mlwbFLFWEeF2H/rCp4xjMGF5y222E=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr18683293qko.316.1634029813193; 
 Tue, 12 Oct 2021 02:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <9f438a35-a5ff-1891-24e6-dd11d1a3bba6@redhat.com>
 <CACGkMEvQrJKYZ_xm+f5saZwd7jkYcDOdhNQXwHPU1PvGjGCFLA@mail.gmail.com>
In-Reply-To: <CACGkMEvQrJKYZ_xm+f5saZwd7jkYcDOdhNQXwHPU1PvGjGCFLA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Oct 2021 11:09:37 +0200
Message-ID: <CAJaqyWf6sGMe=Nm4uZDvhu=O+kbfTtcC=g5zbQ=O6VtT0dRGnA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/20] vDPA shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 6:06 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Oct 12, 2021 at 11:59 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. Thi=
s
> > > is intended as a new method of tracking the memory the devices touch
> > > during a migration process: Instead of relay on vhost device's dirty
> > > logging capability, SVQ intercepts the VQ dataplane forwarding the
> > > descriptors between VM and device. This way qemu is the effective
> > > writer of guests memory, like in qemu's virtio device operation.
> > >
> > > When SVQ is enabled qemu offers a new vring to the device to read
> > > and write into, and also intercepts kicks and calls between the devic=
e
> > > and the guest. Used buffers relay would cause dirty memory being
> > > tracked, but at this RFC SVQ is not enabled on migration automaticall=
y.
> > >
> > > It is based on the ideas of DPDK SW assisted LM, in the series of
> > > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> > > not map the shadow vq in guest's VA, but in qemu's.
> > >
> > > For qemu to use shadow virtqueues the guest virtio driver must not us=
e
> > > features like event_idx or indirect descriptors. These limitations wi=
ll
> > > be addressed in later series, but they are left out for simplicity at
> > > the moment.
> > >
> > > SVQ needs to be enabled with QMP command:
> > >
> > > { "execute": "x-vhost-enable-shadow-vq",
> > >        "arguments": { "name": "dev0", "enable": true } }
> > >
> > > This series includes some patches to delete in the final version that
> > > helps with its testing. The first two of the series freely implements
> > > the feature to stop the device and be able to retrieve its status. It=
's
> > > intended to be used with vp_vpda driver in a nested environment. This
> > > driver also need modifications to forward the new status bit.
> > >
> > > Patches 2-8 prepares the SVQ and QMP command to support guest to host
> > > notifications forwarding. If the SVQ is enabled with these ones
> > > applied and the device supports it, that part can be tested in
> > > isolation (for example, with networking), hopping through SVQ.
> > >
> > > Same thing is true with patches 9-13, but with device to guest
> > > notifications.
> > >
> > > The rest of the patches implements the actual buffer forwarding.
> > >
> > > Comments are welcome.
> >
> >
> > Hi Eugenio:
> >
> >
> > It would be helpful to have a public git repo for us to ease the review=
.
> >
> > Thanks
> >

Hi Jason,

I just pushed this tag to
https://github.com/eugpermar/qemu/tree/vdpa_sw_live_migration.d/vdpa-v4
,
but let me know if you find another way more convenient.

Thanks!

>
> Btw, we also need to measure the performance impact of the shadow virtque=
ue.
>

I will measure it in subsequent series, since I'm still making some
changes. At the moment I'm also testing with nested virtualization
that can affect it.

However we need to take into account that this series still has a lot
of room for improvement. I would say that packed vq and isolating code
in its own aio context could give a noticeable boost on the numbers.

Thanks!

> Thanks
>


