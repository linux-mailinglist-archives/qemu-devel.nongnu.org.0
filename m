Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA1550F95
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 07:10:11 +0200 (CEST)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o39fu-0000gX-AQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 01:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o39da-0007qR-5y
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o39dV-0005Z6-1B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655701658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRI2bF8b5Mej4AZkMnr0pr0RYflnNgQwA3zlCNcfc+0=;
 b=YVxY7w7eRCQxJLSWqcUB8ijkzJYyOoOH8S+MuDNNms86kkJ5Bl2ME8la9tA9iPrh87iC+R
 ZhNYNFIJwJR1utkH2mm4JeaJEEFkhOrMKLhHdrxYsNGtESeR0ekILcMonuEtmn5iae2NH3
 Nf8hy9QhslkBVgbrOSuYBAhmVcef4Cg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-AD0D24I4Mt-hPD9sMRsX6Q-1; Mon, 20 Jun 2022 01:07:37 -0400
X-MC-Unique: AD0D24I4Mt-hPD9sMRsX6Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 br5-20020a056512400500b00479a5157134so4946560lfb.5
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 22:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iRI2bF8b5Mej4AZkMnr0pr0RYflnNgQwA3zlCNcfc+0=;
 b=Do/wBl5dz3sZENtIe5EQa8qLLjiWmIwtF00fStpKpSZHOknNy314se/DEqN76l+FX2
 TZGl8hFo/POBnAKqkpJwRGr7X3saAyh08XxEoQ7CNiuR82CmNBZEiuOu6z59kfhKhjdb
 WXZ+++ROWAu+E6HdUM62oGVdlVathGOE8NrCA8mDw29GUYtzYBwuHGW1B16A1JVfgWUG
 98lg5+0waMH7mFIsXKWp4wOdvQeCqPgjBR8fJIngBnJ+vvr3PPhd6L04XgSuNhTBv+2e
 QaMhUo21oEsqWaPOuYvGn4hqD1vPfMMUjEBQKEJkQ3jimMDPuwdLm3JMhEa6pAOxhzk5
 YqEg==
X-Gm-Message-State: AJIora/EpVmRzhIrUrH6GcTod66AdllfYd1OH2KuN7EGzFeA85X4k+Kw
 UVu0V/bD3P/P5Y9XgPu91SoHiNPBs3DAU+XQev9g75bLyfuCMvp6a2Dn0Wcj1+WrVz2nHtq4wnY
 uMiCilrwAyOED9HSUJsI/RYDb48Myp+8=
X-Received: by 2002:a2e:b014:0:b0:25a:6d17:c3c8 with SMTP id
 y20-20020a2eb014000000b0025a6d17c3c8mr2347270ljk.487.1655701655724; 
 Sun, 19 Jun 2022 22:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sWA0kbBmGoBKonTb/UPvjVWvh9CKcwZlOHwEdMkt62LcaZYOlR27GhvGuNbpdango4W4nLWFHt4etexxEvtYM=
X-Received: by 2002:a2e:b014:0:b0:25a:6d17:c3c8 with SMTP id
 y20-20020a2eb014000000b0025a6d17c3c8mr2347245ljk.487.1655701655196; Sun, 19
 Jun 2022 22:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
 <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
 <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
 <CAJaqyWeED1Q0XvrJ1gyYkZxSGXPdUXY+7+UCWAhpiJ+CEjC=WQ@mail.gmail.com>
 <CACGkMEtqNz8b6U6Fzqj5fft8Ax_Evu1=ptGyMs7ACM0OVybmdA@mail.gmail.com>
 <CAJaqyWdoGixF9-Vwfhti4aW8X-qpDma2wVBUrB7of7BxstwAQQ@mail.gmail.com>
 <CACGkMEtAExGWKrwmXFJXOCpaGdD3bvnHfbaAmKeco8ZrL4CYJQ@mail.gmail.com>
 <CAJaqyWeSK-8QivDF0MzrPt29RQMS0+QJ6UuWCra7Ag5sc0L-_Q@mail.gmail.com>
 <CACGkMEtMSh2bG77+3O2mx3aOT+MUfUtCX4tRd2zBFoYy1vNLng@mail.gmail.com>
 <CAJaqyWdwibRkK77aJ=dMZi=1sFNce8pO9k82QZbNfy0x_9cBKA@mail.gmail.com>
