Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FA56B4D1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 10:56:08 +0200 (CEST)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9jmQ-0007GN-Mx
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 04:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o9jiv-0005Dq-Kb
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 04:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o9jis-0003R2-FO
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 04:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657270345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sk74N8zEOEUIE3rArwjHQD55MbAB+RjS3UZwlau/Xg=;
 b=im5NaqAGcnuDss8AFHjG3Q/FuE4aGwe7J4CqZa500dUM95q4Qmpk7KdZ5n8wCn3VwlZ4cv
 1ddLzKVyFA6tHQ8ws5or5TiFjIEvRnFqcFmDI28wNmgRAMMx7ZLOtJxMxzQsCPqA62853y
 JvO7VVcDZb3J7JxiltmT/7t/j2BkCwk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-sftDCEc8OQ2PRtQd1dHzBw-1; Fri, 08 Jul 2022 04:52:23 -0400
X-MC-Unique: sftDCEc8OQ2PRtQd1dHzBw-1
Received: by mail-lf1-f71.google.com with SMTP id
 e8-20020ac24e08000000b0047fad5770d2so7594867lfr.17
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 01:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+sk74N8zEOEUIE3rArwjHQD55MbAB+RjS3UZwlau/Xg=;
 b=Q3lEjr3dUkndU78PkUPkhbg2oLJpDTomsgoKqsQKHpTLDNx7OSoDz4BFRp67D9WuS/
 26SVHwEL7ndM13ZQTKe3fiPZ7o1u6kjNraNek0nUJcBRTra3p1qT/idgJT/1Mel8cKv4
 1WsB5j1jg272UntuRo+7ubo+mjNhZsVLaMbBcr3gDbzrTx8QmBwMVKd/GKkYh3XSMxe2
 oCTqtMSftS0yASQJbQVlMh5pBYQKAWgxC6OzMCXNFV3jH1QGeGR4/TWbjEe8FevpVgBR
 8Bl2fqe4JRM46oT3LUBcMft/1e9vDhlH4dXtRcbrpf6uRCsZr7rfEeHL1vFTHueOOc2Q
 8wjw==
X-Gm-Message-State: AJIora8XhJ8+xP+1QUy+NtCLhwnJ1BCeVem+itvSnqXO9bJLJBlUXsBu
 dSnLkMS46Vs+LwwdUTKgPu8MfUbBeC5dDTgB8vz+SR3zkrXgjzhtY5RfHQVd6UlbxSSI6qArzgi
 cVGnwgVeXE1SK0mKKCrfrhrZccAnAdDk=
X-Received: by 2002:a2e:b703:0:b0:25a:93d0:8a57 with SMTP id
 j3-20020a2eb703000000b0025a93d08a57mr1326222ljo.487.1657270341995; 
 Fri, 08 Jul 2022 01:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAKL4cgqemORcF9T+LUdzTJ7JfioSyzdLXcmcMwXxN87Xlgu5J/U90KPrcQBU1j+8kgeMJu99DWA95rmTGpk8=
X-Received: by 2002:a2e:b703:0:b0:25a:93d0:8a57 with SMTP id
 j3-20020a2eb703000000b0025a93d08a57mr1326197ljo.487.1657270341716; Fri, 08
 Jul 2022 01:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-2-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 8 Jul 2022 16:52:10 +0800
Message-ID: <CACGkMEvOr4ugFTzU-NSK6u3m4jR9aJ4Uori9D+=sy7XgshBXOA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 01/23] vhost: Return earlier if used buffers overrun
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 7, 2022 at 2:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Previous function misses the just picked avail buffer from the queue.
> This way keeps blocking the used queue forever, but is cleaner to check
> before calling to vhost_svq_get_buf.
>
> Fixes: 100890f7cad50 ("vhost: Shadow virtqueue buffers forwarding")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 56c96ebd13..9280285435 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -405,19 +405,21 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
>          vhost_svq_disable_notification(svq);
>          while (true) {
>              uint32_t len;
> -            g_autofree VirtQueueElement *elem =3D vhost_svq_get_buf(svq,=
 &len);
> -            if (!elem) {
> -                break;
> -            }
> +            g_autofree VirtQueueElement *elem =3D NULL;
>
>              if (unlikely(i >=3D svq->vring.num)) {
>                  qemu_log_mask(LOG_GUEST_ERROR,
>                           "More than %u used buffers obtained in a %u siz=
e SVQ",
>                           i, svq->vring.num);
> -                virtqueue_fill(vq, elem, len, i);
> -                virtqueue_flush(vq, i);
> +                virtqueue_flush(vq, svq->vring.num);
>                  return;
>              }
> +
> +            elem =3D vhost_svq_get_buf(svq, &len);
> +            if (!elem) {
> +                break;
> +            }
> +
>              virtqueue_fill(vq, elem, len, i++);
>          }
>
> --
> 2.31.1
>


