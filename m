Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA53E0E2D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 08:17:54 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBWhV-0002nq-Nm
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 02:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBWgI-0001KW-Kt
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 02:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBWgF-0008KN-Pe
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 02:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628144194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsxYXpGYaE153Pgbsv0gIuB/j9TvOd9WnJ6ZdYbZIYg=;
 b=b3AYQaYqvbnyKO0P7EvJtvuGQ2tT/hSONJw+ke+TzqtRlrEbQRabkfyzweFP5llO9RTnLY
 03EMjD5/0hkQSIWLrrplUi0qwkcOkBSWp3HnuNLqjq9R9Xd3zJqRh1W8f+CJo1XE86yiOY
 k5OvIqOSlCAAvlhg9CPE2s1yp3aPOuw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-IrnqLubTOh6mGA1nCGcUjw-1; Thu, 05 Aug 2021 02:16:33 -0400
X-MC-Unique: IrnqLubTOh6mGA1nCGcUjw-1
Received: by mail-lf1-f70.google.com with SMTP id
 o11-20020a05651205cbb02903b95fe85eefso2148898lfo.23
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 23:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bsxYXpGYaE153Pgbsv0gIuB/j9TvOd9WnJ6ZdYbZIYg=;
 b=SZP8Ao6tyOmOjyYgOfEq6UyAH/DH31Q65T7/oATB8m705CfPJB4dmB2SreFwJhzAfB
 Z1wm57GRKxgmqI97u87Nphi0Izuur9ZP8128Fi2Ee7S0M2prHyugRxUCeDXbZGI4l7PO
 K952r6y6DPPkYJ+0M2fh7W0zzRRuCgdfzAIBvY1gaRGOrZ2QKC3j+mRQ8iJOJxSVqrTd
 b+UmEbFPiaVrsqUwn3DWPyGGhXCy0BC4icFCcSRCj2Ua4pkhAJnJ1tyr38D0jzbj2AMj
 sVZ4dImo9lHHBE4zRLcqxDt/mfKnjzaj4kLUIeUBXG1dNnpej1AyiXF94c2gFRl59tYa
 F4mA==
X-Gm-Message-State: AOAM531CZZpZ9PH5ZTGtujssqo6u+I0XGbWiYMxb9zm90FzpkRKv400p
 i4Liy6q1K009FmvUlHPbJSQa1BBjxs557RqjMkQCtmxW0oxBaMTzZGxirdClSk2NhEBVGdpraC5
 ZSXImmQUDatRNBOkAupojxZW6oZ8apcQ=
X-Received: by 2002:a19:7103:: with SMTP id m3mr2529546lfc.5.1628144192035;
 Wed, 04 Aug 2021 23:16:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb5JOpNdmGLuF2VjMesPgUtnjLX/nbWraO7M4fxfdQsfKaCbC9oh8riy+AwCz3ORvMOm5TD9HNBAMGAwbBKh8=
X-Received: by 2002:a19:7103:: with SMTP id m3mr2529518lfc.5.1628144191770;
 Wed, 04 Aug 2021 23:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210804144402.711594-1-eperezma@redhat.com>
In-Reply-To: <20210804144402.711594-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 5 Aug 2021 14:16:20 +0800
Message-ID: <CACGkMEuW166WvHeB63aoTvYinqK4u_8hDBFHtUXoexWkQy8PpA@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost-vdpa: Do not send empty IOTLB update batches
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 4, 2021 at 10:44 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> With the introduction of the batch hinting, meaningless batches can be
> created with no IOTLB updates if the memory region was skipped by
> vhost_vdpa_listener_skipped_section. This is the case of host notifiers
> memory regions, but others could fall on this category. This caused the
> vdpa device to receive dma mapping settings with no changes, a possibly
> expensive operation for nothing.
>
> To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
> meaningful (not skipped section) mapping or unmapping operation, and
> VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> _INVALIDATE has been issued.

Hi Eugeni:

This should work but it looks to me it's better to optimize the kernel.

E.g to make sure we don't send set_map() if there is no real updating
between batch start and end.

This makes sure that it can work for all kinds of userspace (not only for Q=
emu).

Another optimization is to batch the memory region transaction by adding:

memory_region_transaction_begin() and memory_region_transaction_end() in

both vhost_vdpa_host_notifiers_init() and vhost_vdpa_host_notifiers_uninit(=
).

This can make sure only at least one memory transactions when
adding/removing host notifier regions.

Thanks

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  1 +
>  hw/virtio/vhost-vdpa.c         | 38 +++++++++++++++++++++++-----------
>  2 files changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index e98e327f12..0a7edbe4eb 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
>      int device_fd;
>      int index;
>      uint32_t msg_type;
> +    size_t n_iotlb_sent_batch;
>      MemoryListener listener;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 6ce94a1f4d..2517fc6103 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v,=
 hwaddr iova,
>      return ret;
>  }
>
> -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>  {
> -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
> -    struct vhost_dev *dev =3D v->dev;
> -    struct vhost_msg_v2 msg =3D {};
>      int fd =3D v->device_fd;
> -
> -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
> -        return;
> -    }
> -
> -    msg.type =3D v->msg_type;
> -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> +    struct vhost_msg_v2 msg =3D {
> +        .type =3D v->msg_type,
> +        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> +    };
>
>      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
>          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> @@ -120,6 +114,11 @@ static void vhost_vdpa_listener_commit(MemoryListene=
r *listener)
>          return;
>      }
>
> +    if (v->n_iotlb_sent_batch =3D=3D 0) {
> +        return;
> +    }
> +
> +    v->n_iotlb_sent_batch =3D 0;
>      msg.type =3D v->msg_type;
>      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
>
> @@ -170,6 +169,14 @@ static void vhost_vdpa_listener_region_add(MemoryLis=
tener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)) {
> +        if (v->n_iotlb_sent_batch =3D=3D 0) {
> +            vhost_vdpa_listener_begin_batch(v);
> +        }
> +
> +        v->n_iotlb_sent_batch++;
> +    }
> +
>      ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>                               vaddr, section->readonly);
>      if (ret) {
> @@ -221,6 +228,14 @@ static void vhost_vdpa_listener_region_del(MemoryLis=
tener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)) {
> +        if (v->n_iotlb_sent_batch =3D=3D 0) {
> +            vhost_vdpa_listener_begin_batch(v);
> +        }
> +
> +        v->n_iotlb_sent_batch++;
> +    }
> +
>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>      if (ret) {
>          error_report("vhost_vdpa dma unmap error!");
> @@ -234,7 +249,6 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>   * depends on the addnop().
>   */
>  static const MemoryListener vhost_vdpa_memory_listener =3D {
> -    .begin =3D vhost_vdpa_listener_begin,
>      .commit =3D vhost_vdpa_listener_commit,
>      .region_add =3D vhost_vdpa_listener_region_add,
>      .region_del =3D vhost_vdpa_listener_region_del,
> --
> 2.27.0
>


