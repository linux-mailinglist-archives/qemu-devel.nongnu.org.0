Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA03F6E8089
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:44:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBpq-0001dQ-SA; Wed, 19 Apr 2023 13:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppBpp-0001d4-II
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppBpn-0000D5-8x
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681926190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3NLXIapcX2DiH0Z9L3myFepyZx9uv04nqZKkADTd4s=;
 b=hpd2BUvE/v0VvXyGUAOUFOBYaErua5rYqRj+auehDfWbDB4FWhs4EwalxkScKJzjLJyUp6
 u5s5DHfBZpuW8FeSl5zDPUCCKa7ixCX98woSaFan5vxLiqjBzZ1XUQtNJYp766hJ+xpYWy
 5Jsc1wsKZmQlYuiNUqUIgc5bCHYJDqk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-fwlhFDv_Ng2JYmQu1Eep0Q-1; Wed, 19 Apr 2023 13:43:09 -0400
X-MC-Unique: fwlhFDv_Ng2JYmQu1Eep0Q-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-552cb2211bdso4824807b3.6
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 10:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681926188; x=1684518188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3NLXIapcX2DiH0Z9L3myFepyZx9uv04nqZKkADTd4s=;
 b=I70R6x59+Ao+FrQ/kyLWyeRQXwFG7y0xqLN1FC+5hRMlf3ucTDxlhEL85hLIrHNvOG
 F0rHkCSZwFs2Gjs/EyM6pXXX9MnQwD5x57UebVbmsUpSuJYbDmnZFBsLsfI5E+lPkd/K
 ohZX/CiCuqvpTqmFtJtcPFay4YdLqa0RMsomOvmyJatN0uZ7fhSBx8/9BUdDXgRod1KW
 vRWOr/EV0le8b8AsVfVLUAXV6boLc4zeDCGo4/nQciliHGUogT3mhCh0IzyQjQui3fvI
 0UBCuREXadQLaYihaFGtV3jCl293fiUKrOnD2NMVsCtCeBfk1eAfYuRRv1You6cw2uXp
 EdTw==
X-Gm-Message-State: AAQBX9eCrf+njcVWsRDZgVARbSafYxpdc8+pQO/rWiqr5AVbV+jIlQEk
 Yt1XsabGPK5H5VaHJU35UUtXdQKJzVDtl7jItM/qdvuLuMfPahb9Z9TRDmRSjVGReDdAcSxPI1f
 vnOZFwTDqeskJJjEfAbzhCDalGldBqoA=
X-Received: by 2002:a05:6902:1106:b0:b8f:593b:9746 with SMTP id
 o6-20020a056902110600b00b8f593b9746mr702062ybu.52.1681926188432; 
 Wed, 19 Apr 2023 10:43:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350bplnKA/2YAErXKq9cxe/Eh3sAHTgo4akj5jcgwiJ5fGNISSpIL1N3Vkj/y/O55Ccsd/SIiXHJUQQ5LumeigCw=
X-Received: by 2002:a05:6902:1106:b0:b8f:593b:9746 with SMTP id
 o6-20020a056902110600b00b8f593b9746mr702038ybu.52.1681926188160; Wed, 19 Apr
 2023 10:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681732982.git.yin31149@gmail.com>
 <3bd9b7f8a7dc2c9b68679139623308e184a6de85.1681732982.git.yin31149@gmail.com>
In-Reply-To: <3bd9b7f8a7dc2c9b68679139623308e184a6de85.1681732982.git.yin31149@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Apr 2023 19:42:31 +0200
Message-ID: <CAJaqyWeTrx7cPALh_jweh9r0Yi5TU9oqpuvZk-BmtHUyYq1xJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdpa: send CVQ state load commands in parallel
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: jasowang@redhat.com, 18801353760@163.com, qemu-devel@nongnu.org
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 19, 2023 at 1:50=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.com>=
 wrote:
