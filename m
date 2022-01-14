Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA348E533
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:07:56 +0100 (CET)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Hci-0003Gq-US
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Gv2-00008z-T3
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Gv0-0002rZ-Ea
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642144952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zk3FHSqSqkO3+fTskAMx2T9ZkmAnDyBIsQS2JXbZD4=;
 b=NyG4eqStC42AJF0CBpj2SlQ4eUPvUNgcthuGbeAKvMpl0+zAFEliTXeph2bC2ulEV7hWYK
 +zvOgOxQtJfP+V1csE5f4DOu91qmInTdBG7ztJptFEnw/jrzHN9sm77D2oal64QR9hG2rk
 x9FLfd6EH2ywQfuF3DJb9Gv4WukddFk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-6R7x9Ng0Pmi0-xRXBJOLAA-1; Fri, 14 Jan 2022 02:22:29 -0500
X-MC-Unique: 6R7x9Ng0Pmi0-xRXBJOLAA-1
Received: by mail-lf1-f69.google.com with SMTP id
 q14-20020ac246ee000000b0042c02909ed4so5603844lfo.19
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 23:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zk3FHSqSqkO3+fTskAMx2T9ZkmAnDyBIsQS2JXbZD4=;
 b=b6Vry8ZiRYqyTUimbbPDtX7RRCRNcUjAedZzJH3txTPOQZzRBX3irKQvgeXECRzMZN
 gOHRtAY4HKcROHSku1iAWbZ+o3mxLPv1FD9H+cDId1NCF8w6TYTarcS0Aoul8HXLdA+R
 D2lO59JlUpgok+NRPPLTtcnekdt+tVbq6+8Ll1twpGclE1KOXgSC+pO2PDudhXx7cE7C
 jCtRIiQeH8P2b1xzRCW+KKbA1nwdKlHfnOi6azBs5/rVAeVziy5/jDC5G3JrWaVMRyMB
 Q+PHmVsqOy58rnuTz+NghPAXDkhed7zhNZdZ03YVaOCJHTxAnGpDBxbiQ5rPmJdaNRv/
 jtXw==
X-Gm-Message-State: AOAM530RP6hECS6kQeSldaLsg7a6k97ucEBNo+JzQEwa43N6Ehyx3tIx
 RKS79SvOlOwCuAsT247wyWziiH86QWHgPvaCuwiZNGt9l2EF1FFEIp8bume55k7Ox/MsHgGNx+K
 qIwusNOq6YIZQZsRhOerk7CcJNZbMDkk=
X-Received: by 2002:a2e:8645:: with SMTP id i5mr2181507ljj.420.1642144947650; 
 Thu, 13 Jan 2022 23:22:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtWvbRdJMj5lBlFVdsB6kxep+qFd305HLeC2QVLDaylCb9c0QyzmJzcjol96MtSOoy5JFrSJ5VEcOeLSMxCWw=
X-Received: by 2002:a2e:8645:: with SMTP id i5mr2181494ljj.420.1642144947373; 
 Thu, 13 Jan 2022 23:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
 <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
 <YeEifFCR6Rc5ObGg@xz-m1.local>
In-Reply-To: <YeEifFCR6Rc5ObGg@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Jan 2022 15:22:16 +0800
Message-ID: <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 14, 2022 at 3:13 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Jan 14, 2022 at 01:58:07PM +0800, Jason Wang wrote:
> > > > Right, but I think you meant to do this only when scalable mode is disabled.
> > >
> > > Yes IMHO it will definitely suite for !scalable case since that's exactly what
> > > we did before.  What I'm also wondering is even if scalable is enabled but no
> > > "real" pasid is used, so if all the translations go through the default pasid
> > > that stored in the device context entry, then maybe we can ignore checking it.
> > > The latter is the "hacky" part mentioned above.
> >
> > The problem I see is that we can't know what PASID is used as default
> > without reading the context entry?
>
> Can the default NO_PASID being used in mixture of !NO_PASID use case on the
> same device?  If that's possible, then I agree..

My understanding is that it is possible.

>
> My previous idea should be based on the fact that if NO_PASID is used on one
> device, then all translations will be based on NO_PASID, but now I'm not sure
> of it.

Actually, what I meant is:

device 1 using transactions without PASID with RID2PASID 1
device 2 using transactions without PASID with RID2PASID 2

Then we can't assume a default pasid here.

>
> >
> > >
> > > The other thing to mention is, if we postpone the iotlb lookup to be after
> > > context entry, then logically we can have per-device iotlb, that means we can
> > > replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
> > > which can also be more efficient.
> >
> > Right but we still need to limit the total slots and ATS is a better
> > way to deal with the IOTLB bottleneck actually.
>
> I think it depends on how the iotlb ghash is implemented.  Logically I think if
> we can split the cache to per-device it'll be slightly better because we don't
> need to iterate over iotlbs of other devices when lookup anymore; meanwhile
> each iotlb takes less space too (no devfn needed anymore).

So we've already used sid in the IOTLB hash, I wonder how much we can
gain form this.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


