Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D864FCF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 03:13:57 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlNem-0005ya-FF
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 21:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <zhexu@redhat.com>) id 1hlNeC-0005XG-Mj
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 21:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhexu@redhat.com>) id 1hlNeB-00026k-IW
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 21:13:20 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhexu@redhat.com>) id 1hlNeB-00026P-CK
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 21:13:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id z75so2065677pgz.5
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 18:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RVtvtLW+hA55JDckJ1iLViBZ1ankqgmMr3VovL92Bc4=;
 b=NOyyqnnc8dWgY9RiuvBE2KPWckhtWU0If02XncLMDh/t5b4TXGM7bUG+VQFpxsXyhQ
 tW3LolUKEOTZvWpvOF7oJJFjCMQIFCTZFusK/W2cyw43Wfjq1G6Juwwcv7N4ZPxGFc99
 JN2qM4L7OCIpoLcwryEttLYObr5zC3bjU0ndaEv1TisnJcH9QIKSy1P/jHl/wGc8qXql
 iYFH5YrrFIpBkBcwMvNAra4tij5j/VhlgMncPQEIbKdbCQm9QuhmpAlIMp/nmE59bhtK
 W1v5JgsFe8WviZoDEklEmeFTovACd5OWcdYB0P244IyILAe5VdPZAg6ETbn1y0iDnUW5
 nXLA==
X-Gm-Message-State: APjAAAVfGkAmA08PPLsAUfjuNSSOzGQ9qERdio0uqpJDbL9+MCc8ORjg
 mXcGS5aSIw2IgnzanOEfesh5Vw==
X-Google-Smtp-Source: APXvYqxMrVVklNqbVKOTAv5bfnU/VrZIKRnGvwuMCvMVJRLDiPbKxiptG5r1+GRR16h0APaabi9Mew==
X-Received: by 2002:a63:ad07:: with SMTP id g7mr1203863pgf.405.1562807598198; 
 Wed, 10 Jul 2019 18:13:18 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f14sm3326411pfn.53.2019.07.10.18.13.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 18:13:16 -0700 (PDT)
From: Peter Xu <zhexu@redhat.com>
X-Google-Original-From: Peter Xu <peterx@redhat.com>
Date: Thu, 11 Jul 2019 09:13:05 +0800
To: "Liu, Yi L" <yi.l.liu@intel.com>
Message-ID: <20190711011305.GJ5178@xz-x1>
References: <1562324511-2910-1-git-send-email-yi.l.liu@intel.com>
 <1562324511-2910-7-git-send-email-yi.l.liu@intel.com>
 <20190709031902.GD5178@xz-x1>
 <A2975661238FB949B60364EF0F2C257439F2A65F@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <A2975661238FB949B60364EF0F2C257439F2A65F@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: Re: [Qemu-devel] [RFC v1 06/18] intel_iommu: support virtual
 command emulation and pasid request
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Yi Sun <yi.y.sun@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Xu <zhexu@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 10, 2019 at 11:51:17AM +0000, Liu, Yi L wrote:

[...]

> > > +        s->vcrsp = 1;
> > > +        vtd_set_quad_raw(s, DMAR_VCRSP_REG,
> > > +                         ((uint64_t) s->vcrsp));
> > 
> > Do we really need to emulate the "In Progress" like this?  The vcpu is
> > blocked here after all, and AFAICT all the rest of vcpus should not
> > access these registers because obviously these registers cannot be
> > accessed concurrently...
> 
> Other vcpus should poll the IP bit before submitting vcmds. As IP bit
> is set, other vcpus will not access these bits. but if not, they may submit
> new vcmds, while we only have 1 response register, that is not we
> support. That's why we need to set IP bit.

I still don't think another CPU can use this register even if it
polled with IP==0...  The reason is simply as you described - we only
have one pair of VCMD/VRSPD registers so IMHO the guest IOMMU driver
must have a lock (probably a mutex) to guarantee sequential access of
these registers otherwise race can happen.

> 
> > 
> > I think the IP bit is useful when some new vcmd would take plenty of
> > time so that we can do the long vcmds in async way.  However here it
> > seems not the case?
> 
> no, so far, it is synchronize way. As mentioned above, IP bit is to ensure
> only one vcmd is handled for a time. Other vcpus won't be able to submit
> vcmds before IP is cleared.

[...]

> > > @@ -192,6 +198,7 @@
> > >  #define VTD_ECAP_SRS                (1ULL << 31)
> > >  #define VTD_ECAP_PASID              (1ULL << 40)
> > >  #define VTD_ECAP_SMTS               (1ULL << 43)
> > > +#define VTD_ECAP_VCS                (1ULL << 44)
> > >  #define VTD_ECAP_SLTS               (1ULL << 46)
> > >  #define VTD_ECAP_FLTS               (1ULL << 47)
> > >
> > > @@ -314,6 +321,29 @@ typedef enum VTDFaultReason {
> > >
> > >  #define VTD_CONTEXT_CACHE_GEN_MAX       0xffffffffUL
> > >
> > > +/* VCCAP_REG */
> > > +#define VTD_VCCAP_PAS               (1UL << 0)
> > > +#define VTD_MIN_HPASID              200
> > 
> > Comment this value a bit?
> 
> The basic idea is to let hypervisor to set a range for available PASIDs for
> VMs. One of the reasons is PASID #0 is reserved by RID_PASID usage.
> We have no idea how many reserved PASIDs in future, so here just a
> evaluated value. Honestly, set it as "1" is enough at current stage.

That'll be a very nice initial comment for that (I mean, put it into
the patch, of course :).

Regards,

-- 
Peter Xu

