Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598976D4ED8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:23:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNsY-0006br-Jh; Mon, 03 Apr 2023 13:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pjNsS-0006YM-Ux
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pjNsR-0002wN-2b
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680542513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ra5IIC/+QJGZxBb/Ghom2edPgr4Fp96q7amKRSwT5w=;
 b=a/yPpV/3x18MGz17fZOiRkZmJRzHzrRIHa3qiJb5n/KA6dQclMrFApV5ikSN3sSMfmS/LS
 +BmiUqOb3OH3FPpKFMP0u/f9hYinvhJf7oDGzpoc0BZe9BkXEAVd2PI+HcYdKIgNsZEfCK
 vGrocLiPWIK/WY8vJVtyaz3170MNcz0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-cHzhaPQwPKmu8Qa4cRmF2g-1; Mon, 03 Apr 2023 13:21:52 -0400
X-MC-Unique: cHzhaPQwPKmu8Qa4cRmF2g-1
Received: by mail-yb1-f198.google.com with SMTP id
 p12-20020a25420c000000b00b6eb3c67574so29228155yba.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 10:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680542512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ra5IIC/+QJGZxBb/Ghom2edPgr4Fp96q7amKRSwT5w=;
 b=qeP0upaWwV6nV020/v8Lsf3kj+VmgeRO5Si1Xz0bwTxeRgqPq3rAA8udGXuFYjhipJ
 XpU7JreZyB0r0M3MfE5hjDQOUBxIRuLISCdQpYWPt7BwX82jKfnqYOt3z4CqtiPlapwm
 zUYBhD08WjDmo3z/xCs4ovuVK/DUosyzCaqHWE639p4AU6itHgm66pEo4PxAQPlEjp4M
 nmuEg0r3vkCXyq56Fi/PUG+Eml3eQM7AokXbGka8Ku0TD2qAJ1S19kSHFdd+B1B5wZMU
 7Sf9Fc1kTBjOUaBWp+TeTK/EmO9aZT293It4/GpzUPbeIXvCVTjX7idXXo0h+2c3M9WH
 71wQ==
X-Gm-Message-State: AAQBX9eAO2AEEBmXDqL2rFFmfqfAs6nhLt+R9UnyesgNRHUCZ20zNt9G
 eMBEW1zrTabBPVy/eRfs+fldr8eq8kzfuu4iwV3NKuEcSB9rCxVK4n9C34+mFPAhJUa5rgNO3tQ
 DUBTQgtFA/Uf2Oxdb9cvbCeSutW7of6c=
X-Received: by 2002:a81:b617:0:b0:544:b864:5532 with SMTP id
 u23-20020a81b617000000b00544b8645532mr17670761ywh.3.1680542511820; 
 Mon, 03 Apr 2023 10:21:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350aZ9un2UnXUDilnG9TZzZY27M1AhVFD0tZq35+jp84yVdBoNZOVzepA7S4oWJ+5OHJUSseWIBjIyXu8jxVhPas=
X-Received: by 2002:a81:b617:0:b0:544:b864:5532 with SMTP id
 u23-20020a81b617000000b00544b8645532mr17670727ywh.3.1680542511524; Mon, 03
 Apr 2023 10:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
 <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
 <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
 <CAJaqyWeUxm9=Hup58gsBypQXJbeW2BTu3YpV7VDVOA2rXbtPWg@mail.gmail.com>
 <0cc19893-f832-f03a-cbb0-19f053ff8aa7@redhat.com>
 <CAJaqyWfk0x0Sym1wZvm5jKPi6EsyQMXFr3Tnb_StxM25uamoTA@mail.gmail.com>
 <CACGkMEvYcO3aC7CQX00POC7+U6w4Rjekeg+rcY70EVRsToaGGg@mail.gmail.com>
In-Reply-To: <CACGkMEvYcO3aC7CQX00POC7+U6w4Rjekeg+rcY70EVRsToaGGg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 3 Apr 2023 19:21:15 +0200
Message-ID: <CAJaqyWdZ=n-hNCM98nELqe10_Dt_bpcba8YnoHyjPnk+-H9=9g@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Apr 3, 2023 at 7:32=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Fri, Mar 31, 2023 at 6:12=E2=80=AFPM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Mar 31, 2023 at 10:00=E2=80=AFAM Jason Wang <jasowang@redhat.co=
m> wrote:
> > >
> > >
> > > =E5=9C=A8 2023/3/30 18:42, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > > On Thu, Mar 30, 2023 at 8:23=E2=80=AFAM Jason Wang <jasowang@redhat=
.com> wrote:
> > > >> On Thu, Mar 30, 2023 at 2:20=E2=80=AFPM Jason Wang <jasowang@redha=
t.com> wrote:
> > > >>> On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <epere=
zma@redhat.com> wrote:
> > > >>>> Evaluating it at start time instead of initialization time may m=
ake the
> > > >>>> guest capable of dynamically adding or removing migration blocke=
rs.
> > > >>>>
> > > >>>> Also, moving to initialization reduces the number of ioctls in t=
he
> > > >>>> migration, reducing failure possibilities.
> > > >>>>
> > > >>>> As a drawback we need to check for CVQ isolation twice: one time=
 with no
