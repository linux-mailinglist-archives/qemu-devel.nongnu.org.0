Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D972BB59E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:37:21 +0100 (CET)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgCDg-00005R-Vs
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgCCC-00084y-Th
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgCCA-00041V-8l
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605900945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaGyevx9bKbJa/Uo/GEmlNDAH9YfZ7oI6laQDA+pda0=;
 b=dvkn9ZfO4Mus2kZTp+oQRHSOGY8/M7o2hD2pvcjDx+4iCgX6pvxSNCQPravPpv/KSbL4SO
 xQ/Spk8Pp5VEd9gOru7b44HMBZtVynOeTf1Nv3ugXdcNWNhbVNr6IIF0LkEHXuqXrGYhcQ
 XcGDVAORxENWthLJjMdUUSfYl1qsKrU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-76TeTUUrPlSSDbfQD0606A-1; Fri, 20 Nov 2020 14:35:42 -0500
X-MC-Unique: 76TeTUUrPlSSDbfQD0606A-1
Received: by mail-qt1-f197.google.com with SMTP id z8so8195123qti.17
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 11:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kaGyevx9bKbJa/Uo/GEmlNDAH9YfZ7oI6laQDA+pda0=;
 b=uC1DiZP2KgV1LRwQl7pn/WCbIaTx/Cd6fZJvLh+Jv5p3n5CGy0vDI5jysomq+pFJu+
 cxjsRS00aucHv0ZAtCLuOF6+V0sv7cSTkfGPD68M3xcYyTE/y/bwpoUnxlRwe4sGSt9b
 +aBWa2LC1ChMHTRnr69CTJ6CjujyyQaW7QnCuZPOvH0ejDZrOFXekxiD9Tk5cX2M4NXQ
 uhArAKGpy+5S4LpzlvjEFiqdAj3vqGYibwOn4KwJmBoVXjXl8aVQO6crbcp4WXNl9RnG
 GV6Wbeoi0HjevE64rnKR2lc3kfnaQKZTorN1HHwiWLAw0u90QiOPZqhIPGn4qRx7Uq0h
 PQug==
X-Gm-Message-State: AOAM5323qy8qpKj+RQGSUZ7W5KXeE+CNKbME4v5aP0orN0M4GOL3p2SX
 cpITZ1AQhk+jD1Abeih97eaBpc+OllwjmiQjXhjuxC0fS61m8D+TpPczWtZckJ3HVCXtluiIeY1
 cloBgZvJjvDnMWpyLZOTQxOAFYHAotPQ=
X-Received: by 2002:ad4:4051:: with SMTP id r17mr13579864qvp.39.1605900942256; 
 Fri, 20 Nov 2020 11:35:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEWE3AxwjU9e+BlJSEt7dnIJDH7qPT0GZiFEk0NSR9+fpXLCgv65B/saA/egK3fv56fMNdOMAejiJ325PXQg8=
X-Received: by 2002:ad4:4051:: with SMTP id r17mr13579837qvp.39.1605900942042; 
 Fri, 20 Nov 2020 11:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-26-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-26-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 20 Nov 2020 20:35:06 +0100
Message-ID: <CAJaqyWdad0x5R=VpGazbroZwd_Rig+n5kEJwgv3MY+WweUCYAA@mail.gmail.com>
Subject: Re: [RFC PATCH 25/27] vhost: Do not commit vhost used idx on
 vhost_virtqueue_stop
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 8:12 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> ... if sw lm is enabled
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index cb44b9997f..cf000b979f 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1424,17 +1424,22 @@ static void vhost_virtqueue_stop(struct vhost_dev=
 *dev,
>      struct vhost_vring_state state =3D {
>          .index =3D vhost_vq_index,
>      };
> -    int r;
> +    int r =3D -1;
>
>      if (virtio_queue_get_desc_addr(vdev, idx) =3D=3D 0) {
>          /* Don't stop the virtqueue which might have not been started */
>          return;
>      }
>
> -    r =3D dev->vhost_ops->vhost_get_vring_base(dev, &state);
> -    if (r < 0) {
> -        VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, r);
> -        /* Connection to the backend is broken, so let's sync internal
> +    if (!dev->sw_lm_enabled) {
> +        r =3D dev->vhost_ops->vhost_get_vring_base(dev, &state);
> +        if (r < 0) {
> +            VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, =
r);
> +        }
> +    }
> +
> +    if (!dev->sw_lm_enabled || r < 0) {

This test should actually test for `dev->sw_lm_enabled`, not for negation.

> +        /* Connection to the backend is unusable, so let's sync internal
>           * last avail idx to the device used idx.
>           */
>          virtio_queue_restore_last_avail_idx(vdev, idx);
> --
> 2.18.4
>


