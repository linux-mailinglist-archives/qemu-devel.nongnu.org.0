Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026E4FB674
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 10:54:11 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndpoI-0005YK-8l
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 04:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ndpm0-000495-JA
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 04:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ndplx-0007xa-PE
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 04:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649667105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ImoYsjBpLKtFqFhrxKuR+D05EE0MCRsTx+BPCwSNT0=;
 b=JBHPc3ga5C/kXQ8w2aWcQGBKnHRQkgG9zZ/AtOimfxrNL0CnrVLFuuxpiwnzbQhLsGbpJ3
 Ltu1Ia1IxVlzanDNXbtv88EEVtXzaVP0+5F6yuEPeYCnhMXzUeOqYq/uT5lLYzP0znddT2
 THRpMEvoXSqENpf8F9eWhX5Ak+E5jfk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-t8fNhYoPMXyziMjuNeJ1dA-1; Mon, 11 Apr 2022 04:51:43 -0400
X-MC-Unique: t8fNhYoPMXyziMjuNeJ1dA-1
Received: by mail-lj1-f197.google.com with SMTP id
 p9-20020a2ea4c9000000b0024b62f1ddebso839945ljm.23
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 01:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ImoYsjBpLKtFqFhrxKuR+D05EE0MCRsTx+BPCwSNT0=;
 b=VutBWi5dhOOWyLOaqhehcKYpp/HMUGwPADI4we4wimSkCkLAt/dadydcuq88WR630p
 JhV/KHC4XdJPizgtnGvs92Eq0+ws5PU13kQ6dEyayv30YUtEt4irkCPUH/ehlvtBoD6R
 1p7zc7cxproddPxwalm9zY9mewRJP2cjWukkRX51xBS+SzqZMSzidpYng3eaH8bGCTEJ
 IXcsbkNM4vKVY3c/Z6NAQt884yjMd6aYDT+kDzOcCPA2IGHmTrB3JIFpHFhZVqRaNKrm
 NiL0J7wNRj1y9pGRuf/svdVl8EnyTMqUZtD87hAmrRK2ggGc0/D+OtyovjW3NlkMqvpS
 eNYA==
X-Gm-Message-State: AOAM531+J4uykNmNnZjS+zX9h97QU8SnF7oROz7MBL6kZG3FlxAuiG9r
 i1BoKOBmc3jnxO6QoOaywhBwvoOAZARVIS6swNnRe1SauCaA3Gqh1zJp4zTfdkSN1jWOaEBTaQZ
 QvE/u2PI+MEvPS2G+y/CKpSDIv7g0J/M=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr19852390ljq.300.1649667102150; 
 Mon, 11 Apr 2022 01:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytOk/SMOwwA3hPfZwiLF6UL22pNyCwtSzvv6fwtHLXGCfA3+HjN1Jb5ja5LXGQo3lMdiny9b0uXkUYHDbgr+o=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr19852376ljq.300.1649667101760; Mon, 11
 Apr 2022 01:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
 <c8e8459d-32b5-55ff-44f4-1f03edb8a597@redhat.com>
 <6247dc22.1c69fb81.4244.a88bSMTPIN_ADDED_BROKEN@mx.google.com>
 <8740bef3-bf55-ac94-a2a2-a0776ae5f5b6@redhat.com>
 <4308c7ce-b370-654e-1d04-42cd4e11b647@archeros.com>
 <931be929-55c7-8856-3345-c132a228cf68@oracle.com>
