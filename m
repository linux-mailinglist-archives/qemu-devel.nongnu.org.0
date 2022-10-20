Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85060565A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:36:01 +0200 (CEST)
Received: from localhost ([::1]:35832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNHk-0004E6-M8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:36:00 -0400
Received: from [::1] (port=35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNHk-0003ws-HL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNDL-0006F3-59
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNDG-0004Qd-KN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666240281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBO66vbBDSsEQFOqNcGJ9M22k5JEi0iwgvFmhNSNtAI=;
 b=UuBZX5/1crW9HwLHt3/LE71Fkif9hHY8KcentHV/WVwXpiswHzlpUgz1r0NTV2N2083SlX
 TUSTsvYQk4yVDgG/RMpDTa+1B8dIX/gJsKYqGhS/wRF880UzSQYZV4SCw9iRpRFXBtF7oD
 RiMN3TZIOHl1A/EKmPRzQbwZ8v+10pA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-epAJFY8YMrqCIFz3xcOk1A-1; Thu, 20 Oct 2022 00:31:20 -0400
X-MC-Unique: epAJFY8YMrqCIFz3xcOk1A-1
Received: by mail-ej1-f71.google.com with SMTP id
 jg38-20020a170907972600b007919b3ad75aso3814142ejc.10
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBO66vbBDSsEQFOqNcGJ9M22k5JEi0iwgvFmhNSNtAI=;
 b=oU7N4Mar9rPMpio1u0kj+/xKS2N+sUtqiGPd9PoLdAUViC6tV7EWNKIxxSH1zfQXnE
 xT6CzfmpWSE5M3Mzz2m3N6chHfIv17JSplxkeKMb3tNcsqELfCurGZ/vJEDNxueGd5k6
 K7SwJzKRj7i2kupZTkmPUaIkTQ2JXNryHBgwasdsHgchVmh48jn7MCtwg5eQsMDmyT5H
 oyTw8vCtMOim8ZFDSW/vwImn6bebpD2whWV+bV8Qs4DLqN7ZXcY9WmhshNndNQ1EVMIo
 ubvQ1tTGMOdPp59nXi7ayWtEXotHgwSlYH5+jnBBhs+4Qx0oAqOhZhvOYMXoZtKKK9ed
 AF5w==
X-Gm-Message-State: ACrzQf3n3RGPjOgXWV5wH2cuNDr3qFXZZ0U6NeO7dYWLv/ywajQrpn34
 946p4lLMFCqaSC10KpuS6tA+0bx07zfc1CnkESEkR2hA92Q4JWhgbG5lyOxEpnE4GVT4cgc9y3q
 TAB1n2YpSu7MjxJ+dKbuLuQvUkZYtYY4=
X-Received: by 2002:a17:906:db0e:b0:77b:82cf:54a6 with SMTP id
 xj14-20020a170906db0e00b0077b82cf54a6mr9259438ejb.691.1666240277855; 
 Wed, 19 Oct 2022 21:31:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xsNW7eno1O89GPIHHH1TAi7KVDt1nYnmNHQVA5JsqAAUIaLgf7kIY6XzZK7h4gYjm+oEZbUw9h2EI4PZA2IQ=
X-Received: by 2002:a17:906:db0e:b0:77b:82cf:54a6 with SMTP id
 xj14-20020a170906db0e00b0077b82cf54a6mr9259428ejb.691.1666240277674; Wed, 19
 Oct 2022 21:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-6-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:31:05 +0800
Message-ID: <CACGkMEtwhRj-+XdkATvxeXBEr+BHL-bmVmy+7x3ZPU_YOh1-3Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/8] vdpa: Remove shadow CVQ command check
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> The guest will see undefined behavior if it issue not negotiate
> commands, bit it is expected somehow.
>
> Simplify code deleting this check.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 48 ------------------------------------------------
>  1 file changed, 48 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index fca21d5b79..3374c21b4d 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -461,48 +461,6 @@ static NetClientInfo net_vhost_vdpa_cvq_info =3D {
>      .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
>
> -/**
> - * Do not forward commands not supported by SVQ. Otherwise, the device c=
ould
> - * accept it and qemu would not know how to update the device model.
> - */
> -static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_t =
len)
> -{
> -    struct virtio_net_ctrl_hdr ctrl;
> -
> -    if (unlikely(len < sizeof(ctrl))) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid legnth of out buffer %zu\n", __func__=
, len);
> -        return false;
> -    }
> -
> -    memcpy(&ctrl, out_buf, sizeof(ctrl));
> -    switch (ctrl.class) {
> -    case VIRTIO_NET_CTRL_MAC:
> -        switch (ctrl.cmd) {
> -        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> -            return true;
> -        default:
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
> -                          __func__, ctrl.cmd);
> -        };
> -        break;
> -    case VIRTIO_NET_CTRL_MQ:
> -        switch (ctrl.cmd) {
> -        case VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET:
> -            return true;
> -        default:
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mq cmd %u\n",
> -                          __func__, ctrl.cmd);
> -        };
> -        break;
> -    default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
> -                      __func__, ctrl.class);
> -    };
> -
> -    return false;
> -}
> -
>  /**
>   * Validate and copy control virtqueue commands.
>   *
> @@ -526,16 +484,10 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSh=
adowVirtqueue *svq,
>          .iov_len =3D sizeof(status),
>      };
>      ssize_t dev_written =3D -EINVAL;
> -    bool ok;
>
>      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
>                               s->cvq_cmd_out_buffer,
>                               vhost_vdpa_net_cvq_cmd_len());
> -    ok =3D vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer, out.io=
v_len);
> -    if (unlikely(!ok)) {
> -        goto out;
> -    }
> -
>      dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status=
));
>      if (unlikely(dev_written < 0)) {
>          goto out;
> --
> 2.31.1
>


