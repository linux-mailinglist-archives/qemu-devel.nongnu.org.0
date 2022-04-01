Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033B64EEBDE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:54:08 +0200 (CEST)
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEus-000294-Tm
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:54:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naEsF-0008Vs-5y
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naEsC-00053r-Ae
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648810279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/nGuS1hkH7OFCfnKWl0vBNSvQHA6J4U0k9Qn1XXkDQM=;
 b=FFoxrRzHndD8uoobWBpT2NrrI/8IX7axWxZ+MBdfD2fSsppUVUjXdTACfTsDintMlV790g
 T6mZ/5DSS33PVkxbNPFRGcxZTOrFX/c0ouSLXBakA9w+MKNYax4qe0o4WtLmJx2l1MkrlE
 n6J0StxVGZ468MuPR3BY+VTP755uilE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-uqTU5xOqN6m5YFwoNAS3NA-1; Fri, 01 Apr 2022 06:51:18 -0400
X-MC-Unique: uqTU5xOqN6m5YFwoNAS3NA-1
Received: by mail-qt1-f199.google.com with SMTP id
 t19-20020ac86a13000000b002e1fd2c4ce5so1737407qtr.5
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/nGuS1hkH7OFCfnKWl0vBNSvQHA6J4U0k9Qn1XXkDQM=;
 b=Eb20yuOdYs1bEDNJOC9DxSn6xOnvHDGr8iDW5cWdlZCd8ZSL0egAj5KMKr4F+LqpKf
 O/tuOvvV4CgCkU4Hzuv/Vfcy5X+eOakfGrNloCCmaRqcXrIJCLUo7tF+WoS7rJVGqzbs
 qBOYhQZZVBhUKtiuyIlpwoWnLKq2aEAITZ49SbuHrlrJEBOJN1S/wMy7XA5St52+/VcD
 6KxZKeaZ2DC7i5TMcVsSRbDVKyGc0p6AMoVxrHZngL4C8CQmTUCzRFUOTvYtImX5mu1l
 pyK5klm2fi2mV5zjyXknUdsH/sPMqETmk7xEftm+2WUreKH4l/+Q0bfqaSpVvC+RWYFi
 B4fw==
X-Gm-Message-State: AOAM531Q4beRC6LUw8oR8POjQIaCMvEXes7RM957qugKUIIhIzuA0nFz
 bHAwZA9NjsaAX48BRHd/d5DL49RExEZfq/zIOr8TdNHmIX2NPasyEiau7LWTYFL6wQ2qw5m2YR7
 LfW0/Qq1bLQMi+2B6A7GkQrxoLgPYcuQ=
X-Received: by 2002:a05:620a:31a3:b0:67d:32c4:d4f8 with SMTP id
 bi35-20020a05620a31a300b0067d32c4d4f8mr6185222qkb.308.1648810277982; 
 Fri, 01 Apr 2022 03:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuf6BvHnn0TwFBP8f+dT6AtE5J6py1olhGwzSzTV1r9nBec8dqOrr0FphtKU+uiCtIfiq5OYldMo4hNi7uEns=
X-Received: by 2002:a05:620a:31a3:b0:67d:32c4:d4f8 with SMTP id
 bi35-20020a05620a31a300b0067d32c4d4f8mr6185191qkb.308.1648810277695; Fri, 01
 Apr 2022 03:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-20-philmd@redhat.com>
In-Reply-To: <20210903174510.751630-20-philmd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 1 Apr 2022 12:50:41 +0200
Message-ID: <CAJaqyWd9kd6TamcO3qj68J5Dn6-cXAWRxOckbfjwpKnEp0_VzQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 19/28] hw/virtio: Replace g_memdup() by g_memdup2()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-level <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 3, 2021 at 8:11 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>
> Replace g_memdup() by the safer g_memdup2() wrapper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Should we check in_num/out_num in range?

I'd say it is not needed to check: virtqueue_pop fills them by
iterating through the descriptor chain so the range is restricted to
[0, 1024].

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>


> ---
>  hw/net/virtio-net.c       | 3 ++-
>  hw/virtio/virtio-crypto.c | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52..338fbeb8c57 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1449,7 +1449,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vd=
ev, VirtQueue *vq)
>          }
>
>          iov_cnt =3D elem->out_num;
> -        iov2 =3D iov =3D g_memdup(elem->out_sg, sizeof(struct iovec) * e=
lem->out_num);
> +        iov2 =3D iov =3D g_memdup2(elem->out_sg,
> +                               sizeof(struct iovec) * elem->out_num);
>          s =3D iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
>          iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
>          if (s !=3D sizeof(ctrl)) {
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 54f9bbb789c..59886c1790d 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *v=
dev, VirtQueue *vq)
>          }
>
>          out_num =3D elem->out_num;
> -        out_iov_copy =3D g_memdup(elem->out_sg, sizeof(out_iov[0]) * out=
_num);
> +        out_iov_copy =3D g_memdup2(elem->out_sg, sizeof(out_iov[0]) * ou=
t_num);
>          out_iov =3D out_iov_copy;
>
>          in_num =3D elem->in_num;
> @@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *reque=
st)
>      }
>
>      out_num =3D elem->out_num;
> -    out_iov_copy =3D g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num=
);
> +    out_iov_copy =3D g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_nu=
m);
>      out_iov =3D out_iov_copy;
>
>      in_num =3D elem->in_num;
> -    in_iov_copy =3D g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
> +    in_iov_copy =3D g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
>      in_iov =3D in_iov_copy;
>
>      if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
> --
> 2.31.1
>
>


