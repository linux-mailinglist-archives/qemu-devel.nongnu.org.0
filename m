Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12536C43A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:35:52 +0200 (CEST)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbL4K-0005fG-1y
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbL2I-0004xT-40
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:33:46 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbL2E-0000WL-1S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:33:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id i24so9741345edy.8
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+lfeBztJJd+9kwzd331v1ww6NajQKYOWy8Hw26UzVmw=;
 b=WHN4sCDauGFHALqR/wUQX17QL8Du7jOoPqesQkJbjV992ssp4Gxklltg/IM5tRz+cw
 J/rN9fas10BBe+c9mfS8pj+6/OFkzHlU69FWtZu1LKYRKu5wdsF79pgHpM/GpYBdRbW9
 Yyxh4SDG04Yinph+TEu3bYYR5mZC6kIUV91UxkY4gPkrBoI0yRXyn3pctVmU56AvbsWB
 1gdmMI0ic0sGvfBahC+fsxwzjRdHEkKCfiLBOdW9kUdn8xMnDAjE4vAFMe58HamxoMmR
 BsW7JF4KFfdVYH3qZVHuKlC0UDEHUJXEQKyzwCbnvZ8LerIWrunjLYZjIgJosNhSDWJP
 SX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+lfeBztJJd+9kwzd331v1ww6NajQKYOWy8Hw26UzVmw=;
 b=UnwHMIXTRJOrfU8tzd2Hjs+tjB+DsOEOJyf/K47Gx0hpVB7mEBBAH9f/l8lI7URPJK
 olFRv0Zw88O+9Vvc932D+Z/1O/jrNU+gCg3zIOHwbTN0MCp0FTiAdJ8DcxRrlzFzk44A
 ls4IcTRY+2TcADyBRgezQAJ1h/WyHBiULKAiE00Nrb4G08izBsT429B/E6sK5FnSGeZ3
 GPY6b9Vv4wAmyAq6/hM/3PmnPP17O8Tj/2ESG5tb5VnspDuQfroJommj1eCECa1BjQgT
 pDRJJ1CbPVvC/pw2pVHmtbSPrYILruq4jSvU4Dck5Ot01x1BT6dWSHU576iZ0kemch8P
 a6Aw==
X-Gm-Message-State: AOAM531WH/sF+XVgGGQZUUxJ+3ey37IX7oxQaamROb/G3W/PH3nQ4HRV
 l8npPkPu3F35uNp4nRhNkm0bel2z5nuPuLNIm5lv
X-Google-Smtp-Source: ABdhPJwq43rtOR33OGpY+fyWeK248FrfzcNQ1UpNAE+JfZxgdA+eb45g0ctFk0sDI89t6rxibkSi0UHglExuaGlGUWE=
X-Received: by 2002:a05:6402:4314:: with SMTP id
 m20mr3364162edc.5.1619519619673; 
 Tue, 27 Apr 2021 03:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-4-xieyongji@bytedance.com>
 <YIbWxUaoP3yvad2t@stefanha-x1.localdomain>
In-Reply-To: <YIbWxUaoP3yvad2t@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 27 Apr 2021 18:33:28 +0800
Message-ID: <CACycT3vfuPam7q0Cwy6COk8e=CMLx6O-bK_g5UGGu7pUVEQBrw@mail.gmail.com>
Subject: Re: Re: [PATCH 3/3] vhost-vdpa-blk: Introduce vhost-vdpa-blk host
 device
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x530.google.com
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

On Mon, Apr 26, 2021 at 11:05 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Apr 08, 2021 at 06:12:52PM +0800, Xie Yongji wrote:
> > +static const int vdpa_feature_bits[] = {
> > +    VIRTIO_BLK_F_SIZE_MAX,
> > +    VIRTIO_BLK_F_SEG_MAX,
> > +    VIRTIO_BLK_F_GEOMETRY,
> > +    VIRTIO_BLK_F_BLK_SIZE,
> > +    VIRTIO_BLK_F_TOPOLOGY,
> > +    VIRTIO_BLK_F_MQ,
> > +    VIRTIO_BLK_F_RO,
> > +    VIRTIO_BLK_F_FLUSH,
> > +    VIRTIO_BLK_F_CONFIG_WCE,
> > +    VIRTIO_BLK_F_DISCARD,
> > +    VIRTIO_BLK_F_WRITE_ZEROES,
> > +    VIRTIO_F_VERSION_1,
> > +    VIRTIO_RING_F_INDIRECT_DESC,
> > +    VIRTIO_RING_F_EVENT_IDX,
> > +    VIRTIO_F_NOTIFY_ON_EMPTY,
> > +    VHOST_INVALID_FEATURE_BIT
> > +};
>
> Please add VIRTIO_F_RING_PACKED so it can be implemented in vDPA in the
> future without changes to the QEMU vhost-vdpa-blk.c code.
>

Sure.

> > +static void vhost_vdpa_blk_device_realize(DeviceState *dev, Error **errp)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > +    VHostVdpaBlk *s = VHOST_VDPA_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> > +    Error *err = NULL;
> > +    int ret;
> > +
> > +    s->vdpa.device_fd = qemu_open_old(s->vdpa_dev, O_RDWR);
> > +    if (s->vdpa.device_fd == -1) {
> > +        error_setg(errp, "vhost-vdpa-blk: open %s failed: %s",
> > +                   s->vdpa_dev, strerror(errno));
> > +        return;
> > +    }
> > +
> > +    vhost_blk_common_realize(vbc, vhost_vdpa_blk_handle_output, &err);
> > +    if (err != NULL) {
> > +        error_propagate(errp, err);
> > +        goto blk_err;
> > +    }
> > +
> > +    vbc->vhost_vqs = g_new0(struct vhost_virtqueue, vbc->num_queues);
>
> This is already done by vhost_blk_common_realize(). The old pointer is
> overwritten and leaked here.
>

Will fix it.

> > +static const VMStateDescription vmstate_vhost_vdpa_blk = {
> > +    .name = "vhost-vdpa-blk",
> > +    .minimum_version_id = 1,
> > +    .version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_VIRTIO_DEVICE,
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +};
>
> vdpa-blk does not support live migration yet. Please remove this.
>
> Does hw/virtio/vhost.c should automatically register a migration
> blocker? If not, please register one.
>

Will do it.

> > +#define TYPE_VHOST_VDPA_BLK "vhost-vdpa-blk"
>
> At this stage vdpa-blk is still very new and in development. I suggest
> naming it x-vhost-vdpa-blk so that incompatible changes can still be
> made to the command-line/APIs. "x-" can be removed later when the
> feature has matured.

OK.

Thanks,
Yongji

