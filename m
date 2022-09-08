Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD325B1825
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:12:14 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWDa1-0002rS-OR
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oWDXp-0000L3-0Z
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oWDXl-0007g3-G6
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662628192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=329hHSBfRIiAIbf/nfGNHlmtuUIxMqhm0R8yZRGevmI=;
 b=OtO1QCkDO+d0RZTiq+K5/WJKzTiH1i9fptSHo5Vx88RdzPuYC36DuEHiYfNad3Gpp4J7OK
 yKoXNAS+HQJ7rJbp97GC2QYeQRYU2qZ11arWoo868Ug434vxinvYGM+aU/FIkUSjFdmBVZ
 3h9zTO0+GCAOVDyQixY+BpD8B+CdKpA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-D2UY6kRYMHqb4ZLz404NMw-1; Thu, 08 Sep 2022 05:09:49 -0400
X-MC-Unique: D2UY6kRYMHqb4ZLz404NMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09C1C1C004E6;
 Thu,  8 Sep 2022 09:09:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C875AC15BBA;
 Thu,  8 Sep 2022 09:09:47 +0000 (UTC)
Date: Thu, 8 Sep 2022 10:09:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Message-ID: <YxmxVuYq2vqFgvqK@redhat.com>
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
 <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 08, 2022 at 09:53:44AM +0100, Peter Maydell wrote:
> On Thu, 8 Sept 2022 at 09:08, Chenyi Qiang <chenyi.qiang@intel.com> wrote:
> >
> > After updating linux headers to v6.0-rc, clang build on x86 target would
> > generate warnings like:
> >
> > target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
> > type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> > extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >         struct kvm_msrs info;
> >                         ^
> > target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable sized
> > type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
> > extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >         struct kvm_cpuid2 cpuid;
> >                           ^
> > target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
> > type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> > extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >         struct kvm_msrs info;
> >                         ^
> >
> > Considering that it is OK to use GNU extension in QEMU (e.g. g_auto stuff),
> > it is acceptable to turn off this warning, which is only relevant to people
> > striving for fully portable C code.
> 
> Can we get the kernel folks to fix their headers not to
> use GCC extensions like this ? It's not a big deal for us
> I guess, but in general it doesn't seem great that the
> kernel headers rely on userspace to silence warnings...

The kernel headers are fine actually - it is C99 compliant to have
a unsized array field in structs. eg 

The problem is in the QEMU code which is taking the kernel declared
struct, and then embedding it inside another struct. e.g. the
kernel exposes:

  struct kvm_msrs {
        __u32 nmsrs; /* number of msrs in entries */
        __u32 pad;

        struct kvm_msr_entry entries[];
  };


which we then use as:

  uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
  {
    struct {
        struct kvm_msrs info;
        struct kvm_msr_entry entries[1];
    } msr_data = {};

'kvm_msrs info' is variable in size, so offset of 'entries[1]' is
undefined by C99. I presume the GNU defined semantics are that the
variable length 'entries[]' field in 'info' is zero-sized, in order
to give predictable offset for 'entries[1]' in the local msr_data.

IOW, our locally defined struct is just there to force a stack
allocation large enough for 1 kvm_msr_entry. A clever trick, but
requires that we turn off the CLang portability warning

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


