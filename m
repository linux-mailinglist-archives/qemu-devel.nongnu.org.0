Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867E3DF9F4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 05:21:11 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB7Sv-0001M1-MG
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 23:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7Ry-0000cI-Sc
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:20:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7Rv-0001M5-Bl
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628047205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSJEGWyj6vFrX7f2H5msNYPeL1wgqBVgmgNIQ+9yVIs=;
 b=ZZe2LEZAwFq+Qqc2UORtyXlcVSmOKqqy6196hjy+Hd7BpGEFAW3t4+HMIvlQJ0SZA9vJpk
 Zrdl6n80ND8l1Vq4LdwGslMhi2o+CxJm44TIGQccklsH0PaPbYUC4pQbYa36OGMkuP0gzP
 Yq9j2K0YD5yiBc12ShP044wb3OvjQRM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-8UCWXMghNXuQmLZEGlEHdA-1; Tue, 03 Aug 2021 23:20:03 -0400
X-MC-Unique: 8UCWXMghNXuQmLZEGlEHdA-1
Received: by mail-lf1-f70.google.com with SMTP id
 u16-20020ac258d00000b02903b9b0795d91so535460lfo.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 20:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gSJEGWyj6vFrX7f2H5msNYPeL1wgqBVgmgNIQ+9yVIs=;
 b=ixfc6kuwuhKLy/b7884tNH1wVkAiGEUYgSxsHCxtt37vX+ztkQLVTMW5mOYLXwIv80
 5GYcHb4d6hi3aeC/NnWbC+kCJb3HQAZrxg4gjfBagRXdmZeQlrJI0tLod2qN7CNmv72T
 M+5I+aifZRfEU78enExR7fcZadLcSS/OEasXOkUvCUzl/7c3y78nw7F7n2NJNBdSFnMv
 xhhjwsscmXImF3Bln4zFRVQfm3e/7VRXQAo1M/EDg1CUEIUQ9xKasY0uQoExCGs1jvQv
 cikytG0FrFxDA1ldMCwqXNElyj/5C4ymoJFYSEFWvh89RIZgNgdy76DZcwLRdkijdMqx
 wVmw==
X-Gm-Message-State: AOAM533zTo4r7FyExgrNPC9c6vMhp9vYAcQ+hjFyye62UU01eceAYtWH
 cjh6TcL9908Lj4K7hGZh3O1l6zkikSNBXwgNjFG5LbV8O/uRDGvDgSGbO0O3+XNleawkQwzQVaI
 9MjcY83wCfWSN/iewyKw39hq6DNY4nVk=
X-Received: by 2002:a05:6512:3056:: with SMTP id
 b22mr18547255lfb.339.1628047202247; 
 Tue, 03 Aug 2021 20:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuz0m6dzpcRfNiNL17TBAIcmc+tXwVEXu6g8noeTi1xcrlGqylfP21GUp7tXqZftOOPrWHnz2D6W8TTRymn6w=
X-Received: by 2002:a05:6512:3056:: with SMTP id
 b22mr18547244lfb.339.1628047201925; 
 Tue, 03 Aug 2021 20:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210721075402.203711-1-chao.gao@intel.com>
 <20210803042927.GA30466@gao-cwp>
 <5321eefb-7177-2009-6aae-f8c398731eac@redhat.com>
 <20210803055127.GA31303@gao-cwp>
 <950f83e5-cc48-17b2-4509-902ecb7cc22a@redhat.com> <YQmxFkSo7jZ7pX8Q@t490s>
