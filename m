Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEA6ECFE7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 16:06:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwof-0003Zn-Su; Mon, 24 Apr 2023 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pqwod-0003ZZ-Kv
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 10:05:15 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pqwoc-0000jM-4l
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 10:05:15 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-95316faa3a8so816663966b.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682345112; x=1684937112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEwXlhAcDN7BZ0bLy63JeAxBSyTbRz/et30vi8ZsCws=;
 b=Kk2NN7b93RJKAn0RjX0p1zwBpPAj1RqkJ+GTBZ0kQu7HZ1RJNjqWno403HizMNBviS
 RRGDyQfP/YUvw6gA3L0F5TBfYB6+DFsEVijiuonim9TOvr7F8gmg9+JtA40qh8yIvz2g
 Jk1aZiEcVcr+I4a0TUOOZiA9Nv2kZ0PlX9ghvyxELiCajm76scIsoiznBoWd6qd7oM0t
 E71a3YqXpJGz6WEWNXjvww6cXOIN9hu7WZ3rS1/PzoA4vc97DRb/bzzuy+NhcHvAif6y
 M7RWrmDYcBYLT6Tsi+3G7udI20DU1OrSlNalNNL+p/zzY3RxP4Da6zFmMy5LYQ24kLWR
 jGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682345112; x=1684937112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEwXlhAcDN7BZ0bLy63JeAxBSyTbRz/et30vi8ZsCws=;
 b=cAdiuQVgSl+u9HXzvP+b8khDNuCZd3pTmvSfj5oSw4kEBOxu7+koBUJwGwHJkKEnYt
 f5N2+AaiOgFxLL16EsPfidEVkDaQgydgR+LimfEN+4SqcXDqmfBhEI3TSeuBJrw0UI/Q
 Kz6c69VPJQyZMVgWOFSa5O7Yok3pBrNgoiLUG56lJT7n/7rNoCRS4cDqwgYfiRcS50jv
 1OKk73JkwVsTAyIz0lOZhGf4Dj3Nf5AeT1HzXRV59MBlvU/79w7+eUoOywKsnjsM4z55
 iAxmKrFUjbSowHPQc/7Yiz/zwZoLwo+JGdUK3xC01PZuQhQL/T7ZHVzJDdMdyCuBWZQN
 zudg==
X-Gm-Message-State: AAQBX9erDFKvnPjrVYoDlRreM9d4O3ZqzFQsxAEnU+Z+ePqSsD0TG45/
 AW/A7oStH0uYZl5fmiy2T0nqYPI6/Y+ymteRHvk=
X-Google-Smtp-Source: AKy350bLvG8ENsRyfQ2l3KMLNo+78O23nepJlY7Wy9B3XYW3MMvawdqjmun9k3/R959ZIWt79TLEm0a27D+nU58RUcU=
X-Received: by 2002:a17:906:fb18:b0:94f:2020:b5fb with SMTP id
 lz24-20020a170906fb1800b0094f2020b5fbmr8558205ejb.27.1682345111381; Mon, 24
 Apr 2023 07:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681819697.git.ray90514@gmail.com>
 <CAJnb5S18+w9QX+W7CjnmB_eeo9RXsE-43otg1XRrvZJXP7EypA@mail.gmail.com>
 <CAJaqyWdP2b7+cQexvDM12+6TkJ+PDZok=xx61U52HNj=U8FPLQ@mail.gmail.com>
In-Reply-To: <CAJaqyWdP2b7+cQexvDM12+6TkJ+PDZok=xx61U52HNj=U8FPLQ@mail.gmail.com>
From: Shao-Chien Chiang <ray90514@gmail.com>
Date: Mon, 24 Apr 2023 22:05:00 +0800
Message-ID: <CAJnb5S3A_w+aS4m7mG5iiLhAatNQ8PkENaePYNYEEEWVuVxYqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] vhost-vdpa: cache Virtio states
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ray90514@gmail.com; helo=mail-ej1-x632.google.com
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

Hi,
The "devices" means there are multiple vhost_dev.
After further research, I found the problem only happens in status.
Vhot-vdpa layer set status ACKNOWLEDGE,  DRIVER, and FEATURES_OK
only once by checking vhost_vdpa_first_dev().
However, it set status DRIVER_OK only once by checking if the device
is the last,
whose code is dev->vq_index + dev->nvqs !=3D dev->vq_index_end in
vhost_vdpa_dev_start().
I think these are the causes of the problem.
Thank you!

On Mon, Apr 24, 2023 at 3:04=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Sat, Apr 22, 2023 at 8:39=E2=80=AFAM Shao-Chien Chiang <ray90514@gmail=
.com> wrote:
> >
> > Hi,
> >
> > I found a problem about cache.
> >
> > If there are several devices operating the same backend device, the
> > cache might be inconsistent.
> >
>
> Hi Shao-Chien,
>
> What do you mean by "several devices operating the same backend
> device". The guest only sees "one virtio device per vhost-vdpa backend
> device".
>
> Thanks!
>
> > I think we could handle this by checking if a device is the first
> > device, but I'm not sure it will be feasible.
> >
> > Is there any better approach to this problem?
> >
> > Thank you!
> >
>

