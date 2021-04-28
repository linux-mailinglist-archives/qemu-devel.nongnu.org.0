Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8A36D703
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:09:00 +0200 (CEST)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbizz-0007Hi-91
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lbix0-0005UB-F6
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:05:54 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:39819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lbiwt-00017G-Nc
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:05:50 -0400
Received: by mail-io1-xd34.google.com with SMTP id k25so19590847iob.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MteE/g/KmQ9BlQnYvGg30lhYeZdvbq7IAml0pL394Qs=;
 b=CrynjyOVZL6/shRVFdLnrQGrZTnnRxkeu6U7/7CMFwrHUpjHPnIjS37cZfn81ZETkg
 WxAC7nFoW7Q1/GgHnoMf96M7K3LArUbdpMufhtPSkxt+g+y3gp1hImC8V+ED/v1o8cqM
 78Hvj/VCwbEps8WYk18TEgvr7fSnK8IK+fwzr3QsRhAhmhkQCIwcA9ozeb7T9GsQ9M2i
 tOJn0afXqGd17F4A2FaCX8gLiaLy1CxXXcGAD27RxxyS+Ne2gpXGEKcwkSKPfDBy1C4k
 mHGl/j66yPl7T8up46UQwEcHuudeysikg7dmsfGvCkgNqUc7uqBhmpxJknupEQX4u+WP
 VRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MteE/g/KmQ9BlQnYvGg30lhYeZdvbq7IAml0pL394Qs=;
 b=a38muvd1FoWioVw4HgFxlJLrnFPNa9XsMdmaYWfgBTZKUInkVx/L8SVzctQK4SZIeh
 36MBU0IN+t0opI86sZYtxPgvApujUbBqontJUUPlA78TlTqorQAex7LIEl8d0Q9sW2E3
 IlOWbSiRfqiw7OZjkvvp/K962FeXqPRTcGENRbpJCxD1NEONCUCfCVZhgTTt3yP57SAk
 ztnbTFRV/rUoA9eNdl5KxmzOTeIqicQ7wsSM6f/CbUeSys9bOg8sSRMd46xBZk902L9X
 LrQPWQCVrAvFrIdkG2xJ7EUIpuNzSflzoIE6XAKdc7W4rJHlE8iT6aQFvK4yehP4Mlvf
 hmZg==
X-Gm-Message-State: AOAM53074oeasui2YB1F2OzkaQt9LVKKnrukikXZo49h/Eheu52o4u2I
 21Z6cGBhOfg6Yv+cXLrVuvm7TcuPzLtu+/b6i5c=
X-Google-Smtp-Source: ABdhPJxTkJLt+MGqyaYsRzxqQXLyGjYyCYjVO08zvaZwDx2+vpiA2EQqK4gKDorDcT2pI/Z1crFwWmPucJSgzl8GEJU=
X-Received: by 2002:a05:6638:2515:: with SMTP id
 v21mr26862139jat.110.1619611542943; 
 Wed, 28 Apr 2021 05:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
 <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
 <20210427121850.68d2a8dd@redhat.com> <YIhfWoRgJtaKZhh8@work-vm>
In-Reply-To: <YIhfWoRgJtaKZhh8@work-vm>
From: Dev Audsin <dev.devaqemu@gmail.com>
Date: Wed, 28 Apr 2021 13:04:57 +0100
Message-ID: <CANsN3OSs4GyT10P6xUp-s823U8VnWAmihWXQ1jSnF07wyYjxuA@mail.gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Dave for your explanation.
Any suggestions on how to make VFIO not attempt to map into the
unaccessible and unallocated RAM.

Best
Dev

On Tue, Apr 27, 2021 at 8:00 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Alex Williamson (alex.williamson@redhat.com) wrote:
> > On Tue, 27 Apr 2021 17:29:37 +0100
> > Dev Audsin <dev.devaqemu@gmail.com> wrote:
> >
> > > Hi Alex
> > >
> > > Based on your comments and thinking a bit, wonder if it makes sense to
> > > allow DMA map for the DAX cache but make unexpected mappings to be not
> > > fatal. Please let me know your thoughts.
> >
> > I think you're still working on the assumption that simply making the
> > VM boot is an improvement, it's not.  If there's a risk that a possible
> > DMA target for the device cannot be mapped, it's better that the VM
> > fail to boot than to expose that risk.  Performance cannot compromise
> > correctness.
> >
> > We do allow DMA mappings to other device memory regions to fail
> > non-fatally with the logic that peer-to-peer DMA is often not trusted
> > to work by drivers and therefore support would be probed before
> > assuming that it works.  I don't think that same logic applies here.
> >
> > Is there something about the definition of this particular region that
> > precludes it from being a DMA target for an assigned devices?
>
> It's never really the ram that's used.
> This area is really a chunk of VMA that's mmap'd over by (chunks of)
> normal files in the underlying exported filesystem.  The actual RAM
> block itself is just a placeholder for the VMA, and is normally mapped
> PROT_NONE until an actual file is mapped on top of it.
> That cache bar is a mapping containing multiple separate file chunk
> mappings.
>
> So I guess the problems for VFIO are:
>   a) At the start it's unmapped, unaccessible, unallocated ram.
>   b) Later it's arbitrary chunks of ondisk files.
>
> [on a bad day, and it's bad even without vfio, someone truncates the
> file mapping]
>
> Dave
>
> > Otherwise if it's initially unpopulated, maybe something like the
> > RamDiscardManager could be used to insert DMA mappings as the region
> > becomes populated.
> >
> > Simply disabling mapping to boot with both features together, without
> > analyzing how that missing mapping affects their interaction is not
> > acceptable.  Thanks,
> >
> > Alex
> >
> > > On Mon, Apr 26, 2021 at 10:22 PM Alex Williamson
> > > <alex.williamson@redhat.com> wrote:
> > > >
> > > > On Mon, 26 Apr 2021 21:50:38 +0100
> > > > Dev Audsin <dev.devaqemu@gmail.com> wrote:
> > > >
> > > > > Hi Alex and David
> > > > >
> > > > > @Alex:
> > > > >
> > > > > Justification on why this region cannot be a DMA target for the device,
> > > > >
> > > > > virtio-fs with DAX is currently not compatible with NIC Pass through.
> > > > > When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
> > > > > entire DAX Window but it is empty when the guest boots and will fail.
> > > > > A method to make VFIO and DAX to work together is to make vfio skip
> > > > > DAX cache.
> > > > >
> > > > > Currently DAX cache need to be set to 0, for the SR-IOV VF to be
> > > > > attached to Kata containers. Enabling both SR-IOV VF and DAX work
> > > > > together will potentially improve performance for workloads which are
> > > > > I/O and network intensive.
> > > >
> > > > Sorry, there's no actual justification described here.  You're enabling
> > > > a VM with both features, virtio-fs DAX and VFIO, but there's no
> > > > evidence that they "work together" or that your use case is simply
> > > > avoiding a scenario where the device might attempt to DMA into the area
> > > > with this designation.  With this change, if the device were to attempt
> > > > to DMA into this region, it would be blocked by the IOMMU, which might
> > > > result in a data loss within the VM.  Justification of this change
> > > > needs to prove that this region can never be a DMA target for the
> > > > device, not simply that both features can be enabled and we hope that
> > > > they don't interact.  Thanks,
> > > >
> > > > Alex
> > > >
> > >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

