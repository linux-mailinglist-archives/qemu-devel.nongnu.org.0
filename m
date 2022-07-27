Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217C581F5B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 06:58:45 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGZ88-0007GP-9T
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 00:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ5i-0004Jf-2a
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ5e-0000yH-Rg
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658897770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU7TFJZS1q3Mj0P8d19/qGNxpvpAv6O1ACR+T60dq/M=;
 b=DT8vWb6CbjbP00EmZJ/qBxxsw87PsjLK6/RuMBi+QRFL1bUVvv8a6CTe7RBZ6/23RXLa58
 tzRwhe3ZMjDIeetK8E3HleRiR/aiBeaiPA0c1+G+Gd9ezTFFu5coQIHzf1RFL3uauWEwlj
 hAfpzEiiz/a2DI7s8kp9vUqKj+Oy26k=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-FkCVcgOqNCSMWVOK-TU1nQ-1; Wed, 27 Jul 2022 00:56:08 -0400
X-MC-Unique: FkCVcgOqNCSMWVOK-TU1nQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 bd2-20020a05651c168200b0025dcd868408so3582371ljb.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 21:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kU7TFJZS1q3Mj0P8d19/qGNxpvpAv6O1ACR+T60dq/M=;
 b=n0Dact0vxOPWtmtQJ95vyhZHIKC1a5Ufs4fxGoHCCod9M/bW6eyjSEpjyNcuuSmYyf
 qQDTVkF+o33XydlsLUV5e8fIoJf6e+nd1Fop+5zOgVANGKrbnbO32sS/DV9mVwEKBya2
 reHTn4avYnHjNKwS8TVqEJoYhhWZxfoDN68xNr0tNz15RT2yx0O3slQMAh2bwGeBa3B8
 yaSAnzFySG8KDg25/E1IQb0b+fevdhaRm+shIfTIMLSrr4On4Cvon29Hg2+fyD8rLEwY
 t8Id/knwtSFLnLTVfXE3IEQ21NfsOjK86JAxHu6vMmLLJtdgqCgyS7DNjDSD3IUihaQd
 W4Jw==
X-Gm-Message-State: AJIora9tyXtRcS31mCStkegNWWssepLyyPnlDbUc27vN/Fs3us9YCfGo
 Y9VDuSt4BbSRVRlX4w+5pwQwnNwNyYlvPENHT5PRTqiXMdkItlROpFaJE41Aqe2ffSlAGN7E7FR
 fAzCoYBZPyEkkU5bXe0cFB5XNZ8Bt8dY=
X-Received: by 2002:a05:6512:2394:b0:48a:7cfd:72ac with SMTP id
 c20-20020a056512239400b0048a7cfd72acmr7223054lfv.411.1658897766246; 
 Tue, 26 Jul 2022 21:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upyADc+bqSRLZk1ajG7DgdkIGdEh6asrzLQR88Tn/UcBu6sANKAbIlnW1f8l7BkfFLL8iDCzUBP+DNRone/UE=
X-Received: by 2002:a05:6512:2394:b0:48a:7cfd:72ac with SMTP id
 c20-20020a056512239400b0048a7cfd72acmr7223048lfv.411.1658897766055; Tue, 26
 Jul 2022 21:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <8bf7574d8e133d3fa7e8b09f4deb59369916774a.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b078fc30-0c8b-b56c-e320-c89e6376fb21@redhat.com>
 <93985df7-7d5f-782e-10ed-7494f0806d22@linux.alibaba.com>
In-Reply-To: <93985df7-7d5f-782e-10ed-7494f0806d22@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Jul 2022 12:55:54 +0800
Message-ID: <CACGkMEsTcoLQYJVxT8J3yDu007zan-3OsExRHFe3DCsZ1_y1=w@mail.gmail.com>
Subject: Re: [PATCH 08/16] vhost: add op to enable or disable a single vring
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, hengqi@linux.alibaba.com
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

On Tue, Jul 26, 2022 at 2:39 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/26 11:49, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >> The interface to set enable status for a single vring is lacked in
> >> VhostOps, since the vhost_set_vring_enable_op will manipulate all
> >> virtqueues in a device.
> >>
> >> Resetting a single vq will rely on this interface. It requires a
> >> reply to indicate that the reset operation is finished, so the
> >> parameter, wait_for_reply, is added.
> >
> >
> > The wait reply seems to be a implementation specific thing. Can we
> > hide it?
> >
> > Thanks
> >
> I do not hide wait_for_reply here because when stopping the queue, a
> reply is needed to ensure that the message has been processed and queue
> has been disabled.

This needs to be done at vhost-backend level instead of the general vhost c=
ode.

E.g vhost-kernel or vDPA is using ioctl() which is synchronous.

>
> When restarting the queue, we do not need a reply, which is the same as
> what qemu does in vhost_dev_start().
>
> So I add this parameter to distinguish the two cases.
>
> I think one alternative implementation is to add a interface in
> VhostOps: queue_reset(). In this way details can be hidden. What do you
> think of this solution? Does it look better?

Let me ask it differently, under which case can we call this function
with wait_for_reply =3D false?

Thanks

>
> Thanks
>
> >
> >>
> >> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> ---
> >>   include/hw/virtio/vhost-backend.h | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/hw/virtio/vhost-backend.h
> >> b/include/hw/virtio/vhost-backend.h
> >> index eab46d7f0b..7bddd1e9a0 100644
> >> --- a/include/hw/virtio/vhost-backend.h
> >> +++ b/include/hw/virtio/vhost-backend.h
> >> @@ -81,6 +81,9 @@ typedef int (*vhost_set_backend_cap_op)(struct
> >> vhost_dev *dev);
> >>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
> >>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
> >>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx)=
;
> >> +typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *dev=
,
> >> +                                                int index, int enable=
,
> >> +                                                bool wait_for_reply);
> >>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> >>                                            int enable);
> >>   typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
> >> @@ -155,6 +158,7 @@ typedef struct VhostOps {
> >>       vhost_set_owner_op vhost_set_owner;
> >>       vhost_reset_device_op vhost_reset_device;
> >>       vhost_get_vq_index_op vhost_get_vq_index;
> >> +    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
> >>       vhost_set_vring_enable_op vhost_set_vring_enable;
> >>       vhost_requires_shm_log_op vhost_requires_shm_log;
> >>       vhost_migration_done_op vhost_migration_done;
>