>
> This patch introduces the vhost_vdpa_net_cvq_add() and
> refactors the vhost_vdpa_net_load*(), so that QEMU can
> send CVQ state load commands in parallel.
>
> To be more specific, this patch introduces vhost_vdpa_net_cvq_add()
> to add SVQ control commands to SVQ and kick the device,
> but does not poll the device used buffers. QEMU will not
> poll and check the device used buffers in vhost_vdpa_net_load()
> until all CVQ state load commands have been sent to the device.
>
> What's more, in order to avoid buffer overwriting caused by
> using `svq->cvq_cmd_out_buffer` and `svq->status` as the
> buffer for all CVQ state load commands when sending
> CVQ state load commands in parallel, this patch introduces
> `out_cursor` and `in_cursor` in vhost_vdpa_net_load(),
> pointing to the available buffer for in descriptor and
> out descriptor, so that different CVQ state load commands can
> use their unique buffer.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1578
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---
>  net/vhost-vdpa.c | 137 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 102 insertions(+), 35 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 10804c7200..d1f7113992 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -590,6 +590,44 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *=
nc)
>      vhost_vdpa_net_client_stop(nc);
>  }
>
> +/**
> + * vhost_vdpa_net_cvq_add() adds SVQ control commands to SVQ,
> + * kicks the device but does not poll the device used buffers.
> + *
> + * Return the length of the device used buffers.
> + */
> +static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s,
> +                                void **out_cursor, size_t out_len,
> +                                void **in_cursor, size_t in_len)
> +{
> +    /* Buffers for the device */
> +    const struct iovec out =3D {
> +        .iov_base =3D *out_cursor,
> +        .iov_len =3D out_len,
> +    };
> +    const struct iovec in =3D {
> +        .iov_base =3D *in_cursor,
> +        .iov_len =3D in_len,
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
> +    /* Update the cursor */
> +    *out_cursor +=3D out_len;
> +    *in_cursor +=3D in_len;
> +
> +    return in_len;
> +}
> +
>  /**
>   * vhost_vdpa_net_cvq_add_and_wait() adds SVQ control commands to SVQ,
>   * kicks the device and polls the device used buffers.
> @@ -628,69 +666,64 @@ static ssize_t vhost_vdpa_net_cvq_add_and_wait(Vhos=
tVDPAState *s,
>      return vhost_svq_poll(svq);
>  }
>
> -static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s, uint8_t class,
> -                                       uint8_t cmd, const void *data,
> -                                       size_t data_size)
> +static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s,
> +                                void **out_cursor, uint8_t class, uint8_=
t cmd,
> +                                const void *data, size_t data_size,
> +                                void **in_cursor)
>  {
>      const struct virtio_net_ctrl_hdr ctrl =3D {
>          .class =3D class,
>          .cmd =3D cmd,
>      };
>
> -    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl))=
;
> +    assert(sizeof(ctrl) < vhost_vdpa_net_cvq_cmd_page_len() -
> +                          (*out_cursor - s->cvq_cmd_out_buffer));
> +    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl) =
-
> +                       (*out_cursor - s->cvq_cmd_out_buffer));
>
> -    memcpy(s->cvq_cmd_out_buffer, &ctrl, sizeof(ctrl));
> -    memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
> +    memcpy(*out_cursor, &ctrl, sizeof(ctrl));
> +    memcpy(*out_cursor + sizeof(ctrl), data, data_size);
>
> -    return vhost_vdpa_net_cvq_add_and_wait(s, sizeof(ctrl) + data_size,
> -                                  sizeof(virtio_net_ctrl_ack));
> +    return vhost_vdpa_net_cvq_add(s, out_cursor, sizeof(ctrl) + data_siz=
e,
> +                                  in_cursor, sizeof(virtio_net_ctrl_ack)=
);
>  }
>
> -static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n=
)
> +static ssize_t vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONe=
t *n,
> +                                   void **out_cursor, void **in_cursor)
>  {
>      uint64_t features =3D n->parent_obj.guest_features;
>      if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> -        ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CT=
RL_MAC,
> -                                                  VIRTIO_NET_CTRL_MAC_AD=
DR_SET,
> -                                                  n->mac, sizeof(n->mac)=
);
> -        if (unlikely(dev_written < 0)) {
> -            return dev_written;
> -        }
> -
> -        return *s->status !=3D VIRTIO_NET_OK;
> +        return vhost_vdpa_net_load_cmd(s, out_cursor, VIRTIO_NET_CTRL_MA=
C,
> +                                       VIRTIO_NET_CTRL_MAC_ADDR_SET,
> +                                       n->mac, sizeof(n->mac), in_cursor=
);
>      }
>
>      return 0;
>  }
>
> -static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> -                                  const VirtIONet *n)
> +static ssize_t vhost_vdpa_net_load_mq(VhostVDPAState *s, const VirtIONet=
 *n,
> +                                  void **out_cursor, void **in_cursor)
>  {
>      struct virtio_net_ctrl_mq mq;
>      uint64_t features =3D n->parent_obj.guest_features;
> -    ssize_t dev_written;
>
>      if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
>          return 0;
>      }
>
> -    mq.virtqueue_pairs =3D cpu_to_le16(n->curr_queue_pairs);

So where is mq filled now?

> -    dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MQ,
> -                                          VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SE=
T, &mq,
> -                                          sizeof(mq));
> -    if (unlikely(dev_written < 0)) {
> -        return dev_written;
> -    }
> -
> -    return *s->status !=3D VIRTIO_NET_OK;
> +    return vhost_vdpa_net_load_cmd(s, out_cursor, VIRTIO_NET_CTRL_MQ,
> +                                   VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> +                                   &mq, sizeof(mq), in_cursor);
>  }
>
>  static int vhost_vdpa_net_load(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    VhostShadowVirtqueue *svq;
> +    void *out_cursor, *in_cursor;
>      struct vhost_vdpa *v =3D &s->vhost_vdpa;
>      const VirtIONet *n;
> -    int r;
> +    ssize_t need_poll_len =3D 0, r, dev_written;
>
>      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>
> @@ -699,16 +732,50 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>      }
>
>      n =3D VIRTIO_NET(v->dev->vdev);
> -    r =3D vhost_vdpa_net_load_mac(s, n);
> +

Extra newline.

> +    need_poll_len =3D 0;

Maybe we can call it "cmds_in_flight" or something similar? It is not a len=
gth.

> +    out_cursor =3D s->cvq_cmd_out_buffer;
> +    in_cursor =3D s->status;
> +
> +    r =3D vhost_vdpa_net_load_mac(s, n, &out_cursor, &in_cursor);
>      if (unlikely(r < 0)) {
> -        return r;
> +        goto load_err;
> +    }
> +    need_poll_len +=3D r;
> +
> +    r =3D vhost_vdpa_net_load_mq(s, n, &out_cursor, &in_cursor);
> +    if (unlikely(r < 0)) {
> +        goto load_err;
> +    }
> +    need_poll_len +=3D r;
> +
> +load_err:
> +    /* Poll for all SVQ control commands used buffer from device */
> +    svq =3D g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
> +    while (need_poll_len > 0) {
> +        /*
> +         * We can poll here since we've had BQL from the time we sent th=
e
> +         * descriptor. Also, we need to take the answer before SVQ pulls
> +         * by itself, when BQL is released
> +         */
> +        dev_written =3D vhost_svq_poll(svq);

If vhost_svq_poll returns 0 we must return an error from this code.
Otherwise this will be an infinite loop.

> +        need_poll_len -=3D dev_written;

On the other hand, vhost_svq_poll returns 1 because that is the length
written in the "in" buffer, but it is not obvious here. It is more
clear if we just do need_poll_len-- here.

>      }
> -    r =3D vhost_vdpa_net_load_mq(s, n);
> -    if (unlikely(r)) {
> +
> +    /* If code comes from `load_err` label, then we should return direct=
ly */
> +    if (unlikely(r < 0)) {

If this function returns a failure we can avoid the sending of the
queued commands, as the caller must cancel the start of the device
anyway. We can return directly from the failure in
vhost_vdpa_net_load_* and avoid the label.

>          return r;
>      }
>
> -    return 0;
> +    /* Check the used buffer from device */
> +    for (virtio_net_ctrl_ack * status =3D s->status; (void *)status < in=
_cursor;

in_cursor can be a virtio_net_ctrl_ack so we don't need the casting here.

> +         ++status) {
> +        if (*status !=3D VIRTIO_NET_OK) {
> +            ++r;
> +        }
> +    }
> +
> +    return r;

Although the caller is fine with >=3D0, I think we should keep the 0 =3D=3D
success. The number of commands delivered does not make a lot of sense
for the callers, just if the call succeeded or not.

Thanks!

>  }
>
>  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> --
> 2.25.1
>


