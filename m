Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54016E933B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppShY-0005R2-1J; Thu, 20 Apr 2023 07:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppSde-0008GS-37
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:39:51 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppSdP-0001du-Au
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:39:40 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so2315457e87.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681990725; x=1684582725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p00pGv6iDK0UclhIzxYB4nhbf+8eiAwe2DdPg3MURGA=;
 b=btKEv/nCJVCXERIC5lV3x0JbtwcPiUZ+DCFCe8b+m2RSCQ2teojhEFnw9Q/CEFhW0I
 WGvyXBax5EulMQr8WlVHwLiD2D0uLkXHMaogEn2BhpDY72cdwI8Gb8sHz+Sa+heyRek5
 M0NRqPPbzuipkhJkUBivA5LqT+PIR9i4y6V3UYi4IV7G8clxrjZMWeB0D4PcxBNT+A2v
 YOqpmnYZHtnHdfdAjWZ/KUPMf46fyoAF1h0LIk3jy6P+m8S0ClORfD/bLTqqnKRgitBG
 5OaVH5NtjIe3Zw3XqfvskBxlRoQ79Vtq78Qn8wpkgAWrsTpy+czM/R+zIx8F5m3wAfZJ
 0Afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681990725; x=1684582725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p00pGv6iDK0UclhIzxYB4nhbf+8eiAwe2DdPg3MURGA=;
 b=dCxWUBnBaU0/8sGs8CPT07mcxdr5/wZJp02fniK88Ega5B5uEfXfSvn2gkzQJLTtmE
 8vOZTzFXvqVrYsFeuqJ4AECjRX/wWHwfBQ+HsgnPm0g2bACSrFcB/ZjLVW8l6LjHKeCJ
 +tBf3T8ocbudCmYs9BvB6dr49nwTW04Gn0Cpd6x88pnHBc38xLzdaWFE0C3nb05Jd0Ia
 PX6IEexXroLQEExsp6SSs6DXrq7jbXy78d9HWDH56suFVbfYpPAJ1RPBvHUwRzzuztew
 qTT4v+bbCLcLm0UwK/XSGnRB6pKiFtrc/0+qgSRu7ZWfcDly09pPdJ1iEwFoXeXadctR
 ibYw==
X-Gm-Message-State: AAQBX9eMMpnRwPsbSYznieP5qlcoe+fadPlrTpe04vbih7eyqsVC+5gR
 ukU2ErsuB/8/Sh4lkB8hJrkTmJwCIMzYwuMRklQ=
X-Google-Smtp-Source: AKy350aG0IPdsplaocjUX14cX5fJ8LJTAXGzl/Pt2Cu9j3fFkZ1NAnC+qfdB2Y059LaHGnn8AdCWjxR8FnmxY02BKbw=
X-Received: by 2002:a05:6512:2347:b0:4ec:ad33:b2fd with SMTP id
 p7-20020a056512234700b004ecad33b2fdmr2420106lfu.0.1681990724766; Thu, 20 Apr
 2023 04:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681732982.git.yin31149@gmail.com>
 <3bd9b7f8a7dc2c9b68679139623308e184a6de85.1681732982.git.yin31149@gmail.com>
 <CAJaqyWeTrx7cPALh_jweh9r0Yi5TU9oqpuvZk-BmtHUyYq1xJg@mail.gmail.com>
