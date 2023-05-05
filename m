Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43FD6F806D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:55:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pus9A-00015d-Sn; Fri, 05 May 2023 05:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pus99-00015V-Aw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pus96-0008AQ-9h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683280475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFEeuj4LpRXslhrH0oCPqSNepenRQrEeJOAbBxLyGxE=;
 b=jRO/B4tJP1PPbiOHEvfYUbR1xI+2hXWqztmdrgwWBRS2Dy7MpTMeXjuQswKxvmlj6JQ1u2
 65N7kOIH+q1DI9WGEP74HbtyM+HAkZm/ABpgnUOKf0iHjrtu3jpMbSmsi/j+SPbhDbDutl
 j1rwj4W9QTWCy+PlWMtP2MhQm/yfG08=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-iNuZyALsMaiCorggo4cSag-1; Fri, 05 May 2023 05:54:34 -0400
X-MC-Unique: iNuZyALsMaiCorggo4cSag-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-b9a6eeea78cso16945067276.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683280473; x=1685872473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFEeuj4LpRXslhrH0oCPqSNepenRQrEeJOAbBxLyGxE=;
 b=RAO646CJ8stT/s65rw8i8UgnBnFDxUQq41Tbx3OcgrtYQ/UGzyszeUxNOv6XhonN8m
 ZVuhTjYMxj8l4tX8i3+jVZzYTyE18Dz0C1KsrQV1P2RKHbd4AvDigO65niDf/fq0xPAs
 gobTpp6dXjOXfzKQMN38QnxtA3RkT1x8BEXjDlBLIBzF9wOkZ9oR/4ohQGkKuae2rkDa
 9vR4t+yjxu1DoTkgl3SL6Iej1TDutlvPYeqDn/4emIsuZEyov6cTm9TJLHQY4/q2fiDX
 JiQ/3PXQaFVjQywApiofzA4+ZMmQbc84O+Yj4Pvv0wa44U9ZvJ3ZZrfHHDMY7d1Js7b3
 txvQ==
X-Gm-Message-State: AC+VfDy6aVQ/2kT83UGmI/HB+YnglJQutUwoQOUyXpa+5LMbDwTsW8lu
 PrJ6FI73w3Wi85mOodGqG72EPu2oK9ZcrsoQtVXJauoQtK1xPjSOnYTdVo47ckwb+qtqFqGdXGN
 pqnwdkJ469UkWA+ZrCdx+5VOuEiEgP0k=
X-Received: by 2002:a05:6902:1109:b0:b9d:a24b:38fc with SMTP id
 o9-20020a056902110900b00b9da24b38fcmr1263731ybu.14.1683280473439; 
 Fri, 05 May 2023 02:54:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vNltfb2vccPE7RKrgS0ye+vdjFHNZyIqrQI8I4dIFkT+5gvWhKYCOBTRAkRiq9bkno1FlfZEJFeAoa2hD0bE=
X-Received: by 2002:a05:6902:1109:b0:b9d:a24b:38fc with SMTP id
 o9-20020a056902110900b00b9da24b38fcmr1263715ybu.14.1683280473099; Fri, 05 May
 2023 02:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
In-Reply-To: <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 5 May 2023 11:53:56 +0200
Message-ID: <CAJaqyWdhBq=0f-Qhbdg3AduS8zkPV5p6-uEEn24p1hRKcA3pOQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 5, 2023 at 11:03=E2=80=AFAM Hanna Czenczek <hreitz@redhat.com> =
wrote:
>
> On 04.05.23 23:14, Stefan Hajnoczi wrote:
> > On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com> wrote:
> >> On 11.04.23 17:05, Hanna Czenczek wrote:
> >>
> >> [...]
> >>
> >>> Hanna Czenczek (4):
> >>>     vhost: Re-enable vrings after setting features
> >>>     vhost-user: Interface for migration state transfer
> >>>     vhost: Add high-level state save/load functions
> >>>     vhost-user-fs: Implement internal migration
> >> I=E2=80=99m trying to write v2, and my intention was to keep the code
> >> conceptually largely the same, but include in the documentation change
> >> thoughts and notes on how this interface is to be used in the future,
> >> when e.g. vDPA =E2=80=9Cextensions=E2=80=9D come over to vhost-user.  =
My plan was to,
> >> based on that documentation, discuss further.
> >>
> >> But now I=E2=80=99m struggling to even write that documentation becaus=
e it=E2=80=99s not
> >> clear to me what exactly the result of the discussion was, so I need t=
o
> >> stop even before that.
> >>
> >> So as far as I understand, we need/want SUSPEND/RESUME for two reasons=
:
> >> 1. As a signal to the back-end when virt queues are no longer to be
> >> processed, so that it is clear that it will not do that when asked for
> >> migration state.
> >> 2. Stateful devices that support SET_STATUS receive a status of 0 when
> >> the VM is stopped, which supposedly resets the internal state. While
> >> suspended, device state is frozen, so as far as I understand, SUSPEND
> >> before SET_STATUS would have the status change be deferred until RESUM=
E.
> > I'm not sure about SUSPEND -> SET_STATUS 0 -> RESUME. I guess the
> > device would be reset right away and it would either remain suspended
> > or be resumed as part of reset :).
> >
> > Unfortunately the concepts of SUSPEND/RESUME and the Device Status
> > Field are orthogonal and there is no spec that explains how they
> > interact.
>
> Ah, OK.  So I guess it=E2=80=99s up to the implementation to decide wheth=
er the
> virtio device status counts as part of the =E2=80=9Cconfiguration=E2=80=
=9D that =E2=80=9C[it]
> must not change=E2=80=9D.
>

