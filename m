Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1644B4206
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 07:37:14 +0100 (CET)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJUz3-0007Sv-E3
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 01:37:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJUxU-0006ef-Ag
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:35:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJUxR-0004ot-RI
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644820533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=04vM4dFhJsu7O0ScfnfqHo78IxwimCFONohV9GwOUHM=;
 b=EWt3vbypf/V+e7YQbfDprJeWY1Spmb0aqReeYkeT36nlNXuPAKNsyaN2UF5NLuBtxQy+4X
 cQq27yMaDcoNxg5QoTtvWJFofOX8kud7d7BdLU6LNWbrLScwdH/bLv0HeMHTSP8AZ7KM1T
 zhiI/Y2Lu18/OAwmhSMjV1BGqaYCMVE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-EzR4kL03M3iPLQa5Gh5_Xg-1; Mon, 14 Feb 2022 01:35:31 -0500
X-MC-Unique: EzR4kL03M3iPLQa5Gh5_Xg-1
Received: by mail-lf1-f71.google.com with SMTP id
 t27-20020ac24c1b000000b00438a5486bceso4859061lfq.21
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 22:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04vM4dFhJsu7O0ScfnfqHo78IxwimCFONohV9GwOUHM=;
 b=zp5rFKNYrgubfp23PO3DW/Brz28Qqnob4qmSI6SC6ccf+ZBqZDaesqusLDXM6soN6t
 lK7wztU3TKMyUlTPHkBejj8UOcclh4Nu4pR2WjDvKqcIm2wZJbabH1Vff+jTS5kZGZc+
 q+RuIkbp5ugUp5N8WKFjNMUCKbVEnyRjSqjAnyk2xhYAsZ8/4L6OqD4/Dpt+GliJElg9
 hNO79Q4s7yfIdKzrNLVicA6qzIeO9NTK3RpAqlFk3Vk6B9ybh8LCwR/aMSDbmhJR/dgw
 Tvom+pzs85g9MpAEFq/mZ/iFnJrE81pY6CQSh1OiH8rmK67Ftwd7aySfKk9qeNsjrFVi
 ufPw==
X-Gm-Message-State: AOAM530UAIS7r/+11VfEQ5UuMhkrycTsJYTGqqagGq5BrASGnJsFYmZy
 +PkKztQDcrVAJxHau8LJ5QwhyuDKdxABZjGN0rygdqhGsDA6dm8GaSRTj++wUKVI6MRx4Wl1jRJ
 VuuCl2QvkTNu2UwgyEz1RXOKIOSWdB4U=
X-Received: by 2002:a05:6512:39c6:: with SMTP id
 k6mr9866615lfu.199.1644820529544; 
 Sun, 13 Feb 2022 22:35:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe99ZHjPQ+wqrND3B2Moxcupzj4hUNU/kIzBtI/pqzUObwZn4fyGKWvFZaS4o292ABXcHHnyOEfLWsaM7d3EE=
X-Received: by 2002:a05:6512:39c6:: with SMTP id
 k6mr9866600lfu.199.1644820529264; 
 Sun, 13 Feb 2022 22:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214060346.72455-1-jasowang@redhat.com>
 <Ygn3I3T2DH3SHFXj@xz-m1.local>
In-Reply-To: <Ygn3I3T2DH3SHFXj@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 14:35:18 +0800
Message-ID: <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
Subject: Re: [PATCH] intel_iommu: support snoop control
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 2:31 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Feb 14, 2022 at 02:03:46PM +0800, Jason Wang wrote:
> > SC is required for some kernel features like vhost-vDPA. So this patch
> > implements basic SC feature. The idea is pretty simple, for software
> > emulated DMA it would be always coherent. In this case we can simple
> > advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
> > complicated, so this patch simply fail the IOMMU notifier
> > registration.
>
> Could we spell out which vhost branch won't work?

For vhost, it should work but the problem is that we need to introduce
more logics to demonstrate the notifier ability (e.g a dedicated
notifier flag for cc).

> How about also mention what
> this patch is used for (perhaps for some pure vdpa tests on fully emulated)?

That's fine, the main use case so far is to test vDPA in L1 guest.

>
> >
> > In the future, we may want to have a dedicated notifiers flag or
> > similar mechanism to demonstrate the coherency so VFIO could advertise
> > that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
> > need that since it's a software backend.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c          | 14 +++++++++++++-
> >  hw/i386/intel_iommu_internal.h |  1 +
> >  include/hw/i386/intel_iommu.h  |  1 +
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 5b865ac08c..5fa8e361b8 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3022,6 +3022,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
> >      IntelIOMMUState *s = vtd_as->iommu_state;
> >
> > +    /* TODO: add support for VFIO and vhost users */
> > +    if (s->snoop_control) {
> > +        error_setg_errno(errp, -ENOTSUP,
> > +                         "Snoop Control with vhost or VFIO is not supported");
> > +        return -ENOTSUP;
> > +    }
>
> IIUC this will also fail things like e.g. vhost-kernel but afaiu that can be
> fully emulated too.  That's expected, am I right?

Yes, I try to make the patch as simple as possible, so VFIO or any
kind of vhost won't work.

Thanks

>
> Thanks,
>
> > +
> >      /* Update per-address-space notifier flags */
> >      vtd_as->notifier_flags = new;
>
> --
> Peter Xu
>


