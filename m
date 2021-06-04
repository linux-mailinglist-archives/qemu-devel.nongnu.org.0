Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB939C030
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 21:08:41 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpFBQ-0005oO-BC
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 15:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lpFAL-0004Lg-V1
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 15:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lpFAI-0005pV-5j
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 15:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622833647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WH0L4cOcBjYqMsxesi8VGxxcmnU7oqKrG+cylCXGJNY=;
 b=K9tXR+Ode021WBKuvKoU14YPDX3PmPQouIbUHI7NiUQSudk1noWAE3AcdOHoOvkReGIH66
 O6VU1SFyzCDChy8PPYnlV4tZwO/ypdq/9HLtfWOnLPOzDiXVxnuhT3tHMMTBvFo52+z2Dk
 DETnND13CP+viaxYzlXw53mjfqaB8XM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-JXPDcBTGMgqzV6yA87ZEtg-1; Fri, 04 Jun 2021 15:07:26 -0400
X-MC-Unique: JXPDcBTGMgqzV6yA87ZEtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50618106BB24
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 19:07:25 +0000 (UTC)
Received: from localhost (ovpn-112-6.rdu2.redhat.com [10.10.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 069575C234;
 Fri,  4 Jun 2021 19:07:24 +0000 (UTC)
Date: Fri, 4 Jun 2021 15:00:28 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 3/9] i386: hardcode supported eVMCS version to '1'
Message-ID: <20210604190028.jxta4nr6cjafq4db@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-4-vkuznets@redhat.com>
 <20210603223506.no7j7jais3qixdhs@habkost.net>
 <877dja1434.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <877dja1434.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 09:28:15AM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Jun 03, 2021 at 01:48:29PM +0200, Vitaly Kuznetsov wrote:
> >> Currently, the only eVMCS version, supported by KVM (and described in TLFS)
> >> is '1'. When Enlightened VMCS feature is enabled, QEMU takes the supported
> >> eVMCS version range (from KVM_CAP_HYPERV_ENLIGHTENED_VMCS enablement) and
> >> puts it to guest visible CPUIDs. When (and if) eVMCS ver.2 appears a
> >> problem on migration is expected: it doesn't seem to be possible to migrate
> >> from a host supporting eVMCS ver.2 to a host, which only support eVMCS
> >> ver.1.
> >
> > Isn't it possible and safe to expose eVMCS ver.1 to the guest on
> > a host that supports ver.2?
> 
> We expose the supported range, guest is free to use any eVMCS version in
> the range (see below):

Oh, I didn't notice the returned value was a range.

> 
> >
> >> 
> >> Hardcode eVMCS ver.1 as the result of 'hv-evmcs' enablement for now. Newer
> >> eVMCS versions will have to have their own enablement options (e.g.
> >> 'hv-evmcs=2').
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  docs/hyperv.txt       |  2 +-
> >>  target/i386/kvm/kvm.c | 16 +++++++++++-----
> >>  2 files changed, 12 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> >> index a51953daa833..000638a2fd38 100644
> >> --- a/docs/hyperv.txt
> >> +++ b/docs/hyperv.txt
> >> @@ -170,7 +170,7 @@ Recommended: hv-frequencies
> >>  3.16. hv-evmcs
> >>  ===============
> >>  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
> >> -enabled, it provides Enlightened VMCS feature to the guest. The feature
> >> +enabled, it provides Enlightened VMCS version 1 feature to the guest. The feature
> >>  implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
> >>  hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
> >>  Note: some virtualization features (e.g. Posted Interrupts) are disabled when
> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >> index c676ee8b38a7..d57eede5dc81 100644
> >> --- a/target/i386/kvm/kvm.c
> >> +++ b/target/i386/kvm/kvm.c
> >> @@ -1490,13 +1490,19 @@ static int hyperv_init_vcpu(X86CPU *cpu)
> >>          ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
> >>                                    (uintptr_t)&evmcs_version);
> >>  
> >> -        if (ret < 0) {
> >> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
> >> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
> >> +        /*
> >> +         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
> >> +         * option sets. Note: we hardcode the maximum supported eVMCS version
> >> +         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
> >> +         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
> >> +         * to be added.
> >> +         */
> >> +        if (ret < 0 || (uint8_t)evmcs_version > 1) {
> >
> > Wait, do you really want to get a fatal error every time, after a
> > kernel upgrade?
> >
> 
> Here, evmcs_version (returned by kvm_vcpu_enable_cap()) represents a
> *range* of supported eVMCS versions:
> 
> (evmcs_highest_supported_version << 8) | evmcs_lowest_supported_version
> 
> Currently, this is 0x101 [1..1] range.
> 
> The '(uint8_t)evmcs_version > 1' check here means 'eVMCS v1' is no
> longer supported by KVM. This is not going to happen any time soon, but
> I can imagine in 10 years or so we'll be dropping v1 so the range (in
> theory) can be [10..2] -- which would mean eVMCS ver. 1 is NOT
> supported. And we can't proceed then.

Where is this documented?  The only reference to
KVM_CAP_HYPERV_ENLIGHTENED_VMCS I've found in linux/Documentation is this
single sentence:

| - HYPERV_CPUID_NESTED_FEATURES leaf and HV_X64_ENLIGHTENED_VMCS_RECOMMENDED
|  feature bit are only exposed when Enlightened VMCS was previously enabled
|  on the corresponding vCPU (KVM_CAP_HYPERV_ENLIGHTENED_VMCS).


> >>          ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
> >>                                    (uintptr_t)&evmcs_version);
> >>  
> >> -        if (ret < 0) {
> >> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
> >> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
> >> +        /*
> >> +         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
> >> +         * option sets. Note: we hardcode the maximum supported eVMCS version
> >> +         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
> >> +         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
> >> +         * to be added.
> >> +         */
> >> +        if (ret < 0 || (uint8_t)evmcs_version > 1) {

Can we start with something that won't need to be rewritten after we change the
guest evmcs version range?  e.g.:

    static bool evmcs_version_supported(uint16_t version, uint32_t supported)
    {
        uint8_t min_ver = version;
        uint8_t max_ver = version >> 8;
        uint8_t min_supported = supported;
        uint8_t max_supported = supported >> 8;
        return (min_ver >= min_supported) && (max_ver <= max_supported);
    }
    ...
    #define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
    ...
    uint16_t evmcs_version = DEFAULT_EVMCS_VERSION;
    int ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
                              (uintptr_t)&supported_evmcs_version);
    if (ret < 0) {
        fprintf(...)
        return ret;
    }
    if (!evmcs_version_supported(evmcs_version, supported_evmcs_version)) {
        fprintf(...)
        return -ENOTSUP;
    }
    cpu->hyperv_nested[0] = evmcs_version;


> 
> > I was expecting this:
> >
> >   vcpu_evmcs_version = 1; /* hardcoded, but can become configurable later */
> >   ...
> >   kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0, (uintptr_t)&supported_evmcs_version);
> >   if (ret < 0 || supported_evmcs_version < vcpu_evmcs_version) {
> >     error_setg(...);
> >     return;
> >   }
> >   cpu->hyperv_nested[0] = vcpu_evmcs_version;
> >
> >
> >> +            error_report("Hyper-V %s verson 1 is not supported by kernel",
> >> +                         kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);

s/verson/version/

> >>              return ret;

What if ret is 0?

> >>          }
> >> -
> >> -        cpu->hyperv_nested[0] = evmcs_version;
> >> +        cpu->hyperv_nested[0] = (1 << 8) | 1;
> >>      }
> >>  
> >>      return 0;
> >> -- 
> >> 2.31.1
> >> 
> 
> -- 
> Vitaly
> 

-- 
Eduardo


