Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBFD6C52A9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2Ot-0001be-1Q; Wed, 22 Mar 2023 13:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf2Oo-0001av-Np
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf2Om-0003bf-IB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679506638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nI5uf5AdPqs9Y7G8SRp+LbLM46YNAFZ/Cb0k/RcW5nw=;
 b=SMo3OYPmlbNlONe8zRQJwAUGjz4vzQm2AjN6+VZ7ElEkyhzO5drMMEaEPS0kY2x/xc0C8t
 EW6MMx4JxK1+iP+54+3fSYYFP6sAYDio1lQh7dysapMIbgGgFchMvDYvIFt0KDBvPt3/Fk
 97DB/RDD5qbHovtYx0y87Udwz+YLHhI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-QLRcpZoAMbWmXJry1-0Z_g-1; Wed, 22 Mar 2023 13:37:16 -0400
X-MC-Unique: QLRcpZoAMbWmXJry1-0Z_g-1
Received: by mail-yb1-f198.google.com with SMTP id
 w5-20020a253005000000b00aedd4305ff2so20315008ybw.13
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679506636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nI5uf5AdPqs9Y7G8SRp+LbLM46YNAFZ/Cb0k/RcW5nw=;
 b=Wt+zuYE8BH5a0D9qFM6xfcuestgJRngNtv5mCIAu4F500N8ULhT/bjBhxxgTUVoBS9
 dx2iLo37dtBmmra8ppkPrTFU7e72Z64wNUa6nAlZA9lWjUL2w6nejKGttyS/mHE7EATB
 /lC/QW4pKX6o0ogB5SCSqYJcAbzFNJ478oCQO0jaDACv79W3b2MYVsM2JFbBVnxvNiTv
 /vrUtvVckYgiJpcmgEQUYvnqLXFm0ZL4pKHPZTfRu2W9N0Uw4QQA4bTZF8MK4gLQSRsQ
 UDNia71ZToH4vtXgD4FackWXQ8nKguPCO7NjN9+nl2/eyhEoytgDaEgdwo+vk49P8qqs
 H7rw==
X-Gm-Message-State: AAQBX9ePy4QGOOX8xK9HY+OyKkAdDDuUIxfetUykawLQDHcadu+rajWS
 zdNICVEqGRUz2cQdXOlOfuREAYtkCgPyfPtii0uXJDymiwgdTiKCgbMBwIcH4L2pMh/h8bLtUaQ
 V+0Fa1dRumJq6zdi5aWE51iSqA+SEsA0=
X-Received: by 2002:a05:6902:150c:b0:a48:6236:1be4 with SMTP id
 q12-20020a056902150c00b00a4862361be4mr429848ybu.2.1679506636074; 
 Wed, 22 Mar 2023 10:37:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1N0Lz6VIQy3wXuizgJrDoxoup4lCCQU8xLzmt/41t1dfYoeQs2S6Na69P9+aBCyemq8t0b77kUZhrsWjOOSg=
X-Received: by 2002:a05:6902:150c:b0:a48:6236:1be4 with SMTP id
 q12-20020a056902150c00b00a4862361be4mr429829ybu.2.1679506635793; Wed, 22 Mar
 2023 10:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-3-eperezma@redhat.com>
 <20230322142445.cocojplrzn5gtlfw@sgarzare-redhat>
