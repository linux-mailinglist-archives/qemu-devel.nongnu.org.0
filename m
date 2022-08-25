Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE95A08DF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:31:42 +0200 (CEST)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6Oy-0003H7-Bg
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oR6EE-0006eG-BQ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oR6E4-0005UN-AL
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661408422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vw6ixnY7H9T37r5RIl03AwSqNRsrVut0NDqVVysFOpw=;
 b=Od9qAjRaI/RZ+7lFX6oK8JwmquQYmjtPxVSC6lO9stVdDubYq5tI6ovWGka8QQd1sS61lj
 J2Ido8b06U41QXR3y3E5h1AzxhPIFTmCv7RYGcUa+xPrhmAfMwrtmiH6qYLZ3y/WC3yXLD
 G0i/GsArjNuax+5Vq42vdmtOIZPJ9B4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-oHIdwDC-OZGr0RAYNF7o4A-1; Thu, 25 Aug 2022 02:20:21 -0400
X-MC-Unique: oHIdwDC-OZGr0RAYNF7o4A-1
Received: by mail-qv1-f71.google.com with SMTP id
 ly9-20020a0562145c0900b00496e3810e40so6914846qvb.12
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=vw6ixnY7H9T37r5RIl03AwSqNRsrVut0NDqVVysFOpw=;
 b=m38xhOVFaOmo8Uv+P/bN1bexW8TjaeaGSIQLw9ZqNKI+6a0XiNFw3GlR5sYd0ncGeC
 NPkj/MaXG4B6XRp+JAXfgZc/9i8T4+BaJ9jt24CIpKoGwir45GIgfvJiTMgVMU2Bxt35
 F4JhJ6mk82l/rH02RfCOfirCcjbSbdVWe5zUg/KUclGW2YHFq4dZaqldAL6tgtUMDCfX
 sTzB+3FCgSuFEN4MV+JfVtl2I7zmfnMJYga7DgBYeN0+YfTeTxIrrOJPzPUzTWEIkykk
 /JmsuSFWMI7+/C1hezLn43FFjlWBukhq5sdmfw1HbAG4qUJGlRjf+eYBh2u1HLJ2lokq
 gyrw==
X-Gm-Message-State: ACgBeo3OcnWC75Adgx4ZMjqDlw5gvJhI1feyCZ8NXqEAI258HZBFbZZM
 KmfVdF72aFiAKOl1fA+wf7+PWOK5Lt1aGD+QFl/Blgip6UPQlayzvM8OJViZe2KYRuVYVvlTZTh
 s9dL57uDeDHbZH9vEMJPu6LNJnSk2dew=
X-Received: by 2002:a05:622a:4204:b0:344:e16c:e597 with SMTP id
 cp4-20020a05622a420400b00344e16ce597mr2409743qtb.592.1661408421448; 
 Wed, 24 Aug 2022 23:20:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6U+/fFY4zG4CIOasKrgvGfGbjILcSKMfbu6i30asVBeDC0FL8cTOopFhBqTPXLz7P9FHoVRAlelQi931PP+W4=
X-Received: by 2002:a05:622a:4204:b0:344:e16c:e597 with SMTP id
 cp4-20020a05622a420400b00344e16ce597mr2409725qtb.592.1661408421265; Wed, 24
 Aug 2022 23:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
In-Reply-To: <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 25 Aug 2022 08:19:45 +0200
Message-ID: <CAJaqyWfemKiDHSU5ujHhJrNjMgeD2i-7uYA0y3fUSC0fuE7bYA@mail.gmail.com>
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, Aug 25, 2022 at 2:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 8/23/2022 9:27 PM, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >> It was returned as error before. Instead of it, simply update the
> >> corresponding field so qemu can send it in the migration data.
> >>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> ---
> >
> >
> > Looks correct.
> >
> > Adding Si Wei for double check.
> Hmmm, I understand why this change is needed for live migration, but
> this would easily cause userspace out of sync with the kernel for other
> use cases, such as link down or userspace fallback due to vdpa ioctl
> error. Yes, these are edge cases.

The link down case is not possible at this moment because that cvq
command does not call virtio_net_handle_ctrl_iov. A similar treatment
than mq would be needed when supported, and the call to
virtio_net_set_status will be avoided.

I'll double check device initialization ioctl failure with
n->curr_queue_pairs > 1 in the destination, but I think we should be
safe.

> Not completely against it, but I
> wonder if there's a way we can limit the change scope to live migration
> case only?
>

The reason to update the device model is to send the curr_queue_pairs
to the destination in a backend agnostic way. To send it otherwise
would limit the live migration possibilities, but sure we can explore
another way.

Thanks!