In-Reply-To: <CAJaqyWdwibRkK77aJ=dMZi=1sFNce8pO9k82QZbNfy0x_9cBKA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 20 Jun 2022 13:07:23 +0800
Message-ID: <CACGkMEtPRhQB1ErTSdTySBUMxjuUQTUuWG7VK7q_XTQMuKPRMA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/21] Net Control VQ support with asid in vDPA SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 17, 2022 at 4:17 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Jun 17, 2022 at 3:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Jun 15, 2022 at 6:03 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Jun 15, 2022 at 5:04 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Tue, Jun 14, 2022 at 5:32 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Tue, Jun 14, 2022 at 10:20 AM Jason Wang <jasowang@redhat.com>=
 wrote:
> > > > > >
> > > > > > On Tue, Jun 14, 2022 at 4:14 PM Eugenio Perez Martin
> > > > > > <eperezma@redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, Jun 14, 2022 at 10:02 AM Jason Wang <jasowang@redhat.=
com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jun 14, 2022 at 12:32 AM Eugenio Perez Martin
> > > > > > > > <eperezma@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eper=
ezma@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@red=
hat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > > > > > > > > > > Control virtqueue is used by networking device for =
accepting various
> > > > > > > > > > > > commands from the driver. It's a must to support mu=
ltiqueue and other
> > > > > > > > > > > > configurations.
> > > > > > > > > > > >
> > > > > > > > > > > > Shadow VirtQueue (SVQ) already makes possible migra=
tion of virtqueue
> > > > > > > > > > > > states, effectively intercepting them so qemu can t=
rack what regions of memory
> > > > > > > > > > > > are dirty because device action and needs migration=
. However, this does not
> > > > > > > > > > > > solve networking device state seen by the driver be=
cause CVQ messages, like
> > > > > > > > > > > > changes on MAC addresses from the driver.
> > > > > > > > > > > >
> > > > > > > > > > > > To solve that, this series uses SVQ infraestructure=
 proposed to intercept
> > > > > > > > > > > > networking control messages used by the device. Thi=
s way, qemu is able to
> > > > > > > > > > > > update VirtIONet device model and to migrate it.
> > > > > > > > > > > >
> > > > > > > > > > > > However, to intercept all queues would slow device =
data forwarding. To solve
> > > > > > > > > > > > that, only the CVQ must be intercepted all the time=
. This is achieved using
> > > > > > > > > > > > the ASID infraestructure, that allows different tra=
nslations for different
> > > > > > > > > > > > virtqueues. The most updated kernel part of ASID is=
 proposed at [1].
