Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BC5113C0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:48:24 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdLT-0000ym-2P
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njdC0-0001nW-Ma
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njdBx-0006t8-S3
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651048710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMkXjO0fydy9bbdBaujZLZepSkwfjiEMCNiNj7tf8Rg=;
 b=Ewi9IKZLEpL8F0QXax8aoa/WM+7b0YUBFdPE04JnXY0HiqCsziMn/PLK2Pzu8ctmZqcqAE
 YDw9mC7Zyisv8F9Pvjed15b8EhLZLecdT3ufyguMKr0JgqR9yUv2jF9o6ElgTVEZwZXfrf
 mWgqcNvoE/si0aNPm2GnP9RkempdiM0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-iTmi9KR0MCyAuoUeHWsbzw-1; Wed, 27 Apr 2022 04:38:29 -0400
X-MC-Unique: iTmi9KR0MCyAuoUeHWsbzw-1
Received: by mail-lf1-f69.google.com with SMTP id
 c33-20020a05651223a100b00471fc6795dfso477028lfv.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TMkXjO0fydy9bbdBaujZLZepSkwfjiEMCNiNj7tf8Rg=;
 b=jrfp7FI1TzxrQYJniGFEMOu/e/jAHeGmkMA4NtIwiaV/JfENRyLcM1vtwLK6mAKoZG
 XHUGdYtUPzfTOXowMT1/V23thtKumEe8VuJhG1WGovCFbdW3KArzTroXqxQAWD85b76m
 IVHA4jEF2u/4WbSUPhPnKvXZn+6+u2Vjxr8ylO7ztvQetIF0Z2ceCNuoQ9U6pRPkKCd6
 4z+4ne1uDGNiIP7tbHQGS8CdH3/0m7XLGCwW67X02aZ4ILkJzpdSrQBcIgcbZSX3hO+u
 Iqb3BEsJl2cNnRtXFVl0kLdnnpj8cyzu1APJ8J/BFwQFmICjRap8Cdyij0jFrZd1KjAe
 iQHg==
X-Gm-Message-State: AOAM5333eSSb2Nj2EDRvllySb3N5+dkLpxfnh9iHuYhzURj4UN27JPym
 iwGOWN/I4ufAMQfvvgTjB0FgOkAc52RtCAJeVYLqfmMBlxquGHuovm8s6R3JI9wcqOwmSTUFSBw
 GBrFhQDevdODEnCXOrNry5dAsjShQ7mg=
X-Received: by 2002:a05:651c:892:b0:249:9e23:15 with SMTP id
 d18-20020a05651c089200b002499e230015mr17614650ljq.492.1651048708072; 
 Wed, 27 Apr 2022 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY5CAb+2V/RU5FXtJukjWM15g1UK7zbHvdO0pgzb8UGp6O7huDfL25lJ2UWeB+xF7kAiZNVHLKYGGx2g5w+Pk=
X-Received: by 2002:a05:651c:892:b0:249:9e23:15 with SMTP id
 d18-20020a05651c089200b002499e230015mr17614637ljq.492.1651048707814; Wed, 27
 Apr 2022 01:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
 <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
In-Reply-To: <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Apr 2022 16:38:16 +0800
Message-ID: <CACGkMEv-sbYsA42rp-58ea0HnE1p12SgS=p2bE0xFni5qXyRPA@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
To: Si-Wei Liu <si-wei.liu@oracle.com>
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 4:30 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 4/26/2022 9:28 PM, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/3/30 14:33, Si-Wei Liu =E5=86=99=E9=81=93:
> >> Hi,
> >>
> >> This patch series attempt to fix a few issues in vhost-vdpa
> >> multiqueue functionality.
> >>
> >> Patch #1 is the formal submission for RFC patch in:
> >> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/c3e931e=
e-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQO=
M4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqg3ysNsk$
> >>
> >> Patch #2 and #3 were taken from a previous patchset posted on
> >> qemu-devel:
> >> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/2021111=
7192851.65529-1-eperezma@redhat.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTA=
Un88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqc3mXqDs$
> >>
> >> albeit abandoned, two patches in that set turn out to be useful for
> >> patch #4, which is to fix a QEMU crash due to race condition.
> >>
> >> Patch #5 through #7 are obviously small bug fixes. Please find the
> >> description of each in the commit log.
> >>
> >> Thanks,
> >> -Siwei
> >
> >
> > Hi Si Wei:
> >
> > I think we need another version of this series?
> Hi Jason,
>
> Apologies for the long delay. I was in the middle of reworking the patch
> "virtio: don't read pending event on host notifier if disabled", but
> found out that it would need quite some code change for the userspace
> fallback handler to work properly (for the queue no. change case
> specifically).

We probably need this fix for -stable, so I wonder if we can have a
workaround first and do refactoring on top?

> I have to drop it from the series and posted it later on
> when ready. Will post a v2 with relevant patches removed.

Thanks

>
> Regards,
> -Siwei
>
> >
> > Thanks
> >
> >
> >>
> >> ---
> >>
> >> Eugenio P=C3=A9rez (2):
> >>    virtio-net: Fix indentation
> >>    virtio-net: Only enable userland vq if using tap backend
> >>
> >> Si-Wei Liu (5):
> >>    virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
> >>    virtio: don't read pending event on host notifier if disabled
> >>    vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
> >>    vhost-net: fix improper cleanup in vhost_net_start
> >>    vhost-vdpa: backend feature should set only once
> >>
> >>   hw/net/vhost_net.c         |  4 +++-
> >>   hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
> >>   hw/virtio/vhost-vdpa.c     |  2 +-
> >>   hw/virtio/virtio-bus.c     |  3 ++-
> >>   hw/virtio/virtio.c         | 21 +++++++++++++--------
> >>   include/hw/virtio/virtio.h |  2 ++
> >>   net/vhost-vdpa.c           |  4 +++-
> >>   7 files changed, 45 insertions(+), 16 deletions(-)
> >>
> >
>


