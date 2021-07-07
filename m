Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F33BF0C4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 22:32:20 +0200 (CEST)
Received: from localhost ([::1]:47812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1EDT-0004GG-Qi
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 16:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1ECX-000335-JC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:31:21 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1ECS-0007Q3-Od
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:31:21 -0400
Received: by mail-io1-xd33.google.com with SMTP id y8so5271060iop.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DjEBOJ1E1qX03Q+pn/HmFwSv8DIfSrON60FHdg2Bhb8=;
 b=ZRLqR+QMAL1+jnoKiAiZXI8f92/oEsMWDdvU8WxtWT79dSKMC191tqaBdDSznma/+r
 jK5PZEKYWspOmR/HYYDhHhWnzFfv0/AFG2o1nCmCxcRVSJrK2rpYz+bP3XVtU9SlGo2F
 sxCN0vH2u8jmNMuBwS1szEUNgCiU5F2HdSm7m+6l3QewC+MiaYSZr1Qg7G3v+LimVR9S
 iXO3y3f6yLv81FXok+oSobqvY/dvxJaCpMfWUNC4/Ww2W/Ko+QEzVmimfpl9xB56/PB6
 sQrXV3cXjG0Lo0ZE6QvJXJThokxowPdcziRpsZUnawOnr97j2jmZKfUC9c+izYt2StgU
 g79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DjEBOJ1E1qX03Q+pn/HmFwSv8DIfSrON60FHdg2Bhb8=;
 b=LA7jkqcqkDNEk7x7tFHI54DERXjZFGVdleLcwy8mEBeMVldR7TZYV8MX6+9MxXL3EE
 pvNS4dTgbeB9dlxjgFWd8oL7tfmEnSCEKMBtv+6JwvpzU+7coHPS3tiyf8Nw+RYrhpxG
 1lVjMyZS5hnqXV83fkDUd+hov6eIdhv9ZL6GroBzTLF+si4HBP9Bd61efsAp3BTTymwv
 sEvmNjBXH4V03FYO8h/zZFXBJxu3CxdHVU7DvJw37Hp1kkYbuuGDNPA/TqU82I8gqfkW
 yl50NT8HhxKwNYC/57AfLbk0ikXoW5dqq81UMnOZfDjgRt/yk06L0L3ZSN7lELdw1j51
 fX5A==
X-Gm-Message-State: AOAM533Q0yi6KR/+X8oHjNBumE5M1S+fD3oX1yVYk+xEvL9vjCWmNHRQ
 VU6v47vxF/BYE01IKuro5WUV2CvSdENFZ7kSIKc=
X-Google-Smtp-Source: ABdhPJxhOo3rdTC6BiN5WLeKvJ6JHmgudLSVm3j4c6LPt6AVF9ItXp5NCDdnbavYI3iUvhuLIANB5WHfVE5xURu5pCo=
X-Received: by 2002:a5d:9c96:: with SMTP id p22mr16029731iop.67.1625689870752; 
 Wed, 07 Jul 2021 13:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-2-david@redhat.com>
In-Reply-To: <20210707140655.30982-2-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 7 Jul 2021 22:30:59 +0200
Message-ID: <CAM9Jb+henYoJx45f1n8WmYjUf_o34VevQmyMNp2S+VdOeqjoAQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] migration/postcopy-ram: define type for "struct
 PostcopyNotifyData"
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Let's define a proper type, just as we do for PrecopyNotifyData already.
>
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Alexander Duyck <alexander.duyck@gmail.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/vhost-user.c   | 2 +-
>  migration/postcopy-ram.c | 2 +-
>  migration/postcopy-ram.h | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 1ac4a2ebec..42dad711bf 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1827,9 +1827,9 @@ static int vhost_user_postcopy_end(struct vhost_dev=
 *dev, Error **errp)
>  static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
>                                          void *opaque)
>  {
> -    struct PostcopyNotifyData *pnd =3D opaque;
>      struct vhost_user *u =3D container_of(notifier, struct vhost_user,
>                                           postcopy_notifier);
> +    PostcopyNotifyData *pnd =3D opaque;
>      struct vhost_dev *dev =3D u->dev;
>
>      switch (pnd->reason) {
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 2e9697bdd2..ee4e1c7cf5 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -69,7 +69,7 @@ void postcopy_remove_notifier(NotifierWithReturn *n)
>
>  int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
>  {
> -    struct PostcopyNotifyData pnd;
> +    PostcopyNotifyData pnd;
>      pnd.reason =3D reason;
>      pnd.errp =3D errp;
>
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 6d2b3cf124..01829c3562 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -125,10 +125,10 @@ enum PostcopyNotifyReason {
>      POSTCOPY_NOTIFY_INBOUND_END,
>  };
>
> -struct PostcopyNotifyData {
> +typedef struct PostcopyNotifyData {
>      enum PostcopyNotifyReason reason;
>      Error **errp;
> -};
> +} PostcopyNotifyData;
>
>  void postcopy_add_notifier(NotifierWithReturn *nn);
>  void postcopy_remove_notifier(NotifierWithReturn *n);
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