> > > > > > > > > > > >
> > > > > > > > > > > > You can run qemu in two modes after applying this s=
eries: only intercepting
> > > > > > > > > > > > cvq with x-cvq-svq=3Don or intercept all the virtqu=
eues adding cmdline x-svq=3Don:
> > > > > > > > > > > >
> > > > > > > > > > > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdp=
a-0,id=3Dvhost-vdpa0,x-cvq-svq=3Don,x-svq=3Don
> > > > > > > > > > > >
> > > > > > > > > > > > First three patches enable the update of the virtio=
-net device model for each
> > > > > > > > > > > > CVQ message acknoledged by the device.
> > > > > > > > > > > >
> > > > > > > > > > > > Patches from 5 to 9 enables individual SVQ to copy =
the buffers to QEMU's VA.
> > > > > > > > > > > > This allows simplyfing the memory mapping, instead =
of map all the guest's
> > > > > > > > > > > > memory like in the data virtqueues.
> > > > > > > > > > > >
> > > > > > > > > > > > Patch 10 allows to inject control messages to the d=
evice. This allows to set
> > > > > > > > > > > > state to the device both at QEMU startup and at liv=
e migration destination. In
> > > > > > > > > > > > the future, this may also be used to emulate _F_ANN=
OUNCE.
> > > > > > > > > > > >
> > > > > > > > > > > > Patch 11 updates kernel headers, but it assign rand=
om numbers to needed ioctls
> > > > > > > > > > > > because they are still not accepted in the kernel.
> > > > > > > > > > > >
> > > > > > > > > > > > Patches 12-16 enables the set of the features of th=
e net device model to the
> > > > > > > > > > > > vdpa device at device start.
> > > > > > > > > > > >
> > > > > > > > > > > > Last ones enables the sepparated ASID and SVQ.
> > > > > > > > > > > >
> > > > > > > > > > > > Comments are welcomed.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > As discussed, I think we need to split this huge seri=
es into smaller ones:
> > > > > > > > > > >
> > > > > > > > > > > 1) shadow CVQ only, this makes rx-filter-event work
> > > > > > > > > > > 2) ASID support for CVQ
> > > > > > > > > > >
> > > > > > > > > > > And for 1) we need consider whether or not it could b=
e simplified.
> > > > > > > > > > >
> > > > > > > > > > > Or do it in reverse order, since if we do 1) first, w=
e may have security
> > > > > > > > > > > issues.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I'm ok with both, but I also think 2) before 1) might m=
ake more sense.
> > > > > > > > > > There is no way to only shadow CVQ otherwise ATM.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > On second thought, that order is kind of harder.
> > > > > > > > >
> > > > > > > > > If we only map CVQ buffers, we need to either:
> > > > > > > > > a. Copy them to controlled buffers
> > > > > > > > > b. Track properly when to unmap them
> > > > > > > >
> > > > > > > > Just to make sure we're at the same page:
> > > > > > > >
> > > > > > > > I meant we can start with e.g having a dedicated ASID for C=
VQ but
> > > > > > > > still using CVQ passthrough.
> > > > > > > >
> > > > > > >
> > > > > > > That would imply duplicating all the memory listener updates =
to both
> > > > > > > ASIDs. That part of the code needs to be reverted. I'm ok wit=
h that,
> > > > > > > but I'm not sure if it's worth it to do it that way.
> > > > > >
> > > > > > I don't get why it is related to memory listeners. The only cha=
nge is
> > > > > >
> > > > > > 1) read the groups
> > > > > > 2) set cvq to be an independent asid
> > > > > > 3) update CVQ's IOTLB with its own ASID
> > > > > >
> > > > >
> > > > > How to track the mappings of step 3) without a copy?
> > > >
> > > > So let me try to explain, what I propose is to split the patches. S=
o
> > > > the above could be the first part. Since we know:
> > > >
> > > > 1) CVQ is passthrough to guest right now
> > > > 2) We know CVQ will use an independent ASID
> > > >
> > > > It doesn't harm to implement those first. It's unrelated to the pol=
icy
> > > > (e.g how to shadow CVQ).
> > > >
> > > > >
> > > > > If we don't copy the buffers to qemu's IOVA, we need to track whe=
n to
> > > > > unmap CVQ buffers memory. Many CVQ buffers could be in the same p=
age,
> > > > > so we need to refcount them (or similar solution).
> > > >
> > > > Can we use fixed mapping instead of the dynamic ones?
> > > >
> > >
> > > That implies either to implement something like a memory ring (size?)=
,
> > > or to effectively duplicate memory listener mappings.
> >
> > I'm not sure I get this.
> >
> > But it's mainly the CVQ buffer + CVQ virtqueue.
> >
> > It should be possible if:
> >
> > 1) allocate something like a buffer of several megabytes
>
> It's technically possible, but we need to deal with situations that do
> not happen in the final version once we teach qemu how to deal with
> CVQ. For example, what do we do if it does not fit?

Then double the size of the area? For CVQ, Qemu should know the
maximum size of the request, otherwise it would be another blocker for
live migration.

>
> Current workflow deals with it automatically, as we teach qemu about
> CVQ before splitting it to a separated ASID. The big buffer looks like
> a good *transversal* optimization to me. For example, when indirect
> descriptors are supported, we will need something like that to not
> abuse map/unmap ops. CVQ can use it too. But it will be better if we
> provide it with a good default + tunable IMO.

That's fine.