In-Reply-To: <20230322142445.cocojplrzn5gtlfw@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Mar 2023 18:36:39 +0100
Message-ID: <CAJaqyWdLcCDYfmgGHkSVaBWX5WAX=WEpA5QAec2CnGQr=J4c8Q@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.1 2/6] vdpa: add vhost_vdpa_reset_status_fd
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com, 
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 si-wei.liu@oracle.com, longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 3:24=E2=80=AFPM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Fri, Mar 17, 2023 at 03:55:38PM +0100, Eugenio P=C3=A9rez wrote:
> >This allows to reset a vhost-vdpa device from external subsystems like
> >vhost-net.  It is used in subsequent patches to negotiate features and
> >probe for CVQ ASID isolation.
> >
> >Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >---
> > include/hw/virtio/vhost-vdpa.h |  1 +
> > hw/virtio/vhost-vdpa.c         | 58 +++++++++++++++++++++++-----------
> > 2 files changed, 41 insertions(+), 18 deletions(-)
> >
> >diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vd=
pa.h
> >index c278a2a8de..28de7da91e 100644
> >--- a/include/hw/virtio/vhost-vdpa.h
> >+++ b/include/hw/virtio/vhost-vdpa.h
> >@@ -54,6 +54,7 @@ typedef struct vhost_vdpa {
> >     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > } VhostVDPA;
> >
> >+void vhost_vdpa_reset_status_fd(int fd);
> > int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iov=
a_range);
> >
> > int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova=
,
> >diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >index bbabea18f3..7a2053b8d9 100644
> >--- a/hw/virtio/vhost-vdpa.c
> >+++ b/hw/virtio/vhost-vdpa.c
> >@@ -335,38 +335,45 @@ static const MemoryListener vhost_vdpa_memory_list=
ener =3D {
> >     .region_del =3D vhost_vdpa_listener_region_del,
> > };
> >
> >-static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int req=
uest,
> >-                             void *arg)
> >+static int vhost_vdpa_dev_fd(const struct vhost_dev *dev)
>
> What is the purpose of this refactoring?
> I guess, since vhost_net does not have `struct vhost_dev *` we want to
> use fd directly?
>

Right.

> It might be better to split this patch into two.
>

Do you mean to create vhost_vdpa_dev_fd first and then users?

> > {
> >     struct vhost_vdpa *v =3D dev->opaque;
> >-    int fd =3D v->device_fd;
> >-    int ret;
> >
> >     assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA)=
;
> >+    return v->device_fd;
> >+}
> >+
> >+static int vhost_vdpa_call_fd(int fd, unsigned long int request, void *=
arg)
> >+{
> >+    int ret =3D ioctl(fd, request, arg);
> >
> >-    ret =3D ioctl(fd, request, arg);
> >     return ret < 0 ? -errno : ret;
> > }
> >
> >-static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
> >+static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int req=
uest,
> >+                           void *arg)
> >+{
> >+    return vhost_vdpa_call_fd(vhost_vdpa_dev_fd(dev), request, arg);
> >+}
> >+
> >+static int vhost_vdpa_add_status_fd(int fd, uint8_t status)
> > {
> >     uint8_t s;
> >     int ret;
> >
> >-    trace_vhost_vdpa_add_status(dev, status);
> >-    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
> >+    ret =3D vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
> >     if (ret < 0) {
> >         return ret;
> >     }
> >
> >     s |=3D status;
> >
> >-    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> >+    ret =3D vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &s);
> >     if (ret < 0) {
> >         return ret;
> >     }
> >
> >-    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
> >+    ret =3D vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
> >     if (ret < 0) {
> >         return ret;
> >     }
> >@@ -378,6 +385,12 @@ static int vhost_vdpa_add_status(struct vhost_dev *=
dev, uint8_t status)
> >     return 0;
> > }
> >
> >+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
> >+{
> >+    trace_vhost_vdpa_add_status(dev, status);
> >+    return vhost_vdpa_add_status_fd(vhost_vdpa_dev_fd(dev), status);
> >+}
> >+
> > int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iov=
a_range)
> > {
> >     int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> >@@ -709,16 +722,20 @@ static int vhost_vdpa_get_device_id(struct vhost_d=
ev *dev,
> >     return ret;
> > }
> >
> >+static int vhost_vdpa_reset_device_fd(int fd)
> >+{
> >+    uint8_t status =3D 0;
> >+
> >+    return vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &status);
> >+}
> >+
> > static int vhost_vdpa_reset_device(struct vhost_dev *dev)
> > {
> >     struct vhost_vdpa *v =3D dev->opaque;
> >-    int ret;
> >-    uint8_t status =3D 0;
> >
> >-    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> >-    trace_vhost_vdpa_reset_device(dev);
> >     v->suspended =3D false;
>
> I think it is pre-existing, but if VHOST_VDPA_SET_STATUS fails,
> should we set anyway `v->suspended =3D false`?
>

It's a good question. I think the most correct is to keep as the
previous value, but I'm not sure if reset is actually allowed to fail.

Thanks!


