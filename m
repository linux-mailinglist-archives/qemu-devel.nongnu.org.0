Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E56E20AA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 12:25:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnGaW-0004AZ-EZ; Fri, 14 Apr 2023 06:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pnGaT-0004AP-RI
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 06:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pnGaA-0002GW-Ov
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 06:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681467785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRzrGZ2CjxkrcieU0FjCJl7gDlznc/3UnmA41OVjTBk=;
 b=its7sRYDYxu6hVOcEnKeen+BfmBx4ZHc1jxaRZi5A0MN+GrEai7lRgyTbOjtJ5MgyGGRCz
 D3zbDNXMq/lSzk+8NAVS0/GyRG095/rd7Q63+3eePfj1DKY0bOgXUkQ+JK/YUBxJtTqWWS
 hvsTllde3yVjBXL219feocuQqgkg/D0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-CiC6KqqIN_KRL7pdpJzsLg-1; Fri, 14 Apr 2023 06:23:03 -0400
X-MC-Unique: CiC6KqqIN_KRL7pdpJzsLg-1
Received: by mail-yb1-f198.google.com with SMTP id
 c193-20020a25c0ca000000b00b868826cdfeso36837619ybf.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 03:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681467783; x=1684059783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRzrGZ2CjxkrcieU0FjCJl7gDlznc/3UnmA41OVjTBk=;
 b=KdgpbWaPXBOcnF25wobWUkcXX+L0ol+1qgM4E4DOCF8xTekM3QWXzS9vUlBPfWn+SM
 BshTZwy8FdH8XDyHzhbyzbEe/4OQgQ9n0PEkzmYZfjNIX77pgz9rEDfbksKujj+3+Vrk
 4aloB7/q5mM03/tmSK6OQx3C28C8R9X+V7MwVFDixbP9kitPgV3q3zkgZtSCrct2QgDM
 bnJtKasQNF/IRM+yTAEg8CUCd4mWiwjLCIu46pKWpec4rYeasu6gXNkmaKAgtK+Dp7B3
 FB8ZChbq4cJIsvRwAONk3cXZcme6qCiK4ktWTgLmSr9o+jCUX/U4fXukm52eQJzHYEh6
 9ZAw==
X-Gm-Message-State: AAQBX9fGV9W0DHjeXdUXzk879LpSLFyPCVzWy9KHlupCwSC+C10tF1SA
 ikjYNsUzZXcfZwefAyDPxKcXwuijUn21nQ7vYONZXGdDY5D0L0y+/JnuoLniKYiYOvgQY1JJMgn
 qOUhQJ2uGFHbZIWok/tAnT0n/gGf/pew=
X-Received: by 2002:a81:b722:0:b0:541:7266:3fd7 with SMTP id
 v34-20020a81b722000000b0054172663fd7mr3280909ywh.3.1681467782841; 
 Fri, 14 Apr 2023 03:23:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwMx7bA+CFLCQBS5DwWKvxGjWrefjS+9S3SYm9sOdZkP/TKZfr1n7BtvS1d2OwA1dOMBgqFCGbm0fuR9clQ2c=
X-Received: by 2002:a81:b722:0:b0:541:7266:3fd7 with SMTP id
 v34-20020a81b722000000b0054172663fd7mr3280899ywh.3.1681467782525; Fri, 14 Apr
 2023 03:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230414025721.10219-1-ray90514@gmail.com>
In-Reply-To: <20230414025721.10219-1-ray90514@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 14 Apr 2023 12:22:26 +0200
Message-ID: <CAJaqyWcQb=QgNo4Y7_-TD_nCqu8vU+ZqXbq_eoyQuBsEGZMQhA@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost-vdpa: cache Virtio states
To: Shao-Chien Chiang <ray90514@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Apr 14, 2023 at 9:26=E2=80=AFAM Shao-Chien Chiang <ray90514@gmail.c=
om> wrote:
>
> Repetitive ioctls makes vdpa devices initialization and startup slow.
> This patch is to cache Virtio status, features, and config.
> Testing with vdpa-sim-net as my vdpa device, the numbers of ioctl is
> reduced from 47 to 37.
>

Hi Shao-Chien,

To know the latency reduction would make it easier to evaluate them. I
think it would be enough with printing the timestamp from the first
access to the last one in the initialization.

Also, could you split the series in two, one caching the config
accesses and other one caching the status one? That would ease the
review process and the evaluation of their inclusion based on the
profiling.

Finally this needs to take into account the configure interrupt. You
can see qemu commit range
ee3b8dc6cc496ba7f4e27aed4493275c706a7942..1680542862edd963e6380dd4121a5e85d=
f55581f
for more information.

I think we can go two ways:
* Config interrupt invalidates the cached config, so we set it to NULL here=
.
* We don't cache config as long as vdpa config interrupt is enabled.

More minor comments inline.

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1579
>
> Signed-off-by: Shao-Chien Chiang <ray90514@gmail.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 44 +++++++++++++++++++++++-----------
>  include/hw/virtio/vhost-vdpa.h |  3 +++
>  2 files changed, 33 insertions(+), 14 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bc6bad23d5..1fccd151cf 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -343,21 +343,17 @@ static int vhost_vdpa_call(struct vhost_dev *dev, u=
nsigned long int request,
>      int ret;
>
>      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA);
> -

Please leave out this line deletion. If you think it is needed we can
address it in another series.