>
> > 2) only process one CVQ command from guest at once
> >
>
> I don't get why it's needed, it's to make sure CVQ never fills that
> buffer? It should be easy to copy as many guest's CVQ buffers as
> possible there and then stop when it's full.

It's not a must, just a proposal to start from something that is simpler ..=
.

Thanks

>
> > ?
> >
> > >
> > > I'm not against that, but it's something we need to remove on the
> > > final solution. To use the order presented here will avoid that.
> > >
> > > > >
> > > > > This series copies the buffers to an independent buffer in qemu m=
emory
> > > > > to avoid that. Once you copy them, we have the problem you point =
at
> > > > > some patch later: The guest control buffers, so qemu must underst=
and
> > > > > CVQ so the guest cannot trick it. All of this is orthogonal to AS=
ID.
> > > > > At that point, we have this series except for the asid part and t=
he
> > > > > injection of CVQ buffers at the LM destination, isn't it?
> > > >
> > > > So we have several stuffs:
> > > >
> > > > 1) ASID support
> > > > 2) Shadow CVQ only
> > > > 3) State restoring
> > > >
> > > > I hope we can split them into independent series. If we want to sha=
dow
> > > > CVQ first, we need to prove that it is safe without ASID.
> > > >
> > > > >
> > > > > CVQ buffers can be copied in the qemu IOVA space and be offered t=
o the
> > > > > device. Much like SVQ vrings, the copied buffers will not be
> > > > > accessible from the guest. The hw device (as "non emulated cvq") =
will
> > > > > receive a lot of dma updates, but it's temporary. We can add ASID=
 on
> > > > > top of that as a mean to:
> > > > > - Not to SVQ data plane (fundamental to the intended use case of =
vdpa).
> > > > > - Not to pollute data plane DMA mappings.
> > > > >
> > > > > > ?
> > > > > >
> > > > > > >
> > > > > > > > Then do other stuff on top.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Alternative a. have the same problems exposed in this RFC=
: It's hard
> > > > > > > > > (and unneeded in the final version) to know the size to c=
opy.
> > > > > > > > > Alternative b. also requires things not needed in the fin=
al version,
> > > > > > > > > like to count the number of times each page is mapped and=
 unmapped.
> > > > > > > > >
> > > > > > > > > So I'll go to the first alternative, that is also the pro=
posed order
> > > > > > > > > of the RFC. What security issues do you expect beyond the=
 comments in
> > > > > > > > > this series?
> > > > > > > >
> > > > > > > > If we shadow CVQ without ASID. The guest may guess the IOVA=
 of CVQ and
> > > > > > > > try to peek/modify it?
> > > > > > > >
> > > > > > >
> > > > > > > It works the same way as data vqs, we're just updating the de=
vice
> > > > > > > model in the middle. It should imply the exact same risk as u=
pdating
> > > > > > > an emulated NIC control plane (including vhost-kernel / vhost=
-user).
> > > > > >
> > > > > > Not sure I got you here. For vhost-kernel and vhost-user, CVQ's=
 buffer
> > > > > > is owned by guests.
> > > > > >
> > > > >
> > > > > The same way they control the data plane when all data virtqueues=
 are
