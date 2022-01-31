Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC104A4DC1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 19:11:02 +0100 (CET)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEb8n-00019n-Bt
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 13:11:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEb2W-0006C6-LY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEb2U-0008SE-Ph
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643652269;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSGCW5OjC95PL6FKAO8CDu83ly2bMjKo998MZ7e8R8E=;
 b=cQUYDaRqDlHQABJLByThieoUW1Qt5eXmkK39vnpz4L/DaUE3NybBooKyd3KAUcUxYOX/88
 xi8v2fmfS1Hk8JVv8OGZV1U5WZn9kdk2OU+d19vt/roballjANnYCdLrcymTVtCpum7f1O
 PCRJgs9ssNbeHaPTulb++QgAUmO8DMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-GFWIthsvO1yvF5TpxZ8qQA-1; Mon, 31 Jan 2022 13:04:25 -0500
X-MC-Unique: GFWIthsvO1yvF5TpxZ8qQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8966646868;
 Mon, 31 Jan 2022 18:04:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A27B27744A;
 Mon, 31 Jan 2022 18:03:37 +0000 (UTC)
Date: Mon, 31 Jan 2022 18:03:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Message-ID: <Yfgkdij1x2gSTdXt@redhat.com>
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
 <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 02:56:38PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Mon, Jan 31, 2022 at 6:08 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > CC'ing  Babu Moger who aded the Milan CPU model.
> >
> > On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote:
> > > While trying to bring a VM with EPYC-Milan cpu on a host with
> > > EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> > >
> > > qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
> > > qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]
> > >
> > > Even with this warning, the host goes up.
> > >
> > > Then, grep'ing cpuid output on both guest and host, outputs:
> > >
> > > extended feature flags (7):
> > >       enhanced REP MOVSB/STOSB                 = false
> > >       fast short REP MOV                       = false
> > >       (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
> > >    brand = "AMD EPYC 7313 16-Core Processor               "
> > >
> > > This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
> > > not have the above feature bits set, which is usually not a good idea for
> > > live migration:
> > > Migrating from a host with these features to a host without them can
> > > be troublesome for the guest.
> > >
> > > Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
> > > avoid possible after-migration guest issues.
> >
> > Babu,  can you give some insight into availability of erms / fsrm
> > features across the EPYC 3rd gen CPU line. Is this example missing
> > erms/fsrm an exception, or common place ?
> >
> > >
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >
> > > Does this make sense? Or maybe I am missing something here.
> > >
> > > Having a kvm guest running with a feature bit, while the host
> > > does not support it seems to cause a possible break the guest.
> >
> > The guest won't see the feature bit - that warning message from QEMU
> > is telling you that it did't honour the request to expose
> > erms / fsrm - it has dropped them from the CPUO exposed to the guest.
> 
> Exactly.
> What I meant here is:
> 1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
> thus have those bits enabled)
> 2 - Guest is migrated to a host such as the above, which does not
> support those features (bits disabled), but does support EPYC-Milan
> cpus (without those features).
> 3 - The migration should be allowed, given the same cpu types. Then
> either we have:
> 3a : The guest vcpu stays with the flag enabled (case I tried to
> explain above), possibly crashing if the new feature is used, or
> 3b: The guest vcpu disables the flag due to incompatibility,  which
> may make the guest confuse due to cpu change, and even end up trying
> to use the new feature on the guest, even if it's disabled.

Neither should happen with a correctly written mgmt app in charge.

When launching a QEMU process for an incoming migration, it is expected
that the mgmt app has first queried QEMU on the source to get the precise
CPU model + flags that were added/removed on the source. The QEMU on
the target is then launched with this exact set of flags, and the
'check' flag is also set for -cpu. That will cause QEMU on the target
to refuse to start unless it can give the guest the 100% identical
CPUID to what has been requested on the CLI, and thus matching the
source.

Libvirt will ensure all this is done correctly. If not using libvirt
then you've got a bunch of work to do to achieve this. It certainly
isn't sufficient to merely use the same plain '-cpu' arg that the
soruce was original booted with, unless you have 100% identical
hardware, microcode, and software on both hosts, or the target host
offers a superset of features.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


