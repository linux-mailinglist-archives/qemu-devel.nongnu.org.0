Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1730139A61
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 20:55:47 +0100 (CET)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir5oQ-0001MG-4W
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 14:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ir5mb-0007iW-Dr
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 14:53:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ir5mZ-00084Z-Oh
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 14:53:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ir5mZ-00083Z-DS
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 14:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578945230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOUjPH+PsZUC/4Dxn9qSHU2eo/ZATKaAUDvGwicR+TY=;
 b=YhQcZfb4AKYFNOo8mVkEg9NBRnlgLaVou6nRTy4J33eDBrw/+fXS6tAe6FNZRMyV8CtdVb
 /wRFGXAtHuwBj/Hv3jnnbLsqQ59CsX1xOn7fg7o6Eax0qcoYkhZXU/qEMr9pG++iMigLaZ
 bcsXSvilvdLj9zd4GM+QzFPXV9np2FE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-wcxrFweOPh6_a-cJmMmWSA-1; Mon, 13 Jan 2020 14:53:47 -0500
Received: by mail-qk1-f198.google.com with SMTP id 194so6664203qkh.18
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 11:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rOKPIBq72Ryae3sLHmLRve0xR3Sl9ydH9eOFAPkEEHg=;
 b=sf6Xcr7HC+LFzhcOQWH7MU5e9Dim20TLwmRo4CCAnUi6HVzzt71c7c5YKr91ESbMGL
 zDnGQkzYSO+Dwf48B/WwbbLZUHemD1NQ6MVmA86pNwtWWTYbQwWIY6p8R78QBRS9wA7M
 htYwQurQOIbYPnHH/JlzM/fX3f88UsKmLAzRRbb4lL/LuTgTDcl51L/ofFvoLx6CSSq2
 VaPPqIOwrIpCaTApnK7a3vH5MZ9pLiYs00zg4wf5sHXm8olhZaXQoI3akWH9VrUqptop
 rQ0P+2PiIOqZ92+B88hwHXfpPET3yRavzE16KfxNXQrY3f5QJvDMd0kY7BTzv8RFIA9j
 6hLQ==
X-Gm-Message-State: APjAAAWHu22sJehVUXirBcH9pd+S6Kvgtk071MfSiT+aUCYXtTq+xKnJ
 1O6+mnOI7eMbb2RQFM5efU4B/3YiOtiPY0bI47fQNITi8b7zCtHFvVS3ylonItv/btU0btG/3U3
 nSa1MEtKmLt/v/5c=
X-Received: by 2002:ac8:6f73:: with SMTP id u19mr235423qtv.326.1578945226770; 
 Mon, 13 Jan 2020 11:53:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxL13/YbfHUKlpFxibyyOZb5qP9VdHzOCrR4LOHV98WdQT2ra8yBuN5Q5HFOE+Nlwrfe91QPQ==
X-Received: by 2002:ac8:6f73:: with SMTP id u19mr235394qtv.326.1578945226515; 
 Mon, 13 Jan 2020 11:53:46 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id x27sm5413115qkx.81.2020.01.13.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 11:53:45 -0800 (PST)
Date: Mon, 13 Jan 2020 14:53:44 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
Message-ID: <20200113195344.GA201624@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-5-eric.auger@redhat.com>
X-MC-Unique: wcxrFweOPh6_a-cJmMmWSA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 09, 2020 at 03:43:10PM +0100, Eric Auger wrote:
> Implement a callback called on PCI bus enumeration that
> initializes for a given device on the bus hierarchy
> an IOMMU memory region. The PCI bus hierarchy is stored
> locally in IOMMUPciBus and IOMMUDevice objects.
>=20
> At the time of the enumeration, the bus number may not be
> computed yet.
>=20
> So operations that will need to retrieve the IOMMUdevice
> and its IOMMU memory region from the bus number and devfn,
> once the bus number is garanteed to be frozen,
> use an array of IOMMUPciBus, lazily populated.
>=20
> virtio_iommu_mr() is the top helper that allows to retrieve
> the IOMMU memory region from the requester ID.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
> v11 -> v12:
> - add the iommu_find_iommu_pcibus() mechanics. Without it,
>   when attaching t device to a domain we could not check
>   the device is effectively protected by this IOMMU

Sorry I probably lost the context again after read the previous
version...  Could you hint me what does this used for?

In all cases, I see that virtio_iommu_mr() is introduced but not used.
Would be good to put it into the patch where it's firstly used.

Thanks,

--=20
Peter Xu


