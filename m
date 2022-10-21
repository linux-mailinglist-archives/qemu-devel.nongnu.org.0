Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F10606E25
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:09:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliPx-0004fv-AO
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:09:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliJZ-00038X-KF
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliJP-0002kJ-Ed
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliJN-0007QA-Lm
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666321384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YdG5bihfMb8smazxC8BOv8xZKaTWa9WSyewKPOpLSo=;
 b=U7+UJF3o4shb7Qhk54UY1r5kNvKgJTnVfcfbCYPj5JWGG6rbzHBAg8N6xOHMy2w2WHux9l
 r0PUAdO8b16clj7o1ZvaIsz6G3MLW66oBPZ+OFnZiOReXvo8nDGFjoMJ8vuf6bdxSx2wEW
 UIPaqLTHeZDckPz/tEb8Cis0aGhlFpQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-tv2kF27WMaCa9Xk3JTHKTg-1; Thu, 20 Oct 2022 23:03:03 -0400
X-MC-Unique: tv2kF27WMaCa9Xk3JTHKTg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hd11-20020a170907968b00b0078df60485fdso708783ejc.17
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 20:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YdG5bihfMb8smazxC8BOv8xZKaTWa9WSyewKPOpLSo=;
 b=7rkiuie+r3yZtB4tnJgTSa0Hiv2eQR76WPokX+OobrS4dqM3F+X2af6ZLkwvYZpMaQ
 FZaG+xvlfmKROzeeu3xEBM6kxl3UrAEBT1BuM4QZosaOi7ysJMGwQhiRXktciJkP6Qup
 meIsWaMLLnYQQtwx3fi651jHR0huwYV+veezsRBdypk2I10OSQfL/YHP1HekuD6YCOmh
 sPLvBbjEVoju12D6yz2C+9FHnKnPwCucUl2/9ANidDj1986eZixMuoZoyDRTmEoq2YSY
 IeeyvpKRUuo/YaGTOmf8xNIuTt8h6O2t9B4TZhrJ58Wnsj+Iw3Lhn2E56fM9iviEPWjF
 IymQ==
X-Gm-Message-State: ACrzQf22KPp60BtV8APijOSADrWrMO54nv6k+dMf+3dDRb6excrR63vu
 UWgd53RYK8TCdZ+Q1SgWPmz3RARcVDIfvLDN5aR4hazRIoYgUyLm/0syP+Q/dD3nF3qs+W1xOoE
 BZ7aJ01lC4l6xB8/fc1A6QgMLoNXY3zU=
X-Received: by 2002:a17:907:2c5b:b0:78d:3f8a:19d0 with SMTP id
 hf27-20020a1709072c5b00b0078d3f8a19d0mr13321730ejc.369.1666321378779; 
 Thu, 20 Oct 2022 20:02:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GbkI15R9P39k7d7ujKNA62fes0ZtGj/bGmI86NgBJUEMV/NRUPJTOOrkwK9xbUv1swO7kAUY0/jbUxGmCjzM=
X-Received: by 2002:a17:907:2c5b:b0:78d:3f8a:19d0 with SMTP id
 hf27-20020a1709072c5b00b0078d3f8a19d0mr13321712ejc.369.1666321378577; Thu, 20
 Oct 2022 20:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221020080230.319130-1-eperezma@redhat.com>
In-Reply-To: <20221020080230.319130-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 11:02:44 +0800
Message-ID: <CACGkMEvZhZvWrLOE6QO6xZi6zuJMLwcpt=W9nVYE67apg8Jqsw@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Remove shadow CVQ command check
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Oct 20, 2022 at 4:02 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> The guest will see undefined behavior if it issue not negotiate
> commands, bit it is expected somehow.
>
> Simplify code deleting this check.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

Applied.

Thanks

> ---
>  net/vhost-vdpa.c | 48 ------------------------------------------------
>  1 file changed, 48 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index eebf29f5c1..6d64000202 100644
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


