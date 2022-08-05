Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0BF58A527
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:52:24 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoNr-0002GS-HX
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoK3-000655-2i
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoK1-0003r7-5g
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659671304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql1AJPEhHDr7JfwEUjEZ3I+jdhJ4GdB0OS3UBbfESmc=;
 b=Rn9GNhcX8o6E/Lrgt33QAxrPDTVaaKCQoUGw5lkRryA+PyVP7UBsDHowwJZNVoriyUkCT+
 GxytDR0y1DbwYvL0vsDMFyVrFkqI4ZvOosgIJJ3yTOLfVH5eeeXoCLWZWrU4HsIxroDIQA
 sENBTgSQNOofg1KKlTA8IQ46POJUUGs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-k3xjEn-aNxqaWcJ_UyOkYw-1; Thu, 04 Aug 2022 23:48:23 -0400
X-MC-Unique: k3xjEn-aNxqaWcJ_UyOkYw-1
Received: by mail-lf1-f71.google.com with SMTP id
 26-20020ac25f5a000000b0048b066a27a7so289141lfz.20
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 20:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ql1AJPEhHDr7JfwEUjEZ3I+jdhJ4GdB0OS3UBbfESmc=;
 b=DoUSe1IjjmNDcXGnc6rxV5yIdqGBRLSqIjw4bJjIztSgzymmYvAypdwgUqVZZ6ShV6
 lvTJ7bYToT/Vp71q1Vd1YQuMa+7U4dN62rMPIoQlNhTA5yEyTVgP5Buw9WvKmtmqQERu
 B1+hQvlJ1mb5alzkiIvLY2Er65TCaIb7zHRDC/QXtwtLD2MPrSE8dfvZaCcZqeucQmOQ
 s3i0Y1ieV5OU4/ppA4sYtKi0A5gfaldUmS45PrAqcZos1tZvmL+vO+G6BaKU6aNaU2y+
 arPhQeMeQYWy2x60iCtiAYBxJypGmoS/4g5Tm0oAbYYu44BnQ/E2jTDHWNu1si6bs48z
 ifxQ==
X-Gm-Message-State: ACgBeo21tVewMnn2JKwOSh96ILjLpZPfEIOjpAUMY9IPz3h3tUWSSTXh
 ctGo9JhoXV6d2+T66WF/MQrc3alLm7iV81twOhm6bVjSmC8jSGF8Cb0tj82I5GiXVCUBOV9+aWk
 Dmi9sLMSVA+DcxkdT7jJSwUCrKLxMOtY=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr622884lfg.411.1659671301963; 
 Thu, 04 Aug 2022 20:48:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tiX6CLZKAK1VZ5a6IF95CSo7KkXK6MiB1llQmwSGsdOhPGQXraGkhJ5bUZlxf075pwI0U80kkKc6nGWWAx0k=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr622877lfg.411.1659671301778; Thu, 04 Aug
 2022 20:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-2-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 11:48:10 +0800
Message-ID: <CACGkMEsJjuEBb46-TiuaqRX2pA5QKZDW4Nxm5nsEBLGA7-iKdA@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] vhost: stop transfer elem ownership in
 vhost_handle_guest_kick
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
> It was easier to allow vhost_svq_add to handle the memory. Now that we
> will allow qemu to add elements to a SVQ without the guest's knowledge,
> it's better to handle it in the caller.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index e4956728dd..ffd2b2c972 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -233,9 +233,6 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
>  /**
>   * Add an element to a SVQ.
>   *
> - * The caller must check that there is enough slots for the new element.=
 It
> - * takes ownership of the element: In case of failure not ENOSPC, it is =
free.
> - *
>   * Return -EINVAL if element is invalid, -ENOSPC if dev queue is full
>   */
>  int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
> @@ -252,7 +249,6 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const st=
ruct iovec *out_sg,
>
>      ok =3D vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num, &qem=
u_head);
>      if (unlikely(!ok)) {
> -        g_free(elem);
>          return -EINVAL;
>      }
>
> @@ -293,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqu=
eue *svq)
>          virtio_queue_set_notification(svq->vq, false);
>
>          while (true) {
> -            VirtQueueElement *elem;
> +            g_autofree VirtQueueElement *elem;
>              int r;
>
>              if (svq->next_guest_avail_elem) {
> @@ -324,12 +320,14 @@ static void vhost_handle_guest_kick(VhostShadowVirt=
queue *svq)
>                       * queue the current guest descriptor and ignore kic=
ks
>                       * until some elements are used.
>                       */
> -                    svq->next_guest_avail_elem =3D elem;
> +                    svq->next_guest_avail_elem =3D g_steal_pointer(&elem=
);
>                  }
>
>                  /* VQ is full or broken, just return and ignore kicks */
>                  return;
>              }
> +            /* elem belongs to SVQ or external caller now */
> +            elem =3D NULL;
>          }
>
>          virtio_queue_set_notification(svq->vq, true);
> --
> 2.31.1
>


