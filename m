Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D148E735
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:15:23 +0100 (CET)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ig6-0000RJ-Ec
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:15:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Id7-000660-NI
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Id6-0003EZ-10
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642151535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=be/fMq0ZKeELMymlV1e2o7fpGpKb6I0xuyfEa5IYDiY=;
 b=QjENWHUhbgh5NE6I2nTRC6JyWeddU0jAINkrFg+3E3d2HSuaNvmXWf3iZkSSDAgDs5Sgf0
 3GW3+E9FJWM0JcC/wUx/mbXV9myqqBdtltStgjfsnSuwuaYnuqm3FSg3vK/sapKim/Gye2
 LJofRhMFn5NXYohGXtrOUWb9U+y2AKo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-yfvzZFmPMseOKzfv6ZJBQg-1; Fri, 14 Jan 2022 04:12:14 -0500
X-MC-Unique: yfvzZFmPMseOKzfv6ZJBQg-1
Received: by mail-lf1-f69.google.com with SMTP id
 v7-20020a056512048700b0042d99b3a962so5813601lfq.23
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 01:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=be/fMq0ZKeELMymlV1e2o7fpGpKb6I0xuyfEa5IYDiY=;
 b=6xmgOG9pUYOZkK9jLrcA02RsY2pyFa6SIf0UZjhEBL2qg3U4DjgkgGFQwd9N02sEn1
 WaBjIzuZIRmMxIbFr+lOVEzOHbO3u0ibW3o/dEnsR0XzFFhaIzfhwI9OcgRrFq2e6TLn
 +oWIm8a1mB1C5iyPkNa80wvviv65fm5S+NKbrrugvk+lfRYAv66i0hHRTr9JOu8zSIWq
 7D7byWnaHlaZc/r5TGDA9ZpHU1nMezWRyUuCUNLI2Ae0rAwrqwOdYTf+DjKlHeGn6kKz
 TadYYvdhW4/Uuj2N758EcTLcBWwcKMJchYQOodGsyEvTVlWc4+3IFBhRFHs899Ic4/dI
 2q6g==
X-Gm-Message-State: AOAM530m1UtuH2eLjvMm+pHAXrE0RUTefIcrYmCGjmIGIrhoqFess+ls
 2gI2s0i7elUuq2XcwmLkJtoSGFJ0qJ9PTsOBpcN3D1T/BZOAmqeaU0T/MASzKwAlzodJo2EA6gp
 ntQMRf7jmp6a/vKh1MEVc84FzA2f+oo8=
X-Received: by 2002:a2e:9941:: with SMTP id r1mr5033441ljj.217.1642151532639; 
 Fri, 14 Jan 2022 01:12:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWlPQXSEk/5mubZMrzGmxth6fmGOXX9W9ZslVUB1gcs4ZgCbZG0EQkMqZB0dDouBqqVWnOqXp8mdaA1RSpsvo=
X-Received: by 2002:a2e:9941:: with SMTP id r1mr5033428ljj.217.1642151532381; 
 Fri, 14 Jan 2022 01:12:12 -0800 (PST)
MIME-Version: 1.0
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
 <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
 <YeEifFCR6Rc5ObGg@xz-m1.local>
 <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
 <YeEqBADUtQmIa5Pc@xz-m1.local>
In-Reply-To: <YeEqBADUtQmIa5Pc@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Jan 2022 17:12:01 +0800
Message-ID: <CACGkMEvcAfX_CxHcb7eVdLQOtNB2ShB=ZMXjmabj-n87j2Y49Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 3:45 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Jan 14, 2022 at 03:22:16PM +0800, Jason Wang wrote:
> > On Fri, Jan 14, 2022 at 3:13 PM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Fri, Jan 14, 2022 at 01:58:07PM +0800, Jason Wang wrote:
> > > > > > Right, but I think you meant to do this only when scalable mode is disabled.
> > > > >
> > > > > Yes IMHO it will definitely suite for !scalable case since that's exactly what
> > > > > we did before.  What I'm also wondering is even if scalable is enabled but no
> > > > > "real" pasid is used, so if all the translations go through the default pasid
> > > > > that stored in the device context entry, then maybe we can ignore checking it.
> > > > > The latter is the "hacky" part mentioned above.
> > > >
> > > > The problem I see is that we can't know what PASID is used as default
> > > > without reading the context entry?
> > >
> > > Can the default NO_PASID being used in mixture of !NO_PASID use case on the
> > > same device?  If that's possible, then I agree..
> >
> > My understanding is that it is possible.
>
> OK.
>
> >
> > >
> > > My previous idea should be based on the fact that if NO_PASID is used on one
> > > device, then all translations will be based on NO_PASID, but now I'm not sure
> > > of it.
> >
> > Actually, what I meant is:
> >
> > device 1 using transactions without PASID with RID2PASID 1
> > device 2 using transactions without PASID with RID2PASID 2
> >
> > Then we can't assume a default pasid here.
>
> This seems fine, because "device N" is still part of the equation when looking
> up, so we won't lookup wrong.

Right.

>
> But yeah.. it could not really work anyway.
>
> >
> > >
> > > >
> > > > >
> > > > > The other thing to mention is, if we postpone the iotlb lookup to be after
> > > > > context entry, then logically we can have per-device iotlb, that means we can
> > > > > replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
> > > > > which can also be more efficient.
> > > >
> > > > Right but we still need to limit the total slots and ATS is a better
> > > > way to deal with the IOTLB bottleneck actually.
> > >
> > > I think it depends on how the iotlb ghash is implemented.  Logically I think if
> > > we can split the cache to per-device it'll be slightly better because we don't
> > > need to iterate over iotlbs of other devices when lookup anymore; meanwhile
> > > each iotlb takes less space too (no devfn needed anymore).
> >
> > So we've already used sid in the IOTLB hash, I wonder how much we can
> > gain form this.
>
> I think at least we can shrink iotlb structures, e.g.:
>
> struct vtd_iotlb_key {
>     uint16_t sid;               <------ not needed
>     uint32_t pasid;             <------ not needed
>     uint64_t gfn;
>     uint32_t level;
> };

I don't get why PASID is not needed.

Thanks

>
> struct VTDIOTLBEntry {
>     uint64_t gfn;
>     uint16_t domain_id;
>     uint32_t pasid;             <------ not needed
>     uint64_t slpte;
>     uint64_t mask;
>     uint8_t access_flags;
> };
>
> Thanks,
>
> --
> Peter Xu
>


