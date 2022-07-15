Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F9575E44
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:14:37 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHPA-00055a-O5
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCHHK-0006GR-N8
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 05:06:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCHHH-0007FF-3C
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 05:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657875986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVsMFjIKf6TWgENUsZdH+pUKSXN2gXumQ3udPeeYN2c=;
 b=Q6WGgoPckbRJiDZ3ZY5J5efu/C+R0NXGxUA2mlfokF6izlhX1oNDDwFxhm6Jb77k+Dzf3I
 8rL2a9XQ3tIjxo/rNkTRUlRdJ3c22M0Ykyxmz0u2MmJHqsYW8vfJgxZrDAzA3L+lYJIGCZ
 GO1a/6lty9KTFRk1VGad7T4Gi+u/05Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-INLKI1lTMeukXZ-65MJnaA-1; Fri, 15 Jul 2022 05:06:25 -0400
X-MC-Unique: INLKI1lTMeukXZ-65MJnaA-1
Received: by mail-qt1-f197.google.com with SMTP id
 c22-20020ac81116000000b0031d25923ea8so3277166qtj.17
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 02:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jVsMFjIKf6TWgENUsZdH+pUKSXN2gXumQ3udPeeYN2c=;
 b=rYiRFv84P9CxOsr8TDtSSU56k88Tfyh0wKrIZgAF6vmZAF3qurjyH7VTw1GAgqB9qp
 gTPkgeob37DG4ICc2+uK270itu3zM/DHIOWbr5vunHbNeC/BQ+VpVHZwRSYs0UDCfFCd
 yp2CE2MDQ559EBA4pu452OKTOiaE34T/IEgHgp5V+pM5e36HAWL8r+QhsEHac/53Ppd3
 BkIEBX8uVO06dKdlh/Qd41UfMeW9OGhALkxUeUnfZQ7m1z6C4L/QRcJaV2OYAG0jpQQG
 QcbgwPWVOdLCjpaxR6d61Ry3Cdi+4XF2QQlpcQQtAF7LAv8CInzsnNEkQi/nJpHUDMER
 EC7Q==
X-Gm-Message-State: AJIora8h1DJuhYO3ZrAfLoqaSk8F+7flVD2ORGYxsMNUNT+nfAa3ehit
 WDF9js71LsNvbmSQWW9aIcuGZGFNZdFdHuT4o1K3P/ab4a9uYou9Zvmlwhu/iGwaG3DRPs1wMrO
 5kyu9FGaGTMIbQcY374iuyWy364bGKMc=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr10773395qvb.45.1657875984983; 
 Fri, 15 Jul 2022 02:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHiEyy18H3d6S2xK5KkSroT8PwRvQ1Hol0510iz7fjs+AjSrzgwcjLqbeF33m5XOLHIQk/jJ+F9ZihEg2zDIc=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr10773384qvb.45.1657875984793; Fri, 15
 Jul 2022 02:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-19-eperezma@redhat.com>
 <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
 <CAJaqyWcYWF8Q565XyvOSM6WfMK9kgnyqCd32tZpy2Tgx2UwxNQ@mail.gmail.com>
 <CACGkMEvr1eakhMEbTrCtEboThc+vJfuZDADuQnJgaMUWajSdSg@mail.gmail.com>
In-Reply-To: <CACGkMEvr1eakhMEbTrCtEboThc+vJfuZDADuQnJgaMUWajSdSg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 11:05:48 +0200
Message-ID: <CAJaqyWdbJGBpMofpLXJ-T50wqaPKe1ksx+QwQkSpthiaj+9Tjg@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] vdpa: Add device migration blocker
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jul 15, 2022 at 10:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 1:40 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 6:03 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > Since the vhost-vdpa device is exposing _F_LOG,
> > >
> > > I may miss something but I think it doesn't?
> > >
> >
> > It's at vhost_vdpa_get_features. As long as SVQ is enabled, it's
> > exposing VHOST_F_LOG_ALL.
>
> Ok, so this needs to be specified in the change log.

Got it, I'll write some note.

> But I'm kind of
> confused here, we do want to allow migration to work so why we disable
> it?
>

With x-svq parameter, migration of simple devices with no cvq "is
possible". It has intrinsic problems like can't emit the gratuitous
arp but it's possible and traffic can continue.

But devices with cvq require to restore the state at the destination.
That part is not implemented, so it's blocked at the moment.

In the immediate future not all cases (as "net features") will be
available: net/vhost-net.c (or virtio-net.c?) needs to know how to
inject the state at the destination to restore the guest visible
configuration. It's simple code, but it needs to be developed. So
migration blocker is kept for these features. Hopefully, we will reach
a point where all features supported by virtio-net.c will be
supported, but the right thing to do is to merge basic ones first.

Thanks!


