Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B44605633
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:04:17 +0200 (CEST)
Received: from localhost ([::1]:58544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olMn1-0006je-7n
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:04:15 -0400
Received: from [::1] (port=57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olMn0-0006Mx-Ll
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olMhn-0007WN-Cj
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olMhl-0001yn-LZ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666238329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0bnCyqE81idn4a1db9dZCTQXr3bup0cKFzbBj/H01nU=;
 b=YqjTQJqPELNvrYGqken2/s37DQXR6wlUWINWbQaEtdWKfVR0Jmuk04cNzkyCR8UqTOrQg4
 BRwrQx8xbA/HtBxgHPmA9AS7Q3olwS8EahYBLaEMc1hsNn1BNgFHtOwKgqtZ39zrM0UXHi
 m4dLZ3GaKbK7FnqO4PsmnFETypYBjyU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-kXC7D5iUPSaoFEireuEOqw-1; Wed, 19 Oct 2022 23:58:47 -0400
X-MC-Unique: kXC7D5iUPSaoFEireuEOqw-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1329a5d3272so9070344fac.17
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0bnCyqE81idn4a1db9dZCTQXr3bup0cKFzbBj/H01nU=;
 b=nvjO/cy2BiMtWO/Cqi4HD/G2rZdCusqq5ggsUJ8CTrwUqNnPv8JUcdrFDGJoV6t0eE
 VOPxgODKJECCPn8UnmVQw3pJ/AunWFQZRXWtDW6g/PAXOMxX9BwN5fAiZSGES1qeRbMs
 isJ5XAczMtMxo6+1xZEpuKZwdmLenbWCPV+L+vbBJYU1T8FHSPBFlxo6sY5FJhXFX5S+
 +TrdTkgddq8k7xeQ/ph9cMC3U9zEu1ANCZ+Wsz3IvlO9q2oVZ5hCmcvlA0fXUi8414KE
 OcgV6pNbIjg2yWbKdpxeb0SeJhiTjIqHCRL/CGcRCINcsWPyp6Z/f+lu+pgzSG5csZpn
 2o1A==
X-Gm-Message-State: ACrzQf3Ex+2KscIhErq17MaVnEaeVxoDGLevllmAHsgWtKa5Wm2yV9fE
 3GBLx4Fr+4V6fCXbMxlfmDkwrQxywDSzWY3BEUKIWYhrxi7zOUG2XHKKfye83Ib6RD9mBt224zf
 9MlRuhku8L7dMzujNpuBtAICRcgMTepw=
X-Received: by 2002:a05:6870:c1d3:b0:136:c4f6:53af with SMTP id
 i19-20020a056870c1d300b00136c4f653afmr23393340oad.35.1666238326840; 
 Wed, 19 Oct 2022 20:58:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zJxIUfHM91dBowV4+5kmkWd/76NQ2EpQ2FitW80x4O96kQXzLC+ZNfJ28N59Qdlvq9dWcN/NwfOukBHsItZY=
X-Received: by 2002:a05:6870:c1d3:b0:136:c4f6:53af with SMTP id
 i19-20020a056870c1d300b00136c4f653afmr23393333oad.35.1666238326641; Wed, 19
 Oct 2022 20:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221018215407.363986-1-peterx@redhat.com>
 <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com>
 <Y1ADOivPsgWzOjF6@x1n> <1196d8bb-1a4f-06b7-f5e3-43ace827bfb0@redhat.com>
 <Y1APkKgg340u6qym@x1n>
In-Reply-To: <Y1APkKgg340u6qym@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 11:58:34 +0800
Message-ID: <CACGkMEuVOyW6e-U_79UruLotx2AygbjKxeAE16JZaE1uAdSwuw@mail.gmail.com>
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
To: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 10:54 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 04:12:22PM +0200, Eric Auger wrote:
> > Hi Peter,
> >
> > On 10/19/22 16:01, Peter Xu wrote:
> > > Hi, Eric,
> > >
> > > On Wed, Oct 19, 2022 at 01:24:15PM +0200, Eric Auger wrote:
> > >>> @@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> > >>>                     PCI_FUNC(as->devfn));
> > >>>          return -EINVAL;
> > >>>      }
> > >>> +
> > >>> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> > >>> +        error_setg_errno(errp, ENOTSUP,
> > >>> +                         "Device-iotlb not declared support for vIOMMU");
> > >> with current vhost code, vhost will then silently fallbac to UNMAP
> > >> notifier registration and this will succeed. It would be nice to clarify
> > >> whether the vIOMMU works with vhost in this downgraded mode (at least
> > >> ats=off and device-ioltb=off)?
> > > I'm slightly confused, why do we need to clarify that?
> > >
> > > As we have discussed, if a device with ATS capability got attached into a
> > > vIOMMU context that does not support ATS, then it should just work like
> > > without ATS without any warning.  Isn't this the case here?
> >
> > Yes that's the theory and what should happen at baremetal level. However
> > I am not sure this is still true with the intel-iommu emulation/vhost
> > integration.
> > Remember we always assumed vhost was supported on intel with both ats=on
> > and device-iotlb=on if I am correct.
> >
> > vhost/viommu integration requires unmap notifications to be properly
> > sent from viommu to vhost, would it be though DEVIOTLB_UNMAP or UNMAP
> > notifiers.
> > Does the intel-iommu/vhost works if both ats=off and device-iotlb=off or
> > ats=on and device-iotlb=off. This I am not sure. I gave it a try and I
> > got some errors but maybe that's something else...
>
> Indeed it's not working.  Obviously my test on this patch is not complete,
> as I was testing with pings and even after patch applied the ping can get
> lost after a few successful ones.  I should have tried harder.
>
> Yes only device-iotlb=on & ats=on work in my case, all the rest three
> combinations won't work reliably or just don't work, but I do expect they
> should all work, so I definitely missed something here.  Jason, are you
> aware of the problem?

Haven't tried but I guess there would be some issue other than the
suggested configuration "ats=on, device-iotlb=on"

So we have:

1) ats=on, device-iotlb=on, this is the configuration that libvirt is
using and it should work
2) ats=off, device-iotlb=on, in this case, the DEVICEIOTLB_UNMAP
notifier will succeed but there won't be a device iotlb invalidation
sent from guest, so we will meet errors since there's no way to flush
device IOTLB. According to the PCIe spec, the device should still work
(using untranslated transactions). In this case we probably need a way
to detect if device page fault (ats) is enabled and fallback to UNMAP
if it doesn't.
3) ats=on, device-iotlb=off, in this case, without your patch, it
won't work since the DEVICEIOTLB_UNMAP will succeed but guest won't
enable ATS so there will be no IOTLB invalidation. With your patch, we
fallback to UNMAP and I think it should then work
4) ats=off, device-iotlb=off, similar to 3), it won't work without
your patch, but with your patch we fallback to UNMAP so it should
work.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


