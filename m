Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9865305B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xX2-0007TB-1J; Wed, 21 Dec 2022 06:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1p7xX0-0007Sb-FC
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:45:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1p7xWy-00068V-AF
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:45:06 -0500
Received: by mail-ej1-x62b.google.com with SMTP id u19so36176909ejm.8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rz5Wr1GyekVnG5mzDYxyC8YKnTTgouMZNek6WosZHwk=;
 b=RYgLznkQJKohQyDRKniaSDceuoHsackZb4RhtwPKx7Ea4QyEGaun6j5pfEN5efWlTM
 BHYwfxzfSJPBwLnzYwDQlO7ez4ClmYSLOVaTBpyjj2Jn7cdt5YKKU5O4PNXa5ofIMcS1
 mgJR1IB2E5MNRQifNPOqbo5l5Ilc1HaNTjnVc8Vs0PaCpH3S8oeMl260QR7//JYsVx4+
 lKOMCWP2lFVaHSK2RxwQflz4vLennDHrQf/bTXIoNarZq9iIaI2hARGN6uviuyj1mhm5
 em4wIuymE18qYnhLwlU0v4giEr1tspNI7jvnDLuhyPqnQO9aMK+Wor8V7aDQUJvfFIJm
 e3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rz5Wr1GyekVnG5mzDYxyC8YKnTTgouMZNek6WosZHwk=;
 b=j2CUS+5Az65kENFCBX9dx58deztA2JR4qLd8M7Z6mv3DGtIe3KpGcGZEx53OLYxZIh
 o4xmcHCTYq0TLfjgoAqaDWImPiewja2ExSCpiPOlNgHq6a3XSrlsYe8zImPyYkaL8Erz
 IpmTn8WIPW/lHMq4FEdWDuWCPH1XoviFPkFih/nhdAdW2DXLTKOl+/5R7R4IUFakia9r
 NJzpnKfYtwawBWZlV3y6XY7iG81fwWUtjfcgELN8jyZ3h0jEaSwjFRuQ0YGbmc5dpnyQ
 fFOfrOLGNyOm3xlt8/AAqeCXClVkJDkQjGn11kmT/8Pk/7moIFxgBlZYue/mpp82CISW
 BkxQ==
X-Gm-Message-State: AFqh2kpzTlwT6nOnkRrVDR83alxiugz+2c8BHA/WR/VfwOpOV//5ybLM
 abIFVLVElR+3sXJt3AelWZZA6vgOpYv7HMMCVScC
X-Google-Smtp-Source: AMrXdXtLcDIEtbOXUE+E+KfUXn4Rdf1nNn0J+2olwUz2KeQdAWASRLCkQrPF9zhROEcSOEWFSWfoKnMQfT7ngucDqrk=
X-Received: by 2002:a17:907:3888:b0:83f:757e:f201 with SMTP id
 sq8-20020a170907388800b0083f757ef201mr133073ejc.141.1671623100116; Wed, 21
 Dec 2022 03:45:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671563795.git.marcel@holtmann.org>
 <743f1c04347de12e7e94360eed74a8dbdcff6477.1671563795.git.marcel@holtmann.org>
In-Reply-To: <743f1c04347de12e7e94360eed74a8dbdcff6477.1671563795.git.marcel@holtmann.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 21 Dec 2022 19:44:47 +0800
Message-ID: <CACycT3vYU11RwEGK9m3SndeQPRPU0a=V_ujK4SUVe+kjUH=ASA@mail.gmail.com>
Subject: Re: [RFC v2 10/10] libvduse: Fix assignment in vring_set_avail_event
To: Marcel Holtmann <marcel@holtmann.org>
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 21, 2022 at 3:27 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
>   CC       libvduse.o
> libvduse.c: In function =E2=80=98vring_set_avail_event=E2=80=99:
> libvduse.c:603:7: error: dereferencing type-punned pointer will break str=
ict-aliasing rules [-Werror=3Dstrict-aliasin]
>   603 |     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole=
16(val);
>       |      ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  subprojects/libvduse/libvduse.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvd=
use.c
> index 338ad5e352e7..51a4ba1b6878 100644
> --- a/subprojects/libvduse/libvduse.c
> +++ b/subprojects/libvduse/libvduse.c
> @@ -582,7 +582,10 @@ void vduse_queue_notify(VduseVirtq *vq)
>
>  static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
>  {
> -    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16(val)=
;
> +    vring_used_elem_t *ring =3D &vq->vring.used->ring[vq->vring.num];
> +
> +    /* FIXME: Is this actually correct since this is __virtio32 id; */
> +    ring->id =3D htole16(val);
>  }

Can we do it as libvhost-user does=EF=BC=9F

static inline void
vring_set_avail_event(VuVirtq *vq, uint16_t val)
{
    uint16_t *avail;

    avail =3D (uint16_t *)&vq->vring.used->ring[vq->vring.num];
    *avail =3D htole16(val);
}

Thanks,
Yongji