>      ret =3D ioctl(fd, request, arg);
>      return ret < 0 ? -errno : ret;
>  }
>
>  static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>  {
> -    uint8_t s;
> +    struct vhost_vdpa *v =3D dev->opaque;
> +    uint8_t s =3D v->status;
>      int ret;
>
>      trace_vhost_vdpa_add_status(dev, status);
> -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
> -    if (ret < 0) {
> -        return ret;
> -    }
>
>      s |=3D status;
>
> @@ -374,6 +370,7 @@ static int vhost_vdpa_add_status(struct vhost_dev *de=
v, uint8_t status)
>      if (!(s & status)) {
>          return -EIO;
>      }
> +    v->status =3D s;
>
>      return 0;
>  }
> @@ -436,8 +433,15 @@ static int vhost_vdpa_init(struct vhost_dev *dev, vo=
id *opaque, Error **errp)
>      dev->opaque =3D  opaque ;
>      v->listener =3D vhost_vdpa_memory_listener;
>      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> +    v->config =3D NULL;
> +    v->features =3D dev->features;
>      vhost_vdpa_init_svq(dev, v);
>
> +    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &v->status);
> +    if (ret) {
> +        return ret;
> +    }
> +

This first GET_STATUS is not needed, we can assume the first one is 0.

>      error_propagate(&dev->migration_blocker, v->migration_blocker);
>      if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
> @@ -456,6 +460,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, voi=
d *opaque, Error **errp)
>              return ret;
>          }
>          vhost_svq_valid_features(features, &dev->migration_blocker);
> +        v->features =3D features;
>      }
>
>      /*
> @@ -602,6 +607,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>      vhost_vdpa_svq_cleanup(dev);
>
>      dev->opaque =3D NULL;
> +    g_free(v->config);
>
>      return 0;
>  }
> @@ -718,6 +724,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *=
dev)
>      ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>      trace_vhost_vdpa_reset_device(dev, status);
>      v->suspended =3D false;
> +    v->status =3D 0;
>      return ret;
>  }
>
> @@ -767,6 +774,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *de=
v, const uint8_t *data,
>                                     uint32_t offset, uint32_t size,
>                                     uint32_t flags)
>  {
> +    struct vhost_vdpa *v =3D dev->opaque;
>      struct vhost_vdpa_config *config;
>      int ret;
>      unsigned long config_size =3D offsetof(struct vhost_vdpa_config, buf=
);
> @@ -776,6 +784,10 @@ static int vhost_vdpa_set_config(struct vhost_dev *d=
ev, const uint8_t *data,
>      config->off =3D offset;
>      config->len =3D size;
>      memcpy(config->buf, data, size);
> +    if (v->config !=3D NULL) {
> +        assert(size + offset <=3D v->config->len);

I think the guest is able to trigger this assertion, we should replace
either by the same error returned from the kernel or simply to make
the call to the kernel and let it solve the issue.

> +        memcpy(v->config->buf + offset, data, size);
> +    }
>      if (trace_event_get_state_backends(TRACE_VHOST_VDPA_SET_CONFIG) &&
>          trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
>          vhost_vdpa_dump_config(dev, data, size);
> @@ -788,17 +800,19 @@ static int vhost_vdpa_set_config(struct vhost_dev *=
dev, const uint8_t *data,
>  static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>                                     uint32_t config_len, Error **errp)
>  {
> -    struct vhost_vdpa_config *v_config;
> +    struct vhost_vdpa *v =3D dev->opaque;
>      unsigned long config_size =3D offsetof(struct vhost_vdpa_config, buf=
);
>      int ret;
>
>      trace_vhost_vdpa_get_config(dev, config, config_len);
> -    v_config =3D g_malloc(config_len + config_size);
> -    v_config->len =3D config_len;
> -    v_config->off =3D 0;
> -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
> -    memcpy(config, v_config->buf, config_len);
> -    g_free(v_config);
> +    if (v->config =3D=3D NULL) {
> +        v->config =3D g_malloc(config_len + config_size);
> +        v->config->len =3D config_len;
> +        v->config->off =3D 0;
> +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v->config);
> +    }
> +    assert(config_len <=3D v->config->len);

Same here, I think the guest is able to trigger this assertion.

Thanks!

> +    memcpy(config, v->config->buf, config_len);
>      if (trace_event_get_state_backends(TRACE_VHOST_VDPA_GET_CONFIG) &&
>          trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
>          vhost_vdpa_dump_config(dev, config, config_len);
> @@ -1294,8 +1308,10 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
dev *dev,
>  static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                       uint64_t *features)
>  {
> -    int ret =3D vhost_vdpa_get_dev_features(dev, features);
> +    struct vhost_vdpa *v =3D dev->opaque;
> +    int ret =3D 0;
>
> +    *features =3D v->features;
>      if (ret =3D=3D 0) {
>          /* Add SVQ logging capabilities */
>          *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index c278a2a8de..c1505a21ec 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -39,6 +39,9 @@ typedef struct vhost_vdpa {
>      MemoryListener listener;
>      struct vhost_vdpa_iova_range iova_range;
>      uint64_t acked_features;
> +    uint64_t features;
> +    uint8_t status;
> +    struct vhost_vdpa_config *config;
>      bool shadow_vqs_enabled;
>      /* Vdpa must send shadow addresses as IOTLB key for data queues, not=
 GPA */
>      bool shadow_data;
> --
> 2.25.1
>
>


