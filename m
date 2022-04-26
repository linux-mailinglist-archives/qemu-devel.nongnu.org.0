Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32950FE53
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:08:37 +0200 (CEST)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKvk-0008Er-U1
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1njKt4-0003pR-L5
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 09:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1njKt1-0002oK-FR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 09:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650978346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EdINgQ3JgOAAEXTBvVys5eom+DJ2H2dyXQXTGpqbAk=;
 b=BkNT7CsrFS2J7jegF+banwajr7/oiUWKoMopC+qAQZsOh7nvGnh1U9KpY+TD6TPfveIBGm
 F4UcgyVapy7QrYBoSimUyS/AUAjwiVLwrL5x+Iure/wQHtZu0bhb526OvW2D9kHIass/W5
 BVznteHE3Qm70lKUtsQXrXx/PME/dRk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-j3Vo7-4kNyynKtkOKuhAjg-1; Tue, 26 Apr 2022 09:05:43 -0400
X-MC-Unique: j3Vo7-4kNyynKtkOKuhAjg-1
Received: by mail-qv1-f69.google.com with SMTP id
 s19-20020ad44b33000000b00456107e1120so7764594qvw.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 06:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1EdINgQ3JgOAAEXTBvVys5eom+DJ2H2dyXQXTGpqbAk=;
 b=6n4PESQbOmBGW/FXtL7IIwuFxTKvWV3aE075LEx6XZN+jLu63mk4ICvVilWILR3hP3
 bl6bvR+nwuDkOE1ZTc+GgYFG4ingMPHERQM5x6b9hip+DDEcIobyjDYv39aCOuzds9hg
 2hDyXMdLQvf4cWqwF4xpkdn48h3DcGgtszLoImyvV1Sp2I6icT0dFTi+70KeKiRvq429
 q4JVGlv6dkaIK9beAgQmubxx2Ac8hryBxezUmyqFw20gGlwK2JNBnO4THnfNu43NW7Gc
 21QajaiVkOYrwlgfsKbNRidVGT/tEQaE7KIDh+zPru2+5Ns8/D6xgVz8oW6awYx734NG
 9RGA==
X-Gm-Message-State: AOAM5331phFEAKb5SRCptaRT4bHKLv51pRMzMuJiiidFX3YAuLRjQU6D
 sLydgwIOq8YCwNixQBDlgM/fjJrnCrg7koLfo9pu+ESXrUovi7mdfEwvre9Rpv1kvooh8pb5GyL
 7t5W2JBFLLIVZsY3c9i1FH5AzAq+EsOw=
X-Received: by 2002:a05:620a:1f6:b0:69e:cba0:e63a with SMTP id
 x22-20020a05620a01f600b0069ecba0e63amr12530260qkn.764.1650978343270; 
 Tue, 26 Apr 2022 06:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8OcLAB6Du2/G6V0s69i85WBTPx2wwBgMhubcTroYz7/34w23984uztwGhqvZntV7oEHlnIA1OLCKJsjJrl0k=
X-Received: by 2002:a05:620a:1f6:b0:69e:cba0:e63a with SMTP id
 x22-20020a05620a01f600b0069ecba0e63amr12530223qkn.764.1650978342944; Tue, 26
 Apr 2022 06:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220405063628.853745-1-eperezma@redhat.com>
 <735751c6-c230-5013-7a65-0d210094fd74@vivier.eu>
In-Reply-To: <735751c6-c230-5013-7a65-0d210094fd74@vivier.eu>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 26 Apr 2022 15:05:06 +0200
Message-ID: <CAJaqyWfu-oj71CKE6nYUY20kWff3cVvq6_gmZeZGSRxyZToijA@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Add missing tracing to batch mapping functions
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 12:40 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 05/04/2022 =C3=A0 08:36, Eugenio P=C3=A9rez a =C3=A9crit :
> > These functions were not traced properly.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 2 ++
> >   hw/virtio/trace-events | 2 ++
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 8adf7c0b92..9e5fe15d03 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct =
vhost_vdpa *v)
> >           .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> >       };
> >
> > +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.t=
ype);
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                        fd, errno, strerror(errno));
> > @@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListen=
er *listener)
> >       msg.type =3D v->msg_type;
> >       msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >
> > +    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                        fd, errno, strerror(errno));
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index a5102eac9e..333348d9d5 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uin=
t64_t rb_offset) "%s + 0x%"
> >   # vhost-vdpa.c
> >   vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t io=
va, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd:=
 %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx=
64" perm: 0x%"PRIx8" type: %"PRIu8
> >   vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t =
iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova=
: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> > +vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, ui=
nt8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > +vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t=
 type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t ll=
end, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx6=
4" vaddr: %p read-only: %d"
> >   vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t ll=
end) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
> >   vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%=
"PRIx8
> > --
> > 2.27.0
> >
> >
>
> Applied to my trivial-patches branch.
>
> (I know you have an (identicial) v7 of this patch in a series, but as thi=
s one is reviewed, acked
> and sent to trivial I've merged it).
>

Thanks! The v7 is about the series as a whole, not only about this
patch, so everything is right.

>
> Thanks,
> Laurent
>
>