In-Reply-To: <CAJaqyWeTrx7cPALh_jweh9r0Yi5TU9oqpuvZk-BmtHUyYq1xJg@mail.gmail.com>
From: Hawkins Jiawei <yin31149@gmail.com>
Date: Thu, 20 Apr 2023 19:38:31 +0800
Message-ID: <CAKrof1OoPecP-8A_UXtEeyOsinciuceTuBFm_GLoV-wo1OQLOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdpa: send CVQ state load commands in parallel
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: jasowang@redhat.com, 18801353760@163.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=yin31149@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 01:43, Eugenio Perez Martin <eperezma@redhat.com> wr=
ote:
>
> On Wed, Apr 19, 2023 at 1:50=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.co=
m> wrote:
> >
> > This patch introduces the vhost_vdpa_net_cvq_add() and
> > refactors the vhost_vdpa_net_load*(), so that QEMU can
> > send CVQ state load commands in parallel.
> >
> > To be more specific, this patch introduces vhost_vdpa_net_cvq_add()
> > to add SVQ control commands to SVQ and kick the device,
> > but does not poll the device used buffers. QEMU will not
> > poll and check the device used buffers in vhost_vdpa_net_load()
> > until all CVQ state load commands have been sent to the device.
> >
> > What's more, in order to avoid buffer overwriting caused by
> > using `svq->cvq_cmd_out_buffer` and `svq->status` as the
> > buffer for all CVQ state load commands when sending
> > CVQ state load commands in parallel, this patch introduces
> > `out_cursor` and `in_cursor` in vhost_vdpa_net_load(),
> > pointing to the available buffer for in descriptor and
> > out descriptor, so that different CVQ state load commands can
> > use their unique buffer.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1578
> > Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> > ---
> >  net/vhost-vdpa.c | 137 +++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 102 insertions(+), 35 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 10804c7200..d1f7113992 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -590,6 +590,44 @@ static void vhost_vdpa_net_cvq_stop(NetClientState=
 *nc)
