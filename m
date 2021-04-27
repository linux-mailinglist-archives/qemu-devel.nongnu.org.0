Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC636C3D4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:30:37 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKzE-0002io-Tr
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbKuK-0008Dj-Pg
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:25:33 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbKty-0003wA-AV
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:25:26 -0400
Received: by mail-ej1-x629.google.com with SMTP id u17so88850641ejk.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q+Lkpe7/qSv9cQ9MBriySnduaChYcPUxSDWgHEvAbLs=;
 b=ICTANCP99yJdM/z7WAFOhMlLKDmWgHuf0vsFYhpIvgz9pEdszezXKkRMhSgdcgOg3P
 /Mx33sYqxDjZ0pgyAj7UuCfMXEaFw3garlPRyGPopAeGwD1CB+9EjW6zrjevQfi7ct8x
 N4YXNtRC4bsvaiXssBP0Qza1LUYt8fSMTw7WEIeQxBPiOUTngp/Kzg9StVFm/zKUTJLI
 taBUG8xfjS+vdy2YnJIyxqr7UuFSGpsOpmi9Dd9OiUp/8Qivw03FoU3JQ2dQ7bVFy9n3
 h2ZOSoutG9w7YBOgkr+NwRdOuFglXEDLgjZqLzpyVS5wJpzTCwRdP2SnBGIUHxXAe5Vg
 nW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q+Lkpe7/qSv9cQ9MBriySnduaChYcPUxSDWgHEvAbLs=;
 b=scX6lIkCI5XwlKya//Su569esuXkl1HtzMR0T3YR/6j7CSSzxFkhkHvpJM+1LfkgxJ
 EbcaMHza3IiQhR35WoO/Sd3iuhzdMbd2woz/OUkMRuWqBpNDojJV8jjcCaioBIEWrdtF
 MAG1QQ/PO6hccTT9usv1XBKPGGzhYx6a1jwWYKCvCSLkjo1EXw5kiDeVDCybMaifkbY3
 VRIw5AeyP9ZjkV89cyI/9oSJ+M8G3dSKC7xcQoPzVYMFtN2UqEGML31C8Oh9AtWLyQhv
 RFVpmQK3/7UOMVSnVtcvjqeyZ6OvsMEB8i7ZNj8PqDFOdcuxXmknK05vVG5nQm2y/hv5
 aquA==
X-Gm-Message-State: AOAM533RCSchlr21Eymld41PsMRGXdK7Exs+hHsfdVQ3+4fPyt7kwpqi
 MC6PUpCvHxRR9nEAomgEi4lpKAwlC/dfMM4jSMvI
X-Google-Smtp-Source: ABdhPJwUdf4KZMc70QI3zDg10xWfepBr4saKNcd0k+h180rJcFFXdlNWf/ifiNHz5xKtkfenKMrUGAFW8KXa1uB/SFA=
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr22862829ejc.1.1619519106407; 
 Tue, 27 Apr 2021 03:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <YIbdYdxD0CDcX+C2@stefanha-x1.localdomain>
In-Reply-To: <YIbdYdxD0CDcX+C2@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 27 Apr 2021 18:24:55 +0800
Message-ID: <CACycT3sU3LDnAvk_iefo=91L91=8TNRQJfKyRvOy2EOtiesBMw@mail.gmail.com>
Subject: Re: Re: [PATCH 0/3] Introduce vhost-vdpa block device
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x629.google.com
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

On Mon, Apr 26, 2021 at 11:34 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>
> On Thu, Apr 08, 2021 at 06:12:49PM +0800, Xie Yongji wrote:
> > Since we already have some ways to emulate vDPA block device
> > in kernel[1] or userspace[2]. This series tries to introduce a
> > new vhost-vdpa block device for that. To use it, we can add
> > something like:
> >
> > qemu-system-x86_64 \
> >     -device vhost-vdpa-blk-pci,vdpa-dev=3D/dev/vhost-vdpa-0
>
> This device is similar to vhost-user-blk. QEMU does not see it as a
> block device so storage migration, I/O throttling, image formats, etc
> are not supported. Stefano Garzarella and I discussed how vdpa-blk
> devices could integrate more deeply with QEMU's block layer. The QEMU
> block layer could be enabled only when necessary and otherwise bypassed
> for maximum performance.
>

Do you mean we can make use of the shadow virtqueue for the slow path
(I/O will go through the block layer) and add a fast path (like what
we do now) to bypass the block layer?

> This alternative approach is similar to how vhost-net is implemented in
> QEMU. A BlockDriver would handle the vdpa-blk device and the regular
> virtio-blk-pci device would still be present. The virtqueues could be
> delegated to the vdpa-blk device in order to bypass the QEMU block
> layer.
>
> I wanted to mention this since it's likely that this kind of vdpa-blk
> device implementation will be posted in the future and you might be
> interested. It makes live migration with non-shared storage possible,
> for example.
>

That would be nice, I'm looking forward to it!

So do you think whether it's necessary to continue this approach?
Looks like we don't need a vhost-vdpa-blk device any more in the new
approach.

> An issue with vhost-user-blk is that the ownership of qdev properties
> and VIRTIO Configuration Space fields was not clearly defined. Some
> things are handled by QEMU's vhost-user-blk code, some things are
> handled by the vhost-user device backend, and some things are negotiated
> between both entities. This patch series follows the existing
> vhost-user-blk approach, which I think will show serious issues as the
> device is more widely used and whenever virtio-blk or the implementation
> is extended with new features. It is very hard to provide backwards
> compatibility with the current approach where the ownership of qdev
> properties and VIRTIO Configuration Space fields is ad-hoc and largely
> undefined.
>
> Since vDPA has VIRTIO Configuration Space APIs, I suggest that the
> vhost-vDPA device controls the entire configuration space. QEMU should
> simply forward accesses between the guest and vhost-vdpa.
>

Does this already achieved by vhost_ops->vhost_get_config=EF=BC=9F And I wa=
nt
to know how to handle the endianness issue if qemu just simply does
forwarding and doesn't care about the content of config space.

> Regarding qdev properties, it's a little trickier because QEMU needs to
> do the emulated VIRTIO device setup (allocating virtqueues, setting
> their sizes, etc). Can QEMU query this information from the vDPA device?
> If not, which qdev properties are read-only and must match the
> configuration of the vDPA device and which are read-write and can
> control the vDPA device?
>

Yes, that's an issue. We have to make sure the number of virtqueues
and their size set by qemu is not greater than hardware limitation.
Now I think we can query the max queue size, but looks like we don't
have an interface to query the max number of virtqueues.

Thanks,
Yongji

