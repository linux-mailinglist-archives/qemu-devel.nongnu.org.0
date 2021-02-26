Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB4326308
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:02:08 +0100 (CET)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFckx-00052B-84
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lFck5-0004bX-89
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:01:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lFck1-0007OB-IT
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:01:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id w11so8481586wrr.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 05:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TbokggZ/h3gmop2DTO4TBWeR7H6caVZM9bVJ9nVfqnQ=;
 b=RJaxJstHFqIdIzCw7dWQUKRdE0mlY1GbV9FQClGYuTwLOVlY3wemkZ+yn7XCs4KlN0
 bkZ7M5112vHO7zn904+N16BcV4iamNvdu/g6jU6npi7wbCYcN8f1S5+DKXe/cHCx5FN3
 v7+bY0h7BpKndwyQIV90+zJr518TMu9oMZ59XVB20LMA0ggb0YupEz3jCNgT3YB032NN
 yUKZxp8xYbo5AuRZze/7mesUP46Tqgdwv4Rcd4sPfSXTsMU/uxBNn232wfPcC8LfAUbZ
 B0cm1ZtYCveQOHr5eDf37/YBiLN2JzPfVFOVqMKkVoaYoIgatWwTBcf5mK2Z2pgFkgGM
 9CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TbokggZ/h3gmop2DTO4TBWeR7H6caVZM9bVJ9nVfqnQ=;
 b=s+j+y4YHt/OrRkqWu0KoywUTb6cvIPoT1+gKmKfh8zc5MjrFSbXfnMvyNyMOOge3HF
 X/PMXBi+syIXdhHY8mDiNAWyv4kqHRVjxt2YAfHzNLyr3CIv76RiW0k4XXnMxnex6YU8
 xwAc+1FiCdijqgXZnUaxAOrmHJ6pdheetwcM5RWw/Uc4E4UI5vg7qT6KQodI8351fjUO
 ZV2GO+vGHRcLlTDYMO20RXlwI75HinEegR+KqvQMpRaVeYPKt6aHaZriMdyhB5MVUvmh
 irsj09/SYwwtkbjQt91MvobfLWuyLEkIGAIHfqZ0rXLtWyKm7ilRUK3eX/vRBeATuJ3c
 r0Ug==
X-Gm-Message-State: AOAM533fRSQ2B34s/xYJW8MiIX/m2vct+0XMAwxIOcS0kJT1FK5/6tax
 5GqqPALvL/5t8MJThubd43Yi1A==
X-Google-Smtp-Source: ABdhPJwRBojpbKNIA61tlakW4Yn0dnwF8nMlvtqc6pV2Vy+lzj5FGVBdMMh4OrtmhUevgXA451xSEA==
X-Received: by 2002:adf:c101:: with SMTP id r1mr3154850wre.38.1614344467447;
 Fri, 26 Feb 2021 05:01:07 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n10sm13433784wrt.83.2021.02.26.05.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:01:06 -0800 (PST)
Date: Fri, 26 Feb 2021 14:00:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] virtio-iommu: Default to bypass during boot
Message-ID: <YDjw/s+PuZ012GhX@myrica>
References: <20210218105929.1433230-1-jean-philippe@linaro.org>
 <20210221064211-mutt-send-email-mst@kernel.org>
 <YDfatCDUZ3FISPJI@myrica>
 <MWHPR11MB18862C07D1473445DBC42C928C9D9@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB18862C07D1473445DBC42C928C9D9@MWHPR11MB1886.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 26, 2021 at 08:11:41AM +0000, Tian, Kevin wrote:
> > From: Qemu-devel <qemu-devel-bounces+kevin.tian=intel.com@nongnu.org>
> > On Behalf Of Jean-Philippe Brucker
> > 
> > On Sun, Feb 21, 2021 at 06:45:18AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Feb 18, 2021 at 11:59:30AM +0100, Jean-Philippe Brucker wrote:
> > > > Currently the virtio-iommu device must be programmed before it allows
> > > > DMA from any PCI device. This can make the VM entirely unusable when
> > a
> > > > virtio-iommu driver isn't present, for example in a bootloader that
> > > > loads the OS from storage.
> > > >
> > > > Similarly to the other vIOMMU implementations, default to DMA
> > bypassing
> > > > the IOMMU during boot. Add a "boot-bypass" option that lets users
> > change
> > > > this behavior.
> > > >
> > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > >
> > > wouldn't this be a spec violation?
> > >
> > >
> > > When the device is reset, endpoints are not attached to any domain.
> > >
> > > If the VIRTIO_IOMMU_F_BYPASS feature is negotiated, all accesses from
> > > unattached endpoints are allowed and translated by the IOMMU using the
> > > identity function. If the feature is not negotiated, any memory access
> > > from an unattached endpoint fails. Upon attaching an endpoint in
> > > bypass mode to a new domain, any memory access from the endpoint fails,
> > > since the domain does not contain any mapping.
> > 
> > Right, but the device behavior regarding BYPASS is specified as:
> > 
> >   If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
> >   device SHOULD NOT let endpoints access the guest-physical address space.
> > 
> > So I figured that the spec could be read as "before feature negotiation
> > it's undefined whether the IOMMU is bypassed or not" and so a device
> > implementation can choose either (previously discussed at [1]). But it's a
> > stretch, we should clarify this.
> > 
> > Also, the OS might want to know whether DMA was bypassing the IOMMU
> > before
> > the device is initialized. If there are strong security requirements, then
> > boot-bypass means the system was vulnerable to DMA attacks during boot.
> > 
> > So I'd like to add a new feature bit for this, VIRTIO_IOMMU_F_BOOT_BYPASS,
> > that tells whether DMA bypasses the IOMMU before feature negotiation. It's
> > only an indicator, accepting the feature doesn't change anything. I'll
> > send the spec change shortly.
> > 
> > Thanks,
> > Jean
> > 
> > [1] https://lore.kernel.org/qemu-
> > devel/20200109104032.GA937123@myrica/
> > 
> 
> I wonder why we didn't define the default behavior to bypass (to align with
> other vIOMMUs) in the first place and then have an option (e.g. 
> VIRTIO_IOMMU_F_NOBYPASS) to override in case a stricter policy is required. 

Yes in hindsight the polarity should probably have been reversed. Clearly
I could have put more thoughts into this. When writing the spec it seemed
natural in terms of security to disallow accesses until software
explicitly enables bypass.

In the linked discussion, which happened after the initial spec was
accepted, we concluded that QEMU should be boot-bypass by default and the
spec ought to be clarified to explicitly allow this, I just didn't take
time to work on it until now.

> In concept when a IOMMU device is uninitialized or reset, it essentially means 
> no protection in place thus a bypass behavior. 

Not necessarily, the SMMU leaves that choice to the implementation (but it
does have the right polarity 0 == bypass). The SMMU_GBPA register defines
the bypass behavior. Implementations can tie it to 0 or 1 to define the
default behavior of abort or bypass. Then software sets it to 0 or 1 to
select the runtime policy. Ideally I'd like a similar mechanism for
virtio-iommu, because it's sticky across reset - no vulnerability window
when firmware hands over the IOMMU to the OS.

Thanks,
Jean

