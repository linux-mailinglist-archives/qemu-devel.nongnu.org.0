Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B7484D1E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:38:01 +0100 (CET)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4y3k-0008Oz-4P
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4y20-0007e5-B6
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4y1w-0006f8-7N
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641357367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NqR8ED8a3mZhihMS/EClY8GBs0+W/FRDkPe+QyQJhgc=;
 b=GIroKpmmCYUPKQkqcl/+c5rNMtxD5fM/5/4sTI6yV2m30Q3HO8CPduaUWyedqOEDtZaXUG
 ROKyZn7QxtG+YE5uDgntHT07WYR2f5X6ZG1KrRUc75pKG59pqbmmOn7ZEUdxBMyirx49wZ
 khNMXZtLc+cLcOir84HrU4XUwC4c/1o=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-Ry8YdHtUOFqv430eQktzxw-1; Tue, 04 Jan 2022 23:36:06 -0500
X-MC-Unique: Ry8YdHtUOFqv430eQktzxw-1
Received: by mail-lf1-f72.google.com with SMTP id
 28-20020ac24d5c000000b00425c507cfc0so8776493lfp.20
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 20:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqR8ED8a3mZhihMS/EClY8GBs0+W/FRDkPe+QyQJhgc=;
 b=l6O0Vtf9tgPMKzqDF/C7exsFG/360K63YJ/fb5XWAT3LVSkIMNMUSbJXotUCFvZGFD
 M/PMWtsD3s3hBFjIVkY8p295SfUb2JwPS0Q96h5/CBF/cpwNi0DPPDJdjTAxjPcTLP5T
 MSdKCqxQKvWWjQQS1UHZNBhGdEVJ3MeBe5DaiqtpO+MbBx6LSlETRMR7EIcoiMaeEABw
 RQ/d9OvmSq7m4mWL0trL/Mo0FSb51Ll239/95Wnku6kPmpBk0PvBsizeNai9D0r89Vjd
 /UtlThKqj74pON+MfGo24/O80mgHPL+cEglzrGn+Uj2HkC8poJhsAdXW3Dr3ZFEpCNF7
 N34g==
X-Gm-Message-State: AOAM532jfhYGvsUrK5DlXiVi6Brak252caw8E5+L7o5WbbmjZaD3hyod
 +a4lKHactYIS3gi3/QJxwtz56I9uhz0iN8h7ugzqugDBOjuvqBzaMWOMiD5wGb/omjYCl4Mh6xT
 ASo5T2oxDZi1uugZ3RhUhiiqtdSqwimk=
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr43825646ljn.369.1641357364413; 
 Tue, 04 Jan 2022 20:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPua6TMjo7QUddElz80SsvjQPvcCQmJ+MkecAeA8mJKZpM8gk0peNOvoWW4R3xOrPDYjGQRFhwOTSYmJooyfM=
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr43825631ljn.369.1641357364188; 
 Tue, 04 Jan 2022 20:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
In-Reply-To: <20220105005900.860-3-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Jan 2022 12:35:53 +0800
Message-ID: <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, huangzhichao@huawei.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> To support generic vdpa deivce, we need add the following ioctls:
> - GET_VECTORS_NUM: the count of vectors that supported

Does this mean MSI vectors? If yes, it looks like a layer violation:
vhost is transport independent.  And it reveals device implementation
details which block (cross vendor) migration.

Thanks

> - GET_CONFIG_SIZE: the size of the virtio config space
> - GET_VQS_NUM: the count of virtqueues that exported
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  linux-headers/linux/vhost.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> index c998860d7b..c5edd75d15 100644
> --- a/linux-headers/linux/vhost.h
> +++ b/linux-headers/linux/vhost.h
> @@ -150,4 +150,14 @@
>  /* Get the valid iova range */
>  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
>                                              struct vhost_vdpa_iova_range)
> +
> +/* Get the number of vectors */
> +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
> +
> +/* Get the virtio config size */
> +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
> +
> +/* Get the number of virtqueues */
> +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
> +
>  #endif
> --
> 2.23.0
>