In-Reply-To: <931be929-55c7-8856-3345-c132a228cf68@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 11 Apr 2022 16:51:30 +0800
Message-ID: <CACGkMEs2z4bpr7i0_zJsabXSti_3BtLTTGue3T24YvHng-osCQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Michael Qiu <qiudayu@archeros.com>, Cindy Lu <lulu@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 9, 2022 at 1:17 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 4/8/2022 1:38 AM, Michael Qiu wrote:
> >
> >
> > =E5=9C=A8 2022/4/7 15:35, Jason Wang =E5=86=99=E9=81=93:
> >>
> >> =E5=9C=A8 2022/4/2 =E4=B8=8B=E5=8D=881:14, Michael Qiu =E5=86=99=E9=81=
=93:
> >>>
> >>>
> >>> On 2022/4/2 10:38, Jason Wang wrote:
> >>>>
> >>>> =E5=9C=A8 2022/4/1 =E4=B8=8B=E5=8D=887:06, Michael Qiu =E5=86=99=E9=
=81=93:
> >>>>> Currently in vhost framwork, vhost_reset_device() is misnamed.
> >>>>> Actually, it should be vhost_reset_owner().
> >>>>>
> >>>>> In vhost user, it make compatible with reset device ops, but
> >>>>> vhost kernel does not compatible with it, for vhost vdpa, it
> >>>>> only implement reset device action.
> >>>>>
> >>>>> So we need seperate the function into vhost_reset_owner() and
> >>>>> vhost_reset_device(). So that different backend could use the
> >>>>> correct function.
> >>>>
> >>>>
> >>>> I see no reason when RESET_OWNER needs to be done for kernel backend=
.
> >>>>
> >>>
> >>> In kernel vhost, RESET_OWNER  indeed do vhost device level reset:
> >>> vhost_net_reset_owner()
> >>>
> >>> static long vhost_net_reset_owner(struct vhost_net *n)
> >>> {
> >>> [...]
> >>>         err =3D vhost_dev_check_owner(&n->dev);
> >>>         if (err)
> >>>                 goto done;
> >>>         umem =3D vhost_dev_reset_owner_prepare();
> >>>         if (!umem) {
> >>>                 err =3D -ENOMEM;
> >>>                 goto done;
> >>>         }
> >>>         vhost_net_stop(n, &tx_sock, &rx_sock);
> >>>         vhost_net_flush(n);
> >>>         vhost_dev_stop(&n->dev);
> >>>         vhost_dev_reset_owner(&n->dev, umem);
> >>>         vhost_net_vq_reset(n);
> >>> [...]
> >>>
> >>> }
> >>>
> >>> In the history of QEMU, There is a commit:
> >>> commit d1f8b30ec8dde0318fd1b98d24a64926feae9625
> >>> Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
> >>> Date:   Wed Sep 23 12:19:57 2015 +0800
> >>>
> >>>     vhost: rename VHOST_RESET_OWNER to VHOST_RESET_DEVICE
> >>>
> >>>     Quote from Michael:
> >>>
> >>>         We really should rename VHOST_RESET_OWNER to
> >>> VHOST_RESET_DEVICE.
> >>>
> >>> but finally, it has been reverted by the author:
> >>> commit 60915dc4691768c4dc62458bb3e16c843fab091d
> >>> Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
> >>> Date:   Wed Nov 11 21:24:37 2015 +0800
> >>>
> >>>     vhost: rename RESET_DEVICE backto RESET_OWNER
> >>>
> >>>     This patch basically reverts commit d1f8b30e.
> >>>
> >>>     It turned out that it breaks stuff, so revert it:
> >>>
> >>> https://urldefense.com/v3/__http://lists.nongnu.org/archive/html/qemu=
-devel/2015-10/msg00949.html__;!!ACWV5N9M2RV99hQ!bgCEUDnSCLVO8LxXlwcdiHrtwq=
H5ip_sVcKscrtJve5eSzJfNN9JZuf-8HQIQ1Re$
> >>>
> >>> Seems kernel take RESET_OWNER for reset,but QEMU never call to this
> >>> function to do a reset.
> >>
> >>
> >> The question is, we manage to survive by not using RESET_OWNER for
> >> past 10 years. Any reason that we want to use that now?
> >>
> >> Note that the RESET_OWNER is only useful the process want to drop the
> >> its mm refcnt from vhost, it doesn't reset the device (e.g it does
> >> not even call vhost_vq_reset()).
> >>
> >> (Especially, it was deprecated in by the vhost-user protocol since
> >> its semantics is ambiguous)
> >>
> >>
> >
> > So, you prefer to directly remove RESET_OWNER support now?
> >
> >>>
> >>>> And if I understand the code correctly, vhost-user "abuse"
> >>>> RESET_OWNER for reset. So the current code looks fine?
> >>>>
> >>>>
> >>>>>
> >>>>> Signde-off-by: Michael Qiu <qiudayu@archeros.com>
> >>>>> ---
> >>>>>   hw/scsi/vhost-user-scsi.c         |  6 +++++-
> >>>>>   hw/virtio/vhost-backend.c         |  4 ++--
> >>>>>   hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
> >>>>>   include/hw/virtio/vhost-backend.h |  2 ++
> >>>>>   4 files changed, 27 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> >>>>> index 1b2f7ee..f179626 100644
> >>>>> --- a/hw/scsi/vhost-user-scsi.c
> >>>>> +++ b/hw/scsi/vhost-user-scsi.c
> >>>>> @@ -80,8 +80,12 @@ static void vhost_user_scsi_reset(VirtIODevice
> >>>>> *vdev)
> >>>>>           return;
> >>>>>       }
> >>>>> -    if (dev->vhost_ops->vhost_reset_device) {
> >>>>> +    if (virtio_has_feature(dev->protocol_features,
> >>>>> + VHOST_USER_PROTOCOL_F_RESET_DEVICE) &&
> >>>>> + dev->vhost_ops->vhost_reset_device) {
> >>>>>           dev->vhost_ops->vhost_reset_device(dev);
> >>>>> +    } else if (dev->vhost_ops->vhost_reset_owner) {
> >>>>> +        dev->vhost_ops->vhost_reset_owner(dev);
> >>>>
> >>>>
> >>>> Actually, I fail to understand why we need an indirection via
> >>>> vhost_ops. It's guaranteed to be vhost_user_ops.
> >>>>
> >>>>
> >>>>>       }
> >>>>>   }
> >>>>> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> >>>>> index e409a86..abbaa8b 100644
> >>>>> --- a/hw/virtio/vhost-backend.c
> >>>>> +++ b/hw/virtio/vhost-backend.c
> >>>>> @@ -191,7 +191,7 @@ static int vhost_kernel_set_owner(struct
> >>>>> vhost_dev *dev)
> >>>>>       return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
> >>>>>   }
> >>>>> -static int vhost_kernel_reset_device(struct vhost_dev *dev)
> >>>>> +static int vhost_kernel_reset_owner(struct vhost_dev *dev)
> >>>>>   {
> >>>>>       return vhost_kernel_call(dev, VHOST_RESET_OWNER, NULL);
> >>>>>   }
> >>>>> @@ -317,7 +317,7 @@ const VhostOps kernel_ops =3D {
> >>>>>           .vhost_get_features =3D vhost_kernel_get_features,
> >>>>>           .vhost_set_backend_cap =3D vhost_kernel_set_backend_cap,
> >>>>>           .vhost_set_owner =3D vhost_kernel_set_owner,
> >>>>> -        .vhost_reset_device =3D vhost_kernel_reset_device,
> >>>>> +        .vhost_reset_owner =3D vhost_kernel_reset_owner,
> >>>>
> >>>>
> >>>> I think we can delete the current vhost_reset_device() since it not
> >>>> used in any code path.
> >>>>
> >>>
> >>> I planned to use it for vDPA reset,
> >>
> >>
> >> For vhost-vDPA it can call vhost_vdpa_reset_device() directly.
> >>
> >> As I mentioned before, the only user of vhost_reset_device config ops
> >> is vhost-user-scsi but it should directly call the
> >> vhost_user_reset_device().
> >>
> >
> >
> > Yes, but in the next patch I reuse it to reset backend device in
> > vhost_net.
> I recall vhost-user has a different way to reset the net backend,

Yes, it has VHOST_USER_RESET_DEVICE.

Thanks

> so
> probably we can leave out implementing the .vhost_reset_device() op for
> vhost-user as Jason suggested. In that case vhost-user-scsi will call
> into vhost_user_reset_device() directly without using the
> .vhost_reset_device() op.
>
> -Siwei
>
> >
> >
> >> Thanks
> >>
> >>
> >>> and vhost-user-scsi also use device reset.
> >>>
> >>> Thanks,
> >>> Michael
> >>>
> >>>> Thanks
> >>>>
> >>>>
> >>>>>           .vhost_get_vq_index =3D vhost_kernel_get_vq_index,
> >>>>>   #ifdef CONFIG_VHOST_VSOCK
> >>>>>           .vhost_vsock_set_guest_cid =3D
> >>>>> vhost_kernel_vsock_set_guest_cid,
> >>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >>>>> index 6abbc9d..4412008 100644
> >>>>> --- a/hw/virtio/vhost-user.c
> >>>>> +++ b/hw/virtio/vhost-user.c
> >>>>> @@ -1475,16 +1475,29 @@ static int
> >>>>> vhost_user_get_max_memslots(struct vhost_dev *dev,
> >>>>>       return 0;
> >>>>>   }
> >>>>> +static int vhost_user_reset_owner(struct vhost_dev *dev)
> >>>>> +{
> >>>>> +    VhostUserMsg msg =3D {
> >>>>> +        .hdr.request =3D VHOST_USER_RESET_OWNER,
> >>>>> +        .hdr.flags =3D VHOST_USER_VERSION,
> >>>>> +    };
> >>>>> +
> >>>>> +    return vhost_user_write(dev, &msg, NULL, 0);
> >>>>> +}
> >>>>> +
> >>>>>   static int vhost_user_reset_device(struct vhost_dev *dev)
> >>>>>   {
> >>>>>       VhostUserMsg msg =3D {
> >>>>> +        .hdr.request =3D VHOST_USER_RESET_DEVICE,
> >>>>>           .hdr.flags =3D VHOST_USER_VERSION,
> >>>>>       };
> >>>>> -    msg.hdr.request =3D virtio_has_feature(dev->protocol_features,
> >>>>> - VHOST_USER_PROTOCOL_F_RESET_DEVICE)
> >>>>> -        ? VHOST_USER_RESET_DEVICE
> >>>>> -        : VHOST_USER_RESET_OWNER;
> >>>>> +    /* Caller must ensure the backend has
> >>>>> VHOST_USER_PROTOCOL_F_RESET_DEVICE
> >>>>> +     * support */
> >>>>> +    if (!virtio_has_feature(dev->protocol_features,
> >>>>> + VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
> >>>>> +        return -EPERM;
> >>>>> +    }
> >>>>>       return vhost_user_write(dev, &msg, NULL, 0);
> >>>>>   }
> >>>>> @@ -2548,6 +2561,7 @@ const VhostOps user_ops =3D {
> >>>>>           .vhost_set_features =3D vhost_user_set_features,
> >>>>>           .vhost_get_features =3D vhost_user_get_features,
> >>>>>           .vhost_set_owner =3D vhost_user_set_owner,
> >>>>> +        .vhost_reset_owner =3D vhost_user_reset_owner,
> >>>>>           .vhost_reset_device =3D vhost_user_reset_device,
> >>>>>           .vhost_get_vq_index =3D vhost_user_get_vq_index,
> >>>>>           .vhost_set_vring_enable =3D vhost_user_set_vring_enable,
> >>>>> diff --git a/include/hw/virtio/vhost-backend.h
> >>>>> b/include/hw/virtio/vhost-backend.h
> >>>>> index 81bf310..affeeb0 100644
> >>>>> --- a/include/hw/virtio/vhost-backend.h
> >>>>> +++ b/include/hw/virtio/vhost-backend.h
> >>>>> @@ -77,6 +77,7 @@ typedef int (*vhost_get_features_op)(struct
> >>>>> vhost_dev *dev,
> >>>>>                                        uint64_t *features);
> >>>>>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
> >>>>>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
> >>>>> +typedef int (*vhost_reset_owner_op)(struct vhost_dev *dev);
> >>>>>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
> >>>>>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int
> >>>>> idx);
> >>>>>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> >>>>> @@ -150,6 +151,7 @@ typedef struct VhostOps {
> >>>>>       vhost_get_features_op vhost_get_features;
> >>>>>       vhost_set_backend_cap_op vhost_set_backend_cap;
> >>>>>       vhost_set_owner_op vhost_set_owner;
> >>>>> +    vhost_reset_owner_op vhost_reset_owner;
> >>>>>       vhost_reset_device_op vhost_reset_device;
> >>>>>       vhost_get_vq_index_op vhost_get_vq_index;
> >>>>>       vhost_set_vring_enable_op vhost_set_vring_enable;
> >>>>
> >>>>
> >>>
> >>
> >>
> >>
> >
>


