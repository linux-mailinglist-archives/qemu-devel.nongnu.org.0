Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB836E07B6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 09:29:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmrNM-0002n7-85; Thu, 13 Apr 2023 03:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pmrNJ-0002mv-Dr
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 03:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pmrNH-0001dt-MF
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 03:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681370886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skP1USaICaVN+jt99xKLHmTuSO17e2axoUXLLiLGjPw=;
 b=YkyaFM3GojEcUKvpYMXZokqecNviwe6j5YMTIussMSVkFc37Yo9g8BEEQs5/4QtAcY+5dm
 20wcWqRSBb1EsCcty1nHhHrxF3Gy5AEvps08xglbAPIaEmhbtv4xGLKCmdA6NR+vnB8pmY
 SLpydFSaZ53EfQSEoVv91ZZZnH3EF/Y=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-XjGK788qNHqqUIe5kaEpvw-1; Thu, 13 Apr 2023 03:28:05 -0400
X-MC-Unique: XjGK788qNHqqUIe5kaEpvw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-54f9df9ebc5so39700047b3.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 00:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681370885; x=1683962885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skP1USaICaVN+jt99xKLHmTuSO17e2axoUXLLiLGjPw=;
 b=DxyrySJ9J9sDmSY87bkk1yNTtJnzJRnn2bfLDViIVrEsG+TH/K/QVNG6O9xQZ/uySq
 vuJ+5rsFLM1mU8c8HVh5ZxGzpD4b2KNk8ufKt14dO6qEyfIrXb2SbsEnoKdtXz0EEM3m
 n9gYUu+pBlHdX7FNj9rvxRJ91noiZgHh9IEBLsE+SjoHPYXfH+f45wwQQHfDH7ogatai
 wc53TMuY8Pyr8XMTbxhEJ2kIaTlnf1E5D3MbcIcYMwOa166Y0xDrITfO5pXTbHfNLVvG
 FNaVXrEowvtcdjVQ0LenxvWmM5WAs3w6XpSDvCVHn3V8cC78/pUfjCjCzw79K1c2Ku9D
 JMgQ==
X-Gm-Message-State: AAQBX9effbySrpwqoAK3wRoKlCiDDvfTKoKd5OR5spOXR3Zgqwe5HHmL
 XtvFI5VnOBX5rFh5bfVREGmXiowrE3zyfoC+yiNPf262UGRzmLSCnuSRuXg03RKyZ4UXfg9A/sB
 mwWgstToGgtTx4EnSeRQoQksEK1DUzyU=
X-Received: by 2002:a81:4005:0:b0:540:e744:13ae with SMTP id
 l5-20020a814005000000b00540e74413aemr808131ywn.3.1681370884809; 
 Thu, 13 Apr 2023 00:28:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350YRrX7jbtvKaHWyeIfydaCcNSisLx0WbBS6lpz8bt+rPjcFQzp/CQCFzo1NQ2TGgSJsml933Fs99pod+e1aa3I=
X-Received: by 2002:a81:4005:0:b0:540:e744:13ae with SMTP id
 l5-20020a814005000000b00540e74413aemr808118ywn.3.1681370884596; Thu, 13 Apr
 2023 00:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CAJaqyWceWu5EpwAZjEAe5EkJ=SQ4bVYXohCjgqpkFtKiSb+OHQ@mail.gmail.com>
 <CACGkMEu0PYQ=dS=VcfOCX32153emzB9R++8K3HGXnyt2x8BDpQ@mail.gmail.com>
 <CACGkMEsvgv-nrjpLo67hFUf+5tau7kPgUu9TBh8PU5QruagMVQ@mail.gmail.com>
In-Reply-To: <CACGkMEsvgv-nrjpLo67hFUf+5tau7kPgUu9TBh8PU5QruagMVQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 13 Apr 2023 09:27:30 +0200
Message-ID: <CAJaqyWeNVVTaLpNeQpuc11xCkV5My=KgPi1OvVfeVTRxSgRc8A@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Longpeng <longpeng2@huawei.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
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

On Wed, Apr 12, 2023 at 8:19=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Wed, Apr 12, 2023 at 1:56=E2=80=AFPM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> > On Tue, Apr 11, 2023 at 8:34=E2=80=AFPM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Apr 5, 2023 at 1:37=E2=80=AFPM Eugenio Perez Martin <eperezma=
@redhat.com> wrote:
> > > >
> > > > Hi!
> > > >
> > > > As mentioned in the last upstream virtio-networking meeting, one of
> > > > the factors that adds more downtime to migration is the handling of
> > > > the guest memory (pin, map, etc). At this moment this handling is
> > > > bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, t=
he
> > > > destination device waits until all the guest memory / state is
> > > > migrated to start pinning all the memory.
> > > >
> > > > The proposal is to bind it to the char device life cycle (open vs
> > > > close), so all the guest memory can be pinned for all the guest / q=
emu
> > > > lifecycle.
> > > >
> > > > This has two main problems:
> > > > * At this moment the reset semantics forces the vdpa device to unma=
p
> > > > all the memory. So this change needs a vhost vdpa feature flag.
> > > > * This may increase the initialization time. Maybe we can delay it =
if
> > > > qemu is not the destination of a LM. Anyway I think this should be
> > > > done as an optimization on top.
> > > >
> > >
> > > Expanding on this we could reduce the pinning even more now that vrin=
g
> > > supports VA [1] with the emulated CVQ.
> >
> > Note that VA for hardware means the device needs to support page fault
> > through either PRI or vendor specific interface.
> >
> > >
> > > Something like:
> > > - Add VHOST_VRING_GROUP_CAN_USE_VA ioctl to check if a given VQ group
> > > capability. Passthrough devices with emulated CVQ would return false
> > > for the dataplane and true for the control vq group.
>
> We don't even need this actually, since the pinning is not visible to
> the userspace. Userspace can only see the IOTLB abstraction actually.
>
> We can invent a group->use_va, then when we attach AS to a group that
> can use va, we can avoid the pinning.
>

That would solve one part for sure, but SVQ will keep translating HVA
to SVQ IOVA, and then the kernel needs to translate it back. With
VHOST_VRING_GROUP_CAN_USE_VA, the SVQ and the kernel skip all
translation.

Thanks!

> Thanks
>
> > > - If that is true, qemu does not need to map and translate addresses
> > > for CVQ but to directly provide VA for buffers. This avoids pinning,
> > > translations, etc in this case.
> >
> > For CVQ yes, but we only avoid the pinning for CVQ not others.
> >
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > [1] https://lore.kernel.org/virtualization/20230404131326.44403-2-sga=
rzare@redhat.com/
> > >
>