> >      vhost_vdpa_net_client_stop(nc);
> >  }
> >
> > +/**
> > + * vhost_vdpa_net_cvq_add() adds SVQ control commands to SVQ,
> > + * kicks the device but does not poll the device used buffers.
> > + *
> > + * Return the length of the device used buffers.
> > + */
> > +static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s,
> > +                                void **out_cursor, size_t out_len,
> > +                                void **in_cursor, size_t in_len)
> > +{
> > +    /* Buffers for the device */
> > +    const struct iovec out =3D {
> > +        .iov_base =3D *out_cursor,
> > +        .iov_len =3D out_len,
> > +    };
> > +    const struct iovec in =3D {
> > +        .iov_base =3D *in_cursor,
> > +        .iov_len =3D in_len,
> > +    };
> > +    VhostShadowVirtqueue *svq =3D g_ptr_array_index(s->vhost_vdpa.shad=
ow_vqs, 0);
> > +    int r;
> > +
> > +    r =3D vhost_svq_add(svq, &out, 1, &in, 1, NULL);
> > +    if (unlikely(r !=3D 0)) {
> > +        if (unlikely(r =3D=3D -ENOSPC)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device que=
ue\n",
> > +                          __func__);
> > +        }
> > +        return r;
> > +    }
> > +
> > +    /* Update the cursor */
> > +    *out_cursor +=3D out_len;
> > +    *in_cursor +=3D in_len;
> > +
> > +    return in_len;
> > +}
> > +
> >  /**
> >   * vhost_vdpa_net_cvq_add_and_wait() adds SVQ control commands to SVQ,
> >   * kicks the device and polls the device used buffers.
> > @@ -628,69 +666,64 @@ static ssize_t vhost_vdpa_net_cvq_add_and_wait(Vh=
ostVDPAState *s,
> >      return vhost_svq_poll(svq);
> >  }
> >
> > -static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s, uint8_t clas=
s,
> > -                                       uint8_t cmd, const void *data,
> > -                                       size_t data_size)
> > +static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s,
> > +                                void **out_cursor, uint8_t class, uint=
8_t cmd,
> > +                                const void *data, size_t data_size,
> > +                                void **in_cursor)
> >  {
> >      const struct virtio_net_ctrl_hdr ctrl =3D {
> >          .class =3D class,
> >          .cmd =3D cmd,
> >      };
> >
> > -    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl=
));
> > +    assert(sizeof(ctrl) < vhost_vdpa_net_cvq_cmd_page_len() -
> > +                          (*out_cursor - s->cvq_cmd_out_buffer));
> > +    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl=
) -
> > +                       (*out_cursor - s->cvq_cmd_out_buffer));
> >
> > -    memcpy(s->cvq_cmd_out_buffer, &ctrl, sizeof(ctrl));
> > -    memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
> > +    memcpy(*out_cursor, &ctrl, sizeof(ctrl));
> > +    memcpy(*out_cursor + sizeof(ctrl), data, data_size);
> >
> > -    return vhost_vdpa_net_cvq_add_and_wait(s, sizeof(ctrl) + data_size=
,
> > -                                  sizeof(virtio_net_ctrl_ack));
> > +    return vhost_vdpa_net_cvq_add(s, out_cursor, sizeof(ctrl) + data_s=
ize,
> > +                                  in_cursor, sizeof(virtio_net_ctrl_ac=
k));
> >  }
> >
> > -static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet =
*n)
> > +static ssize_t vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIO=
Net *n,
> > +                                   void **out_cursor, void **in_cursor=
)
> >  {
> >      uint64_t features =3D n->parent_obj.guest_features;
> >      if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > -        ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_=
CTRL_MAC,
> > -                                                  VIRTIO_NET_CTRL_MAC_=
ADDR_SET,
> > -                                                  n->mac, sizeof(n->ma=
c));
> > -        if (unlikely(dev_written < 0)) {
> > -            return dev_written;
> > -        }
> > -
> > -        return *s->status !=3D VIRTIO_NET_OK;
> > +        return vhost_vdpa_net_load_cmd(s, out_cursor, VIRTIO_NET_CTRL_=
MAC,
> > +                                       VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > +                                       n->mac, sizeof(n->mac), in_curs=
or);
> >      }
> >
> >      return 0;
> >  }
> >
> > -static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> > -                                  const VirtIONet *n)
> > +static ssize_t vhost_vdpa_net_load_mq(VhostVDPAState *s, const VirtION=
et *n,
> > +                                  void **out_cursor, void **in_cursor)
> >  {
> >      struct virtio_net_ctrl_mq mq;
> >      uint64_t features =3D n->parent_obj.guest_features;
> > -    ssize_t dev_written;
> >
> >      if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> >          return 0;
> >      }
> >
> > -    mq.virtqueue_pairs =3D cpu_to_le16(n->curr_queue_pairs);
>
> So where is mq filled now?

This should be a typo, this line should not be deleted.
I will correct it in the second patch.

>
> > -    dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MQ,
> > -                                          VIRTIO_NET_CTRL_MQ_VQ_PAIRS_=
SET, &mq,
> > -                                          sizeof(mq));
> > -    if (unlikely(dev_written < 0)) {
> > -        return dev_written;
> > -    }
> > -
> > -    return *s->status !=3D VIRTIO_NET_OK;
> > +    return vhost_vdpa_net_load_cmd(s, out_cursor, VIRTIO_NET_CTRL_MQ,
> > +                                   VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> > +                                   &mq, sizeof(mq), in_cursor);
> >  }
> >
> >  static int vhost_vdpa_net_load(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    VhostShadowVirtqueue *svq;
> > +    void *out_cursor, *in_cursor;
> >      struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >      const VirtIONet *n;
> > -    int r;
> > +    ssize_t need_poll_len =3D 0, r, dev_written;
> >
> >      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> > @@ -699,16 +732,50 @@ static int vhost_vdpa_net_load(NetClientState *nc=
)
> >      }
> >
> >      n =3D VIRTIO_NET(v->dev->vdev);
> > -    r =3D vhost_vdpa_net_load_mac(s, n);
> > +
>
> Extra newline.

Thanks for the comment, I will remove it in the second patch.

>
> > +    need_poll_len =3D 0;
>
> Maybe we can call it "cmds_in_flight" or something similar? It is not a l=
ength.

Do you mean we should maintain the number of successful commands here?

My initial thought was to maintain the total length of device used
buffer, so that we
can know when to exit while polling for the device used buffer.

So far, each SVQ command uses one byte long used buffer for device, so
the effect of maintaining the total length of device used buffer and
the number of
successful commands is consistent.

Yet I prefer to maintain the total length of device used buffer,
because this can
avoid the assumption that each SVQ command uses one byte long used
buffer for device and can use the vhost_svq_poll() return value better duri=
ng
polling, which makes the code look more reasonable.

What do you think?

>
> > +    out_cursor =3D s->cvq_cmd_out_buffer;
> > +    in_cursor =3D s->status;
> > +
> > +    r =3D vhost_vdpa_net_load_mac(s, n, &out_cursor, &in_cursor);
> >      if (unlikely(r < 0)) {
> > -        return r;
> > +        goto load_err;
> > +    }
> > +    need_poll_len +=3D r;
> > +
> > +    r =3D vhost_vdpa_net_load_mq(s, n, &out_cursor, &in_cursor);
> > +    if (unlikely(r < 0)) {
> > +        goto load_err;
> > +    }
> > +    need_poll_len +=3D r;
> > +
> > +load_err:
> > +    /* Poll for all SVQ control commands used buffer from device */
> > +    svq =3D g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
> > +    while (need_poll_len > 0) {
> > +        /*
> > +         * We can poll here since we've had BQL from the time we sent =
the
> > +         * descriptor. Also, we need to take the answer before SVQ pul=
ls
> > +         * by itself, when BQL is released
> > +         */
> > +        dev_written =3D vhost_svq_poll(svq);
>
> If vhost_svq_poll returns 0 we must return an error from this code.
> Otherwise this will be an infinite loop.

Yes, you are right, we should return an error here. What error code do
you think we
should return? It seems that vhost_svq_poll() returns 0 when QEMU
waits for too long
or no available used buffer from device, so is it okay to return
-EAGAIN(resource temporarily
unavailable)?

>
> > +        need_poll_len -=3D dev_written;
>
> On the other hand, vhost_svq_poll returns 1 because that is the length
> written in the "in" buffer, but it is not obvious here. It is more
> clear if we just do need_poll_len-- here.

It should be the same as above. If we maintain the total length of
device used buffer for
`need_poll_len`, it look more reasonable here.

Maybe `used_buffer_len` is clearer?

>
> >      }
> > -    r =3D vhost_vdpa_net_load_mq(s, n);
> > -    if (unlikely(r)) {
> > +
> > +    /* If code comes from `load_err` label, then we should return dire=
ctly */
> > +    if (unlikely(r < 0)) {
>
> If this function returns a failure we can avoid the sending of the
> queued commands, as the caller must cancel the start of the device
> anyway. We can return directly from the failure in
> vhost_vdpa_net_load_* and avoid the label.

Thanks for the explanation, I will refactor the patch as you suggested.

>
> >          return r;
> >      }
> >
> > -    return 0;
> > +    /* Check the used buffer from device */
> > +    for (virtio_net_ctrl_ack * status =3D s->status; (void *)status < =
in_cursor;
>
> in_cursor can be a virtio_net_ctrl_ack so we don't need the casting here.
Thanks for the suggestion, I will refactor the patch as you suggested.

>
> > +         ++status) {
> > +        if (*status !=3D VIRTIO_NET_OK) {
> > +            ++r;
> > +        }
> > +    }
> > +
> > +    return r;
>
> Although the caller is fine with >=3D0, I think we should keep the 0 =3D=
=3D
> success. The number of commands delivered does not make a lot of sense
> for the callers, just if the call succeeded or not.

Thanks for the explanation, I will refactor the patch as you suggested.

>
> Thanks!
>
> >  }
> >
> >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > --
> > 2.25.1
> >
>

