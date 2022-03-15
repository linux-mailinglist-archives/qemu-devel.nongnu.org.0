Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F224D9AB1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:54:04 +0100 (CET)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5kY-0008SP-T9
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:54:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nU5iq-0006TB-Dq
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:52:18 -0400
Received: from [2a00:1450:4864:20::531] (port=35376
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nU5im-0005N3-Fv
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:52:14 -0400
Received: by mail-ed1-x531.google.com with SMTP id y22so23859840eds.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cldBqeYkdo4ue1+sKJGyFquHYb4kFdFp03pwC4dwsJw=;
 b=xkris++SFXskGN7cRjo7aOMu/l4957zY9i5Vb+X2Quy0tlx9sBYQcjLq1p4irhWaOa
 p0T3LiByJhyxZHF+zszj5AZb31+A/QRiJW4RVUN1XG9cf9h77UQo/yK7i2H+HYHhlsGd
 J3x/AGb4ITbDwFLpZ6Zyx3Z2EYMBzmKCr96d6huYzctKkdYWaML6gWKxb0al+FmlWdy/
 2HIMnAXKsrvpIYLGVXT55A47jxv2YlRfFOSYi/OCobSlp69skcldgCUvnAIy+muKkAkY
 sKJLRVRyp1XnDuAlcaj8qqJ14HE0K26QbPy3KCNPoahzZE3OO6r5qq9tMMpivvBDcEIh
 5RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cldBqeYkdo4ue1+sKJGyFquHYb4kFdFp03pwC4dwsJw=;
 b=UrI0bf1WDwQeYTcJpRytutO9EKJbzNPekgy8MgaDSkW9oICze8ebYCtEABRTA7R5kA
 cG82ngkuf7OhKzKNAs6tFT1cLod2bt1uyNB/1sw5CGA3frED+deFWhCLkSLbFJSFMcPK
 /ZNJHFKBqysPFyCh+8KiC8oKQBo2i/0Z57a4sqUyg6IAwh9aFdP1nSIFL2ySiM+xmVXL
 9mSCCks3BA7xTnraCrW3+EvAhT4BvOwKVJFF6eLNhhMuNrWjW0/fBxbEcoFoibHIqGI8
 MgVr48yBWJjdF44W4e++buI3dRzshajWLEykxsyn0KZdsGfngmfQU1B+KaTQK6XhjkRC
 7sHw==
X-Gm-Message-State: AOAM530C4Cj2pF2VZaJUDKWIUqDL2lklxvjhGomCPsaShopLN5IC0kcR
 hAsPUdj4SNTtikVnjnKqrA/Fny5e8QUtgKI2IhhC
X-Google-Smtp-Source: ABdhPJzgHX1x7jiLRT1BO9Pf8juejYPsGC7f+vNxGg6J4izvCFRH43PSw3zfn4KtcKej2eH7QtMQNtB4lW8eLMxD4+o=
X-Received: by 2002:aa7:c99a:0:b0:416:290:415a with SMTP id
 c26-20020aa7c99a000000b004160290415amr24566850edt.64.1647345130321; Tue, 15
 Mar 2022 04:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-5-xieyongji@bytedance.com>
 <YjBzxAvvUuXBfGPn@stefanha-x1.localdomain>
In-Reply-To: <YjBzxAvvUuXBfGPn@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 15 Mar 2022 19:52:03 +0800
Message-ID: <CACycT3t-eJBLsTKWJ85Ho0hoG4KuQCHV6Hwk6=KJXTY9=eYMDA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] vduse-blk: implements vduse-blk export
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x531.google.com
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

On Tue, Mar 15, 2022 at 7:08 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 06:59:41PM +0800, Xie Yongji wrote:
> > This implements a VDUSE block backends based on
> > the libvduse library. We can use it to export the BDSs
> > for both VM and container (host) usage.
> >
> > The new command-line syntax is:
> >
> > $ qemu-storage-daemon \
> >     --blockdev file,node-name=drive0,filename=test.img \
> >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> >
> > After the qemu-storage-daemon started, we need to use
> > the "vdpa" command to attach the device to vDPA bus:
> >
> > $ vdpa dev add name vduse-export0 mgmtdev vduse
>
> The per-QEMU export id is used as the global vdpa device name. If this
> becomes a problem in the future then a new --export
> vduse-blk,vdpa-dev-name= option can be added.
>

Yes.

> > +    case VIRTIO_BLK_T_GET_ID: {
> > +        size_t size = MIN(iov_size(&elem->in_sg[0], in_num),
> > +                          VIRTIO_BLK_ID_BYTES);
> > +        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->export.id);
>
> Please use iov_from_buf(). The driver is allowed to submit as many
> in_sg[] elements as it wants and a compliant virtio-blk device
> implementation must support that.
>

Got it.

> Here is the VIRTIO specification section that covers message framing:
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-280004
>
> > +    features = (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> > +               (1ULL << VIRTIO_F_VERSION_1) |
> > +               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> > +               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> > +               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> > +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> > +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> > +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> > +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
>
> The VIRTIO_F_ and VIRTIO_RING_F_ feature bits report the capabilities of
> libvduse. They should probably be defined in libvduse. That way no
> changes to vduse-blk.c are required when libvduse changes:
>
>   features = LIBVDUSE_VIRTIO_FEATURES |
>              (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
>              ...;

It's OK to define the VIRTIO_F_* feature bits in libvduse since daemon
might not want to disable it. But maybe not including VIRTIO_RING_F_*
feature bits since daemon might want to disable them in some cases.

Thanks,
Yongji

