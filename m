Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E057652A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 18:16:08 +0200 (CEST)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCNz5-0000yG-Ce
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 12:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCNwz-00080L-43
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 12:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCNwu-0007O2-FC
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 12:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657901631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDs+DDxt7gEgWMkL7gWVUBYgDbGngrypY9ask/5Zw84=;
 b=awKtEMrgYDpIuBRtvFL8AlM/qBX9GL4MfuP8u2aljkK7dMBmgLStluyW/iWoMCtsNzr1Gi
 nfqXotbYvz3mUAk70mv6pNJ3PKDCEY2YicPsrO5pYMXz4GIzjhNczLeNBKJZEkFKSLqY7W
 OY8k3CHkFadt9PIuF03mQtG+n3z6Mqw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-2scWXNj3N8WcFyD4IVHJRA-1; Fri, 15 Jul 2022 12:13:50 -0400
X-MC-Unique: 2scWXNj3N8WcFyD4IVHJRA-1
Received: by mail-qv1-f69.google.com with SMTP id
 eb3-20020ad44e43000000b00472e7d52ce6so3284245qvb.17
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 09:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qDs+DDxt7gEgWMkL7gWVUBYgDbGngrypY9ask/5Zw84=;
 b=HMm/oBD+AV6wCdUkg6S4h/nP/0YoBOC0QvMcWArhtoay+D79K9Zjvviu+ZReh1uDR5
 Yx03aEsGe8Uzs5AzUDf8KLMmU9NlWAt7+YenzWkf7KpGDtyCqwvSALMihLW6RE4H86ft
 MXMvmFMZywg+7GbsMF70ns03tRzBXo8XoMI7xa5dAHStY3ExvJOGBAIV6K9QGdd0nsaY
 uxpJeGnAXwSvwxvMfvN1B/ZSKtxp2o4ClgfILpcq3yAFepkoZD5eA+dYOAozLuV16uiO
 C1TSybarT8o8ZZwi87Sm5XnolK4Re+cti/jz/JrmPwvTRwslofBYEQWMKUvMwAK2r8GP
 w/YQ==
X-Gm-Message-State: AJIora/NmXS0/L0DvwuVJlh4pqnoJ7e7rS3O0PDsu7CjpeChtKd1IhDt
 IRFVl+n9l4g9MxEIPu1cyanUhpUtEXIM5phg11IK64/313syopEGi7LQO2RHjSJHQD7GhSNVGLm
 acJdYyK1b8YBJ2P0SHhtc0fsShQBj/Ww=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr12583184qvb.2.1657901628476; 
 Fri, 15 Jul 2022 09:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1saQyyobcYB+KqCnH/2p4p9W/waT7Fj6ulzPGNhQ5cecRejRqhnJwrOMR1mIy4Uo3uUdbevBY7LDkqo8k30n4s=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr12583153qvb.2.1657901628123; Fri, 15
 Jul 2022 09:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-19-eperezma@redhat.com>
 <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
 <CAJaqyWcYWF8Q565XyvOSM6WfMK9kgnyqCd32tZpy2Tgx2UwxNQ@mail.gmail.com>
 <CACGkMEvr1eakhMEbTrCtEboThc+vJfuZDADuQnJgaMUWajSdSg@mail.gmail.com>
 <CAJaqyWdbJGBpMofpLXJ-T50wqaPKe1ksx+QwQkSpthiaj+9Tjg@mail.gmail.com>
In-Reply-To: <CAJaqyWdbJGBpMofpLXJ-T50wqaPKe1ksx+QwQkSpthiaj+9Tjg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 18:13:12 +0200
Message-ID: <CAJaqyWfAtuG9cPeXuLNef=gAdTNthQAOtrLmYb=_B=CtMQdesA@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 15, 2022 at 11:05 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 10:51 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 1:40 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Fri, Jul 15, 2022 at 6:03 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> > > > >
> > > > > Since the vhost-vdpa device is exposing _F_LOG,
> > > >
> > > > I may miss something but I think it doesn't?
> > > >
> > >
> > > It's at vhost_vdpa_get_features. As long as SVQ is enabled, it's
> > > exposing VHOST_F_LOG_ALL.
> >
> > Ok, so this needs to be specified in the change log.
>
> Got it, I'll write some note.
>
> > But I'm kind of
> > confused here, we do want to allow migration to work so why we disable
> > it?
> >
>

Adding here:
Without the x-svq parameter, migration is disabled unless the actual
vdpa device backend supports _F_LOG_ALL by itself. There is no such
thing in the Linux kernel at the moment.

> With x-svq parameter, migration of simple devices with no cvq "is
> possible". It has intrinsic problems like can't emit the gratuitous
> arp but it's possible and traffic can continue.
>
> But devices with cvq require to restore the state at the destination.
> That part is not implemented, so it's blocked at the moment.
>
> In the immediate future not all cases (as "net features") will be
> available: net/vhost-net.c (or virtio-net.c?) needs to know how to
> inject the state at the destination to restore the guest visible
> configuration. It's simple code, but it needs to be developed. So
> migration blocker is kept for these features. Hopefully, we will reach
> a point where all features supported by virtio-net.c will be
> supported, but the right thing to do is to merge basic ones first.
>
> Thanks!


