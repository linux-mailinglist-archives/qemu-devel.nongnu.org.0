Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494E9715D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 07:04:28 +0200 (CEST)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0InI-0003Mp-Vx
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 01:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i0ImD-0002vI-Dq
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 01:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i0ImB-0006LO-Ve
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 01:03:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i0ImB-0006L9-Mz
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 01:03:15 -0400
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B019859FF
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 05:03:14 +0000 (UTC)
Received: by mail-pg1-f199.google.com with SMTP id a9so606412pga.16
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 22:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J2A2DI6gYnhnkK+dYpL4wO5heNJB67BMKNYwt2UV6E4=;
 b=HE8+fE78YFKeUA9/ZrqzHFSLDybhe52ETIbX4aDjqyP5wMOJRMe/Fyxk18EAiO7Ogz
 ct+Ua7Cm+yepoQOOhG3i19kI/f2M3qadkv/F1mlwRt1XfEYqP8SvJuisjmCQUlMBGFPB
 hlltD0WyRfvXGU/dr0RUGnHVNvq363SK2eZemUeD58Ge5TQk3dAdlKHIMFpe8FNOEjpR
 8Uktmcq5pFPy2jJ/WC5+uVVF12wYN52O3yjr1fgN+soPEjAxvd0xh/syRT6a1qeUqTZp
 9MiUSazcVS+rIRKwfEhR1VW6XP/eqFc7w9SDfF2pBqGkUaYTJsEV0PklVyyHnQFsiRtl
 nWEg==
X-Gm-Message-State: APjAAAWkSsSlREuAoZ/vOd016FnWG7rIMzvXeE9yYND8jqNXRR6yGV41
 22B7DhckplURpJo1LxtSq6dMZgFvCDFZ3gemYvr7BvjZddbcPd6TtWBfMuTHuYiwPqvcmaouam2
 JgBhZqu4NpINiIaI=
X-Received: by 2002:a63:c246:: with SMTP id l6mr27998977pgg.210.1566363793797; 
 Tue, 20 Aug 2019 22:03:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZzzsXs+k3RcR8cycX8UqXLB4TFPAVz7/n6RtMuld1+M8XiwQUDdx9Gz95R+nAsVvcGyObMg==
X-Received: by 2002:a63:c246:: with SMTP id l6mr27998953pgg.210.1566363793399; 
 Tue, 20 Aug 2019 22:03:13 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k64sm28774381pgk.74.2019.08.20.22.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:03:12 -0700 (PDT)
Date: Wed, 21 Aug 2019 13:03:02 +0800
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190821050302.GA25454@xz-x1>
References: <20190812074531.28970-1-peterx@redhat.com>
 <20190820052240.GG13560@xz-x1>
 <f8e320ca-8c24-a562-1f5b-e55bd5c64d4a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8e320ca-8c24-a562-1f5b-e55bd5c64d4a@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC 0/4] intel_iommu: Do sanity check of
 vfio-pci earlier
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 08:24:49AM +0200, Paolo Bonzini wrote:
> On 20/08/19 07:22, Peter Xu wrote:
> > On Mon, Aug 12, 2019 at 09:45:27AM +0200, Peter Xu wrote:
> >> This is a RFC series.
> >>
> >> The VT-d code has some defects, one of them is that we cannot detect
> >> the misuse of vIOMMU and vfio-pci early enough.
> >>
> >> For example, logically this is not allowed:
> >>
> >>   -device intel-iommu,caching-mode=off \
> >>   -device vfio-pci,host=05:00.0
> >>
> >> Because the caching mode is required to make vfio-pci devices
> >> functional.
> >>
> >> Previously we did this sanity check in vtd_iommu_notify_flag_changed()
> >> as when the memory regions change their attributes.  However that's
> >> too late in most cases!  Because the memory region layouts will only
> >> change after IOMMU is enabled, and that's in most cases during the
> >> guest OS boots.  So when the configuration is wrong, we will only bail
> >> out during the guest boots rather than simply telling the user before
> >> QEMU starts.
> >>
> >> The same problem happens on device hotplug, say, when we have this:
> >>
> >>   -device intel-iommu,caching-mode=off
> >>
> >> Then we do something like:
> >>
> >>   (HMP) device_add vfio-pci,host=05:00.0,bus=pcie.1
> >>
> >> If at that time the vIOMMU is enabled in the guest then the QEMU
> >> process will simply quit directly due to this hotplug event.  This is
> >> a bit insane...
> >>
> >> This series tries to solve above two problems by introducing two
> >> sanity checks upon these places separately:
> >>
> >>   - machine done
> >>   - hotplug device
> >>
> >> This is a bit awkward but I hope this could be better than before.
> >> There is of course other solutions like hard-code the check into
> >> vfio-pci but I feel it even more unpretty.  I didn't think out any
> >> better way to do this, if there is please kindly shout out.
> >>
> >> Please have a look to see whether this would be acceptable, thanks.
> > 
> > Any more comment on this?
> 
> No problem from me, but I wouldn't mind if someone else merged it. :)

Can I read this as an "acked-by"? :)

Michael, should this be for your tree?  What do you think about the
series?  Please let me know what I need to do to move this forward.  I
can repost a non-rfc series if needed, but it'll be exactly the same
content.

Regards,

-- 
Peter Xu

