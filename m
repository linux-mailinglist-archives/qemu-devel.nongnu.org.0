Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEADB3CD639
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:58:16 +0200 (CEST)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Tmi-0007qD-09
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5Tlc-0006Lm-8M
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5TlZ-0004mR-6D
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626703024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0OFxMbOBCeICyfPyTWdG6wj8q1zcVzzQ3B4N///DzM=;
 b=de7j3ZZ8wZaq9pNj0d7BZR8KCZbOp0TneP2/YL5FVW9ia8yTSlWJ8ww37LcuUV31lpjD7a
 qryVzNQZIKNGPybKuSyb9VIGdVvsjBbF6Wpjocnkw8xnqg9pYblX3KEFhm5CegkdWfjzwz
 FYUx745yTzmHC5h3MeiTv28UzeTpgQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-V9MPqBdtObqEQNcNP8ILRg-1; Mon, 19 Jul 2021 09:57:02 -0400
X-MC-Unique: V9MPqBdtObqEQNcNP8ILRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31C11018721;
 Mon, 19 Jul 2021 13:57:01 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF96019C44;
 Mon, 19 Jul 2021 13:56:56 +0000 (UTC)
Date: Mon, 19 Jul 2021 15:56:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 9/9] qtest/hyperv: Introduce a simple hyper-v test
Message-ID: <20210719155655.0a1ebe3d@redhat.com>
In-Reply-To: <875yxa1mqx.fsf@vitty.brq.redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-10-vkuznets@redhat.com>
 <20210708210222.arl4zzquuw75ptwp@habkost.net>
 <20210709102242.2a7cd7f7@redhat.com>
 <875yxa1mqx.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 14:12:06 +0200
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Thu, 8 Jul 2021 17:02:22 -0400
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >  
> >> On Tue, Jun 08, 2021 at 02:08:17PM +0200, Vitaly Kuznetsov wrote:  
> >> > For the beginning, just test 'hv-passthrough' and a couple of custom
> >> > Hyper-V  enlightenments configurations through QMP. Later, it would
> >> > be great to complement this by checking CPUID values from within the
> >> > guest.
> >> > 
> >> > Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>    
> >> [...]  
> >> > +static bool kvm_has_sys_hyperv_cpuid(void)
> >> > +{
> >> > +    int fd = open("/dev/kvm", O_RDWR);
> >> > +    int ret;
> >> > +
> >> > +    g_assert(fd > 0);    
> >>   
> 
> g_assert() was an overkill, just 'return false' would do.
> 
> >> This crashes when /dev/kvm doesn't exist.  See:
> >> https://gitlab.com/ehabkost/qemu/-/jobs/1404084459  
> >
> > maybe reuse qtest_has_accel()
> >  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06864.html
> >
> > instead of op encoding it.  
> 
> The purpose of this function is to check if KVM_CAP_SYS_HYPERV_CPUID is
> supported by KVM. It is certainly unsupported when KVM is not present
> :-) but an ioctl() is needed when it is.
> 
> We already have a similar check in tests/qtest/migration-test.c where we
> test for KVM_CAP_DIRTY_LOG_RING, maybe we can create a library function
> but we don't seem to have any KVM-specific stuff in qtest at this moment

qtest_has_accel() is a such library function
in the same series see https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06878.html
which replaces custom kvm probing in tests/qtest/migration-test.c

> ...
> 
> >> I'm removing it from the queue.  
> 
> I'll fix g_assert() and send as a separate patch if it's fine.
> 


