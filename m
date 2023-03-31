Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8836D1DB1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBk3-00081I-9v; Fri, 31 Mar 2023 06:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1piBk1-00080u-CZ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1piBjz-0004YM-OY
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680257534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX/aRVgeMK7mHFZh6hOUUdzytZn60ZCf9XMOSa4kxRw=;
 b=KF57QKuXT6RUU8f7CQMPcNn0m6dqERjP+vqnnudA/JrUYCQSaQ2EWSxEi7nh9HHLdWmV/w
 IuaIVK1S5tArSncJDzFMFr2plhJWaI3FnHdsXJ8d6zIeDDYVA7M0K23qzcA2QGrCrUWlC2
 Uir2SkZY18LZ4udFs6MLr9zzfoS3nqw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-849GMxFKMd-bdwXVTm8DoA-1; Fri, 31 Mar 2023 06:12:13 -0400
X-MC-Unique: 849GMxFKMd-bdwXVTm8DoA-1
Received: by mail-yb1-f200.google.com with SMTP id
 f66-20020a255145000000b00b714602d43fso21786095ybb.10
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680257532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JX/aRVgeMK7mHFZh6hOUUdzytZn60ZCf9XMOSa4kxRw=;
 b=xU5R7YA6KCk1ArUVTHvhQ1iXQKInkOHN3FQyg6GbZiWulbvU7idohlxRKGrx5+mPC8
 apMBI9J9tov+I1WgXC1XRlwgR81OsIZKTG6nDN1d5bx9W+5Y/isbPEEzCVvYAYdaDP9U
 WMiS4HXK9FZCNfgZkN1B/NC5GOZn2lS+UUxVD55FZj+QKwbAKWPXbu49/zLrYhEQyoGN
 IqNWOenKUPNsnbTK1O3Rnrb3s/iZpbacd4LQwUGYPKHlAEr1TIm2A7rbrFiZIQIhbaDo
 COfIySJ08dh1eCJdB2JtuMyS2f0YrZU/IQgez6q3mEMCAA4ZvZuxD8qcfQXUSEVxksMb
 r7Sw==
X-Gm-Message-State: AAQBX9ckRcsr2MYcKeegLDp7qS6y+yDPQ+52r06WLFuegG9b/J5KgVJ0
 32pPIkQvmvV4irkDcfqF3aWDsnkI/kzKIxmBT0L95SWIvlvn8+jeapD6MlqjfLbSozYwBvap2Yr
 eEcwWwqB1FnruD+/CqPKBl2PbwXrO6xQ=
X-Received: by 2002:a81:c444:0:b0:544:a67b:8be0 with SMTP id
 s4-20020a81c444000000b00544a67b8be0mr12687494ywj.3.1680257532494; 
 Fri, 31 Mar 2023 03:12:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZuhfSwrfV99GPoD+W6VfsjwQ+3Z9QedDXr/tP1I0U6L+zNYvF53XtVcWxn/Iuy+K8xODojw6oOA2U33cWl3LE=
X-Received: by 2002:a81:c444:0:b0:544:a67b:8be0 with SMTP id
 s4-20020a81c444000000b00544a67b8be0mr12687484ywj.3.1680257532241; Fri, 31 Mar
 2023 03:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
 <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
 <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
 <CAJaqyWeUxm9=Hup58gsBypQXJbeW2BTu3YpV7VDVOA2rXbtPWg@mail.gmail.com>
 <0cc19893-f832-f03a-cbb0-19f053ff8aa7@redhat.com>
In-Reply-To: <0cc19893-f832-f03a-cbb0-19f053ff8aa7@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 31 Mar 2023 12:11:36 +0200
Message-ID: <CAJaqyWfk0x0Sym1wZvm5jKPi6EsyQMXFr3Tnb_StxM25uamoTA@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Fri, Mar 31, 2023 at 10:00=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
>
> =E5=9C=A8 2023/3/30 18:42, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Thu, Mar 30, 2023 at 8:23=E2=80=AFAM Jason Wang <jasowang@redhat.com=
> wrote:
> >> On Thu, Mar 30, 2023 at 2:20=E2=80=AFPM Jason Wang <jasowang@redhat.co=
m> wrote:
> >>> On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@=
redhat.com> wrote:
> >>>> Evaluating it at start time instead of initialization time may make =
the
> >>>> guest capable of dynamically adding or removing migration blockers.
> >>>>
> >>>> Also, moving to initialization reduces the number of ioctls in the
> >>>> migration, reducing failure possibilities.
> >>>>
> >>>> As a drawback we need to check for CVQ isolation twice: one time wit=
h no
> >>>> MQ negotiated and another one acking it, as long as the device suppo=
rts
> >>>> it.  This is because Vring ASID / group management is based on vq
> >>>> indexes, but we don't know the index of CVQ before negotiating MQ.
> >>> We need to fail if we see a device that can isolate cvq without MQ bu=
t
> >>> not with MQ.
> >>>
> >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>> ---
> >>>> v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
> >>>> ---
> >>>>   net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++-------=
----
> >>>>   1 file changed, 151 insertions(+), 43 deletions(-)
> >>>>
> >>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>> index 4397c0d4b3..db2c9afcb3 100644
> >>>> --- a/net/vhost-vdpa.c
> >>>> +++ b/net/vhost-vdpa.c
> >>>> @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
> >>>>
> >>>>       /* The device always have SVQ enabled */
> >>>>       bool always_svq;
> >>>> +
> >>>> +    /* The device can isolate CVQ in its own ASID if MQ is negotiat=
ed */
> >>>> +    bool cvq_isolated_mq;
> >>>> +
> >>>> +    /* The device can isolate CVQ in its own ASID if MQ is not nego=
tiated */
> >>>> +    bool cvq_isolated;
> >>> As stated above, if we need a device that cvq_isolated_mq^cvq_isolate=
d
> >>> =3D=3D true, we need to fail. This may reduce the complexity of the c=
ode?
> >>>
> >>> Thanks
> >> Since we are the mediation layer, Qemu can alway choose to negotiate
> >> MQ regardless whether or not it is supported by the guest. In this
> >> way, we can have a stable virtqueue index for cvq.
> >>
> > I think it is a great idea and it simplifies this patch somehow.
> > However, we need something like the queue mapping [1] to do so :).
> >
> > To double confirm:
> > * If the device supports MQ, only probe MQ. If not, only probe !MQ.
> > * Only store cvq_isolated in VhostVDPAState.
> >
> > Now, if the device does not negotiate MQ but the device supports MQ:
>
>
> I'm not sure I understand here, if device supports MQ it should accepts
> MQ or we can fail the initialization here.
>

My fault, I wanted to say "if the device offers MQ but the driver does
not acks it".

>
> > * All the requests to queue 3 must be redirected to the last queue in
> > the device. That includes set_vq_address, notifiers regions, etc.
>
>
> This also means we will only mediate the case:
>
> 1) Qemu emulated virtio-net has 1 queue but device support multiple queue
>
> but not
>
> 2) Qemu emulated virtio-net has M queue but device support N queue (N>M)
>

Right.

>
> >
> > I'm totally ok to go this route but it's not immediate.
>
>
> Yes but I mean, we can start from failing the device if
> cvq_isolated_mq^cvq_isolated =3D=3D true
>

So probe the two cases but set VhostVDPAState->cvq_isolated =3D
cvq_isolated && cvq_mq_isolated then? No map involved that way, and
all parents should behave that way.

> (or I wonder if we can meet this condition for any existing parents).

I don't think so, but I think we need to probe the two anyway.
Otherwise we may change the dataplane asid too.

Thanks!


