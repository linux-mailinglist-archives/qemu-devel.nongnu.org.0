Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3EB3D288A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:47:02 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bqf-0004hv-Hs
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m6bok-0003t1-CP
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:45:02 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m6boi-0006OJ-KT
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:45:02 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso4024729pjb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wEovbu2KYPW7a8VWcrwGAZdznEYgzJ7v585fLcB7tdk=;
 b=xQQAqd1v1plomXCSHVokupOkRnAqMhlVrE3f7rxkFrnrtQz8VG1K77ekbWAHFgZOnS
 1JxIQhBsy8GWP+a5aGttwYyDYDo2WyzYMa3bFjfKqDoxWsTHflGUxE9RIKGLyDSL2tDo
 kPe4Rq4Od+YQ/XcsI/sITif8EJRmYsIFmopLB7dlAUqzNY4w/M16YSRNa59Tn7ciPF3H
 8AcI0KLh1bLqN20x5WUEm/TfOOKsp265GpoaDu0Ls8Pk7fk4yBi5e7LWBS5/tHfE5C1+
 JVd73SZMiRkf/79bTJKJgsw8M3nZ5kQTtel5MKXvdi+uqF1HgMGnmA1Sr5JKkw3fQAMD
 ygWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wEovbu2KYPW7a8VWcrwGAZdznEYgzJ7v585fLcB7tdk=;
 b=XWyrpEycgLgaWnsydvzhUNE1E3twcjtl3MPnZiYt9FdDQpwKHxwOBe2+BUnPHUhgIr
 uhCdPi3TsitkntiIzmD1bUOHJOnAv+HmFuFZ6OmzHSFUYWIBJtDAF/pMDcMyhbPDQJzx
 4+SkD1j9wVuZSKvKvfkSsAGlB3ynoZmjsif94xORWfyvM1dwVjmWReB76iB3jKnv8CVM
 IMY/azvQ87NgMYYbSV/ccCdRPE6JAoYrSu07PqA/+XAFbkqgFr45VOKbqDXhx19aAQeH
 F1lL7YBrVx23EJ7RDCm+fX05jH7B0wdwMe1TTCKPxQWvu4ntIIAlkiV/G6PeXz5+8BM7
 1IIQ==
X-Gm-Message-State: AOAM532hDjzH1rF5hf+Oiyg1F88W316qRVfT2xL8Nr40CNAT1PUDD+3H
 iS+88woO1NJhlPg2s1bUFw4HGQ==
X-Google-Smtp-Source: ABdhPJzWRvJWJ5RmwFgW+ayN97mdH127P4JSqgxctSuVXM2hc6jj/ke1A3JMzWYMxXc7k2WS5ywKcg==
X-Received: by 2002:a63:dd46:: with SMTP id g6mr791359pgj.347.1626972298450;
 Thu, 22 Jul 2021 09:44:58 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id x7sm32010763pfc.96.2021.07.22.09.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 09:44:57 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:44:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 1/4] vhost-user-rng: Add vhost-user-rng implementation
Message-ID: <20210722164455.GA2446676@p14s>
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-2-mathieu.poirier@linaro.org>
 <87mtqgkpub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mtqgkpub.fsf@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Wed, Jul 21, 2021 at 09:52:50AM +0100, Alex Bennée wrote:
> 
> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
> 
> > Following in the footsteps of what whas done for vhost-user-i2c
> > and virtiofsd, introduce a random number generator (RNG) backend
> > that communicates with a vhost-user server to retrieve entropy.
> > That way another VMM could be using the same vhost-user daemon and
> > avoid having to write yet another RNG driver.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  hw/virtio/Kconfig                  |   5 +
> >  hw/virtio/meson.build              |   1 +
> 
> FWIW there are simple merge failures for the meson and Kconfig parts due
> to I2C being merged.
> 

Right, merging I2C before this set will definitely break things.

> <snip>
> > +
> > +    rng->vhost_dev.nvqs = 1;
> > +    rng->vhost_dev.vqs = g_new0(struct vhost_virtqueue, rng->vhost_dev.nvqs);
> > +    if (!rng->vhost_dev.vqs) {
> > +        error_setg_errno(errp, -1, "memory allocation failed");
> > +        goto vhost_dev_init_failed;
> > +    }
> 
> g_new0 will abort on memory allocation failure (which is fine for
> userspace ;-) so you don't need the check and erro handling exit here.
> 