> > > > > shadowed for dirty page tracking (more on the risk of qemu updati=
ng
> > > > > the device model below).
> > > >
> > > > Ok.
> > > >
> > > > >
> > > > > > But if we shadow CVQ without ASID, the CVQ buffer is owned by Q=
EMU and
> > > > > > there's no way to prevent guests from accessing it?
> > > > > >
> > > > >
> > > > > With SVQ the memory exposed to the device is already shadowed. Th=
ey
> > > > > cannot access the CVQ buffers memory the same way they cannot acc=
ess
> > > > > the SVQ vrings.
> > > >
> > > > Ok, I think I kind of get you, it looks like we have different
> > > > assumptions here: So if we only shadow CVQ, it will have security
> > > > issues, since RX/TX is not shadowed. If we shadow CVQ as well as
> > > > TX/RX, there's no security issue, since each IOVA is validated and =
the
> > > > descriptors are prepared by Qemu.
> > > >
> > >
> > > Right. I expected to maintain the all-shadowed-or-nothing behavior,
> > > sorry if I was not clear.
> > >
> > > > This goes back to another question, what's the order of the series.
> > > >
> > >
> > > I think that the shortest path is to follow the order of this series.
> > > I tried to reorder your way, but ASID patches have to come with a lot
> > > of CVQ patches if we want proper validation.
> >
> > Ok, so if this is the case, let's just split this series and keep the o=
rder.
> >
> > >
> > > We can take the long route if we either implement a fixed ring buffer=
,
> > > memory listener cloning, or another use case (sub-slicing?). But I
> > > expect more issues to arise there.
> > >
> > > I have another question actually, is it ok to implement the cvq use
> > > case but not to merge the x-svq parameter? The more I think on the
> > > parameter the more I see it's better to leave it as a separated patch
> > > for testing until we shape the complete series and it's unneeded.
> >
> > That's fine.
> >
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > >
> > > > >
> > > > > > If in the case of vhost-kernel/vhost-user, there's a way for th=
e guest
> > > > > > to exploit buffers owned by Qemu, it should be a bug.
> > > > > >
> > > > >
> > > > > The only extra step is the call to virtio_net_handle_ctrl_iov
> > > > > (extracted from virtio_net_handle_ctrl). If a guest can exploit t=
hat
> > > > > in SVQ mode, it can exploit it too with other vhost backends as f=
ar as
> > > > > I see.
> > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >
> > > > > > > Roughly speaking, it's just to propose patches 01 to 03, with=
 your
> > > > > > > comments. That already meets use cases like rx filter notific=
ations
> > > > > > > for devices with only one ASID.
> > > > > > >
> > > > >
> > > > > This part of my mail is not correct, we need to add a few patches=
 of
> > > > > this series on top :). If not, it would be exploitable.
> > > > >
> > > > > Thanks!
> > > > >
> > > > > > > Thanks!
> > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks!
> > > > > > > > >
> > > > > > > > > > Can we do as with previous base SVQ patches? they were =
merged although
> > > > > > > > > > there is still no way to enable SVQ.
> > > > > > > > > >
> > > > > > > > > > Thanks!
> > > > > > > > > >
> > > > > > > > > > > Thoughts?
> > > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > TODO:
> > > > > > > > > > > > * Fallback on regular CVQ if QEMU cannot isolate in=
 its own ASID by any
> > > > > > > > > > > >    reason, blocking migration. This is tricky, sinc=
e it can cause that the VM
> > > > > > > > > > > >    cannot be migrated anymore, so some way of block=
 it must be used.
