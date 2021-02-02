Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567030BE3E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:34:06 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6usf-0007eJ-Eb
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6urX-0007CW-Ax
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6urV-0002TK-3H
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612269171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kk9VtVUgZFfwitnkcooOOncz1v8gpWy1DS6A8o5aFac=;
 b=WuLRmMG4lrSOTFTSu7J79HXxORdcEuvPO20PW5caphVQFL306f+v4P2Cts7GmpWG3ymrpU
 d/LvM2h2/9zkWwa7I9QVjI9LsP0L8DNQffQdD8yXCIpuKg3MuX4cdy+ZVbjzDUd5KFOPLu
 zlA5b+XSd90YWwrWb7uiZXS5WgLyG5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-MO1L0BZZN4ak7TCg_V7A-A-1; Tue, 02 Feb 2021 07:32:48 -0500
X-MC-Unique: MO1L0BZZN4ak7TCg_V7A-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33A5A107ACE4;
 Tue,  2 Feb 2021 12:32:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5758E10016DB;
 Tue,  2 Feb 2021 12:32:42 +0000 (UTC)
Date: Tue, 2 Feb 2021 12:32:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [PATCH RFC 2/4] target/i386: define CPU models to model x86-64
 ABI levels
Message-ID: <20210202123239.GE4168502@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-3-berrange@redhat.com>
 <cunsg6els34.fsf@dme.org>
MIME-Version: 1.0
In-Reply-To: <cunsg6els34.fsf@dme.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Florian Weimer <fweimer@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 09:46:55AM +0000, David Edmondson wrote:
> On Monday, 2021-02-01 at 15:36:04 GMT, Daniel P. Berrangé wrote:
> 
> > To paraphrase:
> >
> >   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level/
> >
> > In 2020, AMD, Intel, Red Hat, and SUSE worked together to define
> > three microarchitecture levels on top of the historical x86-64
> > baseline:
> >
> >   * x86-64:    original x86_64 baseline instruction set
> >   * x86-64-v2: vector instructions up to Streaming SIMD
> >                Extensions 4.2 (SSE4.2)  and Supplemental
> > 	       Streaming SIMD Extensions 3 (SSSE3), the
> > 	       POPCNT instruction, and CMPXCHG16B
> >   * x86-64-v3: vector instructions up to AVX2, MOVBE,
> >                and additional bit-manipulation instructions.
> >   * x86-64-v4: vector instructions from some of the
> >                AVX-512 variants.
> >
> > This list of features is defined in the doc at:
> >
> >   https://gitlab.com/x86-psABIs/x86-64-ABI/
> >
> > QEMU has historically defaulted to the "qemu64" CPU model on
> > x86_64 targets, which is approximately the x86-64 baseline
> > ABI, with 'SVM' added.
> >
> > It is thought it might be desirable if QEMU could provide CPU models
> > that closely correspond to the ABI levels, while offering portability
> > across the maximum number of physical CPUs.
> >
> > Historically we've found that defining CPU models with an arbitrary
> > combination of CPU features can be problematic, as some guest OS
> > will not check all features they use, and instead assume that if
> > they see feature "XX", then "YY" will always exist. This is reasonable
> > in bare metal, but subject to breakage in virtualization.
> >
> > Thus in defining the CPI models for the ABI levels, this patch attempted
> 
> s/CPI/CPU/
> 
> > to base them off an existing CPU model.
> >
> > While each x86-64-abiNNN has a designated vendor, they are designed
> > to be vendor agnostic models. ie they are capable of running on any
> > AMD or Intel physical CPU model that satisfies the ABI level. eg
> 
> Only AMD or Intel? (You mention the Hugon chips elsewhere.)

In theory any x86 CPU that meets the ABI level, regardless of vendor
but if any vendor's set of CPUID features diverges too far from other
CPUs of similar level we might have problems.

For example, I had to specially avoid including "aes" in the
x86-64-abi3 because of the Hugon chips lacking it. There might
be other cases like this, since I've only compared CPUID sets
for named CPUs that QEMU includes.

> > None of the CPU models declare any VMX/SVM features. This would
> > make them unable to support nested virtualization with live
> > migration.
> 
> How about "Unable to support hardware accelerated nested
> virtualization." ?
> 
> Is live migration relevant?

Choice of CPU models is a critical decision in your future ability
to live migrate, so I wanted to call that out specifically.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


