Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C06AC435
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCIk-0001mo-1o; Mon, 06 Mar 2023 09:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZCId-0001jq-Ha
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZCIb-0002yq-Fi
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678114728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a93oAn60717NX8pmLmU53M4NQQZCFhxdTP7eNfQ6xsA=;
 b=WGIsaJ1jDmUej8o/e/iZOXYT0aX8zMiNuOQ3rPSOfaJTx1kOLNnfXBLBZAwDToWP5HdAin
 X/fcflMQLk91cjBmbQ05PaLJi6mLpPTXPsMMxltpyKC+0nIWbvC8w+Tp8hFmPuR+4smdAq
 4zaNJDA6ZV0CuIhYc7kCozGb2bESw64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-MPXax0aiPU--pOq_go1idA-1; Mon, 06 Mar 2023 09:58:45 -0500
X-MC-Unique: MPXax0aiPU--pOq_go1idA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82EC7811E6E;
 Mon,  6 Mar 2023 14:58:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2962026D4B;
 Mon,  6 Mar 2023 14:58:38 +0000 (UTC)
Date: Mon, 6 Mar 2023 14:58:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, qemu-arm@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZAX/lqu0Duuxfy/E@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
 <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
 <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
 <ZAX36kyxT2aEg4DF@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAX36kyxT2aEg4DF@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 06, 2023 at 02:25:46PM +0000, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 03:18:23PM +0100, Thomas Huth wrote:
> > On 06/03/2023 15.06, Daniel P. Berrangé wrote:
> > > On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
> > > > On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> > > > > On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> > > > > > [...] If a 32-bit CPU guest
> > > > > > +environment should be enforced, you can switch off the "long mode" CPU
> > > > > > +flag, e.g. with ``-cpu max,lm=off``.
> > > > > 
> > > > > I had the idea to check this today and this is not quite sufficient,
> > > > [...]
> > > > > A further difference is that qemy-system-i686 does not appear to enable
> > > > > the 'syscall' flag, but I've not figured out where that difference is
> > > > > coming from in the code.
> > > > 
> > > > I think I just spotted this by accident in target/i386/cpu.c
> > > > around line 637:
> > > > 
> > > > #ifdef TARGET_X86_64
> > > > #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
> > > > #else
> > > > #define TCG_EXT2_X86_64_FEATURES 0
> > > > #endif
> > > 
> > > Hmm, so right now the difference between qemu-system-i386 and
> > > qemu-system-x86_64 is based on compile time conditionals. So we
> > > have the burden of building everything twice and also a burden
> > > of testing everything twice.
> > > 
> > > If we eliminate qemu-system-i386 we get rid of our own burden,
> > > but users/mgmt apps need to adapt to force qemu-system-x86_64
> > > to present a 32-bit system.
> > > 
> > > What about if we had qemu-system-i386 be a hardlink to
> > > qemu-system-x86_64, and then changed behaviour based off the
> > > executed binary name ?
> > 
> > We could also simply provide a shell script that runs:
> > 
> >  qemu-system-x86_64 -cpu qemu32 $*
> > 
> > ... that'd sounds like the simplest solution to me.
> 
> That woudn't do the right thing if the user ran 'qemu-system-i386 -cpu max'
> because their '-cpu max' would override the -cpu arg in the shell script
> that forced 32-bit mode.

It would also fail to work with SELinux, because policy restrictions
doesn't allow for an intermediate wrapper script to exec binaries.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