That's a very good point indeed. I think the easier way to think about
it is that reset must be able to recover the device always, so it must
take precedence over the suspension. But I think it is good to make it
explicit, at least in current vDPA headers.

> >> I don=E2=80=99t want to hang myself up on 2 because it doesn=E2=80=99t=
 really seem
> >> important to this series, but: Why does a status of 0 reset the intern=
al
> >> state?  [Note: This is all virtio_reset() seems to do, set the status =
to
> >> 0.]  The vhost-user specification only points to the virtio
> >> specification, which doesn=E2=80=99t say anything to that effect. Inst=
ead, an
> >> explicit device reset is mentioned, which would be
> >> VHOST_USER_RESET_DEVICE, i.e. something completely different. Because
> >> RESET_DEVICE directly contradicts SUSPEND=E2=80=99s description, I wou=
ld like to
> >> think that invoking RESET_DEVICE on a SUSPEND-ed device is just invali=
d.
> > The vhost-user protocol didn't have the concept of the VIRTIO Device
> > Status Field until SET_STATUS was added.
> >
> > In order to participate in the VIRTIO device lifecycle to some extent,
> > the pre-SET_STATUS vhost-user protocol relied on vhost-user-specific
> > messages like RESET_DEVICE.
> >
> > At the VIRTIO level, devices are reset by setting the Device Status
> > Field to 0.
>
> (I didn=E2=80=99t find this in the virtio specification until today, turn=
s out
> it=E2=80=99s under 4.1.4.3 =E2=80=9CCommon configuration structure layout=
=E2=80=9D, not under
> 2.1 =E2=80=9CDevice Status Field=E2=80=9D, where I was looking.)
>

Yes, but you had a point. That section is only for PCI transport, not
as a generic way to reset the device. Channel I/O uses an explicit
CCW_CMD_VDEV_RESET command for reset, more similar to
VHOST_USER_RESET_DEVICE.

> > All state is lost and the Device Initialization process
> > must be followed to make the device operational again.
> >
> > Existing vhost-user backends don't implement SET_STATUS 0 (it's new).
> >
> > It's messy and not your fault. I think QEMU should solve this by
> > treating stateful devices differently from non-stateful devices. That
> > way existing vhost-user backends continue to work and new stateful
> > devices can also be supported.
>
> It=E2=80=99s my understanding that SET_STATUS 0/RESET_DEVICE is problemat=
ic for
> stateful devices.  In a previous email, you wrote that these should
> implement SUSPEND+RESUME so qemu can use those instead.  But those are
> separate things, so I assume we just use SET_STATUS 0 when stopping the
> VM because this happens to also stop processing vrings as a side effect?
>
> I.e. I understand =E2=80=9Ctreating stateful devices differently=E2=80=9D=
 to mean that
> qemu should use SUSPEND+RESUME instead of SET_STATUS 0 when the back-end
> supports it, and stateful back-ends should support it.
>

Honestly I cannot think of any use case where the vhost-user backend
did not ignore set_status(0) and had to retrieve vq states. So maybe
we can totally remove that call from qemu?

