Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33244308745
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:14:21 +0100 (CET)
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PrA-0004zl-9S
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5Pol-000412-Mm
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5Poj-00029T-Pk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGfWHjjOBgFb8MggXry5aIAwRbalLhtUwShKPfFHJmw=;
 b=ZoEjE+PN8U8zFHOrZK68y2WuSGBhVBkB3u1fF6PCTvz8SlautN3YatptZUy7hfyyTaPOTr
 J5kMGm0jYARiCt9DGRMad9SQwq1wRdQhkah5IBsNoWP15e/TNNcis+FhH0YvBvhMO0jp31
 peDHta3dbhJH/OHS68CFpreKIXss1F4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-T0F-uNyaOTK9L5WDmel37g-1; Fri, 29 Jan 2021 04:11:46 -0500
X-MC-Unique: T0F-uNyaOTK9L5WDmel37g-1
Received: by mail-qk1-f197.google.com with SMTP id j78so6529115qke.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 01:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IGfWHjjOBgFb8MggXry5aIAwRbalLhtUwShKPfFHJmw=;
 b=W+SY0lF9m6BcsTV/vwCNmEkUGndDEMQxws+rLVU4CjtIhHlSdX0eww66xwsfyFLf69
 QnPVyh47SUwI263rsoDCKpqrDvDo26zt3wRe82JQmvJWxQS6/0ZLVJfsXLOoNuNRzo8R
 zrpNplQkauKFdPOYDe+b97QvZijuKwXEMXKv091GUXmX4xgp9GjoY2vruZiUM0lBAzdd
 yk1NsH3J0ayEsrO8giEovRYsNw7KAcvJ2TS+LpK/bnZHfAgQu1L/wuHGH76PuCjAf8mM
 UafiQkhaFADvoyGjuicDnJTXbQXEcYw7qE/RKOJzlY4YT5jxglcKMkzirRvkboIapvRY
 itGA==
X-Gm-Message-State: AOAM5323Hq49qbVaVXhQoO1hWCg0LUt8DGdVKhVIgVbe42L7W3zTxkOM
 8Z8ADckXDRxHUkEUUdZNGikxRXAnPnQO/JGpZyfrws/58+xlflUSTdRbemz35zZbn4kTxYNceez
 vOzdN2AwQ/yrYaqd0xJTY5+f69XuV5io=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr3175255qkl.131.1611911505712; 
 Fri, 29 Jan 2021 01:11:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhe5nlVyLdlyGKJlieQCPH5LK6OlQJZkKwruXO5DctShQjoRNl+UTxII1A2cBwMpccoaBKliBsuEh2LSCdPKE=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr3175241qkl.131.1611911505509; 
 Fri, 29 Jan 2021 01:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20210129090728.831208-1-eperezma@redhat.com>
In-Reply-To: <20210129090728.831208-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 29 Jan 2021 10:11:09 +0100
Message-ID: <CAJaqyWeWUQnOwg4UgpqVZAwih_JG-eVtA5ZnRBMrtee5e+Z3LA@mail.gmail.com>
Subject: Re: [PATCH] vhost: Check for valid vdev in
 vhost_backend_handle_iotlb_msg
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2 of ("vhost-user: Check for iotlb callback in iotlb_miss") [1].

Starting a new series, since the title does not reflect the changes anymore=
.

Thanks!

[1] https://patchew.org/QEMU/20210127204449.745365-1-eperezma@redhat.com/

On Fri, Jan 29, 2021 at 10:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Not checking this can lead to invalid dev->vdev member access in
> vhost_device_iotlb_miss if backend issue an iotlb message in a bad
> timing, either maliciously or by a bug.
>
> Reproduced rebooting a guest with testpmd in txonly forward mode.
>  #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
>      dev=3Ddev@entry=3D0x55a0012f6680, iova=3D10245279744, write=3D1)
>      at ../hw/virtio/vhost.c:1013
>  #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
>      imsg=3D0x7ffddcfd32c0, dev=3D0x55a0012f6680)
>      at ../hw/virtio/vhost-backend.c:411
>  #2  vhost_backend_handle_iotlb_msg (dev=3Ddev@entry=3D0x55a0012f6680,
>      imsg=3Dimsg@entry=3D0x7ffddcfd32c0)
>      at ../hw/virtio/vhost-backend.c:404
>  #3  0x0000559fffeded7b in slave_read (opaque=3D0x55a0012f6680)
>      at ../hw/virtio/vhost-user.c:1464
>  #4  0x000055a0000c541b in aio_dispatch_handler (
>      ctx=3Dctx@entry=3D0x55a0010a2120, node=3D0x55a0012d9e00)
>      at ../util/aio-posix.c:329
>
> Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-backend.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 222bbcc62d..31b33bde37 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev =
*dev,
>  {
>      int ret =3D 0;
>
> +    if (unlikely(!dev->vdev)) {
> +        error_report("Unexpected IOTLB message when virtio device is sto=
pped");
> +        return -EINVAL;
> +    }
> +
>      switch (imsg->type) {
>      case VHOST_IOTLB_MISS:
>          ret =3D vhost_device_iotlb_miss(dev, imsg->iova,
> --
> 2.27.0
>
>


