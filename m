Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57932D4501
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:05:36 +0100 (CET)
Received: from localhost ([::1]:40352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn125-00084W-Q5
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn10E-00077l-JU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn10C-0000I1-T8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607526215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iw54FHHDuTFhDT6GwXV18fdfBrw8McPHYg/txzp+0d0=;
 b=Tck3UrXbfiOXizpPQ7zHI11kIS/6lfNj2LbM9tvRX300E4xWAbVUZiu1YzlOCVJVDClqDr
 krGXhfxQy4PuJuugc/wYK3Npc9laW4dHvJmSTHGxR/0gHbjudwKxDYWcZ/1wZbd68JkguX
 UdLvgpOK9FQ1fK9qNjJxA8lNQ98tgC4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-RZe5Kj4ePf6nMyc_4GeNgQ-1; Wed, 09 Dec 2020 10:03:33 -0500
X-MC-Unique: RZe5Kj4ePf6nMyc_4GeNgQ-1
Received: by mail-qk1-f200.google.com with SMTP id b11so1221431qkk.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 07:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iw54FHHDuTFhDT6GwXV18fdfBrw8McPHYg/txzp+0d0=;
 b=ToHKq5saXVzyYugC8PuMwNC5iSWhlJ/bIQnF5cDrIqmKqD+ata53n58afs6asthX1Y
 v0fcEhn/eIEXKmOYrPBNoAALzLy1AjknRilxasaCQkgtjBJcHVI9eGu4wQOm4FPLuZ06
 ATRauLtaZgJibjQWpgG5CHMjVOp7SzKaDIljVs9xeIXZV1xlJiJB8Hq1YYWdi/Gbsz6X
 mZlkNDw5gu4ADJcgYZg16xsv7lb7aMTIivbWieQxrIJX2Om2r2E+3y/xvXOMYdqXVbbj
 3oh0d548weZ/EhInIPz347VPt3G44iP2LebBbWbPu8AAju/0kw5nrdSvdaTrGDKPH8CA
 XtHg==
X-Gm-Message-State: AOAM5328nC3FMAkmcDaoI7dDzimbNX/pTTmkfourWcxu1/ofo5QLt8gI
 1m3ZggVxcs2cBBTVA3IsaCATnZtBgMdPmDm4oKSVQA+csOaZCtLNjOoRe7YtVMIfEsZHEwoYG1i
 ICC7/J020/gkjtnk0rIfrmSMi2DLq8kA=
X-Received: by 2002:ad4:580f:: with SMTP id dd15mr1251613qvb.40.1607526213130; 
 Wed, 09 Dec 2020 07:03:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweI8sxDZKlah6jmbApPxGkZoMpfGjjfiMSfW6H0Qu37ltmLba0tnkGPfFbXGJUmmuys6dh6d25LZZBCYIVmhc=
X-Received: by 2002:ad4:580f:: with SMTP id dd15mr1251570qvb.40.1607526212910; 
 Wed, 09 Dec 2020 07:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-6-eperezma@redhat.com>
 <20201207165216.GL203660@stefanha-x1.localdomain>
In-Reply-To: <20201207165216.GL203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 16:02:56 +0100
Message-ID: <CAJaqyWfSUHD0MU=1yfU1N6pZ4TU7prxyoG6NY-VyNGt=MO9H4g@mail.gmail.com>
Subject: Re: [RFC PATCH 05/27] vhost: Add hdev->dev.sw_lm_vq_handler
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
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

On Mon, Dec 7, 2020 at 5:52 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:43PM +0100, Eugenio P=C3=A9rez wrote:
> > Only virtio-net honors it.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost.h |  1 +
> >  hw/net/virtio-net.c       | 39 ++++++++++++++++++++++++++++-----------
> >  2 files changed, 29 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index 4a8bc75415..b5b7496537 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -83,6 +83,7 @@ struct vhost_dev {
> >      bool started;
> >      bool log_enabled;
> >      uint64_t log_size;
> > +    VirtIOHandleOutput sw_lm_vq_handler;
>
> sw =3D=3D software?
> lm =3D=3D live migration?
>
> Maybe there is a name that is clearer. What are these virtqueues called?
> Shadow vqs? Logged vqs?
>
> Live migration is a feature that uses dirty memory logging, but other
> features may use dirty memory logging too. The name should probably not
> be associated with live migration.
>

I totally agree, I find shadow_vq a better name for it.

> >      Error *migration_blocker;
> >      const VhostOps *vhost_ops;
> >      void *opaque;
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9179013ac4..9a69ae3598 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -2628,24 +2628,32 @@ static void virtio_net_tx_bh(void *opaque)
> >      }
> >  }
> >
> > -static void virtio_net_add_queue(VirtIONet *n, int index)
> > +static void virtio_net_add_queue(VirtIONet *n, int index,
> > +                                 VirtIOHandleOutput custom_handler)
> >  {
>
> We talked about the possibility of moving this into the generic vhost
> code so that devices don't need to be modified. It would be nice to hide
> this feature inside vhost.

I'm thinking of tying it to VirtQueue, allowing the caller to override
the handler knowing it is not going to be called (I mean, not offering
race conditions protection, like before of starting processing
notifications in qemu calling vhost_dev_disable_notifiers).

Thanks!


