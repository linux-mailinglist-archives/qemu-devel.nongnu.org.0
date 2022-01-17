Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EE4901D6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 07:05:05 +0100 (CET)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9L8Z-0003hR-P5
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 01:05:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n9L5X-0002vP-IE
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n9L5U-0005DK-9H
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642399310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bLSgUdeDNKu8AThCvFQSlFvzvyVqXIWB0R8KfeOFgO0=;
 b=HGpdtPWfk/ilEzi0ysRsUd4rR523vm06FYY5Yx3o9jP9GzbBHkgYjvwb1ORZ7VrkBY3Cbm
 z5J3xd5Vl6o5ORHiyRI33Y+ERXfb8Q/BxYUIbyCek4wVM4Dr99JnYCkQouNHW5qPUoGPPG
 u/d7X+6pVScqwHf5bOlvlC2mddQbFKo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-m91DZY2PNKO7zB9UeItHKg-1; Mon, 17 Jan 2022 01:01:49 -0500
X-MC-Unique: m91DZY2PNKO7zB9UeItHKg-1
Received: by mail-lf1-f71.google.com with SMTP id
 7-20020ac24827000000b0042e731a7bc7so10084472lft.18
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 22:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLSgUdeDNKu8AThCvFQSlFvzvyVqXIWB0R8KfeOFgO0=;
 b=Rw7LhEwC9B661rhTraD6szXPmPfKLS50ObN6tvm8EUVCdbIDpprPaJHfK1OPPV28Jo
 hll3GHzsob8FBYTxbJLN+ytacE1rYbJ5xZntgCkdQ9TDCm5oqHElHKwP2kORa4FnfOyA
 T1wUo74OEq+WZfQSyu4819o4tAm/9j0i8oMgsQTm++vKXUq6wXKdQ5uEwniQGnind+tY
 IhvxC7LMurO6+36m3Bdap0Mbk99RJBhuCwJGyRfSQ981h3iSs0nYQUlETQYdgPfBYVd3
 uHcslwlydKGqiHBaMx5YW4wyGBxbxWvONKB8IkO5ljqd9G54ISIJ+16lfvx8/jhcUerJ
 Y9QQ==
X-Gm-Message-State: AOAM533B4mGadVLjP/WOPzjdjAt7l9ATSoQaXX3A7sujZI4h26QF7EyV
 IxvaF6QzF18dD/pyrE73YE+zpFveLsz2nRuvX5Q1Os/1Y7doPJjAE0ZUZlYFKcnu9m6x0q4vj1A
 SZWjLyuouPGORRKvLgGtBa+4ldisDPFo=
X-Received: by 2002:a05:651c:513:: with SMTP id
 o19mr2375681ljp.362.1642399307750; 
 Sun, 16 Jan 2022 22:01:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA4FB4SIEkHjJ3ECC1eytFg8jZlPa5tMQZromIKcdbuAWo172+b9zghxwH1gFZXKAHSpel2v9Xh2s7fxH/WB4=
X-Received: by 2002:a05:651c:513:: with SMTP id
 o19mr2375666ljp.362.1642399307483; 
 Sun, 16 Jan 2022 22:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
 <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
 <YeEifFCR6Rc5ObGg@xz-m1.local>
 <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
 <51098548-51f0-04c8-2169-9ce3d43678a6@intel.com>
In-Reply-To: <51098548-51f0-04c8-2169-9ce3d43678a6@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 17 Jan 2022 14:01:36 +0800
Message-ID: <CACGkMEsRVBaeg+_anp65=O4Uz4MX0Z6ndpN5vnyqbidS-Onc9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
To: Liu Yi L <yi.l.liu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: yi.y.sun@linux.intel.com, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 8:59 PM Liu Yi L <yi.l.liu@intel.com> wrote:
>
> On 2022/1/14 15:22, Jason Wang wrote:
> > On Fri, Jan 14, 2022 at 3:13 PM Peter Xu <peterx@redhat.com> wrote:
> >>
> >> On Fri, Jan 14, 2022 at 01:58:07PM +0800, Jason Wang wrote:
> >>>>> Right, but I think you meant to do this only when scalable mode is disabled.
> >>>>
> >>>> Yes IMHO it will definitely suite for !scalable case since that's exactly what
> >>>> we did before.  What I'm also wondering is even if scalable is enabled but no
> >>>> "real" pasid is used, so if all the translations go through the default pasid
> >>>> that stored in the device context entry, then maybe we can ignore checking it.
> >>>> The latter is the "hacky" part mentioned above.
> >>>
> >>> The problem I see is that we can't know what PASID is used as default
> >>> without reading the context entry?
> >>
> >> Can the default NO_PASID being used in mixture of !NO_PASID use case on the
> >> same device?  If that's possible, then I agree..
> >
> > My understanding is that it is possible.
> >
> >>
> >> My previous idea should be based on the fact that if NO_PASID is used on one
> >> device, then all translations will be based on NO_PASID, but now I'm not sure
> >> of it.
> >
> > Actually, what I meant is:
> >
> > device 1 using transactions without PASID with RID2PASID 1
> > device 2 using transactions without PASID with RID2PASID 2
>
> Interesting series, Jason.
>
> haven't read through all your code yet. Just a quick comment. The
> RID2PASID1 and RID2PASID2 may be the same one. Vt-d spec has defined a RPS
> bit in ecap register. If it is reported as 0, that means the RID_PASID
> (previously it is called RID2PASID :-)) field of scalable mode context
> entry is not supported, a PASID value of 0 will be used for transactions
> wihout PASID. So in the code, you may check the RPS bit to see if the
> RID_PASID value are the same for all devices.

Good to know this, will spend some time to implement this (probably on
top). That can speed up the IOTLB lookup somehow

Thanks

>
> Regards,
> Yi Liu
>
> > Then we can't assume a default pasid here.
> >
> >>
> >>>
> >>>>
> >>>> The other thing to mention is, if we postpone the iotlb lookup to be after
> >>>> context entry, then logically we can have per-device iotlb, that means we can
> >>>> replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
> >>>> which can also be more efficient.
> >>>
> >>> Right but we still need to limit the total slots and ATS is a better
> >>> way to deal with the IOTLB bottleneck actually.
> >>
> >> I think it depends on how the iotlb ghash is implemented.  Logically I think if
> >> we can split the cache to per-device it'll be slightly better because we don't
> >> need to iterate over iotlbs of other devices when lookup anymore; meanwhile
> >> each iotlb takes less space too (no devfn needed anymore).
> >
> > So we've already used sid in the IOTLB hash, I wonder how much we can
> > gain form this.
> >
> > Thanks
> >
> >>
> >> Thanks,
> >>
> >> --
> >> Peter Xu
> >>
> >
>
> --
> Regards,
> Yi Liu
>