> > > >>>> MQ negotiated and another one acking it, as long as the device s=
upports
> > > >>>> it.  This is because Vring ASID / group management is based on v=
q
> > > >>>> indexes, but we don't know the index of CVQ before negotiating M=
Q.
> > > >>> We need to fail if we see a device that can isolate cvq without M=
Q but
> > > >>> not with MQ.
> > > >>>
> > > >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >>>> ---
> > > >>>> v2: Take out the reset of the device from vhost_vdpa_cvq_is_isol=
ated
> > > >>>> ---
> > > >>>>   net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++---=
--------
> > > >>>>   1 file changed, 151 insertions(+), 43 deletions(-)
> > > >>>>
> > > >>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > >>>> index 4397c0d4b3..db2c9afcb3 100644
> > > >>>> --- a/net/vhost-vdpa.c
> > > >>>> +++ b/net/vhost-vdpa.c
> > > >>>> @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
> > > >>>>
> > > >>>>       /* The device always have SVQ enabled */
> > > >>>>       bool always_svq;
> > > >>>> +
> > > >>>> +    /* The device can isolate CVQ in its own ASID if MQ is nego=
tiated */
> > > >>>> +    bool cvq_isolated_mq;
> > > >>>> +
> > > >>>> +    /* The device can isolate CVQ in its own ASID if MQ is not =
negotiated */
> > > >>>> +    bool cvq_isolated;
> > > >>> As stated above, if we need a device that cvq_isolated_mq^cvq_iso=
lated
> > > >>> =3D=3D true, we need to fail. This may reduce the complexity of t=
he code?
> > > >>>
> > > >>> Thanks
> > > >> Since we are the mediation layer, Qemu can alway choose to negotia=
te
> > > >> MQ regardless whether or not it is supported by the guest. In this
> > > >> way, we can have a stable virtqueue index for cvq.
> > > >>
> > > > I think it is a great idea and it simplifies this patch somehow.
> > > > However, we need something like the queue mapping [1] to do so :).
> > > >
> > > > To double confirm:
> > > > * If the device supports MQ, only probe MQ. If not, only probe !MQ.
> > > > * Only store cvq_isolated in VhostVDPAState.
> > > >
> > > > Now, if the device does not negotiate MQ but the device supports MQ=
:
> > >
> > >
> > > I'm not sure I understand here, if device supports MQ it should accep=
ts
> > > MQ or we can fail the initialization here.
> > >
> >
> > My fault, I wanted to say "if the device offers MQ but the driver does
> > not acks it".
> >
> > >
> > > > * All the requests to queue 3 must be redirected to the last queue =
in
> > > > the device. That includes set_vq_address, notifiers regions, etc.
> > >
> > >
> > > This also means we will only mediate the case:
> > >
> > > 1) Qemu emulated virtio-net has 1 queue but device support multiple q=
ueue
> > >
> > > but not
> > >
> > > 2) Qemu emulated virtio-net has M queue but device support N queue (N=
>M)
> > >
> >
> > Right.
> >
> > >
> > > >
> > > > I'm totally ok to go this route but it's not immediate.
> > >
> > >
> > > Yes but I mean, we can start from failing the device if
> > > cvq_isolated_mq^cvq_isolated =3D=3D true
> > >
> >
> > So probe the two cases but set VhostVDPAState->cvq_isolated =3D
> > cvq_isolated && cvq_mq_isolated then? No map involved that way, and
> > all parents should behave that way.
> >
> > > (or I wonder if we can meet this condition for any existing parents).
> >
> > I don't think so, but I think we need to probe the two anyway.
> > Otherwise we may change the dataplane asid too.
>
> Just to make sure we are at the same page, I meant we could fail the
> initialization of vhost-vDPA is the device:
>
> 1) can isolate cvq in the case of singqueue but not multiqueue
>
> or
>
> 2) can isolate cvq in the case of multiqueue but not single queue
>
> Because I don't think there are any parents that have such a buggy
> implementation.
>

Got it.

Leaving out the queue multiplex for the moment, as it adds complexity
and we can add it on top.

Thanks!


