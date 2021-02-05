Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEC310D31
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:34:50 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l838D-0004zI-VJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l834o-00035W-Fv
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l834j-0005yd-3M
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612539072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zk2ZQmuEqJBURiChzCrDnhTjB2z9YHMUQhiEdyFL0r8=;
 b=KWpeV6QdE4oHy+YuLIOLq+bFFFaleWVf4OKP+k2Ta+KgsXndaILFyBKL3lf524PzU66Uk5
 Gq101BBLqynpGtLfZdQtFfBfx/PC7RRd9017D4oya2xFPwj1BlbGi/fWtzDDlK6rW126zX
 jWctXpjnR+znDxHKxL/X2g7hZ7M64qM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-_8ueQ7y2O5mYPAVa1QWGZQ-1; Fri, 05 Feb 2021 10:31:11 -0500
X-MC-Unique: _8ueQ7y2O5mYPAVa1QWGZQ-1
Received: by mail-qt1-f198.google.com with SMTP id m21so5485166qtp.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zk2ZQmuEqJBURiChzCrDnhTjB2z9YHMUQhiEdyFL0r8=;
 b=RP/CCe7ITzEpMqYTwPgPvAxg/txoajX3MRyMjbHJc7argIM3eWe6Kkax2RQSSLvdjN
 hRo8V1+fkEtoEKoso+lBKyP53X0OGOM0RbAlfpk6xuhj97Ik4gLejuxS3CFqxgNPpaLQ
 ugN2YfRHDKbqBCaYQeZjjCoW+Rd8+BsqSvHo85bZy53Fv7HchhPWnrbu58mm0zdSfZVF
 Rq+Y1zoHK30OXpSFpRbWhULwNo7NmerMlAhulm9udGOkHEKjriio9/nU92VPCi8mXTl4
 65LD8vWSNbZqAzE8GAzhoYNURxfZ8oC3AmbXLEs66YopJhIsug/zDBK+XPoJfLYivaK9
 LPZw==
X-Gm-Message-State: AOAM5306jUoKLrkQY4b5A3enefwpJuoj3FqmAS3hYyFqNxXMiGXGH6j9
 B0YXe+/DgN2HKKUxX50Fj5Nw/8+pK75CDaJDoxwbmotORhbgebvWK+Osg0QdBIR3yv9JsLx4/r5
 6V2Bi1UgBGlUW1+k=
X-Received: by 2002:a05:622a:248:: with SMTP id
 c8mr4593935qtx.122.1612539069692; 
 Fri, 05 Feb 2021 07:31:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH3wuBYix6vVFEGzM9IJnJmforZ1E5RxcF1ZM7rNBP6wyBkj3NxP5Dmk69KPakK12MU3wFxg==
X-Received: by 2002:a05:622a:248:: with SMTP id
 c8mr4593913qtx.122.1612539069429; 
 Fri, 05 Feb 2021 07:31:09 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id k187sm9556022qkc.74.2021.02.05.07.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:31:08 -0800 (PST)
Date: Fri, 5 Feb 2021 10:31:07 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Message-ID: <20210205153107.GX6468@xz-x1>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
MIME-Version: 1.0
In-Reply-To: <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 09:33:29AM +0100, Auger Eric wrote:
> Hi,
> 
> On 2/5/21 4:16 AM, Jason Wang wrote:
> > 
> > On 2021/2/5 上午3:12, Peter Xu wrote:
> >> Previous work on dev-iotlb message broke vhost on either SMMU
> > 
> > 
> > Have a quick git grep and it looks to me v3 support ATS and have command
> > for device iotlb (ATC) invalidation.
> 
> 
> Yes I will do that. Should not be a big deal.

Great, thanks.

> > 
> > 
> >> or virtio-iommu
> >> since dev-iotlb (or PCIe ATS)
> > 
> > 
> > We may need to add this in the future.
> added Jean-Philippe in CC

So that's the part I'm unsure about..  Since everybody is cced so maybe good
time to ask. :)

The thing is I'm still not clear on whether dev-iotlb is useful for a full
emulation environment and how that should differ from a normal iotlb, since
after all normal iotlb will be attached with device information too.

For real hardwares, they make sense because they ask for two things: iotlb is
for IOMMU, but dev-iotlb is for the device cache.  For emulation environment
(virtio-iommu is the case) do we really need that complexity?

Note that even if there're assigned devices under virtio-iommu in the future,
we can still isolate that and iiuc we can easily convert an iotlb (from
virtio-iommu) into a hardware IOMMU dev-iotlb no matter what type of IOMMU is
underneath the vIOMMU.

> > 
> > 
> >> is not yet supported for those archs.
> > 
> > 
> > Rethink about this, it looks to me the point is that we should make
> > vhost work when ATS is disabled like what ATS spec defined:
> > 
> > """
> > 
> > ATS is enabled through a new Capability and associated configuration
> > structure.  To enable 15 ATS, software must detect this Capability and
> > enable the Function to issue ATS TLP.  If a Function is not enabled, the
> > Function is required not to issue ATS Translation Requests and is
> > required to issue all DMA Read and Write Requests with the TLP AT field
> > set to “untranslated.”
> > 
> > """
> > 
> > Maybe we can add this in the commit log.

I saw Michael was super fast on handling this patch and already got it in a
pull, so I may not directly post a new version.  But I'll add it if I'll post a
new version.

[...]

> > Patch looks good. I wonder whether we should fix intel when ATS is
> > disabled.
> good point

I'm not sure I remember it right, but we seem to have similar discussion
previously on "what if the user didn't specify ats=on" - I think at that time
the conclusion was that we ignore the failure since that's not a valid
configuration for qemu.

But I agree it would be nicer to be able to fallback.

The other issue I'm worried is (I think I mentioned it somewhere, but just to
double confirm): I'd like to make sure SMMU and virtio-iommu are the only IOMMU
platform that will use vhost.  Otherwise IIUC we need to fix those vIOMMUs too.

Thanks,

-- 
Peter Xu