In-Reply-To: <YQmxFkSo7jZ7pX8Q@t490s>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Aug 2021 11:19:51 +0800
Message-ID: <CACGkMEtH-y+q+ROPQB44J0fRJR8+dWcYdUrrYh=zoVa06ZWDcw@mail.gmail.com>
Subject: Re: [PATCH] vhost: use large iotlb entry if no IOMMU translation is
 needed
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini <pbonzini@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Chao Gao <chao.gao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 4, 2021 at 5:11 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Aug 03, 2021 at 04:14:57PM +0800, Jason Wang wrote:
> >
> > =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=881:51, Chao Gao =E5=86=99=E9=81=93:
> > > On Tue, Aug 03, 2021 at 12:43:58PM +0800, Jason Wang wrote:
> > > > =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=8812:29, Chao Gao =E5=86=99=E9=
=81=93:
> > > > > Ping. Could someone help to review this patch?
> > > > >
> > > > > Thanks
> > > > > Chao
> > > > >
> > > > > On Wed, Jul 21, 2021 at 03:54:02PM +0800, Chao Gao wrote:
> > > > > > If guest enables IOMMU_PLATFORM for virtio-net, severe network
> > > > > > performance drop is observed even if there is no IOMMU.
> > > >
> > > > We see such reports internally and we're testing a patch series to =
disable
> > > > vhost IOTLB in this case.
> > > >
> > > > Will post a patch soon.
>
> [1]
>
> > > OK. put me in the CC list. I would like to test with TDX to ensure yo=
ur patch
> > > fix the performance issue I am facing.
> >
> >
> > Sure.
> >
> >
> > >
> > > >
> > > >
> > > > > >    And disabling
> > > > > > vhost can mitigate the perf issue. Finally, we found the culpri=
t is
> > > > > > frequent iotlb misses: kernel vhost-net has 2048 entries and ea=
ch
> > > > > > entry is 4K (qemu uses 4K for i386 if no IOMMU); vhost-net can =
cache
> > > > > > translations for up to 8M (i.e. 4K*2048) IOVAs. If guest uses >=
8M
> > > > > > memory for DMA, there are some iotlb misses.
> > > > > >
> > > > > > If there is no IOMMU or IOMMU is disabled or IOMMU works in pas=
s-thru
> > > > > > mode, we can optimistically use large, unaligned iotlb entries =
instead
> > > > > > of 4K-aligned entries to reduce iotlb pressure.
> > > >
> > > > Instead of introducing new general facilities like unaligned IOTLB =
entry. I
> > > > wonder if we optimize the vtd_iommu_translate() to use e.g 1G inste=
ad?
> > > using 1G iotlb entry looks feasible.
> >
> >
> > Want to send a patch?
> >
> >
> > >
> > > >      } else {
> > > >          /* DMAR disabled, passthrough, use 4k-page*/
> > > >          iotlb.iova =3D addr & VTD_PAGE_MASK_4K;
> > > >          iotlb.translated_addr =3D addr & VTD_PAGE_MASK_4K;
> > > >          iotlb.addr_mask =3D ~VTD_PAGE_MASK_4K;
> > > >          iotlb.perm =3D IOMMU_RW;
> > > >          success =3D true;
> > > >      }
> > > >
> > > >
> > > > > >    Actually, vhost-net
> > > > > > in kernel supports unaligned iotlb entry. The alignment require=
ment is
> > > > > > imposed by address_space_get_iotlb_entry() and flatview_do_tran=
slate().
> > > >
> > > > For the passthrough case, is there anyway to detect them and then d=
isable
> > > > device IOTLB in those case?
> > > yes. I guess so; qemu knows the presence and status of iommu. Current=
ly,
> > > in flatview_do_translate(), memory_region_get_iommu() tells whether a=
 memory
> > > region is behind an iommu.
> >
> >
> > The issues are:
> >
> > 1) how to know the passthrough mode is enabled (note that passthrough m=
ode
> > doesn't mean it doesn't sit behind IOMMU)
>
> memory_region_get_iommu() should return NULL if it's passthrough-ed?

Do you mean something like memory_region_get_iommu(as->root)?

Could it be possible that the iommu was attached to a specified mr but not =
root.

In [1], I originally try to use pci_device_iommu_address_space() in
virtio_pci_get_dma_as().

But I suffer from the issue that virtio-pci might be initialized
before the e.g intel-iommu, which you try to solve at [2].

Then I switch to introduce a iommu_enabled that compares the as
returned by pci_device_iommu_address_space() against
address_space_memory.

And the iommu_enalbed will be called during vhost start where
intel-iommu is guaranteed to be initialized.

This seems to work. Let me post the patch and let's start there.

>
> > 2) can passthrough mode be disabled on the fly? If yes, we need to deal=
 with
> > them
>
> I don't think it happens in reality; e.g. when iommu=3Dpt is set it's set=
 until
> the next guest reboot.  However I don't know whether there's limitation f=
rom
> spec-wise.

Yes, that's what I worry about. Even if it's not limited by the Intel
spec, we might suffer from this in another iommu.

>  Also I don't know whether there's special cases, for example when
> we kexec.
>
> I've two questions..
>
> Jason, when you mentioned the "fix" above [1], shouldn't that also fix th=
e same
> issue, and in a better way? Because ideally I think if we know vhost does=
 not
> need a translation for either iommu_platform=3Doff, or passthrough, dev-i=
otlb
> layer seems an overhead with no real use.

Yes, see above. Let me post the patch.

>
> The other question is I'm also wondering why we care about iommu_platform=
=3Don
> when there's no vIOMMU at all - it's about why we bother setting the flag=
 at
> all?  Or is it a valid use case?

Encrypted VM like SEV or TDX.

In those cases, swiotlb needs to be used in the guest since the
swiotlb pages were not encrypted.

And the iommu_platform=3Don is the only way to let the guest driver use
DMA API (swiotlb).

(The name iommu_platform is confusing and tricky)

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


