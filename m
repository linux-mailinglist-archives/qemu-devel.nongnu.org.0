Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D28E0DDD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 23:46:28 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN1z1-0000aO-0t
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 17:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iN1x5-00006J-UL
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 17:44:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iN1x3-0007RJ-9a
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 17:44:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iN1x3-0007Qn-5W
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 17:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571780664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKEnwwvZkBoKQkKjGLBuPW/9OyQ9zYCnXgLkDtHA/wU=;
 b=aFCksAJEuXcAYCOB/HflqKJ99Q9hnQunhOv5UOimbRnSlYV2FHp6nO9buk326Y62Biq/xS
 BI/6w8JYgfmpQ7cGiWkPTuurcXLJhwOTytO4R3QFgU9IbkjTl7iuyLRIfblD+X8JWdRsyc
 CCJbgexCpUObpBYosM9pa/WKkoQ1VYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-BzegCTQAPeCZk_lTI7ZwPA-1; Tue, 22 Oct 2019 17:44:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A938476;
 Tue, 22 Oct 2019 21:44:19 +0000 (UTC)
Received: from localhost (ovpn-116-104.gru2.redhat.com [10.97.116.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 807745DA32;
 Tue, 22 Oct 2019 21:44:18 +0000 (UTC)
Date: Tue, 22 Oct 2019 18:44:17 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v4 2/2] i386: Add support to get/set/migrate Intel
 Processor Trace feature
Message-ID: <20191022214416.GA21651@habkost.net>
References: <1520182116-16485-1-git-send-email-luwei.kang@intel.com>
 <1520182116-16485-2-git-send-email-luwei.kang@intel.com>
 <20191012031407.GK4084@habkost.net>
 <82D7661F83C1A047AF7DC287873BF1E17382A209@SHSMSX104.ccr.corp.intel.com>
 <20191015132929.GY4084@habkost.net>
 <82D7661F83C1A047AF7DC287873BF1E17382BB76@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E17382BB76@SHSMSX104.ccr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: BzegCTQAPeCZk_lTI7ZwPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 21, 2019 at 06:02:28AM +0000, Kang, Luwei wrote:
> > > > > f9f4cd1..097c953 100644
> > > > > --- a/target/i386/kvm.c
> > > > > +++ b/target/i386/kvm.c
> > > > > @@ -1811,6 +1811,25 @@ static int kvm_put_msrs(X86CPU *cpu, int l=
evel)
> > > > >                  kvm_msr_entry_add(cpu, MSR_MTRRphysMask(i), mask=
);
> > > > >              }
> > > > >          }
> > > > > +        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT=
) {
> > > > > +            int addr_num =3D kvm_arch_get_supported_cpuid(kvm_st=
ate,
> > > > > +                                                    0x14, 1,
> > > > > + R_EAX) & 0x7;
> > > > > +
> > > > > +            kvm_msr_entry_add(cpu, MSR_IA32_RTIT_CTL,
> > > > > +                            env->msr_rtit_ctrl);
> > > > > +            kvm_msr_entry_add(cpu, MSR_IA32_RTIT_STATUS,
> > > > > +                            env->msr_rtit_status);
> > > > > +            kvm_msr_entry_add(cpu, MSR_IA32_RTIT_OUTPUT_BASE,
> > > > > +                            env->msr_rtit_output_base);
> > > >
> > > > This causes the following crash on some hosts:
> > > >
> > > >   qemu-system-x86_64: error: failed to set MSR 0x560 to 0x0
> > > >   qemu-system-x86_64: target/i386/kvm.c:2673: kvm_put_msrs: Asserti=
on `ret =3D=3D cpu->kvm_msr_buf->nmsrs' failed.
> > > >
> > > > Checking for CPUID_7_0_EBX_INTEL_PT is not enough: KVM has
> > > > additional conditions that might prevent writing to this MSR (PT_CA=
P_topa_output && PT_CAP_single_range_output).  This
> > causes QEMU to crash if some of the conditions aren't met.
> > > >
> > > > Writing and reading this MSR (and the ones below) need to be condit=
ional on KVM_GET_MSR_INDEX_LIST.
> > > >
> > >
> > > Hi Eduardo,
> > >     I found this issue can't be reproduced in upstream source code bu=
t can be reproduced on RHEL8.1. I haven't got the qemu source
> > code of RHEL8.1. But after adding some trace in KVM, I found the KVM ha=
s reported the complete Intel PT CPUID information to qemu
> > but the Intel PT CPUID (0x14) is lost when qemu setting the CPUID to KV=
M (cpuid level is 0xd). It looks like lost the below patch.
> > >
> > > commit f24c3a79a415042f6dc195f029a2ba7247d14cac
> > > Author: Luwei Kang <luwei.kang@intel.com>
> > > Date:   Tue Jan 29 18:52:59 2019 -0500
> > >     i386: extended the cpuid_level when Intel PT is enabled
> > >
> > >     Intel Processor Trace required CPUID[0x14] but the cpuid_level
> > >     have no change when create a kvm guest with
> > >     e.g. "-cpu qemu64,+intel-pt".
> >=20
> > Thanks for the pointer.  This may avoid triggering the bug in the defau=
lt configuration, but we still need to make the MSR writing
> > conditional on KVM_GET_MSR_INDEX_LIST.  Older machine-types have x-inte=
l-pt-auto-level=3Doff, and the user may set `level`
> > manually.
>=20
> Hi Eduardo,
> Sorry for a delay reply because my mail filter. I tried with
> the Q35 machine type and default, all looks work well (With
> some old cpu type + "intel_pt" also work well).  KVM will check
> the Intel PT work mode and HW to decide if Intel PT can be
> exposed to guest, only extended the CPUID level is useless. If
> the guest doesn't support Intel PT, any MSR read or write will
> cause #GP. Please remind me if I lost something.

I understand you have tried q35 and pc, but have you tried with
older machine-type versions?

Commit f24c3a79a415 doesn't change behavior on pc-*-3.1 and
older, so it only avoids triggering the crash in the default
case.  Doesn't QEMU crash if running:
"-cpu qemu64,+intel-pt -machine pc-i440fx-3.1"?

KVM rejecting MSR writes when something is missing is correct.
QEMU trying to write the MSR when something is missing (and
crashing because of that) is a bug.

--=20
Eduardo


