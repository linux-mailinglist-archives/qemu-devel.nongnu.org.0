Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463358D44C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:14:02 +0200 (CEST)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJRB-0002qd-GN
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJP8-0001Rp-Ik
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJP5-0004oZ-Gg
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660029109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAKbY3D2VTFe71K4fXk/4MnirNlNg4K4NjCCGUA8dzg=;
 b=Bo4I7fWPf8KGi/fXiRwDuT/WbpVPpjeJ6zsGhMslYVCfOdiOKMrTtaRuoclz1OAGtVMMYJ
 Q4065734NvQGJ9zb0JViqELoIRkJN55j/c2e97mFuADbEutR4iyDAEoMTuQtfaEO8Q15kn
 IJZ43A6yPv9elZabJ+AgqNOpCaL3tP4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-6VpD6cQuMJGzy0UHACxlxA-1; Tue, 09 Aug 2022 03:11:48 -0400
X-MC-Unique: 6VpD6cQuMJGzy0UHACxlxA-1
Received: by mail-lj1-f200.google.com with SMTP id
 s8-20020a2e9c08000000b0025e5c453a63so3179507lji.21
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RAKbY3D2VTFe71K4fXk/4MnirNlNg4K4NjCCGUA8dzg=;
 b=SEHhYatXmeF+nu1EyqwMZnpuGVfaOI0odT102o7Fj7v0stwpLR6E7bIa+EYQ4pFiTo
 v1J1PjpE3yOjueY/9EO4cG9PhpKgPsyJXIxMGTa45iVuOSZcoafNhxs1c0eI76psMzHQ
 DZQx5xIHOcObpT0MGx673MKJ27lqc3xF7JZAm9VWf7vDoLJwMiU8jzP4vMO2MChRpPFu
 8Sd3dFbVfxmc/cLISUgxTUaHeW8tIXMoPbmSae93nwYwqyPc1yL+vGSZqMDJn71uTbZQ
 aTMisW/PHf6IjOPmZEYkYcz+RBjzmWEz0O3Kwtua4CKjYdxpwdh9PfnqbKsvvjh9v7yi
 S/rw==
X-Gm-Message-State: ACgBeo1V9amKCevuOGowXX6p4LKcUCj5VkRB0JhY/x0LUoXpIONQZoyl
 nPk/4CcM9mlovR4nkPLtZRCGrzg5XhD48iBxd+KO5REz6wWVk0unsx24BO7jIy9KKjDmAGE8UxI
 XYonjPLoIV7NGT6nWn3Y7xGgKkcQxwG0=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr7251640ljk.243.1660029107088; 
 Tue, 09 Aug 2022 00:11:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IQndtgoQuGisdVOEP32y/2QgL6EQdgMw7CvxC4/Jek9AaGXKU/4wbyORfj0lOv5nn/em8wRJiWTAyTHsz0xE=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr7251616ljk.243.1660029106745; Tue, 09
 Aug 2022 00:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-10-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 15:11:35 +0800
Message-ID: <CACGkMEsFLofMXwnvroGJeWrPa+3zfwv7QQmNNS0Gwayjrs==vQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] vdpa: Extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> So we can reuse it to inject state messages.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> --
> v7:
> * Remove double free error
>
> v6:
> * Do not assume in buffer sent to the device is sizeof(virtio_net_ctrl_ac=
k)
>
> v5:
> * Do not use an artificial !NULL VirtQueueElement
> * Use only out size instead of iovec dev_buffers for these functions.
> ---
>  net/vhost-vdpa.c | 59 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2c6a26cca0..10843e6d97 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -331,6 +331,38 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *=
nc)
>      }
>  }
>
> +static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
> +                                      size_t in_len)
> +{
> +    /* Buffers for the device */
> +    const struct iovec out =3D {
> +        .iov_base =3D s->cvq_cmd_out_buffer,
> +        .iov_len =3D out_len,
> +    };
> +    const struct iovec in =3D {
> +        .iov_base =3D s->cvq_cmd_in_buffer,
> +        .iov_len =3D sizeof(virtio_net_ctrl_ack),
> +    };
> +    VhostShadowVirtqueue *svq =3D g_ptr_array_index(s->vhost_vdpa.shadow=
_vqs, 0);
> +    int r;
> +
> +    r =3D vhost_svq_add(svq, &out, 1, &in, 1, NULL);
> +    if (unlikely(r !=3D 0)) {
> +        if (unlikely(r =3D=3D -ENOSPC)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue=
\n",
> +                          __func__);
> +        }
> +        return r;
> +    }
> +
> +    /*
> +     * We can poll here since we've had BQL from the time we sent the
> +     * descriptor. Also, we need to take the answer before SVQ pulls by =
itself,
> +     * when BQL is released
> +     */
> +    return vhost_svq_poll(svq);
> +}
> +
>  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
>      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>      .size =3D sizeof(VhostVDPAState),
> @@ -387,23 +419,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSh=
adowVirtqueue *svq,
>                                              void *opaque)
>  {
>      VhostVDPAState *s =3D opaque;
> -    size_t in_len, dev_written;
> +    size_t in_len;
>      virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
>      /* Out buffer sent to both the vdpa device and the device model */
>      struct iovec out =3D {
>          .iov_base =3D s->cvq_cmd_out_buffer,
>      };
> -    /* In buffer sent to the device */
> -    const struct iovec dev_in =3D {
> -        .iov_base =3D s->cvq_cmd_in_buffer,
> -        .iov_len =3D sizeof(virtio_net_ctrl_ack),
> -    };
>      /* in buffer used for device model */
>      const struct iovec in =3D {
>          .iov_base =3D &status,
>          .iov_len =3D sizeof(status),
>      };
> -    int r =3D -EINVAL;
> +    ssize_t dev_written =3D -EINVAL;
>      bool ok;
>
>      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> @@ -414,21 +441,11 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSh=
adowVirtqueue *svq,
>          goto out;
>      }
>
> -    r =3D vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
> -    if (unlikely(r !=3D 0)) {
> -        if (unlikely(r =3D=3D -ENOSPC)) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue=
\n",
> -                          __func__);
> -        }
> +    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status=
));
> +    if (unlikely(dev_written < 0)) {
>          goto out;
>      }
>
> -    /*
> -     * We can poll here since we've had BQL from the time we sent the
> -     * descriptor. Also, we need to take the answer before SVQ pulls by =
itself,
> -     * when BQL is released
> -     */
> -    dev_written =3D vhost_svq_poll(svq);
>      if (unlikely(dev_written < sizeof(status))) {
>          error_report("Insufficient written data (%zu)", dev_written);
>          goto out;
> @@ -436,7 +453,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShad=
owVirtqueue *svq,
>
>      memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
>      if (status !=3D VIRTIO_NET_OK) {
> -        goto out;
> +        return VIRTIO_NET_ERR;
>      }
>
>      status =3D VIRTIO_NET_ERR;
> @@ -453,7 +470,7 @@ out:
>      }
>      vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
>      g_free(elem);
> -    return r;
> +    return dev_written < 0 ? dev_written : 0;
>  }
>
>  static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> --
> 2.31.1
>