Ok, I'll fix this.

> > +
> > +    ret = vhost_dev_init(&rng->vhost_dev, &rng->vhost_user,
> > +                         VHOST_BACKEND_TYPE_USER, 0, errp);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "vhost_dev_init() failed");
> > +        goto vhost_dev_init_failed;
> > +    }
> > +
> > +    qemu_chr_fe_set_handlers(&rng->chardev, NULL, NULL, vu_rng_event, NULL,
> > +                             dev, NULL, true);
> > +
> > +    return;
> > +
> > +vhost_dev_init_failed:
> > +    virtio_delete_queue(rng->req_vq);
> > +virtio_add_queue_failed:
> > +    virtio_cleanup(vdev);
> > +    vhost_user_cleanup(&rng->vhost_user);
> > +}
> > +
> > +static void vu_rng_device_unrealize(DeviceState *dev)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > +    VHostUserRNG *rng = VHOST_USER_RNG(dev);
> > +
> > +    vu_rng_set_status(vdev, 0);
> > +
> > +    vhost_dev_cleanup(&rng->vhost_dev);
> > +    g_free(rng->vhost_dev.vqs);
> > +    rng->vhost_dev.vqs = NULL;
> > +    virtio_delete_queue(rng->req_vq);
> > +    virtio_cleanup(vdev);
> > +    vhost_user_cleanup(&rng->vhost_user);
> > +}
> > +
> > +static const VMStateDescription vu_rng_vmstate = {
> > +    .name = "vhost-user-rng",
> > +    .unmigratable = 1,
> > +};
> > +
> > +static Property vu_rng_properties[] = {
> > +    DEFINE_PROP_CHR("chardev", VHostUserRNG, chardev),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void vu_rng_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> > +
> > +    device_class_set_props(dc, vu_rng_properties);
> > +    dc->vmsd = &vu_rng_vmstate;
> > +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> > +
> > +    vdc->realize = vu_rng_device_realize;
> > +    vdc->unrealize = vu_rng_device_unrealize;
> > +    vdc->get_features = vu_rng_get_features;
> > +    vdc->set_status = vu_rng_set_status;
> > +    vdc->guest_notifier_mask = vu_rng_guest_notifier_mask;
> > +    vdc->guest_notifier_pending = vu_rng_guest_notifier_pending;
> > +}
> > +
> > +static const TypeInfo vu_rng_info = {
> > +    .name = TYPE_VHOST_USER_RNG,
> > +    .parent = TYPE_VIRTIO_DEVICE,
> > +    .instance_size = sizeof(VHostUserRNG),
> > +    .class_init = vu_rng_class_init,
> > +};
> > +
> > +static void vu_rng_register_types(void)
> > +{
> > +    type_register_static(&vu_rng_info);
> > +}
> > +
> > +type_init(vu_rng_register_types)
> > diff --git a/include/hw/virtio/vhost-user-rng.h b/include/hw/virtio/vhost-user-rng.h
> > new file mode 100644
> > index 000000000000..071539996d1d
> > --- /dev/null
> > +++ b/include/hw/virtio/vhost-user-rng.h
> > @@ -0,0 +1,33 @@
> > +/*
> > + * Vhost-user RNG virtio device
> > + *
> > + * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef _QEMU_VHOST_USER_RNG_H
> > +#define _QEMU_VHOST_USER_RNG_H
> > +
> > +#include "hw/virtio/virtio.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "hw/virtio/vhost-user.h"
> > +#include "chardev/char-fe.h"
> > +
> > +#define TYPE_VHOST_USER_RNG "vhost-user-rng"
> > +OBJECT_DECLARE_SIMPLE_TYPE(VHostUserRNG, VHOST_USER_RNG)
> > +
> > +struct VHostUserRNG {
> > +    /*< private >*/
> > +    VirtIODevice parent;
> > +    CharBackend chardev;
> > +    struct vhost_virtqueue *vhost_vq;
> > +    struct vhost_dev vhost_dev;
> > +    VhostUserState vhost_user;
> > +    VirtQueue *req_vq;
> > +    bool connected;
> > +
> > +    /*< public >*/
> > +};
> > +
> > +#endif /* _QEMU_VHOST_USER_RNG_H */
> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks for taking the time to review this set.

> 
> -- 
> Alex Bennée

