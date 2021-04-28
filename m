Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51236D672
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:29:12 +0200 (CEST)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiNT-0001TC-8D
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbiLn-00010W-5F
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:27:27 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbiLf-0002hK-6y
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:27:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id s15so73785756edd.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kGc6qdly7t4Jmb3Q633HyKSMzabyNqzLRU4wrIOJ9Ps=;
 b=U5cI6RYr7YkMy7jL2mtZ7Rj0j1t7HRGXyhWbzY3J2VTTt8DU1/BTGIYjtcBRe+n+0K
 wNlkTQuwyUgMFT6CU/dfpPWLFogmWQ0IkxPJTmXVSV/DcKCfgns+5bs7mtkyj7nPQ+1Y
 tzI2w92bipwJjox6aMfFcKILMhNYhPg7v+4z3F4y/6oqq+da0EoWTmeC49vUL8G4oSI3
 L2RNM5S8bdhH9Wj7KZT4/dOnr/5upe+r/79pypwf7kdOTFTT/euTNqgfdIVgLQ+XSKWX
 apXcx39v+gdYm3g4XQ9Yt4ndVUzraESJAwyudo47j9oDuy16X2r0Ohu9s0t24hGHFZD9
 onqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kGc6qdly7t4Jmb3Q633HyKSMzabyNqzLRU4wrIOJ9Ps=;
 b=APpGbhv3b/oCvWwOJVeE8nX3gEwhnxlqc3MFpWR0ZpMMOV+v6/IiOqG2FBXQjE1QQM
 UCGWRzYPqWQUAG+0+3LFcriLkGPGMupFSYP7UDmL093hvncX8cqsr6PJRtaFpkK/AiQs
 4zeOvuKQ8DDB8rNBFoCPJF8+TvE0AjXQ9Y8VapgkWojsQpl0GuL2lN/5PKFFR7SHq/pc
 zsV5qFQOVHiJCaaH6nLvmXslTa21o5tbAauhwjcKLmnrngDoH7NdlL0JdCKgNRTmfIY8
 pDqY9G6OF1ABZ5KlxA5ijafrz3Wm0rNNixQiEnYFaD4Y1WcLYidqMmbT4djvl+xSq4js
 LfEA==
X-Gm-Message-State: AOAM531Zd8iFEBvKhYf1tXm8xj5QpT1D1GcSR63b1l1A1DqRL86u9ejW
 /oBRbDLxQheUeaNx15L31rUPP2vMNCxUFuZxIJf/
X-Google-Smtp-Source: ABdhPJy0kAejELaa0nJroOmPeZ/U1c8kgzEn6N+YTWE8ugNGz869tau3SlVapOaKz5OTf0QtIkVnhzQH4zRB7BLkIhw=
X-Received: by 2002:a05:6402:4314:: with SMTP id
 m20mr10278459edc.5.1619609234054; 
 Wed, 28 Apr 2021 04:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <YIbdYdxD0CDcX+C2@stefanha-x1.localdomain>
 <CACycT3sU3LDnAvk_iefo=91L91=8TNRQJfKyRvOy2EOtiesBMw@mail.gmail.com>
 <YIgfh632Evrdid12@stefanha-x1.localdomain>
In-Reply-To: <YIgfh632Evrdid12@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 28 Apr 2021 19:27:03 +0800
Message-ID: <CACycT3sV_Bv63Y5pvYV=e2-B5c3Lky2UWWc4tk=DDN0tKs=6Ng@mail.gmail.com>
Subject: Re: Re: Re: [PATCH 0/3] Introduce vhost-vdpa block device
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x531.google.com
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
Cc: kwolf@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, mreitz@redhat.com, changpeng.liu@intel.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 10:28 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>
> On Tue, Apr 27, 2021 at 06:24:55PM +0800, Yongji Xie wrote:
> > On Mon, Apr 26, 2021 at 11:34 PM Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > >
> > > On Thu, Apr 08, 2021 at 06:12:49PM +0800, Xie Yongji wrote:
> > > > Since we already have some ways to emulate vDPA block device
> > > > in kernel[1] or userspace[2]. This series tries to introduce a
> > > > new vhost-vdpa block device for that. To use it, we can add
> > > > something like:
> > > >
> > > > qemu-system-x86_64 \
> > > >     -device vhost-vdpa-blk-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> > >
> > > This device is similar to vhost-user-blk. QEMU does not see it as a
> > > block device so storage migration, I/O throttling, image formats, etc
> > > are not supported. Stefano Garzarella and I discussed how vdpa-blk
> > > devices could integrate more deeply with QEMU's block layer. The QEMU
> > > block layer could be enabled only when necessary and otherwise bypass=
ed
> > > for maximum performance.
> > >
> >
> > Do you mean we can make use of the shadow virtqueue for the slow path
> > (I/O will go through the block layer) and add a fast path (like what
> > we do now) to bypass the block layer?
>
> Yes.
>
> > > This alternative approach is similar to how vhost-net is implemented =
in
> > > QEMU. A BlockDriver would handle the vdpa-blk device and the regular
> > > virtio-blk-pci device would still be present. The virtqueues could be
> > > delegated to the vdpa-blk device in order to bypass the QEMU block
> > > layer.
> > >
> > > I wanted to mention this since it's likely that this kind of vdpa-blk
> > > device implementation will be posted in the future and you might be
> > > interested. It makes live migration with non-shared storage possible,
> > > for example.
> > >
> >
> > That would be nice, I'm looking forward to it!
> >
> > So do you think whether it's necessary to continue this approach?
> > Looks like we don't need a vhost-vdpa-blk device any more in the new
> > approach.
>
> There is no code for the vdpa-blk BlockDriver yet and the implementation
> will be more complex than this patch series (more risk the feature could
> be delayed).
>
> If you need vdpa-blk as soon as possible then this patch series may be a
> pragmatic solution. As long as it doesn't limit the vdpa-blk interface
> in a way that prevents the BlockDriver implementation then I think QEMU
> could support both.
>
> In the long term the vdpa-blk BlockDriver could replace -device
> vdpa-blk-pci since the performance should be identical and it supports
> more use cases.
>
> It's up to you. You're welcome to wait for the BlockDriver, work
> together with Stefano on the BlockDriver, or continue with your patch
> series.
>

