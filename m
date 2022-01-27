Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998CA49DDEF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:27:51 +0100 (CET)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD14I-0006n5-7l
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:27:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nD11h-0005Es-Ud
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:25:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nD11e-0006ic-HB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643275505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V54GEKDs9ByYGsH2C0ASukSq+bC+nPxcbaTBaVf3LiE=;
 b=I0U+a38xnYt1nb0OHVFmxBxZFiUrJPgkj37/YFCCEUmXcXhdhpTt5RvBVkHF6MypNiKsGr
 HLsVy0now0/Il5L4dLKHuz9hyQR79m3A9hWwhhFwhnoXE/VM41WOzcUzFY7W+RIt/O2JUN
 V5m+0UpYlNgYeVEuvr8ZbbXEDNpgPYM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-gPzEIzEEPyuBdI5tGW443A-1; Thu, 27 Jan 2022 04:25:04 -0500
X-MC-Unique: gPzEIzEEPyuBdI5tGW443A-1
Received: by mail-qt1-f197.google.com with SMTP id
 a6-20020ac844a6000000b002cf3968d32aso1813005qto.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V54GEKDs9ByYGsH2C0ASukSq+bC+nPxcbaTBaVf3LiE=;
 b=xpi/r1yhyi2Px/H8HewtGh7uId/YO39DzTB11aR8i8ossB5yK4V6jJZ6FrmQm1H5cl
 VZlrJlnRS922ubNoNCPN2XZRJXyT6e212joXJnBXWlfQ3ELIyVLf/A6Aga0O6wXAD0zH
 JxNpCb97aGL4s97w8Q7TKQ3titF8AXByvg7dVvLz4yUOwqrHeeI77yGU6lBNe1fo6QhP
 BXi5U6M16E275eaP+JqAWB9QdqiilyLfjYMW2j4wl8ZCQZs6Mcd++GQ6w2qu5rg28oxY
 e1C17apakwrDOiKgYkdfVaRXMpFjKSmYf+ZKDZvNU3AiqmyQz0Qt5RGu3+HSRE5Z+Blo
 QP4w==
X-Gm-Message-State: AOAM530JFqlZq9vYFSmNaGwGh6NsGhDKV+p9mcNEtEBZANOAMhKLVl6d
 fBYZfIFdZUZ3ujEmau2vyr7vMWLd++N5lfBJukd4tBRkfe/6NVdrdVc1MneWvukeRbsdmwIToNf
 wgkKZoK+50Wn1r4LItOr5CMRIyk9/Ovo=
X-Received: by 2002:ac8:5751:: with SMTP id 17mr1901503qtx.459.1643275503489; 
 Thu, 27 Jan 2022 01:25:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTG7EnK+P7K+HMcf9k/Hm6UNNiS4172hag31yARUywbvea0Jj06/fPO7ACUMDKRgoHan+qxOnyeNVtDAgH5kQ=
X-Received: by 2002:ac8:5751:: with SMTP id 17mr1901479qtx.459.1643275503226; 
 Thu, 27 Jan 2022 01:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
 <Ye6IhLCe6NDKO6+E@xz-m1.local>
 <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
 <YfJSezhQv1kXa1x8@xz-m1.local>
In-Reply-To: <YfJSezhQv1kXa1x8@xz-m1.local>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Jan 2022 10:24:27 +0100
Message-ID: <CAJaqyWczZ7C_vbwugyN9bEgOVuRokGqVMb_g5UK_R4F8O+qKOA@mail.gmail.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 9:06 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Jan 25, 2022 at 10:40:01AM +0100, Eugenio Perez Martin wrote:
> > So I think that the first step to remove complexity from the old one
> > is to remove iova_begin and iova_end.
> >
> > As Jason points out, removing iova_end is easier. It has the drawback
> > of having to traverse all the list beyond iova_end, but a well formed
> > iova tree should contain none. If the guest can manipulate it, it's
> > only hurting itself adding nodes to it.
> >
> > It's possible to extract the check for hole_right (or this in Jason's
> > proposal) as a special case too.
> >
> > But removing the iova_begin parameter is more complicated. We cannot
> > know if it's a valid hole without knowing iova_begin, and we cannot
> > resume traversing. Could we assume iova_begin will always be 0? I
> > think not, the vdpa device can return anything through syscall.
>
> Frankly I don't know what's the syscall you're talking about,

I meant VHOST_VDPA_GET_IOVA_RANGE, which allows qemu to know the valid
range of iova addresses. We get a pair of uint64_t from it, that
indicates the minimum and maximum iova address the device (or iommu)
supports.

We must allocate iova ranges within that address range, which
complicates this algorithm a little bit. Since the SVQ iova addresses
are not GPA, qemu needs extra code to be able to allocate and free
them, creating a new custom iova as.

Please let me know if you want more details or if you prefer me to
give more context in the patch message.

> but after a 2nd
> thought and after I went back and re-read your previous version more carefully
> (the one without the list) I think it seems working to me in general.  I should
> have tried harder when reviewing the first time!
>

I guess I should have added more context so this particular change can
be better understood in isolation.

> I mean this one:
>
> https://lore.kernel.org/qemu-devel/20211029183525.1776416-24-eperezma@redhat.com/
>
> Though this time I have some comments on the details.
>
> Personally I like that one (probably with some amendment upon the old version)
> more than the current list-based approach.  But I'd like to know your thoughts
> too (including Jason).  I'll further comment in that thread soon.
>

Sure, I'm fine with whatever solution we choose, but I'm just running
out of ideas to simplify it. Reading your suggestions on old RFC now.

Overall I feel list-based one is both more convenient and easy to
delete when qemu raises the minimal glib version, but it adds a lot
more code.

It could add less code with this less elegant changes:
* If we just put the list entry in the DMAMap itself, although it
exposes unneeded implementation details.
* We force the iova tree either to be an allocation-based or an
insertion-based, but not both. In other words, you can only either use
iova_tree_alloc or iova_tree_insert on the same tree.

I have a few tests to check the algorithms, but they are not in the
qemu test format. I will post them so we all can understand better
what is expected from this.

Thanks!



Thanks!

> Thanks,
>
> --
> Peter Xu
>