> >> Is it that a status 0 won=E2=80=99t explicitly reset the internal stat=
e, but
> >> because it does mean that the driver is unbound, the state should
> >> implicitly be reset?
> > I think the fundamental problem is that transports like virtio-pci put
> > registers back in their initialization state upon reset, so internal
> > state is lost.
> >
> > The VIRTIO spec does not go into detail on device state across reset
> > though, so I don't think much more can be said about the semantics.
> >
> >> Anyway.  1 seems to be the relevant point for migration.  As far as I
> >> understand, currently, a vhost-user back-end has no way of knowing whe=
n
> >> to stop processing virt queues.  Basically, rings can only transition
> >> from stopped to started, but not vice versa.  The vhost-user
> >> specification has this bit: =E2=80=9COnce the source has finished migr=
ation,
> >> rings will be stopped by the source. No further update must be done
> >> before rings are restarted.=E2=80=9D  It just doesn=E2=80=99t say how =
the front-end lets
> >> the back-end know that the rings are (to be) stopped.  So this seems
> >> like a pre-existing problem for stateless migration.  Unless this is
> >> communicated precisely by setting the device status to 0?
> > No, my understanding is different. The vhost-user spec says the
> > backend must "stop [the] ring upon receiving
> > ``VHOST_USER_GET_VRING_BASE``".
>
> Yes, I missed that part!
>
> > The "Ring states" section goes into
> > more detail and adds the concept of enabled/disabled too.
> >
> > SUSPEND is stronger than GET_VRING_BASE though. GET_VRING_BASE only
> > applies to a single virtqueue, whereas SUSPEND acts upon the entire
> > device, including non-virtqueue aspects like Configuration Change
> > Notifications (VHOST_USER_BACKEND_CONFIG_CHANGE_MSG).
> >
> > You can approximate SUSPEND today by sending GET_VRING_BASE for all
> > virtqueues. I think in practice this does fully stop the device even
> > if the spec doesn't require it.
> >
> > If we want minimal changes to vhost-user, then we could rely on
> > GET_VRING_BASE to suspend and SET_VRING_ENABLE to resume. And
> > SET_STATUS 0 must not be sent so that the device's state is not lost.
>
> So you mean that we=E2=80=99d use SUSPEND instead of SET_STATUS 0, but be=
cause
> we have no SUSPEND, we=E2=80=99d ensure that GET_VRING_BASE is/was called=
 on all
> vrings?
>
> > However, this approach means this effort needs to be redone when it's
> > time to add stateful device support to vDPA and the QEMU vhost code
> > will become more complex. I think it's better to agree on a proper
> > model that works for both vhost-user and vhost-vdpa now to avoid more
> > hacks/special cases.
>
> Agreeing is easy, actually adding SUSPEND+RESUME to the vhost-user
> protocol is what I=E2=80=99d prefer to avoid. :)
>
> The question is whether it=E2=80=99s really effort if we were (in qemu) t=
o just
> implement SUSPEND as a GET_VRING_BASE to all vrings for vhost-user.  I
> don=E2=80=99t think there is a direct equivalent to RESUME, because the b=
ack-end
> is supposed to start rings automatically when it receives a kick, but
> that will only happen when the vCPUs run, so that should be fine.
>
> >> Naturally, what I want to know most of all is whether you believe I ca=
n
> >> get away without SUSPEND/RESUME for now.  To me, it seems like honestl=
y
> >> not really, only when turning two blind eyes, because otherwise we can=
=E2=80=99t
> >> ensure that virtiofsd isn=E2=80=99t still processing pending virt queu=
e requests
> >> when the state transfer is begun, even when the guest CPUs are already
> >> stopped.  Of course, virtiofsd could stop queue processing right there
> >> and then, but=E2=80=A6  That feels like a hack that in the grand schem=
e of
> >> things just isn=E2=80=99t necessary when we could =E2=80=9Cjust=E2=80=
=9D introduce
> >> SUSPEND/RESUME into vhost-user for exactly this.
> >>
> >> Beyond the SUSPEND/RESUME question, I understand everything can stay
> >> as-is for now, as the design doesn=E2=80=99t seem to conflict too badl=
y with
> >> possible future extensions for other migration phases or more finely
> >> grained migration phase control between front-end and back-end.
> >>
> >> Did I at least roughly get the gist?
> > One part we haven't discussed much: I'm not sure how much trouble
> > you'll face due to the fact that QEMU assumes vhost devices can be
> > reset across vhost_dev_stop() -> vhost_dev_start(). I don't think we
> > should keep a copy of the state in-memory just so it can be restored
> > in vhost_dev_start().
>
> All I can report is that virtiofsd continues to work fine after a
> cancelled/failed migration.
>

Isn't the device reset after a failed migration? At least net devices
are reset before sending VMState. If it cannot be applied at the
destination, the device is already reset...

> > I think it's better to change QEMU's vhost code
> > to leave stateful devices suspended (but not reset) across
> > vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
> > vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
> > this aspect?
>
> Yes and no; I mean, I haven=E2=80=99t in detail, but I thought this is wh=
at=E2=80=99s
> meant by suspending instead of resetting when the VM is stopped.
>

... unless we perform these changes of course :).

Thanks!


