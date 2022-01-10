Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7748973F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:21:08 +0100 (CET)
Received: from localhost ([::1]:35226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6sjb-0001Mq-9L
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n6shG-0008JQ-02
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n6shC-0004Ul-Lb
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641813515;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6yvXSdG8moFPznyivPUcH7Feaqgjzliy5iEUbJ6Pdlg=;
 b=KghL4A7+aaedlw7T6V3J0WGiYvrSyLyWqdhQeruPI0s6zvYs959eCY45Zfe9f3bsRz9i+Q
 zeEHO0+a7/u5/YBCjb0oJEfD5j0xTMZzO3RB617e8jpMyfTpMR3m4IVWkfQVF9ZDsxjXpm
 2QCwT2EhXp+bvmKZfBe+oB5iHobjXt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-sCzK_TxPOG-U7XYpuTAtrQ-1; Mon, 10 Jan 2022 06:18:32 -0500
X-MC-Unique: sCzK_TxPOG-U7XYpuTAtrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E3D1853024;
 Mon, 10 Jan 2022 11:18:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 498781ABE5;
 Mon, 10 Jan 2022 11:18:13 +0000 (UTC)
Date: Mon, 10 Jan 2022 11:18:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v2 06/44] hw/i386: Introduce kvm-type for TDX guest
Message-ID: <YdwV8jUm+RuirhxK@redhat.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <04c08d0770736cfa2e3148489602bc42492c78f3.1625704980.git.isaku.yamahata@intel.com>
 <20210826102212.gykq2z4fb2iszb2k@sirius.home.kraxel.org>
 <03aaab8b-0a50-6b56-2891-ccd58235ad83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03aaab8b-0a50-6b56-2891-ccd58235ad83@intel.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: isaku.yamahata@intel.com, alistair@alistair23.me, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, mtosatti@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 erdemaktas@google.com, pbonzini@redhat.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:31:13PM +0800, Xiaoyao Li wrote:
> On 8/26/2021 6:22 PM, Gerd Hoffmann wrote:
> > On Wed, Jul 07, 2021 at 05:54:36PM -0700, isaku.yamahata@gmail.com wrote:
> > > From: Xiaoyao Li <xiaoyao.li@intel.com>
> > > 
> > > Introduce a machine property, kvm-type, to allow the user to create a
> > > Trusted Domain eXtensions (TDX) VM, a.k.a. a Trusted Domain (TD), e.g.:
> > > 
> > >   # $QEMU \
> > > 	-machine ...,kvm-type=tdx \
> > > 	...
> 
> Sorry for the very late reply.
> 
> > Can we align sev and tdx better than that?
> > 
> > SEV is enabled this way:
> > 
> > qemu -machine ...,confidential-guest-support=sev0 \
> >       -object sev-guest,id=sev0,...
> > 
> > (see docs/amd-memory-encryption.txt for details).
> > 
> > tdx could likewise use a tdx-guest object (and both sev-guest and
> > tdx-guest should probably have a common parent object type) to enable
> > and configure tdx support.
> 
> yes, sev only introduced a new object and passed it to
> confidential-guest-support. This is because SEV doesn't require the new type
> of VM.
> However, TDX does require a new type of VM.
> 
> If we read KVM code, there is a parameter of CREATE_VM to pass the vm_type,
> though x86 doesn't use this field so far. On QEMU side, it also has the
> codes to pass/configure vm-type in command line. Of cousre, x86 arch doesn't
> implement it. With upcoming TDX, it will implement and use vm type for TDX.
> That's the reason we wrote this patch to implement kvm-type for x86, similar
> to other arches.
> 
> yes, of course we can infer the vm_type from "-object tdx-guest". But I
> prefer to just use vm_type. Let's see others opinion.

It isn't just SEV that is using the confidential-guest-support approach.
This was done for PPC64 and S390x too.  This gives QEMU a standard
internal interface to declare that a confidential guest is being used /
configured. IMHO, TDX needs to use this too, unless there's a compelling
technical reason why it is a bad approach & needs to diverge from every
other confidential guest impl in QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