> > > > > > > > > > > > * Review failure paths, some are with TODO notes, o=
ther don't.
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v7:
> > > > > > > > > > > > * Don't map all guest space in ASID 1 but copy all =
the buffers. No need for
> > > > > > > > > > > >    more memory listeners.
> > > > > > > > > > > > * Move net backend start callback to SVQ.
> > > > > > > > > > > > * Wait for device CVQ commands used by the device a=
t SVQ start, avoiding races.
> > > > > > > > > > > > * Changed ioctls, but they're provisional anyway.
> > > > > > > > > > > > * Reorder commits so refactor and code adding ones =
are closer to usage.
> > > > > > > > > > > > * Usual cleaning: better tracing, doc, patches mess=
ages, ...
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v6:
> > > > > > > > > > > > * Fix bad iotlb updates order when batching was ena=
bled
> > > > > > > > > > > > * Add reference counting to iova_tree so cleaning i=
s simpler.
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v5:
> > > > > > > > > > > > * Fixes bad calculus of cvq end group when MQ is no=
t acked by the guest.
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v4:
> > > > > > > > > > > > * Add missing tracing
> > > > > > > > > > > > * Add multiqueue support
> > > > > > > > > > > > * Use already sent version for replacing g_memdup
> > > > > > > > > > > > * Care with memory management
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v3:
> > > > > > > > > > > > * Fix bad returning of descriptors to SVQ list.
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v2:
> > > > > > > > > > > > * Fix use-after-free.
> > > > > > > > > > > >
> > > > > > > > > > > > Changes from rfc v1:
> > > > > > > > > > > > * Rebase to latest master.
> > > > > > > > > > > > * Configure ASID instead of assuming cvq asid !=3D =
data vqs asid.
> > > > > > > > > > > > * Update device model so (MAC) state can be migrate=
d too.
> > > > > > > > > > > >
> > > > > > > > > > > > [1] https://lkml.kernel.org/kvm/20220224212314.1326=
-1-gdawar@xilinx.com/
> > > > > > > > > > > >
> > > > > > > > > > > > Eugenio P=C3=A9rez (21):
> > > > > > > > > > > >    virtio-net: Expose ctrl virtqueue logic
> > > > > > > > > > > >    vhost: Add custom used buffer callback
> > > > > > > > > > > >    vdpa: control virtqueue support on shadow virtqu=
eue
> > > > > > > > > > > >    virtio: Make virtqueue_alloc_element non-static
> > > > > > > > > > > >    vhost: Add vhost_iova_tree_find
> > > > > > > > > > > >    vdpa: Add map/unmap operation callback to SVQ
> > > > > > > > > > > >    vhost: move descriptor translation to vhost_svq_=
vring_write_descs
> > > > > > > > > > > >    vhost: Add SVQElement
> > > > > > > > > > > >    vhost: Add svq copy desc mode
> > > > > > > > > > > >    vhost: Add vhost_svq_inject
> > > > > > > > > > > >    vhost: Update kernel headers
> > > > > > > > > > > >    vdpa: delay set_vring_ready after DRIVER_OK
> > > > > > > > > > > >    vhost: Add ShadowVirtQueueStart operation
> > > > > > > > > > > >    vhost: Make possible to check for device exclusi=
ve vq group
> > > > > > > > > > > >    vhost: add vhost_svq_poll
> > > > > > > > > > > >    vdpa: Add vhost_vdpa_start_control_svq
> > > > > > > > > > > >    vdpa: Add asid attribute to vdpa device
> > > > > > > > > > > >    vdpa: Extract get features part from vhost_vdpa_=
get_max_queue_pairs
> > > > > > > > > > > >    vhost: Add reference counting to vhost_iova_tree
> > > > > > > > > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > > > > > > > > >    vdpa: Add x-cvq-svq
> > > > > > > > > > > >
> > > > > > > > > > > >   qapi/net.json                                |  1=
3 +-
> > > > > > > > > > > >   hw/virtio/vhost-iova-tree.h                  |   =
7 +-
> > > > > > > > > > > >   hw/virtio/vhost-shadow-virtqueue.h           |  6=
1 ++-
> > > > > > > > > > > >   include/hw/virtio/vhost-vdpa.h               |   =
3 +
> > > > > > > > > > > >   include/hw/virtio/vhost.h                    |   =
3 +
> > > > > > > > > > > >   include/hw/virtio/virtio-net.h               |   =
4 +
> > > > > > > > > > > >   include/hw/virtio/virtio.h                   |   =
1 +
> > > > > > > > > > > >   include/standard-headers/linux/vhost_types.h |  1=
1 +-
> > > > > > > > > > > >   linux-headers/linux/vhost.h                  |  2=
5 +-
> > > > > > > > > > > >   hw/net/vhost_net.c                           |   =
5 +-
> > > > > > > > > > > >   hw/net/virtio-net.c                          |  8=
4 +++--
> > > > > > > > > > > >   hw/virtio/vhost-iova-tree.c                  |  3=
5 +-
> > > > > > > > > > > >   hw/virtio/vhost-shadow-virtqueue.c           | 37=
8 ++++++++++++++++---
> > > > > > > > > > > >   hw/virtio/vhost-vdpa.c                       | 20=
6 +++++++++-
> > > > > > > > > > > >   hw/virtio/virtio.c                           |   =
2 +-
> > > > > > > > > > > >   net/vhost-vdpa.c                             | 29=
4 ++++++++++++++-
> > > > > > > > > > > >   hw/virtio/trace-events                       |  1=
0 +-
> > > > > > > > > > > >   17 files changed, 1012 insertions(+), 130 deletio=
ns(-)
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


