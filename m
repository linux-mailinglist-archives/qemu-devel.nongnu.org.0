Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E114DD973
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:13:52 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBUN-0004ZO-9x
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:13:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nVBQR-0002J0-Np
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:09:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:29425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nVBQO-0005RD-S9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647605384; x=1679141384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/qfBokc3of1SZgcqHrP4j9+9nVTTweBakkIJlzwj29Q=;
 b=m0hPtQekr5B8ElegSoNSMPOBnBE8huEgDBLKW2nIqymrSxmg6lGUlK8Y
 F+25uR8GSVyJw3xPHGX9xunu4YdzCMKDDV9oHF+Ho4cfO1F1wkvYOF//r
 oTgpHt9MVbOT420Av3ocTOcKna7AmV2Glywc+w2DEH3xKRb3y3sVl00rk
 mFIKfSL8St+q30npmiUfdGRQRQS9Ud0LJcjibTk90aOYeOxlUHyn9MIeb
 9F52mHVu8soaxMY6PAR1xSv0GOMtPNWB6X/0tKFjUep2HYCaHKiKOjJGP
 J9Wc4aHhOKlw+8gR8HJ7hqjbACooa+6cakcvdL0/lSnjCrEiaDf8Ij5KU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237069059"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237069059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 05:09:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558410479"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 18 Mar 2022 05:09:39 -0700
Date: Fri, 18 Mar 2022 19:53:44 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Michal =?iso-8859-1?B?UHLtdm96bu1r?= <mprivozn@redhat.com>,
 pbonzini@redhat.com
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
Message-ID: <20220318115344.GA24975@yangzhon-Virtual>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk>
 <50ab6e2a-7cdf-14e2-29da-6780ad4a43d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50ab6e2a-7cdf-14e2-29da-6780ad4a43d2@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 11:13:56AM +0100, Michal Prívozník wrote:
> On 3/16/22 16:57, Peter Krempa wrote:
> > On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
> >> From: Yang Zhong <yang.zhong@intel.com>
> >>
> >> Kernel allocates 4K xstate buffer by default. For XSAVE features
> >> which require large state component (e.g. AMX), Linux kernel
> >> dynamically expands the xstate buffer only after the process has
> >> acquired the necessary permissions. Those are called dynamically-
> >> enabled XSAVE features (or dynamic xfeatures).
> >>
> >> There are separate permissions for native tasks and guests.
> >>
> >> Qemu should request the guest permissions for dynamic xfeatures
> >> which will be exposed to the guest. This only needs to be done
> >> once before the first vcpu is created.
> >>
> >> KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
> >> get host side supported_xcr0 and Qemu can decide if it can request
> >> dynamically enabled XSAVE features permission.
> >> https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
> >>
> >> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> >> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> >> Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>  target/i386/cpu.c          |  7 +++++
> >>  target/i386/cpu.h          |  4 +++
> >>  target/i386/kvm/kvm-cpu.c  | 12 ++++----
> >>  target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
> >>  target/i386/kvm/kvm_i386.h |  1 +
> >>  5 files changed, 75 insertions(+), 6 deletions(-)
> > 
> > With this commit qemu crashes for me when invoking the following
> > QMP command:
> > 
> > $ ~pipo/git/qemu.git/build/qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm -qmp stdio
> > {"QMP": {"version": {"qemu": {"micro": 90, "minor": 2, "major": 6}, "package": "v7.0.0-rc0-8-g1d60bb4b14"}, "capabilities": ["oob"]}}
> > {'execute':'qmp_capabilities'}
> > {"return": {}}
> > {"execute":"qom-list-properties","arguments":{"typename":"max-x86_64-cpu"},"id":"libvirt-41"}
> > qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init: Assertion `esa->size == eax' failed.
> > Aborted (core dumped)
> > 
> > Note that the above is on a box with an 'AMD Ryzen 9 3900X'.
> > 
> > Curiously on a laptop with an Intel chip (Intel(R) Core(TM) i7-10610U)
> > it seems to work.
> > 
> > 
> 
> Not trying to beat a dead horse here, but I've just found another
> problem with this patch. On my laptop (Linux maggie
> 5.15.26-gentoo-x86_64 #1 SMP Thu Mar 10 08:55:28 CET 2022 x86_64
> Intel(R) Core(TM) i7-10610U CPU @ 1.80GHz GenuineIntel GNU/Linux), when
> I start a guest it no longer sees AVX instructions:
> 
>   qemu.git $ ./build/qemu-system-x86_64 -accel kvm -cpu host ...
>

  Thanks Michal, this issue is caused by compatibility with older kernel version.

  The Qemu will report below logs:
  emu-system-x86_64: warning: cannot get sys attribute capabilities 0
  qemu-system-x86_64: warning: cannot get sys attribute capabilities 0
  qemu-system-x86_64: warning: cannot get sys attribute capabilities 0
  qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 5]
  qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 6]
  qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 9]
  ......

  Since the AMX changes in Qemu need read ARCH_GET_XCOMP_SUPP attribute to get host supported_xcr0
  value, and new kernel release add this new API. So the older kernel can't report right xcr0 value.

  I made one new patch to fix this issue, please try this patch. thanks!
  https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg04732.html

  Paolo, this patch only fix this compatibility issue, but the issue caused by AMD cpu is still not
  fixed from my side because no AMD platform can be used in my side. If you have no time to check
  this issue, maybe I need lookfor this platform from our internal. thanks!

  Yang 

 
> Michal

