Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BA272F02
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKP57-0006Vz-Q9
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKP1Q-0004id-26
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 12:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKP1N-0002N5-Va
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 12:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600707033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjvE9YzL00mg2t6x/rsy9xvERlUVELpr5h+HEMD/XH4=;
 b=QrzcVEFIOo30zEu4OhQ68Ktt8AK9pHSTiNnjxsOG9Q2ODFKhji/x5+pIbhW/cFskSLyQLd
 qgjXIwHFzb1E+NxOuHOwwKchKhSOtwCGc2UyI5kslk7yS1E/fZCLe9xAytTRnqYzaOqK0b
 mCaC20tCFusniWoPW7kHlrF8zTJ88q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-ZFzwHe-5OEeFPplaPKXy5w-1; Mon, 21 Sep 2020 12:50:31 -0400
X-MC-Unique: ZFzwHe-5OEeFPplaPKXy5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E767C10082E7;
 Mon, 21 Sep 2020 16:50:29 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 789DF19744;
 Mon, 21 Sep 2020 16:50:29 +0000 (UTC)
Date: Mon, 21 Sep 2020 12:50:28 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v1 0/3] Remove the limitation of Intel PT CPUID info
Message-ID: <20200921165028.GP57321@habkost.net>
References: <1582580312-19864-1-git-send-email-luwei.kang@intel.com>
 <82D7661F83C1A047AF7DC287873BF1E1738B07FF@SHSMSX104.ccr.corp.intel.com>
 <20200918220255.GB57321@habkost.net>
 <CY4PR11MB14473A594C244A5B403ADC26803A0@CY4PR11MB1447.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR11MB14473A594C244A5B403ADC26803A0@CY4PR11MB1447.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:43:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Strong, Beeman" <beeman.strong@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 21, 2020 at 07:49:22AM +0000, Kang, Luwei wrote:
> Hi Eduardo,
>     This patch set will remove some limitations of Intel PT CPUID information.
>     1. The "IP payloads" feature will disable the Intel PT in guests and it will be coming soon.
>     2. To make the live migration safe, we set the Intel PT CPUID as a constant value(Icelake server CPUID). It will mask off the new feature of Intel PT.

Isn't this series doing the opposite of 2?  It replaces all
constant CPUID values with kvm_arch_get_supported_cpuid(), making
the feature unavailable in migration-safe mode.

Does it mean the plan is to drop intel-pt migration support
entirely?

> 
>     About this issue https://bugzilla.redhat.com/show_bug.cgi?id=1853972, Intel PT is disabled in the guest by default, we should use "-cpu Icelake-Server,+intel-pt" to enable the Intel PT.

That's correct.  The point of the BZ is that libvirt
mode=host-model was expected to include intel-pt automatically
when available.  With this series, the request in the BZ stops
making sense (because intel-pt won't be migration-safe anymore),
but I'm not sure yet that's really the plan.


> 
> Thanks,
> Luwei Kang
> 
> > -----Original Message-----
> > From: Eduardo Habkost <ehabkost@redhat.com>
> > Sent: Saturday, September 19, 2020 6:03 AM
> > To: Kang, Luwei <luwei.kang@intel.com>
> > Cc: pbonzini@redhat.com; rth@twiddle.net; qemu-devel@nongnu.org; Strong,
> > Beeman <beeman.strong@intel.com>; Jiri Denemark
> > <jdenemar@redhat.com>; Robert Hoo <robert.hu@linux.intel.com>
> > Subject: Re: [PATCH v1 0/3] Remove the limitation of Intel PT CPUID info
> > 
> > Hi Luwei Kang,
> > 
> > I was looking for info on intel-pt and just saw this series, and it was never
> > reviewed or merged (sorry for missing it!).  Is this still the approach we want to
> > follow for intel-pt?
> > 
> > I'm CCing Jiri Denemark because this might be relevant for a libvirt issue related
> > to intel-pt we were investigating[1].
> > 
> > [1] https://bugzilla.redhat.com/show_bug.cgi?id=1853972
> > 
> > 
> > On Mon, Mar 30, 2020 at 09:56:09AM +0000, Kang, Luwei wrote:
> > > > -----Original Message-----
> > > > From: Kang, Luwei <luwei.kang@intel.com>
> > > > Sent: Tuesday, February 25, 2020 5:38 AM
> > > > To: pbonzini@redhat.com; rth@twiddle.net; ehabkost@redhat.com
> > > > Cc: qemu-devel@nongnu.org; Strong, Beeman
> > <beeman.strong@intel.com>;
> > > > Kang, Luwei <luwei.kang@intel.com>
> > > > Subject: [PATCH v1 0/3] Remove the limitation of Intel PT CPUID info
> > > >
> > > > The Intel PT feature includes some
> > > > sub-features(CPUID.(EAX=14H,ECX=0H))
> > > > and these sub-features are different on different HW platforms. To
> > > > make the live migration safety(get the same CPUID info with same cpu
> > > > model on different HW platform), the current Intel PT CPUID
> > > > information is set to a constant value(from ICELAKE Server).
> > > >
> > > > It will block the new feature in the later HW platform. what's more,
> > > > the support of "IP payloads" will disable the Intel PT in KVM
> > > > guest(patch 1) but it will come soon.
> > > >
> > > > This patchset remove this limitation and expose all the capabilities
> > > > to KVM guest. As it will break the live migration safe, Intel PT
> > > > will be masked as unmigratable.
> > >
> > > Ping.
> > >
> > > Thanks,
> > > Luwei Kang
> > >
> > > >
> > > > Luwei Kang (3):
> > > >   i386: Remove the limitation of IP payloads for Intel PT
> > > >   i386: Remove the CPUID limitation of Intel PT
> > > >   i386: Mark the 'INTEL_PT' CPUID bit as unmigratable
> > > >
> > > >  target/i386/cpu.c | 69
> > > > ++++---------------------------------------------------
> > > >  1 file changed, 5 insertions(+), 64 deletions(-)
> > > >
> > > > --
> > > > 1.8.3.1
> > >
> > 
> > --
> > Eduardo
> 

-- 
Eduardo


