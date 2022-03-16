Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA34DB1F5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:57:20 +0100 (CET)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUU9P-0007T9-4m
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:57:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUTdO-0004MH-TM
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:16 -0400
Received: from [2a00:1450:4864:20::633] (port=37765
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUTdI-00045M-MW
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:10 -0400
Received: by mail-ej1-x633.google.com with SMTP id bg10so4167445ejb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aI2mYXWLtvY+Sk2GOk7wVLMt7SQPcKDfd5djFXcYWXE=;
 b=TTp0gvTToIEJMWvGSYh/Qh7NEKhi15k3iGZFGScARQvH0QCYJ6UT8Yf6jqcB54GIxm
 JKL2oISJbcAaBDUmJGScCiiYdJ4wzEHa3aKn3kP5fGRz54f8LFgGiFhPwHMlM0n1v8z6
 /BzYQ/9O3el7j7u0it5puhFnQcqR+TKYEiTg0euQEnZh4Dt+Xkp3NAkefxh1pwLf7439
 98GzZmwQ6uspIBRRPeexcS+FEaNj+Qs5rMddMgUW/CYHao3RAYSE7PxA7KDi1NoK864Y
 +4S4EePfOb5qDHuHBRg0x/lt7jLGu8rLlsKCT1UlMTDtfnKx6fW+L234mguEk7mXHhcI
 XpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aI2mYXWLtvY+Sk2GOk7wVLMt7SQPcKDfd5djFXcYWXE=;
 b=qMA4xq/3/tbf4uNYjTeEyQWeIIRBMAnkYNY0gmEOB3g+6jcPsao9N1S2FYppIbYJzo
 leP+XUr73IB9NhLO/cyXAGGsRGCaXs5x3dT5nTFHNAZCXtoShbfO6q9wlU7DRu0qK8OQ
 s9Rx8jnnEETPpaFohGsQYFReScHqtd9gFhERv//q/gNj+AEsryfZUtcL8chISL5hwDrX
 QgoWLSmIO+YYddEt4z6mkstU4KeEjC+JNEUa43kZ8ZNsYebctTy6DWoHQh7N9rt4cv2D
 KvMC9rbJPyemYiPNkANGEAIqMTY2GlimL4GVmB809SZLOhbVuOYN6hTf5LgaV6Il9nzG
 9vNQ==
X-Gm-Message-State: AOAM532I2vlZnqiUoDG7ccGBtBAzPWxnO0iuenTgH+W8fh+MW5zOm7Vz
 S9tpTG9O/4JRis52E9ZHdZamO0eNKdJggqJj0d7D
X-Google-Smtp-Source: ABdhPJwmhUUSsiHXkh3uiPI0GM5pVBFpM2zg3ImjNkM5qxZUgnTkSrkTEP/5AnUZWBknkP0j3NVVDYsnPuciv0uH4Wc=
X-Received: by 2002:a17:906:b348:b0:6cf:8cfe:d729 with SMTP id
 cd8-20020a170906b34800b006cf8cfed729mr27606521ejb.622.1647437046321; Wed, 16
 Mar 2022 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-5-xieyongji@bytedance.com>
 <YjBzxAvvUuXBfGPn@stefanha-x1.localdomain>
 <CACycT3t-eJBLsTKWJ85Ho0hoG4KuQCHV6Hwk6=KJXTY9=eYMDA@mail.gmail.com>
 <YjHVNJZJlt+nDMPi@stefanha-x1.localdomain>
In-Reply-To: <YjHVNJZJlt+nDMPi@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 16 Mar 2022 21:24:01 +0800
Message-ID: <CACycT3tA09_Nc=Fed_n5A3WFNrsJZEC0=gEdoiWRLP9bDReDHw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] vduse-blk: implements vduse-blk export
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 8:16 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Mar 15, 2022 at 07:52:03PM +0800, Yongji Xie wrote:
> > On Tue, Mar 15, 2022 at 7:08 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, Feb 15, 2022 at 06:59:41PM +0800, Xie Yongji wrote:
> > > > This implements a VDUSE block backends based on
> > > > the libvduse library. We can use it to export the BDSs
> > > > for both VM and container (host) usage.
> > > >
> > > > The new command-line syntax is:
> > > >
> > > > $ qemu-storage-daemon \
> > > >     --blockdev file,node-name=drive0,filename=test.img \
> > > >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> > > >
> > > > After the qemu-storage-daemon started, we need to use
> > > > the "vdpa" command to attach the device to vDPA bus:
> > > >
> > > > $ vdpa dev add name vduse-export0 mgmtdev vduse
> > >
> > > The per-QEMU export id is used as the global vdpa device name. If this
> > > becomes a problem in the future then a new --export
> > > vduse-blk,vdpa-dev-name= option can be added.
> > >
> >
> > Yes.
> >
> > > > +    case VIRTIO_BLK_T_GET_ID: {
> > > > +        size_t size = MIN(iov_size(&elem->in_sg[0], in_num),
> > > > +                          VIRTIO_BLK_ID_BYTES);
> > > > +        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->export.id);
> > >
> > > Please use iov_from_buf(). The driver is allowed to submit as many
> > > in_sg[] elements as it wants and a compliant virtio-blk device
> > > implementation must support that.
> > >
> >
> > Got it.
> >
> > > Here is the VIRTIO specification section that covers message framing:
> > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-280004
> > >
> > > > +    features = (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> > > > +               (1ULL << VIRTIO_F_VERSION_1) |
> > > > +               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> > > > +               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> > > > +               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> > > > +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> > > > +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> > > > +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> > > > +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
> > >
> > > The VIRTIO_F_ and VIRTIO_RING_F_ feature bits report the capabilities of
> > > libvduse. They should probably be defined in libvduse. That way no
> > > changes to vduse-blk.c are required when libvduse changes:
> > >
> > >   features = LIBVDUSE_VIRTIO_FEATURES |
> > >              (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> > >              ...;
> >
> > It's OK to define the VIRTIO_F_* feature bits in libvduse since daemon
> > might not want to disable it. But maybe not including VIRTIO_RING_F_*
> > feature bits since daemon might want to disable them in some cases.
>
> The VIRTIO_RING_F_* functionality is implemented inside libvduse and not
> the device code. If the device wants to disable specific features, it
> can clear those bits.
>
> Thinking about the LIBVDUSE_VIRTIO_FEATURES idea I think it's slightly
> better to make it a function so that libvduse code supports dynamic
> linking. That way the device calls libvduse to query the feature bits
> instead of compiling a constant from the libvduse header file into the
> device executable.
>
> So something like:
>
>   features = (vdu_get_virtio_features() & ~(...features we wish to clear...)) |
>              (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
>              ...;
>

OK, it looks good to me.

Thanks,
Yongji