I like the new idea! Let me wait for it.

> > > An issue with vhost-user-blk is that the ownership of qdev properties
> > > and VIRTIO Configuration Space fields was not clearly defined. Some
> > > things are handled by QEMU's vhost-user-blk code, some things are
> > > handled by the vhost-user device backend, and some things are negotia=
ted
> > > between both entities. This patch series follows the existing
> > > vhost-user-blk approach, which I think will show serious issues as th=
e
> > > device is more widely used and whenever virtio-blk or the implementat=
ion
> > > is extended with new features. It is very hard to provide backwards
> > > compatibility with the current approach where the ownership of qdev
> > > properties and VIRTIO Configuration Space fields is ad-hoc and largel=
y
> > > undefined.
> > >
> > > Since vDPA has VIRTIO Configuration Space APIs, I suggest that the
> > > vhost-vDPA device controls the entire configuration space. QEMU shoul=
d
> > > simply forward accesses between the guest and vhost-vdpa.
> > >
> >
> > Does this already achieved by vhost_ops->vhost_get_config=EF=BC=9F And =
I want
> > to know how to handle the endianness issue if qemu just simply does
> > forwarding and doesn't care about the content of config space.
>
> QEMU just copies bytes betwen the driver and the device via
> vdpa_config_ops->get/set_config(). I don't think it needs to worry about
> endianness in VIRTIO Configuration Space access code or did I miss
> something?
>
> My understanding is that vDPA currently supports same-endian Legacy and
> little-endian Modern devices. Cross-endian Legacy devices are currently
> not supported because there is no API to set endianness.
>

OK, I get you.

> If such an API is added in the future, then QEMU can use it to tell the
> vDPA device about guest endianness. QEMU still won't need to modify
> Configuration Space data itself.
>
> > > Regarding qdev properties, it's a little trickier because QEMU needs =
to
> > > do the emulated VIRTIO device setup (allocating virtqueues, setting
> > > their sizes, etc). Can QEMU query this information from the vDPA devi=
ce?
> > > If not, which qdev properties are read-only and must match the
> > > configuration of the vDPA device and which are read-write and can
> > > control the vDPA device?
> > >
> >
> > Yes, that's an issue. We have to make sure the number of virtqueues
> > and their size set by qemu is not greater than hardware limitation.
> > Now I think we can query the max queue size, but looks like we don't
> > have an interface to query the max number of virtqueues.
>
> Okay, this is something that Jason and Stefano can discuss more. Ideally
> the QEMU command-line does not need to duplicate information about the
> vDPA device. The vdpa management tool
> (https://github.com/shemminger/iproute2/tree/main/vdpa) and VDUSE
> virtio-blk device will probably be where the main device configuration
> happens.
>
> As a starting point, can you describe how your VDUSE virtio-blk device
> is configured? Does it have a command-line/config file/RPC API to set
> the number of virtqueues, block size, etc?
>

Yes, we have a command-line to set those properties, something like:

qemu-storage-daemon \
      --chardev socket,id=3Dcharmonitor,path=3D/tmp/qmp.sock,server,nowait =
\
      --monitor chardev=3Dcharmonitor \
      --blockdev
driver=3Dhost_device,cache.direct=3Don,aio=3Dnative,filename=3D/dev/nullb0,=
node-name=3Ddisk0
\
      --export type=3Dvduse-blk,id=3Dtest,node-name=3Ddisk0,writable=3Don,n=
ame=3Dvduse-null,num-queues=3D16,queue-size=3D128

Thanks,
Yongji

